/**
 * @file softdelay.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，软件延时，不使用定时器的定时函数
 * @version 1.0
 * @date 2022-07-07
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-07 <td>Standardized 
 *  </table>
 */
#include<type.h>
#include<thread.h>
#include<comm_thrd.h>
#include<hal.h>
#include<policy.h>
#include <int.h>

volatile acoral_u32 sample;
volatile acoral_u32 sample_per_1000ms;

/**
 * @brief 软件延时
 * 
 */
void delay(void){
	volatile acoral_32 tmp=0xfff;
	while(tmp-->0);
	sample++;
}

/**
 * @brief 软件中断初始化线程函数，测量标定值sample
 * 
 */
void delay_task(){
	sample=0;
	for(;;){
		delay();
	}
}

/**
 * @brief 用户API，软件中断接口
 * 
 * @param n_1000ms 延时时间，单位1000ms
 */
void acoral_soft_delay(acoral_u32 n_1000ms){
	acoral_u32 i;
	acoral_u32 tmp=n_1000ms*sample_per_1000ms;	
	for(i=0;i<tmp;i++)
		delay();
}

/**
 * @brief 软件延时初始化
 * @note 创建delay_task线程后，让它自己跑1000毫秒，看这1000毫秒它能让sample加到多少。后面要延时就通过sample来标定。
 * 
 */
void soft_delay_init(void){
	acoral_sr cpu_sr;
	acoral_comm_policy_data_t data;
	acoral_thread_t *thread;
	acoral_id tmp_id;
	data.prio=ACORAL_TMP_PRIO;
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
	tmp_id=acoral_create_thread(delay_task,256,NULL,"softdelay",NULL,ACORAL_SCHED_POLICY_COMM,&data);
	if(tmp_id==-1)
		return;
	acoral_delay_self(1000);
	acoral_u32 sample_per_1000ms = sample;
	/*这里daemo回收进程还没启动，不能使用acoral_kill_thread*/
	thread=(acoral_thread_t *)acoral_get_res_by_id(tmp_id);
	acoral_enter_critical();
	acoral_unrdy_thread(thread);
	acoral_release_thread((acoral_res_t *)thread);
	acoral_exit_critical();
}
