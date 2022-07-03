/**
 * @file mem.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层,集合了伙伴系统和资源池系统初始化的两级内存管理系统
 * @version 1.0
 * @date 2022-07-04
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-04 <td>Standardized, add acoral_res_sys_init
 *  </table>
 */

#include <autocfg.h>
#include<type.h>
#include<hal.h>
#include<mem.h>
#include <resource.h>

/**
 * @brief 内存管理系统初始化
 * @note 初始化mmu;初始化两级内存管理系统，第一级为伙伴系统，第二级为资源池系统
 */
void acoral_mem_sys_init(){
  	HAL_MEM_INIT();	//mmu初始化
  	acoral_mem_init((acoral_u32)HAL_HEAP_START,(acoral_u32)HAL_HEAP_END);	//伙伴系统初始化
#ifdef CFG_MEM2
  	acoral_mem_init2(); //TODO what is this?
#endif
	acoral_res_sys_init();	//资源池系统初始化
}
