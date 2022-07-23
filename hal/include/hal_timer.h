/**
 * @file hal_timer.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，定时器相关头文件
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
#ifndef HAL_TIMER_H
#define HAL_TIMER_H

//ticks时钟相关的硬件抽象接口
#define HAL_TICKS_INTR 28 ///<时钟中断号，对应S3C2440定时器0的中断
#define	HAL_TICKS_INIT() hal_ticks_init()

#endif