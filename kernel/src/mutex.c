#include <type.h>
#include <event.h>
#include <hal.h>
#include <thread.h>
#include <lsched.h>
#include <int.h>
#include <timer.h>
#include <print.h>
#include <mutex.h>
acoral_thread_t *acoral_evt_high_thread(acoral_evt_t *evt);
/*==============================
 *  The initialize of the mutex
 *       信号量初始化函数
 *==============================*/
acoral_u32 acoral_mutex_init(acoral_evt_t *evt, acoral_u8 prio)
{
	if ((acoral_evt_t*)0 == evt)
	{
		return MUTEX_ERR_NULL;
	}
	evt->count  = (prio << 8) | MUTEX_AVAI;
	evt->type = ACORAL_EVENT_MUTEX;
	evt->data = NULL;
	acoral_evt_init(evt);
	return MUTEX_SUCCED;
}

/*==============================
 *  The creation of the mutex
 *       信号量创建函数
 *==============================*/
acoral_evt_t *acoral_mutex_create(acoral_u8 prio, acoral_u32 *err)
{
	acoral_evt_t *evt;

	/* 是否大于最小优先线，和是否该优先级已占用*/
	evt = acoral_alloc_evt();      /* alloc a RAM for the event*/
	if (NULL == evt)
	{
		*err = MUTEX_ERR_NULL;
		return NULL;
	}
	evt->count  = (prio << 16) | MUTEX_AVAI | MUTEX_U_MASK;
	evt->type = ACORAL_EVENT_MUTEX;
	evt->data = NULL;
	acoral_evt_init(evt);
	return evt;
}

/*=============================
 *  The deletion of the mutex
 *      信号号删除函数
 *============================= */
acoral_u32 acoral_mutex_del(acoral_evt_t *evt, acoral_u32 opt)
{
	acoral_sr            cpu_sr;

	/* 参数检测 */
	if (NULL == evt)
	{
		return MUTEX_ERR_NULL; /*error*/
	}

	if ( ACORAL_EVENT_MUTEX != evt->type )
	{
		return MUTEX_ERR_TYPE; /*error*/
	}

	/* 是否有任务等待*/
	acoral_enter_critical();
	if (acoral_evt_queue_empty(evt))
	{
		/*无等待任务删除*/
		acoral_exit_critical();
		return MUTEX_SUCCED;
	}
	else
	{
		/*有等待任务*/
		acoral_exit_critical();
		return MUTEX_ERR_TASK_EXIST;
	}
}

/*=============================
 *  the appliation for mutex
 *      信号号申请操作
 *  	  非阻塞式
 *=============================*/
acoral_u32 acoral_mutex_trypend(acoral_evt_t *evt)
{
	acoral_sr        cpu_sr;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
		return MUTEX_ERR_INTR;
	
	cur=acoral_cur_thread;
	
	acoral_enter_critical();
	if (NULL== evt)
	{
		acoral_exit_critical();
		return MUTEX_ERR_NULL;
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
		evt->count |= cur->prio;
		evt->data = (void*)cur;
		acoral_exit_critical();
		return MUTEX_SUCCED;
	}

	acoral_exit_critical();
	return MUTEX_ERR_TIMEOUT;
}


/*=============================
 *  the appliation for mutex
 *      信号号申请操作
 *  优先级继承的优先级反转解决
 *=============================*/
acoral_u32 acoral_mutex_pend(acoral_evt_t *evt, acoral_time timeout)
{
	acoral_sr        cpu_sr;
	acoral_u8        highPrio;
	acoral_u8        ownerPrio;
	acoral_thread_t *thread;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
		return MUTEX_ERR_INTR;
	
	cur=acoral_cur_thread;
	
	acoral_enter_critical();
	if (NULL== evt)
	{
		acoral_exit_critical();
		return MUTEX_ERR_NULL;
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
		evt->count |= cur->prio;
		evt->data = (void*)cur;
		acoral_exit_critical();
		return MUTEX_SUCCED;
	}
	
	/* 互斥量已被占有*/
	highPrio = (acoral_u8)(evt->count >> 8);
	thread = (acoral_thread_t*)evt->data;

	/*有可能优先级反转，继承最高优先级*/
	if (thread->prio>cur->prio)
	{
		if(cur->prio<highPrio)
		{
			highPrio=cur->prio;
			evt->count &= ~MUTEX_U_MASK;
			evt->count |= highPrio << 8;
		}
		acoral_thread_change_prio(thread,highPrio);
	}
	/*不需要或不能提高优先级*/
	acoral_unrdy_thread(cur);
	acoral_evt_queue_add(evt,cur);
	if (timeout > 0)
	{
		/*加载到超时队列*/
		cur->delay = TIME_TO_TICKS(timeout);
		timeout_queue_add(cur);
	}
	acoral_exit_critical();
	acoral_sched();
	acoral_enter_critical();
	if(evt->data!=cur&&timeout>0&&cur->delay<=0){
		acoral_prints("Time Out Return\n");
		acoral_evt_queue_del(cur);
		acoral_exit_critical();
		return MUTEX_ERR_TIMEOUT;
	}

	//---------------
	// modify by pegasus 0804: timeout_queue_del [+]
	timeout_queue_del(cur);

	if(evt->data!=cur){
		acoral_prints("Err Ready Return\n");
		acoral_evt_queue_del(cur);
		acoral_exit_critical();
		return MUTEX_ERR_RDY;
	}
	
	return MUTEX_SUCCED;
}

