/**
 * @file type.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief aCoral常用类型定义头文件
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
#ifndef ACORAL_TYPE_H
#define ACORAL_TYPE_H
#define NULL (void *)0
#define false 0
#define true 1
#define FALSE 0
#define TRUE 1
typedef unsigned char acoral_u8;
typedef signed char acoral_8;
typedef char acoral_char;
typedef unsigned char acoral_bool;
typedef acoral_8 bool;
typedef unsigned short acoral_u16;
typedef signed short acoral_16;
typedef unsigned int acoral_u32;
typedef signed int acoral_32;
typedef unsigned long long acoral_u64;
typedef signed long long acoral_64;
typedef float acoral_fl;
typedef acoral_32  acoral_vector;
typedef acoral_u32  acoral_time;
typedef acoral_u32 acoral_adr;
typedef acoral_u32 acoral_err;
typedef acoral_u32 acoral_size;
typedef acoral_32 acoral_id;
typedef acoral_u32 *acoral_ptr;
#endif
