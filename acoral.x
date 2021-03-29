
acoral.elf:     file format elf32-littlearm
acoral.elf
architecture: arm, flags 0x00000112:
EXEC_P, HAS_SYMS, D_PAGED
start address 0x30000000

Program Header:
    LOAD off    0x00008000 vaddr 0x30000000 paddr 0x30000000 align 2**15
         filesz 0x0000ed14 memsz 0x0001065c flags rwx
private flags = 5000002: [Version5 EABI] [has entry point]

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         0000ec7c  30000000  30000000  00008000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000098  3000ec7c  3000ec7c  00016c7c  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00001948  3000ed14  3000ed14  00016d14  2**2
                  ALLOC
  3 .ARM.attributes 0000002e  00000000  00000000  00016d14  2**0
                  CONTENTS, READONLY
  4 .comment      00000739  00000000  00000000  00016d42  2**0
                  CONTENTS, READONLY
  5 .debug_aranges 00000560  00000000  00000000  0001747b  2**0
                  CONTENTS, READONLY, DEBUGGING
  6 .debug_pubnames 00002039  00000000  00000000  000179db  2**0
                  CONTENTS, READONLY, DEBUGGING
  7 .debug_info   0000c4bb  00000000  00000000  00019a14  2**0
                  CONTENTS, READONLY, DEBUGGING
  8 .debug_abbrev 0000339e  00000000  00000000  00025ecf  2**0
                  CONTENTS, READONLY, DEBUGGING
  9 .debug_line   0000367f  00000000  00000000  0002926d  2**0
                  CONTENTS, READONLY, DEBUGGING
 10 .debug_frame  000021cc  00000000  00000000  0002c8ec  2**2
                  CONTENTS, READONLY, DEBUGGING
 11 .debug_str    0000232e  00000000  00000000  0002eab8  2**0
                  CONTENTS, READONLY, DEBUGGING
 12 .debug_loc    00002e12  00000000  00000000  00030de6  2**0
                  CONTENTS, READONLY, DEBUGGING
