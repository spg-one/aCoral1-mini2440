/**
 * @file sched.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，aCoral调度相关函数
 * @version 1.0
 * @date 2022-07-28
 * @copyright Copyright (c) 2022
 * @revisionHistory
 *  <table>
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-28 <td>Standardized
 *  </table>
 */
#include <type.h>
#include <hal.h>
#include <thread.h>
#include <int.h>
#include <lsched.h>
#include <queue.h>
#include <list.h>
#include <bitops.h>

acoral_u8 acoral_need_sched; ///< aCoral是否需要调度标志，仅当aCoral就绪队列acoral_ready_queues有线程加入或被取下时，该标志被置为true；仅当aCoral在调度线程时，该标志位被置为false
acoral_u8 sched_lock = 1;	 ///< aCoral初始化完成之前，调度都是被上锁的，即不允许调度。
acoral_thread_t *running_thread, *ready_thread;

static acoral_rdy_queue_t acoral_ready_queues;
/* 之前是static acoral_rdy_queue_t acoral_ready_queues[HAL_MAX_CPU],*/
/*改成static acoral_rdy_queue_t* acoral_ready_queues 后，由于static存在，会把这个指针变量初始化为0，*/
/*后面初始化就绪队列的操作就会修改0地址的异常向量表，导致时钟中断被打开后，无法正常进入中断服务*/
/*很恐怖的bug！！谨此记录*/

void acoral_prio_queue_add(acoral_rdy_queue_t *array, acoral_u8 prio, acoral_list_t *list)
{
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num++;
	queue = array->queue + prio;
	head = &queue->head;
	acoral_list_add2_tail(list, head);
	acoral_set_bit(prio, array->bitmap);
}

void acoral_prio_queue_del(acoral_rdy_queue_t *array, acoral_u8 prio, acoral_list_t *list)
{
	acoral_queue_t *queue;
	acoral_list_t *head;
	queue = array->queue + prio;
	head = &queue->head;
	array->num--;
	acoral_list_del(list);
	if (acoral_list_empty(head))
		acoral_clear_bit(prio, array->bitmap);
}

acoral_u32 acoral_get_highprio(acoral_rdy_queue_t *array)
{
	return acoral_find_first_bit(array->bitmap, PRIO_BITMAP_SIZE);
}

void acoral_prio_queue_init(acoral_rdy_queue_t *array)
{
	acoral_u8 i;
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num = 0;
	for (i = 0; i < PRIO_BITMAP_SIZE; i++)
		array->bitmap[i] = 0;
	for (i = 0; i < ACORAL_MAX_PRIO_NUM; i++)
	{
		queue = array->queue + i;
		head = &queue->head;
		acoral_init_list(head);
	}
}

void acoral_sched_init()
{
	acoral_u8 i;
	sched_lock = 0;
	acoral_set_need_sched(false);
}

void acoral_set_orig_thread(acoral_thread_t *thread)
{
	running_thread = thread;
}

void acoral_set_running_thread(acoral_thread_t *thread)
{
	running_thread->state &= ~ACORAL_THREAD_STATE_RUNNING;
	thread->state |= ACORAL_THREAD_STATE_RUNNING;
	running_thread = thread;
}

/*================================
 * func: init acoral_ready_queues
 *    初始化各个核上的就绪队列
 *================================*/
void acoral_thread_runqueue_init()
{
	acoral_rdy_queue_t *rdy_queue;
	/*初始化每个核上的优先级队列*/
	rdy_queue = &acoral_ready_queues;
	acoral_prio_queue_init(rdy_queue);
}

/*================================
 * func: add thread to acoral_ready_queues
 *    将线程挂到就绪队列上
 *================================*/
void acoral_rdyqueue_add(acoral_thread_t *thread)
{
	acoral_rdy_queue_t *rdy_queue;
	rdy_queue = &acoral_ready_queues;
	acoral_prio_queue_add(rdy_queue, thread->prio, &thread->ready);
	thread->state &= ~ACORAL_THREAD_STATE_SUSPEND;
	thread->state |= ACORAL_THREAD_STATE_READY;
	acoral_set_need_sched(true);
}

/*================================
 * func: remove thread from acoral_ready_queues
 *    将线程从就绪队列上取下
 *================================*/
void acoral_rdyqueue_del(acoral_thread_t *thread)
{
	acoral_rdy_queue_t *rdy_queue;
	rdy_queue = &acoral_ready_queues;
	acoral_prio_queue_del(rdy_queue, thread->prio, &thread->ready);
	thread->state &= ~ACORAL_THREAD_STATE_READY;
	thread->state &= ~ACORAL_THREAD_STATE_RUNNING;
	thread->state |= ACORAL_THREAD_STATE_SUSPEND;
	/*设置线程所在的核可调度*/
	acoral_set_need_sched(true);
}

/*================================
 * func: sched thread in acoral
 *         调度线程
 *================================*/
void acoral_sched()
{
	/*如果不需要调度，则返回*/
	if (!acoral_need_sched)
		return;

	if (acoral_intr_nesting)
		return;

	if (acoral_sched_is_lock)
		return;
	/*如果还没有开始调度，则返回*/
	if (!acoral_start_sched)
		return;
	/*这个函数进行简单处理后会直接或间接调用acoral_real_sched,或者acoral_real_intr_sched*/
	HAL_SCHED_BRIDGE();
	return;
}

/*================================
 * func: sched thread in acoral
 *        进程上下文调度实现
 *        这个函数必须是原子操作
 *================================*/
void acoral_real_sched()
{
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
	prev = acoral_cur_thread;
	/*选择最高优先级线程*/
	acoral_select_thread();
	next = acoral_ready_thread;
	if (prev != next)
	{
		acoral_set_running_thread(next);
		if (prev->state == ACORAL_THREAD_STATE_EXIT)
		{
			prev->state = ACORAL_THREAD_STATE_RELEASE;
			HAL_SWITCH_TO(&next->stack);
			return;
		}
		/*线程切换*/
		HAL_CONTEXT_SWITCH(&prev->stack, &next->stack);
	}
}

/*================================
 * func: sched thread in acoral
 *        中断上下文调度实现
 *        这个函数必须是原子操作
 *================================*/
void acoral_real_intr_sched()
{
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
	prev = acoral_cur_thread;
	/*选择最高优先级线程*/
	acoral_select_thread();
	next = acoral_ready_thread;
	if (prev != next)
	{
		acoral_set_running_thread(next);
		if (prev->state == ACORAL_THREAD_STATE_EXIT)
		{
			prev->state = ACORAL_THREAD_STATE_RELEASE;
			HAL_INTR_SWITCH_TO(&next->stack);
			return;
		}
		/*线程切换*/
		HAL_INTR_CTX_SWITCH(&prev->stack, &next->stack);
	}
}

/*================================
 * func: sched thread in acoral
 *     选择优先级最高的线程
 *================================*/
void acoral_select_thread()
{
	acoral_u32 index;
	acoral_rdy_queue_t *rdy_queue;
	acoral_list_t *head;
	acoral_thread_t *thread;
	acoral_queue_t *queue;
	rdy_queue = &acoral_ready_queues;
	/*找出就绪队列中优先级最高的线程的优先级*/
	index = acoral_get_highprio(rdy_queue);
	queue = rdy_queue->queue + index;
	head = &queue->head;
	thread = list_entry(head->next, acoral_thread_t, ready);
	acoral_set_ready_thread(thread);
}
