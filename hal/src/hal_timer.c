/**
 * @file hal_timer.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，定时器硬件初始化代码
 * @version 1.0
 * @date 2022-07-17
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-17 <td>Standardized 
 *  </table>
 */
#include<type.h>
#include<core.h>
#include<hal_2440_cfg.h>
#include<hal_2440_c.h>
#include <hal_timer.h>

/****************************************
*****这个函数的作用是初始化滴答时钟数据**
****************相关数据*****************
*****************************************/
void hal_ticks_init(){
  	rTCON = rTCON & (~0xf) ;	/* clear manual update bit, stop Timer0*/
    rTCFG0 &= 0xFFFF00;
 	rTCFG0 |= 0xF9;				/* prescaler等于249*/
 	rTCFG1 &= ~0x0000F;   
 	rTCFG1 |= 0x2;			   /*divider等于8，则设置定时器4的时钟频率为25kHz*/

   	rTCNTB0 = PCLK /(8*(249+1)*ACORAL_TICKS_PER_SEC);
   	rTCON = rTCON & (~0xf) |0x02;              	/* updata*/
	rTCON = rTCON & (~0xf) |0x09; 			/* star*/
}
