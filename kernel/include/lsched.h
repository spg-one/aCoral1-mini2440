/**
 * @file lsched.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，aCoral调度机制头文件
 * @note 之所以要叫lsched.h，而不叫sched.h，是因为linux有一个头文件叫sched.h，怕重名会有问题
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

extern acoral_u8 acoral_need_sched; 
extern acoral_u8 sched_lock;
extern acoral_thread_t *running_thread,*ready_thread;

///就绪队列中的优先级位图的大小，目前等于2，算法就是优先级数目除以32向上取整
#define PRIO_BITMAP_SIZE ((ACORAL_MAX_PRIO_NUM+31)/32) 

/**
 * @brief aCoral就绪队列
 * 
 */
typedef struct{
	acoral_u32 num;								///<就绪的线程数
	acoral_u32 bitmap[PRIO_BITMAP_SIZE];		///<优先级位图，每一位对应一个优先级，为1表示这个优先级有就绪线程
	acoral_queue_t queue[ACORAL_MAX_PRIO_NUM];	///<每一个优先级都有独立的队列
}acoral_rdy_queue_t;

void acoral_sched_init(void);
#define acoral_sched_is_lock sched_lock
#define acoral_set_need_sched(val) (acoral_need_sched=(val))

#define acoral_cur_thread running_thread
void acoral_set_running_thread(acoral_thread_t *thread);
#define acoral_ready_thread ready_thread
#define acoral_set_ready_thread(thread) (ready_thread=(thread))

void acoral_thread_runqueue_init(void);
void acoral_rdyqueue_add(acoral_thread_t *new);
void acoral_rdyqueue_del(acoral_thread_t *old);
void acoral_sched(void);
void acoral_select_thread(void);
#endif
