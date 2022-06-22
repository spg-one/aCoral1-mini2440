#include<autocfg.h>
void brd_driver_init(){
#ifdef CFG_DRV_CON_UART
	con_uart_init();
#endif

#ifdef CFG_DRV_NET_DM9000
	dm9000_init();
#endif
}

