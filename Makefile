TOPDIR=$(shell pwd)
ACORAL_INCLUDE_DIR=-I$(TOPDIR)/include -I$(TOPDIR)/kernel/include \
	-I$(TOPDIR)/hal/include \
       	-I$(TOPDIR)/lib/include\
       	-I$(TOPDIR)/driver/include\
       	-I$(TOPDIR)/plugin/include\
		-I$(TOPDIR)/user/include

CONFIG_SHELL:= $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
	else if [ -x /bin/bash ]; then echo /bin/bash; \
	else echo sh; fi ; fi)

PLUGIN_CPPFLAGS+=-I$(TOPDIR)/plugin/net/include\
		-I$(TOPDIR)/plugin/net/arch/include \
		-I$(TOPDIR)/plugin/net/include \
		-I$(TOPDIR)/plugin/net/include/ipv4

CLEAN_FILES = \
	acoral.elf \
	acoral.bin \
	acoral.nm \
	acoral.map\
	acoral.api\
	hal.api \
	acoral.t\
	acoral.d \
	acoral.x

all: acoral
	

#
# Include the make variables (CC, etc...)
#

CROSS_COMPILE   =/home/spg/Documents/aCoral/aCoral1-Tools/arm-2010q1/bin/arm-none-eabi-

AS              = $(CROSS_COMPILE)as
LD              = $(CROSS_COMPILE)ld
CC              = $(CROSS_COMPILE)gcc
CPP             = $(CC) -E
AR              = $(CROSS_COMPILE)ar
NM              = $(CROSS_COMPILE)nm
STRIP           = $(CROSS_COMPILE)strip
OBJCOPY         = $(CROSS_COMPILE)objcopy
OBJDUMP         = $(CROSS_COMPILE)objdump
HOSTCC     = gcc
MAKEFILES= $(TOPDIR)/.config
export TOPDIR CROSS_COMPILE AS LD CC HOSTCC\
	CPP AR NM STRIP OBJCOPY OBJDUMP MAKE MAKEFILES

#
# CC flags
#

CPPFLAGS =$(ACORAL_INCLUDE_DIR) $(PLUGIN_CPPFLAGS) $(BSP_CPPFLAGS)
CFLAGS = $(CPPFLAGS) -Wall -Wstrict-prototypes -g -fomit-frame-pointer
AFLAGS = $(CPPFLAGS)
export CPPFLAGS CFLAGS AFLAGS

CLIBS =-L$(shell dirname `$(CC) $(CFLAGS) -print-libgcc-file-name`) -lgcc

LINKFLAGS =-Bstatic -Thal/acoral.lds
OBJCOPYFLAGS = -R .comment -R .stab -R .stabstr


CORE_FILES=acoral.o

O_TARGET:=acoral.o
obj-y :=hal/hal.o kernel/kernel.o lib/lib.o\
	plugin/plugin.o user/user.o
obj-y +=driver/driver.o
obj-$(CFG_BSP)+=bsp/bsp.o
subdir-y=hal kernel lib plugin user
subdir-y +=driver
subdir-$(CFG_BSP)+=bsp

acoral:include/autocfg.h first_rule $(CORE_FILES)
	@echo "###System Configure###"
	@echo "######################"
	@$(LD) -v  \
		$(CORE_FILES) $(hal_EXT_FILES)\
		-o acoral.elf $(CLIBS) $(LINKFLAGS)
	@$(NM) -v -l acoral.elf > acoral.map
	@$(OBJCOPY) -O binary -S acoral.elf acoral.bin $(OBJCOPYFLAGS)
	@$(OBJDUMP) -S acoral.elf > acoral.d 
	@$(OBJDUMP) -t acoral.elf > acoral.t 
	@$(OBJDUMP) -x acoral.elf > acoral.x 
	cat acoral.t |grep ".text"|grep "acoral"|sort>acoral.api
	cat acoral.t |grep ".text"|grep "hal"|sort>hal.api




clean:
	find . \( -name '*.o' -o -name core -o -name ".*.flags" \) -type f -print \
	| grep -v lxdialog/ | xargs rm -f
	rm -f $(CLEAN_FILES) $(hal_CLEAN_FILES)

include rule.mk



