/**
 * @file period_thrd.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，周期策略头文件
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
#ifndef PERIOD_THRD_H
#define PERIOD_THRD_H
#include<type.h>
#include<thread.h>

/**
 * @brief 周期策略数据块
 * 
 */
typedef struct{ //TODO 和下面的结构体冲突了？
	acoral_u8 prio; //线程优先级
	acoral_8 prio_type; //线程优先级类型，包括绝对、相对等
	acoral_time time; //线程周期，单位为毫秒
}acoral_period_policy_data_t;

/**
 * @brief 周期线程数据块
 * 
 */
typedef struct{
	acoral_time time; //线程周期，单位为毫秒
	void (*route)(void *args); //线程函数
	void *args; //线程函数的参数
}period_policy_data_t;

void period_thread_exit(void);
void period_thread_delay(acoral_thread_t* thread,acoral_time time);
void period_delay_deal(void);
acoral_id period_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data);
#endif
