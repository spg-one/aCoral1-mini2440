/**
 * @file queue.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief lib库，aCoral队列结构体定义
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

#ifndef QUEUE_H_
#define QUEUE_H_
#include<list.h>
#include<core.h>

typedef struct {
	acoral_list_t head;
	void *data;
}acoral_queue_t;



#endif /* QUEUE_H_ */
