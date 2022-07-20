/**
 * @file hal_int.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，中断相关头文件
 * @version 1.0
 * @date 2022-07-17
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-17 <td>Standardized 
 *  </table>
 */
#ifndef HAL_INT_H
#define HAL_INT_H

#include <type.h>

void hal_intr_unmask(acoral_vector vector);
void hal_intr_mask(acoral_vector vector);
void hal_intr_ack(acoral_u32 vector);
void hal_intr_init();

//中断相关的硬件抽象接口
#define HAL_INTR_MIN      0
#define HAL_INTR_NUM	 50
#define HAL_INTR_MAX HAL_INTR_MIN+HAL_INTR_NUM-1
#define HAL_INTR_INIT()	hal_intr_init()

#endif