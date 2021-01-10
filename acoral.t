
acoral.elf:     file format elf32-littlearm

SYMBOL TABLE:
30000000 l    d  .text	00000000 .text
30046684 l    d  .data	00000000 .data
300c9a98 l    d  .bss	00000000 .bss
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
00000000 l    d  .debug_ranges	00000000 .debug_ranges
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
300c9a9c l       .bss	00000000 acoral_ready_queues
00000000 l    df *ABS*	00000000 thread.c
300028c0 l     F .text	0000008c acoral_delay_thread
3000294c l     F .text	00000038 acoral_delay_thread_by_id
00000000 l    df *ABS*	00000000 comm_thrd.c
00000000 l    df *ABS*	00000000 resource.c
00000000 l    df *ABS*	00000000 int.c
00000000 l    df *ABS*	00000000 timer.c
300ca0d8 l       .bss	00000000 ticks
00000000 l    df *ABS*	00000000 mem.c
00000000 l    df *ABS*	00000000 spinlock.c
00000000 l    df *ABS*	00000000 event.c
00000000 l    df *ABS*	00000000 mutex.c
00000000 l    df *ABS*	00000000 buddy.c
30005d1c l     F .text	000002a8 recus_malloc
30005fc4 l     F .text	00000360 r_malloc
00000000 l    df *ABS*	00000000 malloc.c
30006960 l     F .text	000002b4 r_malloc
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
3000a094 l     F .text	00000074 do_div
300ca4dc l       .bss	00000000 print_buf.2126
300466bc l     O .data	00000004 console_id
300ca0dc l       .bss	00000000 print_buf.2163
00000000 l    df *ABS*	00000000 str.c
00000000 l    df *ABS*	00000000 random.c
300ca5dc l       .bss	00000000 rand_seed
00000000 l    df *ABS*	00000000 plugin.c
00000000 l    df *ABS*	00000000 LwIPEntry.c
00000000 l    df *ABS*	00000000 sys_arch.c
00000000 l    df *ABS*	00000000 api_lib.c
00000000 l    df *ABS*	00000000 api_msg.c
3000d4e4 l     F .text	000001b4 recv_raw
3000d698 l     F .text	00000144 recv_udp
3000d7dc l     F .text	0000011c recv_tcp
3000d8f8 l     F .text	00000068 poll_tcp
3000ec48 l     F .text	000002b8 do_writemore
3000e180 l     F .text	00000188 do_close_internal
3000d960 l     F .text	000000cc sent_tcp
3000da2c l     F .text	00000158 err_tcp
3000db84 l     F .text	00000074 setup_tcp
3000dbf8 l     F .text	00000100 accept_function
3000dcf8 l     F .text	000001d0 pcb_new
3000e5c4 l     F .text	0000009c do_connected
00000000 l    df *ABS*	00000000 err.c
00000000 l    df *ABS*	00000000 netbuf.c
00000000 l    df *ABS*	00000000 netdb.c
00000000 l    df *ABS*	00000000 netifapi.c
00000000 l    df *ABS*	00000000 sockets.c
300ca5e4 l       .bss	00000000 sockets
300ca634 l       .bss	00000000 select_cb_list
300ca638 l       .bss	00000000 socksem
300ca63c l       .bss	00000000 selectsem
3004568c l     O .text	0000003c err_to_errno_table
3000f61c l     F .text	00000078 get_socket
3000f694 l     F .text	000001d8 alloc_socket
30010ef8 l     F .text	000002ec event_callback
300107dc l     F .text	00000288 lwip_selscan
30011210 l     F .text	000000f0 lwip_getaddrname
30011648 l     F .text	000002d4 lwip_getsockopt_internal
30011ba4 l     F .text	000002c0 lwip_setsockopt_internal
00000000 l    df *ABS*	00000000 tcpip.c
300ca640 l       .bss	00000000 tcpip_init_done
300ca644 l       .bss	00000000 tcpip_init_done_arg
300ca64c l       .bss	00000000 tcpip_tcp_timer_active
30012010 l     F .text	0000006c tcpip_tcp_timer
300120e4 l     F .text	00000034 arp_timer
00000000 l    df *ABS*	00000000 autoip.c
00000000 l    df *ABS*	00000000 icmp.c
00000000 l    df *ABS*	00000000 igmp.c
00000000 l    df *ABS*	00000000 inet.c
300ca650 l       .bss	00000000 str.2216
00000000 l    df *ABS*	00000000 inet_chksum.c
300136ec l     F .text	00000130 lwip_standard_chksum
00000000 l    df *ABS*	00000000 ip.c
300ca660 l       .bss	00000000 ip_id.2980
00000000 l    df *ABS*	00000000 ip_addr.c
00000000 l    df *ABS*	00000000 ip_frag.c
300ca664 l       .bss	00000000 buf
00000000 l    df *ABS*	00000000 dhcp.c
00000000 l    df *ABS*	00000000 dns.c
00000000 l    df *ABS*	00000000 init.c
00000000 l    df *ABS*	00000000 memp.c
300cac40 l       .bss	00000000 memp_tab
300456d8 l     O .text	0000001a memp_sizes
300456f4 l     O .text	0000001a memp_num
300cac74 l       .bss	00000000 memp_memory
00000000 l    df *ABS*	00000000 netif.c
300dbb8c l       .bss	00000000 netifnum.2754
00000000 l    df *ABS*	00000000 pbuf.c
300dbb90 l       .bss	00000000 num_pbuf_realse.2437
00000000 l    df *ABS*	00000000 raw.c
300dbb94 l       .bss	00000000 raw_pcbs
00000000 l    df *ABS*	00000000 stats.c
00000000 l    df *ABS*	00000000 sys.c
30017350 l     F .text	00000040 sswt_handler
00000000 l    df *ABS*	00000000 tcp.c
300dbb98 l       .bss	00000000 tcp_timer
3001806c l     F .text	00000140 tcp_new_port
30017cc0 l     F .text	0000002c tcp_accept_null
300466c4 l     O .data	00000002 port.3015
30018ddc l     F .text	00000070 tcp_recv_null
30018e4c l     F .text	000000ec tcp_kill_prio
30018f38 l     F .text	000000a8 tcp_kill_timewait
300466c0 l     O .data	00000004 iss.3559
00000000 l    df *ABS*	00000000 tcp_in.c
300dbb9c l       .bss	00000000 inseg
300dbbb0 l       .bss	00000000 tcphdr
300dbbb4 l       .bss	00000000 iphdr
300dbbb8 l       .bss	00000000 seqno
300dbbbc l       .bss	00000000 ackno
300dbbc0 l       .bss	00000000 flags
300dbbc2 l       .bss	00000000 tcplen
300dbbc4 l       .bss	00000000 recv_flags
300dbbc8 l       .bss	00000000 recv_data
3001a830 l     F .text	000000bc tcp_timewait_input
3001a4b4 l     F .text	0000037c tcp_listen_input
3001a8ec l     F .text	00000bd0 tcp_process
3001d39c l     F .text	000001d8 tcp_parseopt
3001b4bc l     F .text	00001ee0 tcp_receive
00000000 l    df *ABS*	00000000 tcp_out.c
3001e988 l     F .text	00000328 tcp_output_segment
00000000 l    df *ABS*	00000000 udp.c
00000000 l    df *ABS*	00000000 lwmem.c
300dbbcc l       .bss	00000000 ram_heap
300e3be0 l       .bss	00000000 ram
300e3be4 l       .bss	00000000 ram_end
300e3be8 l       .bss	00000000 lfree
300e3bec l       .bss	00000000 mem_sem
300208f0 l     F .text	00000190 plug_holes
00000000 l    df *ABS*	00000000 etharp.c
300e3bf0 l       .bss	00000000 arp_table
300e3cb8 l       .bss	00000000 etharp_cached_entry
3002143c l     F .text	00000058 free_etharp_q
30021688 l     F .text	00000658 find_entry
30021ce0 l     F .text	000000fc etharp_send_ip
30021ddc l     F .text	000002b8 update_arp_entry
30022d90 l     F .text	000002f4 etharp_raw
00000000 l    df *ABS*	00000000 ethernetif.c
300466c8 l     O .data	00000004 net_dev_id
30023258 l     F .text	000000e8 low_level_init
30023340 l     F .text	00000074 low_level_output
00000000 l    df *ABS*	00000000 dir.c
00000000 l    df *ABS*	00000000 disk.c
300e3cbc l       .bss	00000000 Buf
00000000 l    df *ABS*	00000000 fat.c
00000000 l    df *ABS*	00000000 fdt.c
00000000 l    df *ABS*	00000000 file.c
300e3ebc l       .bss	00000000 FileInfo
00000000 l    df *ABS*	00000000 format.c
300e4024 l       .bss	00000000 Buf
00000000 l    df *ABS*	00000000 fscmd.c
00000000 l    df *ABS*	00000000 os_file.c
00000000 l    df *ABS*	00000000 rw_sec.c
00000000 l    df *ABS*	00000000 user.c
00000000 l    df *ABS*	00000000 shell.c
00000000 l    df *ABS*	00000000 cmd.c
00000000 l    df *ABS*	00000000 thread_display.c
00000000 l    df *ABS*	00000000 telnet.c
00000000 l    df *ABS*	00000000 fs_shellcmd.c
300e5028 l       .bss	00000000 tmp
300e50a8 l       .bss	00000000 j.2286
00000000 l    df *ABS*	00000000 httpd.c
30046790 l     O .data	00000004 WwwRoot
300e50ac l       .bss	00000000 httpd_buf
300e54ac l       .bss	00000000 str
30045e70 l     O .text	00000008 C.0.2321
00000000 l    df *ABS*	00000000 key.c
00000000 l    df *ABS*	00000000 touch_pad.c
30046798 l     O .data	00000001 flag
00000000 l    df *ABS*	00000000 lcd.c
00000000 l    df *ABS*	00000000 my_main.c
00000000 l    df *ABS*	00000000 dma.c
300e58c8 l       .bss	00000000 DMAChannel
00000000 l    df *ABS*	00000000 AudioDrv.c
300e58e8 l       .bss	00000000 lpPlayFstBlk
300e58ec l       .bss	00000000 lpRecFstBlk
300e58f0 l       .bss	00000000 lpPlayLstBlk
300e58f4 l       .bss	00000000 lpRecLstBlk
300e58f8 l       .bss	00000000 PlayTotBlks
300e58fc l       .bss	00000000 RecTotBlks
300e5900 l       .bss	00000000 save_MPLLCON
300c5fa8 l     O .data	00000054 CodecPara
300e5904 l       .bss	00000000 PlayStatus
300e5924 l       .bss	00000000 RecStatus
300c5ffc l     O .data	00000002 PlayVolume
30030f64 l     F .text	000000e8 SetSysFclk
30032380 l     F .text	00000084 IIS_PortSetting
3003289c l     F .text	000001b8 Init1341
30031814 l     F .text	000000e8 StartPlay
30032aa0 l     F .text	000000d4 AdjVolume
30032a54 l     F .text	0000004c PlayPause
30031a5c l     F .text	00000050 SetRecDma
30031aac l     F .text	000000e8 RecDMADone
30032404 l     F .text	00000230 _WrL3Addr
30032634 l     F .text	00000268 _WrL3Data
00000000 l    df *ABS*	00000000 UDA1341.c
00000000 l    df *ABS*	00000000 pcm_player.c
00000000 l    df *ABS*	00000000 file_read.c
00000000 l    df *ABS*	00000000 my_math.c
00000000 l    df *ABS*	00000000 MP3_COMMON.c
300c654c l     O .data	00000030 jsb_table.1617
300e5970 l       .bss	00000000 read_count.1721
300e5974 l       .bss	00000000 cur_file_buf.1722
00000000 l    df *ABS*	00000000 HUFFMAN.c
300c7e30 l     O .data	00000080 t_linbits
300e597c l       .bss	00000000 dataword
30046194 l     O .text	00000024 C.169.1969
00000000 l    df *ABS*	00000000 Decode.c
300c91ac l     O .data	00000004 init.1747
300c91a8 l     O .data	00000004 init.2591
00000000 l    df *ABS*	00000000 Fastsb.c
300c99b0 l     O .data	00000008 Granule_sbsynth_Vptr
300e5980 l       .bss	00000000 Granule_sbsynth_V
300e7980 l       .bss	00000000 A16
300e7d80 l       .bss	00000000 A8
300e7e80 l       .bss	00000000 G16
300e8280 l       .bss	00000000 G8
300e8380 l       .bss	00000000 H16
300e8780 l       .bss	00000000 H8
300e8880 l       .bss	00000000 B16
300e8c80 l       .bss	00000000 B8
300c99b8 l     O .data	00000004 init.1885
00000000 l    df *ABS*	00000000 fastimdct.c
300c9a84 l     O .data	00000004 init.1609
300e8d80 l       .bss	00000000 Granule_imdct_win.1587
300e8fc0 l       .bss	00000000 Granule_9x9_idct.1586
300e90e0 l       .bss	00000000 Granule_imdct_previous.1585
00000000 l    df *ABS*	00000000 Layer3.c
300ea2e4 l       .bss	00000000 frame_start.2626
00000000 l    df *ABS*	00000000 driver.c
00000000 l    df *ABS*	00000000 brd_driver.c
00000000 l    df *ABS*	00000000 con_uart.c
00000000 l    df *ABS*	00000000 con_telnet.c
300ea2e8 l       .bss	00000000 con_buf
00000000 l    df *ABS*	00000000 sdi.c
300415bc l     F .text	00000054 SD_Set_IOPort
300417cc l     F .text	00000048 CMD0
30041a2c l     F .text	000000d0 Chk_MMC_OCR
30041814 l     F .text	000000c8 CMD8
30041b74 l     F .text	0000019c Chk_SD_OCR
300418dc l     F .text	000000e8 CMD2
300419c4 l     F .text	00000068 CMD3
30041f74 l     F .text	000000dc SetBus
30042050 l     F .text	000000b4 Set_1bit_bus
30041e70 l     F .text	00000104 CMD9
30041610 l     F .text	000001bc Chk_CMDend
30041afc l     F .text	00000078 CMD55
30042104 l     F .text	00000100 Chk_DATend
30042204 l     F .text	000000a0 Chk_BUSYend
00000000 l    df *ABS*	00000000 dm9000.c
300ea2f4 l       .bss	00000000 dm9k_recv_sem
300ea318 l       .bss	00000000 flag
30043ca0 l       .text	00000000 .udivsi3_nodiv0
30043dbc l       .text	00000000 .divsi3_nodiv0
3000f5e0 g     F .text	0000003c lwip_socket_init
30040bb0 g     F .text	00000060 con_uart_init
3000e468 g     F .text	0000015c do_bind
30007114 g     F .text	00000070 acoral_mbox_del
30004a90 g     F .text	00000030 acoral_mem_sys_init
30013da8 g     F .text	00000084 inet_chksum
30004b84 g     F .text	00000010 acoral_evt_sys_init
3002a130 g     F .text	00000b3c Format
300169a0 g     F .text	0000006c raw_bind
3002b428 g     F .text	0000008c acoral_lseek
30015f74 g     F .text	00000178 pbuf_realloc
3000842c g     F .text	00000090 acoral_print_all_msg
30027b30 g     F .text	000001e4 FindOpenFile
300ea31c g     O .bss	0000000c nulltimeouts
300448b4 g     F .text	00000018 __aeabi_dcmple
30024128 g     F .text	000002f8 DiskInit
300ea328 g     O .bss	0000000c g_msgctr_header
300ea334 g     O .bss	00000050 drv_table
300c9a18 g     O .data	0000006c Granule_twiddles_normal
300194b0 g     F .text	00000034 tcp_next_iss
300447c8 g     F .text	00000088 __cmpdf2
300ea384 g     O .bss	00000014 con_telnet_ops
3002ac6c g     F .text	00000378 FsCommand
3003559c g     F .text	000001e0 log
300ea398 g     O .bss	00000004 netif_list
30035ae4 g     F .text	000001b4 sqrt
30040974 g     F .text	0000001c brd_driver_init
300ea39c g     O .bss	0000001c comm_policy
300ea3b8 g     O .bss	00000004 acoral_free_res_pool
3000b58c g     F .text	00000064 acoral_toupper
300ea3bc g     O .bss	000000a0 file_mp3_buf_hdr
300c63d0 g     O .data	00000020 C1
30002790 g     F .text	00000054 acoral_suspend_thread
300447c8 g     F .text	00000088 __eqdf2
3000b490 g     F .text	00000098 acoral_debugs
3001ecb0 g     F .text	00000380 tcp_rst
300ea45c g     O .bss	0000001c posix_policy
300287b8 g     F .text	00000364 FileGetCh
3000c2dc g     F .text	00000084 acoral_memcpy
3002b0dc g     F .text	00000154 acoral_open
3002b994 g     F .text	00000074 CacheInit
3002d0bc g     F .text	00000230 print
30008634 g     F .text	00000028 rm_policy_thread_release
300014dc g       .text	00000000 MMU_EnableMMU
30004b68 g     F .text	0000001c spin_unlock_stamp
300442bc g     F .text	00000060 __floatdidf
3000c71c g     F .text	00000014 plugin_init
300014ec g       .text	00000000 MMU_DisableMMU
30023084 g     F .text	00000084 etharp_request
30046770 g     O .data	00000010 create_cmd
30002ebc g     F .text	00000080 acoral_thread_pool_init
3000e044 g     F .text	0000013c netconn_free
30037998 g     F .text	000008a8 III_get_side_info
300ea478 g     O .bss	00000010 server_addr
300c6778 g     O .data	00000090 h9
300ea488 g     O .bss	00000001 sched_lock
30002f3c g     F .text	00000024 acoral_set_thread_console
30003414 g     F .text	000000f8 acoral_collect_pool
30009d90 g     F .text	00000088 acoral_prio_queue_add
30007c78 g     F .text	00000088 acoral_msg_init
3000150c g       .text	00000000 MMU_InvalidateIDCache
300c5f9c g     O .data	00000004 play_status
30017418 g     F .text	0000003c sys_msleep
30019224 g     F .text	00000020 tcp_err
300316c8 g     F .text	00000058 waveOutPause
300456d0 g     O .text	00000004 ip_addr_any
3001381c g     F .text	000002a8 inet_chksum_pseudo
300e58b0 g     O .bss	00000004 change
300207ec g     F .text	000000b0 udp_remove
3001d574 g     F .text	00000064 tcp_send_ctrl
3000148c g       .text	00000000 MMU_DisableICache
3002ea4c g     F .text	00000094 Glib_Rectangle
300044e0 g     F .text	0000003c acoral_time_sys_init
3001463c g     F .text	00000590 ip_output_if
300154c8 g     F .text	000000c4 memp_free
3002dacc g     F .text	00000168 key_init
3002dc34 g     F .text	0000028c key_scan
300422a4 g     F .text	00000334 SD_Rd_Block
30001514 g       .text	00000000 MMU_InvalidateICache
300ea48c g     O .bss	00000578 intr_table
30016280 g     F .text	00000118 pbuf_free
3000157c g       .text	00000000 MMU_InvalidateDTLB
300191e4 g     F .text	00000020 tcp_recv
30044df0 g     F .text	00000160 __divsf3
30001800 g     F .text	0000002c hal_intr_exit_bridge_comm
300016a8 g       .text	00000000 EXP_HANDLER
3000e308 g     F .text	00000160 do_delconn
300303dc g     F .text	00000094 RequestDMASW
30016434 g     F .text	00000090 pbuf_cat
30012118 g     F .text	000001dc tcpip_thread
300eaa04 g     O .bss	0000001c slice_policy
3002be28 g     F .text	00000214 OpenSec
3002b4b4 g     F .text	00000100 acoral_mkdir
30002b4c g     F .text	0000003c acoral_thread_change_prio_by_id
300ea2f0 g     O .bss	00000004 TR_end
3002eb48 g     F .text	00000138 Paint_Bmp
3000fecc g     F .text	0000044c lwip_recvfrom
300016ec g       .text	00000000 HAL_INTR_RESTORE
30040678 g     F .text	00000098 acoral_dev_write
3002df9c g     F .text	000001ac ts_isr
30000974 g     F .text	00000010 hal_mem_init
30014bcc g     F .text	0000008c ip_output
300002c0 g     F .text	0000010c hal_stack_init
30001ad0 g     F .text	000000fc acoral_core_cpu_start
3000166c g       .text	00000000 HAL_INTR_ENTRY
30020088 g     F .text	0000009c udp_sendto
300c9a90 g     O .data	00000004 mp3_fastsb_first
3003c140 g     F .text	000002a4 Granule_subband_synthesis
300466d0 g     O .data	00000010 mem_cmd
30004aec g     F .text	00000024 spin_unlock_intr_restore
3000d428 g     F .text	00000070 netconn_write
3003224c g     F .text	00000050 waveInUnprepareHeader
3001f210 g     F .text	000003a0 tcp_keepalive
30043c00 g     F .text	00000038 hw_dm9k_write
3000273c g     F .text	00000054 acoral_release_thread
3004668c g     O .data	00000004 prio
3000909c g     F .text	00000010 period_thread_exit
30021494 g     F .text	000001f4 etharp_tmr
3002f1c0 g     F .text	00000320 suspector_thread
300eaa20 g     O .bss	00000004 thread_api
3000f26c g     F .text	0000006c netbuf_delete
300318fc g     F .text	00000160 PlayDMA2Done
30018fe0 g     F .text	000001c8 tcp_alloc
3000182c g     F .text	00000048 hal_atomic_add_comm
300eaa24 g     O .bss	00000014 cur_file_name
300447b8 g     F .text	00000098 __gtdf2
300e58c4 g     O .bss	00000004 end_of_song
300042a4 g     F .text	0000004c acoral_set_intr_exit
3000f2d8 g     F .text	00000098 netbuf_alloc
30004bec g     F .text	00000020 acoral_alloc_evt
30020124 g     F .text	00000358 udp_sendto_if
30007bbc g     F .text	000000bc acoral_msgctr_init
300410ac g     F .text	00000484 SD_card_init
300191c4 g     F .text	00000020 tcp_arg
30004b10 g     F .text	0000001c spin_lock_intr
3000159c g       .text	00000000 HAL_INTR_SWITCH_TO
3000151c g       .text	00000000 MMU_InvalidateICacheMVA
3002221c g     F .text	00000440 etharp_arp_input
00000200 g       *ABS*	00000000 IRQ_stack_size
300c9168 g     O .data	00000020 cs
3002cf20 g     F .text	00000040 user_telnetd
300eaa38 g     O .bss	00000004 tcp_active_pcbs
30029284 g     F .text	000002ec FilePutCh
300377ec g     F .text	0000005c rewindNbytes
300eaa3c g     O .bss	00000004 udp_pcbs
300c6448 g     O .data	0000000c layer_names
300c6580 g     O .data	00000010 h1
300ca648 g     O .bss	00000004 mbox
30023108 g     F .text	00000150 ethernet_input
3003200c g     F .text	00000144 waveInStart
3003760c g     F .text	00000158 hgetbits
300278dc g     F .text	000001fc FDTIsLie
3000786c g     F .text	00000108 acoral_sem_post
30040b24 g     F .text	00000018 console_open
300163e0 g     F .text	00000054 pbuf_ref
300090ac g     F .text	00000080 period_policy_init
3004486c g     F .text	00000018 __aeabi_cdcmple
3000b738 g     F .text	00000064 acoral_str_len
300c6f08 g     O .data	00000400 h15
30045620 g     O .text	00000025 small_digits
30015a70 g     F .text	0000005c netif_set_netmask
3000ca40 g     F .text	00000074 sys_mbox_trypost
30001fa0 g     F .text	00000050 acoral_sched_init
30000d84 g     F .text	00000030 nand_init
300449b8 g     F .text	000001bc __aeabi_fadd
3000d498 g     F .text	0000004c netconn_close
300021a4 g     F .text	000000cc acoral_get_idle_maskcpu
300449b4 g     F .text	000001c0 __subsf3
30002804 g     F .text	00000034 acoral_suspend_thread_by_id
3002b2bc g     F .text	00000084 acoral_read
30023d30 g     F .text	00000248 MakeDir
3000f208 g     F .text	00000064 netbuf_new
30002a50 g     F .text	00000030 acoral_kill_thread_by_id
30030470 g     F .text	00000338 RequestDMA
30040990 g     F .text	0000003c uart_write
3000cc70 g     F .text	00000094 sys_arch_timeouts
30009af0 g     F .text	00000014 dummy_print
3000b32c g     F .text	0000004c acoral_getchar
300026c8 g     F .text	00000074 acoral_release_thread1
3001749c g     F .text	0000027c tcp_close
30017ee8 g     F .text	00000184 tcp_recved
300c6808 g     O .data	00000100 h10
30037764 g     F .text	00000088 rewindNbits
30019298 g     F .text	000000d8 tcp_pcb_purge
3000c46c g     F .text	0000009c acoral_memcmp
3000bd34 g     F .text	000000c0 acoral_str_ncmp
3004364c g     F .text	000001ac hw_sendPacket
3000cf90 g     F .text	0000004c netconn_disconnect
300ea2ec g     O .bss	00000004 SD_CardIn
300eaa40 g     O .bss	00000034 mem_ctrl
30002c70 g     F .text	00000020 acoral_alloc_thread
30045720 g     O .text	00000007 tcp_persist_backoff
300364b0 g     F .text	00000bc4 III_hufman_decode
30040c5c g     F .text	000001a8 con_telnet_read
30034eac g     F .text	000000cc talor_pow
30020b6c g     F .text	00000154 mem_free
30009ee4 g     F .text	000000c8 acoral_prio_queue_init
3002e4e4 g     F .text	00000568 Glib_Line
30044850 g     F .text	00000034 __aeabi_cdrcmple
300039e4 g     F .text	000000a4 acoral_pools_init
300eaa74 g     O .bss	00000004 tcp_ticks
300eaa78 g     O .bss	00000004 tcp_listen_pcbs
30033464 g     F .text	00000474 local_mp3_file_read
300eaa7c g     O .bss	00000032 fileName
30041530 g     F .text	0000008c Check_Card_In
3001f030 g     F .text	000000fc tcp_rexmit_rto
300c6438 g     O .data	00000010 mode_names
3004504c g     F .text	00000018 __aeabi_fcmpgt
30044240 g     F .text	00000028 __floatsidf
3000254c g     F .text	000000ac acoral_real_intr_sched
30014c58 g     F .text	00000124 ip_addr_isbroadcast
300191a8 g     F .text	0000001c tcp_new
300447c0 g     F .text	00000090 __ltdf2
300166f0 g     F .text	00000158 pbuf_copy_partial
30020750 g     F .text	0000006c udp_disconnect
3000c818 g     F .text	000000bc sys_init
3000c928 g     F .text	00000020 sys_sem_signal
30043094 g     F .text	00000180 sd_read_block
30006c68 g     F .text	000002a4 v_free
300018c8 g     F .text	000000d0 daem
3003c004 g     F .text	00000014 buffer_CRC
3002b5b4 g     F .text	000000f8 acoral_rmdir
30000984 g     F .text	00000084 flush_cache
30004920 g     F .text	00000064 timeout_queue_del
30026520 g     F .text	000004cc WriteFDTInfo
30017058 g     F .text	000001d0 sys_timeout
300eaab0 g     O .bss	00000004 pcm_player_id
300011c0 g     F .text	000002bc nand_read
300eaab4 g     O .bss	00000038 acoral_thread_pool_ctrl
300c7308 g     O .data	00000400 h16
30042f10 g     F .text	00000184 sd_write_block
300042f0 g     F .text	0000004c acoral_set_intr_mask
30030f60 g     F .text	00000004 DbgChgUartDiv
300428dc g     F .text	00000378 SD_Get_CardStat
3002bba0 g     F .text	00000060 AllCacheWriteBack
300eaaec g     O .bss	00000038 acoral_drv_pool_ctrl
30016c20 g     F .text	0000004c raw_send
300ca5e0 g     O .bss	00000004 pbuf_release
30013e2c g     F .text	00000128 inet_chksum_pbuf
30002010 g     F .text	00000020 acoral_set_orig_thread
3002c7a0 g     F .text	000001c8 get_cmd
30030ce4 g     F .text	000000d4 QueryDMAStat
30006f0c g     F .text	000000bc v_mem_init
3002ca20 g     F .text	0000009c acoral_shell_enter
30040484 g     F .text	000000d8 acoral_drv_register
3000b79c g     F .text	0000006c acoral_str_cpy
30043ca0 g     F .text	000000f4 __udivsi3
300015dc g       .text	00000000 HAL_INTR_CTX_SWITCH
300126b0 g     F .text	0000073c icmp_input
30044b7c g     F .text	00000020 __aeabi_i2f
300073d4 g     F .text	0000009c acoral_mbox_tryrecv
30000000 g       .text	00000000 __ENTRY
300eab24 g     O .bss	00000010 remo_addr
30003b90 g     F .text	00000040 acoral_obj_pool_init
3001558c g     F .text	000000f8 netif_add
3000a6a8 g     F .text	00000b38 vsnprintf
300014cc g       .text	00000000 MMU_DisableAlignFault
30044f58 g     F .text	0000006c __lesf2
300079cc g     F .text	000000ac acoral_msg_sys_init
30044958 g     F .text	00000054 __fixunsdfsi
30018c84 g     F .text	00000068 tcp_segs_free
300103b4 g     F .text	00000118 lwip_send
300016d8 g       .text	00000000 HAL_INTR_DISABLE
30004c3c g     F .text	00000038 acoral_evt_queue_empty
3000a108 g     F .text	00000088 skip_atoi
30035e8c g     F .text	000000b0 hdr_to_frps
300407a8 g     F .text	00000094 acoral_dev_config
30004024 g     F .text	000001a8 acoral_intr_entry
300e58c0 g     O .bss	00000004 cur_song
30003888 g     F .text	00000078 acoral_get_res_by_id
30001f44 g     F .text	0000003c acoral_sched_policy_init
300074e0 g     F .text	00000078 acoral_sem_create
3004421c g     F .text	00000024 __aeabi_ui2d
3002cc04 g     F .text	00000214 display_thread
30001e48 g     F .text	0000002c acoral_register_sched_policy
300c6508 g     O .data	00000020 mask
30025f58 g     F .text	00000158 ClearClus
3000c158 g     F .text	0000008c acoral_str_pbrk
3002c0b8 g     F .text	0000018c ReadSec
3000ce34 g     F .text	0000001c netconn_type
30015864 g     F .text	000001b0 netif_set_ipaddr
300c7da8 g     O .data	00000088 h_tables
300017d4 g     F .text	0000002c hal_sched_bridge_comm
30007d00 g     F .text	00000068 acoral_msg_assign
30009d34 g     F .text	0000005c acoral_get_bit
30028598 g     F .text	000000d4 FileOpen
30046694 g     O .data	00000028 right
30043f00 g     F .text	00000000 __aeabi_drsub
300eab34 g     O .bss	0000000c acoral_threads_queue
300ea2e0 g     O .bss	00000004 totpos
3001d5d8 g     F .text	000000c8 tcp_write
300eab40 g     O .bss	00000004 lpPlayCurBlk
300457b4 g     O .text	00000200 Root
300eab44 g     O .bss	00000004 thread
300eab48 g     O .bss	00000034 DiskInfo
30022094 g     F .text	000000e4 etharp_find_addr
3000cab4 g     F .text	00000068 sys_arch_mbox_fetch
30046794 g     O .data	00000004 key_dir
300c6908 g     O .data	00000100 h11
300111e4 g     F .text	0000002c lwip_shutdown
30009ff8 g     F .text	0000004c acoral_list_add2_tail
3000b528 g     F .text	00000064 acoral_tolower
300e58bc g     O .bss	00000004 play_command
300eab7c g     O .bss	00000058 orig_thread
30009fac g     F .text	0000004c acoral_list_add
3000b808 g     F .text	000000f0 acoral_str_cmp
3004489c g     F .text	00000018 __aeabi_dcmplt
30003900 g     F .text	000000e4 acoral_pool_res_init
00000200 g       *ABS*	00000000 SVC_stack_size
30042c54 g     F .text	00000024 sd_open
300178ac g     F .text	00000414 tcp_bind
3002866c g     F .text	0000014c FileClose
30017718 g     F .text	00000194 tcp_abort
3000d030 g     F .text	00000068 netconn_accept
300eabd4 g     O .bss	0000000c tmp_rm_queue
30044268 g     F .text	00000040 __extendsfdf2
300445ac g     F .text	0000020c __aeabi_ddiv
300342e0 g     F .text	00000580 online_wav_file_read
30003cd4 g     F .text	000000b0 acoral_intr_sys_init
30000c04 g     F .text	000000ac hal_mmu_setmtt
3002357c g     F .text	00000284 StrToFDTName
3000987c g     F .text	00000058 posix_policy_data_init
30014d7c g     F .text	000003c0 ip_frag
300eabe0 g     O .bss	00000004 acoral_mem_blocks
30043f0c g     F .text	00000310 __adddf3
300314c0 g     F .text	00000050 waveOutUnprepareHeader
30044f60 g     F .text	00000064 __nesf2
30004ac0 g     F .text	0000002c spin_lock_intr_save
30004e2c g     F .text	00000088 acoral_mutex_create
3000fde0 g     F .text	000000ec lwip_listen
3002e3c0 g     F .text	00000004 MoveViewPort
3002b340 g     F .text	00000084 acoral_write
3004431c g     F .text	00000290 __aeabi_dmul
300eabe4 g     O .bss	0003fc00 LCD_BUFFER
30030ab0 g     F .text	00000234 SetDMARun
30016aa8 g     F .text	00000178 raw_sendto
33ffff00 g       *ABS*	00000000 stack_base
3000f180 g     F .text	00000088 do_close
3002c03c g     F .text	0000007c ReadSuperSec
3003104c g     F .text	00000320 waveOutOpen
3000725c g     F .text	00000178 acoral_mbox_recv
3002daa8 g     F .text	00000024 user_httpd
3000fb08 g     F .text	000000f0 lwip_bind
3000ba9c g     F .text	0000008c acoral_str_lcpy
3012a7e4 g     O .bss	0000000a send
30009eb0 g     F .text	00000034 acoral_get_highprio
30039d14 g     F .text	000020b4 III_stereo
3003f950 g     F .text	00000aa8 mp3_decoder
30011300 g     F .text	0000003c lwip_getpeername
3000155c g       .text	00000000 MMU_WaitForInterrupt
30023a7c g     F .text	000002b4 GetDirClusIndex
3004421c g     F .text	00000024 __floatunsidf
3000bbb4 g     F .text	000000c8 acoral_str_ncat
30016598 g     F .text	00000158 pbuf_copy
3012a7f0 g     O .bss	00000004 sample_100ms
3012a7f4 g     O .bss	00000004 pvNullPointer
3001f12c g     F .text	000000e4 tcp_rexmit
3002d4e4 g     F .text	00000094 rm_dir
3000f4ec g     F .text	00000068 netbuf_data
3002b938 g     F .text	0000005c acoral_fs_init
302f7e6c g       *ABS*	00000000 heap_start
300043d0 g     F .text	00000110 acoral_fault_entry
3002c778 g     F .text	00000028 echo
30002c00 g     F .text	00000040 acoral_thread_move2_tail
3000ce50 g     F .text	00000070 netconn_getaddr
30026de8 g     F .text	000001cc SetFDTInfo
3002cadc g     F .text	00000020 malloc_scan2
30035d8c g     F .text	000000c8 seek_sync
3000c6fc g     F .text	00000020 acoral_rand_start
30015aec g     F .text	00000070 netif_set_up
30004f40 g     F .text	000000d8 acoral_mutex_trypend
300c6658 g     O .data	00000090 h7
3012a7f8 g     O .bss	00000014 console_ops
3012a80c g     O .bss	00000004 fs_mutex
3002b8c0 g     F .text	00000078 acoral_umount
3012a810 g     O .bss	00000008 left
300c65d8 g     O .data	00000040 h5
3001068c g     F .text	00000114 lwip_socket
3012a818 g     O .bss	00000004 remo_sock_fd
3012a81c g     O .bss	00000004 id
3000c6b8 g     F .text	00000044 acoral_rand
3012a820 g     O .bss	00000024 key_eve
3002c244 g     F .text	000000bc WriteSec
300125e8 g     F .text	000000c8 tcpip_init
30002fa4 g     F .text	000000d0 create_comm_thread
3012a844 g     O .bss	0000000c CurrentDirName
30003c1c g     F .text	00000028 acoral_free_obj
300449b4 g     F .text	000001c0 __aeabi_fsub
3002afe4 g     F .text	000000f8 acoral_unlink
00000100 g       *ABS*	00000000 Abort_stack_size
300338ec g     F .text	000004fc local_wav_file_read
3012a850 g     O .bss	00000004 tcp_tmp_pcb
3000cf28 g     F .text	00000068 netconn_connect
30002bc4 g     F .text	0000003c acoral_unrdy_thread
30002030 g     F .text	00000054 acoral_set_running_thread
3012a854 g     O .bss	00000400 g_http_get_string
3000a190 g     F .text	00000518 number
30040c10 g     F .text	0000004c con_telnet_write
30046700 g     O .data	00000010 exit_cmd
30004984 g     F .text	0000010c timeout_delay_deal
30008a8c g     F .text	00000064 rm_policy_init
3000d35c g     F .text	00000074 netconn_sendto
3003136c g     F .text	000000d4 waveOutClose
30045034 g     F .text	00000018 __aeabi_fcmpge
300448fc g     F .text	0000005c __fixdfsi
300c8168 g     O .data	00001000 is43_table
3002801c g     F .text	00000184 _FileOpenR
30020a80 g     F .text	000000ec mem_init
3012ac54 g     O .bss	00000004 lpRecCurBlk
3000350c g     F .text	0000012c acoral_get_res
3002f030 g     F .text	00000190 get_local_file_dir
30035098 g     F .text	0000010c talor_cos_cal
30007aa8 g     F .text	00000020 acoral_alloc_msgctr
300016c8 g       .text	00000000 HAL_INTR_ENABLE
300016f4 g       .text	00000000 HAL_INTR_DISABLE_SAVE
30002838 g     F .text	00000034 acoral_resume_thread_by_id
30044bac g     F .text	000000ac __floatdisf
3002e440 g     F .text	000000a4 Lcd_ClearScr
30045648 g     O .text	00000025 large_digits
3000fcc0 g     F .text	00000120 lwip_connect
3012ac58 g     O .bss	00000030 net_if
3001dfd4 g     F .text	000009b4 tcp_output
30009594 g     F .text	000000c0 acoral_posix_create
30032150 g     F .text	0000007c waveInStop
300c63f0 g     O .data	00000028 C2
30001a8c g     F .text	00000044 acoral_start
3002c35c g     F .text	00000240 parse_args
300c6a08 g     O .data	00000100 h12
3012ac88 g     O .bss	00000004 daemon_id
3012ac8c g     O .bss	0000000c period_delay_queue
30044f50 g     F .text	00000074 __gtsf2
30004c74 g     F .text	00000050 acoral_evt_high_thread
3000525c g     F .text	000001a8 acoral_mutex_post
300277c8 g     F .text	00000114 DirIsEmpty
3000f370 g     F .text	00000054 netbuf_free
30024098 g     F .text	00000090 ChangeDir
300014ac g       .text	00000000 MMU_DisableDCache
3000cfdc g     F .text	00000054 netconn_listen_with_backlog
3012ac98 g     O .bss	00000004 tcp_input_pcb
30043f0c g     F .text	00000310 __aeabi_dadd
30046760 g     O .data	00000010 copy_cmd
30016848 g     F .text	00000158 raw_input
3012ac9c g     O .bss	00000004 head_cmd
3012aca0 g     O .bss	0000000c acoral_res_release_queue
300447c0 g     F .text	00000090 __ledf2
30025eac g     F .text	000000ac FATDelClusChain
3004501c g     F .text	00000018 __aeabi_fcmple
30027d14 g     F .text	00000120 RemoveFile
3000c8d4 g     F .text	00000030 sys_sem_new
30026b08 g     F .text	000001c8 GetFDTInfo
300442a8 g     F .text	00000074 __aeabi_ul2d
3002c59c g     F .text	00000064 add_command
30013040 g     F .text	00000044 inet_addr
3002ecac g     F .text	00000384 ts_command
30003bd0 g     F .text	00000020 acoral_obj_pool_release
300083a4 g     F .text	00000038 acoral_msg_del
30007ac8 g     F .text	00000020 acoral_alloc_msg
3012acac g     O .bss	00000168 file_mp3_buf_usedone_eve
300136c4 g     F .text	00000028 ntohl
3000c26c g     F .text	00000070 acoral_memset
30007a78 g     F .text	00000030 acoral_msgctr_list_queueadd
3002b804 g     F .text	000000bc acoral_mount
30015acc g     F .text	00000020 netif_set_default
33fffd00 g       *ABS*	00000000 ABT_stack
300207bc g     F .text	00000030 udp_recv
300466f0 g     O .data	00000010 help_cmd
300403f8 g     F .text	0000008c acoral_get_drv_ctrl_by_name
30001bcc g     F .text	00000040 acoral_start_os
30029e1c g     F .text	00000088 FileEof
30006fc8 g     F .text	000000e4 v_mem_scan
3000998c g     F .text	00000024 delay_task
30043db4 g     F .text	00000000 __aeabi_idiv
30023954 g     F .text	0000008c GetDrive
300031d0 g     F .text	00000164 acoral_create_pool
3000c624 g     F .text	00000094 acoral_memchr
300c6590 g     O .data	00000024 h2
30015b5c g     F .text	0000003c netif_set_down
30001534 g       .text	00000000 MMU_InvalidateDCacheMVA
3000c0b8 g     F .text	000000a0 acoral_str_cspn
3012ae14 g     O .bss	00000820 acoral_pools
30015bb8 g     F .text	000003bc pbuf_alloc
30031720 g     F .text	00000058 waveOutRestart
30035c98 g     F .text	00000080 modf
30026cd0 g     F .text	00000118 SetRootFDTInfo
300315e8 g     F .text	0000007c waveOutSetVolume
3000c9b8 g     F .text	00000024 sys_mbox_free
30003638 g     F .text	00000188 acoral_release_res
3002c600 g     F .text	00000074 find_cmd
30007470 g     F .text	00000070 acoral_sem_init
3000cb1c g     F .text	00000050 getTONAvai
3012b634 g     O .bss	00000004 buf_byte_idx
30008af0 g     F .text	000000b4 rm_end
300014bc g       .text	00000000 MMU_EnableAlignFault
30031440 g     F .text	00000080 waveOutPrepareHeader
30031664 g     F .text	00000064 waveOutGetVolume
3000cdc4 g     F .text	00000070 netconn_delete
3012b638 g     O .bss	00000004 sock_len
30030e8c g     F .text	000000d4 QueryDMADst
300448e4 g     F .text	00000018 __aeabi_dcmpgt
3003f8b4 g     F .text	0000009c Granule_freqinverse
3002ec80 g     F .text	0000002c Lcd_TFT_Init
300c7b88 g     O .data	00000220 h_cue
3000f554 g     F .text	0000006c netbuf_next
300309d4 g     F .text	000000dc StopDMA
30035360 g     F .text	00000058 cos
300e5978 g     O .bss	00000004 h0
30040b3c g     F .text	00000074 uart_init
3000f5c0 g     F .text	00000020 netbuf_first
3000be64 g     F .text	0000008c acoral_str_rchr
30040af4 g     F .text	00000030 console_config
300456d4 g     O .text	00000004 ip_addr_broadcast
300104cc g     F .text	000001c0 lwip_sendto
300e5958 g     O .bss	00000008 fileNameSize
300070ac g     F .text	00000068 acoral_mbox_create
300448cc g     F .text	00000018 __aeabi_dcmpge
30020604 g     F .text	0000014c udp_connect
300c60b0 g     O .data	00000320 get_exp
3000df10 g     F .text	00000134 netconn_alloc
3000234c g     F .text	000000d4 acoral_rdyqueue_del
30007d68 g     F .text	000000e8 acoral_msgctr_create
30010a64 g     F .text	00000494 lwip_select
30010318 g     F .text	0000004c lwip_read
30002b1c g     F .text	00000030 acoral_change_prio_self
30001524 g       .text	00000000 MMU_PrefetchICacheMVA
300251f8 g     F .text	000004f4 FATGetNextClus
300098d4 g     F .text	00000064 posix_policy_init
30043f08 g     F .text	00000314 __aeabi_dsub
3012b63c g     O .bss	00000004 FreeList
30015684 g     F .text	00000048 netif_set_addr
3012b640 g     O .bss	00000001 CurrentDrive
300c7b48 g     O .data	00000040 hB
300018bc g     F .text	0000000c idle
30002c40 g     F .text	00000030 acoral_thread_move2_tail_by_id
300e5948 g     O .bss	00000008 totalBytes
3002ba20 g     F .text	000000ac CacheWriteBack2
30003e54 g     F .text	000000e8 acoral_intr_unmask
30035d18 g     F .text	00000074 open_bit_stream_r
300351a4 g     F .text	000001bc sin
300442a8 g     F .text	00000074 __floatundidf
3012b644 g     O .bss	00000004 play_song
30007558 g     F .text	000000b0 acoral_sem_del
30005018 g     F .text	00000244 acoral_mutex_pend
30036144 g     F .text	0000036c quest_stream
30015334 g     F .text	00000194 memp_malloc
30001504 g       .text	00000000 MMU_SetDomain
3001f5b0 g     F .text	00000410 tcp_zero_window_probe
3000b5f0 g     F .text	000000a8 acoral_str_upr
3012b648 g     O .bss	00000038 acoral_msg_pool_ctrl
3000ef00 g     F .text	000000c4 do_write
302f7e6c g       *ABS*	00000000 bss_end
30044b7c g     F .text	00000020 __floatsisf
30009654 g     F .text	00000200 posix_policy_thread_init
3012b680 g     O .bss	00000004 song_num
30002aa0 g     F .text	0000007c acoral_thread_change_prio
30001574 g       .text	00000000 MMU_InvalidateITLBMVA
3012b684 g     O .bss	00002000 buffer
30002a80 g     F .text	00000020 acoral_thread_exit
3002c6f4 g     F .text	00000084 cmd_exe
00000000 g       *ABS*	00000000 FIQ_stack_size
3003d708 g     F .text	000021ac Granule_imdct
30002b88 g     F .text	0000003c acoral_rdy_thread
300c8090 g     O .data	00000080 slen
30043454 g     F .text	00000040 dm9000_reg_read
30023f78 g     F .text	00000120 RemoveDir
3000bb28 g     F .text	0000008c acoral_str_cat
3003577c g     F .text	00000368 pow
30027e34 g     F .text	000001e8 FindOpenFileW
30043270 g     F .text	00000050 udelay
300017b8 g     F .text	0000001c hal_intr_nesting_inc_comm
30041dd4 g     F .text	0000009c Card_Deselect
3012d684 g     O .bss	00000004 tcp_bound_pcbs
30044f60 g     F .text	00000064 __eqsf2
30009324 g     F .text	0000007c slice_delay_deal
3000c904 g     F .text	00000024 sys_sem_free
30004eb4 g     F .text	0000008c acoral_mutex_del
3001367c g     F .text	00000048 htonl
30007184 g     F .text	000000d8 acoral_mbox_send
30018cec g     F .text	00000068 tcp_seg_free
3002cabc g     F .text	00000020 malloc_scan
3000c508 g     F .text	00000070 acoral_memscan
300260b0 g     F .text	00000470 ReadFDTInfo
30001774 g     F .text	00000044 hal_intr_nesting_dec_comm
30008754 g     F .text	00000158 rm_check
30032368 g     F .text	00000018 waveInReset
300025f8 g     F .text	000000d0 acoral_select_thread
30016da4 g     F .text	00000164 sys_mbox_fetch
00000200 g       *ABS*	00000000 SYS_stack_size
3000efc4 g     F .text	000001bc do_getaddr
30024420 g     F .text	00000090 GetDiskInfo
3000f498 g     F .text	00000054 netbuf_chain
300c9a98 g       .bss	00000000 bss_start
30038814 g     F .text	00000e40 III_dequantize_sample
3012d688 g     O .bss	00000001 CacheNum
300181ac g     F .text	000002d8 tcp_connect
30013ac4 g     F .text	000002e4 inet_chksum_pseudo_partial
3012d68c g     O .bss	00000014 hw_dm9k_ops
30044df0 g     F .text	00000160 __aeabi_fdiv
30021014 g     F .text	000003b0 mem_malloc
30005404 g     F .text	00000178 buddy_scan
300273e8 g     F .text	00000208 DelFDT
30044240 g     F .text	00000028 __aeabi_i2d
30039654 g     F .text	000006c0 III_reorder
30007974 g     F .text	00000058 acoral_sem_getnum
30023800 g     F .text	00000154 _GetFDTInfo
3002dec0 g     F .text	00000038 ClearPending
3012d6a0 g     O .bss	00000004 tcp_id
3002d784 g     F .text	00000060 fs_cmd_init
30040920 g     F .text	00000054 acoral_drv_sys_init
30009cd0 g     F .text	00000064 acoral_clear_bit
3012d6a4 g     O .bss	00000004 idle_id
300408b8 g     F .text	00000020 acoral_alloc_drv
30030db8 g     F .text	000000d4 QueryDMASrc
30044b9c g     F .text	000000bc __floatundisf
30046750 g     O .data	00000010 rmdir_cmd
30009b04 g     F .text	000000e0 acoral_ffs
33fffc00 g       *ABS*	00000000 UDF_stack
30004d88 g     F .text	00000034 acoral_evt_queue_del
3000e7dc g     F .text	00000058 do_disconnect
30001998 g     F .text	000000f4 init
3004055c g     F .text	00000088 acoral_drv_unregister
30043efc  w    F .text	00000004 __aeabi_ldiv0
30008d88 g     F .text	00000028 period_policy_thread_release
30004c0c g     F .text	00000030 acoral_evt_init
300445ac g     F .text	0000020c __divdf3
3002cf60 g     F .text	0000015c cd_dir
3000b378 g     F .text	00000054 acoral_putchar
3012d6a8 g     O .bss	00000004 datapos
3003d4b8 g     F .text	00000128 matrix_mul16
3000b3cc g     F .text	000000c4 acoral_debug
3001d6a0 g     F .text	00000934 tcp_enqueue
300194e4 g     F .text	00000078 tcp_eff_send_mss
3002ce18 g     F .text	00000090 server_client
30001e74 g     F .text	0000007c acoral_policy_delay_deal
30044b74 g     F .text	00000028 __aeabi_ui2f
3000bc7c g     F .text	000000b8 acoral_str_lcat
3004431c g     F .text	00000290 __muldf3
30040a88 g     F .text	0000006c console_read
3000ba0c g     F .text	00000090 acoral_str_ncpy
30041d10 g     F .text	000000c4 Card_Select
3000c360 g     F .text	0000010c acoral_memmove
30004818 g     F .text	00000108 timeout_queue_add
3003c018 g     F .text	00000124 main_data_slots
3012d6ac g     O .bss	0000000c policy_list
3012d6b8 g     O .bss	00000004 acoral_mem_ctrl
300425d8 g     F .text	00000304 SD_Wt_Block
3001191c g     F .text	00000288 lwip_setsockopt
30027ad8 g     F .text	00000058 FileInit
300c7708 g     O .data	00000400 h24
300405e4 g     F .text	00000094 acoral_dev_open
300e58b4 g     O .bss	00000004 num
300256ec g     F .text	000005c8 FATSetNextClus
300c6b08 g     O .data	00000400 h13
30034860 g     F .text	000004e8 online_mp3_file_read
30008ba4 g     F .text	000001e4 period_policy_thread_init
300124b0 g     F .text	000000b4 tcpip_timeout
30013084 g     F .text	000003f8 inet_aton
30016a0c g     F .text	0000006c raw_connect
3012d6bc g     O .bss	0000001c rm_policy
300c8110 g     O .data	00000058 pretab
30007b84 g     F .text	00000038 acoral_msg_queue_add
3012d6d8 g     O .bss	00000004 my_conn
3012d6dc g     O .bss	00000004 FreeListTail
30044f60 g     F .text	00000064 __cmpsf2
3000c1e4 g     F .text	00000088 acoral_str_sep
3002d2ec g     F .text	000001a4 ls_dir
300269ec g     F .text	0000011c GetRootFDTInfo
3000c98c g     F .text	0000002c sys_mbox_new
300099b0 g     F .text	0000005c acoral_soft_delay
30002104 g     F .text	000000a0 acoral_get_idlest_cpu
3012d6e0 g     O .bss	00000008 data
3012d6e8 g     O .bss	00000030 CardInf
30004b48 g     F .text	00000020 spin_lock_stamp
30034d48 g     F .text	00000164 talor_factorial
3002cea8 g     F .text	00000078 telnet_thread
300c9a94 g     O .data	00000004 mp3_freq
30038240 g     F .text	000005d4 III_get_scale_factors
30002c90 g     F .text	0000022c acoral_thread_init
30001644 g       .text	00000000 HAL_CONTEXT_SWITCH
3012d718 g     O .bss	00000004 mp3_dat
3000865c g     F .text	00000044 rm_discard_thread
3003405c g     F .text	000001f8 client_init
30046720 g     O .data	00000010 cd_cmd
300434d0 g     F .text	0000017c hw_init
30044bac g     F .text	000000ac __aeabi_l2f
00000100 g       *ABS*	00000000 Undef_stack_size
300244b0 g     F .text	000009b0 AddFileDriver
33f00000 g       *ABS*	00000000 MMU_base
3012d71c g     O .bss	00000004 init_id
30001c34 g     F .text	000000d4 create_thread_ext
3012d720 g     O .bss	0000000c time_delay_queue
300c6000 g     O .data	00000004 end_of_file
3003bdc8 g     F .text	0000023c III_antialias
30044f58 g     F .text	0000006c __ltsf2
30012dec g     F .text	00000254 icmp_dest_unreach
30002f90 g     F .text	00000014 acoral_thread_sys_init
30043ca0 g     F .text	00000000 __aeabi_uidiv
30019204 g     F .text	00000020 tcp_sent
30015b98 g     F .text	00000020 netif_is_up
3001364c g     F .text	00000030 ntohs
3001347c g     F .text	00000184 inet_ntoa
300375c0 g     F .text	0000004c hputbuf
30035414 g     F .text	00000080 talor_exp_cal
30004b2c g     F .text	0000001c spin_unlock_intr
30009854 g     F .text	00000028 posix_policy_thread_release
300e5950 g     O .bss	00000008 bytesReceived
300338d8 g     F .text	00000014 mp3_mask
30016d1c g     F .text	00000088 raw_new
3012d72c g     O .bss	00000004 net_data
3001133c g     F .text	0000003c lwip_getsockname
300233b4 g     F .text	0000011c ethernetif_input
30031b94 g     F .text	00000360 waveInOpen
300442bc g     F .text	00000060 __aeabi_l2d
3012d730 g     O .bss	000c8000 file_wav_buf
3003c808 g     F .text	00000588 fast_idct_init
300307a8 g     F .text	000000f4 ReleaseDMA
30002420 g     F .text	00000080 acoral_sched
3000286c g     F .text	00000054 acoral_resume_thread
300c66e8 g     O .data	00000090 h8
30000000 g       .text	00000000 text_start
3002c968 g     F .text	00000094 acoral_shell_init
30026fb4 g     F .text	0000021c FindFDTInfo
30025cb4 g     F .text	000001f8 FATAddClus
30033de8 g     F .text	00000274 online_sel
301f5730 g     O .bss	00000038 acoral_evt_pool_ctrl
3000d3d0 g     F .text	00000058 netconn_send
30043350 g     F .text	000000c8 IOSetInit
30044b9c g     F .text	000000bc __aeabi_ul2f
301f5768 g     O .bss	00000038 acoral_msgctr_pool_ctrl
3000cd04 g     F .text	000000c0 netconn_new_with_proto_and_callback
30035494 g     F .text	00000108 exp
30043c38 g     F .text	00000068 dm9000_init
3002eae0 g     F .text	00000068 Glib_FilledRectangle
33fff900 g       *ABS*	00000000 SYS_stack
300029b4 g     F .text	0000009c acoral_kill_thread
300041dc g     F .text	0000007c acoral_intr_exit
30009c70 g     F .text	00000060 acoral_set_bit
30044fd4 g     F .text	00000018 __aeabi_cfcmple
30043db4 g     F .text	00000128 __divsi3
3002cafc g     F .text	0000006c help
30037074 g     F .text	0000054c HuffmanTable_decode
30016c6c g     F .text	000000b0 raw_remove
3002def8 g     F .text	000000a4 touch_pad_init
30044c58 g     F .text	00000198 __mulsf3
30017390 g     F .text	00000088 sys_sem_wait_timeout
301f57a0 g     O .bss	00000004 timeoutslist
30043b30 g     F .text	00000050 hw_dm9k_config
3002047c g     F .text	00000188 udp_bind
30017454 g     F .text	00000048 tcp_tmr
300228fc g     F .text	00000494 etharp_query
301f57a4 g     O .bss	00000004 xdata
30004dbc g     F .text	00000070 acoral_mutex_init
300c6618 g     O .data	00000040 h6
30001554 g       .text	00000000 MMU_CleanInvalidateDCacheIndex
30009404 g     F .text	00000190 posix_delay_deal
30009be4 g     F .text	0000008c acoral_find_first_bit
3001513c g     F .text	0000001c lwip_init
300c6008 g     O .data	000000a8 useful_fact
301f57a8 g     O .bss	00000168 pcm_dma_buf_playdone_eve
301f5910 g     O .bss	00000028 HashTable
30040a0c g     F .text	0000007c console_write
3000cb6c g     F .text	00000104 sys_thread_new
300e5964 g     O .bss	00000004 localFile
3002265c g     F .text	000002a0 etharp_output
300353b8 g     F .text	0000005c tan
30046710 g     O .data	00000010 dt_cmd
30002984 g     F .text	00000030 acoral_delay_self
30034290 g     F .text	00000050 min
30004cc4 g     F .text	000000c4 acoral_evt_queue_add
301f5938 g     O .bss	00000004 ydata
33eff000 g       *ABS*	00000000 heap_end
300e58ac g     O .bss	00000004 count
30008f1c g     F .text	00000180 period_delay_deal
30009938 g     F .text	00000054 delay
30034f78 g     F .text	00000120 talor_sin_cal
301f593c g     O .bss	0000000c timeout_queue
300447c8 g     F .text	00000088 __nedf2
301f5948 g     O .bss	000c8000 file_mp3_buf
300003cc g     F .text	000000cc hal_all_entry
300027e4 g     F .text	00000020 acoral_suspend_self
300041cc g     F .text	00000010 acoral_default_isr
3002e2a8 g     F .text	0000004c Lcd_EnvidOnOff
30035e54 g     F .text	00000038 js_bound
300093a0 g     F .text	00000064 slice_policy_init
3002e3ac g     F .text	00000014 Lcd_MoveViewPort
30040f0c g     F .text	0000004c SDI_Init
30012564 g     F .text	00000084 tcpip_apimsg
30015a14 g     F .text	0000005c netif_set_gw
30040e04 g     F .text	0000009c con_telnet_config
30016398 g     F .text	00000048 pbuf_clen
30001874 g     F .text	00000048 hal_atomic_sub_comm
30032b74 g     F .text	000003cc PlayMusicTest
30044f50 g     F .text	00000074 __gesf2
30018d54 g     F .text	00000024 tcp_setprio
30020038 g     F .text	00000050 udp_send
30011378 g     F .text	000002d0 lwip_getsockopt
300024a0 g     F .text	000000ac acoral_real_sched
302bd948 g     O .bss	00000120 grle
30000938 g     F .text	0000003c hal_ticks_delay
300c6418 g     O .data	00000020 s_freq
30016a78 g     F .text	00000030 raw_recv
300449ac g     F .text	000001c8 __aeabi_frsub
3003c3e4 g     F .text	00000424 Granule_subband_synthesis2
3002f4e0 g     F .text	00000c28 main_thread
300c6528 g     O .data	00000024 putmask
3002d68c g     F .text	000000a4 create_file
300156cc g     F .text	000000dc netif_remove
3000c948 g     F .text	00000044 sys_arch_sem_wait
300037c0 g     F .text	00000064 acoral_get_pool_by_id
30001584 g       .text	00000000 MMU_SetProcessId
30044fec g     F .text	00000018 __aeabi_fcmpeq
300275f0 g     F .text	000001d8 ChangeFDT
30018484 g     F .text	000006d4 tcp_slowtmr
30044c58 g     F .text	00000198 __aeabi_fmul
30002084 g     F .text	00000080 acoral_thread_runqueue_init
3000b1e0 g     F .text	00000060 acoral_sprint
30004588 g     F .text	00000050 acoral_ticks_entry
30044fc4 g     F .text	00000028 __aeabi_cfrcmple
302bda68 g     O .bss	00000800 buf
3000bef0 g     F .text	0000009c acoral_str_nchr
30003074 g     F .text	00000100 comm_policy_thread_init
300c7eb4 g     O .data	000001bc sfBandIndex
30019244 g     F .text	00000020 tcp_accept
3000e834 g     F .text	000001d4 do_listen
3002d730 g     F .text	00000054 rm_file
3000c000 g     F .text	000000b8 acoral_str_spn
3002e148 g     F .text	00000160 Lcd_Init
300281a0 g     F .text	000002a4 _FileOpenW
300234d0 g     F .text	000000ac ethernetif_init
3002b3c4 g     F .text	00000064 acoral_closeall
30040f58 g     F .text	00000154 Delay
30043b80 g     F .text	00000080 hw_dm9k_read
30001760 g     F .text	00000014 hal_get_intr_nesting_comm
302be268 g     O .bss	00000004 offset
300084ec g     F .text	00000148 rm_policy_thread_init
30001f90 g     F .text	00000010 app_exit_policy_init
302be26c g     O .bss	00000004 ready_thread
300466e0 g     O .data	00000010 mem2_cmd
3000b698 g     F .text	000000a0 acoral_str_lwr
30003a88 g     F .text	00000108 acoral_pool_ctrl_init
30040ea0 g     F .text	0000006c con_telnet_init
30043214 g     F .text	0000005c sd_init
30044958 g     F .text	00000054 __aeabi_d2uiz
30001564 g       .text	00000000 MMU_InvalidateTLB
302be270 g     O .bss	00000168 file_mp3_buf_update_eve
30031510 g     F .text	000000d8 waveOutWrite
3004083c g     F .text	0000007c acoral_dev_close
30031ef4 g     F .text	00000118 waveInClose
300063c8 g     F .text	000000e0 buddy_malloc
302be3d8 g     O .bss	00000002 send_cmd
300e5968 g     O .bss	00000004 sock_fd
302be3dc g     O .bss	0000012c local_file_dir
30045004 g     F .text	00000018 __aeabi_fcmplt
3002c9fc g     F .text	00000024 acoral_shell_exit
3000154c g       .text	00000000 MMU_CleanDCacheIndex
300122f4 g     F .text	000000c8 tcpip_input
300c91b0 g     O .data	00000800 D_coex
3000156c g       .text	00000000 MMU_InvalidateITLB
30007eec g     F .text	00000114 acoral_msg_send
300c6454 g     O .data	000000b4 bitrate
302be508 g     O .bss	00000004 tcp_tw_pcbs
302be50c g     O .bss	00000014 fmt
30043d94 g     F .text	00000020 __aeabi_uidivmod
300e58b8 g     O .bss	00000004 status_changed
30001d88 g     F .text	000000c0 acoral_policy_thread_init
30044884 g     F .text	00000018 __aeabi_dcmpeq
3000003c g       .text	00000000 HandleIRQ
300088ac g     F .text	0000014c rm_thread_dispatch
3001f9c0 g     F .text	00000678 udp_input
30002270 g     F .text	000000dc acoral_rdyqueue_add
3000153c g       .text	00000000 MMU_CleanDCacheMVA
3000149c g       .text	00000000 MMU_EnableDCache
300c9188 g     O .data	00000020 ca
30003c54 g     F .text	00000080 acoral_assert_res
302be520 g     O .bss	0000004c timeoutnodes
3000c7d8 g     F .text	00000040 acoral_net_lwip_init
3003d5e0 g     F .text	00000128 matrix_mul8
300c9a98 g     O .bss	00000004 acoral_start_sched
300c65b4 g     O .data	00000024 h3
3000a044 g     F .text	00000050 acoral_list_del
30013600 g     F .text	0000004c htons
30042c78 g     F .text	00000298 Write_One_Block
300c9a8c g     O .data	00000004 mp3_fast_first
300089f8 g     F .text	00000094 rm_init
3000451c g     F .text	00000014 acoral_get_ticks
302be56c g     O .bss	00000004 dataword_len
300064a8 g     F .text	000004b8 buddy_free
30013f54 g     F .text	00000114 ip_route
30017cec g     F .text	000001fc tcp_listen_with_backlog
302be570 g     O .bss	00000132 lwip_stats
3002c300 g     F .text	00000044 aocal_net_mp3
3000ebb8 g     F .text	00000090 do_recv
300014fc g       .text	00000000 MMU_SetTTBase
30046740 g     O .data	00000010 mkdir_cmd
300160ec g     F .text	00000194 pbuf_header
302be6a4 g     O .bss	00000004 intr_nesting
3002bc00 g     F .text	00000228 GetCache
30020cc0 g     F .text	00000354 mem_realloc
302be6a8 g     O .bss	00000004 netif_default
30004550 g     F .text	00000038 acoral_ticks_init
30019370 g     F .text	00000140 tcp_pcb_remove
300409cc g     F .text	00000040 uart_read
30004b94 g     F .text	00000058 acoral_evt_pool_init
30029570 g     F .text	00000864 FileWrite
3002cbb8 g     F .text	0000004c cmd_init
3002c344 g     F .text	00000018 user_main
300c99bc g     O .data	0000005c Granule_twiddles_short
300045d8 g     F .text	0000012c acoral_delayqueue_add
300164c4 g     F .text	00000030 pbuf_chain
300086a0 g     F .text	000000b4 rm_queue_ascend_add
302be6ac g     O .bss	00000004 cur_file_ptr
3000b8f8 g     F .text	00000114 acoral_str_nicmp
3002cb68 g     F .text	00000050 exit
30046688 g     O .data	00000004 acoral_doMsgTtl_checked
30008ebc g     F .text	00000060 period_thread_delay
33ffff00 g       *ABS*	00000000 IRQ_stack
3001207c g     F .text	00000068 tcp_timer_needed
30044b74 g     F .text	00000028 __floatunsisf
30015158 g     F .text	000001dc memp_init
300213c4 g     F .text	00000078 mem_calloc
30018b58 g     F .text	0000012c tcp_fasttmr
300448fc g     F .text	0000005c __aeabi_d2iz
302be6b0 g     O .bss	00000168 pcm_dma_buf_update_eve
300437f8 g     F .text	00000338 hw_getPacket
3002b6ac g     F .text	000000f8 acoral_chdir
30044fd4 g     F .text	00000018 __aeabi_cfcmpeq
3003229c g     F .text	000000cc waveInAddBuffer
30001ff0 g     F .text	00000020 acoral_sched_unlock
30016f08 g     F .text	00000150 sys_sem_wait
3002d578 g     F .text	00000114 copy_file
3000557c g     F .text	000007a0 buddy_init
3000cec0 g     F .text	00000068 netconn_bind
30001d08 g     F .text	00000080 acoral_get_policy_ctrl
300107a0 g     F .text	0000003c lwip_write
3002e2f4 g     F .text	000000b8 Lcd_PowerEnable
30024e60 g     F .text	00000398 RemoveFileDriver
3002bacc g     F .text	000000d4 CacheWriteBack
300c9a88 g     O .data	00000004 mp3_first
3008639c g     O .data	0003fc00 bg2
30007608 g     F .text	000000b8 acoral_sem_trypend
30043418 g     F .text	0000003c dm9000_reg_write
30004388 g     F .text	00000048 acoral_intr_set_type
30022178 g     F .text	000000a4 etharp_ip_input
3002ba08 g     F .text	00000018 CloseSec
30010364 g     F .text	00000050 lwip_recv
30043efc  w    F .text	00000004 __aeabi_idiv0
30031778 g     F .text	00000048 waveOutReset
30001ef0 g     F .text	00000054 acoral_policy_thread_release
302be818 g     O .bss	00000004 running_thread
30007ae8 g     F .text	0000009c acoral_msgctr_queue_add
30001f80 g     F .text	00000010 app_enter_policy_init
30003d84 g     F .text	0000007c acoral_intr_attach
302be81c g     O .bss	00000014 fr_ps
30003334 g     F .text	000000e0 acoral_release_pool
30030338 g     F .text	000000a4 my_main_start
30011e64 g     F .text	000001ac lwip_ioctl
30004704 g     F .text	00000114 time_delay_deal
3002a0b8 g     F .text	00000078 strupr
30003e00 g     F .text	00000054 acoral_intr_detach
30003824 g     F .text	00000064 acoral_get_free_pool
3000c730 g     F .text	000000a8 my_lwip_init
300c7eb0 g     O .data	00000004 buf_bit_idx
3003cd90 g     F .text	00000728 fast_idct
30018d78 g     F .text	00000064 tcp_seg_copy
302be830 g     O .bss	00001000 rec
3004679c g     O .data	0003fc00 bg1
3000171c g     F .text	00000044 hal_intr_nesting_init_comm
30002f60 g     F .text	00000030 acoral_sched_mechanism_init
300092fc g     F .text	00000028 slice_policy_thread_release
3000b240 g     F .text	0000008c acoral_print
30003bf0 g     F .text	0000002c acoral_get_obj
3003089c g     F .text	00000138 StartDMA
3002b7a4 g     F .text	00000060 acoral_flush
300317c0 g     F .text	00000054 SetPlayDma
302bf830 g     O .bss	00000014 sd_ops
30019264 g     F .text	00000034 tcp_poll
3002d7e4 g     F .text	000002c4 httpd_thread
30008000 g     F .text	00000258 acoral_msg_recv
30028444 g     F .text	00000154 _FileOpenRW
30035f3c g     F .text	00000208 getbit
3002e3c4 g     F .text	0000007c PutPixel
30008db0 g     F .text	0000010c acoral_periodqueue_add
302bf844 g     O .bss	00000004 mp3_decoder_id
3004486c g     F .text	00000018 __aeabi_cdcmpeq
30029ea4 g     F .text	00000214 FileSeek
300447b8 g     F .text	00000098 __gedf2
3002089c g     F .text	00000054 udp_new
302bf848 g     O .bss	00000001 need_sched
30046690 g     O .data	00000004 rm_queue
30046730 g     O .data	00000010 ls_cmd
300c8070 g     O .data	00000020 sfbtable
30029dd4 g     F .text	00000048 FileCloseAll
30000864 g     F .text	000000d4 hal_ticks_init
300271d0 g     F .text	00000218 AddFDT
3000bdf4 g     F .text	00000070 acoral_str_chr
30009a0c g     F .text	000000e4 soft_delay_init
302bf84c g     O .bss	000001b8 hdr
30034254 g     F .text	0000003c client_close
3000fbf8 g     F .text	000000c8 lwip_close
30040710 g     F .text	00000098 acoral_dev_read
30001544 g       .text	00000000 MMU_CleanInvalidateDCacheMVA
3000f3c4 g     F .text	000000d4 netbuf_ref
30045750 g     O .text	00000006 ethbroadcast
30045710 g     O .text	0000000d tcp_backoff
300c5fa0 g     O .data	00000004 play_model
302bfa04 g     O .bss	00038400 pcm_dma_buf
30044268 g     F .text	00000040 __aeabi_f2d
302f7e04 g     O .bss	0000001c period_policy
30003f3c g     F .text	000000e8 acoral_intr_mask
302f7e20 g     O .bss	00000002 len
30037848 g     F .text	00000150 decode_info
302f7e24 g     O .bss	00000004 sample
300e5960 g     O .bss	00000001 rec_cmd
30007e50 g     F .text	0000009c acoral_msg_create
3000f86c g     F .text	0000029c lwip_accept
3000d098 g     F .text	000002c4 netconn_recv
3002d490 g     F .text	00000054 mk_dir
30000768 g     F .text	000000fc hal_intr_init
3000dec8 g     F .text	00000048 do_newconn
3000c9dc g     F .text	00000064 sys_mbox_post
30028b1c g     F .text	00000768 FileRead
30003174 g     F .text	0000005c comm_policy_init
30046780 g     O .data	00000010 rm_cmd
30033220 g     F .text	00000244 file_pcm_player
3002c674 g     F .text	00000080 execmd
30043f08 g     F .text	00000314 __subdf3
3000bf8c g     F .text	00000074 acoral_str_nlen
30043494 g     F .text	0000003c dm9000_reg_read16
30009e18 g     F .text	00000098 acoral_prio_queue_del
3000b2cc g     F .text	00000060 acoral_prints
3000c578 g     F .text	000000ac acoral_strstr
302f7e28 g     O .bss	0000001c bs
300083dc g     F .text	00000050 wake_up_thread
300084bc g     F .text	00000030 acoral_print_waitThreadsNum
300432c0 g     F .text	00000090 Eint7_ISR
30043edc g     F .text	00000020 __aeabi_idivmod
30004530 g     F .text	00000020 acoral_set_ticks
3000e660 g     F .text	0000017c do_connect
33ffff00 g       *ABS*	00000000 FIQ_stack
300239e0 g     F .text	0000009c ChangeDrive
300c5fa4 g     O .data	00000004 play_volume
30006324 g     F .text	000000a4 buddy_malloc_size
3000912c g     F .text	000001d0 slice_policy_thread_init
30017228 g     F .text	00000128 sys_untimeout
3001955c g     F .text	00000f58 tcp_input
300408d8 g     F .text	00000048 acoral_drv_pool_init
3000158c g       .text	00000000 HAL_SWITCH_TO
300449b8 g     F .text	000001bc __addsf3
3000433c g     F .text	0000004c acoral_set_intr_unmask
300c7b08 g     O .data	00000040 hA
30014068 g     F .text	000005d4 ip_input
302f7e44 g     O .bss	00000004 tail_cmd
302f7e48 g     O .bss	00000024 touch_eve
30001c0c g     F .text	00000028 acoral_module_init
3000ea08 g     F .text	000001b0 do_send
300076c0 g     F .text	000001ac acoral_sem_pend
30004258 g     F .text	0000004c acoral_set_intr_enter
30006c14 g     F .text	00000054 v_malloc
30045758 g     O .text	00000006 ethzero
30008258 g     F .text	0000014c acoral_msgctr_del
3002b230 g     F .text	0000008c acoral_close
30030108 g     F .text	00000230 Lcd_TFT_Test
30032f40 g     F .text	000002e0 mp3_pcm_player
33fffb00 g       *ABS*	00000000 SVC_stack
30003c44 g     F .text	00000010 acoral_res_sys_init
300157a8 g     F .text	000000bc netif_find
3000147c g       .text	00000000 MMU_EnableICache
300123bc g     F .text	000000f4 tcpip_callback_with_block
300164f4 g     F .text	000000a4 pbuf_dechain
3000152c g       .text	00000000 MMU_InvalidateDCache
300321cc g     F .text	00000080 waveInPrepareHeader


