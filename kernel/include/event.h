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
#define ACORAL_EVENT_MIN_NUM 0
#define ACORAL_EVENT_SEM ACORAL_EVENT_MIN_NUM+0
#define ACORAL_EVENT_MUTEX ACORAL_EVENT_MIN_NUM+1
#define ACORAL_EVENT_WAIT ACORAL_EVENT_MIN_NUM+2
#define ACORAL_EVENT_MBOX ACORAL_EVENT_MIN_NUM+3
typedef struct {
	acoral_res_t         res;
  	acoral_u8            type;
	acoral_32           count;
	acoral_queue_t      wait_queue;
	acoral_char            *name;
	void                *data;
}acoral_evt_t;

void acoral_evt_sys_init(void);
void acoral_evt_pool_init(void);
acoral_evt_t *acoral_alloc_evt(void);
void acoral_evt_init(acoral_evt_t *evt);
bool acoral_evt_queue_empty(acoral_evt_t *evt);
#endif
