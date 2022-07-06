O_TARGET := src.o
obj-y :=core.o policy.o sched.o thread.o comm_thrd.o int.o timer.o \
	mem.o event.o mutex.o
obj-y +=malloc.o #//TODO 对应CFG_MEM2
obj-y +=mbox.o #//TODO 对应CFG_EVT_MBOX
obj-y +=sem.o #//TODO 对应CFG_EVT_SEM
obj-y +=message.o #//TODO 对应CFG_MSG
obj-y +=period_thrd.o #//TODO 对应CFG_THRD_PERIOD
obj-y +=softdelay.o #//TODO 对应CFG_SOFT_DELAY
include $(TOPDIR)/rule.mk
