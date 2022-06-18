#include<acoral.h>

void hal_intr_unmask(acoral_vector vector);
void hal_intr_mask(acoral_vector vector);
void hal_intr_ack(acoral_u32 vector);

#define HAL_INTR_UNMASK(vector) hal_intr_unmask(vector)
#define HAL_INTR_UNMASK hal_intr_unmask
#define HAL_INTR_MASK(vector) hal_intr_mask(vector)
#define HAL_INTR_MASK hal_intr_mask
#define HAL_INTR_ACK(vector) hal_intr_ack(vector)
#define HAL_INTR_ACK hal_intr_ack

