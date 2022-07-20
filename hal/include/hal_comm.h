/**
 * @file hal_comm.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，中断部分通用接口声明 //TODO 放到int里面
 * @version 1.0
 * @date 2022-06-23
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <th>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <th>王彬浩 <td> 2022-06-23 <td>Standardized 
 *  </table>
 */

#ifndef HAL_COMM_H
#define HAL_COMM_H
#include<type.h>
typedef acoral_u32 acoral_sr; //TODO 放到type里面？
/// TODO 加///



/****************************                                                                                                                 
* the comm interrupt interface of hal     
*  hal层中断部分通用接口
*****************************/
#define HAL_START_OS(stack) HAL_SWITCH_TO(stack)
#define HAL_INTR_NESTING_INIT()   hal_intr_nesting_init_comm()
#define HAL_GET_INTR_NESTING()    hal_get_intr_nesting_comm()
#define HAL_INTR_NESTING_DEC()    hal_intr_nesting_dec_comm()
#define HAL_INTR_NESTING_INC()    hal_intr_nesting_inc_comm()
#define HAL_ENTER_CRITICAL()  (cpu_sr = HAL_INTR_DISABLE_SAVE())
#define HAL_EXIT_CRITICAL()  HAL_INTR_RESTORE(cpu_sr)
#define HAL_INTR_ATTACH(vecotr,isr)
#define HAL_SCHED_BRIDGE() hal_sched_bridge_comm()
#define HAL_INTR_EXIT_BRIDGE() hal_intr_exit_bridge_comm()


#define HAL_TRANSLATE_VECTOR(_vector_,_index_) \
	(_index_)=((_vector_)-HAL_INTR_MIN)

#endif
