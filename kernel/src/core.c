/**
 * @mainpage aCoral-I源码文档
 * @section 简介
 * 珊瑚aCoral单核版本源码文档，对源码中的文件、函数、变量等进行了详细说明，适合初学者阅读，用以加深对aCoral-I的理解。\n
 * 配合《珊瑚-I 内核手册》食用更香哦。
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @version 1.0
 * @date 2022-06-24
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-06-24 <td>Standardized 
 *  </table>
 */

/**
 * @file core.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层,aCoral内核初始化文件，紧接start.S
 * @version 1.0
 * @date 2022-07-04
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-04 <td>Standardized 
 *  </table>
 */

#include <acoral.h>
acoral_queue_t acoral_res_release_queue;
volatile acoral_u32 acoral_start_sched = false;
acoral_id daemon_id, idle_id, init_id;
extern volatile acoral_u32 idle_count[HAL_MAX_CPU];

/**
 * @brief aCoral空闲守护线程idle函数
 *
 * @param args
 */
void idle(void *args)
{
	for(;;){}
}

/**
 * @brief aCoral资源回收线程daem函数
 *
 * @param args
 */
void daem(void *args)
{
	acoral_sr cpu_sr;
	acoral_thread_t *thread;
	acoral_list_t *head, *tmp, *tmp1;
	head = &acoral_res_release_queue.head;
	while (1)
	{
		for (tmp = head->next; tmp != head;)
		{
			tmp1 = tmp->next;
			HAL_ENTER_CRITICAL();
			thread = list_entry(tmp, acoral_thread_t, waiting);
			/*如果线程资源已经不在使用，即release状态则释放*/

			acoral_list_del(tmp); /**/

			HAL_EXIT_CRITICAL();
			tmp = tmp1;
			if (thread->state == ACORAL_THREAD_STATE_RELEASE)
			{
				acoral_release_thread((acoral_res_t *)thread);
			}
			else
			{
				HAL_ENTER_CRITICAL();
				tmp1 = head->prev;
				acoral_list_add2_tail(&thread->waiting, head); /**/
				HAL_EXIT_CRITICAL();
			}
		}
		acoral_suspend_self();
	}
}

#ifdef CFG_TEST
#define DAEM_STACK_SIZE 512
#else
#define DAEM_STACK_SIZE 256
#endif
acoral_thread_t *thread;

/**
 * @brief aCoral初始化线程init函数
 *
 * @param args
 */
void init(void *args)
{
	acoral_prints("in init spg");
	acoral_comm_policy_data_t data;
	acoral_ticks_init();
	/*ticks中断初始化函数*/
	acoral_start_sched = true;
	/*软件延时初始化函数*/
#ifdef CFG_SOFT_DELAY
	soft_delay_init();
#endif


	/*创建后台服务进程*/
	acoral_init_list(&acoral_res_release_queue.head);
	data.cpu = acoral_current_cpu;
	data.prio = ACORAL_DAEMON_PRIO;
	data.prio_type = ACORAL_ABSOLUTE_PRIO;
	daemon_id = acoral_create_thread_ext(daem, DAEM_STACK_SIZE, NULL, "daemon", NULL, ACORAL_SCHED_POLICY_COMM, &data);
	thread = (acoral_thread_t *)acoral_get_res_by_id(daemon_id);
	if (daemon_id == -1)
		while (1)
			;
			/*应用级相关服务初始化,应用级不要使用延时函数，没有效果的*/
#ifdef CFG_SHELL
	acoral_shell_init();
#endif
	plugin_init();
	user_main();
#ifdef CFG_TEST
	test_init();
#endif
}

acoral_thread_t orig_thread;

/**
 * @brief  c语言初始化入口函数
 * 
 */
void acoral_start()
{
	orig_thread.console_id = ACORAL_DEV_ERR_ID;
	acoral_set_orig_thread(&orig_thread);
	/*板子初始化*/
	HAL_BOARD_INIT();

	/*内核模块初始化*/
	acoral_module_init();

	/*串口终端应该初始化好了，将根线程的终端id设置为串口终端*/
#ifdef CFG_DRIVER
	orig_thread.console_id = acoral_dev_open("console");
	acoral_prints("hello spg");
#endif

	/*主cpu开始函数*/
	acoral_core_cpu_start();
}


/**
 * @brief CPU开始创建线程工作，创建idle线程、init线程
 * 
 */
#define IDLE_STACK_SIZE 128
void acoral_core_cpu_start()
{
	acoral_comm_policy_data_t data;
	/*创建空闲线程*/
	acoral_start_sched = false;
	data.cpu = acoral_current_cpu;
	data.prio = ACORAL_IDLE_PRIO;
	data.prio_type = ACORAL_ABSOLUTE_PRIO;
	idle_id = acoral_create_thread_ext(idle, IDLE_STACK_SIZE, NULL, "idle", NULL, ACORAL_SCHED_POLICY_COMM, &data);
	if (idle_id == -1)
		while (1)
			;
	/*创建初始化线程,这个调用层次比较多，需要多谢堆栈*/
	data.prio = ACORAL_INIT_PRIO;
	/*动态堆栈*/
	init_id = acoral_create_thread_ext(init, ACORAL_TEST_STACK_SIZE, "in init", "init", NULL, ACORAL_SCHED_POLICY_COMM, &data);
	if (init_id == -1)
		while (1)
			;
	acoral_start_os();
}

/**
 * @brief aCoral最终启动
 * 
 */
void acoral_start_os()
{
	acoral_sched_init();
	acoral_select_thread();
	acoral_set_running_thread(acoral_ready_thread);
	HAL_START_OS(&acoral_cur_thread->stack);
}

/**
 * @brief aCoral内核各模块初始化
 * 
 */
void acoral_module_init()
{
	/*中断系统初始化*/
	acoral_intr_sys_init();
	/*内存管理系统初始化*/
	acoral_mem_sys_init();
	/*线程管理系统初始化*/
	acoral_thread_sys_init();
	/*时钟管理系统初始化*/
	acoral_time_sys_init();
	/*事件管理系统初始化*/
	acoral_evt_sys_init();
#ifdef CFG_DRIVER
	/*驱动管理系统初始化*/
	acoral_drv_sys_init();
#endif
}
