#include<type.h>
#include<hal.h>
#include<thread.h>
#include<int.h>
#include<lsched.h>
acoral_u8 need_sched;
acoral_u8 sched_lock;
acoral_thread_t *running_thread,*ready_thread;

static acoral_rdy_queue_t acoral_ready_queues; 
/* 之前是static acoral_rdy_queue_t acoral_ready_queues[HAL_MAX_CPU],*/
/*改成static acoral_rdy_queue_t* acoral_ready_queues 后，由于static存在，会把这个指针变量初始化为0，*/
/*后面初始化就绪队列的操作就会修改0地址的异常向量表，导致时钟中断被打开后，无法正常进入中断服务*/
/*很恐怖的bug！！谨此记录*/

void acoral_sched_init(){
	acoral_u8 i;
	sched_lock=0;
	need_sched=0;
}

void acoral_sched_unlock(){
	sched_lock=0;	
	acoral_sched();
}

void acoral_set_orig_thread(acoral_thread_t *thread){
  	running_thread=thread;
}

void acoral_set_running_thread(acoral_thread_t *thread){
  	running_thread->state&=~ACORAL_THREAD_STATE_RUNNING;
	thread->state|=ACORAL_THREAD_STATE_RUNNING;
  	running_thread=thread;
}

/*================================
 * func: init acoral_ready_queues 
 *    初始化各个核上的就绪队列 
 *================================*/
void acoral_thread_runqueue_init(){
	acoral_prio_array_t *array;
	acoral_rdy_queue_t *rdy_queue;
	/*初始化每个核上的优先级队列*/
	rdy_queue=&acoral_ready_queues;
	array=&rdy_queue->array;
	acoral_prio_queue_init(array);
}



/*================================
 * func: add thread to acoral_ready_queues
 *    将线程挂到就绪队列上
 *================================*/
void acoral_rdyqueue_add(acoral_thread_t *thread){
	acoral_rdy_queue_t *rdy_queue;
	rdy_queue=&acoral_ready_queues;
	acoral_prio_queue_add(&rdy_queue->array,thread->prio,&thread->ready);
	thread->state&=~ACORAL_THREAD_STATE_SUSPEND;
	thread->state|=ACORAL_THREAD_STATE_READY;
	acoral_set_need_sched(true);
}

/*================================
 * func: remove thread from acoral_ready_queues 
 *    将线程从就绪队列上取下
 *================================*/
void acoral_rdyqueue_del(acoral_thread_t *thread){
	acoral_rdy_queue_t *rdy_queue;
	rdy_queue=&acoral_ready_queues;
        acoral_prio_queue_del(&rdy_queue->array,thread->prio,&thread->ready);
	thread->state&=~ACORAL_THREAD_STATE_READY;
	thread->state&=~ACORAL_THREAD_STATE_RUNNING;
	thread->state|=ACORAL_THREAD_STATE_SUSPEND;
	/*设置线程所在的核可调度*/
	acoral_set_need_sched(true);
}

/*================================
 * func: sched thread in acoral
 *         调度线程
 *================================*/
void acoral_sched(){
	/*如果不需要调度，则返回*/
	if(!acoral_need_sched)
		return;

	if(acoral_intr_nesting)
		return;

	if(acoral_sched_is_lock)
		return;
	/*如果还没有开始调度，则返回*/
	if(!acoral_start_sched)
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
void acoral_real_sched(){
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
	prev=acoral_cur_thread;
	/*选择最高优先级线程*/
	acoral_select_thread();
	next=acoral_ready_thread;
	if(prev!=next){
	    acoral_set_running_thread(next);
	    if(prev->state==ACORAL_THREAD_STATE_EXIT){
		  prev->state=ACORAL_THREAD_STATE_RELEASE;
  		  HAL_SWITCH_TO(&next->stack);
		  return;
	    }
	    /*线程切换*/
	    HAL_CONTEXT_SWITCH(&prev->stack,&next->stack);
	}
}

/*================================
 * func: sched thread in acoral
 *        中断上下文调度实现
 *        这个函数必须是原子操作
 *================================*/
void acoral_real_intr_sched(){
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
	prev=acoral_cur_thread;
	/*选择最高优先级线程*/
	acoral_select_thread();
	next=acoral_ready_thread;
	if(prev!=next){
	    acoral_set_running_thread(next);
	    if(prev->state==ACORAL_THREAD_STATE_EXIT){
		  prev->state=ACORAL_THREAD_STATE_RELEASE;
  		  HAL_INTR_SWITCH_TO(&next->stack);
		  return;
	    }
	    /*线程切换*/
	    HAL_INTR_CTX_SWITCH(&prev->stack,&next->stack);
	}
}

/*================================
 * func: sched thread in acoral
 *     选择优先级最高的线程
 *================================*/
void acoral_select_thread(){
	acoral_u32 index;
	acoral_rdy_queue_t *rdy_queue;
	acoral_prio_array_t *array;
	acoral_list_t *head;
	acoral_thread_t *thread;
	acoral_queue_t *queue;
	rdy_queue=&acoral_ready_queues;
	array=&rdy_queue->array;
	/*找出就绪队列中优先级最高的线程的优先级*/
	index = acoral_get_highprio(array);
	queue = array->queue + index;
	head=&queue->head;
	thread=list_entry(head->next, acoral_thread_t, ready);
	acoral_set_ready_thread(thread);
}
