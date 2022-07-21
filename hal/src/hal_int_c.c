/**
 * @file hal_int_c.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，中断二级入口、中断开关以及中断初始化c代码
 * @version 1.0
 * @date 2022-06-23 
 * @copyright Copyright (c) 2022
 * 
 * <table> 
 * <tr><th> 版本 <th>作者 <th>日期 <th>修改内容
 * <tr><td> 0.1 <td>jivin <td>2010-3-8 <td>Created 
 * <tr><td> 1.0 <td>王彬浩 <td>2022-06-23 <td>Standardized 
 * </table>
 */
#include<hal_2440_cfg.h>
#include<hal_2440_c.h>
#include<type.h>
#include "hal_int.h"

///中断嵌套数
acoral_u32 intr_nesting;

/**
 * @brief 中断入口，对中断复用进行展开
 * 
 * @param vector 中断向量号（中断复用未展开），来自INTOFFSET寄存器，
 */
void hal_all_entry(acoral_vector vector){
    unsigned long eint;
    unsigned long irq=4;
    if(vector==4||vector==5){
    	eint=rEINTPND;
    	for(;irq<24;irq++){
      		 if(eint & (1<<irq)){
           		acoral_intr_entry(irq);
           		return;
           	 }
    	}
    }
    if(vector>5)
    	vector+=18;
    if(vector==4)
    	acoral_prints("DErr\n");
    acoral_intr_entry(vector);
}

/**
 * @brief 通过向中断屏蔽（INTMSK）寄存器某位写入0来打开相应中断，对中断复用进行了合并处理
 * 
 * @param vector 中断向量号（中断复用展开后）
 */
void hal_intr_unmask(acoral_vector vector){
          if((vector>3) && (vector<8)){
               rEINTMSK &=~(1<<vector);
               vector = 4;
           }
         else if((vector>7) && (vector<24)){
               rEINTMSK &=~(1<<vector);
               vector = 5;
           }
         else if(vector > 23)
               vector -= 18; 

         rINTMSK &=~(1<<vector);			/*开启中断*/
}

/**
 * @brief 通过向中断屏蔽（INTMSK）寄存器某位写入1来屏蔽相应中断，对中断复用进行了合并处理
 * 
 * @param vector 中断向量号（中断复用展开后）
 */
void hal_intr_mask(acoral_vector vector){

         if((vector>3) && (vector<8)){
               rEINTMSK |=(1<<vector);
               vector = 4;
           }
         else if((vector>7) && (vector<24)){
               rEINTMSK |=(1<<vector);
               vector = 5;
           }
         else if(vector > 23)
               vector -= 18; 

         rINTMSK |= (1<<vector);
}

/**
 * @brief 中断响应后要清中断，不然中断会一直触发。对中断复用进行了合并操作
 * 
 * @param vector 中断向量号（中断复用展开后）
 */
void hal_intr_ack(acoral_u32 vector){

        if((vector>3) && (vector<8)){
               rEINTPND &= ~(1<<vector);
               vector = 4;
           }
        else if((vector>7) && (vector<24)){
               rEINTPND &= ~(1<<vector);
               vector = 5;
           }
        else if(vector > 23)
               vector -= 18;
   
        
        rSRCPND = 1<<vector;
		rINTPND = 1<<vector;		
}

/**
 * @brief 中断控制器寄存器初始化
 * 
 */
void hal_intr_init(){
	acoral_u32 i;
    /*配置中断管脚*/

	/*中断触发模式*/
	rEXTINT0 = 0x22222222;		/* EINT[7:0]*/
    rEXTINT1 = 0x22222222;		/* EINT[15:8]*/
    rEXTINT2 = 0x22222222;		/* EINT[23:16]*/

  	rPRIORITY = 0x00000000;		/* 使用默认的固定的优先级*/
	rINTMOD = 0x00000000;		/* 所有中断均为IRQ中断*/
    rEINTMSK= 0xffffffff;      /*屏蔽所有外部中断*/
    rINTMSK = 0xffffffff;       /*屏蔽所有中断*/

}

/**
 * @brief 中断嵌套初始化
 */
void hal_intr_nesting_init_comm(){
	acoral_u32 i;
	intr_nesting=0;
}

/**
 * @brief 获取系统当前中断嵌套数
 * 
 * @return acoral_u32 中断嵌套数
 */
acoral_u32 hal_get_intr_nesting_comm(){
    return intr_nesting;
}

/**
 * @brief 减少系统当前中断嵌套数
 * 
 */
void hal_intr_nesting_dec_comm(){
    if(intr_nesting>0)
	intr_nesting--;
}

/**
 * @brief 增加系统当前中断嵌套数
 * 
 */
void hal_intr_nesting_inc_comm(){
    intr_nesting++;
}


/**
 * @brief 保证调度的原子性
 * 
 */
void hal_sched_bridge_comm(){
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
	acoral_real_sched();
	HAL_EXIT_CRITICAL();
}

/**
 * @brief 保证调度（中断引起）的原子性
 * 
 */
void hal_intr_exit_bridge_comm(){
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
	acoral_real_intr_sched();
	HAL_EXIT_CRITICAL();
}
