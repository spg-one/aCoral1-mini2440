#ifndef ACORAL_PRINT_H
#define ACORAL_PRINT_H
#include<type.h>
#include<autocfg.h>
acoral_32 acoral_print(const acoral_char *fmt, ...);
acoral_32 acoral_sprint(acoral_char * buf, acoral_u32 size, const acoral_char *fmt, ...);
acoral_32 acoral_prints(const acoral_char * buf);
acoral_char acoral_putchar(acoral_char c);
#define acoral_printerr acoral_print

#ifdef CFG_DEBUG
#define acoral_printdbg(str) acoral_prints(str)
#endif
#endif
