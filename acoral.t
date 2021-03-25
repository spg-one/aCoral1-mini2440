
acoral.elf:     file format elf32-littlearm

SYMBOL TABLE:
30000000 l    d  .text	00000000 .text
3000ec50 l    d  .data	00000000 .data
3000ece8 l    d  .bss	00000000 .bss
00000000 l    d  .ARM.attributes	00000000 .ARM.attributes
00000000 l    d  .comment	00000000 .comment
00000000 l    d  .debug_aranges	00000000 .debug_aranges
00000000 l    d  .debug_pubnames	00000000 .debug_pubnames
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_line	00000000 .debug_line
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_str	00000000 .debug_str
00000000 l    d  .debug_loc	00000000 .debug_loc
3000005c l       .text	00000000 ResetHandler
30000040 l       .text	00000000 HandleUndef
30000044 l       .text	00000000 HandleSWI
3000004c l       .text	00000000 HandlePabort
30000048 l       .text	00000000 HandleDabort
30000038 l       .text	00000000 HandleFIQ
30000050 l       .text	00000000 _text_start
30000054 l       .text	00000000 _bss_start
30000058 l       .text	00000000 _bss_end
30000214 l       .text	00000000 memsetup
300001b0 l       .text	00000000 InitStacks
300000d8 l       .text	00000000 copy_self
30000238 l       .text	00000000 mem_clear
30000104 l       .text	00000000 copy_from_rom
30000120 l       .text	00000000 copy_from_nand
30000164 l       .text	00000000 ok_nand_read
30000144 l       .text	00000000 bad_nand_read
30000170 l       .text	00000000 go_next
3000018c l       .text	00000000 notmatch
300001ac l       .text	00000000 out
30000250 l       .text	00000000 mem_cfg_val
00000000 l    df *ABS*	00000000 hal_thread_c.c
00000000 l    df *ABS*	00000000 hal_int_c.c
30000498 l     F .text	000000f4 hal_intr_unmask
3000058c l     F .text	000000e8 hal_intr_mask
30000674 l     F .text	000000f4 hal_intr_ack
00000000 l    df *ABS*	00000000 hal_timer.c
00000000 l    df *ABS*	00000000 hal_mem_c.c
30000a08 l     F .text	000001fc hal_mmu_init
00000000 l    df *ABS*	00000000 hal_nand.c
30000cb0 l     F .text	00000050 nand_wait
30000d00 l     F .text	00000084 nand_reset
30000db4 l     F .text	000001b8 is_bad_block
30000f6c l     F .text	000001d4 nand_read_page
30001140 l     F .text	00000080 nand_read_id
00001000 l       *ABS*	00000000 R1_I
00000004 l       *ABS*	00000000 R1_C
00000002 l       *ABS*	00000000 R1_A
00000001 l       *ABS*	00000000 R1_M
c0000000 l       *ABS*	00000000 BUS_M
000000c0 l       *ABS*	00000000 NOINT
00000013 l       *ABS*	00000000 SVCMODE
00000000 l    df *ABS*	00000000 hal_comm.c
00000000 l    df *ABS*	00000000 core.c
00000000 l    df *ABS*	00000000 policy.c
00000000 l    df *ABS*	00000000 sched.c
3000ecec l       .bss	00000000 acoral_ready_queues
00000000 l    df *ABS*	00000000 thread.c
30002890 l     F .text	0000008c acoral_delay_thread
3000291c l     F .text	00000038 acoral_delay_thread_by_id
00000000 l    df *ABS*	00000000 comm_thrd.c
00000000 l    df *ABS*	00000000 resource.c
00000000 l    df *ABS*	00000000 int.c
00000000 l    df *ABS*	00000000 timer.c
3000f050 l       .bss	00000000 ticks
00000000 l    df *ABS*	00000000 mem.c
00000000 l    df *ABS*	00000000 spinlock.c
00000000 l    df *ABS*	00000000 event.c
00000000 l    df *ABS*	00000000 mutex.c
00000000 l    df *ABS*	00000000 buddy.c
30005ef0 l     F .text	000002a8 recus_malloc
30006198 l     F .text	00000360 r_malloc
00000000 l    df *ABS*	00000000 malloc.c
30006b34 l     F .text	000002b4 r_malloc
00000000 l    df *ABS*	00000000 mbox.c
00000000 l    df *ABS*	00000000 sem.c
00000000 l    df *ABS*	00000000 message.c
00000000 l    df *ABS*	00000000 rm_thrd.c
00000000 l    df *ABS*	00000000 period_thrd.c
00000000 l    df *ABS*	00000000 slice_thrd.c
00000000 l    df *ABS*	00000000 posix_thrd.c
00000000 l    df *ABS*	00000000 softdelay.c
00000000 l    df *ABS*	00000000 dummy.c
00000000 l    df *ABS*	00000000 bitops.c
00000000 l    df *ABS*	00000000 queue.c
00000000 l    df *ABS*	00000000 list.c
00000000 l    df *ABS*	00000000 print.c
3000a260 l     F .text	00000074 do_div
3000f454 l       .bss	00000000 print_buf.2126
3000ec84 l     O .data	00000004 console_id
3000f054 l       .bss	00000000 print_buf.2163
00000000 l    df *ABS*	00000000 str.c
00000000 l    df *ABS*	00000000 random.c
3000f554 l       .bss	00000000 rand_seed
00000000 l    df *ABS*	00000000 plugin.c
00000000 l    df *ABS*	00000000 user.c
00000000 l    df *ABS*	00000000 shell.c
00000000 l    df *ABS*	00000000 cmd.c
00000000 l    df *ABS*	00000000 thread_display.c
00000000 l    df *ABS*	00000000 driver.c
00000000 l    df *ABS*	00000000 brd_driver.c
00000000 l    df *ABS*	00000000 con_uart.c
3000dc08 l       .text	00000000 .udivsi3_nodiv0
3000dba8 g     F .text	00000060 con_uart_init
300072e8 g     F .text	00000070 acoral_mbox_del
30004a60 g     F .text	00000030 acoral_mem_sys_init
30004b54 g     F .text	00000010 acoral_evt_sys_init
30008600 g     F .text	00000090 acoral_print_all_msg
30005248 g     F .text	000001e8 acoral_mutex_pend2
3000f558 g     O .bss	0000000c g_msgctr_header
3000f564 g     O .bss	00000050 drv_table
3000d978 g     F .text	00000010 brd_driver_init
3000f5b4 g     O .bss	0000001c comm_policy
3000f5d0 g     O .bss	00000004 acoral_free_res_pool
3000b758 g     F .text	00000064 acoral_toupper
30002760 g     F .text	00000054 acoral_suspend_thread
3000b65c g     F .text	00000098 acoral_debugs
3000f5d4 g     O .bss	0000001c posix_policy
3000c4a8 g     F .text	00000084 acoral_memcpy
30008808 g     F .text	00000028 rm_policy_thread_release
300014dc g       .text	00000000 MMU_EnableMMU
30004b38 g     F .text	0000001c spin_unlock_stamp
3000c8e8 g     F .text	00000004 plugin_init
300014ec g       .text	00000000 MMU_DisableMMU
30002e8c g     F .text	00000080 acoral_thread_pool_init
3000f5f0 g     O .bss	00000001 sched_lock
30002f0c g     F .text	00000024 acoral_set_thread_console
300033e4 g     F .text	000000f8 acoral_collect_pool
30009f5c g     F .text	00000088 acoral_prio_queue_add
30007e4c g     F .text	00000088 acoral_msg_init
3000150c g       .text	00000000 MMU_InvalidateIDCache
3000148c g       .text	00000000 MMU_DisableICache
300044b0 g     F .text	0000003c acoral_time_sys_init
30001514 g       .text	00000000 MMU_InvalidateICache
3000f5f4 g     O .bss	00000578 intr_table
3000157c g       .text	00000000 MMU_InvalidateDTLB
3000e164 g     F .text	00000160 __divsf3
30001800 g     F .text	0000002c hal_intr_exit_bridge_comm
300016a8 g       .text	00000000 EXP_HANDLER
3000fb6c g     O .bss	0000001c slice_policy
30002b1c g     F .text	0000003c acoral_thread_change_prio_by_id
300016ec g       .text	00000000 HAL_INTR_RESTORE
3000d67c g     F .text	00000098 acoral_dev_write
30000974 g     F .text	00000010 hal_mem_init
300002c0 g     F .text	0000010c hal_stack_init
30001ad0 g     F .text	000000fc acoral_core_cpu_start
3000166c g       .text	00000000 HAL_INTR_ENTRY
3000ec88 g     O .data	00000010 mem_cmd
30004abc g     F .text	00000024 spin_unlock_intr_restore
3000270c g     F .text	00000054 acoral_release_thread
3000ec54 g     O .data	00000004 prio
30009270 g     F .text	00000010 period_thread_exit
3000fb88 g     O .bss	00000004 thread_api
3000182c g     F .text	00000048 hal_atomic_add_comm
30004274 g     F .text	0000004c acoral_set_intr_exit
30004bbc g     F .text	00000020 acoral_alloc_evt
30007d90 g     F .text	000000bc acoral_msgctr_init
30004ae0 g     F .text	0000001c spin_lock_intr
3000159c g       .text	00000000 HAL_INTR_SWITCH_TO
3000151c g       .text	00000000 MMU_InvalidateICacheMVA
00000200 g       *ABS*	00000000 IRQ_stack_size
30007a40 g     F .text	00000108 acoral_sem_post
3000db1c g     F .text	00000018 console_open
30009280 g     F .text	00000080 period_policy_init
3000b904 g     F .text	00000064 acoral_str_len
3000e994 g     O .text	00000025 small_digits
30001fa0 g     F .text	00000050 acoral_sched_init
30000d84 g     F .text	00000030 nand_init
3000dd2c g     F .text	000001bc __aeabi_fadd
30002194 g     F .text	000000c4 acoral_get_idle_maskcpu
3000dd28 g     F .text	000001c0 __subsf3
300027d4 g     F .text	00000034 acoral_suspend_thread_by_id
30002a20 g     F .text	00000030 acoral_kill_thread_by_id
3000d988 g     F .text	0000003c uart_write
30009cc4 g     F .text	0000000c dummy_print
3000b4f8 g     F .text	0000004c acoral_getchar
30002698 g     F .text	00000074 acoral_release_thread1
3000c638 g     F .text	0000009c acoral_memcmp
3000bf00 g     F .text	000000c0 acoral_str_ncmp
3000fb8c g     O .bss	00000034 mem_ctrl
30002c40 g     F .text	00000020 acoral_alloc_thread
3000a0b0 g     F .text	000000c8 acoral_prio_queue_init
300039b4 g     F .text	000000a4 acoral_pools_init
3000e3c0 g     F .text	00000018 __aeabi_fcmpgt
30002524 g     F .text	000000ac acoral_real_intr_sched
30006e3c g     F .text	000002a4 v_free
300018c8 g     F .text	000000d0 daem
30000984 g     F .text	00000084 flush_cache
300048f0 g     F .text	00000064 timeout_queue_del
300011c0 g     F .text	000002bc nand_read
3000fbc0 g     O .bss	00000038 acoral_thread_pool_ctrl
300042c0 g     F .text	0000004c acoral_set_intr_mask
3000fbf8 g     O .bss	00000038 acoral_drv_pool_ctrl
30002010 g     F .text	00000020 acoral_set_orig_thread
3000cd60 g     F .text	000001c8 get_cmd
3000ecc8 g     O .data	00000010 spg_cmd
300070e0 g     F .text	000000bc v_mem_init
3000cfe0 g     F .text	0000009c acoral_shell_enter
3000d488 g     F .text	000000d8 acoral_drv_register
3000b968 g     F .text	0000006c acoral_str_cpy
3000dc08 g     F .text	000000f4 __udivsi3
300015dc g       .text	00000000 HAL_INTR_CTX_SWITCH
3000def0 g     F .text	00000020 __aeabi_i2f
300075a8 g     F .text	0000009c acoral_mbox_tryrecv
30000000 g       .text	00000000 __ENTRY
30003b60 g     F .text	00000040 acoral_obj_pool_init
3000a874 g     F .text	00000b38 vsnprintf
300014cc g       .text	00000000 MMU_DisableAlignFault
3000e2cc g     F .text	0000006c __lesf2
30007ba0 g     F .text	000000ac acoral_msg_sys_init
300016d8 g       .text	00000000 HAL_INTR_DISABLE
30004c0c g     F .text	00000038 acoral_evt_queue_empty
3000a2d4 g     F .text	00000088 skip_atoi
3000d7ac g     F .text	00000094 acoral_dev_config
30003ff4 g     F .text	000001a8 acoral_intr_entry
30003858 g     F .text	00000078 acoral_get_res_by_id
30001f44 g     F .text	0000003c acoral_sched_policy_init
300076b4 g     F .text	00000078 acoral_sem_create
3000d1e8 g     F .text	00000214 display_thread
30001e48 g     F .text	0000002c acoral_register_sched_policy
3000c324 g     F .text	0000008c acoral_str_pbrk
300017d4 g     F .text	0000002c hal_sched_bridge_comm
30007ed4 g     F .text	00000068 acoral_msg_assign
30009f00 g     F .text	0000005c acoral_get_bit
3000ec5c g     O .data	00000028 right
3000fc30 g     O .bss	0000000c acoral_threads_queue
3000fc3c g     O .bss	00000004 thread
3000a1c4 g     F .text	0000004c acoral_list_add2_tail
3000b6f4 g     F .text	00000064 acoral_tolower
3000fc40 g     O .bss	00000058 orig_thread
3000a178 g     F .text	0000004c acoral_list_add
3000b9d4 g     F .text	000000f0 acoral_str_cmp
300038d0 g     F .text	000000e4 acoral_pool_res_init
00000200 g       *ABS*	00000000 SVC_stack_size
3000fc98 g     O .bss	0000000c tmp_rm_queue
30003ca4 g     F .text	000000b0 acoral_intr_sys_init
30000c04 g     F .text	000000ac hal_mmu_setmtt
30009a50 g     F .text	00000058 posix_policy_data_init
3000fca4 g     O .bss	00000004 acoral_mem_blocks
3000e2d4 g     F .text	00000064 __nesf2
30004a90 g     F .text	0000002c spin_lock_intr_save
30004dfc g     F .text	00000088 acoral_mutex_create
33ffff00 g       *ABS*	00000000 stack_base
30007430 g     F .text	00000178 acoral_mbox_recv
3000bc68 g     F .text	0000008c acoral_str_lcpy
3000a07c g     F .text	00000034 acoral_get_highprio
3000155c g       .text	00000000 MMU_WaitForInterrupt
3000bd80 g     F .text	000000c8 acoral_str_ncat
3000fca8 g     O .bss	00000004 sample_100ms
30010630 g       *ABS*	00000000 heap_start
300043a0 g     F .text	00000110 acoral_fault_entry
3000cd38 g     F .text	00000028 echo
30002bd0 g     F .text	00000040 acoral_thread_move2_tail
3000d09c g     F .text	00000020 malloc_scan2
3000c8c8 g     F .text	00000020 acoral_rand_start
30004f10 g     F .text	000000d8 acoral_mutex_trypend
3000fcac g     O .bss	00000014 console_ops
3000fcc0 g     O .bss	00000008 left
3000c884 g     F .text	00000044 acoral_rand
30002f74 g     F .text	000000d0 create_comm_thread
30003bec g     F .text	00000028 acoral_free_obj
3000dd28 g     F .text	000001c0 __aeabi_fsub
00000100 g       *ABS*	00000000 Abort_stack_size
30002b94 g     F .text	0000003c acoral_unrdy_thread
30002030 g     F .text	00000054 acoral_set_running_thread
3000a35c g     F .text	00000518 number
3000ecb8 g     O .data	00000010 exit_cmd
30004954 g     F .text	0000010c timeout_delay_deal
30008c60 g     F .text	00000064 rm_policy_init
3000e3a8 g     F .text	00000018 __aeabi_fcmpge
300034dc g     F .text	0000012c acoral_get_res
30007c7c g     F .text	00000020 acoral_alloc_msgctr
300016c8 g       .text	00000000 HAL_INTR_ENABLE
300016f4 g       .text	00000000 HAL_INTR_DISABLE_SAVE
30002808 g     F .text	00000034 acoral_resume_thread_by_id
3000df20 g     F .text	000000ac __floatdisf
3000e9bc g     O .text	00000025 large_digits
30009768 g     F .text	000000c0 acoral_posix_create
30001a8c g     F .text	00000044 acoral_start
3000c91c g     F .text	00000240 parse_args
3000fcc8 g     O .bss	00000004 daemon_id
3000fccc g     O .bss	0000000c period_delay_queue
3000e2c4 g     F .text	00000074 __gtsf2
30004c44 g     F .text	00000050 acoral_evt_high_thread
30005430 g     F .text	000001a8 acoral_mutex_post
300014ac g       .text	00000000 MMU_DisableDCache
3000fcd8 g     O .bss	00000004 head_cmd
3000fcdc g     O .bss	0000000c acoral_res_release_queue
3000e390 g     F .text	00000018 __aeabi_fcmple
3000cb5c g     F .text	00000064 add_command
30003ba0 g     F .text	00000020 acoral_obj_pool_release
30008578 g     F .text	00000038 acoral_msg_del
30007c9c g     F .text	00000020 acoral_alloc_msg
3000c438 g     F .text	00000070 acoral_memset
30007c4c g     F .text	00000030 acoral_msgctr_list_queueadd
33fffd00 g       *ABS*	00000000 ABT_stack
3000eca8 g     O .data	00000010 help_cmd
3000d3fc g     F .text	0000008c acoral_get_drv_ctrl_by_name
30001bcc g     F .text	00000040 acoral_start_os
3000719c g     F .text	000000e4 v_mem_scan
30009b60 g     F .text	00000024 delay_task
300031a0 g     F .text	00000164 acoral_create_pool
3000c7f0 g     F .text	00000094 acoral_memchr
30001534 g       .text	00000000 MMU_InvalidateDCacheMVA
3000c284 g     F .text	000000a0 acoral_str_cspn
3000fce8 g     O .bss	00000820 acoral_pools
30003608 g     F .text	00000188 acoral_release_res
3000cbc0 g     F .text	00000074 find_cmd
30007644 g     F .text	00000070 acoral_sem_init
30008cc4 g     F .text	000000b4 rm_end
300014bc g       .text	00000000 MMU_EnableAlignFault
3000db34 g     F .text	00000074 uart_init
3000c030 g     F .text	0000008c acoral_str_rchr
3000daec g     F .text	00000030 console_config
30007280 g     F .text	00000068 acoral_mbox_create
3000232c g     F .text	000000cc acoral_rdyqueue_del
30007f3c g     F .text	000000e8 acoral_msgctr_create
30002aec g     F .text	00000030 acoral_change_prio_self
30001524 g       .text	00000000 MMU_PrefetchICacheMVA
30009aa8 g     F .text	00000064 posix_policy_init
300018bc g     F .text	0000000c idle
30002c10 g     F .text	00000030 acoral_thread_move2_tail_by_id
30003e24 g     F .text	000000e8 acoral_intr_unmask
3000772c g     F .text	000000b0 acoral_sem_del
30004fe8 g     F .text	00000260 acoral_mutex_pend
30001504 g       .text	00000000 MMU_SetDomain
3000b7bc g     F .text	000000a8 acoral_str_upr
30010508 g     O .bss	00000038 acoral_msg_pool_ctrl
30010630 g       *ABS*	00000000 bss_end
3000def0 g     F .text	00000020 __floatsisf
30009828 g     F .text	00000200 posix_policy_thread_init
30002a70 g     F .text	0000007c acoral_thread_change_prio
30001574 g       .text	00000000 MMU_InvalidateITLBMVA
30002a50 g     F .text	00000020 acoral_thread_exit
3000ccb4 g     F .text	00000084 cmd_exe
00000000 g       *ABS*	00000000 FIQ_stack_size
30002b58 g     F .text	0000003c acoral_rdy_thread
3000bcf4 g     F .text	0000008c acoral_str_cat
300017b8 g     F .text	0000001c hal_intr_nesting_inc_comm
3000e2d4 g     F .text	00000064 __eqsf2
300094f8 g     F .text	0000007c slice_delay_deal
30004e84 g     F .text	0000008c acoral_mutex_del
30007358 g     F .text	000000d8 acoral_mbox_send
3000d07c g     F .text	00000020 malloc_scan
3000c6d4 g     F .text	00000070 acoral_memscan
30001774 g     F .text	00000044 hal_intr_nesting_dec_comm
30008928 g     F .text	00000158 rm_check
300025d0 g     F .text	000000c8 acoral_select_thread
00000200 g       *ABS*	00000000 SYS_stack_size
3000ece8 g       .bss	00000000 bss_start
3000e164 g     F .text	00000160 __aeabi_fdiv
300055d8 g     F .text	00000178 buddy_scan
30007b48 g     F .text	00000058 acoral_sem_getnum
3000d924 g     F .text	00000054 acoral_drv_sys_init
30009e9c g     F .text	00000064 acoral_clear_bit
30010540 g     O .bss	00000004 idle_id
3000d8bc g     F .text	00000020 acoral_alloc_drv
3000df10 g     F .text	000000bc __floatundisf
30009cd0 g     F .text	000000e0 acoral_ffs
33fffc00 g       *ABS*	00000000 UDF_stack
30004d58 g     F .text	00000034 acoral_evt_queue_del
30001998 g     F .text	000000f4 init
3000d560 g     F .text	00000088 acoral_drv_unregister
3000dd1c  w    F .text	00000004 __aeabi_ldiv0
30008f5c g     F .text	00000028 period_policy_thread_release
30004bdc g     F .text	00000030 acoral_evt_init
3000b544 g     F .text	00000054 acoral_putchar
3000b598 g     F .text	000000c4 acoral_debug
30001e74 g     F .text	0000007c acoral_policy_delay_deal
3000dee8 g     F .text	00000028 __aeabi_ui2f
3000be48 g     F .text	000000b8 acoral_str_lcat
3000da80 g     F .text	0000006c console_read
3000bbd8 g     F .text	00000090 acoral_str_ncpy
3000c52c g     F .text	0000010c acoral_memmove
300047e8 g     F .text	00000108 timeout_queue_add
30010544 g     O .bss	0000000c policy_list
30010550 g     O .bss	00000004 acoral_mem_ctrl
3000d5e8 g     F .text	00000094 acoral_dev_open
30008d78 g     F .text	000001e4 period_policy_thread_init
30010554 g     O .bss	0000001c rm_policy
30007d58 g     F .text	00000038 acoral_msg_queue_add
3000e2d4 g     F .text	00000064 __cmpsf2
3000c3b0 g     F .text	00000088 acoral_str_sep
30009b84 g     F .text	0000005c acoral_soft_delay
300020fc g     F .text	00000098 acoral_get_idlest_cpu
30004b18 g     F .text	00000020 spin_lock_stamp
30002c60 g     F .text	0000022c acoral_thread_init
30001644 g       .text	00000000 HAL_CONTEXT_SWITCH
30008830 g     F .text	00000044 rm_discard_thread
3000df20 g     F .text	000000ac __aeabi_l2f
00000100 g       *ABS*	00000000 Undef_stack_size
33f00000 g       *ABS*	00000000 MMU_base
30010570 g     O .bss	00000004 init_id
30001c34 g     F .text	000000d4 create_thread_ext
30010574 g     O .bss	0000000c time_delay_queue
3000e2cc g     F .text	0000006c __ltsf2
30002f60 g     F .text	00000014 acoral_thread_sys_init
3000dc08 g     F .text	00000000 __aeabi_uidiv
30004afc g     F .text	0000001c spin_unlock_intr
30009a28 g     F .text	00000028 posix_policy_thread_release
300023f8 g     F .text	00000080 acoral_sched
3000283c g     F .text	00000054 acoral_resume_thread
30000000 g       .text	00000000 text_start
3000cf28 g     F .text	00000094 acoral_shell_init
30010580 g     O .bss	00000038 acoral_evt_pool_ctrl
3000df10 g     F .text	000000bc __aeabi_ul2f
300105b8 g     O .bss	00000038 acoral_msgctr_pool_ctrl
33fff900 g       *ABS*	00000000 SYS_stack
30002984 g     F .text	0000009c acoral_kill_thread
300041ac g     F .text	0000007c acoral_intr_exit
30009e3c g     F .text	00000060 acoral_set_bit
3000e348 g     F .text	00000018 __aeabi_cfcmple
3000d0bc g     F .text	0000006c help
3000dfcc g     F .text	00000198 __mulsf3
30004d8c g     F .text	00000070 acoral_mutex_init
30001554 g       .text	00000000 MMU_CleanInvalidateDCacheIndex
300095d8 g     F .text	00000190 posix_delay_deal
30009db0 g     F .text	0000008c acoral_find_first_bit
3000da04 g     F .text	0000007c console_write
3000ecd8 g     O .data	00000010 dt_cmd
30002954 g     F .text	00000030 acoral_delay_self
30004c94 g     F .text	000000c4 acoral_evt_queue_add
33eff000 g       *ABS*	00000000 heap_end
300090f0 g     F .text	00000180 period_delay_deal
30009b0c g     F .text	00000054 delay
300105f0 g     O .bss	0000000c timeout_queue
300003cc g     F .text	000000cc hal_all_entry
300027b4 g     F .text	00000020 acoral_suspend_self
3000419c g     F .text	00000010 acoral_default_isr
30009574 g     F .text	00000064 slice_policy_init
30001874 g     F .text	00000048 hal_atomic_sub_comm
3000e2c4 g     F .text	00000074 __gesf2
30002478 g     F .text	000000ac acoral_real_sched
30000938 g     F .text	0000003c hal_ticks_delay
3000dd20 g     F .text	000001c8 __aeabi_frsub
3000d178 g     F .text	00000028 spg
30003790 g     F .text	00000064 acoral_get_pool_by_id
30001584 g       .text	00000000 MMU_SetProcessId
3000e360 g     F .text	00000018 __aeabi_fcmpeq
3000dfcc g     F .text	00000198 __aeabi_fmul
30002084 g     F .text	00000078 acoral_thread_runqueue_init
3000b3ac g     F .text	00000060 acoral_sprint
30004558 g     F .text	00000050 acoral_ticks_entry
3000e338 g     F .text	00000028 __aeabi_cfrcmple
3000c0bc g     F .text	0000009c acoral_str_nchr
30003044 g     F .text	00000100 comm_policy_thread_init
3000c1cc g     F .text	000000b8 acoral_str_spn
30001760 g     F .text	00000014 hal_get_intr_nesting_comm
300086c0 g     F .text	00000148 rm_policy_thread_init
30001f90 g     F .text	00000010 app_exit_policy_init
300105fc g     O .bss	00000004 ready_thread
3000ec98 g     O .data	00000010 mem2_cmd
3000b864 g     F .text	000000a0 acoral_str_lwr
30003a58 g     F .text	00000108 acoral_pool_ctrl_init
30001564 g       .text	00000000 MMU_InvalidateTLB
3000d840 g     F .text	0000007c acoral_dev_close
3000659c g     F .text	000000e0 buddy_malloc
3000e378 g     F .text	00000018 __aeabi_fcmplt
3000cfbc g     F .text	00000024 acoral_shell_exit
3000154c g       .text	00000000 MMU_CleanDCacheIndex
3000156c g       .text	00000000 MMU_InvalidateITLB
300080c0 g     F .text	00000114 acoral_msg_send
3000c8ec g     F .text	0000002c dummy
3000dcfc g     F .text	00000020 __aeabi_uidivmod
30001d88 g     F .text	000000c0 acoral_policy_thread_init
3000003c g       .text	00000000 HandleIRQ
30008a80 g     F .text	0000014c rm_thread_dispatch
30002258 g     F .text	000000d4 acoral_rdyqueue_add
3000153c g       .text	00000000 MMU_CleanDCacheMVA
3000149c g       .text	00000000 MMU_EnableDCache
30003c24 g     F .text	00000080 acoral_assert_res
3000ece8 g     O .bss	00000004 acoral_start_sched
3000a210 g     F .text	00000050 acoral_list_del
30008bcc g     F .text	00000094 rm_init
300044ec g     F .text	00000014 acoral_get_ticks
3000667c g     F .text	000004b8 buddy_free
300014fc g       .text	00000000 MMU_SetTTBase
30010600 g     O .bss	00000004 intr_nesting
30004520 g     F .text	00000038 acoral_ticks_init
3000d9c4 g     F .text	00000040 uart_read
30004b64 g     F .text	00000058 acoral_evt_pool_init
3000d1a0 g     F .text	00000048 cmd_init
3000c918 g     F .text	00000004 user_main
300045a8 g     F .text	0000012c acoral_delayqueue_add
30008874 g     F .text	000000b4 rm_queue_ascend_add
3000bac4 g     F .text	00000114 acoral_str_nicmp
3000d128 g     F .text	00000050 exit
3000ec50 g     O .data	00000004 acoral_doMsgTtl_checked
30009090 g     F .text	00000060 period_thread_delay
33ffff00 g       *ABS*	00000000 IRQ_stack
3000dee8 g     F .text	00000028 __floatunsisf
3000e348 g     F .text	00000018 __aeabi_cfcmpeq
30001ff0 g     F .text	00000020 acoral_sched_unlock
30005750 g     F .text	000007a0 buddy_init
30001d08 g     F .text	00000080 acoral_get_policy_ctrl
300077dc g     F .text	000000b8 acoral_sem_trypend
30004358 g     F .text	00000048 acoral_intr_set_type
3000dd1c  w    F .text	00000004 __aeabi_idiv0
30001ef0 g     F .text	00000054 acoral_policy_thread_release
30010604 g     O .bss	00000004 running_thread
30007cbc g     F .text	0000009c acoral_msgctr_queue_add
30001f80 g     F .text	00000010 app_enter_policy_init
30003d54 g     F .text	0000007c acoral_intr_attach
30003304 g     F .text	000000e0 acoral_release_pool
300046d4 g     F .text	00000114 time_delay_deal
30003dd0 g     F .text	00000054 acoral_intr_detach
300037f4 g     F .text	00000064 acoral_get_free_pool
3000171c g     F .text	00000044 hal_intr_nesting_init_comm
30002f30 g     F .text	00000030 acoral_sched_mechanism_init
300094d0 g     F .text	00000028 slice_policy_thread_release
3000b40c g     F .text	0000008c acoral_print
30003bc0 g     F .text	0000002c acoral_get_obj
300081d4 g     F .text	00000258 acoral_msg_recv
30008f84 g     F .text	0000010c acoral_periodqueue_add
30010608 g     O .bss	00000001 need_sched
3000ec58 g     O .data	00000004 rm_queue
30000864 g     F .text	000000d4 hal_ticks_init
3000bfc0 g     F .text	00000070 acoral_str_chr
30009be0 g     F .text	000000e4 soft_delay_init
3000d714 g     F .text	00000098 acoral_dev_read
30001544 g       .text	00000000 MMU_CleanInvalidateDCacheMVA
3001060c g     O .bss	0000001c period_policy
30003f0c g     F .text	000000e8 acoral_intr_mask
30010628 g     O .bss	00000004 sample
30008024 g     F .text	0000009c acoral_msg_create
30000768 g     F .text	000000fc hal_intr_init
30003144 g     F .text	0000005c comm_policy_init
3000cc34 g     F .text	00000080 execmd
3000c158 g     F .text	00000074 acoral_str_nlen
30009fe4 g     F .text	00000098 acoral_prio_queue_del
3000b498 g     F .text	00000060 acoral_prints
3000c744 g     F .text	000000ac acoral_strstr
300085b0 g     F .text	00000050 wake_up_thread
30008690 g     F .text	00000030 acoral_print_waitThreadsNum
30004500 g     F .text	00000020 acoral_set_ticks
33ffff00 g       *ABS*	00000000 FIQ_stack
300064f8 g     F .text	000000a4 buddy_malloc_size
30009300 g     F .text	000001d0 slice_policy_thread_init
3000d8dc g     F .text	00000048 acoral_drv_pool_init
3000158c g       .text	00000000 HAL_SWITCH_TO
3000dd2c g     F .text	000001bc __addsf3
3000430c g     F .text	0000004c acoral_set_intr_unmask
3001062c g     O .bss	00000004 tail_cmd
30001c0c g     F .text	00000028 acoral_module_init
30007894 g     F .text	000001ac acoral_sem_pend
30004228 g     F .text	0000004c acoral_set_intr_enter
30006de8 g     F .text	00000054 v_malloc
3000842c g     F .text	0000014c acoral_msgctr_del
33fffb00 g       *ABS*	00000000 SVC_stack
30003c14 g     F .text	00000010 acoral_res_sys_init
3000147c g       .text	00000000 MMU_EnableICache
3000152c g       .text	00000000 MMU_InvalidateDCache


