/**
 * @file int.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，中断相关函数
 * @version 1.0
 * @date 2022-07-24
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-24 <td>Standardized 
 *  </table>
 */
#include <type.h>
#include <hal.h>
#include <lsched.h>
#include <print.h>
#include <int.h>
acoral_intr_ctr_t intr_table[HAL_INTR_NUM];

/**
 * @brief 中断初始化函数
 * 
 */
void acoral_intr_sys_init()
{
	acoral_u32 i;

	/*关中断*/
	acoral_intr_disable();

	/*中断嵌套标志初始化*/
	HAL_INTR_NESTING_INIT();

	/*中断底层初始化函数*/
	HAL_INTR_INIT();

	for (i = HAL_INTR_MIN; i <= HAL_INTR_MAX; i++)
	{
		acoral_set_intr_enter(i, hal_intr_ack);
		acoral_set_intr_exit(i, NULL);
		acoral_set_intr_mask(i, hal_intr_mask);
		acoral_set_intr_unmask(i, hal_intr_unmask);
	}

	/*对于每个中断，设置默认的服务处理程序，然后屏蔽该中断*/
	for (i = HAL_INTR_MIN; i <= HAL_INTR_MAX; i++)
	{
		intr_table[i].isr = acoral_default_isr;
		intr_table[i].type = ACORAL_COMM_INTR;
		acoral_intr_mask(i);
	}
}

/**
 * @brief 将服务函数isr绑定到中断向量Vector
 * 
 * @param vector 中断向量号
 * @param isr 中断服务程序指针
 * @return acoral_32 返回0表示成功
 */
acoral_32 acoral_intr_attach(acoral_vector vector, void (*isr)(acoral_vector))
{
	if (intr_table[vector].type != ACORAL_RT_INTR) //实时中断是什么？
		intr_table[vector].isr = isr;
	else
		HAL_INTR_ATTACH(vector, isr);
	return 0;
}

/**
 * @brief 将中断的服务函数设为默认的
 * 
 * @param vector 中断向量号
 * @return acoral_32 返回0表示成功
 */
acoral_32 acoral_intr_detach(acoral_vector vector)
{
	intr_table[vector].isr = acoral_default_isr;
	return 0;
}

/**
 * @brief 使能中断
 * 
 * @param vector 中断向量号
 */
void acoral_intr_unmask(acoral_vector vector)
{
	if (vector > HAL_INTR_MAX)
	{
		return;
	}

	/*如果中断的使能函数不为空，就调用该使能函数*/
	if (intr_table[vector].unmask != NULL && intr_table[vector].type == ACORAL_COMM_INTR)
	{
		intr_table[vector].unmask(vector);
	}
}

/**
 * @brief 除能中断
 * 
 * @param vector 中断向量号
 */
void acoral_intr_mask(acoral_vector vector)
{
	if (vector > HAL_INTR_MAX)
	{
		return;
	}

	/*如果中断的除能函数不为空，就调用该除能函数 */
	if (intr_table[vector].mask != NULL && intr_table[vector].type == ACORAL_COMM_INTR)
	{
		intr_table[vector].mask(vector);
	}
}

/**
 * @brief 中断公共服务入口函数
 * 
 * @param vector 中断向量号
 */
void acoral_intr_entry(acoral_vector vector)
{ // TODO或者把这个弱定义了
	acoral_intr_nesting_inc();
	if (intr_table[vector].type == ACORAL_EXPERT_INTR)
	{
		intr_table[vector].isr(vector);
		acoral_intr_disable();
	}
	else
	{
		/*这个之前都要是关中断的，调用中断进入函数*/
		if (intr_table[vector].enter != NULL)
			intr_table[vector].enter(vector);

		acoral_intr_mask(vector);
		/*开中断*/
		acoral_intr_enable();

		/*调用该中断的服务处理函数*/
		intr_table[vector].isr(vector);

		/*关中断*/
		acoral_intr_disable();

		acoral_intr_unmask(vector);
		/*调用中断退出函数*/
		if (intr_table[vector].exit != NULL)
			intr_table[vector].exit(vector);
	}
	acoral_intr_nesting_dec();
	acoral_intr_exit();
}

/**
 * @brief aCoral默认中断处理程序
 * 
 * @param vector 中断向量号 
 */
void acoral_default_isr(acoral_vector vector)
{
	acoral_printdbg("in Default interrupt route\n");
}

/**
 * @brief 中断退出函数
 * 
 */
void acoral_intr_exit()
{
	if (!acoral_need_sched)
		return;

	if (acoral_intr_nesting)
		return;

	if (acoral_sched_is_lock)
		return;

	if (!acoral_start_sched)
		return;

	/*如果需要调度，则调用此函数*/
	HAL_INTR_EXIT_BRIDGE();
}

/**
 * @brief 设置中断进入函数
 * 
 * @param vector 中断向量号
 * @param enter 中断进入函数，aCoral中为hal_intr_ack
 */
void acoral_set_intr_enter(acoral_vector vector, void (*enter)(acoral_vector))
{
	intr_table[vector].enter = enter;
}

/**
 * @brief 设置中断退出函数
 * 
 * @param vector 中断向量号
 * @param exit 中断退出函数，aCoral中为空
 */
void acoral_set_intr_exit(acoral_vector vector, void (*exit)(acoral_vector))
{
	intr_table[vector].exit = exit;
}

/**
 * @brief 设置中断屏蔽函数
 * 
 * @param vector 中断向量号
 * @param mask 中断屏蔽函数，aCoral中为hal_intr_mask
 */
void acoral_set_intr_mask(acoral_vector vector, void (*mask)(acoral_vector))
{
	intr_table[vector].mask = mask;
}

/**
 * @brief 设置中断使能函数
 * 
 * @param vector 中断向量号
 * @param unmask 中断使能函数，aCoral中为hal_intr_unmask
 */
void acoral_set_intr_unmask(acoral_vector vector, void (*unmask)(acoral_vector))
{
	intr_table[vector].unmask = unmask;
}

/**
 * @brief 设置中断类型，ACORAL_COMM_INTR、ACORAL_EXPERT_INTR或ACORAL_RT_INTR
 * 
 * @param vector 
 * @param type 
 */
void acoral_intr_set_type(acoral_vector vector, acoral_u8 type)
{
	intr_table[vector].type = type; //TODO type约束
}

/**
 * @brief 异常错误输出，aCoral除了中断异常以外的异常发生后，都会通过EXP_HANDLER进入这个函数打印异常信息
 * 
 * @param lr 链接寄存器，保存异常发生时的pc
 * @param stack 栈指针，保存发生异常时线程的栈
 */
void acoral_fault_entry(acoral_u32 lr, acoral_u32 *stack)
{
	acoral_intr_disable();
	if (!acoral_start_sched)
		while (1)
			;
	acoral_printerr("Exception occur\n");
	acoral_printerr("******************\n");
	acoral_printerr("Thread name:%s\n", acoral_cur_thread->name);
	acoral_printerr("Thread prio:%d\n", acoral_cur_thread->prio);
	acoral_printerr("Thread stack_size:%d\n", acoral_cur_thread->stack_size);
	acoral_printerr("Thread stack_buttom:0x%x\n", acoral_cur_thread->stack_buttom);
	acoral_printerr("Thread stack:0x%x\n", acoral_cur_thread->stack);
	acoral_printerr("Pc:0x%x\n", lr);
	acoral_printerr("Stack:0x%x\n", stack);
	acoral_printerr("******************\n");
	while (1)
		;
}
