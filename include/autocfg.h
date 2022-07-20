/**
 * @file autocfg.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief aCoral一些配置头文件，属于历史遗留，以后还要删改
 * @version 1.0
 * @date 2022-07-08
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-08 <td>Standardized 
 *  </table>
 */
#ifndef AUTOCFG_H
#define AUTOCFG_H

#define AUTOCONF_INCLUDED

/*
 * kernel configuration
 */
#define CFG_MEM2 1
#define CFG_MEM2_SIZE (1024000)
#define CFG_THRD_PERIOD 1
#define CFG_HARD_RT_PRIO_NUM (0)
#define CFG_MAX_THREAD (40)
#define CFG_MIN_STACK_SIZE (1024)
#define CFG_EVT_MBOX 1
#define CFG_EVT_SEM 1
#define CFG_MSG 1
#define CFG_SOFT_DELAY 1
#define CFG_TICKS_PER_SEC (100)

/*
 * Driver configuration
 */
#define CFG_DRIVER 1
#define CFG_DRV_NET_DM9000 1

/*
 * Plugin configuration
 */
#define CFG_PLUGIN_NET 1

/*
 * User configuration
 */
#define CFG_SHELL 1

/*
 * System hacking
 */
#define CFG_BAUD_RATE (115200)
#define CFG_DEBUG 1
#endif