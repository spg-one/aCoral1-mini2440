#include"acoral.h"
#include"../include/shell.h"
void dummy(void *args){
	int i=0;
	while(1){
		i++;
//		LedControl(i);
		acoral_delay_self(1000);
	}
}
void user_main()
{
#ifdef CFG_TELNET_SHELL
	user_telnetd();
#endif
#ifdef CFG_WEB_SERVER
	user_httpd();
#endif
//	acoral_create_thread(dummy,256,NULL,NULL,20,0);
}
