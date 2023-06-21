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

int route(){
	acoral_prints("hello\n");
	return 0;
}
void user_main(void)
{
acoral_period_policy_data_t* data;
data->prio = 20;
data->prio_type = ACORAL_ABSOLUTE_PRIO;
data->time = 1;
acoral_create_thread(route,512,NULL,"test",NULL,ACORAL_SCHED_POLICY_PERIOD,&data);
}
