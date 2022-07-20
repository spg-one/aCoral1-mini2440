/**
 * @file hal_2440_c.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，mini2440时钟、中断、定时器、GPIO相关寄存器地址
 * @version 1.0
 * @date 2022-06-23
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-06-23 <td>Standardized 
 *  </table>
 */

//TODO 或许可以和hal_2440_cfg.h合并 add.并不能合并，start.S用到了hal_2440_cfg.h这个文件，一旦合并，汇编器不能识别hal_2440_c.h的语法

#ifndef HAL_2440_C_H
#define HAL_2440_C_H
#include"type.h"
/*clock*/
#define rCLKCON     (*(volatile acoral_u32 *)0x4C00000C)	/*Interrupt request status*/
/* INTERRUPT*/
#define rSRCPND     (*(volatile acoral_u32 *)0x4a000000)	/*Interrupt request status*/
#define rINTMOD     (*(volatile acoral_u32 *)0x4a000004)	/*Interrupt mode control*/
#define rINTMSK     (*(volatile acoral_u32 *)0x4a000008)	/*Interrupt mask control*/
#define rPRIORITY   (*(volatile acoral_u32 *)0x4a00000c)	/*IRQ priority control*/
#define rINTPND     (*(volatile acoral_u32 *)0x4a000010)	/*Interrupt request status*/
#define rINTOFFSET  (*(volatile acoral_u32 *)0x4a000014)	/*Interruot request source offset*/
#define rSUBSRCPND  (*(volatile acoral_u32 *)0x4a000018)	/*Sub source pending*/
#define rINTSUBMSK  (*(volatile acoral_u32 *)0x4a00001c)	/*Interrupt sub mask*/

#define rEXTINT0   (*(volatile acoral_u32 *)0x56000088)	/*External interrupt control register 0*/
#define rEXTINT1   (*(volatile acoral_u32 *)0x5600008c)	/*External interrupt control register 1*/
#define rEXTINT2   (*(volatile acoral_u32 *)0x56000090)	/*External interrupt control register 2*/
#define rEINTMSK  (*(volatile acoral_u32 *)0x560000a4)	/*External interrupt mask*/
#define rEINTPND  (*(volatile acoral_u32 *)0x560000a8)	/*External interrupt pending*/

/* PWM TIMER*/
#define rTCFG0  (*(volatile acoral_u32 *)0x51000000)	/*Timer 0 configuration*/
#define rTCFG1  (*(volatile acoral_u32 *)0x51000004)	/*Timer 1 configuration*/
#define rTCON   (*(volatile acoral_u32 *)0x51000008)	/*Timer control*/
#define rTCNTB0 (*(volatile acoral_u32 *)0x5100000c)	/*Timer count buffer 0*/
#define rTCMPB0 (*(volatile acoral_u32 *)0x51000010)	/*Timer compare buffer 0*/
#define rTCNTO0 (*(volatile acoral_u32 *)0x51000014)	/*Timer count observation 0*/

/*I/O*/
#define rGPFCON    (*(volatile acoral_u32 *)0x56000050)	/*Port F control*/
#define rGPFDAT    (*(volatile acoral_u32 *)0x56000054)	/*Port F data*/
#define rGPFUP     (*(volatile acoral_u32 *)0x56000058)	/*Pull-up control F*/

#define rGPGCON    (*(volatile acoral_u32 *)0x56000060)	/*Port G control*/
#define rGPGDAT    (*(volatile acoral_u32 *)0x56000064)	/*Port G data*/
#define rGPGUP     (*(volatile acoral_u32 *)0x56000068)	/*Pull-up control G*/

#define rGSTATUS3  (*(volatile acoral_u32 *)0x560000b8)	/*Saved data0(32-bit) before entering POWER_OFF mode */
#endif
