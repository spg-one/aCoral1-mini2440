#ifndef HAL_INT_H
#define HAL_INT_H

#include <type.h>

void hal_intr_unmask(acoral_vector vector);
void hal_intr_mask(acoral_vector vector);
void hal_intr_ack(acoral_u32 vector);
void hal_intr_init();

//中断相关的硬件抽象接口
#define HAL_INTR_MIN      0
#define HAL_INTR_NUM	 50
#define HAL_INTR_MAX HAL_INTR_MIN+HAL_INTR_NUM-1
#define HAL_INTR_INIT()	hal_intr_init()

// #define HAL_INTR_UNMASK(vector) hal_intr_unmask(vector)
// #define HAL_INTR_UNMASK hal_intr_unmask
// #define HAL_INTR_MASK(vector) hal_intr_mask(vector)
// #define HAL_INTR_MASK hal_intr_mask
// #define HAL_INTR_ACK(vector) hal_intr_ack(vector)
// #define HAL_INTR_ACK hal_intr_ack

#endif