
acoral.elf:     file format elf32-littlearm
acoral.elf
architecture: arm, flags 0x00000112:
EXEC_P, HAS_SYMS, D_PAGED
start address 0x30000000

Program Header:
    LOAD off    0x00008000 vaddr 0x30000000 paddr 0x30000000 align 2**15
         filesz 0x0000ecfc memsz 0x00010644 flags rwx
private flags = 5000002: [Version5 EABI] [has entry point]

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         0000ec64  30000000  30000000  00008000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000098  3000ec64  3000ec64  00016c64  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00001948  3000ecfc  3000ecfc  00016cfc  2**2
                  ALLOC
  3 .ARM.attributes 0000002e  00000000  00000000  00016cfc  2**0
                  CONTENTS, READONLY
  4 .comment      00000739  00000000  00000000  00016d2a  2**0
                  CONTENTS, READONLY
  5 .debug_aranges 00000560  00000000  00000000  00017463  2**0
                  CONTENTS, READONLY, DEBUGGING
  6 .debug_pubnames 00002039  00000000  00000000  000179c3  2**0
                  CONTENTS, READONLY, DEBUGGING
  7 .debug_info   0000c4bb  00000000  00000000  000199fc  2**0
                  CONTENTS, READONLY, DEBUGGING
  8 .debug_abbrev 0000339e  00000000  00000000  00025eb7  2**0
                  CONTENTS, READONLY, DEBUGGING
  9 .debug_line   0000367e  00000000  00000000  00029255  2**0
                  CONTENTS, READONLY, DEBUGGING
 10 .debug_frame  000021cc  00000000  00000000  0002c8d4  2**2
                  CONTENTS, READONLY, DEBUGGING
 11 .debug_str    0000232e  00000000  00000000  0002eaa0  2**0
                  CONTENTS, READONLY, DEBUGGING
 12 .debug_loc    00002e12  00000000  00000000  00030dce  2**0
                  CONTENTS, READONLY, DEBUGGING
