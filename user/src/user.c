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
void user_main(void)
{

}
