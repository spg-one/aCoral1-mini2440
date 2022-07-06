/**
 * @file hal_comm.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，中断部分通用接口定义
 * @version 1.0
 * @date 2022-06-24
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-06-24 <td>Standardized 
 *  </table>
 */

#include<type.h>
#include<hal_comm.h>
#include<atomic.h>

acoral_u32 intr_nesting;

/**
 * @brief 中断嵌套初始化
 */
void hal_intr_nesting_init_comm(){
	acoral_u32 i;
	intr_nesting=0;
}

/**
 * @brief 获取当前CPU的中断嵌套数
 * 
 * @return acoral_u32 当前CPU的中断嵌套数
 */
acoral_u32 hal_get_intr_nesting_comm(){
    return intr_nesting;
}


/*===========================                                                                                                                 
*Decrise the nesting      
*减少当前CPU中断嵌套数
*===========================*/
void hal_intr_nesting_dec_comm(){
    if(intr_nesting>0)
	intr_nesting--;
}


/*===========================                                                                                                                 
*Incrise the nesting        
*增加中断嵌套数
*===========================*/
void hal_intr_nesting_inc_comm(){
    intr_nesting++;
}

void hal_sched_bridge_comm(){
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
	acoral_real_sched();
	HAL_EXIT_CRITICAL();
}

void hal_intr_exit_bridge_comm(){
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
	acoral_real_intr_sched();
	HAL_EXIT_CRITICAL();
}

void hal_atomic_add_comm(int i, acoral_atomic_t *v)
{
		acoral_sr sr;
		sr=HAL_INTR_DISABLE_SAVE();
		v->val=v->val+i;
		HAL_INTR_RESTORE(sr);
}

void hal_atomic_sub_comm(int i, acoral_atomic_t *v)
{
	acoral_sr sr;
	sr=HAL_INTR_DISABLE_SAVE();
	v->val=v->val-i;
	HAL_INTR_RESTORE(sr);
}

