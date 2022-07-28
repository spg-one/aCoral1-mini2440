/**
 * @file event.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，aCoral事件相关头文件
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
#ifndef ACORAL_EVENT_H
#define ACORAL_EVENT_H
#include "mem.h"
#include "queue.h"

#define ACORAL_EVENT_MIN_NUM 0
#define ACORAL_EVENT_SEM ACORAL_EVENT_MIN_NUM+0 ///<信号量
#define ACORAL_EVENT_MUTEX ACORAL_EVENT_MIN_NUM+1 ///<互斥量

/**
 * @brief aCoral事件event结构体
 * 
 */
typedef struct {
	acoral_res_t         res; ///<event也是一种资源
  	acoral_u8            type; ///<类型，ACORAL_EVENT_SEM（信号量）或ACORAL_EVENT_MUTEX（互斥量）
	acoral_32           count; ///<当type是互斥量时：23~16位表示这个互斥量的优先级天花板。\这个值在互斥量被创建的时候就确定了且不会改变。15~8位表示这个互斥量已经被占用时，因为尝试申请互斥量而被阻塞的线程中最高的优先级。7~0位在互斥量没有被上锁时，为全1，表示互斥量可用；在被上锁，也就是被占用时，会被赋值为占用它的线程的原始优先级。之所以说是原始优先级，是因为占用线程在使用互斥量的过程中可能被提升优先级，那在释放互斥量之后就要恢复之前的优先级，那就是从count成员的7~0位取值。当type是信号量或消息队列时，自行探索。
	acoral_queue_t      wait_queue; ///<等待使用这个event的线程队列
	acoral_char            *name; ///<名字
	void                *data; ///<当event是mutex或Semaphore时，指向占用线程，当event是消息队列时，存放传递的消息
}acoral_evt_t;

void acoral_evt_sys_init(void);
void acoral_evt_pool_init(void);
acoral_evt_t *acoral_alloc_evt(void);
void acoral_evt_init(acoral_evt_t *evt);
bool acoral_evt_queue_empty(acoral_evt_t *evt);
#endif
