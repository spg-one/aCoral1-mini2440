/**
 * @file error.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层，aCoral错误号定义
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
#ifndef ACORAL_ERR_H
#define ACORAL_ERR_H
#define ACORAL_ERR_THREAD 20
#define ACORAL_ERR_THREAD_DELAY ACORAL_ERR_THREAD+1
#define ACORAL_ERR_THREAD_NO_STACK ACORAL_ERR_THREAD+2 ///<线程栈指针为空

/*return*/ // TODO 放到err.h里面
#define MST_ERR_NULL 0
#define MST_ERR_INTR 1
#define MST_ERR_TIMEOUT 2
#define MST_ERR_UNDEF 3
#define MSG_ERR_COUNT 4
#define MSGCTR_SUCCED 5
#define MSG_ERR_NULL 6
#endif
