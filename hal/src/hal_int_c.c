/**
 * @file hal_int_c.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief 中断二级入口、中断开关以及中断初始化c代码
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
void hal_all_entry(acoral_vector vector){//TODO 加个#define acoral_hal_all_entry hal_all_entry 前者放到kernel里面去
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


