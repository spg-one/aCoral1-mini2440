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
#define ACORAL_COMM_INTR 1
#define ACORAL_EXPERT_INTR 2
#define ACORAL_RT_INTR 3
typedef struct {
	acoral_u32 index;
	acoral_u8  state;
	acoral_u8  type;
	void (*isr)(acoral_vector);
	void (*enter)(acoral_vector);
	void (*exit)(acoral_vector);
	void (*mask)(acoral_vector);
	void (*unmask)(acoral_vector);
}acoral_intr_ctr_t;
#define acoral_intr_enable() HAL_INTR_ENABLE()
#define acoral_intr_disable() HAL_INTR_DISABLE()
#define acoral_intr_nesting HAL_GET_INTR_NESTING()
#define acoral_intr_nesting_inc() HAL_INTR_NESTING_INC()
#define acoral_intr_nesting_dec() HAL_INTR_NESTING_DEC()
#define acoral_enter_critical() HAL_ENTER_CRITICAL()
#define acoral_exit_critical() HAL_EXIT_CRITICAL()
void acoral_intr_init(void);
acoral_32 acoral_intr_attach(acoral_vector vector,void (*isr)(acoral_vector));
acoral_32 acoral_intr_detach(acoral_vector vector);
void acoral_intr_entry(acoral_vector vector);
void acoral_intr_unmask(acoral_vector vector);
void acoral_intr_mask(acoral_vector vector);
void acoral_default_isr(acoral_vector vector);
void acoral_intr_exit(void);
extern acoral_intr_ctr_t intr_table[];
#endif
