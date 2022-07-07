#ifndef COMM_THRD_H
#define COMM_THRD_H
#include<type.h>
#include<thread.h>
typedef struct{
	acoral_u8 prio;
	acoral_u8 prio_type;
}acoral_comm_policy_data_t;
void comm_delay_deal(void);
acoral_id comm_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data);
acoral_id create_comm_thread(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,acoral_u8 prio);
#endif
