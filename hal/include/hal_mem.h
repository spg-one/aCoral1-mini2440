/**
 * @file hal_mem.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，内存相关头文件
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
#ifndef HAL_MEM_H
#define HAL_MEM_H

extern acoral_u32 heap_start[]; ///>来自链接脚本 //TODO为什么数组？
extern acoral_u32 heap_end[]; ///>来自链接脚本

#define HAL_HEAP_START heap_start
#define HAL_HEAP_END heap_end
#define HAL_MEM_INIT() hal_mem_init()

void hal_mmu_setmtt(acoral_32 vaddrStart, acoral_32 vaddrEnd, acoral_32 paddrStart, acoral_32 attr);

#endif