/*
 * kernel.h
 *
 *  Created on: 2010-3-8
 *      Author: jivin
 */

#ifndef KERNEL_H_
#define KERNEL_H_
#include <autocfg.h>
#include "error.h"
#include "core.h"
#include "cpu.h"
#include "thread.h"
#include "lsched.h"
#include "int.h"
#include "timer.h"
#include "mem.h"
#include "resource.h"
#include "event.h"
#include "mutex.h"
#include "sem.h"
#include "mbox.h"
#include "policy.h"
#include "comm_thrd.h"
#include "period_thrd.h"


#include "atomic.h"
#define acoral_enter_critical() HAL_ENTER_CRITICAL()
#define acoral_exit_critical() HAL_EXIT_CRITICAL()
#ifndef CFG_CMP
#define acoral_jump_cpu(cpu) 
#define acoral_moveto_thread_by_id(thread_id,cpu)
#define acoral_moveto_thread(thread,cpu)
#endif
#endif /* KERNEL_H_ */
