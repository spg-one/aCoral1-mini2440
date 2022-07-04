#ifndef ACORAL_PRINT_H
#define ACORAL_PRINT_H
#include<type.h>
#include<autocfg.h>
acoral_32 acoral_print(const acoral_char *fmt, ...);
acoral_32 acoral_sprint(acoral_char * buf, acoral_u32 size, const acoral_char *fmt, ...);
acoral_32 acoral_prints(const acoral_char * buf);
#define acoral_printerr acoral_print



#ifdef CFG_TEST
#define acoral_printk(str) acoral_prints(str)
#else
#define acoral_printk(fmt)
#endif

#ifdef CFG_DEBUG
#undef acoral_printk
#define acoral_printk(str) acoral_prints(str)
#define acoral_printdbg(str) acoral_prints(str)
#else
#undef acoral_printdbg(fmt)
#define acoral_printdbg(fmt)
#endif
#endif
