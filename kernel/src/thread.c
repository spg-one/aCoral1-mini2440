/**
 * @file thread.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，线程机制相关函数
 * @version 1.0
 * @date 2022-07-08
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-08 <td>Standardized 
 *  </table>
 */

#include <type.h>
#include <hal.h>
#include <queue.h>
#include <lsched.h>
#include <error.h>
#include <timer.h>
#include <mem.h>
#include <print.h>
#include <thread.h>
#include <int.h>
#include <policy.h>

extern acoral_queue_t acoral_res_release_queue;
acoral_queue_t acoral_threads_queue;
acoral_pool_ctrl_t acoral_thread_pool_ctrl;

/**
 * @brief 创建一个线程
 * 
 * @param route 线程函数
 * @param stack_size 线程栈大小
 * @param args 线程函数参数
 * @param name 线程名字
 * @param stack 线程栈指针
 * @param sched_policy 线程调度策略
 * @param data 线程策略数据
 * @return acoral_id 返回线程id
 */
acoral_id create_thread_ext(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,void *stack,acoral_u32 sched_policy,void *data){
	acoral_thread_t *thread;
        /*分配tcb数据块*/
	thread=acoral_alloc_thread();
	if(NULL==thread){
		acoral_printerr("Alloc thread:%s fail\n",name);
		acoral_prints("No Mem Space or Beyond the max thread\n");
		return -1;
	}
	thread->name=name;
	stack_size=stack_size&(~3);
	thread->stack_size=stack_size;
	if(stack!=NULL)
		thread->stack_buttom=(acoral_u32 *)stack;
	else
		thread->stack_buttom=NULL;
	thread->policy=sched_policy;
	return acoral_policy_thread_init(sched_policy,thread,route,args,data);
}

/*================================
 * func: release thread in acoral
 *	
 *   thread     
 *    
 *================================*/
void acoral_release_thread1(acoral_thread_t *thread){
	acoral_list_t *head,*tmp;
	acoral_thread_t *daem;
	thread->state=ACORAL_THREAD_STATE_EXIT;
	head=&acoral_res_release_queue.head;
	tmp=head->prev;
	acoral_list_add2_tail(&thread->waiting,head);

	daem=(acoral_thread_t *)acoral_get_res_by_id(daemon_id);
	acoral_rdy_thread(daem);
}

/*================================
 * func: release thread in acoral
 *	
 *   thread     
 *================================*/
void acoral_release_thread(acoral_res_t *res){
	acoral_thread_t *thread;
	thread=(acoral_thread_t *)res;
	acoral_list_del(&thread->global_list);
	acoral_policy_thread_release(thread);
  	acoral_free((void *)thread->stack_buttom);
	acoral_release_res((acoral_res_t *)thread);
}


/*================================
 * func: suspend thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/

void acoral_suspend_thread(acoral_thread_t *thread){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
		return;

	acoral_enter_critical();
	/**/
	acoral_rdyqueue_del(thread);
	acoral_exit_critical();
	/**/
	acoral_sched();
}

/*================================
 * func: suspend thread in acoral
 *      	
 *================================*/
void acoral_suspend_self(){
	acoral_suspend_thread(acoral_cur_thread);
}

/*================================
 * func: suspend thread in acoral
 *      ID	
 *      thread_idID
 *================================*/

void acoral_suspend_thread_by_id(acoral_u32 thread_id){
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
	acoral_suspend_thread(thread);
}

/*================================
 * func: resume thread in acoral
 *         	
 *   thread_idID
 *================================*/

void acoral_resume_thread_by_id(acoral_u32 thread_id){
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
	acoral_resume_thread(thread);
}

/*================================
 * func: resume thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/
void acoral_resume_thread(acoral_thread_t *thread){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(thread->state&ACORAL_THREAD_STATE_SUSPEND))
		return;

	acoral_enter_critical();
	/**/
	acoral_rdyqueue_add(thread);
	acoral_exit_critical();
	/**/
	acoral_sched();
}

/*================================
 * func: delay thread in acoral
 *         	
 * thread(TCB) 	
 * timems	
 *      
 *================================*/
static void acoral_delay_thread(acoral_thread_t* thread,acoral_time time){
	acoral_u32 real_ticks;
	if(!acoral_list_empty(&thread->waiting)){
		return;	
	}

	/*timeticks*/
	/*real_ticks=time*ACORAL_TICKS_PER_SEC/1000;*/
	real_ticks = TIME_TO_TICKS(time);
	thread->delay=real_ticks;
	/**/
	acoral_delayqueue_add(&time_delay_queue,thread);
}

/*================================
 * func: delay thread in acoral
 *         	
 * thread_idID 	
 * timems	
 *      
 *================================*/
static void acoral_delay_thread_by_id(acoral_time time,acoral_id thread_id){
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
	acoral_delay_thread(thread,time);
}

/*================================
 * func: delay current thread in acoral
 *         	
 * timems	
 *================================*/
void acoral_delay_self(acoral_time time){
	acoral_delay_thread(acoral_cur_thread,time);
}

/*================================
 * func: kill thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/
void acoral_kill_thread(acoral_thread_t *thread){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	acoral_evt_t *evt;
	acoral_enter_critical();
        /*	*/
        /*	*/
	if(thread->state&ACORAL_THREAD_STATE_SUSPEND){
		evt=thread->evt;
		/**/
		if(thread->state&ACORAL_THREAD_STATE_DELAY){
			acoral_list_del(&thread->waiting);
		}else
		{
			/**/
			if(evt!=NULL){
				acoral_evt_queue_del(thread);
			}
		}
	}
	acoral_unrdy_thread(thread);
	acoral_release_thread1(thread);
    acoral_exit_critical();
	acoral_sched();
}

