#include<acoral.h>
#include<plugin.h>
void plugin_init(void){
#ifdef CFG_PLUGIN_NET
	acoral_net_lwip_init();
#endif
}

