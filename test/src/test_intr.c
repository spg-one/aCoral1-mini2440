#include "acoral.h"
#include"../include/test.h"
acoral_u32 intr_delays[10];
acoral_u32 offset;
acoral_u32 intr_delay;


ACORAL_COMM_THREAD test(){
  while(1){
  	acoral_delay_self(2000);
	acoral_print("intr delay:%dus\n",intr_delay);
  }
}

void intr_init()
{
	acoral_create_thread(test, ACORAL_PRINT_STACK_SIZE,NULL,NULL,22, -1);
}

TEST_CALL(intr_init)
