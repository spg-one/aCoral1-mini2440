/**
 * @file comm_thrd.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，普通（先来先服务线程）策略头文件
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
#include<type.h>
#include<queue.h>
#include<thread.h>
#include<lsched.h>
#include<print.h>
#include<hal.h>
#include<policy.h>
#include<comm_thrd.h>
#include <int.h>

///普通线程策略控制块
acoral_sched_policy_t comm_policy;

/**
 * @brief 创建普通线程
 * 
 * @param route 执行线程的函数名
 * @param stack_size 线程的堆栈空间
 * @param args 传进线程的参数
 * @param name 创建线程的名字
 * @param prio 创建线程的优先级
 * @return acoral_id 
 */

acoral_id create_comm_thread(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,acoral_u8 prio){
	acoral_comm_policy_data_t policy_ctrl;
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
	thread->stack_buttom=NULL;
        /*设置线程的优先级*/
	policy_ctrl.prio=prio;
	policy_ctrl.prio_type=ACORAL_BASE_PRIO;
	thread->policy=ACORAL_SCHED_POLICY_COMM;
	return comm_policy_thread_init(thread,route,args,&policy_ctrl);
}

/**
 * @brief 初始化普通线程的一些数据
 * 
 * @param thread 
 * @param route 
 * @param args 
 * @param data 
 * @return acoral_id 
 */
acoral_id comm_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
	acoral_sr cpu_sr;
	acoral_u32 prio;
	acoral_comm_policy_data_t *policy_data;
	policy_data=(acoral_comm_policy_data_t *)data;
	prio=policy_data->prio;
	if(policy_data->prio_type==ACORAL_BASE_PRIO){
		prio+=ACORAL_BASE_PRIO_MIN;
		if(prio>=ACORAL_BASE_PRIO_MAX)
			prio=ACORAL_BASE_PRIO_MAX-1;
	}
	thread->prio=prio;
	if(acoral_thread_init(thread,route,acoral_thread_exit,args)!=0){
		acoral_printerr("No thread stack:%s\n",thread->name);
		acoral_enter_critical();
		acoral_release_res((acoral_res_t *)thread);
		acoral_exit_critical();
		return -1;
	}
        /*将线程就绪，并重新调度*/
	acoral_resume_thread(thread);
	return thread->res.id;
}

/**
 * @brief 注册普通机制
 * @note 调用时机为系统初始化阶段
 */
void comm_policy_init(){
	comm_policy.type=ACORAL_SCHED_POLICY_COMM;	
	comm_policy.policy_thread_init=comm_policy_thread_init;	
	comm_policy.policy_thread_release=NULL;	
	comm_policy.delay_deal=NULL;	
	comm_policy.name="comm";	
	acoral_register_sched_policy(&comm_policy);
}
