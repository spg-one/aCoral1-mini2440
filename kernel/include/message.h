/**
 * @file message.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，消息队列头文件
 * @version 1.0
 * @date 2022-07-28
 * @copyright Copyright (c) 2022
 * @revisionHistory
 *  <table>
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-28 <td>Standardized
 *  </table>
 */

/*--------------------*/
/*  增加函数申明，将定时调用改为timeout */
/*  pegasus  0719*/
/*-------------------*/

#ifndef ACORAL_MESSAGE_H
#define ACORAL_MESSAGE_H
#include <type.h>
#include <queue.h>
#include <list.h>
#include <mem.h>
#include <event.h>
#include <thread.h>

#define ACORAL_MESSAGE_MAX_COUNT 10

#define MST_DEL_UNFORCE 0
#define MST_DEL_FORCE 1

///全局-用来串系统中所有的acoral_msgctr_t块，在中断函数中处理ttl和timeout，create acoral_msgctr_t 时加到该链表中
extern acoral_queue_t g_msgctr_header;

/**
 * @brief 消息容器结构体
 *
 */
typedef struct
{
	///消息容器也是资源
	acoral_res_t res;
	///消息容器名字
	acoral_8 *name;
	///全局消息列表
	acoral_list_t msgctr_list;
	///消息数量
	acoral_u32 count;
	///等待线程数
	acoral_u32 wait_thread_num;
	///等待线程指针链
	acoral_list_t waiting;
	///消息链指针，用于挂载消息
	acoral_list_t msglist;
} acoral_msgctr_t;

/**
 * @brief 消息结构体
 *
 */
typedef struct
{
	///消息也是一种资源
	acoral_res_t res;
	///消息链指针，用于挂载到消息容器
	acoral_list_t msglist;
	///消息标识
	acoral_u32 id;
	///消息被接收次数，每被接收一次减一,直到0为止
	acoral_u32 n;
	///消息最大生命周期  ticks计数
	acoral_u32 ttl;
	///消息指针
	void *data;
} acoral_msg_t;

/*function define*/
void acoral_msg_sys_init(void);
acoral_msgctr_t *acoral_alloc_msgctr(void);
acoral_msg_t *acoral_alloc_msg(void);
acoral_msgctr_t *acoral_msgctr_create(acoral_u32 *);
acoral_msg_t *acoral_msg_create(acoral_u32, acoral_u32 *, acoral_u32, acoral_u32, void *);
acoral_u32 acoral_msg_send(acoral_msgctr_t *, acoral_msg_t *);
void *acoral_msg_recv(acoral_msgctr_t *, acoral_u32, acoral_u32, acoral_u32 *);
acoral_u32 acoral_msgctr_del(acoral_msgctr_t *, acoral_u32);
acoral_u32 acoral_msg_del(acoral_msg_t *);
void acoral_print_all_msg(acoral_msgctr_t *);
void wake_up_thread(acoral_list_t *);

#endif
