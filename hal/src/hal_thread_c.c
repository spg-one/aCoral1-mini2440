/**
 * @file hal_thread_c.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，线程硬件相关代码
 * @version 1.0
 * @date 2022-07-22
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-22 <td>Standardized 
 *  </table>
 */
#include<type.h>
#include <hal_thread.h>

/**
 * @brief 线程上下文初始化，用于线程被切换到cpu上运行后，替换之前的线程的上下文
 * 
 * @param stk 栈指针
 * @param route 线程运行函数指针
 * @param exit 线程退出函数指针
 * @param args 线程运行函数参数
 */
void hal_stack_init(acoral_u32 **stk,void (*route)(),void (*exit)(),void *args){
	hal_ctx_t *ctx=(hal_ctx_t *)*stk;	
	ctx--;
	ctx=(hal_ctx_t *)((acoral_u32 *)ctx+1);
	ctx->r0=(acoral_u32)args;
	ctx->r1=1;
	ctx->r2=2;
	ctx->r3=3;
	ctx->r4=4;
	ctx->r5=5;
	ctx->r6=6;
	ctx->r7=7;
	ctx->r8=8;
	ctx->r9=9;
	ctx->r10=10;
	ctx->r11=11;
	ctx->r12=12;
	ctx->lr=(acoral_u32)exit;
	ctx->pc=(acoral_u32)route;
	ctx->cpsr=0x0000001fL;
    *stk=(acoral_u32 *)ctx;
}
