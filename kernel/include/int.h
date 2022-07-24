/**
 * @file int.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，aCoral中断相关头文件
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
#ifndef ACORAL_INT_H
#define ACORAL_INT_H
#include"type.h"

//中断类型
#define ACORAL_COMM_INTR 1		///<普通中断，会自动调用acoral_intr_ctr_t中的enter成员清除中断，用户只需要关心isr就行
#define ACORAL_EXPERT_INTR 2	///<专家中断，不会调用enter成员，需要在isr中手动清除中断，如DM9000网卡
#define ACORAL_RT_INTR 3		///<实时中断，不知道是什么

/**
 * @brief 中断结构体
 * 
 */
typedef struct {
	acoral_u8  type;				///<上面三种中断类型
	void (*isr)(acoral_vector);		///<中断服务程序
	void (*enter)(acoral_vector);	///<中断服务程序执行之前执行的操作，aCroal中为hal_intr_ack函数
	void (*exit)(acoral_vector);	///<中断服务程序执行完成后的操作，比如置中断结束，目前aCoral中没有这个操作
	void (*mask)(acoral_vector);	///<除能中断操作
	void (*unmask)(acoral_vector);	///<使能中断操作
}acoral_intr_ctr_t;

#define acoral_intr_enable() HAL_INTR_ENABLE()
#define acoral_intr_disable() HAL_INTR_DISABLE()
#define acoral_intr_nesting HAL_GET_INTR_NESTING()
#define acoral_intr_nesting_inc() HAL_INTR_NESTING_INC()
#define acoral_intr_nesting_dec() HAL_INTR_NESTING_DEC()
#define acoral_enter_critical() HAL_ENTER_CRITICAL()
#define acoral_exit_critical() HAL_EXIT_CRITICAL()

acoral_32 acoral_intr_attach(acoral_vector vector,void (*isr)(acoral_vector));
acoral_32 acoral_intr_detach(acoral_vector vector);
void acoral_intr_entry(acoral_vector vector);
void acoral_intr_unmask(acoral_vector vector);
void acoral_intr_mask(acoral_vector vector);
void acoral_default_isr(acoral_vector vector);
void acoral_intr_exit(void);
extern acoral_intr_ctr_t intr_table[];
#endif
