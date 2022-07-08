#include<autocfg.h>
void brd_driver_init(){
	con_uart_init();

#ifdef CFG_DRV_NET_DM9000
	dm9000_init();
#endif
}

