#ifndef ACORAL_CORE_H //TODO 要调整
#define ACORAL_CORE_H
#include<autocfg.h>
#include<type.h>

#define ACORAL_MAX_THREAD CFG_MAX_THREAD
#define ACORAL_MIN_STACK_SIZE CFG_MIN_STACK_SIZE 

#ifdef CFG_MEM_TEST
#define ACORAL_TEST_STACK_SIZE 1024
#else
#define ACORAL_TEST_STACK_SIZE 512
#endif

#define ACORAL_PRINT_STACK_SIZE 512

#define ACORAL_MAX_PRIO_NUM ((CFG_MAX_THREAD+1)&0xff)


#define ACORAL_MINI_PRIO  ACORAL_MAX_PRIO_NUM-1
#define ACORAL_INIT_PRIO  0
#define ACORAL_MAX_PRIO  1
#define ACORAL_TICKS_PER_SEC CFG_TICKS_PER_SEC

volatile extern acoral_u32 acoral_start_sched;
extern acoral_id daemon_id;
void acoral_module_init(void);
void acoral_init_call(void);
void acoral_thread_sys_init(void);
void acoral_start(void);
void acoral_core_cpu_start(void);
void acoral_start_os(void);
void acoral_sys_call(void);
void acoral_app_call(void);
#endif
