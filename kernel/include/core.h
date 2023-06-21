/**
 * @file core.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，core.c对应的头文件
 * @version 1.0
 * @date 2022-07-23
 * @copyright Copyright (c) 2022
 * @revisionHistory
 *  <table>
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-23 <td>Standardized
 *  </table>
 */
#ifndef ACORAL_CORE_H
#define ACORAL_CORE_H
#include <autocfg.h>
#include <type.h>

///最多40个线程
#define ACORAL_MAX_THREAD CFG_MAX_THREAD
///线程最小拥有1024字节的栈
#define ACORAL_MIN_STACK_SIZE CFG_MIN_STACK_SIZE
///41。总共有40个线程，就有0~40共41个优先级
#define ACORAL_MAX_PRIO_NUM ((CFG_MAX_THREAD + 1) & 0xff)
///aCoral最低优先级40
#define ACORAL_MINI_PRIO ACORAL_MAX_PRIO_NUM - 1
///init线程独有的最高优先级
#define ACORAL_INIT_PRIO 0
///除init线程外的最高优先级
#define ACORAL_MAX_PRIO 1
///aCoral每秒100次tick中断
#define ACORAL_TICKS_PER_SEC CFG_TICKS_PER_SEC

volatile extern acoral_u32 acoral_start_sched;
extern acoral_id daemon_id;
void acoral_module_init(void);
void acoral_init_call(void);
void acoral_thread_sys_init(void);
void acoral_start(void);
void acoral_core_cpu_start(void);
void acoral_start_os(void);
void acoral_sys_call(void);
void acoral_app_call(void);
#endif