SYMBOL TABLE:
30000000 l    d  .text	00000000 .text
3000ec64 l    d  .data	00000000 .data
3000ecfc l    d  .bss	00000000 .bss
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
3000ed00 l       .bss	00000000 acoral_ready_queues
00000000 l    df *ABS*	00000000 thread.c
3000289c l     F .text	0000008c acoral_delay_thread
30002928 l     F .text	00000038 acoral_delay_thread_by_id
00000000 l    df *ABS*	00000000 comm_thrd.c
00000000 l    df *ABS*	00000000 resource.c
00000000 l    df *ABS*	00000000 int.c
00000000 l    df *ABS*	00000000 timer.c
3000f064 l       .bss	00000000 ticks
00000000 l    df *ABS*	00000000 mem.c
00000000 l    df *ABS*	00000000 spinlock.c
00000000 l    df *ABS*	00000000 event.c
00000000 l    df *ABS*	00000000 mutex.c
00000000 l    df *ABS*	00000000 buddy.c
30005efc l     F .text	000002a8 recus_malloc
300061a4 l     F .text	00000360 r_malloc
00000000 l    df *ABS*	00000000 malloc.c
30006b40 l     F .text	000002b4 r_malloc
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
3000a26c l     F .text	00000074 do_div
3000f468 l       .bss	00000000 print_buf.2126
3000ec98 l     O .data	00000004 console_id
3000f068 l       .bss	00000000 print_buf.2163
00000000 l    df *ABS*	00000000 str.c
00000000 l    df *ABS*	00000000 random.c
3000f568 l       .bss	00000000 rand_seed
00000000 l    df *ABS*	00000000 plugin.c
00000000 l    df *ABS*	00000000 user.c
00000000 l    df *ABS*	00000000 shell.c
00000000 l    df *ABS*	00000000 cmd.c
00000000 l    df *ABS*	00000000 thread_display.c
00000000 l    df *ABS*	00000000 driver.c
00000000 l    df *ABS*	00000000 brd_driver.c
00000000 l    df *ABS*	00000000 con_uart.c
3000dc14 l       .text	00000000 .udivsi3_nodiv0
3000dbb4 g     F .text	00000060 con_uart_init
300072f4 g     F .text	00000070 acoral_mbox_del
30004a6c g     F .text	00000030 acoral_mem_sys_init
30004b60 g     F .text	00000010 acoral_evt_sys_init
3000860c g     F .text	00000090 acoral_print_all_msg
30005254 g     F .text	000001e8 acoral_mutex_pend2
3000f56c g     O .bss	0000000c g_msgctr_header
3000f578 g     O .bss	00000050 drv_table
3000d984 g     F .text	00000010 brd_driver_init
3000f5c8 g     O .bss	0000001c comm_policy
3000f5e4 g     O .bss	00000004 acoral_free_res_pool
3000b764 g     F .text	00000064 acoral_toupper
3000276c g     F .text	00000054 acoral_suspend_thread
3000b668 g     F .text	00000098 acoral_debugs
3000f5e8 g     O .bss	0000001c posix_policy
3000c4b4 g     F .text	00000084 acoral_memcpy
30008814 g     F .text	00000028 rm_policy_thread_release
300014dc g       .text	00000000 MMU_EnableMMU
30004b44 g     F .text	0000001c spin_unlock_stamp
3000c8f4 g     F .text	00000004 plugin_init
300014ec g       .text	00000000 MMU_DisableMMU
30002e98 g     F .text	00000080 acoral_thread_pool_init
3000f604 g     O .bss	00000001 sched_lock
30002f18 g     F .text	00000024 acoral_set_thread_console
300033f0 g     F .text	000000f8 acoral_collect_pool
30009f68 g     F .text	00000088 acoral_prio_queue_add
30007e58 g     F .text	00000088 acoral_msg_init
3000150c g       .text	00000000 MMU_InvalidateIDCache
3000148c g       .text	00000000 MMU_DisableICache
300044bc g     F .text	0000003c acoral_time_sys_init
30001514 g       .text	00000000 MMU_InvalidateICache
3000f608 g     O .bss	00000578 intr_table
3000157c g       .text	00000000 MMU_InvalidateDTLB
3000e170 g     F .text	00000160 __divsf3
30001800 g     F .text	0000002c hal_intr_exit_bridge_comm
300016a8 g       .text	00000000 EXP_HANDLER
3000fb80 g     O .bss	0000001c slice_policy
30002b28 g     F .text	0000003c acoral_thread_change_prio_by_id
300016ec g       .text	00000000 HAL_INTR_RESTORE
3000d688 g     F .text	00000098 acoral_dev_write
30000974 g     F .text	00000010 hal_mem_init
300002c0 g     F .text	0000010c hal_stack_init
30001ad0 g     F .text	000000fc acoral_core_cpu_start
3000166c g       .text	00000000 HAL_INTR_ENTRY
3000ec9c g     O .data	00000010 mem_cmd
30004ac8 g     F .text	00000024 spin_unlock_intr_restore
30002718 g     F .text	00000054 acoral_release_thread
3000ec68 g     O .data	00000004 prio
3000927c g     F .text	00000010 period_thread_exit
3000fb9c g     O .bss	00000004 thread_api
3000182c g     F .text	00000048 hal_atomic_add_comm
30004280 g     F .text	0000004c acoral_set_intr_exit
30004bc8 g     F .text	00000020 acoral_alloc_evt
30007d9c g     F .text	000000bc acoral_msgctr_init
30004aec g     F .text	0000001c spin_lock_intr
3000159c g       .text	00000000 HAL_INTR_SWITCH_TO
3000151c g       .text	00000000 MMU_InvalidateICacheMVA
00000200 g       *ABS*	00000000 IRQ_stack_size
30007a4c g     F .text	00000108 acoral_sem_post
3000db28 g     F .text	00000018 console_open
3000928c g     F .text	00000080 period_policy_init
3000b910 g     F .text	00000064 acoral_str_len
3000e9ac g     O .text	00000025 small_digits
30001fac g     F .text	00000050 acoral_sched_init
30000d84 g     F .text	00000030 nand_init
3000dd38 g     F .text	000001bc __aeabi_fadd
300021a0 g     F .text	000000c4 acoral_get_idle_maskcpu
3000dd34 g     F .text	000001c0 __subsf3
300027e0 g     F .text	00000034 acoral_suspend_thread_by_id
30002a2c g     F .text	00000030 acoral_kill_thread_by_id
3000d994 g     F .text	0000003c uart_write
30009cd0 g     F .text	0000000c dummy_print
3000b504 g     F .text	0000004c acoral_getchar
300026a4 g     F .text	00000074 acoral_release_thread1
3000c644 g     F .text	0000009c acoral_memcmp
3000bf0c g     F .text	000000c0 acoral_str_ncmp
3000fba0 g     O .bss	00000034 mem_ctrl
30002c4c g     F .text	00000020 acoral_alloc_thread
3000a0bc g     F .text	000000c8 acoral_prio_queue_init
300039c0 g     F .text	000000a4 acoral_pools_init
3000e3cc g     F .text	00000018 __aeabi_fcmpgt
30002530 g     F .text	000000ac acoral_real_intr_sched
30006e48 g     F .text	000002a4 v_free
300018c8 g     F .text	000000d0 daem
30000984 g     F .text	00000084 flush_cache
300048fc g     F .text	00000064 timeout_queue_del
300011c0 g     F .text	000002bc nand_read
3000fbd4 g     O .bss	00000038 acoral_thread_pool_ctrl
300042cc g     F .text	0000004c acoral_set_intr_mask
3000fc0c g     O .bss	00000038 acoral_drv_pool_ctrl
3000201c g     F .text	00000020 acoral_set_orig_thread
3000cd6c g     F .text	000001c8 get_cmd
3000ecdc g     O .data	00000010 spg_cmd
300070ec g     F .text	000000bc v_mem_init
3000cfec g     F .text	0000009c acoral_shell_enter
3000d494 g     F .text	000000d8 acoral_drv_register
3000b974 g     F .text	0000006c acoral_str_cpy
3000dc14 g     F .text	000000f4 __udivsi3
300015dc g       .text	00000000 HAL_INTR_CTX_SWITCH
3000defc g     F .text	00000020 __aeabi_i2f
300075b4 g     F .text	0000009c acoral_mbox_tryrecv
30000000 g       .text	00000000 __ENTRY
30003b6c g     F .text	00000040 acoral_obj_pool_init
3000a880 g     F .text	00000b38 vsnprintf
300014cc g       .text	00000000 MMU_DisableAlignFault
3000e2d8 g     F .text	0000006c __lesf2
30007bac g     F .text	000000ac acoral_msg_sys_init
300016d8 g       .text	00000000 HAL_INTR_DISABLE
30004c18 g     F .text	00000038 acoral_evt_queue_empty
3000a2e0 g     F .text	00000088 skip_atoi
3000d7b8 g     F .text	00000094 acoral_dev_config
30004000 g     F .text	000001a8 acoral_intr_entry
30003864 g     F .text	00000078 acoral_get_res_by_id
30001f50 g     F .text	0000003c acoral_sched_policy_init
300076c0 g     F .text	00000078 acoral_sem_create
3000d1f4 g     F .text	00000214 display_thread
30001e54 g     F .text	0000002c acoral_register_sched_policy
3000c330 g     F .text	0000008c acoral_str_pbrk
300017d4 g     F .text	0000002c hal_sched_bridge_comm
30007ee0 g     F .text	00000068 acoral_msg_assign
30009f0c g     F .text	0000005c acoral_get_bit
3000ec70 g     O .data	00000028 right
3000fc44 g     O .bss	0000000c acoral_threads_queue
3000fc50 g     O .bss	00000004 thread
3000a1d0 g     F .text	0000004c acoral_list_add2_tail
3000b700 g     F .text	00000064 acoral_tolower
3000fc54 g     O .bss	00000058 orig_thread
3000a184 g     F .text	0000004c acoral_list_add
3000b9e0 g     F .text	000000f0 acoral_str_cmp
300038dc g     F .text	000000e4 acoral_pool_res_init
00000200 g       *ABS*	00000000 SVC_stack_size
3000fcac g     O .bss	0000000c tmp_rm_queue
30003cb0 g     F .text	000000b0 acoral_intr_sys_init
30000c04 g     F .text	000000ac hal_mmu_setmtt
30009a5c g     F .text	00000058 posix_policy_data_init
3000fcb8 g     O .bss	00000004 acoral_mem_blocks
3000e2e0 g     F .text	00000064 __nesf2
30004a9c g     F .text	0000002c spin_lock_intr_save
30004e08 g     F .text	00000088 acoral_mutex_create
33ffff00 g       *ABS*	00000000 stack_base
3000743c g     F .text	00000178 acoral_mbox_recv
3000bc74 g     F .text	0000008c acoral_str_lcpy
3000a088 g     F .text	00000034 acoral_get_highprio
3000155c g       .text	00000000 MMU_WaitForInterrupt
3000bd8c g     F .text	000000c8 acoral_str_ncat
3000fcbc g     O .bss	00000004 sample_100ms
30010644 g       *ABS*	00000000 heap_start
300043ac g     F .text	00000110 acoral_fault_entry
3000cd44 g     F .text	00000028 echo
30002bdc g     F .text	00000040 acoral_thread_move2_tail
3000d0a8 g     F .text	00000020 malloc_scan2
3000c8d4 g     F .text	00000020 acoral_rand_start
30004f1c g     F .text	000000d8 acoral_mutex_trypend
3000fcc0 g     O .bss	00000014 console_ops
3000fcd4 g     O .bss	00000008 left
3000c890 g     F .text	00000044 acoral_rand
30002f80 g     F .text	000000d0 create_comm_thread
30003bf8 g     F .text	00000028 acoral_free_obj
3000dd34 g     F .text	000001c0 __aeabi_fsub
00000100 g       *ABS*	00000000 Abort_stack_size
30002ba0 g     F .text	0000003c acoral_unrdy_thread
3000203c g     F .text	00000054 acoral_set_running_thread
3000a368 g     F .text	00000518 number
3000eccc g     O .data	00000010 exit_cmd
30004960 g     F .text	0000010c timeout_delay_deal
30008c6c g     F .text	00000064 rm_policy_init
3000e3b4 g     F .text	00000018 __aeabi_fcmpge
300034e8 g     F .text	0000012c acoral_get_res
30007c88 g     F .text	00000020 acoral_alloc_msgctr
300016c8 g       .text	00000000 HAL_INTR_ENABLE
300016f4 g       .text	00000000 HAL_INTR_DISABLE_SAVE
30002814 g     F .text	00000034 acoral_resume_thread_by_id
3000df2c g     F .text	000000ac __floatdisf
3000e9d4 g     O .text	00000025 large_digits
30009774 g     F .text	000000c0 acoral_posix_create
30001a8c g     F .text	00000044 acoral_start
3000c928 g     F .text	00000240 parse_args
3000fcdc g     O .bss	00000004 daemon_id
3000fce0 g     O .bss	0000000c period_delay_queue
3000e2d0 g     F .text	00000074 __gtsf2
30004c50 g     F .text	00000050 acoral_evt_high_thread
3000543c g     F .text	000001a8 acoral_mutex_post
300014ac g       .text	00000000 MMU_DisableDCache
3000fcec g     O .bss	00000004 head_cmd
3000fcf0 g     O .bss	0000000c acoral_res_release_queue
3000e39c g     F .text	00000018 __aeabi_fcmple
3000cb68 g     F .text	00000064 add_command
30003bac g     F .text	00000020 acoral_obj_pool_release
30008584 g     F .text	00000038 acoral_msg_del
30007ca8 g     F .text	00000020 acoral_alloc_msg
3000c444 g     F .text	00000070 acoral_memset
30007c58 g     F .text	00000030 acoral_msgctr_list_queueadd
33fffd00 g       *ABS*	00000000 ABT_stack
3000ecbc g     O .data	00000010 help_cmd
3000d408 g     F .text	0000008c acoral_get_drv_ctrl_by_name
30001bcc g     F .text	00000040 acoral_start_os
300071a8 g     F .text	000000e4 v_mem_scan
30009b6c g     F .text	00000024 delay_task
300031ac g     F .text	00000164 acoral_create_pool
3000c7fc g     F .text	00000094 acoral_memchr
30001534 g       .text	00000000 MMU_InvalidateDCacheMVA
3000c290 g     F .text	000000a0 acoral_str_cspn
3000fcfc g     O .bss	00000820 acoral_pools
30003614 g     F .text	00000188 acoral_release_res
3000cbcc g     F .text	00000074 find_cmd
30007650 g     F .text	00000070 acoral_sem_init
30008cd0 g     F .text	000000b4 rm_end
300014bc g       .text	00000000 MMU_EnableAlignFault
3000db40 g     F .text	00000074 uart_init
3000c03c g     F .text	0000008c acoral_str_rchr
3000daf8 g     F .text	00000030 console_config
3000728c g     F .text	00000068 acoral_mbox_create
30002338 g     F .text	000000cc acoral_rdyqueue_del
30007f48 g     F .text	000000e8 acoral_msgctr_create
30002af8 g     F .text	00000030 acoral_change_prio_self
30001524 g       .text	00000000 MMU_PrefetchICacheMVA
30009ab4 g     F .text	00000064 posix_policy_init
300018bc g     F .text	0000000c idle
30002c1c g     F .text	00000030 acoral_thread_move2_tail_by_id
30003e30 g     F .text	000000e8 acoral_intr_unmask
30007738 g     F .text	000000b0 acoral_sem_del
30004ff4 g     F .text	00000260 acoral_mutex_pend
30001504 g       .text	00000000 MMU_SetDomain
3000b7c8 g     F .text	000000a8 acoral_str_upr
3001051c g     O .bss	00000038 acoral_msg_pool_ctrl
30010644 g       *ABS*	00000000 bss_end
3000defc g     F .text	00000020 __floatsisf
30009834 g     F .text	00000200 posix_policy_thread_init
30002a7c g     F .text	0000007c acoral_thread_change_prio
30001574 g       .text	00000000 MMU_InvalidateITLBMVA
30002a5c g     F .text	00000020 acoral_thread_exit
3000ccc0 g     F .text	00000084 cmd_exe
00000000 g       *ABS*	00000000 FIQ_stack_size
30002b64 g     F .text	0000003c acoral_rdy_thread
3000bd00 g     F .text	0000008c acoral_str_cat
300017b8 g     F .text	0000001c hal_intr_nesting_inc_comm
3000e2e0 g     F .text	00000064 __eqsf2
30009504 g     F .text	0000007c slice_delay_deal
30004e90 g     F .text	0000008c acoral_mutex_del
30007364 g     F .text	000000d8 acoral_mbox_send
3000d088 g     F .text	00000020 malloc_scan
3000c6e0 g     F .text	00000070 acoral_memscan
30001774 g     F .text	00000044 hal_intr_nesting_dec_comm
30008934 g     F .text	00000158 rm_check
300025dc g     F .text	000000c8 acoral_select_thread
00000200 g       *ABS*	00000000 SYS_stack_size
3000ecfc g       .bss	00000000 bss_start
3000e170 g     F .text	00000160 __aeabi_fdiv
300055e4 g     F .text	00000178 buddy_scan
30007b54 g     F .text	00000058 acoral_sem_getnum
3000d930 g     F .text	00000054 acoral_drv_sys_init
30009ea8 g     F .text	00000064 acoral_clear_bit
30010554 g     O .bss	00000004 idle_id
3000d8c8 g     F .text	00000020 acoral_alloc_drv
3000df1c g     F .text	000000bc __floatundisf
30009cdc g     F .text	000000e0 acoral_ffs
33fffc00 g       *ABS*	00000000 UDF_stack
30004d64 g     F .text	00000034 acoral_evt_queue_del
30001998 g     F .text	000000f4 init
3000d56c g     F .text	00000088 acoral_drv_unregister
3000dd28  w    F .text	00000004 __aeabi_ldiv0
30008f68 g     F .text	00000028 period_policy_thread_release
30004be8 g     F .text	00000030 acoral_evt_init
3000b550 g     F .text	00000054 acoral_putchar
3000b5a4 g     F .text	000000c4 acoral_debug
30001e80 g     F .text	0000007c acoral_policy_delay_deal
3000def4 g     F .text	00000028 __aeabi_ui2f
3000be54 g     F .text	000000b8 acoral_str_lcat
3000da8c g     F .text	0000006c console_read
3000bbe4 g     F .text	00000090 acoral_str_ncpy
3000c538 g     F .text	0000010c acoral_memmove
300047f4 g     F .text	00000108 timeout_queue_add
30010558 g     O .bss	0000000c policy_list
30010564 g     O .bss	00000004 acoral_mem_ctrl
3000d5f4 g     F .text	00000094 acoral_dev_open
30008d84 g     F .text	000001e4 period_policy_thread_init
30010568 g     O .bss	0000001c rm_policy
30007d64 g     F .text	00000038 acoral_msg_queue_add
3000e2e0 g     F .text	00000064 __cmpsf2
3000c3bc g     F .text	00000088 acoral_str_sep
30009b90 g     F .text	0000005c acoral_soft_delay
30002108 g     F .text	00000098 acoral_get_idlest_cpu
30004b24 g     F .text	00000020 spin_lock_stamp
30002c6c g     F .text	0000022c acoral_thread_init
30001644 g       .text	00000000 HAL_CONTEXT_SWITCH
3000883c g     F .text	00000044 rm_discard_thread
3000df2c g     F .text	000000ac __aeabi_l2f
00000100 g       *ABS*	00000000 Undef_stack_size
33f00000 g       *ABS*	00000000 MMU_base
30010584 g     O .bss	00000004 init_id
30001c40 g     F .text	000000d4 create_thread_ext
30010588 g     O .bss	0000000c time_delay_queue
3000e2d8 g     F .text	0000006c __ltsf2
30002f6c g     F .text	00000014 acoral_thread_sys_init
3000dc14 g     F .text	00000000 __aeabi_uidiv
30004b08 g     F .text	0000001c spin_unlock_intr
30009a34 g     F .text	00000028 posix_policy_thread_release
30002404 g     F .text	00000080 acoral_sched
30002848 g     F .text	00000054 acoral_resume_thread
30000000 g       .text	00000000 text_start
3000cf34 g     F .text	00000094 acoral_shell_init
30010594 g     O .bss	00000038 acoral_evt_pool_ctrl
3000df1c g     F .text	000000bc __aeabi_ul2f
300105cc g     O .bss	00000038 acoral_msgctr_pool_ctrl
33fff900 g       *ABS*	00000000 SYS_stack
30002990 g     F .text	0000009c acoral_kill_thread
300041b8 g     F .text	0000007c acoral_intr_exit
30009e48 g     F .text	00000060 acoral_set_bit
3000e354 g     F .text	00000018 __aeabi_cfcmple
3000d0c8 g     F .text	0000006c help
3000dfd8 g     F .text	00000198 __mulsf3
30004d98 g     F .text	00000070 acoral_mutex_init
30001554 g       .text	00000000 MMU_CleanInvalidateDCacheIndex
300095e4 g     F .text	00000190 posix_delay_deal
30009dbc g     F .text	0000008c acoral_find_first_bit
3000da10 g     F .text	0000007c console_write
3000ecec g     O .data	00000010 dt_cmd
30002960 g     F .text	00000030 acoral_delay_self
30004ca0 g     F .text	000000c4 acoral_evt_queue_add
33eff000 g       *ABS*	00000000 heap_end
300090fc g     F .text	00000180 period_delay_deal
30009b18 g     F .text	00000054 delay
30010604 g     O .bss	0000000c timeout_queue
300003cc g     F .text	000000cc hal_all_entry
300027c0 g     F .text	00000020 acoral_suspend_self
300041a8 g     F .text	00000010 acoral_default_isr
30009580 g     F .text	00000064 slice_policy_init
30001874 g     F .text	00000048 hal_atomic_sub_comm
3000e2d0 g     F .text	00000074 __gesf2
30002484 g     F .text	000000ac acoral_real_sched
30000938 g     F .text	0000003c hal_ticks_delay
3000dd2c g     F .text	000001c8 __aeabi_frsub
3000d184 g     F .text	00000028 spg
3000379c g     F .text	00000064 acoral_get_pool_by_id
30001584 g       .text	00000000 MMU_SetProcessId
3000e36c g     F .text	00000018 __aeabi_fcmpeq
3000dfd8 g     F .text	00000198 __aeabi_fmul
30002090 g     F .text	00000078 acoral_thread_runqueue_init
3000b3b8 g     F .text	00000060 acoral_sprint
30004564 g     F .text	00000050 acoral_ticks_entry
3000e344 g     F .text	00000028 __aeabi_cfrcmple
3000c0c8 g     F .text	0000009c acoral_str_nchr
30003050 g     F .text	00000100 comm_policy_thread_init
3000c1d8 g     F .text	000000b8 acoral_str_spn
30001760 g     F .text	00000014 hal_get_intr_nesting_comm
300086cc g     F .text	00000148 rm_policy_thread_init
30001f9c g     F .text	00000010 app_exit_policy_init
30010610 g     O .bss	00000004 ready_thread
3000ecac g     O .data	00000010 mem2_cmd
3000b870 g     F .text	000000a0 acoral_str_lwr
30003a64 g     F .text	00000108 acoral_pool_ctrl_init
30001564 g       .text	00000000 MMU_InvalidateTLB
3000d84c g     F .text	0000007c acoral_dev_close
300065a8 g     F .text	000000e0 buddy_malloc
3000e384 g     F .text	00000018 __aeabi_fcmplt
3000cfc8 g     F .text	00000024 acoral_shell_exit
3000154c g       .text	00000000 MMU_CleanDCacheIndex
3000156c g       .text	00000000 MMU_InvalidateITLB
300080cc g     F .text	00000114 acoral_msg_send
3000c8f8 g     F .text	0000002c dummy
3000dd08 g     F .text	00000020 __aeabi_uidivmod
30001d94 g     F .text	000000c0 acoral_policy_thread_init
3000003c g       .text	00000000 HandleIRQ
30008a8c g     F .text	0000014c rm_thread_dispatch
30002264 g     F .text	000000d4 acoral_rdyqueue_add
3000153c g       .text	00000000 MMU_CleanDCacheMVA
3000149c g       .text	00000000 MMU_EnableDCache
30003c30 g     F .text	00000080 acoral_assert_res
3000ecfc g     O .bss	00000004 acoral_start_sched
3000a21c g     F .text	00000050 acoral_list_del
30008bd8 g     F .text	00000094 rm_init
300044f8 g     F .text	00000014 acoral_get_ticks
30006688 g     F .text	000004b8 buddy_free
300014fc g       .text	00000000 MMU_SetTTBase
30010614 g     O .bss	00000004 intr_nesting
3000452c g     F .text	00000038 acoral_ticks_init
3000d9d0 g     F .text	00000040 uart_read
30004b70 g     F .text	00000058 acoral_evt_pool_init
3000d1ac g     F .text	00000048 cmd_init
3000c924 g     F .text	00000004 user_main
300045b4 g     F .text	0000012c acoral_delayqueue_add
30008880 g     F .text	000000b4 rm_queue_ascend_add
3000bad0 g     F .text	00000114 acoral_str_nicmp
3000d134 g     F .text	00000050 exit
3000ec64 g     O .data	00000004 acoral_doMsgTtl_checked
3000909c g     F .text	00000060 period_thread_delay
33ffff00 g       *ABS*	00000000 IRQ_stack
3000def4 g     F .text	00000028 __floatunsisf
3000e354 g     F .text	00000018 __aeabi_cfcmpeq
30001ffc g     F .text	00000020 acoral_sched_unlock
3000575c g     F .text	000007a0 buddy_init
30001d14 g     F .text	00000080 acoral_get_policy_ctrl
300077e8 g     F .text	000000b8 acoral_sem_trypend
30004364 g     F .text	00000048 acoral_intr_set_type
3000dd28  w    F .text	00000004 __aeabi_idiv0
30001efc g     F .text	00000054 acoral_policy_thread_release
30010618 g     O .bss	00000004 running_thread
30007cc8 g     F .text	0000009c acoral_msgctr_queue_add
30001f8c g     F .text	00000010 app_enter_policy_init
30003d60 g     F .text	0000007c acoral_intr_attach
30003310 g     F .text	000000e0 acoral_release_pool
300046e0 g     F .text	00000114 time_delay_deal
30003ddc g     F .text	00000054 acoral_intr_detach
30003800 g     F .text	00000064 acoral_get_free_pool
3000171c g     F .text	00000044 hal_intr_nesting_init_comm
30002f3c g     F .text	00000030 acoral_sched_mechanism_init
300094dc g     F .text	00000028 slice_policy_thread_release
3000b418 g     F .text	0000008c acoral_print
30003bcc g     F .text	0000002c acoral_get_obj
300081e0 g     F .text	00000258 acoral_msg_recv
30008f90 g     F .text	0000010c acoral_periodqueue_add
3001061c g     O .bss	00000001 need_sched
3000ec6c g     O .data	00000004 rm_queue
30000864 g     F .text	000000d4 hal_ticks_init
3000bfcc g     F .text	00000070 acoral_str_chr
30009bec g     F .text	000000e4 soft_delay_init
3000d720 g     F .text	00000098 acoral_dev_read
30001544 g       .text	00000000 MMU_CleanInvalidateDCacheMVA
30010620 g     O .bss	0000001c period_policy
30003f18 g     F .text	000000e8 acoral_intr_mask
3001063c g     O .bss	00000004 sample
30008030 g     F .text	0000009c acoral_msg_create
30000768 g     F .text	000000fc hal_intr_init
30003150 g     F .text	0000005c comm_policy_init
3000cc40 g     F .text	00000080 execmd
3000c164 g     F .text	00000074 acoral_str_nlen
30009ff0 g     F .text	00000098 acoral_prio_queue_del
3000b4a4 g     F .text	00000060 acoral_prints
3000c750 g     F .text	000000ac acoral_strstr
300085bc g     F .text	00000050 wake_up_thread
3000869c g     F .text	00000030 acoral_print_waitThreadsNum
3000450c g     F .text	00000020 acoral_set_ticks
33ffff00 g       *ABS*	00000000 FIQ_stack
30006504 g     F .text	000000a4 buddy_malloc_size
3000930c g     F .text	000001d0 slice_policy_thread_init
3000d8e8 g     F .text	00000048 acoral_drv_pool_init
3000158c g       .text	00000000 HAL_SWITCH_TO
3000dd38 g     F .text	000001bc __addsf3
30004318 g     F .text	0000004c acoral_set_intr_unmask
30010640 g     O .bss	00000004 tail_cmd
30001c0c g     F .text	00000034 acoral_module_init
300078a0 g     F .text	000001ac acoral_sem_pend
30004234 g     F .text	0000004c acoral_set_intr_enter
30006df4 g     F .text	00000054 v_malloc
30008438 g     F .text	0000014c acoral_msgctr_del
33fffb00 g       *ABS*	00000000 SVC_stack
30003c20 g     F .text	00000010 acoral_res_sys_init
3000147c g       .text	00000000 MMU_EnableICache
3000152c g       .text	00000000 MMU_InvalidateDCache