/*================================
 * func: kill thread in acoral
 *         	
 * thread_idID 	
 *================================*/
void acoral_kill_thread_by_id(acoral_id id){
	acoral_thread_t *thread;
	thread=(acoral_thread_t *)acoral_get_res_by_id(id);
	acoral_kill_thread(thread);
}

/*================================
 * func: kill current thread in acoral
 *         	
 *================================*/
void acoral_thread_exit(){
        acoral_kill_thread(acoral_cur_thread);
}

/*===========================
 *    change thread's prio
 *    
 *===========================*/
void acoral_thread_change_prio(acoral_thread_t* thread, acoral_u32 prio){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	acoral_enter_critical();
	if(thread->state&ACORAL_THREAD_STATE_READY){
		acoral_rdyqueue_del(thread);
		thread->prio = prio;
		acoral_rdyqueue_add(thread);
	}else
		thread->prio = prio;
	acoral_exit_critical();
}

/*===========================
 *    change current thread's prio
 *    
 *===========================*/
void acoral_change_prio_self(acoral_u32 prio){
	acoral_thread_change_prio(acoral_cur_thread, prio);
}

/*===========================
 *    change thread's prio
 *    ID
 *===========================*/
void acoral_thread_change_prio_by_id(acoral_u32 thread_id, acoral_u32 prio){
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
	acoral_thread_change_prio(thread, prio);
}

/*================================
 * func: ready thread in acoral
 *  ,
 * thread(TCB) 	
 *================================*/

void acoral_rdy_thread(acoral_thread_t *thread){
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_SUSPEND&thread->state))
		return;

	acoral_rdyqueue_add(thread);
}

/*================================
 * func: unready thread in acoral
 *     ,
 * thread(TCB) 	
 *
 *================================*/

void acoral_unrdy_thread(acoral_thread_t *thread){
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
		return;

	acoral_rdyqueue_del(thread);
}

void acoral_thread_move2_tail(acoral_thread_t *thread){
	acoral_8 cpu;
	acoral_sr cpu_sr;

	acoral_enter_critical();
	acoral_unrdy_thread(thread);
	acoral_rdy_thread(thread);
	acoral_exit_critical();
	acoral_sched();
}

void acoral_thread_move2_tail_by_id(acoral_id thread_id){
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
	acoral_thread_move2_tail(thread);
}


/*================================
 * func: alloc thread struct data in acoral
 *     TCB
 *================================*/
acoral_thread_t *acoral_alloc_thread(){
  	return (acoral_thread_t *)acoral_get_res(&acoral_thread_pool_ctrl);
}

/*================================
 * func: init thread in acoral
 *	
 * in:   (*route)   
 * in:   (*exit)   (acoral_thread_exit)
 *       stack_size 
 *       args       
 *       name       
 *================================*/
acoral_err acoral_thread_init(acoral_thread_t *thread,void (*route)(void *args),void (*exit)(void),void *args){
	acoral_sr cpu_sr;
	acoral_u32 stack_size=thread->stack_size;
	if(thread->stack_buttom==NULL){
		if(stack_size<ACORAL_MIN_STACK_SIZE)
			stack_size=ACORAL_MIN_STACK_SIZE;
		thread->stack_buttom=(acoral_u32 *)acoral_malloc(stack_size);
		if(thread->stack_buttom==NULL)
			return ACORAL_ERR_THREAD_NO_STACK;
		thread->stack_size=stack_size;
	}
	thread->stack=(acoral_u32 *)((acoral_8 *)thread->stack_buttom+stack_size-4);
	HAL_STACK_INIT(&thread->stack,route,exit,args);
	
	thread->data=NULL;
	thread->state=ACORAL_THREAD_STATE_SUSPEND;
	/*继承父线程的console_id*/
	thread->console_id=acoral_cur_thread->console_id;
	acoral_init_list(&thread->waiting);
	acoral_init_list(&thread->ready);
	acoral_init_list(&thread->timeout);
	acoral_init_list(&thread->global_list);

	acoral_enter_critical();
	acoral_list_add2_tail(&thread->global_list,&acoral_threads_queue.head);
	acoral_exit_critical();
	return 0;
}

/*================================
 *      init tcb pool
 *      
 *================================*/
void acoral_thread_pool_init(){
	acoral_thread_pool_ctrl.type=ACORAL_RES_THREAD;
	acoral_thread_pool_ctrl.size=sizeof(acoral_thread_t);
	if(CFG_MAX_THREAD>20)
		acoral_thread_pool_ctrl.num_per_pool=20;
	else
		acoral_thread_pool_ctrl.num_per_pool=CFG_MAX_THREAD;
	acoral_thread_pool_ctrl.max_pools=ACORAL_MAX_THREAD/acoral_thread_pool_ctrl.num_per_pool;
	acoral_pool_ctrl_init(&acoral_thread_pool_ctrl);
}

void acoral_set_thread_console(acoral_id id){
	acoral_cur_thread->console_id=id;	
}

void acoral_sched_mechanism_init(){
	acoral_thread_pool_init();
	acoral_thread_runqueue_init();
	acoral_init_list(&acoral_threads_queue.head);
}

/*================================
 *      init thread system 
 *       
 *================================*/
void acoral_thread_sys_init(){
	acoral_sched_mechanism_init();
	acoral_sched_policy_init();
}
