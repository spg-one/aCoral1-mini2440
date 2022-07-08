/**
 * @file lsched.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，aCoral调度机制头文件
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
#ifndef SCHED_H
#define SCHED_H
#include<type.h>
#include<thread.h>

extern acoral_u8 need_sched;
extern acoral_u8 sched_lock;
extern acoral_thread_t *running_thread,*ready_thread;
typedef struct{
	acoral_prio_array_t array;
}acoral_rdy_queue_t;

void acoral_sched_init(void);
#define acoral_sched_lock_state() (sched_lock)
#define acoral_sched_lock() (sched_lock=1)
void acoral_sched_unlock(void);
#define acoral_sched_state() (need_sched)
#define acoral_set_sched_state(val) (need_sched=(val))
#define acoral_get_running_thread() (running_thread)
#define acoral_get_cur_thread() (running_thread)
void acoral_set_running_thread(acoral_thread_t *thread);
#define acoral_get_ready_thread() (ready_thread)
#define acoral_set_ready_thread(thread) (ready_thread=(thread))

#define acoral_cur_thread acoral_get_cur_thread()
#define acoral_ready_thread acoral_get_ready_thread()
#define acoral_need_sched acoral_sched_state()
#define acoral_set_need_sched(val) acoral_set_sched_state(val)
#define acoral_sched_is_lock acoral_sched_lock_state()
void acoral_thread_runqueue_init(void);
void acoral_rdyqueue_add(acoral_thread_t *new);
void acoral_rdyqueue_del(acoral_thread_t *old);
void acoral_sched(void);
void acoral_select_thread(void);
#endif
