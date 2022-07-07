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
 * @brief 获取系统当前中断嵌套数
 * 
 * @return acoral_u32 中断嵌套数
 */
acoral_u32 hal_get_intr_nesting_comm(){
    return intr_nesting;
}

/**
 * @brief 减少系统当前中断嵌套数
 * 
 */
void hal_intr_nesting_dec_comm(){
    if(intr_nesting>0)
	intr_nesting--;
}

/**
 * @brief 增加系统当前中断嵌套数
 * 
 */
void hal_intr_nesting_inc_comm(){
    intr_nesting++;
}


/**
 * @brief 保证调度的原子性
 * 
 */
void hal_sched_bridge_comm(){
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
	acoral_real_sched();
	HAL_EXIT_CRITICAL();
}

/**
 * @brief 保证调度（中断引起）的原子性
 * 
 */
void hal_intr_exit_bridge_comm(){
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
	acoral_real_intr_sched();
	HAL_EXIT_CRITICAL();
}

/**
 * @brief 原子加法操作，加法过程中不会被打断
 * 
 * @param i 被加数
 * @param v v->val为加数
 */
void hal_atomic_add_comm(int i, acoral_atomic_t *v)
{
		acoral_sr sr;
		sr=HAL_INTR_DISABLE_SAVE();
		v->val=v->val+i;
		HAL_INTR_RESTORE(sr);
}

/**
 * @brief 原子加减法操作，减法过程中不会被打断
 * 
 * @param i 减数数
 * @param v v->val为被减数
 */
void hal_atomic_sub_comm(int i, acoral_atomic_t *v)
{
	acoral_sr sr;
	sr=HAL_INTR_DISABLE_SAVE();
	v->val=v->val-i;
	HAL_INTR_RESTORE(sr);
}