SYMBOL TABLE:
30000000 l    d  .text	00000000 .text
3000ec7c l    d  .data	00000000 .data
3000ed14 l    d  .bss	00000000 .bss
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
3000ed18 l       .bss	00000000 acoral_ready_queues
00000000 l    df *ABS*	00000000 thread.c
300028a8 l     F .text	0000008c acoral_delay_thread
30002934 l     F .text	00000038 acoral_delay_thread_by_id
00000000 l    df *ABS*	00000000 comm_thrd.c
00000000 l    df *ABS*	00000000 resource.c
00000000 l    df *ABS*	00000000 int.c
00000000 l    df *ABS*	00000000 timer.c
3000f07c l       .bss	00000000 ticks
00000000 l    df *ABS*	00000000 mem.c
00000000 l    df *ABS*	00000000 spinlock.c
00000000 l    df *ABS*	00000000 event.c
00000000 l    df *ABS*	00000000 mutex.c
00000000 l    df *ABS*	00000000 buddy.c
30005f08 l     F .text	000002a8 recus_malloc
300061b0 l     F .text	00000360 r_malloc
00000000 l    df *ABS*	00000000 malloc.c
30006b4c l     F .text	000002b4 r_malloc
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
3000a278 l     F .text	00000074 do_div
3000f480 l       .bss	00000000 print_buf.2126
3000ecb0 l     O .data	00000004 console_id
3000f080 l       .bss	00000000 print_buf.2163
00000000 l    df *ABS*	00000000 str.c
00000000 l    df *ABS*	00000000 random.c
3000f580 l       .bss	00000000 rand_seed
00000000 l    df *ABS*	00000000 plugin.c
00000000 l    df *ABS*	00000000 user.c
00000000 l    df *ABS*	00000000 shell.c
00000000 l    df *ABS*	00000000 cmd.c
00000000 l    df *ABS*	00000000 thread_display.c
00000000 l    df *ABS*	00000000 driver.c
00000000 l    df *ABS*	00000000 brd_driver.c
00000000 l    df *ABS*	00000000 con_uart.c
3000dc20 l       .text	00000000 .udivsi3_nodiv0
3000dbc0 g     F .text	00000060 con_uart_init
30007300 g     F .text	00000070 acoral_mbox_del
30004a78 g     F .text	00000030 acoral_mem_sys_init
30004b6c g     F .text	00000010 acoral_evt_sys_init
30008618 g     F .text	00000090 acoral_print_all_msg
30005260 g     F .text	000001e8 acoral_mutex_pend2
3000f584 g     O .bss	0000000c g_msgctr_header
3000f590 g     O .bss	00000050 drv_table
3000d990 g     F .text	00000010 brd_driver_init
3000f5e0 g     O .bss	0000001c comm_policy
3000f5fc g     O .bss	00000004 acoral_free_res_pool
3000b770 g     F .text	00000064 acoral_toupper
30002778 g     F .text	00000054 acoral_suspend_thread
3000b674 g     F .text	00000098 acoral_debugs
3000f600 g     O .bss	0000001c posix_policy
3000c4c0 g     F .text	00000084 acoral_memcpy
30008820 g     F .text	00000028 rm_policy_thread_release
300014dc g       .text	00000000 MMU_EnableMMU
30004b50 g     F .text	0000001c spin_unlock_stamp
3000c900 g     F .text	00000004 plugin_init
300014ec g       .text	00000000 MMU_DisableMMU
30002ea4 g     F .text	00000080 acoral_thread_pool_init
3000f61c g     O .bss	00000001 sched_lock
30002f24 g     F .text	00000024 acoral_set_thread_console
300033fc g     F .text	000000f8 acoral_collect_pool
30009f74 g     F .text	00000088 acoral_prio_queue_add
30007e64 g     F .text	00000088 acoral_msg_init
3000150c g       .text	00000000 MMU_InvalidateIDCache
3000148c g       .text	00000000 MMU_DisableICache
300044c8 g     F .text	0000003c acoral_time_sys_init
30001514 g       .text	00000000 MMU_InvalidateICache
3000f620 g     O .bss	00000578 intr_table
3000157c g       .text	00000000 MMU_InvalidateDTLB
3000e17c g     F .text	00000160 __divsf3
30001800 g     F .text	0000002c hal_intr_exit_bridge_comm
300016a8 g       .text	00000000 EXP_HANDLER
3000fb98 g     O .bss	0000001c slice_policy
30002b34 g     F .text	0000003c acoral_thread_change_prio_by_id
300016ec g       .text	00000000 HAL_INTR_RESTORE
3000d694 g     F .text	00000098 acoral_dev_write
30000974 g     F .text	00000010 hal_mem_init
300002c0 g     F .text	0000010c hal_stack_init
30001ae8 g     F .text	000000fc acoral_core_cpu_start
3000166c g       .text	00000000 HAL_INTR_ENTRY
3000ecb4 g     O .data	00000010 mem_cmd
30004ad4 g     F .text	00000024 spin_unlock_intr_restore
30002724 g     F .text	00000054 acoral_release_thread
3000ec80 g     O .data	00000004 prio
30009288 g     F .text	00000010 period_thread_exit
3000fbb4 g     O .bss	00000004 thread_api
3000182c g     F .text	00000048 hal_atomic_add_comm
3000428c g     F .text	0000004c acoral_set_intr_exit
30004bd4 g     F .text	00000020 acoral_alloc_evt
30007da8 g     F .text	000000bc acoral_msgctr_init
30004af8 g     F .text	0000001c spin_lock_intr
3000159c g       .text	00000000 HAL_INTR_SWITCH_TO
3000151c g       .text	00000000 MMU_InvalidateICacheMVA
00000200 g       *ABS*	00000000 IRQ_stack_size
30007a58 g     F .text	00000108 acoral_sem_post
3000db34 g     F .text	00000018 console_open
30009298 g     F .text	00000080 period_policy_init
3000b91c g     F .text	00000064 acoral_str_len
3000e9c4 g     O .text	00000025 small_digits
30001fb8 g     F .text	00000050 acoral_sched_init
30000d84 g     F .text	00000030 nand_init
3000dd44 g     F .text	000001bc __aeabi_fadd
300021ac g     F .text	000000c4 acoral_get_idle_maskcpu
3000dd40 g     F .text	000001c0 __subsf3
300027ec g     F .text	00000034 acoral_suspend_thread_by_id
30002a38 g     F .text	00000030 acoral_kill_thread_by_id
3000d9a0 g     F .text	0000003c uart_write
30009cdc g     F .text	0000000c dummy_print
3000b510 g     F .text	0000004c acoral_getchar
300026b0 g     F .text	00000074 acoral_release_thread1
3000c650 g     F .text	0000009c acoral_memcmp
3000bf18 g     F .text	000000c0 acoral_str_ncmp
3000fbb8 g     O .bss	00000034 mem_ctrl
30002c58 g     F .text	00000020 acoral_alloc_thread
3000a0c8 g     F .text	000000c8 acoral_prio_queue_init
300039cc g     F .text	000000a4 acoral_pools_init
3000e3d8 g     F .text	00000018 __aeabi_fcmpgt
3000253c g     F .text	000000ac acoral_real_intr_sched
30006e54 g     F .text	000002a4 v_free
300018c8 g     F .text	000000d0 daem
30000984 g     F .text	00000084 flush_cache
30004908 g     F .text	00000064 timeout_queue_del
300011c0 g     F .text	000002bc nand_read
3000fbec g     O .bss	00000038 acoral_thread_pool_ctrl
300042d8 g     F .text	0000004c acoral_set_intr_mask
3000fc24 g     O .bss	00000038 acoral_drv_pool_ctrl
30002028 g     F .text	00000020 acoral_set_orig_thread
3000cd78 g     F .text	000001c8 get_cmd
3000ecf4 g     O .data	00000010 spg_cmd
300070f8 g     F .text	000000bc v_mem_init
3000cff8 g     F .text	0000009c acoral_shell_enter
3000d4a0 g     F .text	000000d8 acoral_drv_register
3000b980 g     F .text	0000006c acoral_str_cpy
3000dc20 g     F .text	000000f4 __udivsi3
300015dc g       .text	00000000 HAL_INTR_CTX_SWITCH
3000df08 g     F .text	00000020 __aeabi_i2f
300075c0 g     F .text	0000009c acoral_mbox_tryrecv
30000000 g       .text	00000000 __ENTRY
30003b78 g     F .text	00000040 acoral_obj_pool_init
3000a88c g     F .text	00000b38 vsnprintf
300014cc g       .text	00000000 MMU_DisableAlignFault
3000e2e4 g     F .text	0000006c __lesf2
30007bb8 g     F .text	000000ac acoral_msg_sys_init
300016d8 g       .text	00000000 HAL_INTR_DISABLE
30004c24 g     F .text	00000038 acoral_evt_queue_empty
3000a2ec g     F .text	00000088 skip_atoi
3000d7c4 g     F .text	00000094 acoral_dev_config
3000400c g     F .text	000001a8 acoral_intr_entry
30003870 g     F .text	00000078 acoral_get_res_by_id
30001f5c g     F .text	0000003c acoral_sched_policy_init
300076cc g     F .text	00000078 acoral_sem_create
3000d200 g     F .text	00000214 display_thread
30001e60 g     F .text	0000002c acoral_register_sched_policy
3000c33c g     F .text	0000008c acoral_str_pbrk
300017d4 g     F .text	0000002c hal_sched_bridge_comm
30007eec g     F .text	00000068 acoral_msg_assign
30009f18 g     F .text	0000005c acoral_get_bit
3000ec88 g     O .data	00000028 right
3000fc5c g     O .bss	0000000c acoral_threads_queue
3000fc68 g     O .bss	00000004 thread
3000a1dc g     F .text	0000004c acoral_list_add2_tail
3000b70c g     F .text	00000064 acoral_tolower
3000fc6c g     O .bss	00000058 orig_thread
3000a190 g     F .text	0000004c acoral_list_add
3000b9ec g     F .text	000000f0 acoral_str_cmp
300038e8 g     F .text	000000e4 acoral_pool_res_init
00000200 g       *ABS*	00000000 SVC_stack_size
3000fcc4 g     O .bss	0000000c tmp_rm_queue
30003cbc g     F .text	000000b0 acoral_intr_sys_init
30000c04 g     F .text	000000ac hal_mmu_setmtt
30009a68 g     F .text	00000058 posix_policy_data_init
3000fcd0 g     O .bss	00000004 acoral_mem_blocks
3000e2ec g     F .text	00000064 __nesf2
30004aa8 g     F .text	0000002c spin_lock_intr_save
30004e14 g     F .text	00000088 acoral_mutex_create
33ffff00 g       *ABS*	00000000 stack_base
30007448 g     F .text	00000178 acoral_mbox_recv
3000bc80 g     F .text	0000008c acoral_str_lcpy
3000a094 g     F .text	00000034 acoral_get_highprio
3000155c g       .text	00000000 MMU_WaitForInterrupt
3000bd98 g     F .text	000000c8 acoral_str_ncat
3000fcd4 g     O .bss	00000004 sample_100ms
3001065c g       *ABS*	00000000 heap_start
300043b8 g     F .text	00000110 acoral_fault_entry
3000cd50 g     F .text	00000028 echo
30002be8 g     F .text	00000040 acoral_thread_move2_tail
3000d0b4 g     F .text	00000020 malloc_scan2
3000c8e0 g     F .text	00000020 acoral_rand_start
30004f28 g     F .text	000000d8 acoral_mutex_trypend
3000fcd8 g     O .bss	00000014 console_ops
3000fcec g     O .bss	00000008 left
3000c89c g     F .text	00000044 acoral_rand
30002f8c g     F .text	000000d0 create_comm_thread
30003c04 g     F .text	00000028 acoral_free_obj
3000dd40 g     F .text	000001c0 __aeabi_fsub
00000100 g       *ABS*	00000000 Abort_stack_size
30002bac g     F .text	0000003c acoral_unrdy_thread
30002048 g     F .text	00000054 acoral_set_running_thread
3000a374 g     F .text	00000518 number
3000ece4 g     O .data	00000010 exit_cmd
3000496c g     F .text	0000010c timeout_delay_deal
30008c78 g     F .text	00000064 rm_policy_init
3000e3c0 g     F .text	00000018 __aeabi_fcmpge
300034f4 g     F .text	0000012c acoral_get_res
30007c94 g     F .text	00000020 acoral_alloc_msgctr
300016c8 g       .text	00000000 HAL_INTR_ENABLE
300016f4 g       .text	00000000 HAL_INTR_DISABLE_SAVE
30002820 g     F .text	00000034 acoral_resume_thread_by_id
3000df38 g     F .text	000000ac __floatdisf
3000e9ec g     O .text	00000025 large_digits
30009780 g     F .text	000000c0 acoral_posix_create
30001a98 g     F .text	00000050 acoral_start
3000c934 g     F .text	00000240 parse_args
3000fcf4 g     O .bss	00000004 daemon_id
3000fcf8 g     O .bss	0000000c period_delay_queue
3000e2dc g     F .text	00000074 __gtsf2
30004c5c g     F .text	00000050 acoral_evt_high_thread
30005448 g     F .text	000001a8 acoral_mutex_post
300014ac g       .text	00000000 MMU_DisableDCache
3000fd04 g     O .bss	00000004 head_cmd
3000fd08 g     O .bss	0000000c acoral_res_release_queue
3000e3a8 g     F .text	00000018 __aeabi_fcmple
3000cb74 g     F .text	00000064 add_command
30003bb8 g     F .text	00000020 acoral_obj_pool_release
30008590 g     F .text	00000038 acoral_msg_del
30007cb4 g     F .text	00000020 acoral_alloc_msg
3000c450 g     F .text	00000070 acoral_memset
30007c64 g     F .text	00000030 acoral_msgctr_list_queueadd
33fffd00 g       *ABS*	00000000 ABT_stack
3000ecd4 g     O .data	00000010 help_cmd
3000d414 g     F .text	0000008c acoral_get_drv_ctrl_by_name
30001be4 g     F .text	00000040 acoral_start_os
300071b4 g     F .text	000000e4 v_mem_scan
30009b78 g     F .text	00000024 delay_task
300031b8 g     F .text	00000164 acoral_create_pool
3000c808 g     F .text	00000094 acoral_memchr
30001534 g       .text	00000000 MMU_InvalidateDCacheMVA
3000c29c g     F .text	000000a0 acoral_str_cspn
3000fd14 g     O .bss	00000820 acoral_pools
30003620 g     F .text	00000188 acoral_release_res
3000cbd8 g     F .text	00000074 find_cmd
3000765c g     F .text	00000070 acoral_sem_init
30008cdc g     F .text	000000b4 rm_end
300014bc g       .text	00000000 MMU_EnableAlignFault
3000db4c g     F .text	00000074 uart_init
3000c048 g     F .text	0000008c acoral_str_rchr
3000db04 g     F .text	00000030 console_config
30007298 g     F .text	00000068 acoral_mbox_create
30002344 g     F .text	000000cc acoral_rdyqueue_del
30007f54 g     F .text	000000e8 acoral_msgctr_create
30002b04 g     F .text	00000030 acoral_change_prio_self
30001524 g       .text	00000000 MMU_PrefetchICacheMVA
30009ac0 g     F .text	00000064 posix_policy_init
300018bc g     F .text	0000000c idle
30002c28 g     F .text	00000030 acoral_thread_move2_tail_by_id
30003e3c g     F .text	000000e8 acoral_intr_unmask
30007744 g     F .text	000000b0 acoral_sem_del
30005000 g     F .text	00000260 acoral_mutex_pend
30001504 g       .text	00000000 MMU_SetDomain
3000b7d4 g     F .text	000000a8 acoral_str_upr
30010534 g     O .bss	00000038 acoral_msg_pool_ctrl
3001065c g       *ABS*	00000000 bss_end
3000df08 g     F .text	00000020 __floatsisf
30009840 g     F .text	00000200 posix_policy_thread_init
30002a88 g     F .text	0000007c acoral_thread_change_prio
30001574 g       .text	00000000 MMU_InvalidateITLBMVA
30002a68 g     F .text	00000020 acoral_thread_exit
3000cccc g     F .text	00000084 cmd_exe
00000000 g       *ABS*	00000000 FIQ_stack_size
30002b70 g     F .text	0000003c acoral_rdy_thread
3000bd0c g     F .text	0000008c acoral_str_cat
300017b8 g     F .text	0000001c hal_intr_nesting_inc_comm
3000e2ec g     F .text	00000064 __eqsf2
30009510 g     F .text	0000007c slice_delay_deal
30004e9c g     F .text	0000008c acoral_mutex_del
30007370 g     F .text	000000d8 acoral_mbox_send
3000d094 g     F .text	00000020 malloc_scan
3000c6ec g     F .text	00000070 acoral_memscan
30001774 g     F .text	00000044 hal_intr_nesting_dec_comm
30008940 g     F .text	00000158 rm_check
300025e8 g     F .text	000000c8 acoral_select_thread
00000200 g       *ABS*	00000000 SYS_stack_size
3000ed14 g       .bss	00000000 bss_start
3000e17c g     F .text	00000160 __aeabi_fdiv
300055f0 g     F .text	00000178 buddy_scan
30007b60 g     F .text	00000058 acoral_sem_getnum
3000d93c g     F .text	00000054 acoral_drv_sys_init
30009eb4 g     F .text	00000064 acoral_clear_bit
3001056c g     O .bss	00000004 idle_id
3000d8d4 g     F .text	00000020 acoral_alloc_drv
3000df28 g     F .text	000000bc __floatundisf
30009ce8 g     F .text	000000e0 acoral_ffs
33fffc00 g       *ABS*	00000000 UDF_stack
30004d70 g     F .text	00000034 acoral_evt_queue_del
30001998 g     F .text	00000100 init
3000d578 g     F .text	00000088 acoral_drv_unregister
3000dd34  w    F .text	00000004 __aeabi_ldiv0
30008f74 g     F .text	00000028 period_policy_thread_release
30004bf4 g     F .text	00000030 acoral_evt_init
3000b55c g     F .text	00000054 acoral_putchar
3000b5b0 g     F .text	000000c4 acoral_debug
30001e8c g     F .text	0000007c acoral_policy_delay_deal
3000df00 g     F .text	00000028 __aeabi_ui2f
3000be60 g     F .text	000000b8 acoral_str_lcat
3000da98 g     F .text	0000006c console_read
3000bbf0 g     F .text	00000090 acoral_str_ncpy
3000c544 g     F .text	0000010c acoral_memmove
30004800 g     F .text	00000108 timeout_queue_add
30010570 g     O .bss	0000000c policy_list
3001057c g     O .bss	00000004 acoral_mem_ctrl
3000d600 g     F .text	00000094 acoral_dev_open
30008d90 g     F .text	000001e4 period_policy_thread_init
30010580 g     O .bss	0000001c rm_policy
30007d70 g     F .text	00000038 acoral_msg_queue_add
3000e2ec g     F .text	00000064 __cmpsf2
3000c3c8 g     F .text	00000088 acoral_str_sep
30009b9c g     F .text	0000005c acoral_soft_delay
30002114 g     F .text	00000098 acoral_get_idlest_cpu
30004b30 g     F .text	00000020 spin_lock_stamp
30002c78 g     F .text	0000022c acoral_thread_init
30001644 g       .text	00000000 HAL_CONTEXT_SWITCH
30008848 g     F .text	00000044 rm_discard_thread
3000df38 g     F .text	000000ac __aeabi_l2f
00000100 g       *ABS*	00000000 Undef_stack_size
33f00000 g       *ABS*	00000000 MMU_base
3001059c g     O .bss	00000004 init_id
30001c4c g     F .text	000000d4 create_thread_ext
300105a0 g     O .bss	0000000c time_delay_queue
3000e2e4 g     F .text	0000006c __ltsf2
30002f78 g     F .text	00000014 acoral_thread_sys_init
3000dc20 g     F .text	00000000 __aeabi_uidiv
30004b14 g     F .text	0000001c spin_unlock_intr
30009a40 g     F .text	00000028 posix_policy_thread_release
30002410 g     F .text	00000080 acoral_sched
30002854 g     F .text	00000054 acoral_resume_thread
30000000 g       .text	00000000 text_start
3000cf40 g     F .text	00000094 acoral_shell_init
300105ac g     O .bss	00000038 acoral_evt_pool_ctrl
3000df28 g     F .text	000000bc __aeabi_ul2f
300105e4 g     O .bss	00000038 acoral_msgctr_pool_ctrl
33fff900 g       *ABS*	00000000 SYS_stack
3000299c g     F .text	0000009c acoral_kill_thread
300041c4 g     F .text	0000007c acoral_intr_exit
30009e54 g     F .text	00000060 acoral_set_bit
3000e360 g     F .text	00000018 __aeabi_cfcmple
3000d0d4 g     F .text	0000006c help
3000dfe4 g     F .text	00000198 __mulsf3
30004da4 g     F .text	00000070 acoral_mutex_init
30001554 g       .text	00000000 MMU_CleanInvalidateDCacheIndex
300095f0 g     F .text	00000190 posix_delay_deal
30009dc8 g     F .text	0000008c acoral_find_first_bit
3000da1c g     F .text	0000007c console_write
3000ed04 g     O .data	00000010 dt_cmd
3000296c g     F .text	00000030 acoral_delay_self
30004cac g     F .text	000000c4 acoral_evt_queue_add
33eff000 g       *ABS*	00000000 heap_end
30009108 g     F .text	00000180 period_delay_deal
30009b24 g     F .text	00000054 delay
3001061c g     O .bss	0000000c timeout_queue
300003cc g     F .text	000000cc hal_all_entry
300027cc g     F .text	00000020 acoral_suspend_self
300041b4 g     F .text	00000010 acoral_default_isr
3000958c g     F .text	00000064 slice_policy_init
30001874 g     F .text	00000048 hal_atomic_sub_comm
3000e2dc g     F .text	00000074 __gesf2
30002490 g     F .text	000000ac acoral_real_sched
30000938 g     F .text	0000003c hal_ticks_delay
3000dd38 g     F .text	000001c8 __aeabi_frsub
3000d190 g     F .text	00000028 spg
300037a8 g     F .text	00000064 acoral_get_pool_by_id
30001584 g       .text	00000000 MMU_SetProcessId
3000e378 g     F .text	00000018 __aeabi_fcmpeq
3000dfe4 g     F .text	00000198 __aeabi_fmul
3000209c g     F .text	00000078 acoral_thread_runqueue_init
3000b3c4 g     F .text	00000060 acoral_sprint
30004570 g     F .text	00000050 acoral_ticks_entry
3000e350 g     F .text	00000028 __aeabi_cfrcmple
3000c0d4 g     F .text	0000009c acoral_str_nchr
3000305c g     F .text	00000100 comm_policy_thread_init
3000c1e4 g     F .text	000000b8 acoral_str_spn
30001760 g     F .text	00000014 hal_get_intr_nesting_comm
300086d8 g     F .text	00000148 rm_policy_thread_init
30001fa8 g     F .text	00000010 app_exit_policy_init
30010628 g     O .bss	00000004 ready_thread
3000ecc4 g     O .data	00000010 mem2_cmd
3000b87c g     F .text	000000a0 acoral_str_lwr
30003a70 g     F .text	00000108 acoral_pool_ctrl_init
30001564 g       .text	00000000 MMU_InvalidateTLB
3000d858 g     F .text	0000007c acoral_dev_close
300065b4 g     F .text	000000e0 buddy_malloc
3000e390 g     F .text	00000018 __aeabi_fcmplt
3000cfd4 g     F .text	00000024 acoral_shell_exit
3000154c g       .text	00000000 MMU_CleanDCacheIndex
3000156c g       .text	00000000 MMU_InvalidateITLB
300080d8 g     F .text	00000114 acoral_msg_send
3000c904 g     F .text	0000002c dummy
3000dd14 g     F .text	00000020 __aeabi_uidivmod
30001da0 g     F .text	000000c0 acoral_policy_thread_init
3000003c g       .text	00000000 HandleIRQ
30008a98 g     F .text	0000014c rm_thread_dispatch
30002270 g     F .text	000000d4 acoral_rdyqueue_add
3000153c g       .text	00000000 MMU_CleanDCacheMVA
3000149c g       .text	00000000 MMU_EnableDCache
30003c3c g     F .text	00000080 acoral_assert_res
3000ed14 g     O .bss	00000004 acoral_start_sched
3000a228 g     F .text	00000050 acoral_list_del
30008be4 g     F .text	00000094 rm_init
30004504 g     F .text	00000014 acoral_get_ticks
30006694 g     F .text	000004b8 buddy_free
300014fc g       .text	00000000 MMU_SetTTBase
3001062c g     O .bss	00000004 intr_nesting
30004538 g     F .text	00000038 acoral_ticks_init
3000d9dc g     F .text	00000040 uart_read
30004b7c g     F .text	00000058 acoral_evt_pool_init
3000d1b8 g     F .text	00000048 cmd_init
3000c930 g     F .text	00000004 user_main
300045c0 g     F .text	0000012c acoral_delayqueue_add
3000888c g     F .text	000000b4 rm_queue_ascend_add
3000badc g     F .text	00000114 acoral_str_nicmp
3000d140 g     F .text	00000050 exit
3000ec7c g     O .data	00000004 acoral_doMsgTtl_checked
300090a8 g     F .text	00000060 period_thread_delay
33ffff00 g       *ABS*	00000000 IRQ_stack
3000df00 g     F .text	00000028 __floatunsisf
3000e360 g     F .text	00000018 __aeabi_cfcmpeq
30002008 g     F .text	00000020 acoral_sched_unlock
30005768 g     F .text	000007a0 buddy_init
30001d20 g     F .text	00000080 acoral_get_policy_ctrl
300077f4 g     F .text	000000b8 acoral_sem_trypend
30004370 g     F .text	00000048 acoral_intr_set_type
3000dd34  w    F .text	00000004 __aeabi_idiv0
30001f08 g     F .text	00000054 acoral_policy_thread_release
30010630 g     O .bss	00000004 running_thread
30007cd4 g     F .text	0000009c acoral_msgctr_queue_add
30001f98 g     F .text	00000010 app_enter_policy_init
30003d6c g     F .text	0000007c acoral_intr_attach
3000331c g     F .text	000000e0 acoral_release_pool
300046ec g     F .text	00000114 time_delay_deal
30003de8 g     F .text	00000054 acoral_intr_detach
3000380c g     F .text	00000064 acoral_get_free_pool
3000171c g     F .text	00000044 hal_intr_nesting_init_comm
30002f48 g     F .text	00000030 acoral_sched_mechanism_init
300094e8 g     F .text	00000028 slice_policy_thread_release
3000b424 g     F .text	0000008c acoral_print
30003bd8 g     F .text	0000002c acoral_get_obj
300081ec g     F .text	00000258 acoral_msg_recv
30008f9c g     F .text	0000010c acoral_periodqueue_add
30010634 g     O .bss	00000001 need_sched
3000ec84 g     O .data	00000004 rm_queue
30000864 g     F .text	000000d4 hal_ticks_init
3000bfd8 g     F .text	00000070 acoral_str_chr
30009bf8 g     F .text	000000e4 soft_delay_init
3000d72c g     F .text	00000098 acoral_dev_read
30001544 g       .text	00000000 MMU_CleanInvalidateDCacheMVA
30010638 g     O .bss	0000001c period_policy
30003f24 g     F .text	000000e8 acoral_intr_mask
30010654 g     O .bss	00000004 sample
3000803c g     F .text	0000009c acoral_msg_create
30000768 g     F .text	000000fc hal_intr_init
3000315c g     F .text	0000005c comm_policy_init
3000cc4c g     F .text	00000080 execmd
3000c170 g     F .text	00000074 acoral_str_nlen
30009ffc g     F .text	00000098 acoral_prio_queue_del
3000b4b0 g     F .text	00000060 acoral_prints
3000c75c g     F .text	000000ac acoral_strstr
300085c8 g     F .text	00000050 wake_up_thread
300086a8 g     F .text	00000030 acoral_print_waitThreadsNum
30004518 g     F .text	00000020 acoral_set_ticks
33ffff00 g       *ABS*	00000000 FIQ_stack
30006510 g     F .text	000000a4 buddy_malloc_size
30009318 g     F .text	000001d0 slice_policy_thread_init
3000d8f4 g     F .text	00000048 acoral_drv_pool_init
3000158c g       .text	00000000 HAL_SWITCH_TO
3000dd44 g     F .text	000001bc __addsf3
30004324 g     F .text	0000004c acoral_set_intr_unmask
30010658 g     O .bss	00000004 tail_cmd
30001c24 g     F .text	00000028 acoral_module_init
300078ac g     F .text	000001ac acoral_sem_pend
30004240 g     F .text	0000004c acoral_set_intr_enter
30006e00 g     F .text	00000054 v_malloc
30008444 g     F .text	0000014c acoral_msgctr_del
33fffb00 g       *ABS*	00000000 SVC_stack
30003c2c g     F .text	00000010 acoral_res_sys_init
3000147c g       .text	00000000 MMU_EnableICache
3000152c g       .text	00000000 MMU_InvalidateDCache