/*=============================
 *  the appliation for mutex
 *      信号号申请操作
 *  优先级天花板的优先级反转解决
 *=============================*/
acoral_u32 acoral_mutex_pend2(acoral_evt_t *evt, acoral_time timeout)
{
	acoral_sr        cpu_sr;
	acoral_u8        highPrio;
	acoral_u8        ownerPrio;
	acoral_thread_t *thread;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
		return MUTEX_ERR_INTR;
	
	cur=acoral_cur_thread;
	
	acoral_enter_critical();
	if (NULL== evt)
	{
		acoral_exit_critical();
		return MUTEX_ERR_NULL;
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
		evt->count |= cur->prio;
		evt->data = (void*)cur;

		/*提升至天花板优先级*/
		cur->prio = (evt->count & MUTEX_CEILING_MASK)>> 16;
		acoral_exit_critical();
		return MUTEX_SUCCED;
	}
	
	/* 互斥量已被占有*/
	acoral_unrdy_thread(cur);
	acoral_evt_queue_add(evt,cur);
	if (timeout > 0)
	{
		/*加载到超时队列*/
		cur->delay = TIME_TO_TICKS(timeout);
		timeout_queue_add(cur);
	}
	acoral_exit_critical();

	/*触发调度*/
	acoral_sched();

	acoral_enter_critical();

	/*超时时间内未获得互斥量*/
	if(evt->data!=cur&&timeout>0&&cur->delay<=0){
		acoral_prints("Time Out Return\n");
		acoral_evt_queue_del(cur);
		acoral_exit_critical();
		return MUTEX_ERR_TIMEOUT;
	}

	/*超时时间内获得了互斥量*/
	timeout_queue_del(cur);

	if(evt->data!=cur){
		acoral_prints("Err Ready Return\n");
		acoral_evt_queue_del(cur);
		acoral_exit_critical();
		return MUTEX_ERR_RDY;
	}
	
	return MUTEX_SUCCED;
}

/*============================
 *  post a mutex to thread
 *     信号量的释放
 *===========================*/
acoral_u32 acoral_mutex_post(acoral_evt_t *evt)
{
	acoral_sr             cpu_sr;
	acoral_u8             ownerPrio;
	acoral_u8             highPrio;
	acoral_thread_t      *thread;
	acoral_thread_t      *cur;

	acoral_enter_critical();

	if ( NULL == evt )
	{
		acoral_printerr("mutex NULL\n");
		acoral_exit_critical();
		return MUTEX_ERR_NULL;   /*error*/
	}
	
	highPrio  = (acoral_u8)(evt->count >> 8);
	ownerPrio = (acoral_u8)(evt->count & MUTEX_L_MASK);
	cur=acoral_cur_thread;
	if (highPrio!=0&&cur->prio != highPrio && cur->prio != ownerPrio )
	{
		acoral_printerr("mutex prio err\n");
		acoral_exit_critical();
		return MUTEX_ERR_UNDEF;
	}
	cur->evt=NULL;	
	if (cur->prio != ownerPrio)
	{
		/* 提升过优先级，进行优先级复原*/
		acoral_change_prio_self(ownerPrio);
	}
    
	thread =acoral_evt_high_thread(evt);
	if (thread==NULL){
			evt->count |= MUTEX_AVAI;
			evt->data = NULL;
			acoral_exit_critical();
			return MUTEX_SUCCED;
	}
	timeout_queue_del(thread);
	acoral_evt_queue_del(thread);
	evt->count &= MUTEX_U_MASK;
	evt->count |= thread->prio;
	evt->data = thread;
	acoral_rdy_thread(thread);
	acoral_exit_critical();
	acoral_sched();
	return MUTEX_SUCCED;
}
