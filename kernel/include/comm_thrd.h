#ifndef COMM_THRD_H
#define COMM_THRD_H
#include<type.h>
#include<thread.h>

/**
 * @brief 普通线程调度相关的数据
 * 
 */
typedef struct{
	acoral_u8 prio; ///<优先级
	acoral_u8 prio_type; ///<优先级类型，有ACORAL_BASE_PRIO和ACORAL_ABSOLUTE_PRIO，后者表示优先级设定是多少就是多少，前者则需要根据系统需要在创建线程时进行调整
}acoral_comm_policy_data_t;

acoral_id comm_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data);
acoral_id create_comm_thread(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,acoral_u8 prio);
#endif
