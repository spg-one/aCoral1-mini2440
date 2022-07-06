/*---------------*/
/*  增加timeout队列 g_timeout_queue*/
/*  pegasus   0719*/
/*---------------*/
/*  增加acoral_timeout_queue_add 函数*/
/*  pegasus   0719*/
/*---------------*/

#include <hal.h>
#include <queue.h>
#include <print.h>
#include <policy.h>
#include <comm_thrd.h>
#include <timer.h>
#include <int.h>

acoral_queue_t time_delay_queue;
/*----------------*/
/*  延时处理队列timeout*/
/*  pegasus   0719*/
/*----------------*/
acoral_queue_t timeout_queue;
static acoral_u32 ticks;
void acoral_time_sys_init(){
  	acoral_init_list(&time_delay_queue.head);

	/*---------------*/
	/*  新增延时初始化 timeout_queue*/
	/*  pegasus   0719*/
	/*---------------*/
	acoral_init_list(&timeout_queue.head);
}


acoral_time acoral_get_ticks(){
	return ticks;
}

void acoral_set_ticks(acoral_time time){
  	ticks=time;
}

void acoral_ticks_init(){
  	ticks=0;                                      /*初始化滴答时钟计数器*/
	acoral_intr_attach(HAL_TICKS_INTR,acoral_ticks_entry);/*这个用于注册ticks的处理函数*/
	HAL_TICKS_INIT();                            /*这个主要用于将用于ticks的时钟初始化*/
	acoral_intr_unmask(HAL_TICKS_INTR);
	return;
}

void acoral_ticks_entry(acoral_vector vector){

        ticks++;
	//acoral_prints("In ticks isr\n");
	if(acoral_start_sched==true){
		time_delay_deal();
		acoral_policy_delay_deal();
		/*--------------------*/
		/* 超时链表处理函数*/
		/* pegasus  0719*/
		/*--------------------*/
		timeout_delay_deal();
	}
}

/*================================
 * func: add thread to  time_delay_queue 
 *    将线程挂到延时队列上
 *================================*/
void acoral_delayqueue_add(acoral_queue_t *queue, acoral_thread_t *new){
	acoral_sr cpu_sr;
	acoral_list_t   *tmp, *tmp1,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
	head=&queue->head;
	acoral_enter_critical();
	/*这里采用关ticks中断，不用关中断，是为了减少最大关中断时间，下面是个链表，时间不确定。*/
	/*这里可以看出，延时函数会有些误差，因为ticks中断可能被延迟*/
#ifndef CFG_TICKS_PRIVATE
	new->state|=ACORAL_THREAD_STATE_DELAY;
	tmp1=head;
	while(1){
		tmp=tmp1;
		delay2=delay;
		if(tmp->next!=head){
			tmp1=tmp->next;
			thread = list_entry (tmp1, acoral_thread_t, waiting);
			ACORAL_ASSERT(thread,"in delay queue add");
			delay  = delay - thread->delay;
			if (delay < 0){
				new->delay=delay2;
				thread->delay-=delay2;
				acoral_list_add(&new->waiting,tmp);
				acoral_unrdy_thread(new);
				break;
			}
			
		}else{
			new->delay=delay2;
			acoral_list_add(&new->waiting,tmp);
			acoral_unrdy_thread(new);
			break;
		}
		/*获取下一个成员锁*/
	}
#else
	new->state|=ACORAL_THREAD_STATE_DELAY;
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
		thread = list_entry (tmp, acoral_thread_t, waiting);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
	}
	new->delay = delay2;
	acoral_list_add(&new->waiting,tmp->prev);
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
		thread = list_entry(tmp, acoral_thread_t, waiting);
		thread->delay-=delay2;
	}
	acoral_unrdy_thread(new);
#endif
	acoral_exit_critical();
	acoral_sched();
	return;
}

void time_delay_deal(){
	acoral_list_t   *tmp,*tmp1,*head;
	acoral_thread_t *thread;
	head = &time_delay_queue.head;
	if(acoral_list_empty(head))
	  	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
	ACORAL_ASSERT(thread,"in time deal");
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
		thread=list_entry(tmp,acoral_thread_t,waiting);
		ACORAL_ASSERT(thread,"in time deal for");
		if(thread->delay>0)
		    break;
		/*防止add判断delay时取下thread*/

		tmp1=tmp->next;
		acoral_list_del(&thread->waiting);

		tmp=tmp1;
		thread->state&=~ACORAL_THREAD_STATE_DELAY;
		acoral_rdy_thread(thread);
	}
}

/*================================
 *  
 *    将线程挂到超时队列上
 *================================*/
void timeout_queue_add(acoral_thread_t *new)
{
	acoral_sr cpu_sr;
	acoral_list_t   *tmp, *tmp1,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
	head=&timeout_queue.head;
	acoral_enter_critical();
#ifndef CFG_TICKS_PRIVATE
	tmp1=head;
	while(1){
		tmp=tmp1;
		delay2=delay;
		if(tmp->next!=head){
			tmp1=tmp->next;
			thread = list_entry (tmp1, acoral_thread_t, timeout);
			delay  = delay - thread->delay;
			if (delay < 0){
				new->delay=delay2;
				thread->delay-=delay2;
				acoral_list_add(&new->timeout,tmp);
				break;
			}
			
		}else{
			new->delay=delay2;
			acoral_list_add(&new->timeout,tmp);
			break;
		}
	}
#else
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
		thread = list_entry (tmp, acoral_thread_t, timeout);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
	}
	new->delay = delay2;
	acoral_list_add(&new->timeout,tmp->prev);
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
		thread = list_entry(tmp, acoral_thread_t, timeout);
		thread->delay-=delay2;
	}
#endif

	acoral_exit_critical();
	return;
}

/*================================
 *  
 *    将线程超时队列删除
 *================================*/
void timeout_queue_del(acoral_thread_t *new)
{
	acoral_list_t  *p, *q;
	
	if (acoral_list_empty(&new->timeout))
		return;

	p = new->timeout.prev;
	q = &new->timeout;

	acoral_list_del(&new->timeout);

	return;
}



/*---------------------*/
/*  超时链表处理函数*/
/*   pegasus  0719*/
/*---------------------*/
void timeout_delay_deal()
{
	acoral_list_t *tmp, *tmp1, *head;
	acoral_thread_t  *thread;

	head = &timeout_queue.head;
	if(acoral_list_empty(head))
	{
	  	return;
	}

	thread=list_entry(head->next,acoral_thread_t,timeout);
	ACORAL_ASSERT(thread,"in timeout deal");
	if (thread->delay>0)
		thread->delay--;
	for(tmp=head->next;tmp!=head;)
	{
		thread=list_entry(tmp,acoral_thread_t,timeout);
		ACORAL_ASSERT(thread,"in timeout deal");
		if(thread->delay>0)
		    break;

		tmp1=tmp->next;
		acoral_list_del(&thread->timeout);

		tmp=tmp1;
		/*thread->state*/
		acoral_rdy_thread(thread);
	}
}
