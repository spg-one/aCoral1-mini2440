/**
 * @file comm.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief lib库，公共库头文件
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
#ifndef ACORAL_COMM_H
#define ACORAL_COMM_H
#include<type.h>
typedef acoral_char * va_list;

#define _INTSIZEOF(n) \
((sizeof(n)+sizeof(acoral_32)-1)&~(sizeof(acoral_32) - 1) )

#define va_start(ap,v) ( ap = (va_list)&v + _INTSIZEOF(v) )

#define va_arg(ap,t) \
( *(t *)((ap += _INTSIZEOF(t)) - _INTSIZEOF(t)) )

#define va_end(ap) ( ap = (va_list)0 )

#define offsetof(TYPE, MEMBER) ((acoral_u32) &((TYPE *)0)->MEMBER)
#define container_of(ptr, type, member) ((type *)((acoral_8 *)ptr - offsetof(type,member)))
#endif

