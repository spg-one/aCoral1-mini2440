/**
 * @file hal.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，顶层头文件
 * @version 1.0
 * @copyright Copyright (c) 2022
 * @date 2022-06-24
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <th>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <th>王彬浩 <td> 2022-06-24 <td>Standardized 
 *  </table>
 */

#ifndef HAL_H_
#define HAL_H_
#include "autocfg.h"
#include "hal_comm.h"
/*这个是用户真正要移植的部分的头文件*/
#include "hal_port.h"
#include "hal_int.h"
#endif /* HAL_H_ */
