/**
 * @file policy.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，线程调度策略头文件
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
#ifndef POLICY_H
#define POLICY_H
#include<type.h>
#include<list.h>
#include<thread.h>

#define ACORAL_SCHED_POLICY 20
#define ACORAL_SCHED_POLICY_COMM ACORAL_SCHED_POLICY+1
#define ACORAL_SCHED_POLICY_PERIOD ACORAL_SCHED_POLICY+2

/**
 * @brief 调度策略控制块
 * 
 */
typedef struct{
	acoral_list_t list; //用于把各个调度策略串到一个链表上，创建线程找策略的时候就去这个链表上，根据策略名找
	acoral_u8 type; //策略名
	acoral_id (*policy_thread_init)(acoral_thread_t *,void (*route)(void *args),void *,void *); //某种策略的初始化函数，用于线程创建时调用
	void (*policy_thread_release)(acoral_thread_t *); //某种策略的释放函数，用于消灭线程时调用
	void (*delay_deal)(void); //线程延时函数，用于例如周期、时间片等和时间相关的调度策略
	acoral_char *name; //策略的小名，没啥用
}acoral_sched_policy_t;

void acoral_policy_delay_deal(void);
void acoral_register_sched_policy(acoral_sched_policy_t *policy);
acoral_sched_policy_t *acoral_get_policy_ctrl(acoral_u8 type);
acoral_id acoral_policy_thread_init(acoral_u32 policy,acoral_thread_t *thread,void (*route)(void *args),void *args,void *data);
void acoral_sched_policy_init(void);
#endif
