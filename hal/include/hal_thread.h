/**
 * @file hal_thread.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，线程相关头文件
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

#ifndef HAL_THREAD_H
#define HAL_THREAD_H

typedef struct {
  	acoral_u32 cpsr;
	acoral_u32 r0;
	acoral_u32 r1;
	acoral_u32 r2;
	acoral_u32 r3;
	acoral_u32 r4;
	acoral_u32 r5;
	acoral_u32 r6;
	acoral_u32 r7;
	acoral_u32 r8;
	acoral_u32 r9;
	acoral_u32 r10;
	acoral_u32 r11;
	acoral_u32 r12;
	acoral_u32 lr;
	acoral_u32 pc;
}hal_ctx_t;

void hal_stack_init(acoral_u32 **stk,void (*route)(),void (*exit)(),void *args);

//线程相关的硬件抽象接口 //TODO 全大写为了和汇编接口统一 头文件里面注释///
#define HAL_STACK_INIT(stack,route,exit,args) hal_stack_init(stack,route,exit,args)

#endif