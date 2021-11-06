
acoral.elf:     file format elf32-littlearm


Disassembly of section .text:

30000000 <__ENTRY>:
30000000:	ea000015 	b	3000005c <ResetHandler>
30000004:	ea00000d 	b	30000040 <HandleUndef>
30000008:	ea00000d 	b	30000044 <HandleSWI>
3000000c:	ea00000e 	b	3000004c <HandlePabort>
30000010:	ea00000c 	b	30000048 <HandleDabort>
30000014:	eafffffe 	b	30000014 <__ENTRY+0x14>
30000018:	ea000007 	b	3000003c <HandleIRQ>
3000001c:	ea000005 	b	30000038 <HandleFIQ>
	...
30000028:	30000000 	.word	0x30000000
3000002c:	00000988 	.word	0x00000988
30000030:	00000000 	.word	0x00000000
30000034:	eafffffe 	b	30000034 <__ENTRY+0x34>

30000038 <HandleFIQ>:
30000038:	e59ff244 	ldr	pc, [pc, #580]	; 30000284 <mem_cfg_val+0x34>

3000003c <HandleIRQ>:
3000003c:	e59ff244 	ldr	pc, [pc, #580]	; 30000288 <mem_cfg_val+0x38>

30000040 <HandleUndef>:
30000040:	e59ff244 	ldr	pc, [pc, #580]	; 3000028c <mem_cfg_val+0x3c>

30000044 <HandleSWI>:
30000044:	e59ff240 	ldr	pc, [pc, #576]	; 3000028c <mem_cfg_val+0x3c>

30000048 <HandleDabort>:
30000048:	e59ff23c 	ldr	pc, [pc, #572]	; 3000028c <mem_cfg_val+0x3c>

3000004c <HandlePabort>:
3000004c:	e59ff238 	ldr	pc, [pc, #568]	; 3000028c <mem_cfg_val+0x3c>

30000050 <_text_start>:
30000050:	30000000 	.word	0x30000000

30000054 <_bss_start>:
30000054:	3000ed14 	.word	0x3000ed14

30000058 <_bss_end>:
30000058:	3001065c 	.word	0x3001065c

3000005c <ResetHandler>:
3000005c:	e3a01453 	mov	r1, #1392508928	; 0x53000000
30000060:	e3a02000 	mov	r2, #0
30000064:	e5812000 	str	r2, [r1]
30000068:	e3a0144a 	mov	r1, #1241513984	; 0x4a000000
3000006c:	e3e02000 	mvn	r2, #0
30000070:	e5812008 	str	r2, [r1, #8]
30000074:	e59f2214 	ldr	r2, [pc, #532]	; 30000290 <mem_cfg_val+0x40>
30000078:	e581201c 	str	r2, [r1, #28]
3000007c:	e3a01313 	mov	r1, #1275068416	; 0x4c000000
30000080:	e3e024ff 	mvn	r2, #-16777216	; 0xff000000
30000084:	e5812000 	str	r2, [r1]
30000088:	e3a01313 	mov	r1, #1275068416	; 0x4c000000
3000008c:	e3a02005 	mov	r2, #5
30000090:	e5812014 	str	r2, [r1, #20]
30000094:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
30000098:	e3811103 	orr	r1, r1, #-1073741824	; 0xc0000000
3000009c:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
300000a0:	e3a01313 	mov	r1, #1275068416	; 0x4c000000
300000a4:	e59f21e8 	ldr	r2, [pc, #488]	; 30000294 <mem_cfg_val+0x44>
300000a8:	e5812004 	str	r2, [r1, #4]
300000ac:	eb000058 	bl	30000214 <memsetup>
300000b0:	eb00003e 	bl	300001b0 <InitStacks>
300000b4:	e24f00bc 	sub	r0, pc, #188	; 0xbc
300000b8:	e51f1070 	ldr	r1, [pc, #-112]	; 30000050 <_text_start>
300000bc:	e1500001 	cmp	r0, r1
300000c0:	1b000004 	blne	300000d8 <copy_self>
300000c4:	e51f0078 	ldr	r0, [pc, #-120]	; 30000054 <_bss_start>
300000c8:	e51f1078 	ldr	r1, [pc, #-120]	; 30000058 <_bss_end>
300000cc:	eb000059 	bl	30000238 <mem_clear>
300000d0:	e59ff1ac 	ldr	pc, [pc, #428]	; 30000284 <mem_cfg_val+0x34>
300000d4:	eafffffe 	b	300000d4 <ResetHandler+0x78>

300000d8 <copy_self>:
300000d8:	e3a011b1 	mov	r1, #1073741868	; 0x4000002c
300000dc:	e3a00000 	mov	r0, #0
300000e0:	e5810000 	str	r0, [r1]
300000e4:	e3a0102c 	mov	r1, #44	; 0x2c
300000e8:	e5910000 	ldr	r0, [r1]
300000ec:	e3500000 	cmp	r0, #0
300000f0:	1a000003 	bne	30000104 <copy_from_rom>
300000f4:	e59f019c 	ldr	r0, [pc, #412]	; 30000298 <mem_cfg_val+0x48>
300000f8:	e3a011b1 	mov	r1, #1073741868	; 0x4000002c
300000fc:	e5810000 	str	r0, [r1]
30000100:	ea000006 	b	30000120 <copy_from_nand>

30000104 <copy_from_rom>:
30000104:	e51f10bc 	ldr	r1, [pc, #-188]	; 30000050 <_text_start>
30000108:	e51f30bc 	ldr	r3, [pc, #-188]	; 30000054 <_bss_start>
3000010c:	e4902004 	ldr	r2, [r0], #4
30000110:	e4812004 	str	r2, [r1], #4
30000114:	e1510003 	cmp	r1, r3
30000118:	bafffff9 	blt	30000104 <copy_from_rom>
3000011c:	e1a0f00e 	mov	pc, lr

30000120 <copy_from_nand>:
30000120:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30000124:	eb000316 	bl	30000d84 <nand_init>
30000128:	e51f00e0 	ldr	r0, [pc, #-224]	; 30000050 <_text_start>
3000012c:	e3a01000 	mov	r1, #0
30000130:	e51f30e4 	ldr	r3, [pc, #-228]	; 30000054 <_bss_start>
30000134:	e0432000 	sub	r2, r3, r0
30000138:	eb000420 	bl	300011c0 <nand_read>
3000013c:	e3500000 	cmp	r0, #0
30000140:	0a000007 	beq	30000164 <ok_nand_read>

30000144 <bad_nand_read>:
30000144:	e59f0150 	ldr	r0, [pc, #336]	; 3000029c <mem_cfg_val+0x4c>
30000148:	e3a01a01 	mov	r1, #4096	; 0x1000
3000014c:	e5801000 	str	r1, [r0]
30000150:	e59f0148 	ldr	r0, [pc, #328]	; 300002a0 <mem_cfg_val+0x50>
30000154:	e3a01000 	mov	r1, #0
30000158:	e5801000 	str	r1, [r0]
3000015c:	eafffffe 	b	3000015c <bad_nand_read+0x18>
30000160:	eafffff7 	b	30000144 <bad_nand_read>

30000164 <ok_nand_read>:
30000164:	e3a00000 	mov	r0, #0
30000168:	e51f1120 	ldr	r1, [pc, #-288]	; 30000050 <_text_start>
3000016c:	e3a02c02 	mov	r2, #512	; 0x200

30000170 <go_next>:
30000170:	e4903004 	ldr	r3, [r0], #4
30000174:	e4914004 	ldr	r4, [r1], #4
30000178:	e1530004 	cmp	r3, r4
3000017c:	1a000002 	bne	3000018c <notmatch>
30000180:	e1500002 	cmp	r0, r2
30000184:	0a000008 	beq	300001ac <out>
30000188:	eafffff8 	b	30000170 <go_next>

3000018c <notmatch>:
3000018c:	e59f0108 	ldr	r0, [pc, #264]	; 3000029c <mem_cfg_val+0x4c>
30000190:	e3a01b01 	mov	r1, #1024	; 0x400
30000194:	e5801000 	str	r1, [r0]
30000198:	e59f0100 	ldr	r0, [pc, #256]	; 300002a0 <mem_cfg_val+0x50>
3000019c:	e3a01000 	mov	r1, #0
300001a0:	e5801000 	str	r1, [r0]
300001a4:	eafffffe 	b	300001a4 <notmatch+0x18>
300001a8:	eafffff7 	b	3000018c <notmatch>

300001ac <out>:
300001ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)

300001b0 <InitStacks>:
300001b0:	e1a0200e 	mov	r2, lr
300001b4:	e10f0000 	mrs	r0, CPSR
300001b8:	e3c0001f 	bic	r0, r0, #31
300001bc:	e38010db 	orr	r1, r0, #219	; 0xdb
300001c0:	e12ff001 	msr	CPSR_fsxc, r1
300001c4:	e59fd0d8 	ldr	sp, [pc, #216]	; 300002a4 <mem_cfg_val+0x54>
300001c8:	e38010d7 	orr	r1, r0, #215	; 0xd7
300001cc:	e12ff001 	msr	CPSR_fsxc, r1
300001d0:	e59fd0d0 	ldr	sp, [pc, #208]	; 300002a8 <mem_cfg_val+0x58>
300001d4:	e38010d2 	orr	r1, r0, #210	; 0xd2
300001d8:	e12ff001 	msr	CPSR_fsxc, r1
300001dc:	e59fd0c8 	ldr	sp, [pc, #200]	; 300002ac <mem_cfg_val+0x5c>
300001e0:	e38010d1 	orr	r1, r0, #209	; 0xd1
300001e4:	e12ff001 	msr	CPSR_fsxc, r1
300001e8:	e59fd0c0 	ldr	sp, [pc, #192]	; 300002b0 <mem_cfg_val+0x60>
300001ec:	e3c000df 	bic	r0, r0, #223	; 0xdf
300001f0:	e3801013 	orr	r1, r0, #19
300001f4:	e12ff001 	msr	CPSR_fsxc, r1
300001f8:	e59fd0b4 	ldr	sp, [pc, #180]	; 300002b4 <mem_cfg_val+0x64>
300001fc:	e10f0000 	mrs	r0, CPSR
30000200:	e3c0001f 	bic	r0, r0, #31
30000204:	e38010df 	orr	r1, r0, #223	; 0xdf
30000208:	e12ff001 	msr	CPSR_fsxc, r1
3000020c:	e59fd0a4 	ldr	sp, [pc, #164]	; 300002b8 <mem_cfg_val+0x68>
30000210:	e1a0f002 	mov	pc, r2

30000214 <memsetup>:
30000214:	e3a01312 	mov	r1, #1207959552	; 0x48000000
30000218:	e28f2030 	add	r2, pc, #48	; 0x30
3000021c:	e1a00000 	nop			; (mov r0, r0)
30000220:	e2813034 	add	r3, r1, #52	; 0x34
30000224:	e4924004 	ldr	r4, [r2], #4
30000228:	e4814004 	str	r4, [r1], #4
3000022c:	e1510003 	cmp	r1, r3
30000230:	1afffffb 	bne	30000224 <memsetup+0x10>
30000234:	e1a0f00e 	mov	pc, lr

30000238 <mem_clear>:
30000238:	e3a02000 	mov	r2, #0
3000023c:	e4802004 	str	r2, [r0], #4
30000240:	e1500001 	cmp	r0, r1
30000244:	bafffffc 	blt	3000023c <mem_clear+0x4>
30000248:	e1a0f00e 	mov	pc, lr
3000024c:	e1a00000 	nop			; (mov r0, r0)

30000250 <mem_cfg_val>:
30000250:	22111110 	.word	0x22111110
30000254:	00000700 	.word	0x00000700
30000258:	00000700 	.word	0x00000700
3000025c:	00000700 	.word	0x00000700
30000260:	00000700 	.word	0x00000700
30000264:	00000700 	.word	0x00000700
30000268:	00000700 	.word	0x00000700
3000026c:	00018009 	.word	0x00018009
30000270:	00018009 	.word	0x00018009
30000274:	008e04eb 	.word	0x008e04eb
30000278:	000000b2 	.word	0x000000b2
3000027c:	00000030 	.word	0x00000030
30000280:	00000030 	.word	0x00000030
30000284:	30001a98 	.word	0x30001a98
30000288:	3000166c 	.word	0x3000166c
3000028c:	300016a8 	.word	0x300016a8
30000290:	000007ff 	.word	0x000007ff
30000294:	0007f021 	.word	0x0007f021
30000298:	00000988 	.word	0x00000988
3000029c:	56000010 	.word	0x56000010
300002a0:	56000014 	.word	0x56000014
300002a4:	33fffc00 	.word	0x33fffc00
300002a8:	33fffd00 	.word	0x33fffd00
300002ac:	33ffff00 	.word	0x33ffff00
300002b0:	33ffff00 	.word	0x33ffff00
300002b4:	33fffb00 	.word	0x33fffb00
300002b8:	33fff900 	.word	0x33fff900
300002bc:	e1a00000 	nop			; (mov r0, r0)

300002c0 <hal_stack_init>:
	acoral_u32 r12;
	acoral_u32 lr;
	acoral_u32 pc;
}hal_ctx_t;

void hal_stack_init(acoral_u32 **stk,void (*route)(),void (*exit)(),void *args){
300002c0:	e24dd018 	sub	sp, sp, #24
300002c4:	e58d000c 	str	r0, [sp, #12]
300002c8:	e58d1008 	str	r1, [sp, #8]
300002cc:	e58d2004 	str	r2, [sp, #4]
300002d0:	e58d3000 	str	r3, [sp]
	hal_ctx_t *ctx=(hal_ctx_t *)*stk;	
300002d4:	e59d300c 	ldr	r3, [sp, #12]
300002d8:	e5933000 	ldr	r3, [r3]
300002dc:	e58d3014 	str	r3, [sp, #20]
	ctx--;
300002e0:	e59d3014 	ldr	r3, [sp, #20]
300002e4:	e2433040 	sub	r3, r3, #64	; 0x40
300002e8:	e58d3014 	str	r3, [sp, #20]
	ctx=(hal_ctx_t *)((acoral_u32 *)ctx+1);
300002ec:	e59d3014 	ldr	r3, [sp, #20]
300002f0:	e2833004 	add	r3, r3, #4
300002f4:	e58d3014 	str	r3, [sp, #20]
	ctx->r0=(acoral_u32)args;
300002f8:	e59d2000 	ldr	r2, [sp]
300002fc:	e59d3014 	ldr	r3, [sp, #20]
30000300:	e5832004 	str	r2, [r3, #4]
	ctx->r1=1;
30000304:	e59d3014 	ldr	r3, [sp, #20]
30000308:	e3a02001 	mov	r2, #1
3000030c:	e5832008 	str	r2, [r3, #8]
	ctx->r2=2;
30000310:	e59d3014 	ldr	r3, [sp, #20]
30000314:	e3a02002 	mov	r2, #2
30000318:	e583200c 	str	r2, [r3, #12]
	ctx->r3=3;
3000031c:	e59d3014 	ldr	r3, [sp, #20]
30000320:	e3a02003 	mov	r2, #3
30000324:	e5832010 	str	r2, [r3, #16]
	ctx->r4=4;
30000328:	e59d3014 	ldr	r3, [sp, #20]
3000032c:	e3a02004 	mov	r2, #4
30000330:	e5832014 	str	r2, [r3, #20]
	ctx->r5=5;
30000334:	e59d3014 	ldr	r3, [sp, #20]
30000338:	e3a02005 	mov	r2, #5
3000033c:	e5832018 	str	r2, [r3, #24]
	ctx->r6=6;
30000340:	e59d3014 	ldr	r3, [sp, #20]
30000344:	e3a02006 	mov	r2, #6
30000348:	e583201c 	str	r2, [r3, #28]
	ctx->r7=7;
3000034c:	e59d3014 	ldr	r3, [sp, #20]
30000350:	e3a02007 	mov	r2, #7
30000354:	e5832020 	str	r2, [r3, #32]
	ctx->r8=8;
30000358:	e59d3014 	ldr	r3, [sp, #20]
3000035c:	e3a02008 	mov	r2, #8
30000360:	e5832024 	str	r2, [r3, #36]	; 0x24
	ctx->r9=9;
30000364:	e59d3014 	ldr	r3, [sp, #20]
30000368:	e3a02009 	mov	r2, #9
3000036c:	e5832028 	str	r2, [r3, #40]	; 0x28
	ctx->r10=10;
30000370:	e59d3014 	ldr	r3, [sp, #20]
30000374:	e3a0200a 	mov	r2, #10
30000378:	e583202c 	str	r2, [r3, #44]	; 0x2c
	ctx->r11=11;
3000037c:	e59d3014 	ldr	r3, [sp, #20]
30000380:	e3a0200b 	mov	r2, #11
30000384:	e5832030 	str	r2, [r3, #48]	; 0x30
	ctx->r12=12;
30000388:	e59d3014 	ldr	r3, [sp, #20]
3000038c:	e3a0200c 	mov	r2, #12
30000390:	e5832034 	str	r2, [r3, #52]	; 0x34
	ctx->lr=(acoral_u32)exit;
30000394:	e59d2004 	ldr	r2, [sp, #4]
30000398:	e59d3014 	ldr	r3, [sp, #20]
3000039c:	e5832038 	str	r2, [r3, #56]	; 0x38
	ctx->pc=(acoral_u32)route;
300003a0:	e59d2008 	ldr	r2, [sp, #8]
300003a4:	e59d3014 	ldr	r3, [sp, #20]
300003a8:	e583203c 	str	r2, [r3, #60]	; 0x3c
	ctx->cpsr=0x0000001fL;
300003ac:	e59d3014 	ldr	r3, [sp, #20]
300003b0:	e3a0201f 	mov	r2, #31
300003b4:	e5832000 	str	r2, [r3]
    *stk=(acoral_u32 *)ctx;
300003b8:	e59d2014 	ldr	r2, [sp, #20]
300003bc:	e59d300c 	ldr	r3, [sp, #12]
300003c0:	e5832000 	str	r2, [r3]
}
300003c4:	e28dd018 	add	sp, sp, #24
300003c8:	e12fff1e 	bx	lr

300003cc <hal_all_entry>:
#include<acoral.h>
#include<hal_2440_cfg.h>
#include<hal_2440_c.h>
void hal_all_entry(acoral_vector vector){
300003cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300003d0:	e24dd014 	sub	sp, sp, #20
300003d4:	e58d0004 	str	r0, [sp, #4]
    unsigned long eint;
    unsigned long irq=4;
300003d8:	e3a03004 	mov	r3, #4
300003dc:	e58d300c 	str	r3, [sp, #12]
    if(vector==4||vector==5){
300003e0:	e59d3004 	ldr	r3, [sp, #4]
300003e4:	e3530004 	cmp	r3, #4
300003e8:	0a000002 	beq	300003f8 <hal_all_entry+0x2c>
300003ec:	e59d3004 	ldr	r3, [sp, #4]
300003f0:	e3530005 	cmp	r3, #5
300003f4:	1a000016 	bne	30000454 <hal_all_entry+0x88>
    	eint=rEINTPND;
300003f8:	e3a03456 	mov	r3, #1442840576	; 0x56000000
300003fc:	e28330a8 	add	r3, r3, #168	; 0xa8
30000400:	e5933000 	ldr	r3, [r3]
30000404:	e58d3008 	str	r3, [sp, #8]
    	for(;irq<24;irq++){
30000408:	ea00000e 	b	30000448 <hal_all_entry+0x7c>
      		 if(eint & (1<<irq)){
3000040c:	e59d300c 	ldr	r3, [sp, #12]
30000410:	e3a02001 	mov	r2, #1
30000414:	e1a03312 	lsl	r3, r2, r3
30000418:	e1a02003 	mov	r2, r3
3000041c:	e59d3008 	ldr	r3, [sp, #8]
30000420:	e0023003 	and	r3, r2, r3
30000424:	e3530000 	cmp	r3, #0
30000428:	0a000003 	beq	3000043c <hal_all_entry+0x70>
           		acoral_intr_entry(irq);
3000042c:	e59d300c 	ldr	r3, [sp, #12]
30000430:	e1a00003 	mov	r0, r3
30000434:	eb000ef4 	bl	3000400c <acoral_intr_entry>
           		return;
30000438:	ea000012 	b	30000488 <hal_all_entry+0xbc>
void hal_all_entry(acoral_vector vector){
    unsigned long eint;
    unsigned long irq=4;
    if(vector==4||vector==5){
    	eint=rEINTPND;
    	for(;irq<24;irq++){
3000043c:	e59d300c 	ldr	r3, [sp, #12]
30000440:	e2833001 	add	r3, r3, #1
30000444:	e58d300c 	str	r3, [sp, #12]
30000448:	e59d300c 	ldr	r3, [sp, #12]
3000044c:	e3530017 	cmp	r3, #23
30000450:	9affffed 	bls	3000040c <hal_all_entry+0x40>
           		acoral_intr_entry(irq);
           		return;
           	 }
    	}
    }
    if(vector>5)
30000454:	e59d3004 	ldr	r3, [sp, #4]
30000458:	e3530005 	cmp	r3, #5
3000045c:	da000002 	ble	3000046c <hal_all_entry+0xa0>
    	vector+=18;
30000460:	e59d3004 	ldr	r3, [sp, #4]
30000464:	e2833012 	add	r3, r3, #18
30000468:	e58d3004 	str	r3, [sp, #4]
    if(vector==4)
3000046c:	e59d3004 	ldr	r3, [sp, #4]
30000470:	e3530004 	cmp	r3, #4
30000474:	1a000001 	bne	30000480 <hal_all_entry+0xb4>
    	acoral_prints("DErr\n");
30000478:	e59f0014 	ldr	r0, [pc, #20]	; 30000494 <hal_all_entry+0xc8>
3000047c:	eb002c0b 	bl	3000b4b0 <acoral_prints>
    acoral_intr_entry(vector);
30000480:	e59d0004 	ldr	r0, [sp, #4]
30000484:	eb000ee0 	bl	3000400c <acoral_intr_entry>
}
30000488:	e28dd014 	add	sp, sp, #20
3000048c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30000490:	e12fff1e 	bx	lr
30000494:	3000e3f0 	.word	0x3000e3f0

30000498 <hal_intr_unmask>:

static void hal_intr_unmask(acoral_vector vector){
30000498:	e24dd008 	sub	sp, sp, #8
3000049c:	e58d0004 	str	r0, [sp, #4]
          if((vector>3) && (vector<8)){
300004a0:	e59d3004 	ldr	r3, [sp, #4]
300004a4:	e3530003 	cmp	r3, #3
300004a8:	da000010 	ble	300004f0 <hal_intr_unmask+0x58>
300004ac:	e59d3004 	ldr	r3, [sp, #4]
300004b0:	e3530007 	cmp	r3, #7
300004b4:	ca00000d 	bgt	300004f0 <hal_intr_unmask+0x58>
               rEINTMSK &=~(1<<vector);
300004b8:	e3a03456 	mov	r3, #1442840576	; 0x56000000
300004bc:	e28330a4 	add	r3, r3, #164	; 0xa4
300004c0:	e3a02456 	mov	r2, #1442840576	; 0x56000000
300004c4:	e28220a4 	add	r2, r2, #164	; 0xa4
300004c8:	e5921000 	ldr	r1, [r2]
300004cc:	e3a00001 	mov	r0, #1
300004d0:	e59d2004 	ldr	r2, [sp, #4]
300004d4:	e1a02210 	lsl	r2, r0, r2
300004d8:	e1e02002 	mvn	r2, r2
300004dc:	e0012002 	and	r2, r1, r2
300004e0:	e5832000 	str	r2, [r3]
               vector = 4;
300004e4:	e3a03004 	mov	r3, #4
300004e8:	e58d3004 	str	r3, [sp, #4]
    	acoral_prints("DErr\n");
    acoral_intr_entry(vector);
}

static void hal_intr_unmask(acoral_vector vector){
          if((vector>3) && (vector<8)){
300004ec:	ea000019 	b	30000558 <hal_intr_unmask+0xc0>
               rEINTMSK &=~(1<<vector);
               vector = 4;
           }
         else if((vector>7) && (vector<24)){
300004f0:	e59d3004 	ldr	r3, [sp, #4]
300004f4:	e3530007 	cmp	r3, #7
300004f8:	da000010 	ble	30000540 <hal_intr_unmask+0xa8>
300004fc:	e59d3004 	ldr	r3, [sp, #4]
30000500:	e3530017 	cmp	r3, #23
30000504:	ca00000d 	bgt	30000540 <hal_intr_unmask+0xa8>
               rEINTMSK &=~(1<<vector);
30000508:	e3a03456 	mov	r3, #1442840576	; 0x56000000
3000050c:	e28330a4 	add	r3, r3, #164	; 0xa4
30000510:	e3a02456 	mov	r2, #1442840576	; 0x56000000
30000514:	e28220a4 	add	r2, r2, #164	; 0xa4
30000518:	e5921000 	ldr	r1, [r2]
3000051c:	e3a00001 	mov	r0, #1
30000520:	e59d2004 	ldr	r2, [sp, #4]
30000524:	e1a02210 	lsl	r2, r0, r2
30000528:	e1e02002 	mvn	r2, r2
3000052c:	e0012002 	and	r2, r1, r2
30000530:	e5832000 	str	r2, [r3]
               vector = 5;
30000534:	e3a03005 	mov	r3, #5
30000538:	e58d3004 	str	r3, [sp, #4]
static void hal_intr_unmask(acoral_vector vector){
          if((vector>3) && (vector<8)){
               rEINTMSK &=~(1<<vector);
               vector = 4;
           }
         else if((vector>7) && (vector<24)){
3000053c:	ea000005 	b	30000558 <hal_intr_unmask+0xc0>
               rEINTMSK &=~(1<<vector);
               vector = 5;
           }
         else if(vector > 23)
30000540:	e59d3004 	ldr	r3, [sp, #4]
30000544:	e3530017 	cmp	r3, #23
30000548:	da000002 	ble	30000558 <hal_intr_unmask+0xc0>
               vector -= 18; 
3000054c:	e59d3004 	ldr	r3, [sp, #4]
30000550:	e2433012 	sub	r3, r3, #18
30000554:	e58d3004 	str	r3, [sp, #4]

         rINTMSK &=~(1<<vector);			/*开启中断*/
30000558:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
3000055c:	e2833008 	add	r3, r3, #8
30000560:	e3a0244a 	mov	r2, #1241513984	; 0x4a000000
30000564:	e2822008 	add	r2, r2, #8
30000568:	e5921000 	ldr	r1, [r2]
3000056c:	e3a00001 	mov	r0, #1
30000570:	e59d2004 	ldr	r2, [sp, #4]
30000574:	e1a02210 	lsl	r2, r0, r2
30000578:	e1e02002 	mvn	r2, r2
3000057c:	e0012002 	and	r2, r1, r2
30000580:	e5832000 	str	r2, [r3]
}
30000584:	e28dd008 	add	sp, sp, #8
30000588:	e12fff1e 	bx	lr

3000058c <hal_intr_mask>:

static void hal_intr_mask(acoral_vector vector){
3000058c:	e24dd008 	sub	sp, sp, #8
30000590:	e58d0004 	str	r0, [sp, #4]

         if((vector>3) && (vector<8)){
30000594:	e59d3004 	ldr	r3, [sp, #4]
30000598:	e3530003 	cmp	r3, #3
3000059c:	da00000f 	ble	300005e0 <hal_intr_mask+0x54>
300005a0:	e59d3004 	ldr	r3, [sp, #4]
300005a4:	e3530007 	cmp	r3, #7
300005a8:	ca00000c 	bgt	300005e0 <hal_intr_mask+0x54>
               rEINTMSK |=(1<<vector);
300005ac:	e3a03456 	mov	r3, #1442840576	; 0x56000000
300005b0:	e28330a4 	add	r3, r3, #164	; 0xa4
300005b4:	e3a02456 	mov	r2, #1442840576	; 0x56000000
300005b8:	e28220a4 	add	r2, r2, #164	; 0xa4
300005bc:	e5921000 	ldr	r1, [r2]
300005c0:	e3a00001 	mov	r0, #1
300005c4:	e59d2004 	ldr	r2, [sp, #4]
300005c8:	e1a02210 	lsl	r2, r0, r2
300005cc:	e1812002 	orr	r2, r1, r2
300005d0:	e5832000 	str	r2, [r3]
               vector = 4;
300005d4:	e3a03004 	mov	r3, #4
300005d8:	e58d3004 	str	r3, [sp, #4]
         rINTMSK &=~(1<<vector);			/*开启中断*/
}

static void hal_intr_mask(acoral_vector vector){

         if((vector>3) && (vector<8)){
300005dc:	ea000018 	b	30000644 <hal_intr_mask+0xb8>
               rEINTMSK |=(1<<vector);
               vector = 4;
           }
         else if((vector>7) && (vector<24)){
300005e0:	e59d3004 	ldr	r3, [sp, #4]
300005e4:	e3530007 	cmp	r3, #7
300005e8:	da00000f 	ble	3000062c <hal_intr_mask+0xa0>
300005ec:	e59d3004 	ldr	r3, [sp, #4]
300005f0:	e3530017 	cmp	r3, #23
300005f4:	ca00000c 	bgt	3000062c <hal_intr_mask+0xa0>
               rEINTMSK |=(1<<vector);
300005f8:	e3a03456 	mov	r3, #1442840576	; 0x56000000
300005fc:	e28330a4 	add	r3, r3, #164	; 0xa4
30000600:	e3a02456 	mov	r2, #1442840576	; 0x56000000
30000604:	e28220a4 	add	r2, r2, #164	; 0xa4
30000608:	e5921000 	ldr	r1, [r2]
3000060c:	e3a00001 	mov	r0, #1
30000610:	e59d2004 	ldr	r2, [sp, #4]
30000614:	e1a02210 	lsl	r2, r0, r2
30000618:	e1812002 	orr	r2, r1, r2
3000061c:	e5832000 	str	r2, [r3]
               vector = 5;
30000620:	e3a03005 	mov	r3, #5
30000624:	e58d3004 	str	r3, [sp, #4]

         if((vector>3) && (vector<8)){
               rEINTMSK |=(1<<vector);
               vector = 4;
           }
         else if((vector>7) && (vector<24)){
30000628:	ea000005 	b	30000644 <hal_intr_mask+0xb8>
               rEINTMSK |=(1<<vector);
               vector = 5;
           }
         else if(vector > 23)
3000062c:	e59d3004 	ldr	r3, [sp, #4]
30000630:	e3530017 	cmp	r3, #23
30000634:	da000002 	ble	30000644 <hal_intr_mask+0xb8>
               vector -= 18; 
30000638:	e59d3004 	ldr	r3, [sp, #4]
3000063c:	e2433012 	sub	r3, r3, #18
30000640:	e58d3004 	str	r3, [sp, #4]

         rINTMSK |= (1<<vector);
30000644:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
30000648:	e2833008 	add	r3, r3, #8
3000064c:	e3a0244a 	mov	r2, #1241513984	; 0x4a000000
30000650:	e2822008 	add	r2, r2, #8
30000654:	e5921000 	ldr	r1, [r2]
30000658:	e3a00001 	mov	r0, #1
3000065c:	e59d2004 	ldr	r2, [sp, #4]
30000660:	e1a02210 	lsl	r2, r0, r2
30000664:	e1812002 	orr	r2, r1, r2
30000668:	e5832000 	str	r2, [r3]
}
3000066c:	e28dd008 	add	sp, sp, #8
30000670:	e12fff1e 	bx	lr

30000674 <hal_intr_ack>:

static void hal_intr_ack(acoral_u32 vector){
30000674:	e24dd008 	sub	sp, sp, #8
30000678:	e58d0004 	str	r0, [sp, #4]

        if((vector>3) && (vector<8)){
3000067c:	e59d3004 	ldr	r3, [sp, #4]
30000680:	e3530003 	cmp	r3, #3
30000684:	9a000010 	bls	300006cc <hal_intr_ack+0x58>
30000688:	e59d3004 	ldr	r3, [sp, #4]
3000068c:	e3530007 	cmp	r3, #7
30000690:	8a00000d 	bhi	300006cc <hal_intr_ack+0x58>
               rEINTPND &= ~(1<<vector);
30000694:	e3a03456 	mov	r3, #1442840576	; 0x56000000
30000698:	e28330a8 	add	r3, r3, #168	; 0xa8
3000069c:	e3a02456 	mov	r2, #1442840576	; 0x56000000
300006a0:	e28220a8 	add	r2, r2, #168	; 0xa8
300006a4:	e5921000 	ldr	r1, [r2]
300006a8:	e59d2004 	ldr	r2, [sp, #4]
300006ac:	e3a00001 	mov	r0, #1
300006b0:	e1a02210 	lsl	r2, r0, r2
300006b4:	e1e02002 	mvn	r2, r2
300006b8:	e0012002 	and	r2, r1, r2
300006bc:	e5832000 	str	r2, [r3]
               vector = 4;
300006c0:	e3a03004 	mov	r3, #4
300006c4:	e58d3004 	str	r3, [sp, #4]
         rINTMSK |= (1<<vector);
}

static void hal_intr_ack(acoral_u32 vector){

        if((vector>3) && (vector<8)){
300006c8:	ea000019 	b	30000734 <hal_intr_ack+0xc0>
               rEINTPND &= ~(1<<vector);
               vector = 4;
           }
        else if((vector>7) && (vector<24)){
300006cc:	e59d3004 	ldr	r3, [sp, #4]
300006d0:	e3530007 	cmp	r3, #7
300006d4:	9a000010 	bls	3000071c <hal_intr_ack+0xa8>
300006d8:	e59d3004 	ldr	r3, [sp, #4]
300006dc:	e3530017 	cmp	r3, #23
300006e0:	8a00000d 	bhi	3000071c <hal_intr_ack+0xa8>
               rEINTPND &= ~(1<<vector);
300006e4:	e3a03456 	mov	r3, #1442840576	; 0x56000000
300006e8:	e28330a8 	add	r3, r3, #168	; 0xa8
300006ec:	e3a02456 	mov	r2, #1442840576	; 0x56000000
300006f0:	e28220a8 	add	r2, r2, #168	; 0xa8
300006f4:	e5921000 	ldr	r1, [r2]
300006f8:	e59d2004 	ldr	r2, [sp, #4]
300006fc:	e3a00001 	mov	r0, #1
30000700:	e1a02210 	lsl	r2, r0, r2
30000704:	e1e02002 	mvn	r2, r2
30000708:	e0012002 	and	r2, r1, r2
3000070c:	e5832000 	str	r2, [r3]
               vector = 5;
30000710:	e3a03005 	mov	r3, #5
30000714:	e58d3004 	str	r3, [sp, #4]

        if((vector>3) && (vector<8)){
               rEINTPND &= ~(1<<vector);
               vector = 4;
           }
        else if((vector>7) && (vector<24)){
30000718:	ea000005 	b	30000734 <hal_intr_ack+0xc0>
               rEINTPND &= ~(1<<vector);
               vector = 5;
           }
        else if(vector > 23)
3000071c:	e59d3004 	ldr	r3, [sp, #4]
30000720:	e3530017 	cmp	r3, #23
30000724:	9a000002 	bls	30000734 <hal_intr_ack+0xc0>
               vector -= 18;
30000728:	e59d3004 	ldr	r3, [sp, #4]
3000072c:	e2433012 	sub	r3, r3, #18
30000730:	e58d3004 	str	r3, [sp, #4]
   
        
        rSRCPND = 1<<vector;
30000734:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
30000738:	e59d2004 	ldr	r2, [sp, #4]
3000073c:	e3a01001 	mov	r1, #1
30000740:	e1a02211 	lsl	r2, r1, r2
30000744:	e5832000 	str	r2, [r3]
		rINTPND = 1<<vector;		
30000748:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
3000074c:	e2833010 	add	r3, r3, #16
30000750:	e59d2004 	ldr	r2, [sp, #4]
30000754:	e3a01001 	mov	r1, #1
30000758:	e1a02211 	lsl	r2, r1, r2
3000075c:	e5832000 	str	r2, [r3]
}
30000760:	e28dd008 	add	sp, sp, #8
30000764:	e12fff1e 	bx	lr

30000768 <hal_intr_init>:

void hal_intr_init(){
30000768:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000076c:	e24dd00c 	sub	sp, sp, #12
	acoral_u32 i;
    /*配置中断管脚*/

	/*中断触发模式*/
	rEXTINT0 = 0x22222222;		/* EINT[7:0]*/
30000770:	e3a02456 	mov	r2, #1442840576	; 0x56000000
30000774:	e2822088 	add	r2, r2, #136	; 0x88
30000778:	e3a03c22 	mov	r3, #8704	; 0x2200
3000077c:	e2833022 	add	r3, r3, #34	; 0x22
30000780:	e1833803 	orr	r3, r3, r3, lsl #16
30000784:	e5823000 	str	r3, [r2]
    rEXTINT1 = 0x22222222;		/* EINT[15:8]*/
30000788:	e3a02456 	mov	r2, #1442840576	; 0x56000000
3000078c:	e282208c 	add	r2, r2, #140	; 0x8c
30000790:	e3a03c22 	mov	r3, #8704	; 0x2200
30000794:	e2833022 	add	r3, r3, #34	; 0x22
30000798:	e1833803 	orr	r3, r3, r3, lsl #16
3000079c:	e5823000 	str	r3, [r2]
    rEXTINT2 = 0x22222222;		/* EINT[23:16]*/
300007a0:	e3a02456 	mov	r2, #1442840576	; 0x56000000
300007a4:	e2822090 	add	r2, r2, #144	; 0x90
300007a8:	e3a03c22 	mov	r3, #8704	; 0x2200
300007ac:	e2833022 	add	r3, r3, #34	; 0x22
300007b0:	e1833803 	orr	r3, r3, r3, lsl #16
300007b4:	e5823000 	str	r3, [r2]

  	rPRIORITY = 0x00000000;		/* 使用默认的固定的优先级*/
300007b8:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
300007bc:	e283300c 	add	r3, r3, #12
300007c0:	e3a02000 	mov	r2, #0
300007c4:	e5832000 	str	r2, [r3]
	rINTMOD = 0x00000000;		/* 所有中断均为IRQ中断*/
300007c8:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
300007cc:	e2833004 	add	r3, r3, #4
300007d0:	e3a02000 	mov	r2, #0
300007d4:	e5832000 	str	r2, [r3]
    rEINTMSK= 0xffffffff;      /*屏蔽所有外部中断*/
300007d8:	e3a03456 	mov	r3, #1442840576	; 0x56000000
300007dc:	e28330a4 	add	r3, r3, #164	; 0xa4
300007e0:	e3e02000 	mvn	r2, #0
300007e4:	e5832000 	str	r2, [r3]
    rINTMSK = 0xffffffff;       /*屏蔽所有中断*/
300007e8:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
300007ec:	e2833008 	add	r3, r3, #8
300007f0:	e3e02000 	mvn	r2, #0
300007f4:	e5832000 	str	r2, [r3]

	for(i=HAL_INTR_MIN;i<=HAL_INTR_MAX;i++){
300007f8:	e3a03000 	mov	r3, #0
300007fc:	e58d3004 	str	r3, [sp, #4]
30000800:	ea00000e 	b	30000840 <hal_intr_init+0xd8>
		acoral_set_intr_enter(i,hal_intr_ack);
30000804:	e59d0004 	ldr	r0, [sp, #4]
30000808:	e59f1048 	ldr	r1, [pc, #72]	; 30000858 <hal_intr_init+0xf0>
3000080c:	eb000e8b 	bl	30004240 <acoral_set_intr_enter>
		acoral_set_intr_exit(i,NULL);
30000810:	e59d0004 	ldr	r0, [sp, #4]
30000814:	e3a01000 	mov	r1, #0
30000818:	eb000e9b 	bl	3000428c <acoral_set_intr_exit>
		acoral_set_intr_mask(i,hal_intr_mask);
3000081c:	e59d0004 	ldr	r0, [sp, #4]
30000820:	e59f1034 	ldr	r1, [pc, #52]	; 3000085c <hal_intr_init+0xf4>
30000824:	eb000eab 	bl	300042d8 <acoral_set_intr_mask>
		acoral_set_intr_unmask(i,hal_intr_unmask);
30000828:	e59d0004 	ldr	r0, [sp, #4]
3000082c:	e59f102c 	ldr	r1, [pc, #44]	; 30000860 <hal_intr_init+0xf8>
30000830:	eb000ebb 	bl	30004324 <acoral_set_intr_unmask>
  	rPRIORITY = 0x00000000;		/* 使用默认的固定的优先级*/
	rINTMOD = 0x00000000;		/* 所有中断均为IRQ中断*/
    rEINTMSK= 0xffffffff;      /*屏蔽所有外部中断*/
    rINTMSK = 0xffffffff;       /*屏蔽所有中断*/

	for(i=HAL_INTR_MIN;i<=HAL_INTR_MAX;i++){
30000834:	e59d3004 	ldr	r3, [sp, #4]
30000838:	e2833001 	add	r3, r3, #1
3000083c:	e58d3004 	str	r3, [sp, #4]
30000840:	e59d3004 	ldr	r3, [sp, #4]
30000844:	e3530031 	cmp	r3, #49	; 0x31
30000848:	9affffed 	bls	30000804 <hal_intr_init+0x9c>
		acoral_set_intr_enter(i,hal_intr_ack);
		acoral_set_intr_exit(i,NULL);
		acoral_set_intr_mask(i,hal_intr_mask);
		acoral_set_intr_unmask(i,hal_intr_unmask);
	}
}
3000084c:	e28dd00c 	add	sp, sp, #12
30000850:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30000854:	e12fff1e 	bx	lr
30000858:	30000674 	.word	0x30000674
3000085c:	3000058c 	.word	0x3000058c
30000860:	30000498 	.word	0x30000498

30000864 <hal_ticks_init>:
/****************************************
*****这个函数的作用是初始化滴答时钟数据**
****************相关数据*****************
*****************************************/
void hal_ticks_init(){
  	rTCON = rTCON & (~0xf) ;	/* clear manual update bit, stop Timer0*/
30000864:	e3a03451 	mov	r3, #1358954496	; 0x51000000
30000868:	e2833008 	add	r3, r3, #8
3000086c:	e3a02451 	mov	r2, #1358954496	; 0x51000000
30000870:	e2822008 	add	r2, r2, #8
30000874:	e5922000 	ldr	r2, [r2]
30000878:	e3c2200f 	bic	r2, r2, #15
3000087c:	e5832000 	str	r2, [r3]
    rTCFG0 &= 0xFFFF00;
30000880:	e3a02451 	mov	r2, #1358954496	; 0x51000000
30000884:	e3a03451 	mov	r3, #1358954496	; 0x51000000
30000888:	e5933000 	ldr	r3, [r3]
3000088c:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
30000890:	e3c330ff 	bic	r3, r3, #255	; 0xff
30000894:	e5823000 	str	r3, [r2]
 	rTCFG0 |= 0xF9;				/* prescaler等于249*/
30000898:	e3a03451 	mov	r3, #1358954496	; 0x51000000
3000089c:	e3a02451 	mov	r2, #1358954496	; 0x51000000
300008a0:	e5922000 	ldr	r2, [r2]
300008a4:	e38220f9 	orr	r2, r2, #249	; 0xf9
300008a8:	e5832000 	str	r2, [r3]
 	rTCFG1 &= ~0x0000F;   
300008ac:	e3a03451 	mov	r3, #1358954496	; 0x51000000
300008b0:	e2833004 	add	r3, r3, #4
300008b4:	e3a02451 	mov	r2, #1358954496	; 0x51000000
300008b8:	e2822004 	add	r2, r2, #4
300008bc:	e5922000 	ldr	r2, [r2]
300008c0:	e3c2200f 	bic	r2, r2, #15
300008c4:	e5832000 	str	r2, [r3]
 	rTCFG1 |= 0x2;			   /*divider等于8，则设置定时器4的时钟频率为25kHz*/
300008c8:	e3a03451 	mov	r3, #1358954496	; 0x51000000
300008cc:	e2833004 	add	r3, r3, #4
300008d0:	e3a02451 	mov	r2, #1358954496	; 0x51000000
300008d4:	e2822004 	add	r2, r2, #4
300008d8:	e5922000 	ldr	r2, [r2]
300008dc:	e3822002 	orr	r2, r2, #2
300008e0:	e5832000 	str	r2, [r3]

   	rTCNTB0 = PCLK /(8*(249+1)*ACORAL_TICKS_PER_SEC);
300008e4:	e3a03451 	mov	r3, #1358954496	; 0x51000000
300008e8:	e283300c 	add	r3, r3, #12
300008ec:	e3a020fa 	mov	r2, #250	; 0xfa
300008f0:	e5832000 	str	r2, [r3]
   	rTCON = rTCON & (~0xf) |0x02;              	/* updata*/
300008f4:	e3a03451 	mov	r3, #1358954496	; 0x51000000
300008f8:	e2833008 	add	r3, r3, #8
300008fc:	e3a02451 	mov	r2, #1358954496	; 0x51000000
30000900:	e2822008 	add	r2, r2, #8
30000904:	e5922000 	ldr	r2, [r2]
30000908:	e3c2200f 	bic	r2, r2, #15
3000090c:	e3822002 	orr	r2, r2, #2
30000910:	e5832000 	str	r2, [r3]
	rTCON = rTCON & (~0xf) |0x09; 			/* star*/
30000914:	e3a03451 	mov	r3, #1358954496	; 0x51000000
30000918:	e2833008 	add	r3, r3, #8
3000091c:	e3a02451 	mov	r2, #1358954496	; 0x51000000
30000920:	e2822008 	add	r2, r2, #8
30000924:	e5922000 	ldr	r2, [r2]
30000928:	e3c2200f 	bic	r2, r2, #15
3000092c:	e3822009 	orr	r2, r2, #9
30000930:	e5832000 	str	r2, [r3]
}
30000934:	e12fff1e 	bx	lr

30000938 <hal_ticks_delay>:

acoral_u32 hal_ticks_delay(){
30000938:	e24dd008 	sub	sp, sp, #8
	acoral_u32 initial;
	acoral_u32 current;
	initial=rTCNTB0;
3000093c:	e3a03451 	mov	r3, #1358954496	; 0x51000000
30000940:	e283300c 	add	r3, r3, #12
30000944:	e5933000 	ldr	r3, [r3]
30000948:	e58d3000 	str	r3, [sp]
	current=rTCNTO0;
3000094c:	e3a03451 	mov	r3, #1358954496	; 0x51000000
30000950:	e2833014 	add	r3, r3, #20
30000954:	e5933000 	ldr	r3, [r3]
30000958:	e58d3004 	str	r3, [sp, #4]
	return (initial-current);
3000095c:	e59d2000 	ldr	r2, [sp]
30000960:	e59d3004 	ldr	r3, [sp, #4]
30000964:	e0633002 	rsb	r3, r3, r2
}
30000968:	e1a00003 	mov	r0, r3
3000096c:	e28dd008 	add	sp, sp, #8
30000970:	e12fff1e 	bx	lr

30000974 <hal_mem_init>:
#include"hal_2440_cfg.h"
extern acoral_u32 MMU_base[];
extern acoral_u32 __ENTRY[];
static void hal_mmu_init(void);

void hal_mem_init(){
30000974:	e92d4008 	push	{r3, lr}
  	hal_mmu_init();
30000978:	eb000022 	bl	30000a08 <hal_mmu_init>
}
3000097c:	e8bd4008 	pop	{r3, lr}
30000980:	e12fff1e 	bx	lr

30000984 <flush_cache>:

void flush_cache(){
30000984:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30000988:	e24dd00c 	sub	sp, sp, #12
    acoral_32 i,j;
    MMU_DisableDCache();
3000098c:	eb0002c6 	bl	300014ac <MMU_DisableDCache>
    MMU_DisableICache();
30000990:	eb0002bd 	bl	3000148c <MMU_DisableICache>
    /*If write-back is used,the DCache should be cleared.*/
    for(i=0;i<64;i++)
30000994:	e3a03000 	mov	r3, #0
30000998:	e58d3000 	str	r3, [sp]
3000099c:	ea000012 	b	300009ec <flush_cache+0x68>
    	for(j=0;j<8;j++)
300009a0:	e3a03000 	mov	r3, #0
300009a4:	e58d3004 	str	r3, [sp, #4]
300009a8:	ea000009 	b	300009d4 <flush_cache+0x50>
    	    MMU_CleanInvalidateDCacheIndex((i<<26)|(j<<5));
300009ac:	e59d3000 	ldr	r3, [sp]
300009b0:	e1a02d03 	lsl	r2, r3, #26
300009b4:	e59d3004 	ldr	r3, [sp, #4]
300009b8:	e1a03283 	lsl	r3, r3, #5
300009bc:	e1823003 	orr	r3, r2, r3
300009c0:	e1a00003 	mov	r0, r3
300009c4:	eb0002e2 	bl	30001554 <MMU_CleanInvalidateDCacheIndex>
    acoral_32 i,j;
    MMU_DisableDCache();
    MMU_DisableICache();
    /*If write-back is used,the DCache should be cleared.*/
    for(i=0;i<64;i++)
    	for(j=0;j<8;j++)
300009c8:	e59d3004 	ldr	r3, [sp, #4]
300009cc:	e2833001 	add	r3, r3, #1
300009d0:	e58d3004 	str	r3, [sp, #4]
300009d4:	e59d3004 	ldr	r3, [sp, #4]
300009d8:	e3530007 	cmp	r3, #7
300009dc:	dafffff2 	ble	300009ac <flush_cache+0x28>
void flush_cache(){
    acoral_32 i,j;
    MMU_DisableDCache();
    MMU_DisableICache();
    /*If write-back is used,the DCache should be cleared.*/
    for(i=0;i<64;i++)
300009e0:	e59d3000 	ldr	r3, [sp]
300009e4:	e2833001 	add	r3, r3, #1
300009e8:	e58d3000 	str	r3, [sp]
300009ec:	e59d3000 	ldr	r3, [sp]
300009f0:	e353003f 	cmp	r3, #63	; 0x3f
300009f4:	daffffe9 	ble	300009a0 <flush_cache+0x1c>
    	for(j=0;j<8;j++)
    	    MMU_CleanInvalidateDCacheIndex((i<<26)|(j<<5));
    MMU_InvalidateICache();
300009f8:	eb0002c5 	bl	30001514 <MMU_InvalidateICache>

}
300009fc:	e28dd00c 	add	sp, sp, #12
30000a00:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30000a04:	e12fff1e 	bx	lr

30000a08 <hal_mmu_init>:
static void hal_mmu_init(void)
{
30000a08:	e92d4008 	push	{r3, lr}
    /*The current stack and code area can't be re-mapped in this routine.*/
    /*If you want memory map mapped freely, your own sophiscated MMU*/
    /*initialization code is needed.*/
    /*===================================================================*/

    flush_cache(); 
30000a0c:	ebffffdc 	bl	30000984 <flush_cache>
    MMU_DisableMMU();
30000a10:	eb0002b5 	bl	300014ec <MMU_DisableMMU>
    MMU_InvalidateTLB();
30000a14:	eb0002d2 	bl	30001564 <MMU_InvalidateTLB>
    /*hal_mmu_setmtt(acoral_32 vaddrStart,acoral_32 vaddrEnd,acoral_32 paddrStart,acoral_32 attr)*/
    /*hal_mmu_setmtt(0x00000000,0x07f00000,0x00000000,RW_CNB);  bank0*/
    hal_mmu_setmtt(0x00000000,0x03f00000,(acoral_32)__ENTRY,RW_CB);  /*bank0*/
30000a18:	e59f31d8 	ldr	r3, [pc, #472]	; 30000bf8 <hal_mmu_init+0x1f0>
30000a1c:	e3a00000 	mov	r0, #0
30000a20:	e3a0163f 	mov	r1, #66060288	; 0x3f00000
30000a24:	e1a02003 	mov	r2, r3
30000a28:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000a2c:	e283300e 	add	r3, r3, #14
30000a30:	eb000073 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x04000000,0x07f00000,0,RW_NCNB);  			/*bank0*/
30000a34:	e3a00301 	mov	r0, #67108864	; 0x4000000
30000a38:	e3a0167f 	mov	r1, #133169152	; 0x7f00000
30000a3c:	e3a02000 	mov	r2, #0
30000a40:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000a44:	e2833002 	add	r3, r3, #2
30000a48:	eb00006d 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x08000000,0x0ff00000,0x08000000,RW_CNB);  /*bank1*/
30000a4c:	e3a00302 	mov	r0, #134217728	; 0x8000000
30000a50:	e3a016ff 	mov	r1, #267386880	; 0xff00000
30000a54:	e3a02302 	mov	r2, #134217728	; 0x8000000
30000a58:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000a5c:	e283300a 	add	r3, r3, #10
30000a60:	eb000067 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x10000000,0x17f00000,0x10000000,RW_NCNB); /*bank2*/
30000a64:	e3a00201 	mov	r0, #268435456	; 0x10000000
30000a68:	e3a0155f 	mov	r1, #398458880	; 0x17c00000
30000a6c:	e2811603 	add	r1, r1, #3145728	; 0x300000
30000a70:	e3a02201 	mov	r2, #268435456	; 0x10000000
30000a74:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000a78:	e2833002 	add	r3, r3, #2
30000a7c:	eb000060 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x18000000,0x1ff00000,0x18000000,RW_NCNB); /*bank3*/
30000a80:	e3a00306 	mov	r0, #402653184	; 0x18000000
30000a84:	e3a0157f 	mov	r1, #532676608	; 0x1fc00000
30000a88:	e2811603 	add	r1, r1, #3145728	; 0x300000
30000a8c:	e3a02306 	mov	r2, #402653184	; 0x18000000
30000a90:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000a94:	e2833002 	add	r3, r3, #2
30000a98:	eb000059 	bl	30000c04 <hal_mmu_setmtt>
    /*hal_mmu_setmtt(0x20000000,0x27f00000,0x20000000,RW_CB); bank4*/
    hal_mmu_setmtt(0x20000000,0x27f00000,0x20000000,RW_NCNB); /*bank4 for STRATA Flash*/
30000a9c:	e3a00202 	mov	r0, #536870912	; 0x20000000
30000aa0:	e3a0159f 	mov	r1, #666894336	; 0x27c00000
30000aa4:	e2811603 	add	r1, r1, #3145728	; 0x300000
30000aa8:	e3a02202 	mov	r2, #536870912	; 0x20000000
30000aac:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000ab0:	e2833002 	add	r3, r3, #2
30000ab4:	eb000052 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x28000000,0x2ff00000,0x28000000,RW_NCNB); /*bank5*/
30000ab8:	e3a0030a 	mov	r0, #671088640	; 0x28000000
30000abc:	e3a015bf 	mov	r1, #801112064	; 0x2fc00000
30000ac0:	e2811603 	add	r1, r1, #3145728	; 0x300000
30000ac4:	e3a0230a 	mov	r2, #671088640	; 0x28000000
30000ac8:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000acc:	e2833002 	add	r3, r3, #2
30000ad0:	eb00004b 	bl	30000c04 <hal_mmu_setmtt>
    /*30f00000->30100000, 31000000->30200000*/
    hal_mmu_setmtt(0x30000000,0x30100000,0x30000000,RW_CNB);	  /*bank6-1*/
30000ad4:	e3a00203 	mov	r0, #805306368	; 0x30000000
30000ad8:	e3a01203 	mov	r1, #805306368	; 0x30000000
30000adc:	e2811601 	add	r1, r1, #1048576	; 0x100000
30000ae0:	e3a02203 	mov	r2, #805306368	; 0x30000000
30000ae4:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000ae8:	e283300a 	add	r3, r3, #10
30000aec:	eb000044 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x30200000,0x33e00000,0x30200000,RW_CNB); /*bank6-2*/
30000af0:	e3a00203 	mov	r0, #805306368	; 0x30000000
30000af4:	e2800602 	add	r0, r0, #2097152	; 0x200000
30000af8:	e3a015cf 	mov	r1, #868220928	; 0x33c00000
30000afc:	e2811602 	add	r1, r1, #2097152	; 0x200000
30000b00:	e3a02203 	mov	r2, #805306368	; 0x30000000
30000b04:	e2822602 	add	r2, r2, #2097152	; 0x200000
30000b08:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000b0c:	e283300a 	add	r3, r3, #10
30000b10:	eb00003b 	bl	30000c04 <hal_mmu_setmtt>
    /**/
    hal_mmu_setmtt(0x33f00000,0x33f00000,0x33f00000,RW_NCNB);   /*bank6-3*/
30000b14:	e3a005cf 	mov	r0, #868220928	; 0x33c00000
30000b18:	e2800603 	add	r0, r0, #3145728	; 0x300000
30000b1c:	e3a015cf 	mov	r1, #868220928	; 0x33c00000
30000b20:	e2811603 	add	r1, r1, #3145728	; 0x300000
30000b24:	e3a025cf 	mov	r2, #868220928	; 0x33c00000
30000b28:	e2822603 	add	r2, r2, #3145728	; 0x300000
30000b2c:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000b30:	e2833002 	add	r3, r3, #2
30000b34:	eb000032 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x38000000,0x3ff00000,0x38000000,RW_NCNB); /*bank7*/
30000b38:	e3a0030e 	mov	r0, #939524096	; 0x38000000
30000b3c:	e3a015ff 	mov	r1, #1069547520	; 0x3fc00000
30000b40:	e2811603 	add	r1, r1, #3145728	; 0x300000
30000b44:	e3a0230e 	mov	r2, #939524096	; 0x38000000
30000b48:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000b4c:	e2833002 	add	r3, r3, #2
30000b50:	eb00002b 	bl	30000c04 <hal_mmu_setmtt>

    hal_mmu_setmtt(0x40000000,0x47f00000,0x40000000,RW_NCNB); /*SFR*/
30000b54:	e3a00101 	mov	r0, #1073741824	; 0x40000000
30000b58:	e3a01447 	mov	r1, #1191182336	; 0x47000000
30000b5c:	e281160f 	add	r1, r1, #15728640	; 0xf00000
30000b60:	e3a02101 	mov	r2, #1073741824	; 0x40000000
30000b64:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000b68:	e2833002 	add	r3, r3, #2
30000b6c:	eb000024 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x48000000,0x5af00000,0x48000000,RW_NCNB); /*SFR*/
30000b70:	e3a00312 	mov	r0, #1207959552	; 0x48000000
30000b74:	e3a0145a 	mov	r1, #1509949440	; 0x5a000000
30000b78:	e281160f 	add	r1, r1, #15728640	; 0xf00000
30000b7c:	e3a02312 	mov	r2, #1207959552	; 0x48000000
30000b80:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000b84:	e2833002 	add	r3, r3, #2
30000b88:	eb00001d 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x5b000000,0x5b000000,0x5b000000,RW_NCNB); /*SFR*/
30000b8c:	e3a0045b 	mov	r0, #1526726656	; 0x5b000000
30000b90:	e3a0145b 	mov	r1, #1526726656	; 0x5b000000
30000b94:	e3a0245b 	mov	r2, #1526726656	; 0x5b000000
30000b98:	e3a03ec1 	mov	r3, #3088	; 0xc10
30000b9c:	e2833002 	add	r3, r3, #2
30000ba0:	eb000017 	bl	30000c04 <hal_mmu_setmtt>
    hal_mmu_setmtt(0x5b100000,0xfff00000,0x5b100000,RW_FAULT);/*not used*/
30000ba4:	e3a0045b 	mov	r0, #1526726656	; 0x5b000000
30000ba8:	e2800601 	add	r0, r0, #1048576	; 0x100000
30000bac:	e3a01102 	mov	r1, #-2147483648	; 0x80000000
30000bb0:	e1a015c1 	asr	r1, r1, #11
30000bb4:	e3a0245b 	mov	r2, #1526726656	; 0x5b000000
30000bb8:	e2822601 	add	r2, r2, #1048576	; 0x100000
30000bbc:	e3a03ec3 	mov	r3, #3120	; 0xc30
30000bc0:	e2833002 	add	r3, r3, #2
30000bc4:	eb00000e 	bl	30000c04 <hal_mmu_setmtt>


    MMU_SetTTBase(&MMU_base);
30000bc8:	e59f002c 	ldr	r0, [pc, #44]	; 30000bfc <hal_mmu_init+0x1f4>
30000bcc:	eb00024a 	bl	300014fc <MMU_SetTTBase>
    MMU_SetDomain(0x55555550|DOMAIN1_ATTR|DOMAIN0_ATTR);
30000bd0:	e59f0028 	ldr	r0, [pc, #40]	; 30000c00 <hal_mmu_init+0x1f8>
30000bd4:	eb00024a 	bl	30001504 <MMU_SetDomain>
    	/*DOMAIN1: no_access, DOMAIN0,2~15=client(AP is checked)*/
    MMU_SetProcessId(0x0);
30000bd8:	e3a00000 	mov	r0, #0
30000bdc:	eb000268 	bl	30001584 <MMU_SetProcessId>
    MMU_EnableAlignFault();
30000be0:	eb000235 	bl	300014bc <MMU_EnableAlignFault>
    MMU_EnableMMU();
30000be4:	eb00023c 	bl	300014dc <MMU_EnableMMU>
    MMU_EnableICache();
30000be8:	eb000223 	bl	3000147c <MMU_EnableICache>
    MMU_EnableDCache(); /*DCache should be turned on after MMU is turned on.*/
30000bec:	eb00022a 	bl	3000149c <MMU_EnableDCache>
}
30000bf0:	e8bd4008 	pop	{r3, lr}
30000bf4:	e12fff1e 	bx	lr
30000bf8:	30000000 	.word	0x30000000
30000bfc:	33f00000 	.word	0x33f00000
30000c00:	55555551 	.word	0x55555551

30000c04 <hal_mmu_setmtt>:


void hal_mmu_setmtt(acoral_32 vaddrStart,acoral_32 vaddrEnd,acoral_32 paddrStart,acoral_32 attr)
{
30000c04:	e24dd020 	sub	sp, sp, #32
30000c08:	e58d000c 	str	r0, [sp, #12]
30000c0c:	e58d1008 	str	r1, [sp, #8]
30000c10:	e58d2004 	str	r2, [sp, #4]
30000c14:	e58d3000 	str	r3, [sp]
    volatile acoral_u32 *pTT;
    volatile acoral_32 i,nSec;
    pTT=MMU_base+(vaddrStart>>20);
30000c18:	e59f208c 	ldr	r2, [pc, #140]	; 30000cac <hal_mmu_setmtt+0xa8>
30000c1c:	e59d300c 	ldr	r3, [sp, #12]
30000c20:	e1a03a43 	asr	r3, r3, #20
30000c24:	e1a03103 	lsl	r3, r3, #2
30000c28:	e0823003 	add	r3, r2, r3
30000c2c:	e58d301c 	str	r3, [sp, #28]
    nSec=(vaddrEnd>>20)-(vaddrStart>>20);
30000c30:	e59d3008 	ldr	r3, [sp, #8]
30000c34:	e1a02a43 	asr	r2, r3, #20
30000c38:	e59d300c 	ldr	r3, [sp, #12]
30000c3c:	e1a03a43 	asr	r3, r3, #20
30000c40:	e0633002 	rsb	r3, r3, r2
30000c44:	e58d3014 	str	r3, [sp, #20]
    for(i=0;i<=nSec;i++)*pTT++=attr |(((paddrStart>>20)+i)<<20);
30000c48:	e3a03000 	mov	r3, #0
30000c4c:	e58d3018 	str	r3, [sp, #24]
30000c50:	ea00000f 	b	30000c94 <hal_mmu_setmtt+0x90>
30000c54:	e59d3004 	ldr	r3, [sp, #4]
30000c58:	e1a02a43 	asr	r2, r3, #20
30000c5c:	e59d3018 	ldr	r3, [sp, #24]
30000c60:	e0823003 	add	r3, r2, r3
30000c64:	e1a02a03 	lsl	r2, r3, #20
30000c68:	e59d3000 	ldr	r3, [sp]
30000c6c:	e1823003 	orr	r3, r2, r3
30000c70:	e1a02003 	mov	r2, r3
30000c74:	e59d301c 	ldr	r3, [sp, #28]
30000c78:	e5832000 	str	r2, [r3]
30000c7c:	e59d301c 	ldr	r3, [sp, #28]
30000c80:	e2833004 	add	r3, r3, #4
30000c84:	e58d301c 	str	r3, [sp, #28]
30000c88:	e59d3018 	ldr	r3, [sp, #24]
30000c8c:	e2833001 	add	r3, r3, #1
30000c90:	e58d3018 	str	r3, [sp, #24]
30000c94:	e59d2018 	ldr	r2, [sp, #24]
30000c98:	e59d3014 	ldr	r3, [sp, #20]
30000c9c:	e1520003 	cmp	r2, r3
30000ca0:	daffffeb 	ble	30000c54 <hal_mmu_setmtt+0x50>
}
30000ca4:	e28dd020 	add	sp, sp, #32
30000ca8:	e12fff1e 	bx	lr
30000cac:	33f00000 	.word	0x33f00000

30000cb0 <nand_wait>:

void nand_init(void);
int nand_read(unsigned char *buf, unsigned long start_addr, int size);

static void nand_wait(void)
{
30000cb0:	e24dd008 	sub	sp, sp, #8
  int i;
  while (!(NFSTAT & NFSTAT_BUSY))
30000cb4:	ea000008 	b	30000cdc <nand_wait+0x2c>
   for (i=0; i<10; i++);
30000cb8:	e3a03000 	mov	r3, #0
30000cbc:	e58d3004 	str	r3, [sp, #4]
30000cc0:	ea000002 	b	30000cd0 <nand_wait+0x20>
30000cc4:	e59d3004 	ldr	r3, [sp, #4]
30000cc8:	e2833001 	add	r3, r3, #1
30000ccc:	e58d3004 	str	r3, [sp, #4]
30000cd0:	e59d3004 	ldr	r3, [sp, #4]
30000cd4:	e3530009 	cmp	r3, #9
30000cd8:	dafffff9 	ble	30000cc4 <nand_wait+0x14>
int nand_read(unsigned char *buf, unsigned long start_addr, int size);

static void nand_wait(void)
{
  int i;
  while (!(NFSTAT & NFSTAT_BUSY))
30000cdc:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000ce0:	e2833020 	add	r3, r3, #32
30000ce4:	e5d33000 	ldrb	r3, [r3]
30000ce8:	e20330ff 	and	r3, r3, #255	; 0xff
30000cec:	e2033004 	and	r3, r3, #4
30000cf0:	e3530000 	cmp	r3, #0
30000cf4:	0affffef 	beq	30000cb8 <nand_wait+0x8>
   for (i=0; i<10; i++);
}
30000cf8:	e28dd008 	add	sp, sp, #8
30000cfc:	e12fff1e 	bx	lr

30000d00 <nand_reset>:


static void nand_reset(){
30000d00:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30000d04:	e24dd00c 	sub	sp, sp, #12
   int i;

   nand_select();
30000d08:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000d0c:	e2833004 	add	r3, r3, #4
30000d10:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
30000d14:	e2822004 	add	r2, r2, #4
30000d18:	e5922000 	ldr	r2, [r2]
30000d1c:	e3c22002 	bic	r2, r2, #2
30000d20:	e5832000 	str	r2, [r3]
   NFCMD=NAND_CMD_RESET;
30000d24:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000d28:	e2833008 	add	r3, r3, #8
30000d2c:	e3e02000 	mvn	r2, #0
30000d30:	e5c32000 	strb	r2, [r3]
   for(i=0;i<10;i++);  
30000d34:	e3a03000 	mov	r3, #0
30000d38:	e58d3004 	str	r3, [sp, #4]
30000d3c:	ea000002 	b	30000d4c <nand_reset+0x4c>
30000d40:	e59d3004 	ldr	r3, [sp, #4]
30000d44:	e2833001 	add	r3, r3, #1
30000d48:	e58d3004 	str	r3, [sp, #4]
30000d4c:	e59d3004 	ldr	r3, [sp, #4]
30000d50:	e3530009 	cmp	r3, #9
30000d54:	dafffff9 	ble	30000d40 <nand_reset+0x40>
   nand_wait();  
30000d58:	ebffffd4 	bl	30000cb0 <nand_wait>
   nand_deselect();
30000d5c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000d60:	e2833004 	add	r3, r3, #4
30000d64:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
30000d68:	e2822004 	add	r2, r2, #4
30000d6c:	e5922000 	ldr	r2, [r2]
30000d70:	e3822002 	orr	r2, r2, #2
30000d74:	e5832000 	str	r2, [r3]
}
30000d78:	e28dd00c 	add	sp, sp, #12
30000d7c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30000d80:	e12fff1e 	bx	lr

30000d84 <nand_init>:


void nand_init(void){
30000d84:	e92d4008 	push	{r3, lr}
   

    NFCONF=(7<<12)|(7<<8)|(7<<4)|(0<<0);
30000d88:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
30000d8c:	e3a03c77 	mov	r3, #30464	; 0x7700
30000d90:	e2833070 	add	r3, r3, #112	; 0x70
30000d94:	e5823000 	str	r3, [r2]
    NFCONT=(1<<4)|(0<<1)|(1<<0);
30000d98:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000d9c:	e2833004 	add	r3, r3, #4
30000da0:	e3a02011 	mov	r2, #17
30000da4:	e5832000 	str	r2, [r3]
    
    nand_reset();
30000da8:	ebffffd4 	bl	30000d00 <nand_reset>
}
30000dac:	e8bd4008 	pop	{r3, lr}
30000db0:	e12fff1e 	bx	lr

30000db4 <is_bad_block>:
    int bad_block_offset;
};


static int is_bad_block(struct boot_nand_t * nand, unsigned long i)
{
30000db4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30000db8:	e24dd014 	sub	sp, sp, #20
30000dbc:	e58d0004 	str	r0, [sp, #4]
30000dc0:	e58d1000 	str	r1, [sp]
	unsigned char data;
	unsigned long page_num;

	nand_clear_RnB();
30000dc4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000dc8:	e2833020 	add	r3, r3, #32
30000dcc:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
30000dd0:	e2822020 	add	r2, r2, #32
30000dd4:	e5d22000 	ldrb	r2, [r2]
30000dd8:	e20220ff 	and	r2, r2, #255	; 0xff
30000ddc:	e3822004 	orr	r2, r2, #4
30000de0:	e20220ff 	and	r2, r2, #255	; 0xff
30000de4:	e5c32000 	strb	r2, [r3]
	if (nand->page_size == 512) {
30000de8:	e59d3004 	ldr	r3, [sp, #4]
30000dec:	e5933000 	ldr	r3, [r3]
30000df0:	e3530c02 	cmp	r3, #512	; 0x200
30000df4:	1a00001d 	bne	30000e70 <is_bad_block+0xbc>
		NFCMD = NAND_CMD_READOOB; /* 0x50 */
30000df8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000dfc:	e2833008 	add	r3, r3, #8
30000e00:	e3a02050 	mov	r2, #80	; 0x50
30000e04:	e5c32000 	strb	r2, [r3]
		NFADDR = nand->bad_block_offset & 0xf;
30000e08:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000e0c:	e283300c 	add	r3, r3, #12
30000e10:	e59d2004 	ldr	r2, [sp, #4]
30000e14:	e5922008 	ldr	r2, [r2, #8]
30000e18:	e20220ff 	and	r2, r2, #255	; 0xff
30000e1c:	e202200f 	and	r2, r2, #15
30000e20:	e5c32000 	strb	r2, [r3]
		NFADDR = (i >> 9) & 0xff;
30000e24:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000e28:	e283300c 	add	r3, r3, #12
30000e2c:	e59d2000 	ldr	r2, [sp]
30000e30:	e1a024a2 	lsr	r2, r2, #9
30000e34:	e20220ff 	and	r2, r2, #255	; 0xff
30000e38:	e5c32000 	strb	r2, [r3]
		NFADDR = (i >> 17) & 0xff;
30000e3c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000e40:	e283300c 	add	r3, r3, #12
30000e44:	e59d2000 	ldr	r2, [sp]
30000e48:	e1a028a2 	lsr	r2, r2, #17
30000e4c:	e20220ff 	and	r2, r2, #255	; 0xff
30000e50:	e5c32000 	strb	r2, [r3]
		NFADDR = (i >> 25) & 0xff;
30000e54:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000e58:	e283300c 	add	r3, r3, #12
30000e5c:	e59d2000 	ldr	r2, [sp]
30000e60:	e1a02ca2 	lsr	r2, r2, #25
30000e64:	e20220ff 	and	r2, r2, #255	; 0xff
30000e68:	e5c32000 	strb	r2, [r3]
30000e6c:	ea00002f 	b	30000f30 <is_bad_block+0x17c>
	} else if (nand->page_size == 2048) {
30000e70:	e59d3004 	ldr	r3, [sp, #4]
30000e74:	e5933000 	ldr	r3, [r3]
30000e78:	e3530b02 	cmp	r3, #2048	; 0x800
30000e7c:	1a000029 	bne	30000f28 <is_bad_block+0x174>
		page_num = i >> 11; /* addr / 2048 */
30000e80:	e59d3000 	ldr	r3, [sp]
30000e84:	e1a035a3 	lsr	r3, r3, #11
30000e88:	e58d300c 	str	r3, [sp, #12]
		NFCMD = NAND_CMD_READ0;
30000e8c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000e90:	e2833008 	add	r3, r3, #8
30000e94:	e3a02000 	mov	r2, #0
30000e98:	e5c32000 	strb	r2, [r3]
		NFADDR = nand->bad_block_offset & 0xff;
30000e9c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000ea0:	e283300c 	add	r3, r3, #12
30000ea4:	e59d2004 	ldr	r2, [sp, #4]
30000ea8:	e5922008 	ldr	r2, [r2, #8]
30000eac:	e20220ff 	and	r2, r2, #255	; 0xff
30000eb0:	e5c32000 	strb	r2, [r3]
		NFADDR = (nand->bad_block_offset >> 8) & 0xff;
30000eb4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000eb8:	e283300c 	add	r3, r3, #12
30000ebc:	e59d2004 	ldr	r2, [sp, #4]
30000ec0:	e5922008 	ldr	r2, [r2, #8]
30000ec4:	e1a02442 	asr	r2, r2, #8
30000ec8:	e20220ff 	and	r2, r2, #255	; 0xff
30000ecc:	e5c32000 	strb	r2, [r3]
		NFADDR = page_num & 0xff;
30000ed0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000ed4:	e283300c 	add	r3, r3, #12
30000ed8:	e59d200c 	ldr	r2, [sp, #12]
30000edc:	e20220ff 	and	r2, r2, #255	; 0xff
30000ee0:	e5c32000 	strb	r2, [r3]
		NFADDR = (page_num >> 8) & 0xff;
30000ee4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000ee8:	e283300c 	add	r3, r3, #12
30000eec:	e59d200c 	ldr	r2, [sp, #12]
30000ef0:	e1a02422 	lsr	r2, r2, #8
30000ef4:	e20220ff 	and	r2, r2, #255	; 0xff
30000ef8:	e5c32000 	strb	r2, [r3]
		NFADDR = (page_num >> 16) & 0xff;
30000efc:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000f00:	e283300c 	add	r3, r3, #12
30000f04:	e59d200c 	ldr	r2, [sp, #12]
30000f08:	e1a02822 	lsr	r2, r2, #16
30000f0c:	e20220ff 	and	r2, r2, #255	; 0xff
30000f10:	e5c32000 	strb	r2, [r3]
		NFCMD = NAND_CMD_READSTART;
30000f14:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000f18:	e2833008 	add	r3, r3, #8
30000f1c:	e3a02030 	mov	r2, #48	; 0x30
30000f20:	e5c32000 	strb	r2, [r3]
30000f24:	ea000001 	b	30000f30 <is_bad_block+0x17c>
	} else {
		return -1;
30000f28:	e3e03000 	mvn	r3, #0
30000f2c:	ea00000a 	b	30000f5c <is_bad_block+0x1a8>
	}
	nand_wait();
30000f30:	ebffff5e 	bl	30000cb0 <nand_wait>
	data = (NFDATA & 0xff);
30000f34:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000f38:	e2833010 	add	r3, r3, #16
30000f3c:	e5d33000 	ldrb	r3, [r3]
30000f40:	e5cd300b 	strb	r3, [sp, #11]
	if (data != 0xff)
30000f44:	e5dd300b 	ldrb	r3, [sp, #11]
30000f48:	e35300ff 	cmp	r3, #255	; 0xff
30000f4c:	0a000001 	beq	30000f58 <is_bad_block+0x1a4>
		return 1;
30000f50:	e3a03001 	mov	r3, #1
30000f54:	ea000000 	b	30000f5c <is_bad_block+0x1a8>

	return 0;
30000f58:	e3a03000 	mov	r3, #0
}
30000f5c:	e1a00003 	mov	r0, r3
30000f60:	e28dd014 	add	sp, sp, #20
30000f64:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30000f68:	e12fff1e 	bx	lr

30000f6c <nand_read_page>:

static int nand_read_page(struct boot_nand_t * nand, unsigned char *buf, unsigned long addr)
{
30000f6c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30000f70:	e24dd024 	sub	sp, sp, #36	; 0x24
30000f74:	e58d000c 	str	r0, [sp, #12]
30000f78:	e58d1008 	str	r1, [sp, #8]
30000f7c:	e58d2004 	str	r2, [sp, #4]
	unsigned short *ptr16 = (unsigned short *)buf;
30000f80:	e59d3008 	ldr	r3, [sp, #8]
30000f84:	e58d3014 	str	r3, [sp, #20]
	unsigned int i, page_num;

	nand_clear_RnB();
30000f88:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000f8c:	e2833020 	add	r3, r3, #32
30000f90:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
30000f94:	e2822020 	add	r2, r2, #32
30000f98:	e5d22000 	ldrb	r2, [r2]
30000f9c:	e20220ff 	and	r2, r2, #255	; 0xff
30000fa0:	e3822004 	orr	r2, r2, #4
30000fa4:	e20220ff 	and	r2, r2, #255	; 0xff
30000fa8:	e5c32000 	strb	r2, [r3]

	NFCMD = NAND_CMD_READ0;
30000fac:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000fb0:	e2833008 	add	r3, r3, #8
30000fb4:	e3a02000 	mov	r2, #0
30000fb8:	e5c32000 	strb	r2, [r3]

	if (nand->page_size == 512) {
30000fbc:	e59d300c 	ldr	r3, [sp, #12]
30000fc0:	e5933000 	ldr	r3, [r3]
30000fc4:	e3530c02 	cmp	r3, #512	; 0x200
30000fc8:	1a000017 	bne	3000102c <nand_read_page+0xc0>
		/* Write Address */
		NFADDR = addr & 0xff;
30000fcc:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000fd0:	e283300c 	add	r3, r3, #12
30000fd4:	e59d2004 	ldr	r2, [sp, #4]
30000fd8:	e20220ff 	and	r2, r2, #255	; 0xff
30000fdc:	e5c32000 	strb	r2, [r3]
		NFADDR = (addr >> 9) & 0xff;
30000fe0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000fe4:	e283300c 	add	r3, r3, #12
30000fe8:	e59d2004 	ldr	r2, [sp, #4]
30000fec:	e1a024a2 	lsr	r2, r2, #9
30000ff0:	e20220ff 	and	r2, r2, #255	; 0xff
30000ff4:	e5c32000 	strb	r2, [r3]
		NFADDR = (addr >> 17) & 0xff;
30000ff8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30000ffc:	e283300c 	add	r3, r3, #12
30001000:	e59d2004 	ldr	r2, [sp, #4]
30001004:	e1a028a2 	lsr	r2, r2, #17
30001008:	e20220ff 	and	r2, r2, #255	; 0xff
3000100c:	e5c32000 	strb	r2, [r3]
		NFADDR = (addr >> 25) & 0xff;
30001010:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001014:	e283300c 	add	r3, r3, #12
30001018:	e59d2004 	ldr	r2, [sp, #4]
3000101c:	e1a02ca2 	lsr	r2, r2, #25
30001020:	e20220ff 	and	r2, r2, #255	; 0xff
30001024:	e5c32000 	strb	r2, [r3]
30001028:	ea000026 	b	300010c8 <nand_read_page+0x15c>
	} else if (nand->page_size == 2048) {
3000102c:	e59d300c 	ldr	r3, [sp, #12]
30001030:	e5933000 	ldr	r3, [r3]
30001034:	e3530b02 	cmp	r3, #2048	; 0x800
30001038:	1a000020 	bne	300010c0 <nand_read_page+0x154>
		page_num = addr >> 11; /* addr / 2048 */
3000103c:	e59d3004 	ldr	r3, [sp, #4]
30001040:	e1a035a3 	lsr	r3, r3, #11
30001044:	e58d301c 	str	r3, [sp, #28]
		/* Write Address */
		NFADDR = 0;
30001048:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
3000104c:	e283300c 	add	r3, r3, #12
30001050:	e3a02000 	mov	r2, #0
30001054:	e5c32000 	strb	r2, [r3]
		NFADDR = 0;
30001058:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
3000105c:	e283300c 	add	r3, r3, #12
30001060:	e3a02000 	mov	r2, #0
30001064:	e5c32000 	strb	r2, [r3]
		NFADDR = page_num & 0xff;
30001068:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
3000106c:	e283300c 	add	r3, r3, #12
30001070:	e59d201c 	ldr	r2, [sp, #28]
30001074:	e20220ff 	and	r2, r2, #255	; 0xff
30001078:	e5c32000 	strb	r2, [r3]
		NFADDR = (page_num >> 8) & 0xff;
3000107c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001080:	e283300c 	add	r3, r3, #12
30001084:	e59d201c 	ldr	r2, [sp, #28]
30001088:	e1a02422 	lsr	r2, r2, #8
3000108c:	e20220ff 	and	r2, r2, #255	; 0xff
30001090:	e5c32000 	strb	r2, [r3]
		NFADDR = (page_num >> 16) & 0xff;
30001094:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001098:	e283300c 	add	r3, r3, #12
3000109c:	e59d201c 	ldr	r2, [sp, #28]
300010a0:	e1a02822 	lsr	r2, r2, #16
300010a4:	e20220ff 	and	r2, r2, #255	; 0xff
300010a8:	e5c32000 	strb	r2, [r3]
		NFCMD = NAND_CMD_READSTART;
300010ac:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
300010b0:	e2833008 	add	r3, r3, #8
300010b4:	e3a02030 	mov	r2, #48	; 0x30
300010b8:	e5c32000 	strb	r2, [r3]
300010bc:	ea000001 	b	300010c8 <nand_read_page+0x15c>
	} else {
		return -1;
300010c0:	e3e03000 	mvn	r3, #0
300010c4:	ea000019 	b	30001130 <nand_read_page+0x1c4>
	}
	nand_wait();
300010c8:	ebfffef8 	bl	30000cb0 <nand_wait>
	for (i = 0; i < (nand->page_size>>1); i++) {
300010cc:	e3a03000 	mov	r3, #0
300010d0:	e58d3018 	str	r3, [sp, #24]
300010d4:	ea00000c 	b	3000110c <nand_read_page+0x1a0>
		*ptr16 = NFDATA16;
300010d8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
300010dc:	e2833010 	add	r3, r3, #16
300010e0:	e1d330b0 	ldrh	r3, [r3]
300010e4:	e1a03803 	lsl	r3, r3, #16
300010e8:	e1a02823 	lsr	r2, r3, #16
300010ec:	e59d3014 	ldr	r3, [sp, #20]
300010f0:	e1c320b0 	strh	r2, [r3]
		ptr16++;
300010f4:	e59d3014 	ldr	r3, [sp, #20]
300010f8:	e2833002 	add	r3, r3, #2
300010fc:	e58d3014 	str	r3, [sp, #20]
		NFCMD = NAND_CMD_READSTART;
	} else {
		return -1;
	}
	nand_wait();
	for (i = 0; i < (nand->page_size>>1); i++) {
30001100:	e59d3018 	ldr	r3, [sp, #24]
30001104:	e2833001 	add	r3, r3, #1
30001108:	e58d3018 	str	r3, [sp, #24]
3000110c:	e59d300c 	ldr	r3, [sp, #12]
30001110:	e5933000 	ldr	r3, [r3]
30001114:	e1a030c3 	asr	r3, r3, #1
30001118:	e1a02003 	mov	r2, r3
3000111c:	e59d3018 	ldr	r3, [sp, #24]
30001120:	e1520003 	cmp	r2, r3
30001124:	8affffeb 	bhi	300010d8 <nand_read_page+0x16c>
		*ptr16 = NFDATA16;
		ptr16++;
	}

	return nand->page_size;
30001128:	e59d300c 	ldr	r3, [sp, #12]
3000112c:	e5933000 	ldr	r3, [r3]
}
30001130:	e1a00003 	mov	r0, r3
30001134:	e28dd024 	add	sp, sp, #36	; 0x24
30001138:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000113c:	e12fff1e 	bx	lr

30001140 <nand_read_id>:


static unsigned short nand_read_id()
{
30001140:	e24dd008 	sub	sp, sp, #8
	unsigned short res = 0;
30001144:	e3a03000 	mov	r3, #0
30001148:	e1cd30b6 	strh	r3, [sp, #6]
	NFCMD = NAND_CMD_READID;
3000114c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001150:	e2833008 	add	r3, r3, #8
30001154:	e3e0206f 	mvn	r2, #111	; 0x6f
30001158:	e5c32000 	strb	r2, [r3]
	NFADDR = 0;
3000115c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001160:	e283300c 	add	r3, r3, #12
30001164:	e3a02000 	mov	r2, #0
30001168:	e5c32000 	strb	r2, [r3]
	res = NFDATA;
3000116c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001170:	e2833010 	add	r3, r3, #16
30001174:	e5d33000 	ldrb	r3, [r3]
30001178:	e20330ff 	and	r3, r3, #255	; 0xff
3000117c:	e1cd30b6 	strh	r3, [sp, #6]
	res = (res << 8) | NFDATA;
30001180:	e1dd30b6 	ldrh	r3, [sp, #6]
30001184:	e1a03403 	lsl	r3, r3, #8
30001188:	e1a03803 	lsl	r3, r3, #16
3000118c:	e1a02823 	lsr	r2, r3, #16
30001190:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001194:	e2833010 	add	r3, r3, #16
30001198:	e5d33000 	ldrb	r3, [r3]
3000119c:	e20330ff 	and	r3, r3, #255	; 0xff
300011a0:	e1823003 	orr	r3, r2, r3
300011a4:	e1a03803 	lsl	r3, r3, #16
300011a8:	e1a03823 	lsr	r3, r3, #16
300011ac:	e1cd30b6 	strh	r3, [sp, #6]
	return res;
300011b0:	e1dd30b6 	ldrh	r3, [sp, #6]
}
300011b4:	e1a00003 	mov	r0, r3
300011b8:	e28dd008 	add	sp, sp, #8
300011bc:	e12fff1e 	bx	lr

300011c0 <nand_read>:



int nand_read(unsigned char *buf, unsigned long start_addr, int size)
{
300011c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300011c4:	e24dd02c 	sub	sp, sp, #44	; 0x2c
300011c8:	e58d000c 	str	r0, [sp, #12]
300011cc:	e58d1008 	str	r1, [sp, #8]
300011d0:	e58d2004 	str	r2, [sp, #4]
	int i, j;
	unsigned short nand_id;
	struct boot_nand_t nand;

	
	nand_select();
300011d4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
300011d8:	e2833004 	add	r3, r3, #4
300011dc:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
300011e0:	e2822004 	add	r2, r2, #4
300011e4:	e5922000 	ldr	r2, [r2]
300011e8:	e3c22002 	bic	r2, r2, #2
300011ec:	e5832000 	str	r2, [r3]
	nand_clear_RnB();
300011f0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
300011f4:	e2833020 	add	r3, r3, #32
300011f8:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
300011fc:	e2822020 	add	r2, r2, #32
30001200:	e5d22000 	ldrb	r2, [r2]
30001204:	e20220ff 	and	r2, r2, #255	; 0xff
30001208:	e3822004 	orr	r2, r2, #4
3000120c:	e20220ff 	and	r2, r2, #255	; 0xff
30001210:	e5c32000 	strb	r2, [r3]
	
	for (i = 0; i < 10; i++);
30001214:	e3a03000 	mov	r3, #0
30001218:	e58d301c 	str	r3, [sp, #28]
3000121c:	ea000002 	b	3000122c <nand_read+0x6c>
30001220:	e59d301c 	ldr	r3, [sp, #28]
30001224:	e2833001 	add	r3, r3, #1
30001228:	e58d301c 	str	r3, [sp, #28]
3000122c:	e59d301c 	ldr	r3, [sp, #28]
30001230:	e3530009 	cmp	r3, #9
30001234:	dafffff9 	ble	30001220 <nand_read+0x60>

	nand_id = nand_read_id();	
30001238:	ebffffc0 	bl	30001140 <nand_read_id>
3000123c:	e1a03000 	mov	r3, r0
30001240:	e1cd32b6 	strh	r3, [sp, #38]	; 0x26

       if (nand_id == 0xec76 ||		/* Samsung K91208 */
30001244:	e1dd22b6 	ldrh	r2, [sp, #38]	; 0x26
30001248:	e3a03b3b 	mov	r3, #60416	; 0xec00
3000124c:	e2833076 	add	r3, r3, #118	; 0x76
30001250:	e1520003 	cmp	r2, r3
30001254:	0a000004 	beq	3000126c <nand_read+0xac>
30001258:	e1dd22b6 	ldrh	r2, [sp, #38]	; 0x26
3000125c:	e3a03cad 	mov	r3, #44288	; 0xad00
30001260:	e2833076 	add	r3, r3, #118	; 0x76
30001264:	e1520003 	cmp	r2, r3
30001268:	1a000006 	bne	30001288 <nand_read+0xc8>
           nand_id == 0xad76 ) {	/*Hynix HY27US08121A*/
		nand.page_size = 512;
3000126c:	e3a03c02 	mov	r3, #512	; 0x200
30001270:	e58d3010 	str	r3, [sp, #16]
		nand.block_size = 16 * 1024;
30001274:	e3a03901 	mov	r3, #16384	; 0x4000
30001278:	e58d3014 	str	r3, [sp, #20]
		nand.bad_block_offset = 5;
3000127c:	e3a03005 	mov	r3, #5
30001280:	e58d3018 	str	r3, [sp, #24]
	
	for (i = 0; i < 10; i++);

	nand_id = nand_read_id();	

       if (nand_id == 0xec76 ||		/* Samsung K91208 */
30001284:	ea000017 	b	300012e8 <nand_read+0x128>
           nand_id == 0xad76 ) {	/*Hynix HY27US08121A*/
		nand.page_size = 512;
		nand.block_size = 16 * 1024;
		nand.bad_block_offset = 5;
	} 
        else if (nand_id == 0xecf1 ||	/* Samsung K9F1G08U0B */
30001288:	e1dd22b6 	ldrh	r2, [sp, #38]	; 0x26
3000128c:	e3a03ced 	mov	r3, #60672	; 0xed00
30001290:	e243300f 	sub	r3, r3, #15
30001294:	e1520003 	cmp	r2, r3
30001298:	0a000009 	beq	300012c4 <nand_read+0x104>
3000129c:	e1dd22b6 	ldrh	r2, [sp, #38]	; 0x26
300012a0:	e3a03b3b 	mov	r3, #60416	; 0xec00
300012a4:	e28330da 	add	r3, r3, #218	; 0xda
300012a8:	e1520003 	cmp	r2, r3
300012ac:	0a000004 	beq	300012c4 <nand_read+0x104>
300012b0:	e1dd22b6 	ldrh	r2, [sp, #38]	; 0x26
300012b4:	e3a03ced 	mov	r3, #60672	; 0xed00
300012b8:	e243302d 	sub	r3, r3, #45	; 0x2d
300012bc:	e1520003 	cmp	r2, r3
300012c0:	1a000006 	bne	300012e0 <nand_read+0x120>
		   nand_id == 0xecda ||	/* Samsung K9F2G08U0B */
		   nand_id == 0xecd3 )	{ /* Samsung K9K8G08 */
		nand.page_size = 2048;
300012c4:	e3a03b02 	mov	r3, #2048	; 0x800
300012c8:	e58d3010 	str	r3, [sp, #16]
		nand.block_size = 128 * 1024;
300012cc:	e3a03802 	mov	r3, #131072	; 0x20000
300012d0:	e58d3014 	str	r3, [sp, #20]
		nand.bad_block_offset = nand.page_size;
300012d4:	e59d3010 	ldr	r3, [sp, #16]
300012d8:	e58d3018 	str	r3, [sp, #24]
           nand_id == 0xad76 ) {	/*Hynix HY27US08121A*/
		nand.page_size = 512;
		nand.block_size = 16 * 1024;
		nand.bad_block_offset = 5;
	} 
        else if (nand_id == 0xecf1 ||	/* Samsung K9F1G08U0B */
300012dc:	ea000001 	b	300012e8 <nand_read+0x128>
		nand.page_size = 2048;
		nand.block_size = 128 * 1024;
		nand.bad_block_offset = nand.page_size;
	} 
        else {
		return -1; 
300012e0:	e3e03000 	mvn	r3, #0
300012e4:	ea000060 	b	3000146c <nand_read+0x2ac>
	}

         if ((start_addr & (nand.block_size-1)))
300012e8:	e59d3014 	ldr	r3, [sp, #20]
300012ec:	e2433001 	sub	r3, r3, #1
300012f0:	e1a02003 	mov	r2, r3
300012f4:	e59d3008 	ldr	r3, [sp, #8]
300012f8:	e0023003 	and	r3, r2, r3
300012fc:	e3530000 	cmp	r3, #0
30001300:	0a000001 	beq	3000130c <nand_read+0x14c>
		return -1;	
30001304:	e3e03000 	mvn	r3, #0
30001308:	ea000057 	b	3000146c <nand_read+0x2ac>
        
        if(size & (nand.page_size-1)){
3000130c:	e59d3010 	ldr	r3, [sp, #16]
30001310:	e2432001 	sub	r2, r3, #1
30001314:	e59d3004 	ldr	r3, [sp, #4]
30001318:	e0023003 	and	r3, r2, r3
3000131c:	e3530000 	cmp	r3, #0
30001320:	0a000007 	beq	30001344 <nand_read+0x184>
             size=(size+nand.page_size-1) & (~(nand.page_size-1));
30001324:	e59d2010 	ldr	r2, [sp, #16]
30001328:	e59d3004 	ldr	r3, [sp, #4]
3000132c:	e0823003 	add	r3, r2, r3
30001330:	e2432001 	sub	r2, r3, #1
30001334:	e59d3010 	ldr	r3, [sp, #16]
30001338:	e2633000 	rsb	r3, r3, #0
3000133c:	e0023003 	and	r3, r2, r3
30001340:	e58d3004 	str	r3, [sp, #4]
        }

        if ((size & (nand.page_size-1)))
30001344:	e59d3010 	ldr	r3, [sp, #16]
30001348:	e2432001 	sub	r2, r3, #1
3000134c:	e59d3004 	ldr	r3, [sp, #4]
30001350:	e0023003 	and	r3, r2, r3
30001354:	e3530000 	cmp	r3, #0
30001358:	0a000001 	beq	30001364 <nand_read+0x1a4>
		return -1;
3000135c:	e3e03000 	mvn	r3, #0
30001360:	ea000041 	b	3000146c <nand_read+0x2ac>

	for (i=start_addr; i < (start_addr + size);) {
30001364:	e59d3008 	ldr	r3, [sp, #8]
30001368:	e58d301c 	str	r3, [sp, #28]
3000136c:	ea000030 	b	30001434 <nand_read+0x274>

		if ((i & (nand.block_size-1))== 0) {
30001370:	e59d3014 	ldr	r3, [sp, #20]
30001374:	e2432001 	sub	r2, r3, #1
30001378:	e59d301c 	ldr	r3, [sp, #28]
3000137c:	e0023003 	and	r3, r2, r3
30001380:	e3530000 	cmp	r3, #0
30001384:	1a00001a 	bne	300013f4 <nand_read+0x234>
			if (is_bad_block(&nand, i) || is_bad_block(&nand, i + nand.page_size)) {
30001388:	e59d301c 	ldr	r3, [sp, #28]
3000138c:	e28d2010 	add	r2, sp, #16
30001390:	e1a00002 	mov	r0, r2
30001394:	e1a01003 	mov	r1, r3
30001398:	ebfffe85 	bl	30000db4 <is_bad_block>
3000139c:	e1a03000 	mov	r3, r0
300013a0:	e3530000 	cmp	r3, #0
300013a4:	1a000009 	bne	300013d0 <nand_read+0x210>
300013a8:	e59d2010 	ldr	r2, [sp, #16]
300013ac:	e59d301c 	ldr	r3, [sp, #28]
300013b0:	e0823003 	add	r3, r2, r3
300013b4:	e28d2010 	add	r2, sp, #16
300013b8:	e1a00002 	mov	r0, r2
300013bc:	e1a01003 	mov	r1, r3
300013c0:	ebfffe7b 	bl	30000db4 <is_bad_block>
300013c4:	e1a03000 	mov	r3, r0
300013c8:	e3530000 	cmp	r3, #0
300013cc:	0a000008 	beq	300013f4 <nand_read+0x234>
				i += nand.block_size;
300013d0:	e59d3014 	ldr	r3, [sp, #20]
300013d4:	e59d201c 	ldr	r2, [sp, #28]
300013d8:	e0823003 	add	r3, r2, r3
300013dc:	e58d301c 	str	r3, [sp, #28]
				size += nand.block_size;
300013e0:	e59d3014 	ldr	r3, [sp, #20]
300013e4:	e59d2004 	ldr	r2, [sp, #4]
300013e8:	e0823003 	add	r3, r2, r3
300013ec:	e58d3004 	str	r3, [sp, #4]
				continue;
300013f0:	ea00000f 	b	30001434 <nand_read+0x274>
			}
		}

		j = nand_read_page(&nand, buf, i);
300013f4:	e59d301c 	ldr	r3, [sp, #28]
300013f8:	e28d2010 	add	r2, sp, #16
300013fc:	e1a00002 	mov	r0, r2
30001400:	e59d100c 	ldr	r1, [sp, #12]
30001404:	e1a02003 	mov	r2, r3
30001408:	ebfffed7 	bl	30000f6c <nand_read_page>
3000140c:	e1a03000 	mov	r3, r0
30001410:	e58d3020 	str	r3, [sp, #32]
		i += j;
30001414:	e59d201c 	ldr	r2, [sp, #28]
30001418:	e59d3020 	ldr	r3, [sp, #32]
3000141c:	e0823003 	add	r3, r2, r3
30001420:	e58d301c 	str	r3, [sp, #28]
		buf += j;
30001424:	e59d3020 	ldr	r3, [sp, #32]
30001428:	e59d200c 	ldr	r2, [sp, #12]
3000142c:	e0823003 	add	r3, r2, r3
30001430:	e58d300c 	str	r3, [sp, #12]
        }

        if ((size & (nand.page_size-1)))
		return -1;

	for (i=start_addr; i < (start_addr + size);) {
30001434:	e59d201c 	ldr	r2, [sp, #28]
30001438:	e59d1004 	ldr	r1, [sp, #4]
3000143c:	e59d3008 	ldr	r3, [sp, #8]
30001440:	e0813003 	add	r3, r1, r3
30001444:	e1520003 	cmp	r2, r3
30001448:	3affffc8 	bcc	30001370 <nand_read+0x1b0>
		i += j;
		buf += j;
	}


	nand_deselect();
3000144c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30001450:	e2833004 	add	r3, r3, #4
30001454:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
30001458:	e2822004 	add	r2, r2, #4
3000145c:	e5922000 	ldr	r2, [r2]
30001460:	e3822002 	orr	r2, r2, #2
30001464:	e5832000 	str	r2, [r3]

	return 0;
30001468:	e3a03000 	mov	r3, #0
}
3000146c:	e1a00003 	mov	r0, r3
30001470:	e28dd02c 	add	sp, sp, #44	; 0x2c
30001474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001478:	e12fff1e 	bx	lr

3000147c <MMU_EnableICache>:
3000147c:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
30001480:	e3800a01 	orr	r0, r0, #4096	; 0x1000
30001484:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
30001488:	e1a0f00e 	mov	pc, lr

3000148c <MMU_DisableICache>:
3000148c:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
30001490:	e3c00a01 	bic	r0, r0, #4096	; 0x1000
30001494:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
30001498:	e1a0f00e 	mov	pc, lr

3000149c <MMU_EnableDCache>:
3000149c:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300014a0:	e3800004 	orr	r0, r0, #4
300014a4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300014a8:	e1a0f00e 	mov	pc, lr

300014ac <MMU_DisableDCache>:
300014ac:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300014b0:	e3c00004 	bic	r0, r0, #4
300014b4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300014b8:	e1a0f00e 	mov	pc, lr

300014bc <MMU_EnableAlignFault>:
300014bc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300014c0:	e3800002 	orr	r0, r0, #2
300014c4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300014c8:	e1a0f00e 	mov	pc, lr

300014cc <MMU_DisableAlignFault>:
300014cc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300014d0:	e3c00002 	bic	r0, r0, #2
300014d4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300014d8:	e1a0f00e 	mov	pc, lr

300014dc <MMU_EnableMMU>:
300014dc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300014e0:	e3800001 	orr	r0, r0, #1
300014e4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300014e8:	e1a0f00e 	mov	pc, lr

300014ec <MMU_DisableMMU>:
300014ec:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300014f0:	e3c00001 	bic	r0, r0, #1
300014f4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300014f8:	e1a0f00e 	mov	pc, lr

300014fc <MMU_SetTTBase>:
300014fc:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
30001500:	e1a0f00e 	mov	pc, lr

30001504 <MMU_SetDomain>:
30001504:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
30001508:	e1a0f00e 	mov	pc, lr

3000150c <MMU_InvalidateIDCache>:
3000150c:	ee070f17 	mcr	15, 0, r0, cr7, cr7, {0}
30001510:	e1a0f00e 	mov	pc, lr

30001514 <MMU_InvalidateICache>:
30001514:	ee070f15 	mcr	15, 0, r0, cr7, cr5, {0}
30001518:	e1a0f00e 	mov	pc, lr

3000151c <MMU_InvalidateICacheMVA>:
3000151c:	ee070f35 	mcr	15, 0, r0, cr7, cr5, {1}
30001520:	e1a0f00e 	mov	pc, lr

30001524 <MMU_PrefetchICacheMVA>:
30001524:	ee070f3d 	mcr	15, 0, r0, cr7, cr13, {1}
30001528:	e1a0f00e 	mov	pc, lr

3000152c <MMU_InvalidateDCache>:
3000152c:	ee070f16 	mcr	15, 0, r0, cr7, cr6, {0}
30001530:	e1a0f00e 	mov	pc, lr

30001534 <MMU_InvalidateDCacheMVA>:
30001534:	ee070f36 	mcr	15, 0, r0, cr7, cr6, {1}
30001538:	e1a0f00e 	mov	pc, lr

3000153c <MMU_CleanDCacheMVA>:
3000153c:	ee070f3a 	mcr	15, 0, r0, cr7, cr10, {1}
30001540:	e1a0f00e 	mov	pc, lr

30001544 <MMU_CleanInvalidateDCacheMVA>:
30001544:	ee070f3e 	mcr	15, 0, r0, cr7, cr14, {1}
30001548:	e1a0f00e 	mov	pc, lr

3000154c <MMU_CleanDCacheIndex>:
3000154c:	ee070f5a 	mcr	15, 0, r0, cr7, cr10, {2}
30001550:	e1a0f00e 	mov	pc, lr

30001554 <MMU_CleanInvalidateDCacheIndex>:
30001554:	ee070f5e 	mcr	15, 0, r0, cr7, cr14, {2}
30001558:	e1a0f00e 	mov	pc, lr

3000155c <MMU_WaitForInterrupt>:
3000155c:	ee070f90 	mcr	15, 0, r0, cr7, cr0, {4}
30001560:	e1a0f00e 	mov	pc, lr

30001564 <MMU_InvalidateTLB>:
30001564:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
30001568:	e1a0f00e 	mov	pc, lr

3000156c <MMU_InvalidateITLB>:
3000156c:	ee080f15 	mcr	15, 0, r0, cr8, cr5, {0}
30001570:	e1a0f00e 	mov	pc, lr

30001574 <MMU_InvalidateITLBMVA>:
30001574:	ee080f35 	mcr	15, 0, r0, cr8, cr5, {1}
30001578:	e1a0f00e 	mov	pc, lr

3000157c <MMU_InvalidateDTLB>:
3000157c:	ee080f16 	mcr	15, 0, r0, cr8, cr6, {0}
30001580:	e1a0f00e 	mov	pc, lr

30001584 <MMU_SetProcessId>:
30001584:	ee0d0f10 	mcr	15, 0, r0, cr13, cr0, {0}
30001588:	e1a0f00e 	mov	pc, lr

3000158c <HAL_SWITCH_TO>:
3000158c:	e590d000 	ldr	sp, [r0]
30001590:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
30001594:	e129f000 	msr	CPSR_fc, r0
30001598:	e8bddfff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}

3000159c <HAL_INTR_SWITCH_TO>:
3000159c:	e92d5ffe 	push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
300015a0:	e59f20c0 	ldr	r2, [pc, #192]	; 30001668 <HAL_CONTEXT_SWITCH+0x24>
300015a4:	e242203c 	sub	r2, r2, #60	; 0x3c
300015a8:	e590c000 	ldr	ip, [r0]
300015ac:	e8bc0ff8 	ldm	ip!, {r3, r4, r5, r6, r7, r8, r9, sl, fp}
300015b0:	e8a20ff8 	stmia	r2!, {r3, r4, r5, r6, r7, r8, r9, sl, fp}
300015b4:	e8bc00f8 	ldm	ip!, {r3, r4, r5, r6, r7}
300015b8:	e8a200f8 	stmia	r2!, {r3, r4, r5, r6, r7}
300015bc:	e8fc4000 	ldm	ip!, {lr}^
300015c0:	e8bc0008 	ldm	ip!, {r3}
300015c4:	e2833004 	add	r3, r3, #4
300015c8:	e8a20008 	stmia	r2!, {r3}
300015cc:	e92c1000 	stmdb	ip!, {ip}
300015d0:	e8fc2000 	ldm	ip!, {sp}^
300015d4:	e1a00000 	nop			; (mov r0, r0)
300015d8:	e8bd9ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

300015dc <HAL_INTR_CTX_SWITCH>:
300015dc:	e92d5ffc 	push	{r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
300015e0:	e59f2080 	ldr	r2, [pc, #128]	; 30001668 <HAL_CONTEXT_SWITCH+0x24>
300015e4:	e93207f8 	ldmdb	r2!, {r3, r4, r5, r6, r7, r8, r9, sl}
300015e8:	e24aa004 	sub	sl, sl, #4
300015ec:	e1a0b00d 	mov	fp, sp
300015f0:	e96b2000 	stmdb	fp!, {sp}^
300015f4:	e8bb1000 	ldm	fp!, {ip}
300015f8:	e92c0400 	stmdb	ip!, {sl}
300015fc:	e96c4000 	stmdb	ip!, {lr}^
30001600:	e92c03f8 	stmdb	ip!, {r3, r4, r5, r6, r7, r8, r9}
30001604:	e93203f8 	ldmdb	r2!, {r3, r4, r5, r6, r7, r8, r9}
30001608:	e92c03f8 	stmdb	ip!, {r3, r4, r5, r6, r7, r8, r9}
3000160c:	e580c000 	str	ip, [r0]
30001610:	e591c000 	ldr	ip, [r1]
30001614:	e8bc0ff8 	ldm	ip!, {r3, r4, r5, r6, r7, r8, r9, sl, fp}
30001618:	e8a20ff8 	stmia	r2!, {r3, r4, r5, r6, r7, r8, r9, sl, fp}
3000161c:	e8bc00f8 	ldm	ip!, {r3, r4, r5, r6, r7}
30001620:	e8a200f8 	stmia	r2!, {r3, r4, r5, r6, r7}
30001624:	e8fc4000 	ldm	ip!, {lr}^
30001628:	e8bc0008 	ldm	ip!, {r3}
3000162c:	e2833004 	add	r3, r3, #4
30001630:	e8a20008 	stmia	r2!, {r3}
30001634:	e92c1000 	stmdb	ip!, {ip}
30001638:	e8fc2000 	ldm	ip!, {sp}^
3000163c:	e1a00000 	nop			; (mov r0, r0)
30001640:	e8bd9ffc 	pop	{r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

30001644 <HAL_CONTEXT_SWITCH>:
30001644:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001648:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
3000164c:	e10f4000 	mrs	r4, CPSR
30001650:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
30001654:	e580d000 	str	sp, [r0]
30001658:	e591d000 	ldr	sp, [r1]
3000165c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
30001660:	e129f000 	msr	CPSR_fc, r0
30001664:	e8bddfff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
30001668:	33ffff00 	.word	0x33ffff00

3000166c <HAL_INTR_ENTRY>:
3000166c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
30001670:	e14f1000 	mrs	r1, SPSR
30001674:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
30001678:	e321f093 	msr	CPSR_c, #147	; 0x93
3000167c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001680:	e59f008c 	ldr	r0, [pc, #140]	; 30001714 <HAL_INTR_DISABLE_SAVE+0x20>
30001684:	e5900000 	ldr	r0, [r0]
30001688:	e1a0e00f 	mov	lr, pc
3000168c:	e59ff084 	ldr	pc, [pc, #132]	; 30001718 <HAL_INTR_DISABLE_SAVE+0x24>
30001690:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001694:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
30001698:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
3000169c:	e16ff000 	msr	SPSR_fsxc, r0
300016a0:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
300016a4:	e25ef004 	subs	pc, lr, #4

300016a8 <EXP_HANDLER>:
300016a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300016ac:	e1a0000d 	mov	r0, sp
300016b0:	e9602000 	stmdb	r0!, {sp}^
300016b4:	e8b00002 	ldm	r0!, {r1}
300016b8:	e1a0000e 	mov	r0, lr
300016bc:	eb000b3d 	bl	300043b8 <acoral_fault_entry>
300016c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300016c4:	e25ef000 	subs	pc, lr, #0

300016c8 <HAL_INTR_ENABLE>:
300016c8:	e10f0000 	mrs	r0, CPSR
300016cc:	e3c000c0 	bic	r0, r0, #192	; 0xc0
300016d0:	e12ff000 	msr	CPSR_fsxc, r0
300016d4:	e1a0f00e 	mov	pc, lr

300016d8 <HAL_INTR_DISABLE>:
300016d8:	e10f0000 	mrs	r0, CPSR
300016dc:	e1a01000 	mov	r1, r0
300016e0:	e38110c0 	orr	r1, r1, #192	; 0xc0
300016e4:	e12ff001 	msr	CPSR_fsxc, r1
300016e8:	e1a0f00e 	mov	pc, lr

300016ec <HAL_INTR_RESTORE>:
300016ec:	e121f000 	msr	CPSR_c, r0
300016f0:	e1a0f00e 	mov	pc, lr

300016f4 <HAL_INTR_DISABLE_SAVE>:
300016f4:	e10f0000 	mrs	r0, CPSR
300016f8:	e38010c0 	orr	r1, r0, #192	; 0xc0
300016fc:	e121f001 	msr	CPSR_c, r1
30001700:	e10f1000 	mrs	r1, CPSR
30001704:	e20110c0 	and	r1, r1, #192	; 0xc0
30001708:	e35100c0 	cmp	r1, #192	; 0xc0
3000170c:	1afffff8 	bne	300016f4 <HAL_INTR_DISABLE_SAVE>
30001710:	e1a0f00e 	mov	pc, lr
30001714:	4a000014 	.word	0x4a000014
30001718:	300003cc 	.word	0x300003cc

3000171c <hal_intr_nesting_init_comm>:
acoral_u32 intr_nesting[HAL_MAX_CPU];
/*===========================                                                                                                                 
*initialize the nesting      
*中断嵌套初始化
*===========================*/
void hal_intr_nesting_init_comm(){
3000171c:	e24dd008 	sub	sp, sp, #8
	acoral_u32 i;
	for(i=0;i<HAL_MAX_CPU;i++)
30001720:	e3a03000 	mov	r3, #0
30001724:	e58d3004 	str	r3, [sp, #4]
30001728:	ea000006 	b	30001748 <hal_intr_nesting_init_comm+0x2c>
	  	intr_nesting[i]=0;
3000172c:	e59d2004 	ldr	r2, [sp, #4]
30001730:	e59f3024 	ldr	r3, [pc, #36]	; 3000175c <hal_intr_nesting_init_comm+0x40>
30001734:	e3a01000 	mov	r1, #0
30001738:	e7831102 	str	r1, [r3, r2, lsl #2]
*initialize the nesting      
*中断嵌套初始化
*===========================*/
void hal_intr_nesting_init_comm(){
	acoral_u32 i;
	for(i=0;i<HAL_MAX_CPU;i++)
3000173c:	e59d3004 	ldr	r3, [sp, #4]
30001740:	e2833001 	add	r3, r3, #1
30001744:	e58d3004 	str	r3, [sp, #4]
30001748:	e59d3004 	ldr	r3, [sp, #4]
3000174c:	e3530000 	cmp	r3, #0
30001750:	0afffff5 	beq	3000172c <hal_intr_nesting_init_comm+0x10>
	  	intr_nesting[i]=0;
}
30001754:	e28dd008 	add	sp, sp, #8
30001758:	e12fff1e 	bx	lr
3000175c:	3001062c 	.word	0x3001062c

30001760 <hal_get_intr_nesting_comm>:
/*===========================                                                                                                                 
*Get the nesting      
*获取当前CPU的中断嵌套数
*===========================*/
acoral_u32 hal_get_intr_nesting_comm(){
    return intr_nesting[acoral_current_cpu];
30001760:	e59f3008 	ldr	r3, [pc, #8]	; 30001770 <hal_get_intr_nesting_comm+0x10>
30001764:	e5933000 	ldr	r3, [r3]
}
30001768:	e1a00003 	mov	r0, r3
3000176c:	e12fff1e 	bx	lr
30001770:	3001062c 	.word	0x3001062c

30001774 <hal_intr_nesting_dec_comm>:

/*===========================                                                                                                                 
*Decrise the nesting      
*减少当前CPU中断嵌套数
*===========================*/
void hal_intr_nesting_dec_comm(){
30001774:	e24dd008 	sub	sp, sp, #8
    acoral_u8 cpu;
    cpu=acoral_current_cpu;
30001778:	e3a03000 	mov	r3, #0
3000177c:	e5cd3007 	strb	r3, [sp, #7]
    if(intr_nesting[cpu]>0)
30001780:	e5dd2007 	ldrb	r2, [sp, #7]
30001784:	e59f3028 	ldr	r3, [pc, #40]	; 300017b4 <hal_intr_nesting_dec_comm+0x40>
30001788:	e7933102 	ldr	r3, [r3, r2, lsl #2]
3000178c:	e3530000 	cmp	r3, #0
30001790:	0a000005 	beq	300017ac <hal_intr_nesting_dec_comm+0x38>
	intr_nesting[cpu]--;
30001794:	e5dd3007 	ldrb	r3, [sp, #7]
30001798:	e59f2014 	ldr	r2, [pc, #20]	; 300017b4 <hal_intr_nesting_dec_comm+0x40>
3000179c:	e7922103 	ldr	r2, [r2, r3, lsl #2]
300017a0:	e2421001 	sub	r1, r2, #1
300017a4:	e59f2008 	ldr	r2, [pc, #8]	; 300017b4 <hal_intr_nesting_dec_comm+0x40>
300017a8:	e7821103 	str	r1, [r2, r3, lsl #2]
}
300017ac:	e28dd008 	add	sp, sp, #8
300017b0:	e12fff1e 	bx	lr
300017b4:	3001062c 	.word	0x3001062c

300017b8 <hal_intr_nesting_inc_comm>:
/*===========================                                                                                                                 
*Incrise the nesting        
*增加中断嵌套数
*===========================*/
void hal_intr_nesting_inc_comm(){
    intr_nesting[acoral_current_cpu]++;
300017b8:	e59f3010 	ldr	r3, [pc, #16]	; 300017d0 <hal_intr_nesting_inc_comm+0x18>
300017bc:	e5933000 	ldr	r3, [r3]
300017c0:	e2832001 	add	r2, r3, #1
300017c4:	e59f3004 	ldr	r3, [pc, #4]	; 300017d0 <hal_intr_nesting_inc_comm+0x18>
300017c8:	e5832000 	str	r2, [r3]
}
300017cc:	e12fff1e 	bx	lr
300017d0:	3001062c 	.word	0x3001062c

300017d4 <hal_sched_bridge_comm>:

void hal_sched_bridge_comm(){
300017d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300017d8:	e24dd00c 	sub	sp, sp, #12
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
300017dc:	ebffffc4 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300017e0:	e1a03000 	mov	r3, r0
300017e4:	e58d3004 	str	r3, [sp, #4]
	acoral_real_sched();
300017e8:	eb000328 	bl	30002490 <acoral_real_sched>
	HAL_EXIT_CRITICAL();
300017ec:	e59d0004 	ldr	r0, [sp, #4]
300017f0:	ebffffbd 	bl	300016ec <HAL_INTR_RESTORE>
}
300017f4:	e28dd00c 	add	sp, sp, #12
300017f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300017fc:	e12fff1e 	bx	lr

30001800 <hal_intr_exit_bridge_comm>:

void hal_intr_exit_bridge_comm(){
30001800:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001804:	e24dd00c 	sub	sp, sp, #12
  	acoral_sr cpu_sr;
	HAL_ENTER_CRITICAL();
30001808:	ebffffb9 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000180c:	e1a03000 	mov	r3, r0
30001810:	e58d3004 	str	r3, [sp, #4]
	acoral_real_intr_sched();
30001814:	eb000348 	bl	3000253c <acoral_real_intr_sched>
	HAL_EXIT_CRITICAL();
30001818:	e59d0004 	ldr	r0, [sp, #4]
3000181c:	ebffffb2 	bl	300016ec <HAL_INTR_RESTORE>
}
30001820:	e28dd00c 	add	sp, sp, #12
30001824:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001828:	e12fff1e 	bx	lr

3000182c <hal_atomic_add_comm>:

void hal_atomic_add_comm(int i, acoral_atomic_t *v)
{
3000182c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001830:	e24dd014 	sub	sp, sp, #20
30001834:	e58d0004 	str	r0, [sp, #4]
30001838:	e58d1000 	str	r1, [sp]
		acoral_sr sr;
		sr=HAL_INTR_DISABLE_SAVE();
3000183c:	ebffffac 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30001840:	e1a03000 	mov	r3, r0
30001844:	e58d300c 	str	r3, [sp, #12]
		v->val=v->val+i;
30001848:	e59d3000 	ldr	r3, [sp]
3000184c:	e5932000 	ldr	r2, [r3]
30001850:	e59d3004 	ldr	r3, [sp, #4]
30001854:	e0822003 	add	r2, r2, r3
30001858:	e59d3000 	ldr	r3, [sp]
3000185c:	e5832000 	str	r2, [r3]
		HAL_INTR_RESTORE(sr);
30001860:	e59d000c 	ldr	r0, [sp, #12]
30001864:	ebffffa0 	bl	300016ec <HAL_INTR_RESTORE>
}
30001868:	e28dd014 	add	sp, sp, #20
3000186c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001870:	e12fff1e 	bx	lr

30001874 <hal_atomic_sub_comm>:

void hal_atomic_sub_comm(int i, acoral_atomic_t *v)
{
30001874:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001878:	e24dd014 	sub	sp, sp, #20
3000187c:	e58d0004 	str	r0, [sp, #4]
30001880:	e58d1000 	str	r1, [sp]
	acoral_sr sr;
	sr=HAL_INTR_DISABLE_SAVE();
30001884:	ebffff9a 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30001888:	e1a03000 	mov	r3, r0
3000188c:	e58d300c 	str	r3, [sp, #12]
	v->val=v->val-i;
30001890:	e59d3000 	ldr	r3, [sp]
30001894:	e5932000 	ldr	r2, [r3]
30001898:	e59d3004 	ldr	r3, [sp, #4]
3000189c:	e0632002 	rsb	r2, r3, r2
300018a0:	e59d3000 	ldr	r3, [sp]
300018a4:	e5832000 	str	r2, [r3]
	HAL_INTR_RESTORE(sr);
300018a8:	e59d000c 	ldr	r0, [sp, #12]
300018ac:	ebffff8e 	bl	300016ec <HAL_INTR_RESTORE>
}
300018b0:	e28dd014 	add	sp, sp, #20
300018b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300018b8:	e12fff1e 	bx	lr

300018bc <idle>:
extern volatile acoral_u32 idle_count[HAL_MAX_CPU];
/*================================
 *      idle thread
 *       空闲进程
 *================================*/
void idle(void *args){
300018bc:	e24dd008 	sub	sp, sp, #8
300018c0:	e58d0004 	str	r0, [sp, #4]
	while(1){
#ifdef CFG_STAT
		idle_count[acoral_current_cpu]++;
#endif
	}
300018c4:	eafffffe 	b	300018c4 <idle+0x8>

300018c8 <daem>:

/*================================
 *      resouce collection function
 *           资源回收函数
 *================================*/
void daem(void *args){
300018c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300018cc:	e24dd024 	sub	sp, sp, #36	; 0x24
300018d0:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
	acoral_thread_t * thread;
	acoral_list_t *head,*tmp,*tmp1;
	head=&acoral_res_release_queue.head;
300018d4:	e59f30b8 	ldr	r3, [pc, #184]	; 30001994 <daem+0xcc>
300018d8:	e58d3014 	str	r3, [sp, #20]
	while(1){
		for(tmp=head->next;tmp!=head;){
300018dc:	e59d3014 	ldr	r3, [sp, #20]
300018e0:	e5933000 	ldr	r3, [r3]
300018e4:	e58d3018 	str	r3, [sp, #24]
300018e8:	ea000023 	b	3000197c <daem+0xb4>
			tmp1=tmp->next;
300018ec:	e59d3018 	ldr	r3, [sp, #24]
300018f0:	e5933000 	ldr	r3, [r3]
300018f4:	e58d301c 	str	r3, [sp, #28]
			HAL_ENTER_CRITICAL();
300018f8:	ebffff7d 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300018fc:	e1a03000 	mov	r3, r0
30001900:	e58d300c 	str	r3, [sp, #12]
			thread=list_entry(tmp,acoral_thread_t,waiting);
30001904:	e59d3018 	ldr	r3, [sp, #24]
30001908:	e2433020 	sub	r3, r3, #32
3000190c:	e58d3010 	str	r3, [sp, #16]
			/*如果线程资源已经不在使用，即release状态则释放*/
			acoral_spin_lock(&head->lock);/**/
			acoral_spin_lock(&tmp->lock);/**/
			acoral_list_del(tmp);/**/
30001910:	e59d0018 	ldr	r0, [sp, #24]
30001914:	eb002243 	bl	3000a228 <acoral_list_del>
			acoral_spin_unlock(&tmp->lock);/**/
			acoral_spin_unlock(&head->lock);/**/
			HAL_EXIT_CRITICAL();
30001918:	e59d000c 	ldr	r0, [sp, #12]
3000191c:	ebffff72 	bl	300016ec <HAL_INTR_RESTORE>
			tmp=tmp1;	
30001920:	e59d301c 	ldr	r3, [sp, #28]
30001924:	e58d3018 	str	r3, [sp, #24]
			if(thread->state==ACORAL_THREAD_STATE_RELEASE){
30001928:	e59d3010 	ldr	r3, [sp, #16]
3000192c:	e5d33004 	ldrb	r3, [r3, #4]
30001930:	e3530010 	cmp	r3, #16
30001934:	1a000003 	bne	30001948 <daem+0x80>
				acoral_release_thread((acoral_res_t *)thread);
30001938:	e59d3010 	ldr	r3, [sp, #16]
3000193c:	e1a00003 	mov	r0, r3
30001940:	eb000377 	bl	30002724 <acoral_release_thread>
30001944:	ea00000c 	b	3000197c <daem+0xb4>
			}else{
				HAL_ENTER_CRITICAL();
30001948:	ebffff69 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000194c:	e1a03000 	mov	r3, r0
30001950:	e58d300c 	str	r3, [sp, #12]
				acoral_spin_lock(&head->lock);/**/
				tmp1=head->prev;
30001954:	e59d3014 	ldr	r3, [sp, #20]
30001958:	e5933004 	ldr	r3, [r3, #4]
3000195c:	e58d301c 	str	r3, [sp, #28]
				acoral_spin_lock(&tmp1->lock);/**/
				acoral_list_add2_tail(&thread->waiting,head);/**/
30001960:	e59d3010 	ldr	r3, [sp, #16]
30001964:	e2833020 	add	r3, r3, #32
30001968:	e1a00003 	mov	r0, r3
3000196c:	e59d1014 	ldr	r1, [sp, #20]
30001970:	eb002219 	bl	3000a1dc <acoral_list_add2_tail>
				acoral_spin_unlock(&tmp1->lock);/**/
				acoral_spin_unlock(&head->lock);/**/
				HAL_EXIT_CRITICAL();
30001974:	e59d000c 	ldr	r0, [sp, #12]
30001978:	ebffff5b 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sr cpu_sr;
	acoral_thread_t * thread;
	acoral_list_t *head,*tmp,*tmp1;
	head=&acoral_res_release_queue.head;
	while(1){
		for(tmp=head->next;tmp!=head;){
3000197c:	e59d2018 	ldr	r2, [sp, #24]
30001980:	e59d3014 	ldr	r3, [sp, #20]
30001984:	e1520003 	cmp	r2, r3
30001988:	1affffd7 	bne	300018ec <daem+0x24>
				acoral_spin_unlock(&tmp1->lock);/**/
				acoral_spin_unlock(&head->lock);/**/
				HAL_EXIT_CRITICAL();
			}
		}
		acoral_suspend_self();
3000198c:	eb00038e 	bl	300027cc <acoral_suspend_self>
	}
30001990:	eaffffd1 	b	300018dc <daem+0x14>
30001994:	3000fd08 	.word	0x3000fd08

30001998 <init>:
#define DAEM_STACK_SIZE 512
#else
#define DAEM_STACK_SIZE 256
#endif
acoral_thread_t *thread;
void init(void *args){
30001998:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000199c:	e24dd024 	sub	sp, sp, #36	; 0x24
300019a0:	e58d0014 	str	r0, [sp, #20]
	acoral_prints("in init spg");
300019a4:	e59f00d0 	ldr	r0, [pc, #208]	; 30001a7c <init+0xe4>
300019a8:	eb0026c0 	bl	3000b4b0 <acoral_prints>
	acoral_comm_policy_data_t data;
	acoral_ticks_init();
300019ac:	eb000ae1 	bl	30004538 <acoral_ticks_init>
	/*ticks中断初始化函数*/
	acoral_start_sched=true;
300019b0:	e59f30c8 	ldr	r3, [pc, #200]	; 30001a80 <init+0xe8>
300019b4:	e3a02001 	mov	r2, #1
300019b8:	e5832000 	str	r2, [r3]
	/*软件延时初始化函数*/
#ifdef CFG_SOFT_DELAY
	soft_delay_init();
300019bc:	eb00208d 	bl	30009bf8 <soft_delay_init>
#ifdef CFG_STAT
	/*内核统计相关数据初始化*/
	stat_init();
#endif
	/*创建后台服务进程*/
  	acoral_init_list(&acoral_res_release_queue.head);
300019c0:	e59f30bc 	ldr	r3, [pc, #188]	; 30001a84 <init+0xec>
300019c4:	e59f20b8 	ldr	r2, [pc, #184]	; 30001a84 <init+0xec>
300019c8:	e5832000 	str	r2, [r3]
300019cc:	e59f30b0 	ldr	r3, [pc, #176]	; 30001a84 <init+0xec>
300019d0:	e59f20ac 	ldr	r2, [pc, #172]	; 30001a84 <init+0xec>
300019d4:	e5832004 	str	r2, [r3, #4]
  	acoral_spin_init(&acoral_res_release_queue.head.lock);
	data.cpu=acoral_current_cpu;
300019d8:	e3a03000 	mov	r3, #0
300019dc:	e5cd301c 	strb	r3, [sp, #28]
	data.prio=ACORAL_DAEMON_PRIO;
300019e0:	e3a03043 	mov	r3, #67	; 0x43
300019e4:	e5cd301d 	strb	r3, [sp, #29]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
300019e8:	e3a03004 	mov	r3, #4
300019ec:	e5cd301e 	strb	r3, [sp, #30]
	daemon_id=acoral_create_thread_ext(daem,DAEM_STACK_SIZE,NULL,"daemon",NULL,ACORAL_SCHED_POLICY_COMM,&data);
300019f0:	e3a03000 	mov	r3, #0
300019f4:	e58d3000 	str	r3, [sp]
300019f8:	e3a03015 	mov	r3, #21
300019fc:	e58d3004 	str	r3, [sp, #4]
30001a00:	e28d301c 	add	r3, sp, #28
30001a04:	e58d3008 	str	r3, [sp, #8]
30001a08:	e59f0078 	ldr	r0, [pc, #120]	; 30001a88 <init+0xf0>
30001a0c:	e3a01c01 	mov	r1, #256	; 0x100
30001a10:	e3a02000 	mov	r2, #0
30001a14:	e59f3070 	ldr	r3, [pc, #112]	; 30001a8c <init+0xf4>
30001a18:	eb00008b 	bl	30001c4c <create_thread_ext>
30001a1c:	e1a02000 	mov	r2, r0
30001a20:	e59f3068 	ldr	r3, [pc, #104]	; 30001a90 <init+0xf8>
30001a24:	e5832000 	str	r2, [r3]
	thread=(acoral_thread_t *)acoral_get_res_by_id(daemon_id);
30001a28:	e59f3060 	ldr	r3, [pc, #96]	; 30001a90 <init+0xf8>
30001a2c:	e5933000 	ldr	r3, [r3]
30001a30:	e1a00003 	mov	r0, r3
30001a34:	eb00078d 	bl	30003870 <acoral_get_res_by_id>
30001a38:	e1a03000 	mov	r3, r0
30001a3c:	e1a02003 	mov	r2, r3
30001a40:	e59f304c 	ldr	r3, [pc, #76]	; 30001a94 <init+0xfc>
30001a44:	e5832000 	str	r2, [r3]
	if(daemon_id==-1)
30001a48:	e59f3040 	ldr	r3, [pc, #64]	; 30001a90 <init+0xf8>
30001a4c:	e5933000 	ldr	r3, [r3]
30001a50:	e3730001 	cmn	r3, #1
30001a54:	1a000000 	bne	30001a5c <init+0xc4>
		while(1);
30001a58:	eafffffe 	b	30001a58 <init+0xc0>
	/*应用级相关服务初始化,应用级不要使用延时函数，没有效果的*/
#ifdef CFG_SHELL
	acoral_shell_init();
30001a5c:	eb002d37 	bl	3000cf40 <acoral_shell_init>
#endif
	plugin_init();
30001a60:	eb002ba6 	bl	3000c900 <plugin_init>
	app_enter_policy_init();
30001a64:	eb00014b 	bl	30001f98 <app_enter_policy_init>
	user_main();
30001a68:	eb002bb0 	bl	3000c930 <user_main>
#ifdef CFG_TEST
	test_init();
#endif
	app_exit_policy_init();
30001a6c:	eb00014d 	bl	30001fa8 <app_exit_policy_init>
}
30001a70:	e28dd024 	add	sp, sp, #36	; 0x24
30001a74:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001a78:	e12fff1e 	bx	lr
30001a7c:	3000e3f8 	.word	0x3000e3f8
30001a80:	3000ed14 	.word	0x3000ed14
30001a84:	3000fd08 	.word	0x3000fd08
30001a88:	300018c8 	.word	0x300018c8
30001a8c:	3000e404 	.word	0x3000e404
30001a90:	3000fcf4 	.word	0x3000fcf4
30001a94:	3000fc68 	.word	0x3000fc68

30001a98 <acoral_start>:
acoral_thread_t orig_thread;
/*================================
 * Entry c function of start.S 
 *       c语言初始化入口函数
 *================================*/
void acoral_start(){
30001a98:	e92d4008 	push	{r3, lr}
		acoral_follow_cpu_start();
	}
	core_cpu=0;
	HAL_CORE_CPU_INIT();
#endif
	orig_thread.console_id=ACORAL_DEV_ERR_ID;
30001a9c:	e59f3038 	ldr	r3, [pc, #56]	; 30001adc <acoral_start+0x44>
30001aa0:	e3e02000 	mvn	r2, #0
30001aa4:	e583204c 	str	r2, [r3, #76]	; 0x4c
	acoral_set_orig_thread(&orig_thread);
30001aa8:	e59f002c 	ldr	r0, [pc, #44]	; 30001adc <acoral_start+0x44>
30001aac:	eb00015d 	bl	30002028 <acoral_set_orig_thread>
	/*板子初始化*/
	HAL_BOARD_INIT();

	/*内核模块初始化*/
	acoral_module_init();
30001ab0:	eb00005b 	bl	30001c24 <acoral_module_init>

	/*串口终端应该初始化好了，将根线程的终端id设置为串口终端*/
#ifdef CFG_DRIVER
	orig_thread.console_id=acoral_dev_open("console");
30001ab4:	e59f0024 	ldr	r0, [pc, #36]	; 30001ae0 <acoral_start+0x48>
30001ab8:	eb002ed0 	bl	3000d600 <acoral_dev_open>
30001abc:	e1a02000 	mov	r2, r0
30001ac0:	e59f3014 	ldr	r3, [pc, #20]	; 30001adc <acoral_start+0x44>
30001ac4:	e583204c 	str	r2, [r3, #76]	; 0x4c
	acoral_prints("hello spg");
30001ac8:	e59f0014 	ldr	r0, [pc, #20]	; 30001ae4 <acoral_start+0x4c>
30001acc:	eb002677 	bl	3000b4b0 <acoral_prints>
	/*cmp初始化*/
    	acoral_cmp_init();
#endif

	/*主cpu开始函数*/
	acoral_core_cpu_start();
30001ad0:	eb000004 	bl	30001ae8 <acoral_core_cpu_start>
}
30001ad4:	e8bd4008 	pop	{r3, lr}
30001ad8:	e12fff1e 	bx	lr
30001adc:	3000fc6c 	.word	0x3000fc6c
30001ae0:	3000e40c 	.word	0x3000e40c
30001ae4:	3000e414 	.word	0x3000e414

30001ae8 <acoral_core_cpu_start>:
/*================================
 *  the primary cpu core start function 
 *      主cpu core的开始函数
 *================================*/
#define IDLE_STACK_SIZE 128
void acoral_core_cpu_start(){
30001ae8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001aec:	e24dd01c 	sub	sp, sp, #28
	acoral_comm_policy_data_t data;
	/*创建空闲线程*/
	acoral_start_sched=false;
30001af0:	e59f30cc 	ldr	r3, [pc, #204]	; 30001bc4 <acoral_core_cpu_start+0xdc>
30001af4:	e3a02000 	mov	r2, #0
30001af8:	e5832000 	str	r2, [r3]
	data.cpu=acoral_current_cpu;
30001afc:	e3a03000 	mov	r3, #0
30001b00:	e5cd3014 	strb	r3, [sp, #20]
	data.prio=ACORAL_IDLE_PRIO;
30001b04:	e3a03046 	mov	r3, #70	; 0x46
30001b08:	e5cd3015 	strb	r3, [sp, #21]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
30001b0c:	e3a03004 	mov	r3, #4
30001b10:	e5cd3016 	strb	r3, [sp, #22]
	idle_id=acoral_create_thread_ext(idle,IDLE_STACK_SIZE,NULL,"idle",NULL,ACORAL_SCHED_POLICY_COMM,&data);
30001b14:	e3a03000 	mov	r3, #0
30001b18:	e58d3000 	str	r3, [sp]
30001b1c:	e3a03015 	mov	r3, #21
30001b20:	e58d3004 	str	r3, [sp, #4]
30001b24:	e28d3014 	add	r3, sp, #20
30001b28:	e58d3008 	str	r3, [sp, #8]
30001b2c:	e59f0094 	ldr	r0, [pc, #148]	; 30001bc8 <acoral_core_cpu_start+0xe0>
30001b30:	e3a01080 	mov	r1, #128	; 0x80
30001b34:	e3a02000 	mov	r2, #0
30001b38:	e59f308c 	ldr	r3, [pc, #140]	; 30001bcc <acoral_core_cpu_start+0xe4>
30001b3c:	eb000042 	bl	30001c4c <create_thread_ext>
30001b40:	e1a02000 	mov	r2, r0
30001b44:	e59f3084 	ldr	r3, [pc, #132]	; 30001bd0 <acoral_core_cpu_start+0xe8>
30001b48:	e5832000 	str	r2, [r3]
	if(idle_id==-1)
30001b4c:	e59f307c 	ldr	r3, [pc, #124]	; 30001bd0 <acoral_core_cpu_start+0xe8>
30001b50:	e5933000 	ldr	r3, [r3]
30001b54:	e3730001 	cmn	r3, #1
30001b58:	1a000000 	bne	30001b60 <acoral_core_cpu_start+0x78>
		while(1);
30001b5c:	eafffffe 	b	30001b5c <acoral_core_cpu_start+0x74>
	/*创建初始化线程,这个调用层次比较多，需要多谢堆栈*/
	data.prio=ACORAL_INIT_PRIO;
30001b60:	e3a03000 	mov	r3, #0
30001b64:	e5cd3015 	strb	r3, [sp, #21]
	/*动态堆栈*/
	init_id=acoral_create_thread_ext(init,ACORAL_TEST_STACK_SIZE,"in init","init",NULL,ACORAL_SCHED_POLICY_COMM,&data);
30001b68:	e3a03000 	mov	r3, #0
30001b6c:	e58d3000 	str	r3, [sp]
30001b70:	e3a03015 	mov	r3, #21
30001b74:	e58d3004 	str	r3, [sp, #4]
30001b78:	e28d3014 	add	r3, sp, #20
30001b7c:	e58d3008 	str	r3, [sp, #8]
30001b80:	e59f004c 	ldr	r0, [pc, #76]	; 30001bd4 <acoral_core_cpu_start+0xec>
30001b84:	e3a01c02 	mov	r1, #512	; 0x200
30001b88:	e59f2048 	ldr	r2, [pc, #72]	; 30001bd8 <acoral_core_cpu_start+0xf0>
30001b8c:	e59f3048 	ldr	r3, [pc, #72]	; 30001bdc <acoral_core_cpu_start+0xf4>
30001b90:	eb00002d 	bl	30001c4c <create_thread_ext>
30001b94:	e1a02000 	mov	r2, r0
30001b98:	e59f3040 	ldr	r3, [pc, #64]	; 30001be0 <acoral_core_cpu_start+0xf8>
30001b9c:	e5832000 	str	r2, [r3]
	if(init_id==-1)
30001ba0:	e59f3038 	ldr	r3, [pc, #56]	; 30001be0 <acoral_core_cpu_start+0xf8>
30001ba4:	e5933000 	ldr	r3, [r3]
30001ba8:	e3730001 	cmn	r3, #1
30001bac:	1a000000 	bne	30001bb4 <acoral_core_cpu_start+0xcc>
		while(1);
30001bb0:	eafffffe 	b	30001bb0 <acoral_core_cpu_start+0xc8>
	acoral_start_os();
30001bb4:	eb00000a 	bl	30001be4 <acoral_start_os>
}
30001bb8:	e28dd01c 	add	sp, sp, #28
30001bbc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001bc0:	e12fff1e 	bx	lr
30001bc4:	3000ed14 	.word	0x3000ed14
30001bc8:	300018bc 	.word	0x300018bc
30001bcc:	3000e420 	.word	0x3000e420
30001bd0:	3001056c 	.word	0x3001056c
30001bd4:	30001998 	.word	0x30001998
30001bd8:	3000e428 	.word	0x3000e428
30001bdc:	3000e430 	.word	0x3000e430
30001be0:	3001059c 	.word	0x3001059c

30001be4 <acoral_start_os>:

void acoral_start_os(){
30001be4:	e92d4008 	push	{r3, lr}
	acoral_sched_init();
30001be8:	eb0000f2 	bl	30001fb8 <acoral_sched_init>
	acoral_select_thread();
30001bec:	eb00027d 	bl	300025e8 <acoral_select_thread>
	acoral_set_running_thread(acoral_ready_thread);
30001bf0:	e59f3024 	ldr	r3, [pc, #36]	; 30001c1c <acoral_start_os+0x38>
30001bf4:	e5933000 	ldr	r3, [r3]
30001bf8:	e1a00003 	mov	r0, r3
30001bfc:	eb000111 	bl	30002048 <acoral_set_running_thread>
	HAL_START_OS(&acoral_cur_thread->stack);
30001c00:	e59f3018 	ldr	r3, [pc, #24]	; 30001c20 <acoral_start_os+0x3c>
30001c04:	e5933000 	ldr	r3, [r3]
30001c08:	e2833034 	add	r3, r3, #52	; 0x34
30001c0c:	e1a00003 	mov	r0, r3
30001c10:	ebfffe5d 	bl	3000158c <HAL_SWITCH_TO>
}
30001c14:	e8bd4008 	pop	{r3, lr}
30001c18:	e12fff1e 	bx	lr
30001c1c:	30010628 	.word	0x30010628
30001c20:	30010630 	.word	0x30010630

30001c24 <acoral_module_init>:

/*================================
 *  the subsystem init of the kernel
 *     内核各模块初始化
 *================================*/
void acoral_module_init(){
30001c24:	e92d4008 	push	{r3, lr}
	/*中断系统初始化*/
	acoral_intr_sys_init();
30001c28:	eb000823 	bl	30003cbc <acoral_intr_sys_init>
	/*内存管理系统初始化*/
	acoral_mem_sys_init();
30001c2c:	eb000b91 	bl	30004a78 <acoral_mem_sys_init>
	/*资源管理系统初始化*/
	acoral_res_sys_init();
30001c30:	eb0007fd 	bl	30003c2c <acoral_res_sys_init>
	/*驱动管理系统初始化*/
	/*线程管理系统初始化*/
	acoral_thread_sys_init();
30001c34:	eb0004cf 	bl	30002f78 <acoral_thread_sys_init>
	/*时钟管理系统初始化*/
	acoral_time_sys_init();
30001c38:	eb000a22 	bl	300044c8 <acoral_time_sys_init>
	/*事件管理系统初始化,这个必须要，因为内存管理系统用到了*/
	acoral_evt_sys_init();
30001c3c:	eb000bca 	bl	30004b6c <acoral_evt_sys_init>
	/*消息管理系统初始化*/
#ifdef CFG_DRIVER
	acoral_drv_sys_init();
30001c40:	eb002f3d 	bl	3000d93c <acoral_drv_sys_init>
#endif
}
30001c44:	e8bd4008 	pop	{r3, lr}
30001c48:	e12fff1e 	bx	lr

30001c4c <create_thread_ext>:
#include<queue.h>
#include<thread.h>
#include<print.h>
#include<policy.h>
acoral_queue_t policy_list;
acoral_id create_thread_ext(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,void *stack,acoral_u32 sched_policy,void *data){
30001c4c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001c50:	e24dd024 	sub	sp, sp, #36	; 0x24
30001c54:	e58d0014 	str	r0, [sp, #20]
30001c58:	e58d1010 	str	r1, [sp, #16]
30001c5c:	e58d200c 	str	r2, [sp, #12]
30001c60:	e58d3008 	str	r3, [sp, #8]
	acoral_thread_t *thread;
        /*分配tcb数据块*/
	thread=acoral_alloc_thread();
30001c64:	eb0003fb 	bl	30002c58 <acoral_alloc_thread>
30001c68:	e1a03000 	mov	r3, r0
30001c6c:	e58d301c 	str	r3, [sp, #28]
	if(NULL==thread){
30001c70:	e59d301c 	ldr	r3, [sp, #28]
30001c74:	e3530000 	cmp	r3, #0
30001c78:	1a000004 	bne	30001c90 <create_thread_ext+0x44>
		acoral_printerr("Alloc thread:%s fail\n",name);
30001c7c:	e59f0098 	ldr	r0, [pc, #152]	; 30001d1c <create_thread_ext+0xd0>
30001c80:	e59d1008 	ldr	r1, [sp, #8]
30001c84:	eb0025e6 	bl	3000b424 <acoral_print>
		acoral_printk("No Mem Space or Beyond the max thread\n");
		return -1;
30001c88:	e3e03000 	mvn	r3, #0
30001c8c:	ea00001e 	b	30001d0c <create_thread_ext+0xc0>
	}
	thread->name=name;
30001c90:	e59d301c 	ldr	r3, [sp, #28]
30001c94:	e59d2008 	ldr	r2, [sp, #8]
30001c98:	e5832048 	str	r2, [r3, #72]	; 0x48
	stack_size=stack_size&(~3);
30001c9c:	e59d3010 	ldr	r3, [sp, #16]
30001ca0:	e3c33003 	bic	r3, r3, #3
30001ca4:	e58d3010 	str	r3, [sp, #16]
	thread->stack_size=stack_size;
30001ca8:	e59d301c 	ldr	r3, [sp, #28]
30001cac:	e59d2010 	ldr	r2, [sp, #16]
30001cb0:	e583203c 	str	r2, [r3, #60]	; 0x3c
	if(stack!=NULL)
30001cb4:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30001cb8:	e3530000 	cmp	r3, #0
30001cbc:	0a000003 	beq	30001cd0 <create_thread_ext+0x84>
		thread->stack_buttom=(acoral_u32 *)stack;
30001cc0:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30001cc4:	e59d301c 	ldr	r3, [sp, #28]
30001cc8:	e5832038 	str	r2, [r3, #56]	; 0x38
30001ccc:	ea000002 	b	30001cdc <create_thread_ext+0x90>
	else
		thread->stack_buttom=NULL;
30001cd0:	e59d301c 	ldr	r3, [sp, #28]
30001cd4:	e3a02000 	mov	r2, #0
30001cd8:	e5832038 	str	r2, [r3, #56]	; 0x38
	thread->policy=sched_policy;
30001cdc:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30001ce0:	e20320ff 	and	r2, r3, #255	; 0xff
30001ce4:	e59d301c 	ldr	r3, [sp, #28]
30001ce8:	e5c3200c 	strb	r2, [r3, #12]
	return acoral_policy_thread_init(sched_policy,thread,route,args,data);
30001cec:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
30001cf0:	e58d3000 	str	r3, [sp]
30001cf4:	e59d002c 	ldr	r0, [sp, #44]	; 0x2c
30001cf8:	e59d101c 	ldr	r1, [sp, #28]
30001cfc:	e59d2014 	ldr	r2, [sp, #20]
30001d00:	e59d300c 	ldr	r3, [sp, #12]
30001d04:	eb000025 	bl	30001da0 <acoral_policy_thread_init>
30001d08:	e1a03000 	mov	r3, r0
}
30001d0c:	e1a00003 	mov	r0, r3
30001d10:	e28dd024 	add	sp, sp, #36	; 0x24
30001d14:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001d18:	e12fff1e 	bx	lr
30001d1c:	3000e438 	.word	0x3000e438

30001d20 <acoral_get_policy_ctrl>:

acoral_sched_policy_t *acoral_get_policy_ctrl(acoral_u8 type){
30001d20:	e24dd018 	sub	sp, sp, #24
30001d24:	e1a03000 	mov	r3, r0
30001d28:	e5cd3007 	strb	r3, [sp, #7]
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
30001d2c:	e59f3068 	ldr	r3, [pc, #104]	; 30001d9c <acoral_get_policy_ctrl+0x7c>
30001d30:	e58d3010 	str	r3, [sp, #16]
	tmp=head;
30001d34:	e59d3010 	ldr	r3, [sp, #16]
30001d38:	e58d300c 	str	r3, [sp, #12]
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001d3c:	e59d3010 	ldr	r3, [sp, #16]
30001d40:	e5933000 	ldr	r3, [r3]
30001d44:	e58d300c 	str	r3, [sp, #12]
30001d48:	ea00000b 	b	30001d7c <acoral_get_policy_ctrl+0x5c>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
30001d4c:	e59d300c 	ldr	r3, [sp, #12]
30001d50:	e58d3014 	str	r3, [sp, #20]
		if(policy_ctrl->type==type)
30001d54:	e59d3014 	ldr	r3, [sp, #20]
30001d58:	e5d33008 	ldrb	r3, [r3, #8]
30001d5c:	e5dd2007 	ldrb	r2, [sp, #7]
30001d60:	e1520003 	cmp	r2, r3
30001d64:	1a000001 	bne	30001d70 <acoral_get_policy_ctrl+0x50>
			return policy_ctrl;
30001d68:	e59d3014 	ldr	r3, [sp, #20]
30001d6c:	ea000007 	b	30001d90 <acoral_get_policy_ctrl+0x70>
acoral_sched_policy_t *acoral_get_policy_ctrl(acoral_u8 type){
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
	tmp=head;
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001d70:	e59d300c 	ldr	r3, [sp, #12]
30001d74:	e5933000 	ldr	r3, [r3]
30001d78:	e58d300c 	str	r3, [sp, #12]
30001d7c:	e59d200c 	ldr	r2, [sp, #12]
30001d80:	e59d3010 	ldr	r3, [sp, #16]
30001d84:	e1520003 	cmp	r2, r3
30001d88:	1affffef 	bne	30001d4c <acoral_get_policy_ctrl+0x2c>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
		if(policy_ctrl->type==type)
			return policy_ctrl;
	}
	return NULL;
30001d8c:	e3a03000 	mov	r3, #0
}
30001d90:	e1a00003 	mov	r0, r3
30001d94:	e28dd018 	add	sp, sp, #24
30001d98:	e12fff1e 	bx	lr
30001d9c:	30010570 	.word	0x30010570

30001da0 <acoral_policy_thread_init>:

acoral_id acoral_policy_thread_init(acoral_u32 policy,acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30001da0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001da4:	e24dd01c 	sub	sp, sp, #28
30001da8:	e58d000c 	str	r0, [sp, #12]
30001dac:	e58d1008 	str	r1, [sp, #8]
30001db0:	e58d2004 	str	r2, [sp, #4]
30001db4:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_sched_policy_t   *policy_ctrl;
	policy_ctrl=acoral_get_policy_ctrl(policy);	
30001db8:	e59d300c 	ldr	r3, [sp, #12]
30001dbc:	e20330ff 	and	r3, r3, #255	; 0xff
30001dc0:	e1a00003 	mov	r0, r3
30001dc4:	ebffffd5 	bl	30001d20 <acoral_get_policy_ctrl>
30001dc8:	e1a03000 	mov	r3, r0
30001dcc:	e58d3014 	str	r3, [sp, #20]
	if(policy_ctrl==NULL||policy_ctrl->policy_thread_init==NULL){
30001dd0:	e59d3014 	ldr	r3, [sp, #20]
30001dd4:	e3530000 	cmp	r3, #0
30001dd8:	0a000003 	beq	30001dec <acoral_policy_thread_init+0x4c>
30001ddc:	e59d3014 	ldr	r3, [sp, #20]
30001de0:	e593300c 	ldr	r3, [r3, #12]
30001de4:	e3530000 	cmp	r3, #0
30001de8:	1a00000e 	bne	30001e28 <acoral_policy_thread_init+0x88>
		HAL_ENTER_CRITICAL();
30001dec:	ebfffe40 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30001df0:	e1a03000 	mov	r3, r0
30001df4:	e58d3010 	str	r3, [sp, #16]
		acoral_release_res((acoral_res_t *)thread);
30001df8:	e59d3008 	ldr	r3, [sp, #8]
30001dfc:	e1a00003 	mov	r0, r3
30001e00:	eb000606 	bl	30003620 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30001e04:	e59d0010 	ldr	r0, [sp, #16]
30001e08:	ebfffe37 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_printerr("No thread policy support:%d\n",thread->policy);
30001e0c:	e59d3008 	ldr	r3, [sp, #8]
30001e10:	e5d3300c 	ldrb	r3, [r3, #12]
30001e14:	e59f0040 	ldr	r0, [pc, #64]	; 30001e5c <acoral_policy_thread_init+0xbc>
30001e18:	e1a01003 	mov	r1, r3
30001e1c:	eb002580 	bl	3000b424 <acoral_print>
		return -1;
30001e20:	e3e03000 	mvn	r3, #0
30001e24:	ea000008 	b	30001e4c <acoral_policy_thread_init+0xac>
	}
	return policy_ctrl->policy_thread_init(thread,route,args,data);
30001e28:	e59d3014 	ldr	r3, [sp, #20]
30001e2c:	e593c00c 	ldr	ip, [r3, #12]
30001e30:	e59d0008 	ldr	r0, [sp, #8]
30001e34:	e59d1004 	ldr	r1, [sp, #4]
30001e38:	e59d2000 	ldr	r2, [sp]
30001e3c:	e59d3020 	ldr	r3, [sp, #32]
30001e40:	e1a0e00f 	mov	lr, pc
30001e44:	e12fff1c 	bx	ip
30001e48:	e1a03000 	mov	r3, r0
}
30001e4c:	e1a00003 	mov	r0, r3
30001e50:	e28dd01c 	add	sp, sp, #28
30001e54:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001e58:	e12fff1e 	bx	lr
30001e5c:	3000e450 	.word	0x3000e450

30001e60 <acoral_register_sched_policy>:

void acoral_register_sched_policy(acoral_sched_policy_t *policy){
30001e60:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001e64:	e24dd00c 	sub	sp, sp, #12
30001e68:	e58d0004 	str	r0, [sp, #4]
	acoral_list_add2_tail(&policy->list,&policy_list.head);
30001e6c:	e59d3004 	ldr	r3, [sp, #4]
30001e70:	e1a00003 	mov	r0, r3
30001e74:	e59f100c 	ldr	r1, [pc, #12]	; 30001e88 <acoral_register_sched_policy+0x28>
30001e78:	eb0020d7 	bl	3000a1dc <acoral_list_add2_tail>
}
30001e7c:	e28dd00c 	add	sp, sp, #12
30001e80:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001e84:	e12fff1e 	bx	lr
30001e88:	30010570 	.word	0x30010570

30001e8c <acoral_policy_delay_deal>:

void acoral_policy_delay_deal(){
30001e8c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001e90:	e24dd014 	sub	sp, sp, #20
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
30001e94:	e59f3068 	ldr	r3, [pc, #104]	; 30001f04 <acoral_policy_delay_deal+0x78>
30001e98:	e58d3008 	str	r3, [sp, #8]
	tmp=head;
30001e9c:	e59d3008 	ldr	r3, [sp, #8]
30001ea0:	e58d3004 	str	r3, [sp, #4]
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001ea4:	e59d3008 	ldr	r3, [sp, #8]
30001ea8:	e5933000 	ldr	r3, [r3]
30001eac:	e58d3004 	str	r3, [sp, #4]
30001eb0:	ea00000c 	b	30001ee8 <acoral_policy_delay_deal+0x5c>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
30001eb4:	e59d3004 	ldr	r3, [sp, #4]
30001eb8:	e58d300c 	str	r3, [sp, #12]
		if(policy_ctrl->delay_deal!=NULL)
30001ebc:	e59d300c 	ldr	r3, [sp, #12]
30001ec0:	e5933014 	ldr	r3, [r3, #20]
30001ec4:	e3530000 	cmp	r3, #0
30001ec8:	0a000003 	beq	30001edc <acoral_policy_delay_deal+0x50>
			policy_ctrl->delay_deal();
30001ecc:	e59d300c 	ldr	r3, [sp, #12]
30001ed0:	e5933014 	ldr	r3, [r3, #20]
30001ed4:	e1a0e00f 	mov	lr, pc
30001ed8:	e12fff13 	bx	r3
void acoral_policy_delay_deal(){
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
	tmp=head;
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001edc:	e59d3004 	ldr	r3, [sp, #4]
30001ee0:	e5933000 	ldr	r3, [r3]
30001ee4:	e58d3004 	str	r3, [sp, #4]
30001ee8:	e59d2004 	ldr	r2, [sp, #4]
30001eec:	e59d3008 	ldr	r3, [sp, #8]
30001ef0:	e1520003 	cmp	r2, r3
30001ef4:	1affffee 	bne	30001eb4 <acoral_policy_delay_deal+0x28>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
		if(policy_ctrl->delay_deal!=NULL)
			policy_ctrl->delay_deal();
	}
}
30001ef8:	e28dd014 	add	sp, sp, #20
30001efc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001f00:	e12fff1e 	bx	lr
30001f04:	30010570 	.word	0x30010570

30001f08 <acoral_policy_thread_release>:

void acoral_policy_thread_release(acoral_thread_t *thread){
30001f08:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001f0c:	e24dd014 	sub	sp, sp, #20
30001f10:	e58d0004 	str	r0, [sp, #4]
	acoral_sched_policy_t   *policy_ctrl;
	policy_ctrl=acoral_get_policy_ctrl(thread->policy);
30001f14:	e59d3004 	ldr	r3, [sp, #4]
30001f18:	e5d3300c 	ldrb	r3, [r3, #12]
30001f1c:	e1a00003 	mov	r0, r3
30001f20:	ebffff7e 	bl	30001d20 <acoral_get_policy_ctrl>
30001f24:	e1a03000 	mov	r3, r0
30001f28:	e58d300c 	str	r3, [sp, #12]
	if(policy_ctrl->policy_thread_release!=NULL)
30001f2c:	e59d300c 	ldr	r3, [sp, #12]
30001f30:	e5933010 	ldr	r3, [r3, #16]
30001f34:	e3530000 	cmp	r3, #0
30001f38:	0a000004 	beq	30001f50 <acoral_policy_thread_release+0x48>
		policy_ctrl->policy_thread_release(thread);
30001f3c:	e59d300c 	ldr	r3, [sp, #12]
30001f40:	e5933010 	ldr	r3, [r3, #16]
30001f44:	e59d0004 	ldr	r0, [sp, #4]
30001f48:	e1a0e00f 	mov	lr, pc
30001f4c:	e12fff13 	bx	r3
}
30001f50:	e28dd014 	add	sp, sp, #20
30001f54:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001f58:	e12fff1e 	bx	lr

30001f5c <acoral_sched_policy_init>:


void acoral_sched_policy_init(){
30001f5c:	e92d4008 	push	{r3, lr}
	acoral_list_init(&policy_list.head);
30001f60:	e59f302c 	ldr	r3, [pc, #44]	; 30001f94 <acoral_sched_policy_init+0x38>
30001f64:	e59f2028 	ldr	r2, [pc, #40]	; 30001f94 <acoral_sched_policy_init+0x38>
30001f68:	e5832000 	str	r2, [r3]
30001f6c:	e59f3020 	ldr	r3, [pc, #32]	; 30001f94 <acoral_sched_policy_init+0x38>
30001f70:	e59f201c 	ldr	r2, [pc, #28]	; 30001f94 <acoral_sched_policy_init+0x38>
30001f74:	e5832004 	str	r2, [r3, #4]
	comm_policy_init();
30001f78:	eb000477 	bl	3000315c <comm_policy_init>
#ifdef CFG_THRD_SLICE
	slice_policy_init();
30001f7c:	eb001d82 	bl	3000958c <slice_policy_init>
#endif
#ifdef CFG_THRD_PERIOD
	period_policy_init();
30001f80:	eb001cc4 	bl	30009298 <period_policy_init>
#endif
#ifdef CFG_THRD_RM
	rm_policy_init();
30001f84:	eb001b3b 	bl	30008c78 <rm_policy_init>
#endif
#ifdef CFG_THRD_POSIX
	posix_policy_init();
30001f88:	eb001ecc 	bl	30009ac0 <posix_policy_init>
#endif
}
30001f8c:	e8bd4008 	pop	{r3, lr}
30001f90:	e12fff1e 	bx	lr
30001f94:	30010570 	.word	0x30010570

30001f98 <app_enter_policy_init>:

void app_enter_policy_init(){
30001f98:	e92d4008 	push	{r3, lr}
#ifdef CFG_THRD_RM
	rm_init();
30001f9c:	eb001b10 	bl	30008be4 <rm_init>
#endif
}
30001fa0:	e8bd4008 	pop	{r3, lr}
30001fa4:	e12fff1e 	bx	lr

30001fa8 <app_exit_policy_init>:

void app_exit_policy_init(){
30001fa8:	e92d4008 	push	{r3, lr}
#ifdef CFG_THRD_RM
	rm_end();
30001fac:	eb001b4a 	bl	30008cdc <rm_end>
#endif
}
30001fb0:	e8bd4008 	pop	{r3, lr}
30001fb4:	e12fff1e 	bx	lr

30001fb8 <acoral_sched_init>:
#include<lsched.h>
acoral_u8 need_sched[HAL_MAX_CPU];
acoral_u8 sched_lock[HAL_MAX_CPU];
acoral_thread_t *running_thread[HAL_MAX_CPU],*ready_thread[HAL_MAX_CPU];
static acoral_rdy_queue_t acoral_ready_queues[HAL_MAX_CPU];
void acoral_sched_init(){
30001fb8:	e24dd008 	sub	sp, sp, #8
	acoral_u8 i;
	for(i=0;i<HAL_MAX_CPU;i++){
30001fbc:	e3a03000 	mov	r3, #0
30001fc0:	e5cd3007 	strb	r3, [sp, #7]
30001fc4:	ea000008 	b	30001fec <acoral_sched_init+0x34>
		sched_lock[acoral_current_cpu]=0;
30001fc8:	e59f3030 	ldr	r3, [pc, #48]	; 30002000 <acoral_sched_init+0x48>
30001fcc:	e3a02000 	mov	r2, #0
30001fd0:	e5c32000 	strb	r2, [r3]
		need_sched[acoral_current_cpu]=0;
30001fd4:	e59f3028 	ldr	r3, [pc, #40]	; 30002004 <acoral_sched_init+0x4c>
30001fd8:	e3a02000 	mov	r2, #0
30001fdc:	e5c32000 	strb	r2, [r3]
acoral_u8 sched_lock[HAL_MAX_CPU];
acoral_thread_t *running_thread[HAL_MAX_CPU],*ready_thread[HAL_MAX_CPU];
static acoral_rdy_queue_t acoral_ready_queues[HAL_MAX_CPU];
void acoral_sched_init(){
	acoral_u8 i;
	for(i=0;i<HAL_MAX_CPU;i++){
30001fe0:	e5dd3007 	ldrb	r3, [sp, #7]
30001fe4:	e2833001 	add	r3, r3, #1
30001fe8:	e5cd3007 	strb	r3, [sp, #7]
30001fec:	e5dd3007 	ldrb	r3, [sp, #7]
30001ff0:	e3530000 	cmp	r3, #0
30001ff4:	0afffff3 	beq	30001fc8 <acoral_sched_init+0x10>
		sched_lock[acoral_current_cpu]=0;
		need_sched[acoral_current_cpu]=0;
	}
}
30001ff8:	e28dd008 	add	sp, sp, #8
30001ffc:	e12fff1e 	bx	lr
30002000:	3000f61c 	.word	0x3000f61c
30002004:	30010634 	.word	0x30010634

30002008 <acoral_sched_unlock>:

void acoral_sched_unlock(){
30002008:	e92d4008 	push	{r3, lr}
	sched_lock[acoral_current_cpu]=0;	
3000200c:	e59f3010 	ldr	r3, [pc, #16]	; 30002024 <acoral_sched_unlock+0x1c>
30002010:	e3a02000 	mov	r2, #0
30002014:	e5c32000 	strb	r2, [r3]
	acoral_sched();
30002018:	eb0000fc 	bl	30002410 <acoral_sched>
}
3000201c:	e8bd4008 	pop	{r3, lr}
30002020:	e12fff1e 	bx	lr
30002024:	3000f61c 	.word	0x3000f61c

30002028 <acoral_set_orig_thread>:

void acoral_set_orig_thread(acoral_thread_t *thread){
30002028:	e24dd008 	sub	sp, sp, #8
3000202c:	e58d0004 	str	r0, [sp, #4]
  	running_thread[acoral_current_cpu]=thread;
30002030:	e59f300c 	ldr	r3, [pc, #12]	; 30002044 <acoral_set_orig_thread+0x1c>
30002034:	e59d2004 	ldr	r2, [sp, #4]
30002038:	e5832000 	str	r2, [r3]
}
3000203c:	e28dd008 	add	sp, sp, #8
30002040:	e12fff1e 	bx	lr
30002044:	30010630 	.word	0x30010630

30002048 <acoral_set_running_thread>:

void acoral_set_running_thread(acoral_thread_t *thread){
30002048:	e24dd008 	sub	sp, sp, #8
3000204c:	e58d0004 	str	r0, [sp, #4]
  	running_thread[acoral_current_cpu]->state&=~ACORAL_THREAD_STATE_RUNNING;
30002050:	e59f3040 	ldr	r3, [pc, #64]	; 30002098 <acoral_set_running_thread+0x50>
30002054:	e5932000 	ldr	r2, [r3]
30002058:	e59f3038 	ldr	r3, [pc, #56]	; 30002098 <acoral_set_running_thread+0x50>
3000205c:	e5933000 	ldr	r3, [r3]
30002060:	e5d33004 	ldrb	r3, [r3, #4]
30002064:	e20330fb 	and	r3, r3, #251	; 0xfb
30002068:	e5c23004 	strb	r3, [r2, #4]
	thread->state|=ACORAL_THREAD_STATE_RUNNING;
3000206c:	e59d3004 	ldr	r3, [sp, #4]
30002070:	e5d33004 	ldrb	r3, [r3, #4]
30002074:	e3833004 	orr	r3, r3, #4
30002078:	e20320ff 	and	r2, r3, #255	; 0xff
3000207c:	e59d3004 	ldr	r3, [sp, #4]
30002080:	e5c32004 	strb	r2, [r3, #4]
  	running_thread[acoral_current_cpu]=thread;
30002084:	e59f300c 	ldr	r3, [pc, #12]	; 30002098 <acoral_set_running_thread+0x50>
30002088:	e59d2004 	ldr	r2, [sp, #4]
3000208c:	e5832000 	str	r2, [r3]
}
30002090:	e28dd008 	add	sp, sp, #8
30002094:	e12fff1e 	bx	lr
30002098:	30010630 	.word	0x30010630

3000209c <acoral_thread_runqueue_init>:

/*================================
 * func: init acoral_ready_queues 
 *    初始化各个核上的就绪队列 
 *================================*/
void acoral_thread_runqueue_init(){
3000209c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300020a0:	e24dd014 	sub	sp, sp, #20
	acoral_prio_array_t *array;
	acoral_rdy_queue_t *rdy_queue;
	acoral_u8 cpu;
	/*初始化每个核上的优先级队列*/
	for(cpu=0;cpu<HAL_MAX_CPU;cpu++){
300020a4:	e3a03000 	mov	r3, #0
300020a8:	e5cd300f 	strb	r3, [sp, #15]
300020ac:	ea000011 	b	300020f8 <acoral_thread_runqueue_init+0x5c>
		rdy_queue=acoral_ready_queues+cpu;
300020b0:	e5dd200f 	ldrb	r2, [sp, #15]
300020b4:	e1a03002 	mov	r3, r2
300020b8:	e1a03183 	lsl	r3, r3, #3
300020bc:	e0623003 	rsb	r3, r2, r3
300020c0:	e1a02283 	lsl	r2, r3, #5
300020c4:	e0632002 	rsb	r2, r3, r2
300020c8:	e1a03102 	lsl	r3, r2, #2
300020cc:	e1a02003 	mov	r2, r3
300020d0:	e59f3038 	ldr	r3, [pc, #56]	; 30002110 <acoral_thread_runqueue_init+0x74>
300020d4:	e0823003 	add	r3, r2, r3
300020d8:	e58d3008 	str	r3, [sp, #8]
		array=&rdy_queue->array;
300020dc:	e59d3008 	ldr	r3, [sp, #8]
300020e0:	e58d3004 	str	r3, [sp, #4]
		acoral_prio_queue_init(array);
300020e4:	e59d0004 	ldr	r0, [sp, #4]
300020e8:	eb001ff6 	bl	3000a0c8 <acoral_prio_queue_init>
void acoral_thread_runqueue_init(){
	acoral_prio_array_t *array;
	acoral_rdy_queue_t *rdy_queue;
	acoral_u8 cpu;
	/*初始化每个核上的优先级队列*/
	for(cpu=0;cpu<HAL_MAX_CPU;cpu++){
300020ec:	e5dd300f 	ldrb	r3, [sp, #15]
300020f0:	e2833001 	add	r3, r3, #1
300020f4:	e5cd300f 	strb	r3, [sp, #15]
300020f8:	e5dd300f 	ldrb	r3, [sp, #15]
300020fc:	e3530000 	cmp	r3, #0
30002100:	0affffea 	beq	300020b0 <acoral_thread_runqueue_init+0x14>
		rdy_queue=acoral_ready_queues+cpu;
		array=&rdy_queue->array;
		acoral_prio_queue_init(array);
	}

}
30002104:	e28dd014 	add	sp, sp, #20
30002108:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000210c:	e12fff1e 	bx	lr
30002110:	3000ed18 	.word	0x3000ed18

30002114 <acoral_get_idlest_cpu>:

/*================================
 *      Get the idlest core 
 *     获取最空闲的cpu核 
 *================================*/
acoral_u32 acoral_get_idlest_cpu(){
30002114:	e24dd010 	sub	sp, sp, #16
  	acoral_u32 cpu,i,count=-1;
30002118:	e3e03000 	mvn	r3, #0
3000211c:	e58d3008 	str	r3, [sp, #8]
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0;i<HAL_MAX_CPU;i++){
30002120:	e3a03000 	mov	r3, #0
30002124:	e58d3004 	str	r3, [sp, #4]
30002128:	ea000017 	b	3000218c <acoral_get_idlest_cpu+0x78>
	    rdy_queue=acoral_ready_queues+i;
3000212c:	e59d2004 	ldr	r2, [sp, #4]
30002130:	e1a03002 	mov	r3, r2
30002134:	e1a03183 	lsl	r3, r3, #3
30002138:	e0623003 	rsb	r3, r2, r3
3000213c:	e1a02283 	lsl	r2, r3, #5
30002140:	e0632002 	rsb	r2, r3, r2
30002144:	e1a03102 	lsl	r3, r2, #2
30002148:	e1a02003 	mov	r2, r3
3000214c:	e59f3054 	ldr	r3, [pc, #84]	; 300021a8 <acoral_get_idlest_cpu+0x94>
30002150:	e0823003 	add	r3, r2, r3
30002154:	e58d300c 	str	r3, [sp, #12]
	    if(count>rdy_queue->array.num){
30002158:	e59d300c 	ldr	r3, [sp, #12]
3000215c:	e5932000 	ldr	r2, [r3]
30002160:	e59d3008 	ldr	r3, [sp, #8]
30002164:	e1520003 	cmp	r2, r3
30002168:	2a000004 	bcs	30002180 <acoral_get_idlest_cpu+0x6c>
	      	count=rdy_queue->array.num;
3000216c:	e59d300c 	ldr	r3, [sp, #12]
30002170:	e5933000 	ldr	r3, [r3]
30002174:	e58d3008 	str	r3, [sp, #8]
		cpu=i;
30002178:	e59d3004 	ldr	r3, [sp, #4]
3000217c:	e58d3000 	str	r3, [sp]
 *     获取最空闲的cpu核 
 *================================*/
acoral_u32 acoral_get_idlest_cpu(){
  	acoral_u32 cpu,i,count=-1;
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0;i<HAL_MAX_CPU;i++){
30002180:	e59d3004 	ldr	r3, [sp, #4]
30002184:	e2833001 	add	r3, r3, #1
30002188:	e58d3004 	str	r3, [sp, #4]
3000218c:	e59d3004 	ldr	r3, [sp, #4]
30002190:	e3530000 	cmp	r3, #0
30002194:	0affffe4 	beq	3000212c <acoral_get_idlest_cpu+0x18>
	    if(count>rdy_queue->array.num){
	      	count=rdy_queue->array.num;
		cpu=i;
	    }
	}
	return cpu;
30002198:	e59d3000 	ldr	r3, [sp]
}
3000219c:	e1a00003 	mov	r0, r3
300021a0:	e28dd010 	add	sp, sp, #16
300021a4:	e12fff1e 	bx	lr
300021a8:	3000ed18 	.word	0x3000ed18

300021ac <acoral_get_idle_maskcpu>:

acoral_u32 acoral_get_idle_maskcpu(acoral_u32 cpu_mask){
300021ac:	e24dd018 	sub	sp, sp, #24
300021b0:	e58d0004 	str	r0, [sp, #4]
  	acoral_u32 cpu,i,count=-1;
300021b4:	e3e03000 	mvn	r3, #0
300021b8:	e58d3010 	str	r3, [sp, #16]
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0,cpu=0;i<HAL_MAX_CPU;i++){
300021bc:	e3a03000 	mov	r3, #0
300021c0:	e58d300c 	str	r3, [sp, #12]
300021c4:	e3a03000 	mov	r3, #0
300021c8:	e58d3008 	str	r3, [sp, #8]
300021cc:	ea00001f 	b	30002250 <acoral_get_idle_maskcpu+0xa4>
	    rdy_queue=acoral_ready_queues+i;
300021d0:	e59d200c 	ldr	r2, [sp, #12]
300021d4:	e1a03002 	mov	r3, r2
300021d8:	e1a03183 	lsl	r3, r3, #3
300021dc:	e0623003 	rsb	r3, r2, r3
300021e0:	e1a02283 	lsl	r2, r3, #5
300021e4:	e0632002 	rsb	r2, r3, r2
300021e8:	e1a03102 	lsl	r3, r2, #2
300021ec:	e1a02003 	mov	r2, r3
300021f0:	e59f3074 	ldr	r3, [pc, #116]	; 3000226c <acoral_get_idle_maskcpu+0xc0>
300021f4:	e0823003 	add	r3, r2, r3
300021f8:	e58d3014 	str	r3, [sp, #20]
	    if(count>rdy_queue->array.num&&(1<<i&cpu_mask)){
300021fc:	e59d3014 	ldr	r3, [sp, #20]
30002200:	e5932000 	ldr	r2, [r3]
30002204:	e59d3010 	ldr	r3, [sp, #16]
30002208:	e1520003 	cmp	r2, r3
3000220c:	2a00000c 	bcs	30002244 <acoral_get_idle_maskcpu+0x98>
30002210:	e59d300c 	ldr	r3, [sp, #12]
30002214:	e3a02001 	mov	r2, #1
30002218:	e1a03312 	lsl	r3, r2, r3
3000221c:	e1a02003 	mov	r2, r3
30002220:	e59d3004 	ldr	r3, [sp, #4]
30002224:	e0023003 	and	r3, r2, r3
30002228:	e3530000 	cmp	r3, #0
3000222c:	0a000004 	beq	30002244 <acoral_get_idle_maskcpu+0x98>
	      	count=rdy_queue->array.num;
30002230:	e59d3014 	ldr	r3, [sp, #20]
30002234:	e5933000 	ldr	r3, [r3]
30002238:	e58d3010 	str	r3, [sp, #16]
		cpu=i;
3000223c:	e59d300c 	ldr	r3, [sp, #12]
30002240:	e58d3008 	str	r3, [sp, #8]
}

acoral_u32 acoral_get_idle_maskcpu(acoral_u32 cpu_mask){
  	acoral_u32 cpu,i,count=-1;
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0,cpu=0;i<HAL_MAX_CPU;i++){
30002244:	e59d300c 	ldr	r3, [sp, #12]
30002248:	e2833001 	add	r3, r3, #1
3000224c:	e58d300c 	str	r3, [sp, #12]
30002250:	e59d300c 	ldr	r3, [sp, #12]
30002254:	e3530000 	cmp	r3, #0
30002258:	0affffdc 	beq	300021d0 <acoral_get_idle_maskcpu+0x24>
	    if(count>rdy_queue->array.num&&(1<<i&cpu_mask)){
	      	count=rdy_queue->array.num;
		cpu=i;
	    }
	}
	return cpu;
3000225c:	e59d3008 	ldr	r3, [sp, #8]
}
30002260:	e1a00003 	mov	r0, r3
30002264:	e28dd018 	add	sp, sp, #24
30002268:	e12fff1e 	bx	lr
3000226c:	3000ed18 	.word	0x3000ed18

30002270 <acoral_rdyqueue_add>:

/*================================
 * func: add thread to acoral_ready_queues
 *    将线程挂到就绪队列上
 *================================*/
void acoral_rdyqueue_add(acoral_thread_t *thread){
30002270:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002274:	e24dd014 	sub	sp, sp, #20
30002278:	e58d0004 	str	r0, [sp, #4]
	acoral_rdy_queue_t *rdy_queue;
	acoral_u8 cpu;
	cpu=thread->cpu;
3000227c:	e59d3004 	ldr	r3, [sp, #4]
30002280:	e5d33006 	ldrb	r3, [r3, #6]
30002284:	e5cd300f 	strb	r3, [sp, #15]
	rdy_queue=acoral_ready_queues+cpu;
30002288:	e5dd200f 	ldrb	r2, [sp, #15]
3000228c:	e1a03002 	mov	r3, r2
30002290:	e1a03183 	lsl	r3, r3, #3
30002294:	e0623003 	rsb	r3, r2, r3
30002298:	e1a02283 	lsl	r2, r3, #5
3000229c:	e0632002 	rsb	r2, r3, r2
300022a0:	e1a03102 	lsl	r3, r2, #2
300022a4:	e1a02003 	mov	r2, r3
300022a8:	e59f308c 	ldr	r3, [pc, #140]	; 3000233c <acoral_rdyqueue_add+0xcc>
300022ac:	e0823003 	add	r3, r2, r3
300022b0:	e58d3008 	str	r3, [sp, #8]
	acoral_prio_queue_add(&rdy_queue->array,thread->prio,&thread->ready);
300022b4:	e59d1008 	ldr	r1, [sp, #8]
300022b8:	e59d3004 	ldr	r3, [sp, #4]
300022bc:	e5d33005 	ldrb	r3, [r3, #5]
300022c0:	e1a02003 	mov	r2, r3
300022c4:	e59d3004 	ldr	r3, [sp, #4]
300022c8:	e2833010 	add	r3, r3, #16
300022cc:	e1a00001 	mov	r0, r1
300022d0:	e1a01002 	mov	r1, r2
300022d4:	e1a02003 	mov	r2, r3
300022d8:	eb001f25 	bl	30009f74 <acoral_prio_queue_add>
	thread->state&=~ACORAL_THREAD_STATE_SUSPEND;
300022dc:	e59d3004 	ldr	r3, [sp, #4]
300022e0:	e5d33004 	ldrb	r3, [r3, #4]
300022e4:	e20330fd 	and	r3, r3, #253	; 0xfd
300022e8:	e59d2004 	ldr	r2, [sp, #4]
300022ec:	e5c23004 	strb	r3, [r2, #4]
	thread->state|=ACORAL_THREAD_STATE_READY;
300022f0:	e59d3004 	ldr	r3, [sp, #4]
300022f4:	e5d33004 	ldrb	r3, [r3, #4]
300022f8:	e3833001 	orr	r3, r3, #1
300022fc:	e20320ff 	and	r2, r3, #255	; 0xff
30002300:	e59d3004 	ldr	r3, [sp, #4]
30002304:	e5c32004 	strb	r2, [r3, #4]
	thread->res.id=thread->res.id|cpu<<ACORAL_RES_CPU_BIT;
30002308:	e59d3004 	ldr	r3, [sp, #4]
3000230c:	e5932000 	ldr	r2, [r3]
30002310:	e5dd300f 	ldrb	r3, [sp, #15]
30002314:	e1a03c03 	lsl	r3, r3, #24
30002318:	e1822003 	orr	r2, r2, r3
3000231c:	e59d3004 	ldr	r3, [sp, #4]
30002320:	e5832000 	str	r2, [r3]
	acoral_set_need_sched(true);
30002324:	e59f3014 	ldr	r3, [pc, #20]	; 30002340 <acoral_rdyqueue_add+0xd0>
30002328:	e3a02001 	mov	r2, #1
3000232c:	e5c32000 	strb	r2, [r3]
}
30002330:	e28dd014 	add	sp, sp, #20
30002334:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002338:	e12fff1e 	bx	lr
3000233c:	3000ed18 	.word	0x3000ed18
30002340:	30010634 	.word	0x30010634

30002344 <acoral_rdyqueue_del>:

/*================================
 * func: remove thread from acoral_ready_queues 
 *    将线程从就绪队列上取下
 *================================*/
void acoral_rdyqueue_del(acoral_thread_t *thread){
30002344:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002348:	e24dd014 	sub	sp, sp, #20
3000234c:	e58d0004 	str	r0, [sp, #4]
	acoral_8 cpu;
	acoral_rdy_queue_t *rdy_queue;
	cpu=thread->cpu;
30002350:	e59d3004 	ldr	r3, [sp, #4]
30002354:	e5d33006 	ldrb	r3, [r3, #6]
30002358:	e5cd300b 	strb	r3, [sp, #11]
	rdy_queue=acoral_ready_queues+cpu;
3000235c:	e1dd20db 	ldrsb	r2, [sp, #11]
30002360:	e1a03002 	mov	r3, r2
30002364:	e1a03183 	lsl	r3, r3, #3
30002368:	e0623003 	rsb	r3, r2, r3
3000236c:	e1a02283 	lsl	r2, r3, #5
30002370:	e0632002 	rsb	r2, r3, r2
30002374:	e1a03102 	lsl	r3, r2, #2
30002378:	e1a02003 	mov	r2, r3
3000237c:	e59f3084 	ldr	r3, [pc, #132]	; 30002408 <acoral_rdyqueue_del+0xc4>
30002380:	e0823003 	add	r3, r2, r3
30002384:	e58d300c 	str	r3, [sp, #12]
        acoral_prio_queue_del(&rdy_queue->array,thread->prio,&thread->ready);
30002388:	e59d100c 	ldr	r1, [sp, #12]
3000238c:	e59d3004 	ldr	r3, [sp, #4]
30002390:	e5d33005 	ldrb	r3, [r3, #5]
30002394:	e1a02003 	mov	r2, r3
30002398:	e59d3004 	ldr	r3, [sp, #4]
3000239c:	e2833010 	add	r3, r3, #16
300023a0:	e1a00001 	mov	r0, r1
300023a4:	e1a01002 	mov	r1, r2
300023a8:	e1a02003 	mov	r2, r3
300023ac:	eb001f12 	bl	30009ffc <acoral_prio_queue_del>
	thread->state&=~ACORAL_THREAD_STATE_READY;
300023b0:	e59d3004 	ldr	r3, [sp, #4]
300023b4:	e5d33004 	ldrb	r3, [r3, #4]
300023b8:	e20330fe 	and	r3, r3, #254	; 0xfe
300023bc:	e59d2004 	ldr	r2, [sp, #4]
300023c0:	e5c23004 	strb	r3, [r2, #4]
	thread->state&=~ACORAL_THREAD_STATE_RUNNING;
300023c4:	e59d3004 	ldr	r3, [sp, #4]
300023c8:	e5d33004 	ldrb	r3, [r3, #4]
300023cc:	e20330fb 	and	r3, r3, #251	; 0xfb
300023d0:	e59d2004 	ldr	r2, [sp, #4]
300023d4:	e5c23004 	strb	r3, [r2, #4]
	thread->state|=ACORAL_THREAD_STATE_SUSPEND;
300023d8:	e59d3004 	ldr	r3, [sp, #4]
300023dc:	e5d33004 	ldrb	r3, [r3, #4]
300023e0:	e3833002 	orr	r3, r3, #2
300023e4:	e20320ff 	and	r2, r3, #255	; 0xff
300023e8:	e59d3004 	ldr	r3, [sp, #4]
300023ec:	e5c32004 	strb	r2, [r3, #4]
	/*设置线程所在的核可调度*/
	acoral_set_need_sched(true);
300023f0:	e59f3014 	ldr	r3, [pc, #20]	; 3000240c <acoral_rdyqueue_del+0xc8>
300023f4:	e3a02001 	mov	r2, #1
300023f8:	e5c32000 	strb	r2, [r3]
}
300023fc:	e28dd014 	add	sp, sp, #20
30002400:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002404:	e12fff1e 	bx	lr
30002408:	3000ed18 	.word	0x3000ed18
3000240c:	30010634 	.word	0x30010634

30002410 <acoral_sched>:

/*================================
 * func: sched thread in acoral
 *         调度线程
 *================================*/
void acoral_sched(){
30002410:	e92d4008 	push	{r3, lr}
	/*如果不需要调度，则返回*/
	if(!acoral_need_sched)
30002414:	e59f3068 	ldr	r3, [pc, #104]	; 30002484 <acoral_sched+0x74>
30002418:	e5d33000 	ldrb	r3, [r3]
3000241c:	e3530000 	cmp	r3, #0
30002420:	0a00000e 	beq	30002460 <acoral_sched+0x50>
		return;

	if(acoral_intr_nesting)
30002424:	ebfffccd 	bl	30001760 <hal_get_intr_nesting_comm>
30002428:	e1a03000 	mov	r3, r0
3000242c:	e3530000 	cmp	r3, #0
30002430:	1a00000c 	bne	30002468 <acoral_sched+0x58>
		return;

	if(acoral_sched_is_lock)
30002434:	e59f304c 	ldr	r3, [pc, #76]	; 30002488 <acoral_sched+0x78>
30002438:	e5d33000 	ldrb	r3, [r3]
3000243c:	e3530000 	cmp	r3, #0
30002440:	1a00000a 	bne	30002470 <acoral_sched+0x60>
		return;
	/*如果还没有开始调度，则返回*/
	if(!acoral_start_sched)
30002444:	e59f3040 	ldr	r3, [pc, #64]	; 3000248c <acoral_sched+0x7c>
30002448:	e5933000 	ldr	r3, [r3]
3000244c:	e3530000 	cmp	r3, #0
30002450:	0a000008 	beq	30002478 <acoral_sched+0x68>
	  	return;
	/*这个函数进行简单处理后会直接或间接调用acoral_real_sched,或者acoral_real_intr_sched*/
	HAL_SCHED_BRIDGE(); 
30002454:	ebfffcde 	bl	300017d4 <hal_sched_bridge_comm>
	return;
30002458:	e1a00000 	nop			; (mov r0, r0)
3000245c:	ea000006 	b	3000247c <acoral_sched+0x6c>
 *         调度线程
 *================================*/
void acoral_sched(){
	/*如果不需要调度，则返回*/
	if(!acoral_need_sched)
		return;
30002460:	e1a00000 	nop			; (mov r0, r0)
30002464:	ea000004 	b	3000247c <acoral_sched+0x6c>

	if(acoral_intr_nesting)
		return;
30002468:	e1a00000 	nop			; (mov r0, r0)
3000246c:	ea000002 	b	3000247c <acoral_sched+0x6c>

	if(acoral_sched_is_lock)
		return;
30002470:	e1a00000 	nop			; (mov r0, r0)
30002474:	ea000000 	b	3000247c <acoral_sched+0x6c>
	/*如果还没有开始调度，则返回*/
	if(!acoral_start_sched)
	  	return;
30002478:	e1a00000 	nop			; (mov r0, r0)
	/*这个函数进行简单处理后会直接或间接调用acoral_real_sched,或者acoral_real_intr_sched*/
	HAL_SCHED_BRIDGE(); 
	return;
}
3000247c:	e8bd4008 	pop	{r3, lr}
30002480:	e12fff1e 	bx	lr
30002484:	30010634 	.word	0x30010634
30002488:	3000f61c 	.word	0x3000f61c
3000248c:	3000ed14 	.word	0x3000ed14

30002490 <acoral_real_sched>:
/*================================
 * func: sched thread in acoral
 *        进程上下文调度实现
 *        这个函数必须是原子操作
 *================================*/
void acoral_real_sched(){
30002490:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002494:	e24dd00c 	sub	sp, sp, #12
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
30002498:	e59f3090 	ldr	r3, [pc, #144]	; 30002530 <acoral_real_sched+0xa0>
3000249c:	e3a02000 	mov	r2, #0
300024a0:	e5c32000 	strb	r2, [r3]
	prev=acoral_cur_thread;
300024a4:	e59f3088 	ldr	r3, [pc, #136]	; 30002534 <acoral_real_sched+0xa4>
300024a8:	e5933000 	ldr	r3, [r3]
300024ac:	e58d3000 	str	r3, [sp]
	/*选择最高优先级线程*/
	acoral_select_thread();
300024b0:	eb00004c 	bl	300025e8 <acoral_select_thread>
	next=acoral_ready_thread;
300024b4:	e59f307c 	ldr	r3, [pc, #124]	; 30002538 <acoral_real_sched+0xa8>
300024b8:	e5933000 	ldr	r3, [r3]
300024bc:	e58d3004 	str	r3, [sp, #4]
	if(prev!=next){
300024c0:	e59d2000 	ldr	r2, [sp]
300024c4:	e59d3004 	ldr	r3, [sp, #4]
300024c8:	e1520003 	cmp	r2, r3
300024cc:	0a000014 	beq	30002524 <acoral_real_sched+0x94>
	    acoral_set_running_thread(next);
300024d0:	e59d0004 	ldr	r0, [sp, #4]
300024d4:	ebfffedb 	bl	30002048 <acoral_set_running_thread>
	    if(prev->state==ACORAL_THREAD_STATE_EXIT){
300024d8:	e59d3000 	ldr	r3, [sp]
300024dc:	e5d33004 	ldrb	r3, [r3, #4]
300024e0:	e3530008 	cmp	r3, #8
300024e4:	1a000007 	bne	30002508 <acoral_real_sched+0x78>
		  prev->state=ACORAL_THREAD_STATE_RELEASE;
300024e8:	e59d3000 	ldr	r3, [sp]
300024ec:	e3a02010 	mov	r2, #16
300024f0:	e5c32004 	strb	r2, [r3, #4]
  		  HAL_SWITCH_TO(&next->stack);
300024f4:	e59d3004 	ldr	r3, [sp, #4]
300024f8:	e2833034 	add	r3, r3, #52	; 0x34
300024fc:	e1a00003 	mov	r0, r3
30002500:	ebfffc21 	bl	3000158c <HAL_SWITCH_TO>
		  return;
30002504:	ea000006 	b	30002524 <acoral_real_sched+0x94>
  		  HAL_MOVE_SWITCH_TO(&prev->move_lock,0,&next->stack);
		  return;
	    }
#endif
	    /*线程切换*/
	    HAL_CONTEXT_SWITCH(&prev->stack,&next->stack);
30002508:	e59d3000 	ldr	r3, [sp]
3000250c:	e2832034 	add	r2, r3, #52	; 0x34
30002510:	e59d3004 	ldr	r3, [sp, #4]
30002514:	e2833034 	add	r3, r3, #52	; 0x34
30002518:	e1a00002 	mov	r0, r2
3000251c:	e1a01003 	mov	r1, r3
30002520:	ebfffc47 	bl	30001644 <HAL_CONTEXT_SWITCH>
	}
}
30002524:	e28dd00c 	add	sp, sp, #12
30002528:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000252c:	e12fff1e 	bx	lr
30002530:	30010634 	.word	0x30010634
30002534:	30010630 	.word	0x30010630
30002538:	30010628 	.word	0x30010628

3000253c <acoral_real_intr_sched>:
/*================================
 * func: sched thread in acoral
 *        中断上下文调度实现
 *        这个函数必须是原子操作
 *================================*/
void acoral_real_intr_sched(){
3000253c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002540:	e24dd00c 	sub	sp, sp, #12
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
30002544:	e59f3090 	ldr	r3, [pc, #144]	; 300025dc <acoral_real_intr_sched+0xa0>
30002548:	e3a02000 	mov	r2, #0
3000254c:	e5c32000 	strb	r2, [r3]
	prev=acoral_cur_thread;
30002550:	e59f3088 	ldr	r3, [pc, #136]	; 300025e0 <acoral_real_intr_sched+0xa4>
30002554:	e5933000 	ldr	r3, [r3]
30002558:	e58d3000 	str	r3, [sp]
	/*选择最高优先级线程*/
	acoral_select_thread();
3000255c:	eb000021 	bl	300025e8 <acoral_select_thread>
	next=acoral_ready_thread;
30002560:	e59f307c 	ldr	r3, [pc, #124]	; 300025e4 <acoral_real_intr_sched+0xa8>
30002564:	e5933000 	ldr	r3, [r3]
30002568:	e58d3004 	str	r3, [sp, #4]
	if(prev!=next){
3000256c:	e59d2000 	ldr	r2, [sp]
30002570:	e59d3004 	ldr	r3, [sp, #4]
30002574:	e1520003 	cmp	r2, r3
30002578:	0a000014 	beq	300025d0 <acoral_real_intr_sched+0x94>
	    acoral_set_running_thread(next);
3000257c:	e59d0004 	ldr	r0, [sp, #4]
30002580:	ebfffeb0 	bl	30002048 <acoral_set_running_thread>
	    if(prev->state==ACORAL_THREAD_STATE_EXIT){
30002584:	e59d3000 	ldr	r3, [sp]
30002588:	e5d33004 	ldrb	r3, [r3, #4]
3000258c:	e3530008 	cmp	r3, #8
30002590:	1a000007 	bne	300025b4 <acoral_real_intr_sched+0x78>
		  prev->state=ACORAL_THREAD_STATE_RELEASE;
30002594:	e59d3000 	ldr	r3, [sp]
30002598:	e3a02010 	mov	r2, #16
3000259c:	e5c32004 	strb	r2, [r3, #4]
  		  HAL_INTR_SWITCH_TO(&next->stack);
300025a0:	e59d3004 	ldr	r3, [sp, #4]
300025a4:	e2833034 	add	r3, r3, #52	; 0x34
300025a8:	e1a00003 	mov	r0, r3
300025ac:	ebfffbfa 	bl	3000159c <HAL_INTR_SWITCH_TO>
		  return;
300025b0:	ea000006 	b	300025d0 <acoral_real_intr_sched+0x94>
  		  HAL_MOVE_SWITCH_TO(&prev->move_lock,0,&next->stack);
		  return;
	    }
#endif
	    /*线程切换*/
	    HAL_INTR_CTX_SWITCH(&prev->stack,&next->stack);
300025b4:	e59d3000 	ldr	r3, [sp]
300025b8:	e2832034 	add	r2, r3, #52	; 0x34
300025bc:	e59d3004 	ldr	r3, [sp, #4]
300025c0:	e2833034 	add	r3, r3, #52	; 0x34
300025c4:	e1a00002 	mov	r0, r2
300025c8:	e1a01003 	mov	r1, r3
300025cc:	ebfffc02 	bl	300015dc <HAL_INTR_CTX_SWITCH>
	}
}
300025d0:	e28dd00c 	add	sp, sp, #12
300025d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300025d8:	e12fff1e 	bx	lr
300025dc:	30010634 	.word	0x30010634
300025e0:	30010630 	.word	0x30010630
300025e4:	30010628 	.word	0x30010628

300025e8 <acoral_select_thread>:

/*================================
 * func: sched thread in acoral
 *     选择优先级最高的线程
 *================================*/
void acoral_select_thread(){
300025e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300025ec:	e24dd024 	sub	sp, sp, #36	; 0x24
	acoral_rdy_queue_t *rdy_queue;
	acoral_prio_array_t *array;
	acoral_list_t *head;
	acoral_thread_t *thread;
	acoral_queue_t *queue;
	cpu=acoral_current_cpu;
300025f0:	e3a03000 	mov	r3, #0
300025f4:	e5cd3007 	strb	r3, [sp, #7]
	rdy_queue=acoral_ready_queues+cpu;
300025f8:	e5dd2007 	ldrb	r2, [sp, #7]
300025fc:	e1a03002 	mov	r3, r2
30002600:	e1a03183 	lsl	r3, r3, #3
30002604:	e0623003 	rsb	r3, r2, r3
30002608:	e1a02283 	lsl	r2, r3, #5
3000260c:	e0632002 	rsb	r2, r3, r2
30002610:	e1a03102 	lsl	r3, r2, #2
30002614:	e1a02003 	mov	r2, r3
30002618:	e59f3084 	ldr	r3, [pc, #132]	; 300026a4 <acoral_select_thread+0xbc>
3000261c:	e0823003 	add	r3, r2, r3
30002620:	e58d300c 	str	r3, [sp, #12]
	array=&rdy_queue->array;
30002624:	e59d300c 	ldr	r3, [sp, #12]
30002628:	e58d3010 	str	r3, [sp, #16]
	/*找出就绪队列中优先级最高的线程的优先级*/
	index = acoral_get_highprio(array);
3000262c:	e59d0010 	ldr	r0, [sp, #16]
30002630:	eb001e97 	bl	3000a094 <acoral_get_highprio>
30002634:	e1a03000 	mov	r3, r0
30002638:	e58d3008 	str	r3, [sp, #8]
	queue = array->queue + index;
3000263c:	e59d3010 	ldr	r3, [sp, #16]
30002640:	e2831010 	add	r1, r3, #16
30002644:	e59d2008 	ldr	r2, [sp, #8]
30002648:	e1a03002 	mov	r3, r2
3000264c:	e1a03083 	lsl	r3, r3, #1
30002650:	e0833002 	add	r3, r3, r2
30002654:	e1a03103 	lsl	r3, r3, #2
30002658:	e0813003 	add	r3, r1, r3
3000265c:	e58d301c 	str	r3, [sp, #28]
	head=&queue->head;
30002660:	e59d301c 	ldr	r3, [sp, #28]
30002664:	e58d3014 	str	r3, [sp, #20]
	thread=list_entry(head->next, acoral_thread_t, ready);
30002668:	e59d3014 	ldr	r3, [sp, #20]
3000266c:	e5933000 	ldr	r3, [r3]
30002670:	e2433010 	sub	r3, r3, #16
30002674:	e58d3018 	str	r3, [sp, #24]
	ACORAL_ASSERT(thread,"Aseert:In select thread");
30002678:	e59d2018 	ldr	r2, [sp, #24]
3000267c:	e59f3024 	ldr	r3, [pc, #36]	; 300026a8 <acoral_select_thread+0xc0>
30002680:	e1a00002 	mov	r0, r2
30002684:	e1a01003 	mov	r1, r3
30002688:	eb00056b 	bl	30003c3c <acoral_assert_res>
	acoral_set_ready_thread(thread);
3000268c:	e59f3018 	ldr	r3, [pc, #24]	; 300026ac <acoral_select_thread+0xc4>
30002690:	e59d2018 	ldr	r2, [sp, #24]
30002694:	e5832000 	str	r2, [r3]
}
30002698:	e28dd024 	add	sp, sp, #36	; 0x24
3000269c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300026a0:	e12fff1e 	bx	lr
300026a4:	3000ed18 	.word	0x3000ed18
300026a8:	3000e470 	.word	0x3000e470
300026ac:	30010628 	.word	0x30010628

300026b0 <acoral_release_thread1>:
 * func: release thread in acoral
 *	
 *   thread     
 *    
 *================================*/
void acoral_release_thread1(acoral_thread_t *thread){
300026b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300026b4:	e24dd01c 	sub	sp, sp, #28
300026b8:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t *head,*tmp;
	acoral_thread_t *daem;
	thread->state=ACORAL_THREAD_STATE_EXIT;
300026bc:	e59d3004 	ldr	r3, [sp, #4]
300026c0:	e3a02008 	mov	r2, #8
300026c4:	e5c32004 	strb	r2, [r3, #4]
	head=&acoral_res_release_queue.head;
300026c8:	e59f304c 	ldr	r3, [pc, #76]	; 3000271c <acoral_release_thread1+0x6c>
300026cc:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&head->lock);
	tmp=head->prev;
300026d0:	e59d300c 	ldr	r3, [sp, #12]
300026d4:	e5933004 	ldr	r3, [r3, #4]
300026d8:	e58d3010 	str	r3, [sp, #16]
	if(tmp!=head)
		acoral_spin_lock(&tmp->lock);
	acoral_list_add2_tail(&thread->waiting,head);
300026dc:	e59d3004 	ldr	r3, [sp, #4]
300026e0:	e2833020 	add	r3, r3, #32
300026e4:	e1a00003 	mov	r0, r3
300026e8:	e59d100c 	ldr	r1, [sp, #12]
300026ec:	eb001eba 	bl	3000a1dc <acoral_list_add2_tail>
	if(tmp!=head)
		acoral_spin_unlock(&tmp->lock);
	acoral_spin_unlock(&head->lock);
	daem=(acoral_thread_t *)acoral_get_res_by_id(daemon_id);
300026f0:	e59f3028 	ldr	r3, [pc, #40]	; 30002720 <acoral_release_thread1+0x70>
300026f4:	e5933000 	ldr	r3, [r3]
300026f8:	e1a00003 	mov	r0, r3
300026fc:	eb00045b 	bl	30003870 <acoral_get_res_by_id>
30002700:	e1a03000 	mov	r3, r0
30002704:	e58d3014 	str	r3, [sp, #20]
	acoral_rdy_thread(daem);
30002708:	e59d0014 	ldr	r0, [sp, #20]
3000270c:	eb000117 	bl	30002b70 <acoral_rdy_thread>
}
30002710:	e28dd01c 	add	sp, sp, #28
30002714:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002718:	e12fff1e 	bx	lr
3000271c:	3000fd08 	.word	0x3000fd08
30002720:	3000fcf4 	.word	0x3000fcf4

30002724 <acoral_release_thread>:
/*================================
 * func: release thread in acoral
 *	
 *   thread     
 *================================*/
void acoral_release_thread(acoral_res_t *res){
30002724:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002728:	e24dd014 	sub	sp, sp, #20
3000272c:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread;
	thread=(acoral_thread_t *)res;
30002730:	e59d3004 	ldr	r3, [sp, #4]
30002734:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	acoral_list_del(&thread->global_list);
30002738:	e59d300c 	ldr	r3, [sp, #12]
3000273c:	e2833028 	add	r3, r3, #40	; 0x28
30002740:	e1a00003 	mov	r0, r3
30002744:	eb001eb7 	bl	3000a228 <acoral_list_del>
	acoral_spin_unlock(&acoral_threads_queue.head.lock);
#ifdef CFG_TEST
	acoral_print("Release %s thread\n",thread->name);
#endif
	acoral_policy_thread_release(thread);
30002748:	e59d000c 	ldr	r0, [sp, #12]
3000274c:	ebfffded 	bl	30001f08 <acoral_policy_thread_release>
  	acoral_free((void *)thread->stack_buttom);
30002750:	e59d300c 	ldr	r3, [sp, #12]
30002754:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30002758:	e1a00003 	mov	r0, r3
3000275c:	eb000fcc 	bl	30006694 <buddy_free>
	acoral_release_res((acoral_res_t *)thread);
30002760:	e59d300c 	ldr	r3, [sp, #12]
30002764:	e1a00003 	mov	r0, r3
30002768:	eb0003ac 	bl	30003620 <acoral_release_res>
}
3000276c:	e28dd014 	add	sp, sp, #20
30002770:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002774:	e12fff1e 	bx	lr

30002778 <acoral_suspend_thread>:
 * func: suspend thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/

void acoral_suspend_thread(acoral_thread_t *thread){
30002778:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000277c:	e24dd014 	sub	sp, sp, #20
30002780:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
30002784:	e59d3004 	ldr	r3, [sp, #4]
30002788:	e5d33004 	ldrb	r3, [r3, #4]
3000278c:	e2033001 	and	r3, r3, #1
30002790:	e3530000 	cmp	r3, #0
30002794:	0a000008 	beq	300027bc <acoral_suspend_thread+0x44>
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_SUSPEND,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002798:	ebfffbd5 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000279c:	e1a03000 	mov	r3, r0
300027a0:	e58d3008 	str	r3, [sp, #8]
	/**/
	acoral_rdyqueue_del(thread);
300027a4:	e59d0004 	ldr	r0, [sp, #4]
300027a8:	ebfffee5 	bl	30002344 <acoral_rdyqueue_del>
	HAL_EXIT_CRITICAL();
300027ac:	e59d0008 	ldr	r0, [sp, #8]
300027b0:	ebfffbcd 	bl	300016ec <HAL_INTR_RESTORE>
	/**/
	acoral_sched();
300027b4:	ebffff15 	bl	30002410 <acoral_sched>
300027b8:	ea000000 	b	300027c0 <acoral_suspend_thread+0x48>

void acoral_suspend_thread(acoral_thread_t *thread){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
		return;
300027bc:	e1a00000 	nop			; (mov r0, r0)
	/**/
	acoral_rdyqueue_del(thread);
	HAL_EXIT_CRITICAL();
	/**/
	acoral_sched();
}
300027c0:	e28dd014 	add	sp, sp, #20
300027c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300027c8:	e12fff1e 	bx	lr

300027cc <acoral_suspend_self>:

/*================================
 * func: suspend thread in acoral
 *      	
 *================================*/
void acoral_suspend_self(){
300027cc:	e92d4008 	push	{r3, lr}
	acoral_suspend_thread(acoral_cur_thread);
300027d0:	e59f3010 	ldr	r3, [pc, #16]	; 300027e8 <acoral_suspend_self+0x1c>
300027d4:	e5933000 	ldr	r3, [r3]
300027d8:	e1a00003 	mov	r0, r3
300027dc:	ebffffe5 	bl	30002778 <acoral_suspend_thread>
}
300027e0:	e8bd4008 	pop	{r3, lr}
300027e4:	e12fff1e 	bx	lr
300027e8:	30010630 	.word	0x30010630

300027ec <acoral_suspend_thread_by_id>:
 * func: suspend thread in acoral
 *      ID	
 *      thread_idID
 *================================*/

void acoral_suspend_thread_by_id(acoral_u32 thread_id){
300027ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300027f0:	e24dd014 	sub	sp, sp, #20
300027f4:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
300027f8:	e59d3004 	ldr	r3, [sp, #4]
300027fc:	e1a00003 	mov	r0, r3
30002800:	eb00041a 	bl	30003870 <acoral_get_res_by_id>
30002804:	e1a03000 	mov	r3, r0
30002808:	e58d300c 	str	r3, [sp, #12]
	acoral_suspend_thread(thread);
3000280c:	e59d000c 	ldr	r0, [sp, #12]
30002810:	ebffffd8 	bl	30002778 <acoral_suspend_thread>
}
30002814:	e28dd014 	add	sp, sp, #20
30002818:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000281c:	e12fff1e 	bx	lr

30002820 <acoral_resume_thread_by_id>:
 * func: resume thread in acoral
 *         	
 *   thread_idID
 *================================*/

void acoral_resume_thread_by_id(acoral_u32 thread_id){
30002820:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002824:	e24dd014 	sub	sp, sp, #20
30002828:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
3000282c:	e59d3004 	ldr	r3, [sp, #4]
30002830:	e1a00003 	mov	r0, r3
30002834:	eb00040d 	bl	30003870 <acoral_get_res_by_id>
30002838:	e1a03000 	mov	r3, r0
3000283c:	e58d300c 	str	r3, [sp, #12]
	acoral_resume_thread(thread);
30002840:	e59d000c 	ldr	r0, [sp, #12]
30002844:	eb000002 	bl	30002854 <acoral_resume_thread>
}
30002848:	e28dd014 	add	sp, sp, #20
3000284c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002850:	e12fff1e 	bx	lr

30002854 <acoral_resume_thread>:
/*================================
 * func: resume thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/
void acoral_resume_thread(acoral_thread_t *thread){
30002854:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002858:	e24dd014 	sub	sp, sp, #20
3000285c:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(thread->state&ACORAL_THREAD_STATE_SUSPEND))
30002860:	e59d3004 	ldr	r3, [sp, #4]
30002864:	e5d33004 	ldrb	r3, [r3, #4]
30002868:	e2033002 	and	r3, r3, #2
3000286c:	e3530000 	cmp	r3, #0
30002870:	0a000008 	beq	30002898 <acoral_resume_thread+0x44>
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_RESUME,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002874:	ebfffb9e 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002878:	e1a03000 	mov	r3, r0
3000287c:	e58d3008 	str	r3, [sp, #8]
	/**/
	acoral_rdyqueue_add(thread);
30002880:	e59d0004 	ldr	r0, [sp, #4]
30002884:	ebfffe79 	bl	30002270 <acoral_rdyqueue_add>
	HAL_EXIT_CRITICAL();
30002888:	e59d0008 	ldr	r0, [sp, #8]
3000288c:	ebfffb96 	bl	300016ec <HAL_INTR_RESTORE>
	/**/
	acoral_sched();
30002890:	ebfffede 	bl	30002410 <acoral_sched>
30002894:	ea000000 	b	3000289c <acoral_resume_thread+0x48>
 *================================*/
void acoral_resume_thread(acoral_thread_t *thread){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(thread->state&ACORAL_THREAD_STATE_SUSPEND))
		return;
30002898:	e1a00000 	nop			; (mov r0, r0)
	/**/
	acoral_rdyqueue_add(thread);
	HAL_EXIT_CRITICAL();
	/**/
	acoral_sched();
}
3000289c:	e28dd014 	add	sp, sp, #20
300028a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300028a4:	e12fff1e 	bx	lr

300028a8 <acoral_delay_thread>:
 *         	
 * thread(TCB) 	
 * timems	
 *      
 *================================*/
static void acoral_delay_thread(acoral_thread_t* thread,acoral_time time){
300028a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300028ac:	e24dd014 	sub	sp, sp, #20
300028b0:	e58d0004 	str	r0, [sp, #4]
300028b4:	e58d1000 	str	r1, [sp]
	acoral_u32 real_ticks;
	if(!acoral_list_empty(&thread->waiting)){
300028b8:	e59d3004 	ldr	r3, [sp, #4]
300028bc:	e5932020 	ldr	r2, [r3, #32]
300028c0:	e59d3004 	ldr	r3, [sp, #4]
300028c4:	e2833020 	add	r3, r3, #32
300028c8:	e1520003 	cmp	r2, r3
300028cc:	1a000012 	bne	3000291c <acoral_delay_thread+0x74>
		return;
	}
#endif
	/*timeticks*/
	/*real_ticks=time*ACORAL_TICKS_PER_SEC/1000;*/
	real_ticks = TIME_TO_TICKS(time);
300028d0:	e59d2000 	ldr	r2, [sp]
300028d4:	e1a03002 	mov	r3, r2
300028d8:	e1a03103 	lsl	r3, r3, #2
300028dc:	e0833002 	add	r3, r3, r2
300028e0:	e1a02103 	lsl	r2, r3, #2
300028e4:	e0833002 	add	r3, r3, r2
300028e8:	e1a03103 	lsl	r3, r3, #2
300028ec:	e1a02003 	mov	r2, r3
300028f0:	e59f3034 	ldr	r3, [pc, #52]	; 3000292c <acoral_delay_thread+0x84>
300028f4:	e0831392 	umull	r1, r3, r2, r3
300028f8:	e1a03323 	lsr	r3, r3, #6
300028fc:	e58d300c 	str	r3, [sp, #12]
	thread->delay=real_ticks;
30002900:	e59d200c 	ldr	r2, [sp, #12]
30002904:	e59d3004 	ldr	r3, [sp, #4]
30002908:	e5832040 	str	r2, [r3, #64]	; 0x40
	/**/
	acoral_delayqueue_add(&time_delay_queue,thread);
3000290c:	e59f001c 	ldr	r0, [pc, #28]	; 30002930 <acoral_delay_thread+0x88>
30002910:	e59d1004 	ldr	r1, [sp, #4]
30002914:	eb000729 	bl	300045c0 <acoral_delayqueue_add>
30002918:	ea000000 	b	30002920 <acoral_delay_thread+0x78>
 *      
 *================================*/
static void acoral_delay_thread(acoral_thread_t* thread,acoral_time time){
	acoral_u32 real_ticks;
	if(!acoral_list_empty(&thread->waiting)){
		return;	
3000291c:	e1a00000 	nop			; (mov r0, r0)
	/*real_ticks=time*ACORAL_TICKS_PER_SEC/1000;*/
	real_ticks = TIME_TO_TICKS(time);
	thread->delay=real_ticks;
	/**/
	acoral_delayqueue_add(&time_delay_queue,thread);
}
30002920:	e28dd014 	add	sp, sp, #20
30002924:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002928:	e12fff1e 	bx	lr
3000292c:	10624dd3 	.word	0x10624dd3
30002930:	300105a0 	.word	0x300105a0

30002934 <acoral_delay_thread_by_id>:
 *         	
 * thread_idID 	
 * timems	
 *      
 *================================*/
static void acoral_delay_thread_by_id(acoral_time time,acoral_id thread_id){
30002934:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002938:	e24dd014 	sub	sp, sp, #20
3000293c:	e58d0004 	str	r0, [sp, #4]
30002940:	e58d1000 	str	r1, [sp]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
30002944:	e59d0000 	ldr	r0, [sp]
30002948:	eb0003c8 	bl	30003870 <acoral_get_res_by_id>
3000294c:	e1a03000 	mov	r3, r0
30002950:	e58d300c 	str	r3, [sp, #12]
	acoral_delay_thread(thread,time);
30002954:	e59d000c 	ldr	r0, [sp, #12]
30002958:	e59d1004 	ldr	r1, [sp, #4]
3000295c:	ebffffd1 	bl	300028a8 <acoral_delay_thread>
}
30002960:	e28dd014 	add	sp, sp, #20
30002964:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002968:	e12fff1e 	bx	lr

3000296c <acoral_delay_self>:
/*================================
 * func: delay current thread in acoral
 *         	
 * timems	
 *================================*/
void acoral_delay_self(acoral_time time){
3000296c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002970:	e24dd00c 	sub	sp, sp, #12
30002974:	e58d0004 	str	r0, [sp, #4]
	acoral_delay_thread(acoral_cur_thread,time);
30002978:	e59f3018 	ldr	r3, [pc, #24]	; 30002998 <acoral_delay_self+0x2c>
3000297c:	e5933000 	ldr	r3, [r3]
30002980:	e1a00003 	mov	r0, r3
30002984:	e59d1004 	ldr	r1, [sp, #4]
30002988:	ebffffc6 	bl	300028a8 <acoral_delay_thread>
}
3000298c:	e28dd00c 	add	sp, sp, #12
30002990:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002994:	e12fff1e 	bx	lr
30002998:	30010630 	.word	0x30010630

3000299c <acoral_kill_thread>:
/*================================
 * func: kill thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/
void acoral_kill_thread(acoral_thread_t *thread){
3000299c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300029a0:	e24dd01c 	sub	sp, sp, #28
300029a4:	e58d0004 	str	r0, [sp, #4]
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_KILL,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
300029a8:	ebfffb51 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300029ac:	e1a03000 	mov	r3, r0
300029b0:	e58d300c 	str	r3, [sp, #12]
        /*	*/
        /*	*/
	if(thread->state&ACORAL_THREAD_STATE_SUSPEND){
300029b4:	e59d3004 	ldr	r3, [sp, #4]
300029b8:	e5d33004 	ldrb	r3, [r3, #4]
300029bc:	e2033002 	and	r3, r3, #2
300029c0:	e3530000 	cmp	r3, #0
300029c4:	0a000011 	beq	30002a10 <acoral_kill_thread+0x74>
		evt=thread->evt;
300029c8:	e59d3004 	ldr	r3, [sp, #4]
300029cc:	e5933030 	ldr	r3, [r3, #48]	; 0x30
300029d0:	e58d3014 	str	r3, [sp, #20]
		/**/
		if(thread->state&ACORAL_THREAD_STATE_DELAY){
300029d4:	e59d3004 	ldr	r3, [sp, #4]
300029d8:	e5d33004 	ldrb	r3, [r3, #4]
300029dc:	e2033020 	and	r3, r3, #32
300029e0:	e3530000 	cmp	r3, #0
300029e4:	0a000004 	beq	300029fc <acoral_kill_thread+0x60>
			acoral_spin_lock(&thread->waiting.prev->lock);
			acoral_spin_lock(&thread->waiting.lock);
			acoral_list_del(&thread->waiting);
300029e8:	e59d3004 	ldr	r3, [sp, #4]
300029ec:	e2833020 	add	r3, r3, #32
300029f0:	e1a00003 	mov	r0, r3
300029f4:	eb001e0b 	bl	3000a228 <acoral_list_del>
300029f8:	ea000004 	b	30002a10 <acoral_kill_thread+0x74>
			acoral_spin_unlock(&thread->waiting.lock);
			acoral_spin_unlock(&thread->waiting.prev->lock);
		}else
		{
			/**/
			if(evt!=NULL){
300029fc:	e59d3014 	ldr	r3, [sp, #20]
30002a00:	e3530000 	cmp	r3, #0
30002a04:	0a000001 	beq	30002a10 <acoral_kill_thread+0x74>
				acoral_spin_lock(&evt->spin_lock);
				acoral_evt_queue_del(thread);
30002a08:	e59d0004 	ldr	r0, [sp, #4]
30002a0c:	eb0008d7 	bl	30004d70 <acoral_evt_queue_del>
				acoral_spin_unlock(&evt->spin_lock);
			}
		}
	}
	acoral_unrdy_thread(thread);
30002a10:	e59d0004 	ldr	r0, [sp, #4]
30002a14:	eb000064 	bl	30002bac <acoral_unrdy_thread>
	acoral_release_thread1(thread);
30002a18:	e59d0004 	ldr	r0, [sp, #4]
30002a1c:	ebffff23 	bl	300026b0 <acoral_release_thread1>
      	HAL_EXIT_CRITICAL();
30002a20:	e59d000c 	ldr	r0, [sp, #12]
30002a24:	ebfffb30 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30002a28:	ebfffe78 	bl	30002410 <acoral_sched>
}
30002a2c:	e28dd01c 	add	sp, sp, #28
30002a30:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002a34:	e12fff1e 	bx	lr

30002a38 <acoral_kill_thread_by_id>:
/*================================
 * func: kill thread in acoral
 *         	
 * thread_idID 	
 *================================*/
void acoral_kill_thread_by_id(acoral_id id){
30002a38:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002a3c:	e24dd014 	sub	sp, sp, #20
30002a40:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread;
	thread=(acoral_thread_t *)acoral_get_res_by_id(id);
30002a44:	e59d0004 	ldr	r0, [sp, #4]
30002a48:	eb000388 	bl	30003870 <acoral_get_res_by_id>
30002a4c:	e1a03000 	mov	r3, r0
30002a50:	e58d300c 	str	r3, [sp, #12]
	acoral_kill_thread(thread);
30002a54:	e59d000c 	ldr	r0, [sp, #12]
30002a58:	ebffffcf 	bl	3000299c <acoral_kill_thread>
}
30002a5c:	e28dd014 	add	sp, sp, #20
30002a60:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002a64:	e12fff1e 	bx	lr

30002a68 <acoral_thread_exit>:

/*================================
 * func: kill current thread in acoral
 *         	
 *================================*/
void acoral_thread_exit(){
30002a68:	e92d4008 	push	{r3, lr}
        acoral_kill_thread(acoral_cur_thread);
30002a6c:	e59f3010 	ldr	r3, [pc, #16]	; 30002a84 <acoral_thread_exit+0x1c>
30002a70:	e5933000 	ldr	r3, [r3]
30002a74:	e1a00003 	mov	r0, r3
30002a78:	ebffffc7 	bl	3000299c <acoral_kill_thread>
}
30002a7c:	e8bd4008 	pop	{r3, lr}
30002a80:	e12fff1e 	bx	lr
30002a84:	30010630 	.word	0x30010630

30002a88 <acoral_thread_change_prio>:

/*===========================
 *    change thread's prio
 *    
 *===========================*/
void acoral_thread_change_prio(acoral_thread_t* thread, acoral_u32 prio){
30002a88:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002a8c:	e24dd014 	sub	sp, sp, #20
30002a90:	e58d0004 	str	r0, [sp, #4]
30002a94:	e58d1000 	str	r1, [sp]
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_CHG_PRIO,thread->res.id,(void *)prio);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002a98:	ebfffb15 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002a9c:	e1a03000 	mov	r3, r0
30002aa0:	e58d3008 	str	r3, [sp, #8]
	if(thread->state&ACORAL_THREAD_STATE_READY){
30002aa4:	e59d3004 	ldr	r3, [sp, #4]
30002aa8:	e5d33004 	ldrb	r3, [r3, #4]
30002aac:	e2033001 	and	r3, r3, #1
30002ab0:	e20330ff 	and	r3, r3, #255	; 0xff
30002ab4:	e3530000 	cmp	r3, #0
30002ab8:	0a000008 	beq	30002ae0 <acoral_thread_change_prio+0x58>
		acoral_rdyqueue_del(thread);
30002abc:	e59d0004 	ldr	r0, [sp, #4]
30002ac0:	ebfffe1f 	bl	30002344 <acoral_rdyqueue_del>
		thread->prio = prio;
30002ac4:	e59d3000 	ldr	r3, [sp]
30002ac8:	e20320ff 	and	r2, r3, #255	; 0xff
30002acc:	e59d3004 	ldr	r3, [sp, #4]
30002ad0:	e5c32005 	strb	r2, [r3, #5]
		acoral_rdyqueue_add(thread);
30002ad4:	e59d0004 	ldr	r0, [sp, #4]
30002ad8:	ebfffde4 	bl	30002270 <acoral_rdyqueue_add>
30002adc:	ea000003 	b	30002af0 <acoral_thread_change_prio+0x68>
	}else
		thread->prio = prio;
30002ae0:	e59d3000 	ldr	r3, [sp]
30002ae4:	e20320ff 	and	r2, r3, #255	; 0xff
30002ae8:	e59d3004 	ldr	r3, [sp, #4]
30002aec:	e5c32005 	strb	r2, [r3, #5]
	HAL_EXIT_CRITICAL();
30002af0:	e59d0008 	ldr	r0, [sp, #8]
30002af4:	ebfffafc 	bl	300016ec <HAL_INTR_RESTORE>
}
30002af8:	e28dd014 	add	sp, sp, #20
30002afc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002b00:	e12fff1e 	bx	lr

30002b04 <acoral_change_prio_self>:

/*===========================
 *    change current thread's prio
 *    
 *===========================*/
void acoral_change_prio_self(acoral_u32 prio){
30002b04:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002b08:	e24dd00c 	sub	sp, sp, #12
30002b0c:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_change_prio(acoral_cur_thread, prio);
30002b10:	e59f3018 	ldr	r3, [pc, #24]	; 30002b30 <acoral_change_prio_self+0x2c>
30002b14:	e5933000 	ldr	r3, [r3]
30002b18:	e1a00003 	mov	r0, r3
30002b1c:	e59d1004 	ldr	r1, [sp, #4]
30002b20:	ebffffd8 	bl	30002a88 <acoral_thread_change_prio>
}
30002b24:	e28dd00c 	add	sp, sp, #12
30002b28:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002b2c:	e12fff1e 	bx	lr
30002b30:	30010630 	.word	0x30010630

30002b34 <acoral_thread_change_prio_by_id>:

/*===========================
 *    change thread's prio
 *    ID
 *===========================*/
void acoral_thread_change_prio_by_id(acoral_u32 thread_id, acoral_u32 prio){
30002b34:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002b38:	e24dd014 	sub	sp, sp, #20
30002b3c:	e58d0004 	str	r0, [sp, #4]
30002b40:	e58d1000 	str	r1, [sp]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
30002b44:	e59d3004 	ldr	r3, [sp, #4]
30002b48:	e1a00003 	mov	r0, r3
30002b4c:	eb000347 	bl	30003870 <acoral_get_res_by_id>
30002b50:	e1a03000 	mov	r3, r0
30002b54:	e58d300c 	str	r3, [sp, #12]
	acoral_thread_change_prio(thread, prio);
30002b58:	e59d000c 	ldr	r0, [sp, #12]
30002b5c:	e59d1000 	ldr	r1, [sp]
30002b60:	ebffffc8 	bl	30002a88 <acoral_thread_change_prio>
}
30002b64:	e28dd014 	add	sp, sp, #20
30002b68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002b6c:	e12fff1e 	bx	lr

30002b70 <acoral_rdy_thread>:
 * func: ready thread in acoral
 *  ,
 * thread(TCB) 	
 *================================*/

void acoral_rdy_thread(acoral_thread_t *thread){
30002b70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002b74:	e24dd014 	sub	sp, sp, #20
30002b78:	e58d0004 	str	r0, [sp, #4]
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_SUSPEND&thread->state))
30002b7c:	e59d3004 	ldr	r3, [sp, #4]
30002b80:	e5d33004 	ldrb	r3, [r3, #4]
30002b84:	e2033002 	and	r3, r3, #2
30002b88:	e3530000 	cmp	r3, #0
30002b8c:	0a000002 	beq	30002b9c <acoral_rdy_thread+0x2c>
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_RESUME,thread->res.id,NULL);
		return;
	}
#endif
	/**/
	acoral_rdyqueue_add(thread);
30002b90:	e59d0004 	ldr	r0, [sp, #4]
30002b94:	ebfffdb5 	bl	30002270 <acoral_rdyqueue_add>
30002b98:	ea000000 	b	30002ba0 <acoral_rdy_thread+0x30>
 *================================*/

void acoral_rdy_thread(acoral_thread_t *thread){
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_SUSPEND&thread->state))
		return;
30002b9c:	e1a00000 	nop			; (mov r0, r0)
		return;
	}
#endif
	/**/
	acoral_rdyqueue_add(thread);
}
30002ba0:	e28dd014 	add	sp, sp, #20
30002ba4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002ba8:	e12fff1e 	bx	lr

30002bac <acoral_unrdy_thread>:
 *     ,
 * thread(TCB) 	
 *
 *================================*/

void acoral_unrdy_thread(acoral_thread_t *thread){
30002bac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002bb0:	e24dd014 	sub	sp, sp, #20
30002bb4:	e58d0004 	str	r0, [sp, #4]
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
30002bb8:	e59d3004 	ldr	r3, [sp, #4]
30002bbc:	e5d33004 	ldrb	r3, [r3, #4]
30002bc0:	e2033001 	and	r3, r3, #1
30002bc4:	e3530000 	cmp	r3, #0
30002bc8:	0a000002 	beq	30002bd8 <acoral_unrdy_thread+0x2c>
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_SUSPEND,thread->res.id,NULL);
		return;
	}
#endif
	/**/
	acoral_rdyqueue_del(thread);
30002bcc:	e59d0004 	ldr	r0, [sp, #4]
30002bd0:	ebfffddb 	bl	30002344 <acoral_rdyqueue_del>
30002bd4:	ea000000 	b	30002bdc <acoral_unrdy_thread+0x30>
 *================================*/

void acoral_unrdy_thread(acoral_thread_t *thread){
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
		return;
30002bd8:	e1a00000 	nop			; (mov r0, r0)
		return;
	}
#endif
	/**/
	acoral_rdyqueue_del(thread);
}
30002bdc:	e28dd014 	add	sp, sp, #20
30002be0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002be4:	e12fff1e 	bx	lr

30002be8 <acoral_thread_move2_tail>:

void acoral_thread_move2_tail(acoral_thread_t *thread){
30002be8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002bec:	e24dd014 	sub	sp, sp, #20
30002bf0:	e58d0004 	str	r0, [sp, #4]
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_MOVE2_TAIL,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002bf4:	ebfffabe 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002bf8:	e1a03000 	mov	r3, r0
30002bfc:	e58d300c 	str	r3, [sp, #12]
	acoral_unrdy_thread(thread);
30002c00:	e59d0004 	ldr	r0, [sp, #4]
30002c04:	ebffffe8 	bl	30002bac <acoral_unrdy_thread>
	acoral_rdy_thread(thread);
30002c08:	e59d0004 	ldr	r0, [sp, #4]
30002c0c:	ebffffd7 	bl	30002b70 <acoral_rdy_thread>
	HAL_EXIT_CRITICAL();
30002c10:	e59d000c 	ldr	r0, [sp, #12]
30002c14:	ebfffab4 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30002c18:	ebfffdfc 	bl	30002410 <acoral_sched>
}
30002c1c:	e28dd014 	add	sp, sp, #20
30002c20:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002c24:	e12fff1e 	bx	lr

30002c28 <acoral_thread_move2_tail_by_id>:

void acoral_thread_move2_tail_by_id(acoral_id thread_id){
30002c28:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002c2c:	e24dd014 	sub	sp, sp, #20
30002c30:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
30002c34:	e59d0004 	ldr	r0, [sp, #4]
30002c38:	eb00030c 	bl	30003870 <acoral_get_res_by_id>
30002c3c:	e1a03000 	mov	r3, r0
30002c40:	e58d300c 	str	r3, [sp, #12]
	acoral_thread_move2_tail(thread);
30002c44:	e59d000c 	ldr	r0, [sp, #12]
30002c48:	ebffffe6 	bl	30002be8 <acoral_thread_move2_tail>
}
30002c4c:	e28dd014 	add	sp, sp, #20
30002c50:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002c54:	e12fff1e 	bx	lr

30002c58 <acoral_alloc_thread>:

/*================================
 * func: alloc thread struct data in acoral
 *     TCB
 *================================*/
acoral_thread_t *acoral_alloc_thread(){
30002c58:	e92d4008 	push	{r3, lr}
  	return (acoral_thread_t *)acoral_get_res(&acoral_thread_pool_ctrl);
30002c5c:	e59f0010 	ldr	r0, [pc, #16]	; 30002c74 <acoral_alloc_thread+0x1c>
30002c60:	eb000223 	bl	300034f4 <acoral_get_res>
30002c64:	e1a03000 	mov	r3, r0
}
30002c68:	e1a00003 	mov	r0, r3
30002c6c:	e8bd4008 	pop	{r3, lr}
30002c70:	e12fff1e 	bx	lr
30002c74:	3000fbec 	.word	0x3000fbec

30002c78 <acoral_thread_init>:
 * in:   (*exit)   (acoral_thread_exit)
 *       stack_size 
 *       args       
 *       name       
 *================================*/
acoral_err acoral_thread_init(acoral_thread_t *thread,void (*route)(void *args),void (*exit)(void),void *args){
30002c78:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002c7c:	e24dd01c 	sub	sp, sp, #28
30002c80:	e58d000c 	str	r0, [sp, #12]
30002c84:	e58d1008 	str	r1, [sp, #8]
30002c88:	e58d2004 	str	r2, [sp, #4]
30002c8c:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 stack_size=thread->stack_size;
30002c90:	e59d300c 	ldr	r3, [sp, #12]
30002c94:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
30002c98:	e58d3014 	str	r3, [sp, #20]
	if(thread->stack_buttom==NULL){
30002c9c:	e59d300c 	ldr	r3, [sp, #12]
30002ca0:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30002ca4:	e3530000 	cmp	r3, #0
30002ca8:	1a000015 	bne	30002d04 <acoral_thread_init+0x8c>
		if(stack_size<ACORAL_MIN_STACK_SIZE)
30002cac:	e59d2014 	ldr	r2, [sp, #20]
30002cb0:	e3a03fff 	mov	r3, #1020	; 0x3fc
30002cb4:	e2833003 	add	r3, r3, #3
30002cb8:	e1520003 	cmp	r2, r3
30002cbc:	8a000001 	bhi	30002cc8 <acoral_thread_init+0x50>
			stack_size=ACORAL_MIN_STACK_SIZE;
30002cc0:	e3a03b01 	mov	r3, #1024	; 0x400
30002cc4:	e58d3014 	str	r3, [sp, #20]
		thread->stack_buttom=(acoral_u32 *)acoral_malloc(stack_size);
30002cc8:	e59d0014 	ldr	r0, [sp, #20]
30002ccc:	eb000e38 	bl	300065b4 <buddy_malloc>
30002cd0:	e1a03000 	mov	r3, r0
30002cd4:	e1a02003 	mov	r2, r3
30002cd8:	e59d300c 	ldr	r3, [sp, #12]
30002cdc:	e5832038 	str	r2, [r3, #56]	; 0x38
		if(thread->stack_buttom==NULL)
30002ce0:	e59d300c 	ldr	r3, [sp, #12]
30002ce4:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30002ce8:	e3530000 	cmp	r3, #0
30002cec:	1a000001 	bne	30002cf8 <acoral_thread_init+0x80>
			return ACORAL_ERR_THREAD_NO_STACK;
30002cf0:	e3a03016 	mov	r3, #22
30002cf4:	ea000064 	b	30002e8c <acoral_thread_init+0x214>
		thread->stack_size=stack_size;
30002cf8:	e59d300c 	ldr	r3, [sp, #12]
30002cfc:	e59d2014 	ldr	r2, [sp, #20]
30002d00:	e583203c 	str	r2, [r3, #60]	; 0x3c
	}
	thread->stack=(acoral_u32 *)((acoral_8 *)thread->stack_buttom+stack_size-4);
30002d04:	e59d300c 	ldr	r3, [sp, #12]
30002d08:	e5932038 	ldr	r2, [r3, #56]	; 0x38
30002d0c:	e59d3014 	ldr	r3, [sp, #20]
30002d10:	e2433004 	sub	r3, r3, #4
30002d14:	e0822003 	add	r2, r2, r3
30002d18:	e59d300c 	ldr	r3, [sp, #12]
30002d1c:	e5832034 	str	r2, [r3, #52]	; 0x34
	HAL_STACK_INIT(&thread->stack,route,exit,args);
30002d20:	e59d300c 	ldr	r3, [sp, #12]
30002d24:	e2833034 	add	r3, r3, #52	; 0x34
30002d28:	e1a00003 	mov	r0, r3
30002d2c:	e59d1008 	ldr	r1, [sp, #8]
30002d30:	e59d2004 	ldr	r2, [sp, #4]
30002d34:	e59d3000 	ldr	r3, [sp]
30002d38:	ebfff560 	bl	300002c0 <hal_stack_init>
	/*cpu_mask*/
	if(thread->cpu_mask==-1)
30002d3c:	e59d300c 	ldr	r3, [sp, #12]
30002d40:	e5933008 	ldr	r3, [r3, #8]
30002d44:	e3730001 	cmn	r3, #1
30002d48:	1a000002 	bne	30002d58 <acoral_thread_init+0xe0>
		thread->cpu_mask=0xefffffff;
30002d4c:	e59d300c 	ldr	r3, [sp, #12]
30002d50:	e3e02201 	mvn	r2, #268435456	; 0x10000000
30002d54:	e5832008 	str	r2, [r3, #8]
	if(thread->cpu<0)
30002d58:	e59d300c 	ldr	r3, [sp, #12]
30002d5c:	e5d33006 	ldrb	r3, [r3, #6]
30002d60:	e1a03c03 	lsl	r3, r3, #24
30002d64:	e1a03c43 	asr	r3, r3, #24
30002d68:	e3530000 	cmp	r3, #0
30002d6c:	aa000007 	bge	30002d90 <acoral_thread_init+0x118>
	      thread->cpu=acoral_get_idle_maskcpu(thread->cpu_mask);
30002d70:	e59d300c 	ldr	r3, [sp, #12]
30002d74:	e5933008 	ldr	r3, [r3, #8]
30002d78:	e1a00003 	mov	r0, r3
30002d7c:	ebfffd0a 	bl	300021ac <acoral_get_idle_maskcpu>
30002d80:	e1a03000 	mov	r3, r0
30002d84:	e20320ff 	and	r2, r3, #255	; 0xff
30002d88:	e59d300c 	ldr	r3, [sp, #12]
30002d8c:	e5c32006 	strb	r2, [r3, #6]
	if(thread->cpu>=HAL_MAX_CPU)
30002d90:	e59d300c 	ldr	r3, [sp, #12]
30002d94:	e5d33006 	ldrb	r3, [r3, #6]
30002d98:	e1a03c03 	lsl	r3, r3, #24
30002d9c:	e1a03c43 	asr	r3, r3, #24
30002da0:	e3530000 	cmp	r3, #0
30002da4:	da000002 	ble	30002db4 <acoral_thread_init+0x13c>
		thread->cpu=HAL_MAX_CPU-1;
30002da8:	e59d300c 	ldr	r3, [sp, #12]
30002dac:	e3a02000 	mov	r2, #0
30002db0:	e5c32006 	strb	r2, [r3, #6]
	thread->data=NULL;
30002db4:	e59d300c 	ldr	r3, [sp, #12]
30002db8:	e3a02000 	mov	r2, #0
30002dbc:	e5832054 	str	r2, [r3, #84]	; 0x54
	thread->state=ACORAL_THREAD_STATE_SUSPEND;
30002dc0:	e59d300c 	ldr	r3, [sp, #12]
30002dc4:	e3a02002 	mov	r2, #2
30002dc8:	e5c32004 	strb	r2, [r3, #4]
	/*继承父线程的console_id*/
	thread->console_id=acoral_cur_thread->console_id;
30002dcc:	e59f30c8 	ldr	r3, [pc, #200]	; 30002e9c <acoral_thread_init+0x224>
30002dd0:	e5933000 	ldr	r3, [r3]
30002dd4:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
30002dd8:	e59d300c 	ldr	r3, [sp, #12]
30002ddc:	e583204c 	str	r2, [r3, #76]	; 0x4c
	acoral_init_list(&thread->waiting);
30002de0:	e59d300c 	ldr	r3, [sp, #12]
30002de4:	e2832020 	add	r2, r3, #32
30002de8:	e59d300c 	ldr	r3, [sp, #12]
30002dec:	e5832020 	str	r2, [r3, #32]
30002df0:	e59d300c 	ldr	r3, [sp, #12]
30002df4:	e2832020 	add	r2, r3, #32
30002df8:	e59d300c 	ldr	r3, [sp, #12]
30002dfc:	e5832024 	str	r2, [r3, #36]	; 0x24
	acoral_init_list(&thread->ready);
30002e00:	e59d300c 	ldr	r3, [sp, #12]
30002e04:	e2832010 	add	r2, r3, #16
30002e08:	e59d300c 	ldr	r3, [sp, #12]
30002e0c:	e5832010 	str	r2, [r3, #16]
30002e10:	e59d300c 	ldr	r3, [sp, #12]
30002e14:	e2832010 	add	r2, r3, #16
30002e18:	e59d300c 	ldr	r3, [sp, #12]
30002e1c:	e5832014 	str	r2, [r3, #20]
	acoral_init_list(&thread->timeout);
30002e20:	e59d300c 	ldr	r3, [sp, #12]
30002e24:	e2832018 	add	r2, r3, #24
30002e28:	e59d300c 	ldr	r3, [sp, #12]
30002e2c:	e5832018 	str	r2, [r3, #24]
30002e30:	e59d300c 	ldr	r3, [sp, #12]
30002e34:	e2832018 	add	r2, r3, #24
30002e38:	e59d300c 	ldr	r3, [sp, #12]
30002e3c:	e583201c 	str	r2, [r3, #28]
	acoral_init_list(&thread->global_list);
30002e40:	e59d300c 	ldr	r3, [sp, #12]
30002e44:	e2832028 	add	r2, r3, #40	; 0x28
30002e48:	e59d300c 	ldr	r3, [sp, #12]
30002e4c:	e5832028 	str	r2, [r3, #40]	; 0x28
30002e50:	e59d300c 	ldr	r3, [sp, #12]
30002e54:	e2832028 	add	r2, r3, #40	; 0x28
30002e58:	e59d300c 	ldr	r3, [sp, #12]
30002e5c:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_spin_init(&thread->timeout.lock);
	acoral_spin_init(&thread->waiting.lock);
	acoral_spin_init(&thread->ready.lock);
	acoral_spin_init(&thread->move_lock);
	HAL_ENTER_CRITICAL();
30002e60:	ebfffa23 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002e64:	e1a03000 	mov	r3, r0
30002e68:	e58d3010 	str	r3, [sp, #16]
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	acoral_list_add2_tail(&thread->global_list,&acoral_threads_queue.head);
30002e6c:	e59d300c 	ldr	r3, [sp, #12]
30002e70:	e2833028 	add	r3, r3, #40	; 0x28
30002e74:	e1a00003 	mov	r0, r3
30002e78:	e59f1020 	ldr	r1, [pc, #32]	; 30002ea0 <acoral_thread_init+0x228>
30002e7c:	eb001cd6 	bl	3000a1dc <acoral_list_add2_tail>
	acoral_spin_unlock(&acoral_threads_queue.head.lock);
	HAL_EXIT_CRITICAL();
30002e80:	e59d0010 	ldr	r0, [sp, #16]
30002e84:	ebfffa18 	bl	300016ec <HAL_INTR_RESTORE>
#ifdef CFG_TEST
	acoral_print("%s thread initial well\n",thread->name);
#endif
	return 0;
30002e88:	e3a03000 	mov	r3, #0
}
30002e8c:	e1a00003 	mov	r0, r3
30002e90:	e28dd01c 	add	sp, sp, #28
30002e94:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002e98:	e12fff1e 	bx	lr
30002e9c:	30010630 	.word	0x30010630
30002ea0:	3000fc5c 	.word	0x3000fc5c

30002ea4 <acoral_thread_pool_init>:

/*================================
 *      init tcb pool
 *      
 *================================*/
void acoral_thread_pool_init(){
30002ea4:	e92d4008 	push	{r3, lr}
	thread_api.release_res=acoral_release_thread;
30002ea8:	e59f3068 	ldr	r3, [pc, #104]	; 30002f18 <acoral_thread_pool_init+0x74>
30002eac:	e59f2068 	ldr	r2, [pc, #104]	; 30002f1c <acoral_thread_pool_init+0x78>
30002eb0:	e5832000 	str	r2, [r3]
	acoral_thread_pool_ctrl.type=ACORAL_RES_THREAD;
30002eb4:	e59f3064 	ldr	r3, [pc, #100]	; 30002f20 <acoral_thread_pool_init+0x7c>
30002eb8:	e3a02001 	mov	r2, #1
30002ebc:	e5832000 	str	r2, [r3]
	acoral_thread_pool_ctrl.size=sizeof(acoral_thread_t);
30002ec0:	e59f3058 	ldr	r3, [pc, #88]	; 30002f20 <acoral_thread_pool_init+0x7c>
30002ec4:	e3a02058 	mov	r2, #88	; 0x58
30002ec8:	e5832004 	str	r2, [r3, #4]
	if(CFG_MAX_THREAD>20)
		acoral_thread_pool_ctrl.num_per_pool=20;
30002ecc:	e59f304c 	ldr	r3, [pc, #76]	; 30002f20 <acoral_thread_pool_init+0x7c>
30002ed0:	e3a02014 	mov	r2, #20
30002ed4:	e5832008 	str	r2, [r3, #8]
	else
		acoral_thread_pool_ctrl.num_per_pool=CFG_MAX_THREAD;
	acoral_thread_pool_ctrl.max_pools=ACORAL_MAX_THREAD/acoral_thread_pool_ctrl.num_per_pool;
30002ed8:	e59f3040 	ldr	r3, [pc, #64]	; 30002f20 <acoral_thread_pool_init+0x7c>
30002edc:	e5933008 	ldr	r3, [r3, #8]
30002ee0:	e3a00028 	mov	r0, #40	; 0x28
30002ee4:	e1a01003 	mov	r1, r3
30002ee8:	eb002b4c 	bl	3000dc20 <__aeabi_uidiv>
30002eec:	e1a03000 	mov	r3, r0
30002ef0:	e1a02003 	mov	r2, r3
30002ef4:	e59f3024 	ldr	r3, [pc, #36]	; 30002f20 <acoral_thread_pool_init+0x7c>
30002ef8:	e5832010 	str	r2, [r3, #16]
	acoral_thread_pool_ctrl.api=&thread_api;
30002efc:	e59f301c 	ldr	r3, [pc, #28]	; 30002f20 <acoral_thread_pool_init+0x7c>
30002f00:	e59f2010 	ldr	r2, [pc, #16]	; 30002f18 <acoral_thread_pool_init+0x74>
30002f04:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_pool_ctrl_init(&acoral_thread_pool_ctrl);
30002f08:	e59f0010 	ldr	r0, [pc, #16]	; 30002f20 <acoral_thread_pool_init+0x7c>
30002f0c:	eb0002d7 	bl	30003a70 <acoral_pool_ctrl_init>
}
30002f10:	e8bd4008 	pop	{r3, lr}
30002f14:	e12fff1e 	bx	lr
30002f18:	3000fbb4 	.word	0x3000fbb4
30002f1c:	30002724 	.word	0x30002724
30002f20:	3000fbec 	.word	0x3000fbec

30002f24 <acoral_set_thread_console>:

void acoral_set_thread_console(acoral_id id){
30002f24:	e24dd008 	sub	sp, sp, #8
30002f28:	e58d0004 	str	r0, [sp, #4]
	acoral_cur_thread->console_id=id;	
30002f2c:	e59f3010 	ldr	r3, [pc, #16]	; 30002f44 <acoral_set_thread_console+0x20>
30002f30:	e5933000 	ldr	r3, [r3]
30002f34:	e59d2004 	ldr	r2, [sp, #4]
30002f38:	e583204c 	str	r2, [r3, #76]	; 0x4c
}
30002f3c:	e28dd008 	add	sp, sp, #8
30002f40:	e12fff1e 	bx	lr
30002f44:	30010630 	.word	0x30010630

30002f48 <acoral_sched_mechanism_init>:

void acoral_sched_mechanism_init(){
30002f48:	e92d4008 	push	{r3, lr}
	acoral_thread_pool_init();
30002f4c:	ebffffd4 	bl	30002ea4 <acoral_thread_pool_init>
	acoral_thread_runqueue_init();
30002f50:	ebfffc51 	bl	3000209c <acoral_thread_runqueue_init>
	acoral_init_list(&acoral_threads_queue.head);
30002f54:	e59f3018 	ldr	r3, [pc, #24]	; 30002f74 <acoral_sched_mechanism_init+0x2c>
30002f58:	e59f2014 	ldr	r2, [pc, #20]	; 30002f74 <acoral_sched_mechanism_init+0x2c>
30002f5c:	e5832000 	str	r2, [r3]
30002f60:	e59f300c 	ldr	r3, [pc, #12]	; 30002f74 <acoral_sched_mechanism_init+0x2c>
30002f64:	e59f2008 	ldr	r2, [pc, #8]	; 30002f74 <acoral_sched_mechanism_init+0x2c>
30002f68:	e5832004 	str	r2, [r3, #4]
	acoral_spin_init(&acoral_threads_queue.head.lock);
}
30002f6c:	e8bd4008 	pop	{r3, lr}
30002f70:	e12fff1e 	bx	lr
30002f74:	3000fc5c 	.word	0x3000fc5c

30002f78 <acoral_thread_sys_init>:

/*================================
 *      init thread system 
 *       
 *================================*/
void acoral_thread_sys_init(){
30002f78:	e92d4008 	push	{r3, lr}
	acoral_sched_mechanism_init();
30002f7c:	ebfffff1 	bl	30002f48 <acoral_sched_mechanism_init>
	acoral_sched_policy_init();
30002f80:	ebfffbf5 	bl	30001f5c <acoral_sched_policy_init>
}
30002f84:	e8bd4008 	pop	{r3, lr}
30002f88:	e12fff1e 	bx	lr

30002f8c <create_comm_thread>:
 *       args       传进线程的参数
 *       name       创建线程的名字
 *       prio       创建线程的优先级
 *       cpu        绑定进程到指定cpu运行,-1为由系统指定
 *================================*/
acoral_id create_comm_thread(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,acoral_u8 prio,acoral_8 cpu){
30002f8c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002f90:	e24dd01c 	sub	sp, sp, #28
30002f94:	e58d000c 	str	r0, [sp, #12]
30002f98:	e58d1008 	str	r1, [sp, #8]
30002f9c:	e58d2004 	str	r2, [sp, #4]
30002fa0:	e58d3000 	str	r3, [sp]
	acoral_comm_policy_data_t policy_ctrl;
	acoral_thread_t *thread;
        /*分配tcb数据块*/
	thread=acoral_alloc_thread();
30002fa4:	ebffff2b 	bl	30002c58 <acoral_alloc_thread>
30002fa8:	e1a03000 	mov	r3, r0
30002fac:	e58d3014 	str	r3, [sp, #20]
	if(NULL==thread){
30002fb0:	e59d3014 	ldr	r3, [sp, #20]
30002fb4:	e3530000 	cmp	r3, #0
30002fb8:	1a000004 	bne	30002fd0 <create_comm_thread+0x44>
		acoral_printerr("Alloc thread:%s fail\n",name);
30002fbc:	e59f0094 	ldr	r0, [pc, #148]	; 30003058 <create_comm_thread+0xcc>
30002fc0:	e59d1000 	ldr	r1, [sp]
30002fc4:	eb002116 	bl	3000b424 <acoral_print>
		acoral_printk("No Mem Space or Beyond the max thread\n");
		return -1;
30002fc8:	e3e03000 	mvn	r3, #0
30002fcc:	ea00001d 	b	30003048 <create_comm_thread+0xbc>
	}
	thread->name=name;
30002fd0:	e59d3014 	ldr	r3, [sp, #20]
30002fd4:	e59d2000 	ldr	r2, [sp]
30002fd8:	e5832048 	str	r2, [r3, #72]	; 0x48
	stack_size=stack_size&(~3);
30002fdc:	e59d3008 	ldr	r3, [sp, #8]
30002fe0:	e3c33003 	bic	r3, r3, #3
30002fe4:	e58d3008 	str	r3, [sp, #8]
	thread->stack_size=stack_size;
30002fe8:	e59d3014 	ldr	r3, [sp, #20]
30002fec:	e59d2008 	ldr	r2, [sp, #8]
30002ff0:	e583203c 	str	r2, [r3, #60]	; 0x3c
	thread->stack_buttom=NULL;
30002ff4:	e59d3014 	ldr	r3, [sp, #20]
30002ff8:	e3a02000 	mov	r2, #0
30002ffc:	e5832038 	str	r2, [r3, #56]	; 0x38
        /*设置线程要运行的cpu核心*/
	policy_ctrl.cpu=cpu;
30003000:	e5dd3024 	ldrb	r3, [sp, #36]	; 0x24
30003004:	e5cd3010 	strb	r3, [sp, #16]
        /*设置线程的优先级*/
	policy_ctrl.prio=prio;
30003008:	e5dd3020 	ldrb	r3, [sp, #32]
3000300c:	e5cd3011 	strb	r3, [sp, #17]
	policy_ctrl.prio_type=ACORAL_BASE_PRIO;
30003010:	e3a03002 	mov	r3, #2
30003014:	e5cd3012 	strb	r3, [sp, #18]
	thread->policy=ACORAL_SCHED_POLICY_COMM;
30003018:	e59d3014 	ldr	r3, [sp, #20]
3000301c:	e3a02015 	mov	r2, #21
30003020:	e5c3200c 	strb	r2, [r3, #12]
	thread->cpu_mask=-1;
30003024:	e59d3014 	ldr	r3, [sp, #20]
30003028:	e3e02000 	mvn	r2, #0
3000302c:	e5832008 	str	r2, [r3, #8]
	return comm_policy_thread_init(thread,route,args,&policy_ctrl);
30003030:	e28d3010 	add	r3, sp, #16
30003034:	e59d0014 	ldr	r0, [sp, #20]
30003038:	e59d100c 	ldr	r1, [sp, #12]
3000303c:	e59d2004 	ldr	r2, [sp, #4]
30003040:	eb000005 	bl	3000305c <comm_policy_thread_init>
30003044:	e1a03000 	mov	r3, r0
}
30003048:	e1a00003 	mov	r0, r3
3000304c:	e28dd01c 	add	sp, sp, #28
30003050:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003054:	e12fff1e 	bx	lr
30003058:	3000e488 	.word	0x3000e488

3000305c <comm_policy_thread_init>:

acoral_id comm_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
3000305c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003060:	e24dd024 	sub	sp, sp, #36	; 0x24
30003064:	e58d000c 	str	r0, [sp, #12]
30003068:	e58d1008 	str	r1, [sp, #8]
3000306c:	e58d2004 	str	r2, [sp, #4]
30003070:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 prio;
	acoral_comm_policy_data_t *policy_data;
	policy_data=(acoral_comm_policy_data_t *)data;
30003074:	e59d3000 	ldr	r3, [sp]
30003078:	e58d301c 	str	r3, [sp, #28]
	thread->cpu=policy_data->cpu;
3000307c:	e59d301c 	ldr	r3, [sp, #28]
30003080:	e5d32000 	ldrb	r2, [r3]
30003084:	e59d300c 	ldr	r3, [sp, #12]
30003088:	e5c32006 	strb	r2, [r3, #6]
	prio=policy_data->prio;
3000308c:	e59d301c 	ldr	r3, [sp, #28]
30003090:	e5d33001 	ldrb	r3, [r3, #1]
30003094:	e58d3018 	str	r3, [sp, #24]
	if(policy_data->prio_type==ACORAL_BASE_PRIO){
30003098:	e59d301c 	ldr	r3, [sp, #28]
3000309c:	e5d33002 	ldrb	r3, [r3, #2]
300030a0:	e3530002 	cmp	r3, #2
300030a4:	1a000007 	bne	300030c8 <comm_policy_thread_init+0x6c>
		prio+=ACORAL_BASE_PRIO_MIN;
300030a8:	e59d3018 	ldr	r3, [sp, #24]
300030ac:	e2833002 	add	r3, r3, #2
300030b0:	e58d3018 	str	r3, [sp, #24]
		if(prio>=ACORAL_BASE_PRIO_MAX)
300030b4:	e59d3018 	ldr	r3, [sp, #24]
300030b8:	e3530026 	cmp	r3, #38	; 0x26
300030bc:	9a000001 	bls	300030c8 <comm_policy_thread_init+0x6c>
			prio=ACORAL_BASE_PRIO_MAX-1;
300030c0:	e3a03026 	mov	r3, #38	; 0x26
300030c4:	e58d3018 	str	r3, [sp, #24]
	}
	thread->prio=prio;
300030c8:	e59d3018 	ldr	r3, [sp, #24]
300030cc:	e20320ff 	and	r2, r3, #255	; 0xff
300030d0:	e59d300c 	ldr	r3, [sp, #12]
300030d4:	e5c32005 	strb	r2, [r3, #5]
	if(acoral_thread_init(thread,route,acoral_thread_exit,args)!=0){
300030d8:	e59d000c 	ldr	r0, [sp, #12]
300030dc:	e59d1008 	ldr	r1, [sp, #8]
300030e0:	e59f206c 	ldr	r2, [pc, #108]	; 30003154 <comm_policy_thread_init+0xf8>
300030e4:	e59d3004 	ldr	r3, [sp, #4]
300030e8:	ebfffee2 	bl	30002c78 <acoral_thread_init>
300030ec:	e1a03000 	mov	r3, r0
300030f0:	e3530000 	cmp	r3, #0
300030f4:	0a00000e 	beq	30003134 <comm_policy_thread_init+0xd8>
		acoral_printerr("No thread stack:%s\n",thread->name);
300030f8:	e59d300c 	ldr	r3, [sp, #12]
300030fc:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30003100:	e59f0050 	ldr	r0, [pc, #80]	; 30003158 <comm_policy_thread_init+0xfc>
30003104:	e1a01003 	mov	r1, r3
30003108:	eb0020c5 	bl	3000b424 <acoral_print>
		HAL_ENTER_CRITICAL();
3000310c:	ebfff978 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30003110:	e1a03000 	mov	r3, r0
30003114:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
30003118:	e59d300c 	ldr	r3, [sp, #12]
3000311c:	e1a00003 	mov	r0, r3
30003120:	eb00013e 	bl	30003620 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30003124:	e59d0014 	ldr	r0, [sp, #20]
30003128:	ebfff96f 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
3000312c:	e3e03000 	mvn	r3, #0
30003130:	ea000003 	b	30003144 <comm_policy_thread_init+0xe8>
	}
        /*将线程就绪，并重新调度*/
	acoral_resume_thread(thread);
30003134:	e59d000c 	ldr	r0, [sp, #12]
30003138:	ebfffdc5 	bl	30002854 <acoral_resume_thread>
	return thread->res.id;
3000313c:	e59d300c 	ldr	r3, [sp, #12]
30003140:	e5933000 	ldr	r3, [r3]
}
30003144:	e1a00003 	mov	r0, r3
30003148:	e28dd024 	add	sp, sp, #36	; 0x24
3000314c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003150:	e12fff1e 	bx	lr
30003154:	30002a68 	.word	0x30002a68
30003158:	3000e4a0 	.word	0x3000e4a0

3000315c <comm_policy_init>:

void comm_policy_init(){
3000315c:	e92d4008 	push	{r3, lr}
	comm_policy.type=ACORAL_SCHED_POLICY_COMM;	
30003160:	e59f3044 	ldr	r3, [pc, #68]	; 300031ac <comm_policy_init+0x50>
30003164:	e3a02015 	mov	r2, #21
30003168:	e5c32008 	strb	r2, [r3, #8]
	comm_policy.policy_thread_init=comm_policy_thread_init;	
3000316c:	e59f3038 	ldr	r3, [pc, #56]	; 300031ac <comm_policy_init+0x50>
30003170:	e59f2038 	ldr	r2, [pc, #56]	; 300031b0 <comm_policy_init+0x54>
30003174:	e583200c 	str	r2, [r3, #12]
	comm_policy.policy_thread_release=NULL;	
30003178:	e59f302c 	ldr	r3, [pc, #44]	; 300031ac <comm_policy_init+0x50>
3000317c:	e3a02000 	mov	r2, #0
30003180:	e5832010 	str	r2, [r3, #16]
	comm_policy.delay_deal=NULL;	
30003184:	e59f3020 	ldr	r3, [pc, #32]	; 300031ac <comm_policy_init+0x50>
30003188:	e3a02000 	mov	r2, #0
3000318c:	e5832014 	str	r2, [r3, #20]
	comm_policy.name="comm";	
30003190:	e59f3014 	ldr	r3, [pc, #20]	; 300031ac <comm_policy_init+0x50>
30003194:	e59f2018 	ldr	r2, [pc, #24]	; 300031b4 <comm_policy_init+0x58>
30003198:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&comm_policy);
3000319c:	e59f0008 	ldr	r0, [pc, #8]	; 300031ac <comm_policy_init+0x50>
300031a0:	ebfffb2e 	bl	30001e60 <acoral_register_sched_policy>
}
300031a4:	e8bd4008 	pop	{r3, lr}
300031a8:	e12fff1e 	bx	lr
300031ac:	3000f5e0 	.word	0x3000f5e0
300031b0:	3000305c 	.word	0x3000305c
300031b4:	3000e4b4 	.word	0x3000e4b4

300031b8 <acoral_create_pool>:
/*================================
 *    create a kind of resource pool
 *       创建某一资源内存池
 *       pool_ctrl---资源内存池管理块
 *================================*/
acoral_err acoral_create_pool(acoral_pool_ctrl_t *pool_ctrl){
300031b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300031bc:	e24dd014 	sub	sp, sp, #20
300031c0:	e58d0004 	str	r0, [sp, #4]
  	acoral_pool_t *pool;
	if(pool_ctrl->num>=pool_ctrl->max_pools)
300031c4:	e59d3004 	ldr	r3, [sp, #4]
300031c8:	e593200c 	ldr	r2, [r3, #12]
300031cc:	e59d3004 	ldr	r3, [sp, #4]
300031d0:	e5933010 	ldr	r3, [r3, #16]
300031d4:	e1520003 	cmp	r2, r3
300031d8:	3a000001 	bcc	300031e4 <acoral_create_pool+0x2c>
	    return ACORAL_RES_MAX_POOL;
300031dc:	e3a030f3 	mov	r3, #243	; 0xf3
300031e0:	ea000049 	b	3000330c <acoral_create_pool+0x154>
  	pool=acoral_get_free_pool();
300031e4:	eb000188 	bl	3000380c <acoral_get_free_pool>
300031e8:	e1a03000 	mov	r3, r0
300031ec:	e58d300c 	str	r3, [sp, #12]
	if(pool==NULL)
300031f0:	e59d300c 	ldr	r3, [sp, #12]
300031f4:	e3530000 	cmp	r3, #0
300031f8:	1a000001 	bne	30003204 <acoral_create_pool+0x4c>
		return ACORAL_RES_NO_POOL;
300031fc:	e3a030f1 	mov	r3, #241	; 0xf1
30003200:	ea000041 	b	3000330c <acoral_create_pool+0x154>
	pool->id=pool_ctrl->type<<ACORAL_RES_TYPE_BIT|pool->id;
30003204:	e59d3004 	ldr	r3, [sp, #4]
30003208:	e5933000 	ldr	r3, [r3]
3000320c:	e1a02503 	lsl	r2, r3, #10
30003210:	e59d300c 	ldr	r3, [sp, #12]
30003214:	e5933008 	ldr	r3, [r3, #8]
30003218:	e1823003 	orr	r3, r2, r3
3000321c:	e1a02003 	mov	r2, r3
30003220:	e59d300c 	ldr	r3, [sp, #12]
30003224:	e5832008 	str	r2, [r3, #8]
	pool->size=pool_ctrl->size;
30003228:	e59d3004 	ldr	r3, [sp, #4]
3000322c:	e5932004 	ldr	r2, [r3, #4]
30003230:	e59d300c 	ldr	r3, [sp, #12]
30003234:	e583200c 	str	r2, [r3, #12]
	pool->num=pool_ctrl->num_per_pool;
30003238:	e59d3004 	ldr	r3, [sp, #4]
3000323c:	e5932008 	ldr	r2, [r3, #8]
30003240:	e59d300c 	ldr	r3, [sp, #12]
30003244:	e5832010 	str	r2, [r3, #16]
	pool->base_adr=(void *)acoral_malloc(pool->size*pool->num);
30003248:	e59d300c 	ldr	r3, [sp, #12]
3000324c:	e593300c 	ldr	r3, [r3, #12]
30003250:	e59d200c 	ldr	r2, [sp, #12]
30003254:	e5922010 	ldr	r2, [r2, #16]
30003258:	e0030392 	mul	r3, r2, r3
3000325c:	e1a00003 	mov	r0, r3
30003260:	eb000cd3 	bl	300065b4 <buddy_malloc>
30003264:	e1a02000 	mov	r2, r0
30003268:	e59d300c 	ldr	r3, [sp, #12]
3000326c:	e5832000 	str	r2, [r3]
	if(pool->base_adr==NULL)
30003270:	e59d300c 	ldr	r3, [sp, #12]
30003274:	e5933000 	ldr	r3, [r3]
30003278:	e3530000 	cmp	r3, #0
3000327c:	1a000001 	bne	30003288 <acoral_create_pool+0xd0>
		return ACORAL_RES_NO_MEM;
30003280:	e3a030f2 	mov	r3, #242	; 0xf2
30003284:	ea000020 	b	3000330c <acoral_create_pool+0x154>
	pool->res_free=pool->base_adr;
30003288:	e59d300c 	ldr	r3, [sp, #12]
3000328c:	e5932000 	ldr	r2, [r3]
30003290:	e59d300c 	ldr	r3, [sp, #12]
30003294:	e5832004 	str	r2, [r3, #4]
	pool->free_num=pool->num;
30003298:	e59d300c 	ldr	r3, [sp, #12]
3000329c:	e5932010 	ldr	r2, [r3, #16]
300032a0:	e59d300c 	ldr	r3, [sp, #12]
300032a4:	e5832018 	str	r2, [r3, #24]
	pool->ctrl=pool_ctrl;
300032a8:	e59d300c 	ldr	r3, [sp, #12]
300032ac:	e59d2004 	ldr	r2, [sp, #4]
300032b0:	e583201c 	str	r2, [r3, #28]
	acoral_pool_res_init(pool);
300032b4:	e59d000c 	ldr	r0, [sp, #12]
300032b8:	eb00018a 	bl	300038e8 <acoral_pool_res_init>
        acoral_list_add2_tail(&pool->ctrl_list,pool_ctrl->pools);
300032bc:	e59d300c 	ldr	r3, [sp, #12]
300032c0:	e2832020 	add	r2, r3, #32
300032c4:	e59d3004 	ldr	r3, [sp, #4]
300032c8:	e5933018 	ldr	r3, [r3, #24]
300032cc:	e1a00002 	mov	r0, r2
300032d0:	e1a01003 	mov	r1, r3
300032d4:	eb001bc0 	bl	3000a1dc <acoral_list_add2_tail>
	acoral_list_add2_tail(&pool->free_list,pool_ctrl->free_pools);
300032d8:	e59d300c 	ldr	r3, [sp, #12]
300032dc:	e2832028 	add	r2, r3, #40	; 0x28
300032e0:	e59d3004 	ldr	r3, [sp, #4]
300032e4:	e5933014 	ldr	r3, [r3, #20]
300032e8:	e1a00002 	mov	r0, r2
300032ec:	e1a01003 	mov	r1, r3
300032f0:	eb001bb9 	bl	3000a1dc <acoral_list_add2_tail>
	pool_ctrl->num++;
300032f4:	e59d3004 	ldr	r3, [sp, #4]
300032f8:	e593300c 	ldr	r3, [r3, #12]
300032fc:	e2832001 	add	r2, r3, #1
30003300:	e59d3004 	ldr	r3, [sp, #4]
30003304:	e583200c 	str	r2, [r3, #12]
	return 0;
30003308:	e3a03000 	mov	r3, #0
}
3000330c:	e1a00003 	mov	r0, r3
30003310:	e28dd014 	add	sp, sp, #20
30003314:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003318:	e12fff1e 	bx	lr

3000331c <acoral_release_pool>:
/*================================
 *      release a kind of resource pool
 *       释放某一资源内存池所有资源
 *       pool_ctrl--资源内存池管理块
 *================================*/
void acoral_release_pool(acoral_pool_ctrl_t *pool_ctrl){
3000331c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003320:	e24dd01c 	sub	sp, sp, #28
30003324:	e58d0004 	str	r0, [sp, #4]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->pools;
30003328:	e59d3004 	ldr	r3, [sp, #4]
3000332c:	e5933018 	ldr	r3, [r3, #24]
30003330:	e58d3014 	str	r3, [sp, #20]
	if(acoral_list_empty(head))
30003334:	e59d3014 	ldr	r3, [sp, #20]
30003338:	e5932000 	ldr	r2, [r3]
3000333c:	e59d3014 	ldr	r3, [sp, #20]
30003340:	e1520003 	cmp	r2, r3
30003344:	0a000027 	beq	300033e8 <acoral_release_pool+0xcc>
	  	return;
   for(list=head->next;list!=head;list=list->next){
30003348:	e59d3014 	ldr	r3, [sp, #20]
3000334c:	e5933000 	ldr	r3, [r3]
30003350:	e58d3010 	str	r3, [sp, #16]
30003354:	ea00001e 	b	300033d4 <acoral_release_pool+0xb8>
			pool=list_entry(list,acoral_pool_t,free_list);
30003358:	e59d3010 	ldr	r3, [sp, #16]
3000335c:	e2433028 	sub	r3, r3, #40	; 0x28
30003360:	e58d300c 	str	r3, [sp, #12]
		    acoral_list_del(&pool->ctrl_list);
30003364:	e59d300c 	ldr	r3, [sp, #12]
30003368:	e2833020 	add	r3, r3, #32
3000336c:	e1a00003 	mov	r0, r3
30003370:	eb001bac 	bl	3000a228 <acoral_list_del>
			acoral_list_del(&pool->free_list);
30003374:	e59d300c 	ldr	r3, [sp, #12]
30003378:	e2833028 	add	r3, r3, #40	; 0x28
3000337c:	e1a00003 	mov	r0, r3
30003380:	eb001ba8 	bl	3000a228 <acoral_list_del>
			acoral_free(pool->base_adr);
30003384:	e59d300c 	ldr	r3, [sp, #12]
30003388:	e5933000 	ldr	r3, [r3]
3000338c:	e1a00003 	mov	r0, r3
30003390:	eb000cbf 	bl	30006694 <buddy_free>
			pool->base_adr=(void *)acoral_free_res_pool;
30003394:	e59f305c 	ldr	r3, [pc, #92]	; 300033f8 <acoral_release_pool+0xdc>
30003398:	e5932000 	ldr	r2, [r3]
3000339c:	e59d300c 	ldr	r3, [sp, #12]
300033a0:	e5832000 	str	r2, [r3]
			pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
300033a4:	e59d300c 	ldr	r3, [sp, #12]
300033a8:	e5933008 	ldr	r3, [r3, #8]
300033ac:	e1a03b03 	lsl	r3, r3, #22
300033b0:	e1a03b23 	lsr	r3, r3, #22
300033b4:	e59d200c 	ldr	r2, [sp, #12]
300033b8:	e5823008 	str	r3, [r2, #8]
			acoral_free_res_pool=pool;
300033bc:	e59f3034 	ldr	r3, [pc, #52]	; 300033f8 <acoral_release_pool+0xdc>
300033c0:	e59d200c 	ldr	r2, [sp, #12]
300033c4:	e5832000 	str	r2, [r3]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->pools;
	if(acoral_list_empty(head))
	  	return;
   for(list=head->next;list!=head;list=list->next){
300033c8:	e59d3010 	ldr	r3, [sp, #16]
300033cc:	e5933000 	ldr	r3, [r3]
300033d0:	e58d3010 	str	r3, [sp, #16]
300033d4:	e59d2010 	ldr	r2, [sp, #16]
300033d8:	e59d3014 	ldr	r3, [sp, #20]
300033dc:	e1520003 	cmp	r2, r3
300033e0:	1affffdc 	bne	30003358 <acoral_release_pool+0x3c>
300033e4:	ea000000 	b	300033ec <acoral_release_pool+0xd0>
void acoral_release_pool(acoral_pool_ctrl_t *pool_ctrl){
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->pools;
	if(acoral_list_empty(head))
	  	return;
300033e8:	e1a00000 	nop			; (mov r0, r0)
			acoral_free(pool->base_adr);
			pool->base_adr=(void *)acoral_free_res_pool;
			pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
			acoral_free_res_pool=pool;
	}
}
300033ec:	e28dd01c 	add	sp, sp, #28
300033f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300033f4:	e12fff1e 	bx	lr
300033f8:	3000f5fc 	.word	0x3000f5fc

300033fc <acoral_collect_pool>:
/*================================
 *    collect a kind of resource pool
 *       回收某一资源内存池空闲的内存池
 *       pool_ctrl--资源内存池管理块
 *================================*/
void acoral_collect_pool(acoral_pool_ctrl_t *pool_ctrl){
300033fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003400:	e24dd01c 	sub	sp, sp, #28
30003404:	e58d0004 	str	r0, [sp, #4]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->free_pools;
30003408:	e59d3004 	ldr	r3, [sp, #4]
3000340c:	e5933014 	ldr	r3, [r3, #20]
30003410:	e58d3014 	str	r3, [sp, #20]
	if(acoral_list_empty(head))
30003414:	e59d3014 	ldr	r3, [sp, #20]
30003418:	e5932000 	ldr	r2, [r3]
3000341c:	e59d3014 	ldr	r3, [sp, #20]
30003420:	e1520003 	cmp	r2, r3
30003424:	0a00002d 	beq	300034e0 <acoral_collect_pool+0xe4>
	  	return;
        for(list=head->next;list!=head;list=list->next){
30003428:	e59d3014 	ldr	r3, [sp, #20]
3000342c:	e5933000 	ldr	r3, [r3]
30003430:	e58d3010 	str	r3, [sp, #16]
30003434:	ea000024 	b	300034cc <acoral_collect_pool+0xd0>
			pool=list_entry(list,acoral_pool_t,free_list);
30003438:	e59d3010 	ldr	r3, [sp, #16]
3000343c:	e2433028 	sub	r3, r3, #40	; 0x28
30003440:	e58d300c 	str	r3, [sp, #12]
	       	if(pool->free_num==pool->num){
30003444:	e59d300c 	ldr	r3, [sp, #12]
30003448:	e5932018 	ldr	r2, [r3, #24]
3000344c:	e59d300c 	ldr	r3, [sp, #12]
30003450:	e5933010 	ldr	r3, [r3, #16]
30003454:	e1520003 	cmp	r2, r3
30003458:	1a000018 	bne	300034c0 <acoral_collect_pool+0xc4>
		      	acoral_list_del(&pool->ctrl_list);
3000345c:	e59d300c 	ldr	r3, [sp, #12]
30003460:	e2833020 	add	r3, r3, #32
30003464:	e1a00003 	mov	r0, r3
30003468:	eb001b6e 	bl	3000a228 <acoral_list_del>
				acoral_list_del(&pool->free_list);
3000346c:	e59d300c 	ldr	r3, [sp, #12]
30003470:	e2833028 	add	r3, r3, #40	; 0x28
30003474:	e1a00003 	mov	r0, r3
30003478:	eb001b6a 	bl	3000a228 <acoral_list_del>
				acoral_free(pool->base_adr);
3000347c:	e59d300c 	ldr	r3, [sp, #12]
30003480:	e5933000 	ldr	r3, [r3]
30003484:	e1a00003 	mov	r0, r3
30003488:	eb000c81 	bl	30006694 <buddy_free>
				pool->base_adr=(void *)acoral_free_res_pool;
3000348c:	e59f305c 	ldr	r3, [pc, #92]	; 300034f0 <acoral_collect_pool+0xf4>
30003490:	e5932000 	ldr	r2, [r3]
30003494:	e59d300c 	ldr	r3, [sp, #12]
30003498:	e5832000 	str	r2, [r3]
				pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
3000349c:	e59d300c 	ldr	r3, [sp, #12]
300034a0:	e5933008 	ldr	r3, [r3, #8]
300034a4:	e1a03b03 	lsl	r3, r3, #22
300034a8:	e1a03b23 	lsr	r3, r3, #22
300034ac:	e59d200c 	ldr	r2, [sp, #12]
300034b0:	e5823008 	str	r3, [r2, #8]
				acoral_free_res_pool=pool;
300034b4:	e59f3034 	ldr	r3, [pc, #52]	; 300034f0 <acoral_collect_pool+0xf4>
300034b8:	e59d200c 	ldr	r2, [sp, #12]
300034bc:	e5832000 	str	r2, [r3]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->free_pools;
	if(acoral_list_empty(head))
	  	return;
        for(list=head->next;list!=head;list=list->next){
300034c0:	e59d3010 	ldr	r3, [sp, #16]
300034c4:	e5933000 	ldr	r3, [r3]
300034c8:	e58d3010 	str	r3, [sp, #16]
300034cc:	e59d2010 	ldr	r2, [sp, #16]
300034d0:	e59d3014 	ldr	r3, [sp, #20]
300034d4:	e1520003 	cmp	r2, r3
300034d8:	1affffd6 	bne	30003438 <acoral_collect_pool+0x3c>
300034dc:	ea000000 	b	300034e4 <acoral_collect_pool+0xe8>
void acoral_collect_pool(acoral_pool_ctrl_t *pool_ctrl){
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->free_pools;
	if(acoral_list_empty(head))
	  	return;
300034e0:	e1a00000 	nop			; (mov r0, r0)
				pool->base_adr=(void *)acoral_free_res_pool;
				pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
				acoral_free_res_pool=pool;
			}
	}
}
300034e4:	e28dd01c 	add	sp, sp, #28
300034e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300034ec:	e12fff1e 	bx	lr
300034f0:	3000f5fc 	.word	0x3000f5fc

300034f4 <acoral_get_res>:
/*================================
 *    get a kind of resource 
 *       获取某一资源
 *       pool_ctrl--资源池管理块
 *================================*/
acoral_res_t *acoral_get_res(acoral_pool_ctrl_t *pool_ctrl){
300034f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300034f8:	e24dd01c 	sub	sp, sp, #28
300034fc:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
  	acoral_list_t *first;
	acoral_res_t *res;
	acoral_pool_t *pool;
	HAL_ENTER_CRITICAL();
30003500:	ebfff87b 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30003504:	e1a03000 	mov	r3, r0
30003508:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&pool_ctrl->lock);
	first=pool_ctrl->free_pools->next;
3000350c:	e59d3004 	ldr	r3, [sp, #4]
30003510:	e5933014 	ldr	r3, [r3, #20]
30003514:	e5933000 	ldr	r3, [r3]
30003518:	e58d300c 	str	r3, [sp, #12]
	if(acoral_list_empty(first)){
3000351c:	e59d300c 	ldr	r3, [sp, #12]
30003520:	e5932000 	ldr	r2, [r3]
30003524:	e59d300c 	ldr	r3, [sp, #12]
30003528:	e1520003 	cmp	r2, r3
3000352c:	1a00000c 	bne	30003564 <acoral_get_res+0x70>
	  	if(acoral_create_pool(pool_ctrl)){
30003530:	e59d0004 	ldr	r0, [sp, #4]
30003534:	ebffff1f 	bl	300031b8 <acoral_create_pool>
30003538:	e1a03000 	mov	r3, r0
3000353c:	e3530000 	cmp	r3, #0
30003540:	0a000003 	beq	30003554 <acoral_get_res+0x60>
			acoral_spin_unlock(&pool_ctrl->lock);
			HAL_EXIT_CRITICAL();
30003544:	e59d0008 	ldr	r0, [sp, #8]
30003548:	ebfff867 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL;
3000354c:	e3a03000 	mov	r3, #0
30003550:	ea00002e 	b	30003610 <acoral_get_res+0x11c>
		}
		else{
			first=pool_ctrl->free_pools->next;
30003554:	e59d3004 	ldr	r3, [sp, #4]
30003558:	e5933014 	ldr	r3, [r3, #20]
3000355c:	e5933000 	ldr	r3, [r3]
30003560:	e58d300c 	str	r3, [sp, #12]
		}
	}
	pool=list_entry(first,acoral_pool_t,free_list);
30003564:	e59d300c 	ldr	r3, [sp, #12]
30003568:	e2433028 	sub	r3, r3, #40	; 0x28
3000356c:	e58d3014 	str	r3, [sp, #20]
	res=(acoral_res_t *)pool->res_free;
30003570:	e59d3014 	ldr	r3, [sp, #20]
30003574:	e5933004 	ldr	r3, [r3, #4]
30003578:	e58d3010 	str	r3, [sp, #16]
	pool->res_free=(void *)((acoral_u8 *)pool->base_adr+res->next_id*pool->size);
3000357c:	e59d3014 	ldr	r3, [sp, #20]
30003580:	e5932000 	ldr	r2, [r3]
30003584:	e59d3010 	ldr	r3, [sp, #16]
30003588:	e1d330b0 	ldrh	r3, [r3]
3000358c:	e59d1014 	ldr	r1, [sp, #20]
30003590:	e591100c 	ldr	r1, [r1, #12]
30003594:	e0030391 	mul	r3, r1, r3
30003598:	e0822003 	add	r2, r2, r3
3000359c:	e59d3014 	ldr	r3, [sp, #20]
300035a0:	e5832004 	str	r2, [r3, #4]
	res->id=(res->id>>(ACORAL_RES_INDEX_INIT_BIT-ACORAL_RES_INDEX_BIT))&ACORAL_RES_INDEX_MASK|pool->id;
300035a4:	e59d3010 	ldr	r3, [sp, #16]
300035a8:	e5933000 	ldr	r3, [r3]
300035ac:	e1a03143 	asr	r3, r3, #2
300035b0:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
300035b4:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
300035b8:	e3c3303f 	bic	r3, r3, #63	; 0x3f
300035bc:	e59d2014 	ldr	r2, [sp, #20]
300035c0:	e5922008 	ldr	r2, [r2, #8]
300035c4:	e1832002 	orr	r2, r3, r2
300035c8:	e59d3010 	ldr	r3, [sp, #16]
300035cc:	e5832000 	str	r2, [r3]
        pool->free_num--;
300035d0:	e59d3014 	ldr	r3, [sp, #20]
300035d4:	e5933018 	ldr	r3, [r3, #24]
300035d8:	e2432001 	sub	r2, r3, #1
300035dc:	e59d3014 	ldr	r3, [sp, #20]
300035e0:	e5832018 	str	r2, [r3, #24]
#ifdef CFG_TEST
	acoral_print("Alloc res 0x%x\n",res);
#endif
	if(!pool->free_num){
300035e4:	e59d3014 	ldr	r3, [sp, #20]
300035e8:	e5933018 	ldr	r3, [r3, #24]
300035ec:	e3530000 	cmp	r3, #0
300035f0:	1a000003 	bne	30003604 <acoral_get_res+0x110>
	  	acoral_list_del(&pool->free_list);
300035f4:	e59d3014 	ldr	r3, [sp, #20]
300035f8:	e2833028 	add	r3, r3, #40	; 0x28
300035fc:	e1a00003 	mov	r0, r3
30003600:	eb001b08 	bl	3000a228 <acoral_list_del>
	}
	acoral_spin_unlock(&pool_ctrl->lock);
	HAL_EXIT_CRITICAL();
30003604:	e59d0008 	ldr	r0, [sp, #8]
30003608:	ebfff837 	bl	300016ec <HAL_INTR_RESTORE>
	return res;
3000360c:	e59d3010 	ldr	r3, [sp, #16]
}
30003610:	e1a00003 	mov	r0, r3
30003614:	e28dd01c 	add	sp, sp, #28
30003618:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000361c:	e12fff1e 	bx	lr

30003620 <acoral_release_res>:
/*================================
 *    release a kind of resource 
 *       释放某一资源
 *      res--资源数据块
 *================================*/
void acoral_release_res(acoral_res_t *res){
30003620:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003624:	e24dd01c 	sub	sp, sp, #28
30003628:	e58d0004 	str	r0, [sp, #4]
  	acoral_pool_t *pool;
	acoral_u32 index;
  	void *tmp;
       	acoral_pool_ctrl_t *pool_ctrl;
	if(!ACORAL_ASSERT(res,"Res Release\n"))
3000362c:	e59f3168 	ldr	r3, [pc, #360]	; 3000379c <acoral_release_res+0x17c>
30003630:	e59d0004 	ldr	r0, [sp, #4]
30003634:	e1a01003 	mov	r1, r3
30003638:	eb00017f 	bl	30003c3c <acoral_assert_res>
3000363c:	e1a03000 	mov	r3, r0
30003640:	e3530000 	cmp	r3, #0
30003644:	0a00004e 	beq	30003784 <acoral_release_res+0x164>
		return;
	pool=acoral_get_pool_by_id(res->id);
30003648:	e59d3004 	ldr	r3, [sp, #4]
3000364c:	e5933000 	ldr	r3, [r3]
30003650:	e1a00003 	mov	r0, r3
30003654:	eb000053 	bl	300037a8 <acoral_get_pool_by_id>
30003658:	e1a03000 	mov	r3, r0
3000365c:	e58d3008 	str	r3, [sp, #8]
	if(pool==NULL){
30003660:	e59d3008 	ldr	r3, [sp, #8]
30003664:	e3530000 	cmp	r3, #0
30003668:	1a000002 	bne	30003678 <acoral_release_res+0x58>
		acoral_printerr("Res release Err\n");
3000366c:	e59f012c 	ldr	r0, [pc, #300]	; 300037a0 <acoral_release_res+0x180>
30003670:	eb001f6b 	bl	3000b424 <acoral_print>
		return;
30003674:	ea000045 	b	30003790 <acoral_release_res+0x170>
	}
 	pool_ctrl=pool->ctrl;
30003678:	e59d3008 	ldr	r3, [sp, #8]
3000367c:	e593301c 	ldr	r3, [r3, #28]
30003680:	e58d3014 	str	r3, [sp, #20]
	acoral_spin_lock(&pool_ctrl->lock);
	if((void *)res<pool->base_adr){
30003684:	e59d3008 	ldr	r3, [sp, #8]
30003688:	e5932000 	ldr	r2, [r3]
3000368c:	e59d3004 	ldr	r3, [sp, #4]
30003690:	e1520003 	cmp	r2, r3
30003694:	9a000002 	bls	300036a4 <acoral_release_res+0x84>
		acoral_printerr("Err Res\n");
30003698:	e59f0104 	ldr	r0, [pc, #260]	; 300037a4 <acoral_release_res+0x184>
3000369c:	eb001f60 	bl	3000b424 <acoral_print>
		return;
300036a0:	ea00003a 	b	30003790 <acoral_release_res+0x170>
	}
	index=(((acoral_u32)res-(acoral_u32)pool->base_adr)/pool->size);
300036a4:	e59d2004 	ldr	r2, [sp, #4]
300036a8:	e59d3008 	ldr	r3, [sp, #8]
300036ac:	e5933000 	ldr	r3, [r3]
300036b0:	e0632002 	rsb	r2, r3, r2
300036b4:	e59d3008 	ldr	r3, [sp, #8]
300036b8:	e593300c 	ldr	r3, [r3, #12]
300036bc:	e1a00002 	mov	r0, r2
300036c0:	e1a01003 	mov	r1, r3
300036c4:	eb002955 	bl	3000dc20 <__aeabi_uidiv>
300036c8:	e1a03000 	mov	r3, r0
300036cc:	e58d300c 	str	r3, [sp, #12]
	if(index>=pool->num){
300036d0:	e59d3008 	ldr	r3, [sp, #8]
300036d4:	e5932010 	ldr	r2, [r3, #16]
300036d8:	e59d300c 	ldr	r3, [sp, #12]
300036dc:	e1520003 	cmp	r2, r3
300036e0:	8a000002 	bhi	300036f0 <acoral_release_res+0xd0>
		acoral_printerr("Err Res\n");
300036e4:	e59f00b8 	ldr	r0, [pc, #184]	; 300037a4 <acoral_release_res+0x184>
300036e8:	eb001f4d 	bl	3000b424 <acoral_print>
		return;
300036ec:	ea000027 	b	30003790 <acoral_release_res+0x170>
	}
#ifdef CFG_TEST
	acoral_print("Free res 0x%x\n",res);
#endif
	tmp=pool->res_free;
300036f0:	e59d3008 	ldr	r3, [sp, #8]
300036f4:	e5933004 	ldr	r3, [r3, #4]
300036f8:	e58d3010 	str	r3, [sp, #16]
	pool->res_free=(void *)res;
300036fc:	e59d3008 	ldr	r3, [sp, #8]
30003700:	e59d2004 	ldr	r2, [sp, #4]
30003704:	e5832004 	str	r2, [r3, #4]
	res->id=index<<ACORAL_RES_INDEX_INIT_BIT;
30003708:	e59d300c 	ldr	r3, [sp, #12]
3000370c:	e1a03803 	lsl	r3, r3, #16
30003710:	e1a02003 	mov	r2, r3
30003714:	e59d3004 	ldr	r3, [sp, #4]
30003718:	e5832000 	str	r2, [r3]
	res->next_id=((acoral_res_t *)tmp)->id>>ACORAL_RES_INDEX_INIT_BIT;
3000371c:	e59d3010 	ldr	r3, [sp, #16]
30003720:	e5933000 	ldr	r3, [r3]
30003724:	e1a03843 	asr	r3, r3, #16
30003728:	e1a03803 	lsl	r3, r3, #16
3000372c:	e1a02823 	lsr	r2, r3, #16
30003730:	e59d3004 	ldr	r3, [sp, #4]
30003734:	e1c320b0 	strh	r2, [r3]
	pool->free_num++;
30003738:	e59d3008 	ldr	r3, [sp, #8]
3000373c:	e5933018 	ldr	r3, [r3, #24]
30003740:	e2832001 	add	r2, r3, #1
30003744:	e59d3008 	ldr	r3, [sp, #8]
30003748:	e5832018 	str	r2, [r3, #24]
	if(acoral_list_empty(&pool->free_list))
3000374c:	e59d3008 	ldr	r3, [sp, #8]
30003750:	e5932028 	ldr	r2, [r3, #40]	; 0x28
30003754:	e59d3008 	ldr	r3, [sp, #8]
30003758:	e2833028 	add	r3, r3, #40	; 0x28
3000375c:	e1520003 	cmp	r2, r3
30003760:	1a000009 	bne	3000378c <acoral_release_res+0x16c>
	  	acoral_list_add(&pool->free_list,pool_ctrl->free_pools);
30003764:	e59d3008 	ldr	r3, [sp, #8]
30003768:	e2832028 	add	r2, r3, #40	; 0x28
3000376c:	e59d3014 	ldr	r3, [sp, #20]
30003770:	e5933014 	ldr	r3, [r3, #20]
30003774:	e1a00002 	mov	r0, r2
30003778:	e1a01003 	mov	r1, r3
3000377c:	eb001a83 	bl	3000a190 <acoral_list_add>
	acoral_spin_unlock(&pool_ctrl->lock);
	return;
30003780:	ea000002 	b	30003790 <acoral_release_res+0x170>
  	acoral_pool_t *pool;
	acoral_u32 index;
  	void *tmp;
       	acoral_pool_ctrl_t *pool_ctrl;
	if(!ACORAL_ASSERT(res,"Res Release\n"))
		return;
30003784:	e1a00000 	nop			; (mov r0, r0)
30003788:	ea000000 	b	30003790 <acoral_release_res+0x170>
	res->next_id=((acoral_res_t *)tmp)->id>>ACORAL_RES_INDEX_INIT_BIT;
	pool->free_num++;
	if(acoral_list_empty(&pool->free_list))
	  	acoral_list_add(&pool->free_list,pool_ctrl->free_pools);
	acoral_spin_unlock(&pool_ctrl->lock);
	return;
3000378c:	e1a00000 	nop			; (mov r0, r0)
}
30003790:	e28dd01c 	add	sp, sp, #28
30003794:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003798:	e12fff1e 	bx	lr
3000379c:	3000e4bc 	.word	0x3000e4bc
300037a0:	3000e4cc 	.word	0x3000e4cc
300037a4:	3000e4e0 	.word	0x3000e4e0

300037a8 <acoral_get_pool_by_id>:
/*================================
 *    get a kind of resource by res_id
 *  根据资源ID获取某一资源对应的资源池
 *      res_id--资源ID
 *================================*/
acoral_pool_t *acoral_get_pool_by_id(acoral_id res_id){
300037a8:	e24dd010 	sub	sp, sp, #16
300037ac:	e58d0004 	str	r0, [sp, #4]
  	acoral_u32 index;
	index=(res_id&ACORAL_POOL_INDEX_MASK)>>ACORAL_POOL_INDEX_BIT;
300037b0:	e59d3004 	ldr	r3, [sp, #4]
300037b4:	e1a03b03 	lsl	r3, r3, #22
300037b8:	e1a03b23 	lsr	r3, r3, #22
300037bc:	e58d300c 	str	r3, [sp, #12]
	if(index<ACORAL_MAX_POOLS)
300037c0:	e59d300c 	ldr	r3, [sp, #12]
300037c4:	e3530027 	cmp	r3, #39	; 0x27
300037c8:	8a00000a 	bhi	300037f8 <acoral_get_pool_by_id+0x50>
	  	return acoral_pools+index;
300037cc:	e59d200c 	ldr	r2, [sp, #12]
300037d0:	e1a03002 	mov	r3, r2
300037d4:	e1a03083 	lsl	r3, r3, #1
300037d8:	e0833002 	add	r3, r3, r2
300037dc:	e1a03103 	lsl	r3, r3, #2
300037e0:	e0833002 	add	r3, r3, r2
300037e4:	e1a03103 	lsl	r3, r3, #2
300037e8:	e1a02003 	mov	r2, r3
300037ec:	e59f3014 	ldr	r3, [pc, #20]	; 30003808 <acoral_get_pool_by_id+0x60>
300037f0:	e0823003 	add	r3, r2, r3
300037f4:	ea000000 	b	300037fc <acoral_get_pool_by_id+0x54>
	return NULL;
300037f8:	e3a03000 	mov	r3, #0
}
300037fc:	e1a00003 	mov	r0, r3
30003800:	e28dd010 	add	sp, sp, #16
30003804:	e12fff1e 	bx	lr
30003808:	3000fd14 	.word	0x3000fd14

3000380c <acoral_get_free_pool>:

/*================================
 *    get a free pool
 *     获取空闲资源池
 *================================*/
acoral_pool_t *acoral_get_free_pool(){
3000380c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003810:	e24dd00c 	sub	sp, sp, #12
	acoral_sr cpu_sr;
  	acoral_pool_t *tmp;
	HAL_ENTER_CRITICAL();
30003814:	ebfff7b6 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30003818:	e1a03000 	mov	r3, r0
3000381c:	e58d3000 	str	r3, [sp]
	tmp=acoral_free_res_pool;
30003820:	e59f3044 	ldr	r3, [pc, #68]	; 3000386c <acoral_get_free_pool+0x60>
30003824:	e5933000 	ldr	r3, [r3]
30003828:	e58d3004 	str	r3, [sp, #4]
	if(NULL!=tmp){
3000382c:	e59d3004 	ldr	r3, [sp, #4]
30003830:	e3530000 	cmp	r3, #0
30003834:	0a000005 	beq	30003850 <acoral_get_free_pool+0x44>
		acoral_spin_lock(&tmp->lock);
		acoral_free_res_pool=*(void **)tmp->base_adr;
30003838:	e59d3004 	ldr	r3, [sp, #4]
3000383c:	e5933000 	ldr	r3, [r3]
30003840:	e5933000 	ldr	r3, [r3]
30003844:	e1a02003 	mov	r2, r3
30003848:	e59f301c 	ldr	r3, [pc, #28]	; 3000386c <acoral_get_free_pool+0x60>
3000384c:	e5832000 	str	r2, [r3]
		acoral_spin_unlock(&tmp->lock);
	}
	HAL_EXIT_CRITICAL();
30003850:	e59d0000 	ldr	r0, [sp]
30003854:	ebfff7a4 	bl	300016ec <HAL_INTR_RESTORE>
	return tmp;
30003858:	e59d3004 	ldr	r3, [sp, #4]
}
3000385c:	e1a00003 	mov	r0, r3
30003860:	e28dd00c 	add	sp, sp, #12
30003864:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003868:	e12fff1e 	bx	lr
3000386c:	3000f5fc 	.word	0x3000f5fc

30003870 <acoral_get_res_by_id>:

acoral_res_t * acoral_get_res_by_id(acoral_id id){
30003870:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003874:	e24dd014 	sub	sp, sp, #20
30003878:	e58d0004 	str	r0, [sp, #4]
  	acoral_pool_t *pool;
	acoral_u32 index;
	pool=acoral_get_pool_by_id(id);
3000387c:	e59d0004 	ldr	r0, [sp, #4]
30003880:	ebffffc8 	bl	300037a8 <acoral_get_pool_by_id>
30003884:	e1a03000 	mov	r3, r0
30003888:	e58d3008 	str	r3, [sp, #8]
	if(pool==NULL)
3000388c:	e59d3008 	ldr	r3, [sp, #8]
30003890:	e3530000 	cmp	r3, #0
30003894:	1a000001 	bne	300038a0 <acoral_get_res_by_id+0x30>
		return NULL;
30003898:	e3a03000 	mov	r3, #0
3000389c:	ea00000d 	b	300038d8 <acoral_get_res_by_id+0x68>
	index=(id&ACORAL_RES_INDEX_MASK)>>ACORAL_RES_INDEX_BIT;
300038a0:	e59d3004 	ldr	r3, [sp, #4]
300038a4:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
300038a8:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
300038ac:	e3c3303f 	bic	r3, r3, #63	; 0x3f
300038b0:	e1a03743 	asr	r3, r3, #14
300038b4:	e58d300c 	str	r3, [sp, #12]
     	return (acoral_res_t *)((acoral_u8 *)pool->base_adr+index*pool->size);
300038b8:	e59d3008 	ldr	r3, [sp, #8]
300038bc:	e5933000 	ldr	r3, [r3]
300038c0:	e1a02003 	mov	r2, r3
300038c4:	e59d3008 	ldr	r3, [sp, #8]
300038c8:	e593300c 	ldr	r3, [r3, #12]
300038cc:	e59d100c 	ldr	r1, [sp, #12]
300038d0:	e0030391 	mul	r3, r1, r3
300038d4:	e0823003 	add	r3, r2, r3
}
300038d8:	e1a00003 	mov	r0, r3
300038dc:	e28dd014 	add	sp, sp, #20
300038e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300038e4:	e12fff1e 	bx	lr

300038e8 <acoral_pool_res_init>:

/*================================
 *       a kind of resource initial 
 *        资源初始化
 *================================*/
void acoral_pool_res_init(acoral_pool_t * pool){
300038e8:	e24dd018 	sub	sp, sp, #24
300038ec:	e58d0004 	str	r0, [sp, #4]
	acoral_res_t *res;
	acoral_u32 i;
	acoral_u8 *pblk;
	acoral_u32 blks;
	blks=pool->num;
300038f0:	e59d3004 	ldr	r3, [sp, #4]
300038f4:	e5933010 	ldr	r3, [r3, #16]
300038f8:	e58d3014 	str	r3, [sp, #20]
	res=(acoral_res_t *)pool->base_adr;
300038fc:	e59d3004 	ldr	r3, [sp, #4]
30003900:	e5933000 	ldr	r3, [r3]
30003904:	e58d3008 	str	r3, [sp, #8]
     	pblk=(acoral_u8 *)pool->base_adr + pool->size;
30003908:	e59d3004 	ldr	r3, [sp, #4]
3000390c:	e5933000 	ldr	r3, [r3]
30003910:	e1a02003 	mov	r2, r3
30003914:	e59d3004 	ldr	r3, [sp, #4]
30003918:	e593300c 	ldr	r3, [r3, #12]
3000391c:	e0823003 	add	r3, r2, r3
30003920:	e58d3010 	str	r3, [sp, #16]
	for (i = 0; i < (blks - 1); i++) {
30003924:	e3a03000 	mov	r3, #0
30003928:	e58d300c 	str	r3, [sp, #12]
3000392c:	ea000016 	b	3000398c <acoral_pool_res_init+0xa4>
	    res->id=i<<ACORAL_RES_INDEX_INIT_BIT;
30003930:	e59d300c 	ldr	r3, [sp, #12]
30003934:	e1a03803 	lsl	r3, r3, #16
30003938:	e1a02003 	mov	r2, r3
3000393c:	e59d3008 	ldr	r3, [sp, #8]
30003940:	e5832000 	str	r2, [r3]
	    res->next_id=i+1;
30003944:	e59d300c 	ldr	r3, [sp, #12]
30003948:	e1a03803 	lsl	r3, r3, #16
3000394c:	e1a03823 	lsr	r3, r3, #16
30003950:	e2833001 	add	r3, r3, #1
30003954:	e1a03803 	lsl	r3, r3, #16
30003958:	e1a02823 	lsr	r2, r3, #16
3000395c:	e59d3008 	ldr	r3, [sp, #8]
30003960:	e1c320b0 	strh	r2, [r3]
	    res=(acoral_res_t *)pblk;
30003964:	e59d3010 	ldr	r3, [sp, #16]
30003968:	e58d3008 	str	r3, [sp, #8]
	    pblk+=pool->size;
3000396c:	e59d3004 	ldr	r3, [sp, #4]
30003970:	e593300c 	ldr	r3, [r3, #12]
30003974:	e59d2010 	ldr	r2, [sp, #16]
30003978:	e0823003 	add	r3, r2, r3
3000397c:	e58d3010 	str	r3, [sp, #16]
	acoral_u8 *pblk;
	acoral_u32 blks;
	blks=pool->num;
	res=(acoral_res_t *)pool->base_adr;
     	pblk=(acoral_u8 *)pool->base_adr + pool->size;
	for (i = 0; i < (blks - 1); i++) {
30003980:	e59d300c 	ldr	r3, [sp, #12]
30003984:	e2833001 	add	r3, r3, #1
30003988:	e58d300c 	str	r3, [sp, #12]
3000398c:	e59d3014 	ldr	r3, [sp, #20]
30003990:	e2432001 	sub	r2, r3, #1
30003994:	e59d300c 	ldr	r3, [sp, #12]
30003998:	e1520003 	cmp	r2, r3
3000399c:	8affffe3 	bhi	30003930 <acoral_pool_res_init+0x48>
	    res->id=i<<ACORAL_RES_INDEX_INIT_BIT;
	    res->next_id=i+1;
	    res=(acoral_res_t *)pblk;
	    pblk+=pool->size;
	}
	res->id=blks-1<<ACORAL_RES_INDEX_INIT_BIT;
300039a0:	e59d3014 	ldr	r3, [sp, #20]
300039a4:	e2433001 	sub	r3, r3, #1
300039a8:	e1a03803 	lsl	r3, r3, #16
300039ac:	e1a02003 	mov	r2, r3
300039b0:	e59d3008 	ldr	r3, [sp, #8]
300039b4:	e5832000 	str	r2, [r3]
	res->next_id=0;
300039b8:	e59d3008 	ldr	r3, [sp, #8]
300039bc:	e3a02000 	mov	r2, #0
300039c0:	e1c320b0 	strh	r2, [r3]
}
300039c4:	e28dd018 	add	sp, sp, #24
300039c8:	e12fff1e 	bx	lr

300039cc <acoral_pools_init>:
/*================================
 *        resource pool initial 
 *              资源池初始化
 *================================*/
void  acoral_pools_init(void)
{
300039cc:	e24dd008 	sub	sp, sp, #8
    acoral_pool_t  *pool;
    acoral_u32 i;
    pool = &acoral_pools[0];
300039d0:	e59f3090 	ldr	r3, [pc, #144]	; 30003a68 <acoral_pools_init+0x9c>
300039d4:	e58d3000 	str	r3, [sp]
    for (i = 0; i < (ACORAL_MAX_POOLS - 1); i++) {
300039d8:	e3a03000 	mov	r3, #0
300039dc:	e58d3004 	str	r3, [sp, #4]
300039e0:	ea000015 	b	30003a3c <acoral_pools_init+0x70>
        pool->base_adr= (void *)&acoral_pools[i+1];
300039e4:	e59d3004 	ldr	r3, [sp, #4]
300039e8:	e2832001 	add	r2, r3, #1
300039ec:	e1a03002 	mov	r3, r2
300039f0:	e1a03083 	lsl	r3, r3, #1
300039f4:	e0833002 	add	r3, r3, r2
300039f8:	e1a03103 	lsl	r3, r3, #2
300039fc:	e0833002 	add	r3, r3, r2
30003a00:	e1a03103 	lsl	r3, r3, #2
30003a04:	e1a02003 	mov	r2, r3
30003a08:	e59f3058 	ldr	r3, [pc, #88]	; 30003a68 <acoral_pools_init+0x9c>
30003a0c:	e0822003 	add	r2, r2, r3
30003a10:	e59d3000 	ldr	r3, [sp]
30003a14:	e5832000 	str	r2, [r3]
		pool->id=i;
30003a18:	e59d2004 	ldr	r2, [sp, #4]
30003a1c:	e59d3000 	ldr	r3, [sp]
30003a20:	e5832008 	str	r2, [r3, #8]
        pool++;
30003a24:	e59d3000 	ldr	r3, [sp]
30003a28:	e2833034 	add	r3, r3, #52	; 0x34
30003a2c:	e58d3000 	str	r3, [sp]
void  acoral_pools_init(void)
{
    acoral_pool_t  *pool;
    acoral_u32 i;
    pool = &acoral_pools[0];
    for (i = 0; i < (ACORAL_MAX_POOLS - 1); i++) {
30003a30:	e59d3004 	ldr	r3, [sp, #4]
30003a34:	e2833001 	add	r3, r3, #1
30003a38:	e58d3004 	str	r3, [sp, #4]
30003a3c:	e59d3004 	ldr	r3, [sp, #4]
30003a40:	e3530026 	cmp	r3, #38	; 0x26
30003a44:	9affffe6 	bls	300039e4 <acoral_pools_init+0x18>
        pool->base_adr= (void *)&acoral_pools[i+1];
		pool->id=i;
        pool++;
		acoral_spin_init(&pool->lock);
    }
    pool->base_adr= (void *)0;
30003a48:	e59d3000 	ldr	r3, [sp]
30003a4c:	e3a02000 	mov	r2, #0
30003a50:	e5832000 	str	r2, [r3]
    acoral_free_res_pool = &acoral_pools[0];
30003a54:	e59f3010 	ldr	r3, [pc, #16]	; 30003a6c <acoral_pools_init+0xa0>
30003a58:	e59f2008 	ldr	r2, [pc, #8]	; 30003a68 <acoral_pools_init+0x9c>
30003a5c:	e5832000 	str	r2, [r3]
	acoral_spin_init(&acoral_free_res_pool->lock);
}
30003a60:	e28dd008 	add	sp, sp, #8
30003a64:	e12fff1e 	bx	lr
30003a68:	3000fd14 	.word	0x3000fd14
30003a6c:	3000f5fc 	.word	0x3000f5fc

30003a70 <acoral_pool_ctrl_init>:
/*================================
 *        resource pool control initial 
 *              资源池控制块初始化
 *================================*/
void acoral_pool_ctrl_init(acoral_pool_ctrl_t *pool_ctrl)
{
30003a70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003a74:	e24dd014 	sub	sp, sp, #20
30003a78:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 size;
	pool_ctrl->free_pools=&pool_ctrl->list[0];
30003a7c:	e59d3004 	ldr	r3, [sp, #4]
30003a80:	e283201c 	add	r2, r3, #28
30003a84:	e59d3004 	ldr	r3, [sp, #4]
30003a88:	e5832014 	str	r2, [r3, #20]
	pool_ctrl->pools=&pool_ctrl->list[1];
30003a8c:	e59d3004 	ldr	r3, [sp, #4]
30003a90:	e2832024 	add	r2, r3, #36	; 0x24
30003a94:	e59d3004 	ldr	r3, [sp, #4]
30003a98:	e5832018 	str	r2, [r3, #24]
	pool_ctrl->num=0;
30003a9c:	e59d3004 	ldr	r3, [sp, #4]
30003aa0:	e3a02000 	mov	r2, #0
30003aa4:	e583200c 	str	r2, [r3, #12]
	acoral_init_list(pool_ctrl->pools);
30003aa8:	e59d3004 	ldr	r3, [sp, #4]
30003aac:	e5933018 	ldr	r3, [r3, #24]
30003ab0:	e59d2004 	ldr	r2, [sp, #4]
30003ab4:	e5922018 	ldr	r2, [r2, #24]
30003ab8:	e5832000 	str	r2, [r3]
30003abc:	e59d3004 	ldr	r3, [sp, #4]
30003ac0:	e5933018 	ldr	r3, [r3, #24]
30003ac4:	e59d2004 	ldr	r2, [sp, #4]
30003ac8:	e5922018 	ldr	r2, [r2, #24]
30003acc:	e5832004 	str	r2, [r3, #4]
    acoral_init_list(pool_ctrl->free_pools);
30003ad0:	e59d3004 	ldr	r3, [sp, #4]
30003ad4:	e5933014 	ldr	r3, [r3, #20]
30003ad8:	e59d2004 	ldr	r2, [sp, #4]
30003adc:	e5922014 	ldr	r2, [r2, #20]
30003ae0:	e5832000 	str	r2, [r3]
30003ae4:	e59d3004 	ldr	r3, [sp, #4]
30003ae8:	e5933014 	ldr	r3, [r3, #20]
30003aec:	e59d2004 	ldr	r2, [sp, #4]
30003af0:	e5922014 	ldr	r2, [r2, #20]
30003af4:	e5832004 	str	r2, [r3, #4]
    acoral_spin_init(&pool_ctrl->lock);
	/*调整pool的对象个数以最大化利用分配了的内存*/
	size=acoral_malloc_size(pool_ctrl->size*pool_ctrl->num_per_pool);
30003af8:	e59d3004 	ldr	r3, [sp, #4]
30003afc:	e5933004 	ldr	r3, [r3, #4]
30003b00:	e59d2004 	ldr	r2, [sp, #4]
30003b04:	e5922008 	ldr	r2, [r2, #8]
30003b08:	e0030392 	mul	r3, r2, r3
30003b0c:	e1a00003 	mov	r0, r3
30003b10:	eb000a7e 	bl	30006510 <buddy_malloc_size>
30003b14:	e1a03000 	mov	r3, r0
30003b18:	e58d300c 	str	r3, [sp, #12]
	if(size<pool_ctrl->size){
30003b1c:	e59d3004 	ldr	r3, [sp, #4]
30003b20:	e5932004 	ldr	r2, [r3, #4]
30003b24:	e59d300c 	ldr	r3, [sp, #12]
30003b28:	e1520003 	cmp	r2, r3
30003b2c:	9a000003 	bls	30003b40 <acoral_pool_ctrl_init+0xd0>
		pool_ctrl->num_per_pool=0;
30003b30:	e59d3004 	ldr	r3, [sp, #4]
30003b34:	e3a02000 	mov	r2, #0
30003b38:	e5832008 	str	r2, [r3, #8]
30003b3c:	ea00000a 	b	30003b6c <acoral_pool_ctrl_init+0xfc>
	}
	else{
		pool_ctrl->num_per_pool=size/pool_ctrl->size;
30003b40:	e59d3004 	ldr	r3, [sp, #4]
30003b44:	e5933004 	ldr	r3, [r3, #4]
30003b48:	e59d000c 	ldr	r0, [sp, #12]
30003b4c:	e1a01003 	mov	r1, r3
30003b50:	eb002832 	bl	3000dc20 <__aeabi_uidiv>
30003b54:	e1a03000 	mov	r3, r0
30003b58:	e1a02003 	mov	r2, r3
30003b5c:	e59d3004 	ldr	r3, [sp, #4]
30003b60:	e5832008 	str	r2, [r3, #8]
		acoral_create_pool(pool_ctrl);
30003b64:	e59d0004 	ldr	r0, [sp, #4]
30003b68:	ebfffd92 	bl	300031b8 <acoral_create_pool>
	}
}
30003b6c:	e28dd014 	add	sp, sp, #20
30003b70:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003b74:	e12fff1e 	bx	lr

30003b78 <acoral_obj_pool_init>:
 *        user resource api
 *         用户资源相关接口
 *================================*/

void acoral_obj_pool_init(acoral_pool_ctrl_t *pool_ctrl)
{
30003b78:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003b7c:	e24dd00c 	sub	sp, sp, #12
30003b80:	e58d0004 	str	r0, [sp, #4]
	pool_ctrl->type=ACORAL_RES_USER;
30003b84:	e59d3004 	ldr	r3, [sp, #4]
30003b88:	e3a02006 	mov	r2, #6
30003b8c:	e5832000 	str	r2, [r3]
	pool_ctrl->size+=sizeof(acoral_res_t);
30003b90:	e59d3004 	ldr	r3, [sp, #4]
30003b94:	e5933004 	ldr	r3, [r3, #4]
30003b98:	e2832004 	add	r2, r3, #4
30003b9c:	e59d3004 	ldr	r3, [sp, #4]
30003ba0:	e5832004 	str	r2, [r3, #4]
	acoral_pool_ctrl_init(pool_ctrl);
30003ba4:	e59d0004 	ldr	r0, [sp, #4]
30003ba8:	ebffffb0 	bl	30003a70 <acoral_pool_ctrl_init>
}
30003bac:	e28dd00c 	add	sp, sp, #12
30003bb0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003bb4:	e12fff1e 	bx	lr

30003bb8 <acoral_obj_pool_release>:

void acoral_obj_pool_release(acoral_pool_ctrl_t *pool_ctrl){
30003bb8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003bbc:	e24dd00c 	sub	sp, sp, #12
30003bc0:	e58d0004 	str	r0, [sp, #4]
	 acoral_release_pool(pool_ctrl);
30003bc4:	e59d0004 	ldr	r0, [sp, #4]
30003bc8:	ebfffdd3 	bl	3000331c <acoral_release_pool>
}
30003bcc:	e28dd00c 	add	sp, sp, #12
30003bd0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003bd4:	e12fff1e 	bx	lr

30003bd8 <acoral_get_obj>:

void *acoral_get_obj(acoral_pool_ctrl_t *pool_ctrl){
30003bd8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003bdc:	e24dd00c 	sub	sp, sp, #12
30003be0:	e58d0004 	str	r0, [sp, #4]
	return (void *)((acoral_char *)acoral_get_res(pool_ctrl)+sizeof(acoral_res_t));
30003be4:	e59d0004 	ldr	r0, [sp, #4]
30003be8:	ebfffe41 	bl	300034f4 <acoral_get_res>
30003bec:	e1a03000 	mov	r3, r0
30003bf0:	e2833004 	add	r3, r3, #4
}
30003bf4:	e1a00003 	mov	r0, r3
30003bf8:	e28dd00c 	add	sp, sp, #12
30003bfc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003c00:	e12fff1e 	bx	lr

30003c04 <acoral_free_obj>:

void acoral_free_obj(void *obj){
30003c04:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003c08:	e24dd00c 	sub	sp, sp, #12
30003c0c:	e58d0004 	str	r0, [sp, #4]
	acoral_release_res((acoral_char *)obj-sizeof(acoral_res_t));
30003c10:	e59d3004 	ldr	r3, [sp, #4]
30003c14:	e2433004 	sub	r3, r3, #4
30003c18:	e1a00003 	mov	r0, r3
30003c1c:	ebfffe7f 	bl	30003620 <acoral_release_res>
}
30003c20:	e28dd00c 	add	sp, sp, #12
30003c24:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003c28:	e12fff1e 	bx	lr

30003c2c <acoral_res_sys_init>:

/*================================
 *        resource  system initial 
 *          资源系统初始化
 *================================*/
void acoral_res_sys_init(){
30003c2c:	e92d4008 	push	{r3, lr}
	acoral_pools_init();
30003c30:	ebffff65 	bl	300039cc <acoral_pools_init>
}
30003c34:	e8bd4008 	pop	{r3, lr}
30003c38:	e12fff1e 	bx	lr

30003c3c <acoral_assert_res>:

acoral_char acoral_assert_res(acoral_res_t *res,acoral_8 *assert){
30003c3c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003c40:	e24dd00c 	sub	sp, sp, #12
30003c44:	e58d0004 	str	r0, [sp, #4]
30003c48:	e58d1000 	str	r1, [sp]
	if(res==NULL||acoral_get_res_by_id(res->id)!=res){
30003c4c:	e59d3004 	ldr	r3, [sp, #4]
30003c50:	e3530000 	cmp	r3, #0
30003c54:	0a000007 	beq	30003c78 <acoral_assert_res+0x3c>
30003c58:	e59d3004 	ldr	r3, [sp, #4]
30003c5c:	e5933000 	ldr	r3, [r3]
30003c60:	e1a00003 	mov	r0, r3
30003c64:	ebffff01 	bl	30003870 <acoral_get_res_by_id>
30003c68:	e1a02000 	mov	r2, r0
30003c6c:	e59d3004 	ldr	r3, [sp, #4]
30003c70:	e1520003 	cmp	r2, r3
30003c74:	0a000009 	beq	30003ca0 <acoral_assert_res+0x64>
		acoral_printerr("%s\n",assert);
30003c78:	e59f0034 	ldr	r0, [pc, #52]	; 30003cb4 <acoral_assert_res+0x78>
30003c7c:	e59d1000 	ldr	r1, [sp]
30003c80:	eb001de7 	bl	3000b424 <acoral_print>
		acoral_printerr("Err res's id:%x\n",res->id);
30003c84:	e59d3004 	ldr	r3, [sp, #4]
30003c88:	e5933000 	ldr	r3, [r3]
30003c8c:	e59f0024 	ldr	r0, [pc, #36]	; 30003cb8 <acoral_assert_res+0x7c>
30003c90:	e1a01003 	mov	r1, r3
30003c94:	eb001de2 	bl	3000b424 <acoral_print>
		return false;
30003c98:	e3a03000 	mov	r3, #0
30003c9c:	ea000000 	b	30003ca4 <acoral_assert_res+0x68>
	}
	return true;
30003ca0:	e3a03001 	mov	r3, #1
}
30003ca4:	e1a00003 	mov	r0, r3
30003ca8:	e28dd00c 	add	sp, sp, #12
30003cac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003cb0:	e12fff1e 	bx	lr
30003cb4:	3000e4ec 	.word	0x3000e4ec
30003cb8:	3000e4f0 	.word	0x3000e4f0

30003cbc <acoral_intr_sys_init>:

/*===========================                                                                                                                 
*Initialize the interrupt      
*中断初始化函数
*===========================*/
void acoral_intr_sys_init(){
30003cbc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003cc0:	e24dd00c 	sub	sp, sp, #12
	acoral_u32 i;
	acoral_vector index;
      
    /*关中断*/
	acoral_intr_disable();
30003cc4:	ebfff683 	bl	300016d8 <HAL_INTR_DISABLE>

    /*中断嵌套标志初始化*/
    HAL_INTR_NESTING_INIT();
30003cc8:	ebfff693 	bl	3000171c <hal_intr_nesting_init_comm>

    /*中断底层初始化函数*/
	HAL_INTR_INIT();
30003ccc:	ebfff2a5 	bl	30000768 <hal_intr_init>


    /*对于每个中断，设置默认的服务处理程序，然后屏蔽该中断*/
	for(i=HAL_INTR_MIN;i<=HAL_INTR_MAX;i++){
30003cd0:	e3a03000 	mov	r3, #0
30003cd4:	e58d3000 	str	r3, [sp]
30003cd8:	ea00001b 	b	30003d4c <acoral_intr_sys_init+0x90>
		HAL_TRANSLATE_VECTOR(i,index);
30003cdc:	e59d3000 	ldr	r3, [sp]
30003ce0:	e58d3004 	str	r3, [sp, #4]
		intr_table[index].isr=acoral_default_isr;
30003ce4:	e59d2004 	ldr	r2, [sp, #4]
30003ce8:	e59f0074 	ldr	r0, [pc, #116]	; 30003d64 <acoral_intr_sys_init+0xa8>
30003cec:	e3a01008 	mov	r1, #8
30003cf0:	e1a03002 	mov	r3, r2
30003cf4:	e1a03183 	lsl	r3, r3, #3
30003cf8:	e0623003 	rsb	r3, r2, r3
30003cfc:	e1a03103 	lsl	r3, r3, #2
30003d00:	e0833000 	add	r3, r3, r0
30003d04:	e0833001 	add	r3, r3, r1
30003d08:	e59f2058 	ldr	r2, [pc, #88]	; 30003d68 <acoral_intr_sys_init+0xac>
30003d0c:	e5832000 	str	r2, [r3]
		intr_table[index].type=ACORAL_COMM_INTR;
30003d10:	e59d2004 	ldr	r2, [sp, #4]
30003d14:	e59f1048 	ldr	r1, [pc, #72]	; 30003d64 <acoral_intr_sys_init+0xa8>
30003d18:	e1a03002 	mov	r3, r2
30003d1c:	e1a03183 	lsl	r3, r3, #3
30003d20:	e0623003 	rsb	r3, r2, r3
30003d24:	e1a03103 	lsl	r3, r3, #2
30003d28:	e0833001 	add	r3, r3, r1
30003d2c:	e3a02001 	mov	r2, #1
30003d30:	e5c32005 	strb	r2, [r3, #5]
		acoral_intr_mask(i);
30003d34:	e59d3000 	ldr	r3, [sp]
30003d38:	e1a00003 	mov	r0, r3
30003d3c:	eb000078 	bl	30003f24 <acoral_intr_mask>
    /*中断底层初始化函数*/
	HAL_INTR_INIT();


    /*对于每个中断，设置默认的服务处理程序，然后屏蔽该中断*/
	for(i=HAL_INTR_MIN;i<=HAL_INTR_MAX;i++){
30003d40:	e59d3000 	ldr	r3, [sp]
30003d44:	e2833001 	add	r3, r3, #1
30003d48:	e58d3000 	str	r3, [sp]
30003d4c:	e59d3000 	ldr	r3, [sp]
30003d50:	e3530031 	cmp	r3, #49	; 0x31
30003d54:	9affffe0 	bls	30003cdc <acoral_intr_sys_init+0x20>
		HAL_TRANSLATE_VECTOR(i,index);
		intr_table[index].isr=acoral_default_isr;
		intr_table[index].type=ACORAL_COMM_INTR;
		acoral_intr_mask(i);
	}
}
30003d58:	e28dd00c 	add	sp, sp, #12
30003d5c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003d60:	e12fff1e 	bx	lr
30003d64:	3000f620 	.word	0x3000f620
30003d68:	300041b4 	.word	0x300041b4

30003d6c <acoral_intr_attach>:

/*===========================                                                                                                                 
*Binding the isr t0 the Vector      
*将服务函数isr绑定到中断向量Vector
*===========================*/
acoral_32 acoral_intr_attach(acoral_vector vector,void (*isr)(acoral_vector)){
30003d6c:	e24dd010 	sub	sp, sp, #16
30003d70:	e58d0004 	str	r0, [sp, #4]
30003d74:	e58d1000 	str	r1, [sp]
  	acoral_vector index;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003d78:	e59d3004 	ldr	r3, [sp, #4]
30003d7c:	e58d300c 	str	r3, [sp, #12]
	if(intr_table[index].type!=ACORAL_RT_INTR)
30003d80:	e59d200c 	ldr	r2, [sp, #12]
30003d84:	e59f1058 	ldr	r1, [pc, #88]	; 30003de4 <acoral_intr_attach+0x78>
30003d88:	e1a03002 	mov	r3, r2
30003d8c:	e1a03183 	lsl	r3, r3, #3
30003d90:	e0623003 	rsb	r3, r2, r3
30003d94:	e1a03103 	lsl	r3, r3, #2
30003d98:	e0833001 	add	r3, r3, r1
30003d9c:	e5d33005 	ldrb	r3, [r3, #5]
30003da0:	e3530003 	cmp	r3, #3
30003da4:	0a00000a 	beq	30003dd4 <acoral_intr_attach+0x68>
		intr_table[index].isr =isr;
30003da8:	e59d200c 	ldr	r2, [sp, #12]
30003dac:	e59f0030 	ldr	r0, [pc, #48]	; 30003de4 <acoral_intr_attach+0x78>
30003db0:	e3a01008 	mov	r1, #8
30003db4:	e1a03002 	mov	r3, r2
30003db8:	e1a03183 	lsl	r3, r3, #3
30003dbc:	e0623003 	rsb	r3, r2, r3
30003dc0:	e1a03103 	lsl	r3, r3, #2
30003dc4:	e0833000 	add	r3, r3, r0
30003dc8:	e0833001 	add	r3, r3, r1
30003dcc:	e59d2000 	ldr	r2, [sp]
30003dd0:	e5832000 	str	r2, [r3]
	else
		HAL_INTR_ATTACH(vector,isr);
	return 0;
30003dd4:	e3a03000 	mov	r3, #0
}
30003dd8:	e1a00003 	mov	r0, r3
30003ddc:	e28dd010 	add	sp, sp, #16
30003de0:	e12fff1e 	bx	lr
30003de4:	3000f620 	.word	0x3000f620

30003de8 <acoral_intr_detach>:

/*===========================                                                                                                                 
*Detach the  isr from the Vector      
*将中断的服务函数设为默认的
*===========================*/
acoral_32 acoral_intr_detach(acoral_vector vector){
30003de8:	e24dd010 	sub	sp, sp, #16
30003dec:	e58d0004 	str	r0, [sp, #4]
  	acoral_vector index;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003df0:	e59d3004 	ldr	r3, [sp, #4]
30003df4:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].isr =acoral_default_isr;
30003df8:	e59d200c 	ldr	r2, [sp, #12]
30003dfc:	e59f0030 	ldr	r0, [pc, #48]	; 30003e34 <acoral_intr_detach+0x4c>
30003e00:	e3a01008 	mov	r1, #8
30003e04:	e1a03002 	mov	r3, r2
30003e08:	e1a03183 	lsl	r3, r3, #3
30003e0c:	e0623003 	rsb	r3, r2, r3
30003e10:	e1a03103 	lsl	r3, r3, #2
30003e14:	e0833000 	add	r3, r3, r0
30003e18:	e0833001 	add	r3, r3, r1
30003e1c:	e59f2014 	ldr	r2, [pc, #20]	; 30003e38 <acoral_intr_detach+0x50>
30003e20:	e5832000 	str	r2, [r3]
	return 0;
30003e24:	e3a03000 	mov	r3, #0
}
30003e28:	e1a00003 	mov	r0, r3
30003e2c:	e28dd010 	add	sp, sp, #16
30003e30:	e12fff1e 	bx	lr
30003e34:	3000f620 	.word	0x3000f620
30003e38:	300041b4 	.word	0x300041b4

30003e3c <acoral_intr_unmask>:

/*===========================                                                                                                                 
*Enable the interrupt      
*使能中断
*===========================*/
void acoral_intr_unmask(acoral_vector vector){
30003e3c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003e40:	e24dd014 	sub	sp, sp, #20
30003e44:	e58d0004 	str	r0, [sp, #4]
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
30003e48:	e59d3004 	ldr	r3, [sp, #4]
30003e4c:	e3530031 	cmp	r3, #49	; 0x31
30003e50:	ca00002e 	bgt	30003f10 <acoral_intr_unmask+0xd4>
		return;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003e54:	e59d3004 	ldr	r3, [sp, #4]
30003e58:	e58d300c 	str	r3, [sp, #12]

        /*如果中断的使能函数不为空，就调用该使能函数*/
	if(intr_table[index].unmask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
30003e5c:	e59d200c 	ldr	r2, [sp, #12]
30003e60:	e59f00b8 	ldr	r0, [pc, #184]	; 30003f20 <acoral_intr_unmask+0xe4>
30003e64:	e3a01018 	mov	r1, #24
30003e68:	e1a03002 	mov	r3, r2
30003e6c:	e1a03183 	lsl	r3, r3, #3
30003e70:	e0623003 	rsb	r3, r2, r3
30003e74:	e1a03103 	lsl	r3, r3, #2
30003e78:	e0833000 	add	r3, r3, r0
30003e7c:	e0833001 	add	r3, r3, r1
30003e80:	e5933000 	ldr	r3, [r3]
30003e84:	e3530000 	cmp	r3, #0
30003e88:	0a000021 	beq	30003f14 <acoral_intr_unmask+0xd8>
30003e8c:	e59d200c 	ldr	r2, [sp, #12]
30003e90:	e59f1088 	ldr	r1, [pc, #136]	; 30003f20 <acoral_intr_unmask+0xe4>
30003e94:	e1a03002 	mov	r3, r2
30003e98:	e1a03183 	lsl	r3, r3, #3
30003e9c:	e0623003 	rsb	r3, r2, r3
30003ea0:	e1a03103 	lsl	r3, r3, #2
30003ea4:	e0833001 	add	r3, r3, r1
30003ea8:	e5d33005 	ldrb	r3, [r3, #5]
30003eac:	e3530001 	cmp	r3, #1
30003eb0:	1a000017 	bne	30003f14 <acoral_intr_unmask+0xd8>
		intr_table[index].unmask(vector);
30003eb4:	e59d200c 	ldr	r2, [sp, #12]
30003eb8:	e59f0060 	ldr	r0, [pc, #96]	; 30003f20 <acoral_intr_unmask+0xe4>
30003ebc:	e3a01018 	mov	r1, #24
30003ec0:	e1a03002 	mov	r3, r2
30003ec4:	e1a03183 	lsl	r3, r3, #3
30003ec8:	e0623003 	rsb	r3, r2, r3
30003ecc:	e1a03103 	lsl	r3, r3, #2
30003ed0:	e0833000 	add	r3, r3, r0
30003ed4:	e0833001 	add	r3, r3, r1
30003ed8:	e5933000 	ldr	r3, [r3]
30003edc:	e59d0004 	ldr	r0, [sp, #4]
30003ee0:	e1a0e00f 	mov	lr, pc
30003ee4:	e12fff13 	bx	r3
		/*将中断状态设为真*/
		intr_table[index].state=true;
30003ee8:	e59d200c 	ldr	r2, [sp, #12]
30003eec:	e59f102c 	ldr	r1, [pc, #44]	; 30003f20 <acoral_intr_unmask+0xe4>
30003ef0:	e1a03002 	mov	r3, r2
30003ef4:	e1a03183 	lsl	r3, r3, #3
30003ef8:	e0623003 	rsb	r3, r2, r3
30003efc:	e1a03103 	lsl	r3, r3, #2
30003f00:	e0833001 	add	r3, r3, r1
30003f04:	e3a02001 	mov	r2, #1
30003f08:	e5c32004 	strb	r2, [r3, #4]
30003f0c:	ea000000 	b	30003f14 <acoral_intr_unmask+0xd8>
*使能中断
*===========================*/
void acoral_intr_unmask(acoral_vector vector){
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
		return;
30003f10:	e1a00000 	nop			; (mov r0, r0)
	if(intr_table[index].unmask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
		intr_table[index].unmask(vector);
		/*将中断状态设为真*/
		intr_table[index].state=true;
	}
}
30003f14:	e28dd014 	add	sp, sp, #20
30003f18:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003f1c:	e12fff1e 	bx	lr
30003f20:	3000f620 	.word	0x3000f620

30003f24 <acoral_intr_mask>:

/*===========================                                                                                                                 
*Disable the interrupt       
*除能中断
*===========================*/
void acoral_intr_mask(acoral_vector vector){
30003f24:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003f28:	e24dd014 	sub	sp, sp, #20
30003f2c:	e58d0004 	str	r0, [sp, #4]
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
30003f30:	e59d3004 	ldr	r3, [sp, #4]
30003f34:	e3530031 	cmp	r3, #49	; 0x31
30003f38:	ca00002e 	bgt	30003ff8 <acoral_intr_mask+0xd4>
		return;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003f3c:	e59d3004 	ldr	r3, [sp, #4]
30003f40:	e58d300c 	str	r3, [sp, #12]

        /*如果中断的除能函数不为空，就调用该除能函数 */
	if(intr_table[index].mask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
30003f44:	e59d200c 	ldr	r2, [sp, #12]
30003f48:	e59f00b8 	ldr	r0, [pc, #184]	; 30004008 <acoral_intr_mask+0xe4>
30003f4c:	e3a01014 	mov	r1, #20
30003f50:	e1a03002 	mov	r3, r2
30003f54:	e1a03183 	lsl	r3, r3, #3
30003f58:	e0623003 	rsb	r3, r2, r3
30003f5c:	e1a03103 	lsl	r3, r3, #2
30003f60:	e0833000 	add	r3, r3, r0
30003f64:	e0833001 	add	r3, r3, r1
30003f68:	e5933000 	ldr	r3, [r3]
30003f6c:	e3530000 	cmp	r3, #0
30003f70:	0a000021 	beq	30003ffc <acoral_intr_mask+0xd8>
30003f74:	e59d200c 	ldr	r2, [sp, #12]
30003f78:	e59f1088 	ldr	r1, [pc, #136]	; 30004008 <acoral_intr_mask+0xe4>
30003f7c:	e1a03002 	mov	r3, r2
30003f80:	e1a03183 	lsl	r3, r3, #3
30003f84:	e0623003 	rsb	r3, r2, r3
30003f88:	e1a03103 	lsl	r3, r3, #2
30003f8c:	e0833001 	add	r3, r3, r1
30003f90:	e5d33005 	ldrb	r3, [r3, #5]
30003f94:	e3530001 	cmp	r3, #1
30003f98:	1a000017 	bne	30003ffc <acoral_intr_mask+0xd8>
		intr_table[index].mask(vector);
30003f9c:	e59d200c 	ldr	r2, [sp, #12]
30003fa0:	e59f0060 	ldr	r0, [pc, #96]	; 30004008 <acoral_intr_mask+0xe4>
30003fa4:	e3a01014 	mov	r1, #20
30003fa8:	e1a03002 	mov	r3, r2
30003fac:	e1a03183 	lsl	r3, r3, #3
30003fb0:	e0623003 	rsb	r3, r2, r3
30003fb4:	e1a03103 	lsl	r3, r3, #2
30003fb8:	e0833000 	add	r3, r3, r0
30003fbc:	e0833001 	add	r3, r3, r1
30003fc0:	e5933000 	ldr	r3, [r3]
30003fc4:	e59d0004 	ldr	r0, [sp, #4]
30003fc8:	e1a0e00f 	mov	lr, pc
30003fcc:	e12fff13 	bx	r3
		/*将中断状态设为假    */
		intr_table[index].state=false;
30003fd0:	e59d200c 	ldr	r2, [sp, #12]
30003fd4:	e59f102c 	ldr	r1, [pc, #44]	; 30004008 <acoral_intr_mask+0xe4>
30003fd8:	e1a03002 	mov	r3, r2
30003fdc:	e1a03183 	lsl	r3, r3, #3
30003fe0:	e0623003 	rsb	r3, r2, r3
30003fe4:	e1a03103 	lsl	r3, r3, #2
30003fe8:	e0833001 	add	r3, r3, r1
30003fec:	e3a02000 	mov	r2, #0
30003ff0:	e5c32004 	strb	r2, [r3, #4]
30003ff4:	ea000000 	b	30003ffc <acoral_intr_mask+0xd8>
*除能中断
*===========================*/
void acoral_intr_mask(acoral_vector vector){
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
		return;
30003ff8:	e1a00000 	nop			; (mov r0, r0)
	if(intr_table[index].mask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
		intr_table[index].mask(vector);
		/*将中断状态设为假    */
		intr_table[index].state=false;
	}
}
30003ffc:	e28dd014 	add	sp, sp, #20
30004000:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004004:	e12fff1e 	bx	lr
30004008:	3000f620 	.word	0x3000f620

3000400c <acoral_intr_entry>:

/*===========================                                                                                                                 
*the commen isr of vector      
*中断公共服务入口函数
*===========================*/
void acoral_intr_entry(acoral_vector vector){
3000400c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004010:	e24dd014 	sub	sp, sp, #20
30004014:	e58d0004 	str	r0, [sp, #4]
	acoral_vector index;
#ifdef CFG_DEBUG
  	acoral_print("isr in cpu:%d\n",acoral_current_cpu);
#endif
   	HAL_TRANSLATE_VECTOR(vector,index);
30004018:	e59d3004 	ldr	r3, [sp, #4]
3000401c:	e58d300c 	str	r3, [sp, #12]
	acoral_intr_nesting_inc();
30004020:	ebfff5e4 	bl	300017b8 <hal_intr_nesting_inc_comm>
	if(intr_table[index].type==ACORAL_EXPERT_INTR){
30004024:	e59d200c 	ldr	r2, [sp, #12]
30004028:	e59f1180 	ldr	r1, [pc, #384]	; 300041b0 <acoral_intr_entry+0x1a4>
3000402c:	e1a03002 	mov	r3, r2
30004030:	e1a03183 	lsl	r3, r3, #3
30004034:	e0623003 	rsb	r3, r2, r3
30004038:	e1a03103 	lsl	r3, r3, #2
3000403c:	e0833001 	add	r3, r3, r1
30004040:	e5d33005 	ldrb	r3, [r3, #5]
30004044:	e3530002 	cmp	r3, #2
30004048:	1a00000e 	bne	30004088 <acoral_intr_entry+0x7c>
		intr_table[index].isr(vector);
3000404c:	e59d200c 	ldr	r2, [sp, #12]
30004050:	e59f0158 	ldr	r0, [pc, #344]	; 300041b0 <acoral_intr_entry+0x1a4>
30004054:	e3a01008 	mov	r1, #8
30004058:	e1a03002 	mov	r3, r2
3000405c:	e1a03183 	lsl	r3, r3, #3
30004060:	e0623003 	rsb	r3, r2, r3
30004064:	e1a03103 	lsl	r3, r3, #2
30004068:	e0833000 	add	r3, r3, r0
3000406c:	e0833001 	add	r3, r3, r1
30004070:	e5933000 	ldr	r3, [r3]
30004074:	e59d0004 	ldr	r0, [sp, #4]
30004078:	e1a0e00f 	mov	lr, pc
3000407c:	e12fff13 	bx	r3
		acoral_intr_disable();
30004080:	ebfff594 	bl	300016d8 <HAL_INTR_DISABLE>
30004084:	ea000044 	b	3000419c <acoral_intr_entry+0x190>
	}else{
		/*这个之前都要是关中断的，调用中断进入函数*/
		if(intr_table[index].enter!=NULL)
30004088:	e59d200c 	ldr	r2, [sp, #12]
3000408c:	e59f011c 	ldr	r0, [pc, #284]	; 300041b0 <acoral_intr_entry+0x1a4>
30004090:	e3a0100c 	mov	r1, #12
30004094:	e1a03002 	mov	r3, r2
30004098:	e1a03183 	lsl	r3, r3, #3
3000409c:	e0623003 	rsb	r3, r2, r3
300040a0:	e1a03103 	lsl	r3, r3, #2
300040a4:	e0833000 	add	r3, r3, r0
300040a8:	e0833001 	add	r3, r3, r1
300040ac:	e5933000 	ldr	r3, [r3]
300040b0:	e3530000 	cmp	r3, #0
300040b4:	0a00000c 	beq	300040ec <acoral_intr_entry+0xe0>
			intr_table[index].enter(vector);
300040b8:	e59d200c 	ldr	r2, [sp, #12]
300040bc:	e59f00ec 	ldr	r0, [pc, #236]	; 300041b0 <acoral_intr_entry+0x1a4>
300040c0:	e3a0100c 	mov	r1, #12
300040c4:	e1a03002 	mov	r3, r2
300040c8:	e1a03183 	lsl	r3, r3, #3
300040cc:	e0623003 	rsb	r3, r2, r3
300040d0:	e1a03103 	lsl	r3, r3, #2
300040d4:	e0833000 	add	r3, r3, r0
300040d8:	e0833001 	add	r3, r3, r1
300040dc:	e5933000 	ldr	r3, [r3]
300040e0:	e59d0004 	ldr	r0, [sp, #4]
300040e4:	e1a0e00f 	mov	lr, pc
300040e8:	e12fff13 	bx	r3
	
		acoral_intr_mask(vector);	
300040ec:	e59d0004 	ldr	r0, [sp, #4]
300040f0:	ebffff8b 	bl	30003f24 <acoral_intr_mask>
		/*开中断*/
		acoral_intr_enable();
300040f4:	ebfff573 	bl	300016c8 <HAL_INTR_ENABLE>

		/*调用该中断的服务处理函数*/
		intr_table[index].isr(vector);
300040f8:	e59d200c 	ldr	r2, [sp, #12]
300040fc:	e59f00ac 	ldr	r0, [pc, #172]	; 300041b0 <acoral_intr_entry+0x1a4>
30004100:	e3a01008 	mov	r1, #8
30004104:	e1a03002 	mov	r3, r2
30004108:	e1a03183 	lsl	r3, r3, #3
3000410c:	e0623003 	rsb	r3, r2, r3
30004110:	e1a03103 	lsl	r3, r3, #2
30004114:	e0833000 	add	r3, r3, r0
30004118:	e0833001 	add	r3, r3, r1
3000411c:	e5933000 	ldr	r3, [r3]
30004120:	e59d0004 	ldr	r0, [sp, #4]
30004124:	e1a0e00f 	mov	lr, pc
30004128:	e12fff13 	bx	r3
	
		/*关中断*/
		acoral_intr_disable();
3000412c:	ebfff569 	bl	300016d8 <HAL_INTR_DISABLE>
	
		acoral_intr_unmask(vector);	
30004130:	e59d0004 	ldr	r0, [sp, #4]
30004134:	ebffff40 	bl	30003e3c <acoral_intr_unmask>
		/*调用中断退出函数*/
		if(intr_table[index].exit!=NULL)
30004138:	e59d200c 	ldr	r2, [sp, #12]
3000413c:	e59f006c 	ldr	r0, [pc, #108]	; 300041b0 <acoral_intr_entry+0x1a4>
30004140:	e3a01010 	mov	r1, #16
30004144:	e1a03002 	mov	r3, r2
30004148:	e1a03183 	lsl	r3, r3, #3
3000414c:	e0623003 	rsb	r3, r2, r3
30004150:	e1a03103 	lsl	r3, r3, #2
30004154:	e0833000 	add	r3, r3, r0
30004158:	e0833001 	add	r3, r3, r1
3000415c:	e5933000 	ldr	r3, [r3]
30004160:	e3530000 	cmp	r3, #0
30004164:	0a00000c 	beq	3000419c <acoral_intr_entry+0x190>
			intr_table[index].exit(vector);
30004168:	e59d200c 	ldr	r2, [sp, #12]
3000416c:	e59f003c 	ldr	r0, [pc, #60]	; 300041b0 <acoral_intr_entry+0x1a4>
30004170:	e3a01010 	mov	r1, #16
30004174:	e1a03002 	mov	r3, r2
30004178:	e1a03183 	lsl	r3, r3, #3
3000417c:	e0623003 	rsb	r3, r2, r3
30004180:	e1a03103 	lsl	r3, r3, #2
30004184:	e0833000 	add	r3, r3, r0
30004188:	e0833001 	add	r3, r3, r1
3000418c:	e5933000 	ldr	r3, [r3]
30004190:	e59d0004 	ldr	r0, [sp, #4]
30004194:	e1a0e00f 	mov	lr, pc
30004198:	e12fff13 	bx	r3
	}
	acoral_intr_nesting_dec();
3000419c:	ebfff574 	bl	30001774 <hal_intr_nesting_dec_comm>
	acoral_intr_exit();
300041a0:	eb000007 	bl	300041c4 <acoral_intr_exit>
}
300041a4:	e28dd014 	add	sp, sp, #20
300041a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300041ac:	e12fff1e 	bx	lr
300041b0:	3000f620 	.word	0x3000f620

300041b4 <acoral_default_isr>:

/*===========================                                                                                                                 
*The default isr      
*默认中断处理程序
*===========================*/
void acoral_default_isr(acoral_vector vector){
300041b4:	e24dd008 	sub	sp, sp, #8
300041b8:	e58d0004 	str	r0, [sp, #4]
  	acoral_printdbg("in Default interrupt route\n");
}
300041bc:	e28dd008 	add	sp, sp, #8
300041c0:	e12fff1e 	bx	lr

300041c4 <acoral_intr_exit>:

/*===========================                                                                                                                 
*The exit function of the vector      
*中断退出函数
*===========================*/
void acoral_intr_exit(){
300041c4:	e92d4008 	push	{r3, lr}
      	if(!acoral_need_sched)
300041c8:	e59f3064 	ldr	r3, [pc, #100]	; 30004234 <acoral_intr_exit+0x70>
300041cc:	e5d33000 	ldrb	r3, [r3]
300041d0:	e3530000 	cmp	r3, #0
300041d4:	0a00000d 	beq	30004210 <acoral_intr_exit+0x4c>
	    return;

	if(acoral_intr_nesting)
300041d8:	ebfff560 	bl	30001760 <hal_get_intr_nesting_comm>
300041dc:	e1a03000 	mov	r3, r0
300041e0:	e3530000 	cmp	r3, #0
300041e4:	1a00000b 	bne	30004218 <acoral_intr_exit+0x54>
	    return;

	if(acoral_sched_is_lock)
300041e8:	e59f3048 	ldr	r3, [pc, #72]	; 30004238 <acoral_intr_exit+0x74>
300041ec:	e5d33000 	ldrb	r3, [r3]
300041f0:	e3530000 	cmp	r3, #0
300041f4:	1a000009 	bne	30004220 <acoral_intr_exit+0x5c>
	    return;

	if (!acoral_start_sched)
300041f8:	e59f303c 	ldr	r3, [pc, #60]	; 3000423c <acoral_intr_exit+0x78>
300041fc:	e5933000 	ldr	r3, [r3]
30004200:	e3530000 	cmp	r3, #0
30004204:	0a000007 	beq	30004228 <acoral_intr_exit+0x64>
	    return;
      
      /*如果需要调度，则调用此函数*/
	HAL_INTR_EXIT_BRIDGE();
30004208:	ebfff57c 	bl	30001800 <hal_intr_exit_bridge_comm>
3000420c:	ea000006 	b	3000422c <acoral_intr_exit+0x68>
*The exit function of the vector      
*中断退出函数
*===========================*/
void acoral_intr_exit(){
      	if(!acoral_need_sched)
	    return;
30004210:	e1a00000 	nop			; (mov r0, r0)
30004214:	ea000004 	b	3000422c <acoral_intr_exit+0x68>

	if(acoral_intr_nesting)
	    return;
30004218:	e1a00000 	nop			; (mov r0, r0)
3000421c:	ea000002 	b	3000422c <acoral_intr_exit+0x68>

	if(acoral_sched_is_lock)
	    return;
30004220:	e1a00000 	nop			; (mov r0, r0)
30004224:	ea000000 	b	3000422c <acoral_intr_exit+0x68>

	if (!acoral_start_sched)
	    return;
30004228:	e1a00000 	nop			; (mov r0, r0)
      
      /*如果需要调度，则调用此函数*/
	HAL_INTR_EXIT_BRIDGE();
}
3000422c:	e8bd4008 	pop	{r3, lr}
30004230:	e12fff1e 	bx	lr
30004234:	30010634 	.word	0x30010634
30004238:	3000f61c 	.word	0x3000f61c
3000423c:	3000ed14 	.word	0x3000ed14

30004240 <acoral_set_intr_enter>:

/*===========================                                                                                                                 
*Set the enter function of the vector      
*设置中断进入函数为isr
*===========================*/
void acoral_set_intr_enter(acoral_vector vector,void (*enter)(acoral_vector)){
30004240:	e24dd010 	sub	sp, sp, #16
30004244:	e58d0004 	str	r0, [sp, #4]
30004248:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
3000424c:	e59d3004 	ldr	r3, [sp, #4]
30004250:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].enter=enter;
30004254:	e59d200c 	ldr	r2, [sp, #12]
30004258:	e59f0028 	ldr	r0, [pc, #40]	; 30004288 <acoral_set_intr_enter+0x48>
3000425c:	e3a0100c 	mov	r1, #12
30004260:	e1a03002 	mov	r3, r2
30004264:	e1a03183 	lsl	r3, r3, #3
30004268:	e0623003 	rsb	r3, r2, r3
3000426c:	e1a03103 	lsl	r3, r3, #2
30004270:	e0833000 	add	r3, r3, r0
30004274:	e0833001 	add	r3, r3, r1
30004278:	e59d2000 	ldr	r2, [sp]
3000427c:	e5832000 	str	r2, [r3]
}
30004280:	e28dd010 	add	sp, sp, #16
30004284:	e12fff1e 	bx	lr
30004288:	3000f620 	.word	0x3000f620

3000428c <acoral_set_intr_exit>:

/*===========================                                                                                                                 
*Set the exit  function of the vector 
*设置中断退出函数为isr
*===========================*/
void acoral_set_intr_exit(acoral_vector vector,void (*exit)(acoral_vector)){
3000428c:	e24dd010 	sub	sp, sp, #16
30004290:	e58d0004 	str	r0, [sp, #4]
30004294:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
30004298:	e59d3004 	ldr	r3, [sp, #4]
3000429c:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].exit=exit;
300042a0:	e59d200c 	ldr	r2, [sp, #12]
300042a4:	e59f0028 	ldr	r0, [pc, #40]	; 300042d4 <acoral_set_intr_exit+0x48>
300042a8:	e3a01010 	mov	r1, #16
300042ac:	e1a03002 	mov	r3, r2
300042b0:	e1a03183 	lsl	r3, r3, #3
300042b4:	e0623003 	rsb	r3, r2, r3
300042b8:	e1a03103 	lsl	r3, r3, #2
300042bc:	e0833000 	add	r3, r3, r0
300042c0:	e0833001 	add	r3, r3, r1
300042c4:	e59d2000 	ldr	r2, [sp]
300042c8:	e5832000 	str	r2, [r3]
}
300042cc:	e28dd010 	add	sp, sp, #16
300042d0:	e12fff1e 	bx	lr
300042d4:	3000f620 	.word	0x3000f620

300042d8 <acoral_set_intr_mask>:

/*===========================                                                                                                                 
*Set the mask  function of the vector 
*设置中断屏蔽函数为isr
*===========================*/
void acoral_set_intr_mask(acoral_vector vector,void (*mask)(acoral_vector)){
300042d8:	e24dd010 	sub	sp, sp, #16
300042dc:	e58d0004 	str	r0, [sp, #4]
300042e0:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
300042e4:	e59d3004 	ldr	r3, [sp, #4]
300042e8:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].mask=mask;
300042ec:	e59d200c 	ldr	r2, [sp, #12]
300042f0:	e59f0028 	ldr	r0, [pc, #40]	; 30004320 <acoral_set_intr_mask+0x48>
300042f4:	e3a01014 	mov	r1, #20
300042f8:	e1a03002 	mov	r3, r2
300042fc:	e1a03183 	lsl	r3, r3, #3
30004300:	e0623003 	rsb	r3, r2, r3
30004304:	e1a03103 	lsl	r3, r3, #2
30004308:	e0833000 	add	r3, r3, r0
3000430c:	e0833001 	add	r3, r3, r1
30004310:	e59d2000 	ldr	r2, [sp]
30004314:	e5832000 	str	r2, [r3]
}
30004318:	e28dd010 	add	sp, sp, #16
3000431c:	e12fff1e 	bx	lr
30004320:	3000f620 	.word	0x3000f620

30004324 <acoral_set_intr_unmask>:

/*===========================                                                                                                                 
*Set the unmask function of the vector 
*设置中断使能函数为isr
*===========================*/
void acoral_set_intr_unmask(acoral_vector vector,void (*unmask)(acoral_vector)){
30004324:	e24dd010 	sub	sp, sp, #16
30004328:	e58d0004 	str	r0, [sp, #4]
3000432c:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
30004330:	e59d3004 	ldr	r3, [sp, #4]
30004334:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].unmask=unmask;
30004338:	e59d200c 	ldr	r2, [sp, #12]
3000433c:	e59f0028 	ldr	r0, [pc, #40]	; 3000436c <acoral_set_intr_unmask+0x48>
30004340:	e3a01018 	mov	r1, #24
30004344:	e1a03002 	mov	r3, r2
30004348:	e1a03183 	lsl	r3, r3, #3
3000434c:	e0623003 	rsb	r3, r2, r3
30004350:	e1a03103 	lsl	r3, r3, #2
30004354:	e0833000 	add	r3, r3, r0
30004358:	e0833001 	add	r3, r3, r1
3000435c:	e59d2000 	ldr	r2, [sp]
30004360:	e5832000 	str	r2, [r3]
}
30004364:	e28dd010 	add	sp, sp, #16
30004368:	e12fff1e 	bx	lr
3000436c:	3000f620 	.word	0x3000f620

30004370 <acoral_intr_set_type>:

/*===========================                                                                                                                 
*Set interrupt type
*设置中断类型
*===========================*/
void acoral_intr_set_type(acoral_vector vector,acoral_u8 type){
30004370:	e24dd010 	sub	sp, sp, #16
30004374:	e58d0004 	str	r0, [sp, #4]
30004378:	e1a03001 	mov	r3, r1
3000437c:	e5cd3003 	strb	r3, [sp, #3]
  	acoral_vector index;
   	HAL_TRANSLATE_VECTOR(vector,index);
30004380:	e59d3004 	ldr	r3, [sp, #4]
30004384:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].type =type;
30004388:	e59d200c 	ldr	r2, [sp, #12]
3000438c:	e59f1020 	ldr	r1, [pc, #32]	; 300043b4 <acoral_intr_set_type+0x44>
30004390:	e1a03002 	mov	r3, r2
30004394:	e1a03183 	lsl	r3, r3, #3
30004398:	e0623003 	rsb	r3, r2, r3
3000439c:	e1a03103 	lsl	r3, r3, #2
300043a0:	e0833001 	add	r3, r3, r1
300043a4:	e5dd2003 	ldrb	r2, [sp, #3]
300043a8:	e5c32005 	strb	r2, [r3, #5]
}
300043ac:	e28dd010 	add	sp, sp, #16
300043b0:	e12fff1e 	bx	lr
300043b4:	3000f620 	.word	0x3000f620

300043b8 <acoral_fault_entry>:
/*===========================                                                                                                                 
*     exception err output
*        异常错误输出
*===========================*/

void acoral_fault_entry(acoral_u32 lr,acoral_u32 *stack){
300043b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300043bc:	e24dd00c 	sub	sp, sp, #12
300043c0:	e58d0004 	str	r0, [sp, #4]
300043c4:	e58d1000 	str	r1, [sp]
	acoral_intr_disable();
300043c8:	ebfff4c2 	bl	300016d8 <HAL_INTR_DISABLE>
	if(!acoral_start_sched)
300043cc:	e59f30c4 	ldr	r3, [pc, #196]	; 30004498 <acoral_fault_entry+0xe0>
300043d0:	e5933000 	ldr	r3, [r3]
300043d4:	e3530000 	cmp	r3, #0
300043d8:	1a000000 	bne	300043e0 <acoral_fault_entry+0x28>
		while(1);	
300043dc:	eafffffe 	b	300043dc <acoral_fault_entry+0x24>
	acoral_printerr("Exception occur\n");
300043e0:	e59f00b4 	ldr	r0, [pc, #180]	; 3000449c <acoral_fault_entry+0xe4>
300043e4:	eb001c0e 	bl	3000b424 <acoral_print>
	acoral_printerr("******************\n");
300043e8:	e59f00b0 	ldr	r0, [pc, #176]	; 300044a0 <acoral_fault_entry+0xe8>
300043ec:	eb001c0c 	bl	3000b424 <acoral_print>
	acoral_printerr("CPU:%d\n",acoral_current_cpu);;
300043f0:	e59f00ac 	ldr	r0, [pc, #172]	; 300044a4 <acoral_fault_entry+0xec>
300043f4:	e3a01000 	mov	r1, #0
300043f8:	eb001c09 	bl	3000b424 <acoral_print>
	acoral_printerr("Thread name:%s\n",acoral_cur_thread->name);;
300043fc:	e59f30a4 	ldr	r3, [pc, #164]	; 300044a8 <acoral_fault_entry+0xf0>
30004400:	e5933000 	ldr	r3, [r3]
30004404:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30004408:	e59f009c 	ldr	r0, [pc, #156]	; 300044ac <acoral_fault_entry+0xf4>
3000440c:	e1a01003 	mov	r1, r3
30004410:	eb001c03 	bl	3000b424 <acoral_print>
	acoral_printerr("Thread prio:%d\n",acoral_cur_thread->prio);;
30004414:	e59f308c 	ldr	r3, [pc, #140]	; 300044a8 <acoral_fault_entry+0xf0>
30004418:	e5933000 	ldr	r3, [r3]
3000441c:	e5d33005 	ldrb	r3, [r3, #5]
30004420:	e59f0088 	ldr	r0, [pc, #136]	; 300044b0 <acoral_fault_entry+0xf8>
30004424:	e1a01003 	mov	r1, r3
30004428:	eb001bfd 	bl	3000b424 <acoral_print>
	acoral_printerr("Thread stack_size:%d\n",acoral_cur_thread->stack_size);;
3000442c:	e59f3074 	ldr	r3, [pc, #116]	; 300044a8 <acoral_fault_entry+0xf0>
30004430:	e5933000 	ldr	r3, [r3]
30004434:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
30004438:	e59f0074 	ldr	r0, [pc, #116]	; 300044b4 <acoral_fault_entry+0xfc>
3000443c:	e1a01003 	mov	r1, r3
30004440:	eb001bf7 	bl	3000b424 <acoral_print>
	acoral_printerr("Thread stack_buttom:0x%x\n",acoral_cur_thread->stack_buttom);;
30004444:	e59f305c 	ldr	r3, [pc, #92]	; 300044a8 <acoral_fault_entry+0xf0>
30004448:	e5933000 	ldr	r3, [r3]
3000444c:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30004450:	e59f0060 	ldr	r0, [pc, #96]	; 300044b8 <acoral_fault_entry+0x100>
30004454:	e1a01003 	mov	r1, r3
30004458:	eb001bf1 	bl	3000b424 <acoral_print>
	acoral_printerr("Thread stack:0x%x\n",acoral_cur_thread->stack);;
3000445c:	e59f3044 	ldr	r3, [pc, #68]	; 300044a8 <acoral_fault_entry+0xf0>
30004460:	e5933000 	ldr	r3, [r3]
30004464:	e5933034 	ldr	r3, [r3, #52]	; 0x34
30004468:	e59f004c 	ldr	r0, [pc, #76]	; 300044bc <acoral_fault_entry+0x104>
3000446c:	e1a01003 	mov	r1, r3
30004470:	eb001beb 	bl	3000b424 <acoral_print>
	acoral_printerr("Pc:0x%x\n",lr);
30004474:	e59f0044 	ldr	r0, [pc, #68]	; 300044c0 <acoral_fault_entry+0x108>
30004478:	e59d1004 	ldr	r1, [sp, #4]
3000447c:	eb001be8 	bl	3000b424 <acoral_print>
	acoral_printerr("Stack:0x%x\n",stack);
30004480:	e59f003c 	ldr	r0, [pc, #60]	; 300044c4 <acoral_fault_entry+0x10c>
30004484:	e59d1000 	ldr	r1, [sp]
30004488:	eb001be5 	bl	3000b424 <acoral_print>
	acoral_printerr("******************\n");
3000448c:	e59f000c 	ldr	r0, [pc, #12]	; 300044a0 <acoral_fault_entry+0xe8>
30004490:	eb001be3 	bl	3000b424 <acoral_print>
	while(1);
30004494:	eafffffe 	b	30004494 <acoral_fault_entry+0xdc>
30004498:	3000ed14 	.word	0x3000ed14
3000449c:	3000e504 	.word	0x3000e504
300044a0:	3000e518 	.word	0x3000e518
300044a4:	3000e52c 	.word	0x3000e52c
300044a8:	30010630 	.word	0x30010630
300044ac:	3000e534 	.word	0x3000e534
300044b0:	3000e544 	.word	0x3000e544
300044b4:	3000e554 	.word	0x3000e554
300044b8:	3000e56c 	.word	0x3000e56c
300044bc:	3000e588 	.word	0x3000e588
300044c0:	3000e59c 	.word	0x3000e59c
300044c4:	3000e5a8 	.word	0x3000e5a8

300044c8 <acoral_time_sys_init>:
/*  pegasus   0719*/
/*----------------*/
acoral_queue_t timeout_queue;
static acoral_u32 ticks;
void acoral_time_sys_init(){
  	acoral_init_list(&time_delay_queue.head);
300044c8:	e59f302c 	ldr	r3, [pc, #44]	; 300044fc <acoral_time_sys_init+0x34>
300044cc:	e59f2028 	ldr	r2, [pc, #40]	; 300044fc <acoral_time_sys_init+0x34>
300044d0:	e5832000 	str	r2, [r3]
300044d4:	e59f3020 	ldr	r3, [pc, #32]	; 300044fc <acoral_time_sys_init+0x34>
300044d8:	e59f201c 	ldr	r2, [pc, #28]	; 300044fc <acoral_time_sys_init+0x34>
300044dc:	e5832004 	str	r2, [r3, #4]

	/*---------------*/
	/*  新增延时初始化 timeout_queue*/
	/*  pegasus   0719*/
	/*---------------*/
	acoral_init_list(&timeout_queue.head);
300044e0:	e59f3018 	ldr	r3, [pc, #24]	; 30004500 <acoral_time_sys_init+0x38>
300044e4:	e59f2014 	ldr	r2, [pc, #20]	; 30004500 <acoral_time_sys_init+0x38>
300044e8:	e5832000 	str	r2, [r3]
300044ec:	e59f300c 	ldr	r3, [pc, #12]	; 30004500 <acoral_time_sys_init+0x38>
300044f0:	e59f2008 	ldr	r2, [pc, #8]	; 30004500 <acoral_time_sys_init+0x38>
300044f4:	e5832004 	str	r2, [r3, #4]
	acoral_spin_init(&timeout_queue.head.lock);
}
300044f8:	e12fff1e 	bx	lr
300044fc:	300105a0 	.word	0x300105a0
30004500:	3001061c 	.word	0x3001061c

30004504 <acoral_get_ticks>:


acoral_time acoral_get_ticks(){
	return ticks;
30004504:	e59f3008 	ldr	r3, [pc, #8]	; 30004514 <acoral_get_ticks+0x10>
30004508:	e5933000 	ldr	r3, [r3]
}
3000450c:	e1a00003 	mov	r0, r3
30004510:	e12fff1e 	bx	lr
30004514:	3000f07c 	.word	0x3000f07c

30004518 <acoral_set_ticks>:

void acoral_set_ticks(acoral_time time){
30004518:	e24dd008 	sub	sp, sp, #8
3000451c:	e58d0004 	str	r0, [sp, #4]
  	ticks=time;
30004520:	e59f300c 	ldr	r3, [pc, #12]	; 30004534 <acoral_set_ticks+0x1c>
30004524:	e59d2004 	ldr	r2, [sp, #4]
30004528:	e5832000 	str	r2, [r3]
}
3000452c:	e28dd008 	add	sp, sp, #8
30004530:	e12fff1e 	bx	lr
30004534:	3000f07c 	.word	0x3000f07c

30004538 <acoral_ticks_init>:

void acoral_ticks_init(){
30004538:	e92d4008 	push	{r3, lr}
  	ticks=0;                                      /*初始化滴答时钟计数器*/
3000453c:	e59f3024 	ldr	r3, [pc, #36]	; 30004568 <acoral_ticks_init+0x30>
30004540:	e3a02000 	mov	r2, #0
30004544:	e5832000 	str	r2, [r3]
	acoral_intr_attach(HAL_TICKS_INTR,acoral_ticks_entry);/*这个用于注册ticks的处理函数*/
30004548:	e3a0001c 	mov	r0, #28
3000454c:	e59f1018 	ldr	r1, [pc, #24]	; 3000456c <acoral_ticks_init+0x34>
30004550:	ebfffe05 	bl	30003d6c <acoral_intr_attach>
	HAL_TICKS_INIT();                            /*这个主要用于将用于ticks的时钟初始化*/
30004554:	ebfff0c2 	bl	30000864 <hal_ticks_init>
	acoral_intr_unmask(HAL_TICKS_INTR);
30004558:	e3a0001c 	mov	r0, #28
3000455c:	ebfffe36 	bl	30003e3c <acoral_intr_unmask>
	return;
}
30004560:	e8bd4008 	pop	{r3, lr}
30004564:	e12fff1e 	bx	lr
30004568:	3000f07c 	.word	0x3000f07c
3000456c:	30004570 	.word	0x30004570

30004570 <acoral_ticks_entry>:

void acoral_ticks_entry(acoral_vector vector){
30004570:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004574:	e24dd00c 	sub	sp, sp, #12
30004578:	e58d0004 	str	r0, [sp, #4]
#ifdef CFG_HOOK_TICKS
	acoral_ticks_hook();
#endif
        ticks++;
3000457c:	e59f3034 	ldr	r3, [pc, #52]	; 300045b8 <acoral_ticks_entry+0x48>
30004580:	e5933000 	ldr	r3, [r3]
30004584:	e2832001 	add	r2, r3, #1
30004588:	e59f3028 	ldr	r3, [pc, #40]	; 300045b8 <acoral_ticks_entry+0x48>
3000458c:	e5832000 	str	r2, [r3]
	acoral_printdbg("In ticks isr\n");
	if(acoral_start_sched==true){
30004590:	e59f3024 	ldr	r3, [pc, #36]	; 300045bc <acoral_ticks_entry+0x4c>
30004594:	e5933000 	ldr	r3, [r3]
30004598:	e3530001 	cmp	r3, #1
3000459c:	1a000002 	bne	300045ac <acoral_ticks_entry+0x3c>
		time_delay_deal();
300045a0:	eb000051 	bl	300046ec <time_delay_deal>
		acoral_policy_delay_deal();
300045a4:	ebfff638 	bl	30001e8c <acoral_policy_delay_deal>
		/*--------------------*/
		/* 超时链表处理函数*/
		/* pegasus  0719*/
		/*--------------------*/
		timeout_delay_deal();
300045a8:	eb0000ef 	bl	3000496c <timeout_delay_deal>
	}
}
300045ac:	e28dd00c 	add	sp, sp, #12
300045b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300045b4:	e12fff1e 	bx	lr
300045b8:	3000f07c 	.word	0x3000f07c
300045bc:	3000ed14 	.word	0x3000ed14

300045c0 <acoral_delayqueue_add>:

/*================================
 * func: add thread to  time_delay_queue 
 *    将线程挂到延时队列上
 *================================*/
void acoral_delayqueue_add(acoral_queue_t *queue, acoral_thread_t *new){
300045c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300045c4:	e24dd02c 	sub	sp, sp, #44	; 0x2c
300045c8:	e58d0004 	str	r0, [sp, #4]
300045cc:	e58d1000 	str	r1, [sp]
	acoral_sr cpu_sr;
	acoral_list_t   *tmp, *tmp1,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
300045d0:	e59d3000 	ldr	r3, [sp]
300045d4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300045d8:	e58d3024 	str	r3, [sp, #36]	; 0x24
	if(new->state&ACORAL_THREAD_STATE_DELAY){
		acoral_printerr("Still in delay but be waked,why?\n");
		return;
	}
#endif
	head=&queue->head;
300045dc:	e59d3004 	ldr	r3, [sp, #4]
300045e0:	e58d3018 	str	r3, [sp, #24]
	HAL_ENTER_CRITICAL();
300045e4:	ebfff442 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300045e8:	e1a03000 	mov	r3, r0
300045ec:	e58d300c 	str	r3, [sp, #12]
		/*获取下一个成员锁*/
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	new->state|=ACORAL_THREAD_STATE_DELAY;
300045f0:	e59d3000 	ldr	r3, [sp]
300045f4:	e5d33004 	ldrb	r3, [r3, #4]
300045f8:	e3833020 	orr	r3, r3, #32
300045fc:	e20320ff 	and	r2, r3, #255	; 0xff
30004600:	e59d3000 	ldr	r3, [sp]
30004604:	e5c32004 	strb	r2, [r3, #4]
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30004608:	e59d3018 	ldr	r3, [sp, #24]
3000460c:	e5933000 	ldr	r3, [r3]
30004610:	e58d3010 	str	r3, [sp, #16]
30004614:	ea00000d 	b	30004650 <acoral_delayqueue_add+0x90>
		thread = list_entry (tmp, acoral_thread_t, waiting);
30004618:	e59d3010 	ldr	r3, [sp, #16]
3000461c:	e2433020 	sub	r3, r3, #32
30004620:	e58d301c 	str	r3, [sp, #28]
		delay  = delay-thread->delay;
30004624:	e59d301c 	ldr	r3, [sp, #28]
30004628:	e5933040 	ldr	r3, [r3, #64]	; 0x40
3000462c:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
30004630:	e0633002 	rsb	r3, r3, r2
30004634:	e58d3024 	str	r3, [sp, #36]	; 0x24
		if (delay < 0)
30004638:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000463c:	e3530000 	cmp	r3, #0
30004640:	ba000009 	blt	3000466c <acoral_delayqueue_add+0xac>
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	new->state|=ACORAL_THREAD_STATE_DELAY;
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30004644:	e59d3010 	ldr	r3, [sp, #16]
30004648:	e5933000 	ldr	r3, [r3]
3000464c:	e58d3010 	str	r3, [sp, #16]
30004650:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30004654:	e58d3020 	str	r3, [sp, #32]
30004658:	e59d2010 	ldr	r2, [sp, #16]
3000465c:	e59d3018 	ldr	r3, [sp, #24]
30004660:	e1520003 	cmp	r2, r3
30004664:	1affffeb 	bne	30004618 <acoral_delayqueue_add+0x58>
30004668:	ea000000 	b	30004670 <acoral_delayqueue_add+0xb0>
		thread = list_entry (tmp, acoral_thread_t, waiting);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
3000466c:	e1a00000 	nop			; (mov r0, r0)
	}
	new->delay = delay2;
30004670:	e59d3000 	ldr	r3, [sp]
30004674:	e59d2020 	ldr	r2, [sp, #32]
30004678:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_list_add(&new->waiting,tmp->prev);
3000467c:	e59d3000 	ldr	r3, [sp]
30004680:	e2832020 	add	r2, r3, #32
30004684:	e59d3010 	ldr	r3, [sp, #16]
30004688:	e5933004 	ldr	r3, [r3, #4]
3000468c:	e1a00002 	mov	r0, r2
30004690:	e1a01003 	mov	r1, r3
30004694:	eb0016bd 	bl	3000a190 <acoral_list_add>
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
30004698:	e59d2010 	ldr	r2, [sp, #16]
3000469c:	e59d3018 	ldr	r3, [sp, #24]
300046a0:	e1520003 	cmp	r2, r3
300046a4:	0a000008 	beq	300046cc <acoral_delayqueue_add+0x10c>
		thread = list_entry(tmp, acoral_thread_t, waiting);
300046a8:	e59d3010 	ldr	r3, [sp, #16]
300046ac:	e2433020 	sub	r3, r3, #32
300046b0:	e58d301c 	str	r3, [sp, #28]
		thread->delay-=delay2;
300046b4:	e59d301c 	ldr	r3, [sp, #28]
300046b8:	e5932040 	ldr	r2, [r3, #64]	; 0x40
300046bc:	e59d3020 	ldr	r3, [sp, #32]
300046c0:	e0632002 	rsb	r2, r3, r2
300046c4:	e59d301c 	ldr	r3, [sp, #28]
300046c8:	e5832040 	str	r2, [r3, #64]	; 0x40
	}
	acoral_unrdy_thread(new);
300046cc:	e59d0000 	ldr	r0, [sp]
300046d0:	ebfff935 	bl	30002bac <acoral_unrdy_thread>
#endif
	HAL_EXIT_CRITICAL();
300046d4:	e59d000c 	ldr	r0, [sp, #12]
300046d8:	ebfff403 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
300046dc:	ebfff74b 	bl	30002410 <acoral_sched>
	return;
}
300046e0:	e28dd02c 	add	sp, sp, #44	; 0x2c
300046e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300046e8:	e12fff1e 	bx	lr

300046ec <time_delay_deal>:

void time_delay_deal(){
300046ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300046f0:	e24dd014 	sub	sp, sp, #20
	acoral_list_t   *tmp,*tmp1,*head;
	acoral_thread_t *thread;
	head = &time_delay_queue.head;
300046f4:	e59f30f8 	ldr	r3, [pc, #248]	; 300047f4 <time_delay_deal+0x108>
300046f8:	e58d3008 	str	r3, [sp, #8]
	if(acoral_list_empty(head))
300046fc:	e59d3008 	ldr	r3, [sp, #8]
30004700:	e5932000 	ldr	r2, [r3]
30004704:	e59d3008 	ldr	r3, [sp, #8]
30004708:	e1520003 	cmp	r2, r3
3000470c:	0a000032 	beq	300047dc <time_delay_deal+0xf0>
	  	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
30004710:	e59d3008 	ldr	r3, [sp, #8]
30004714:	e5933000 	ldr	r3, [r3]
30004718:	e2433020 	sub	r3, r3, #32
3000471c:	e58d300c 	str	r3, [sp, #12]
	ACORAL_ASSERT(thread,"in time deal");
30004720:	e59d200c 	ldr	r2, [sp, #12]
30004724:	e59f30cc 	ldr	r3, [pc, #204]	; 300047f8 <time_delay_deal+0x10c>
30004728:	e1a00002 	mov	r0, r2
3000472c:	e1a01003 	mov	r1, r3
30004730:	ebfffd41 	bl	30003c3c <acoral_assert_res>
	thread->delay--;
30004734:	e59d300c 	ldr	r3, [sp, #12]
30004738:	e5933040 	ldr	r3, [r3, #64]	; 0x40
3000473c:	e2432001 	sub	r2, r3, #1
30004740:	e59d300c 	ldr	r3, [sp, #12]
30004744:	e5832040 	str	r2, [r3, #64]	; 0x40
	for(tmp=head->next;tmp!=head;){
30004748:	e59d3008 	ldr	r3, [sp, #8]
3000474c:	e5933000 	ldr	r3, [r3]
30004750:	e58d3000 	str	r3, [sp]
30004754:	ea00001b 	b	300047c8 <time_delay_deal+0xdc>
		thread=list_entry(tmp,acoral_thread_t,waiting);
30004758:	e59d3000 	ldr	r3, [sp]
3000475c:	e2433020 	sub	r3, r3, #32
30004760:	e58d300c 	str	r3, [sp, #12]
		ACORAL_ASSERT(thread,"in time deal for");
30004764:	e59d200c 	ldr	r2, [sp, #12]
30004768:	e59f308c 	ldr	r3, [pc, #140]	; 300047fc <time_delay_deal+0x110>
3000476c:	e1a00002 	mov	r0, r2
30004770:	e1a01003 	mov	r1, r3
30004774:	ebfffd30 	bl	30003c3c <acoral_assert_res>
		if(thread->delay>0)
30004778:	e59d300c 	ldr	r3, [sp, #12]
3000477c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004780:	e3530000 	cmp	r3, #0
30004784:	ca000016 	bgt	300047e4 <time_delay_deal+0xf8>
		/*防止add判断delay时取下thread*/
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_lock(&head->lock);
		acoral_spin_lock(&tmp->lock);
#endif
		tmp1=tmp->next;
30004788:	e59d3000 	ldr	r3, [sp]
3000478c:	e5933000 	ldr	r3, [r3]
30004790:	e58d3004 	str	r3, [sp, #4]
		acoral_list_del(&thread->waiting);
30004794:	e59d300c 	ldr	r3, [sp, #12]
30004798:	e2833020 	add	r3, r3, #32
3000479c:	e1a00003 	mov	r0, r3
300047a0:	eb0016a0 	bl	3000a228 <acoral_list_del>
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_unlock(&tmp->lock);
		acoral_spin_unlock(&head->lock);
#endif
		tmp=tmp1;
300047a4:	e59d3004 	ldr	r3, [sp, #4]
300047a8:	e58d3000 	str	r3, [sp]
		thread->state&=~ACORAL_THREAD_STATE_DELAY;
300047ac:	e59d300c 	ldr	r3, [sp, #12]
300047b0:	e5d33004 	ldrb	r3, [r3, #4]
300047b4:	e20330df 	and	r3, r3, #223	; 0xdf
300047b8:	e59d200c 	ldr	r2, [sp, #12]
300047bc:	e5c23004 	strb	r3, [r2, #4]
		acoral_rdy_thread(thread);
300047c0:	e59d000c 	ldr	r0, [sp, #12]
300047c4:	ebfff8e9 	bl	30002b70 <acoral_rdy_thread>
	if(acoral_list_empty(head))
	  	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
	ACORAL_ASSERT(thread,"in time deal");
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
300047c8:	e59d2000 	ldr	r2, [sp]
300047cc:	e59d3008 	ldr	r3, [sp, #8]
300047d0:	e1520003 	cmp	r2, r3
300047d4:	1affffdf 	bne	30004758 <time_delay_deal+0x6c>
300047d8:	ea000002 	b	300047e8 <time_delay_deal+0xfc>
void time_delay_deal(){
	acoral_list_t   *tmp,*tmp1,*head;
	acoral_thread_t *thread;
	head = &time_delay_queue.head;
	if(acoral_list_empty(head))
	  	return;
300047dc:	e1a00000 	nop			; (mov r0, r0)
300047e0:	ea000000 	b	300047e8 <time_delay_deal+0xfc>
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
		thread=list_entry(tmp,acoral_thread_t,waiting);
		ACORAL_ASSERT(thread,"in time deal for");
		if(thread->delay>0)
		    break;
300047e4:	e1a00000 	nop			; (mov r0, r0)
#endif
		tmp=tmp1;
		thread->state&=~ACORAL_THREAD_STATE_DELAY;
		acoral_rdy_thread(thread);
	}
}
300047e8:	e28dd014 	add	sp, sp, #20
300047ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300047f0:	e12fff1e 	bx	lr
300047f4:	300105a0 	.word	0x300105a0
300047f8:	3000e5b4 	.word	0x3000e5b4
300047fc:	3000e5c4 	.word	0x3000e5c4

30004800 <timeout_queue_add>:
/*================================
 *  
 *    将线程挂到超时队列上
 *================================*/
void timeout_queue_add(acoral_thread_t *new)
{
30004800:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004804:	e24dd02c 	sub	sp, sp, #44	; 0x2c
30004808:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
	acoral_list_t   *tmp, *tmp1,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
3000480c:	e59d3004 	ldr	r3, [sp, #4]
30004810:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004814:	e58d3024 	str	r3, [sp, #36]	; 0x24
	head=&timeout_queue.head;
30004818:	e59f30e4 	ldr	r3, [pc, #228]	; 30004904 <timeout_queue_add+0x104>
3000481c:	e58d3018 	str	r3, [sp, #24]
	HAL_ENTER_CRITICAL();
30004820:	ebfff3b3 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30004824:	e1a03000 	mov	r3, r0
30004828:	e58d300c 	str	r3, [sp, #12]
		/*获取下一个成员锁*/
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
3000482c:	e59d3018 	ldr	r3, [sp, #24]
30004830:	e5933000 	ldr	r3, [r3]
30004834:	e58d3010 	str	r3, [sp, #16]
30004838:	ea00000d 	b	30004874 <timeout_queue_add+0x74>
		thread = list_entry (tmp, acoral_thread_t, timeout);
3000483c:	e59d3010 	ldr	r3, [sp, #16]
30004840:	e2433018 	sub	r3, r3, #24
30004844:	e58d301c 	str	r3, [sp, #28]
		delay  = delay-thread->delay;
30004848:	e59d301c 	ldr	r3, [sp, #28]
3000484c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004850:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
30004854:	e0633002 	rsb	r3, r3, r2
30004858:	e58d3024 	str	r3, [sp, #36]	; 0x24
		if (delay < 0)
3000485c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30004860:	e3530000 	cmp	r3, #0
30004864:	ba000009 	blt	30004890 <timeout_queue_add+0x90>
		/*获取下一个成员锁*/
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30004868:	e59d3010 	ldr	r3, [sp, #16]
3000486c:	e5933000 	ldr	r3, [r3]
30004870:	e58d3010 	str	r3, [sp, #16]
30004874:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30004878:	e58d3020 	str	r3, [sp, #32]
3000487c:	e59d2010 	ldr	r2, [sp, #16]
30004880:	e59d3018 	ldr	r3, [sp, #24]
30004884:	e1520003 	cmp	r2, r3
30004888:	1affffeb 	bne	3000483c <timeout_queue_add+0x3c>
3000488c:	ea000000 	b	30004894 <timeout_queue_add+0x94>
		thread = list_entry (tmp, acoral_thread_t, timeout);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
30004890:	e1a00000 	nop			; (mov r0, r0)
	}
	new->delay = delay2;
30004894:	e59d3004 	ldr	r3, [sp, #4]
30004898:	e59d2020 	ldr	r2, [sp, #32]
3000489c:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_list_add(&new->timeout,tmp->prev);
300048a0:	e59d3004 	ldr	r3, [sp, #4]
300048a4:	e2832018 	add	r2, r3, #24
300048a8:	e59d3010 	ldr	r3, [sp, #16]
300048ac:	e5933004 	ldr	r3, [r3, #4]
300048b0:	e1a00002 	mov	r0, r2
300048b4:	e1a01003 	mov	r1, r3
300048b8:	eb001634 	bl	3000a190 <acoral_list_add>
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
300048bc:	e59d2010 	ldr	r2, [sp, #16]
300048c0:	e59d3018 	ldr	r3, [sp, #24]
300048c4:	e1520003 	cmp	r2, r3
300048c8:	0a000008 	beq	300048f0 <timeout_queue_add+0xf0>
		thread = list_entry(tmp, acoral_thread_t, timeout);
300048cc:	e59d3010 	ldr	r3, [sp, #16]
300048d0:	e2433018 	sub	r3, r3, #24
300048d4:	e58d301c 	str	r3, [sp, #28]
		thread->delay-=delay2;
300048d8:	e59d301c 	ldr	r3, [sp, #28]
300048dc:	e5932040 	ldr	r2, [r3, #64]	; 0x40
300048e0:	e59d3020 	ldr	r3, [sp, #32]
300048e4:	e0632002 	rsb	r2, r3, r2
300048e8:	e59d301c 	ldr	r3, [sp, #28]
300048ec:	e5832040 	str	r2, [r3, #64]	; 0x40
	}
#endif

	HAL_EXIT_CRITICAL();
300048f0:	e59d000c 	ldr	r0, [sp, #12]
300048f4:	ebfff37c 	bl	300016ec <HAL_INTR_RESTORE>
	return;
}
300048f8:	e28dd02c 	add	sp, sp, #44	; 0x2c
300048fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004900:	e12fff1e 	bx	lr
30004904:	3001061c 	.word	0x3001061c

30004908 <timeout_queue_del>:
/*================================
 *  
 *    将线程超时队列删除
 *================================*/
void timeout_queue_del(acoral_thread_t *new)
{
30004908:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000490c:	e24dd014 	sub	sp, sp, #20
30004910:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t  *p, *q;
	
	if (acoral_list_empty(&new->timeout))
30004914:	e59d3004 	ldr	r3, [sp, #4]
30004918:	e5932018 	ldr	r2, [r3, #24]
3000491c:	e59d3004 	ldr	r3, [sp, #4]
30004920:	e2833018 	add	r3, r3, #24
30004924:	e1520003 	cmp	r2, r3
30004928:	0a00000b 	beq	3000495c <timeout_queue_del+0x54>
		return;

	p = new->timeout.prev;
3000492c:	e59d3004 	ldr	r3, [sp, #4]
30004930:	e593301c 	ldr	r3, [r3, #28]
30004934:	e58d3008 	str	r3, [sp, #8]
	q = &new->timeout;
30004938:	e59d3004 	ldr	r3, [sp, #4]
3000493c:	e2833018 	add	r3, r3, #24
30004940:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&p->lock);
	acoral_spin_lock(&q->lock);
	acoral_list_del(&new->timeout);
30004944:	e59d3004 	ldr	r3, [sp, #4]
30004948:	e2833018 	add	r3, r3, #24
3000494c:	e1a00003 	mov	r0, r3
30004950:	eb001634 	bl	3000a228 <acoral_list_del>
	acoral_spin_unlock(&q->lock);
	acoral_spin_unlock(&p->lock);
	return;
30004954:	e1a00000 	nop			; (mov r0, r0)
30004958:	ea000000 	b	30004960 <timeout_queue_del+0x58>
void timeout_queue_del(acoral_thread_t *new)
{
	acoral_list_t  *p, *q;
	
	if (acoral_list_empty(&new->timeout))
		return;
3000495c:	e1a00000 	nop			; (mov r0, r0)
	acoral_spin_lock(&q->lock);
	acoral_list_del(&new->timeout);
	acoral_spin_unlock(&q->lock);
	acoral_spin_unlock(&p->lock);
	return;
}
30004960:	e28dd014 	add	sp, sp, #20
30004964:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004968:	e12fff1e 	bx	lr

3000496c <timeout_delay_deal>:
/*---------------------*/
/*  超时链表处理函数*/
/*   pegasus  0719*/
/*---------------------*/
void timeout_delay_deal()
{
3000496c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004970:	e24dd014 	sub	sp, sp, #20
	acoral_list_t *tmp, *tmp1, *head;
	acoral_thread_t  *thread;

	head = &timeout_queue.head;
30004974:	e59f30f4 	ldr	r3, [pc, #244]	; 30004a70 <timeout_delay_deal+0x104>
30004978:	e58d3008 	str	r3, [sp, #8]
	if(acoral_list_empty(head))
3000497c:	e59d3008 	ldr	r3, [sp, #8]
30004980:	e5932000 	ldr	r2, [r3]
30004984:	e59d3008 	ldr	r3, [sp, #8]
30004988:	e1520003 	cmp	r2, r3
3000498c:	0a000031 	beq	30004a58 <timeout_delay_deal+0xec>
	{
	  	return;
	}

	thread=list_entry(head->next,acoral_thread_t,timeout);
30004990:	e59d3008 	ldr	r3, [sp, #8]
30004994:	e5933000 	ldr	r3, [r3]
30004998:	e2433018 	sub	r3, r3, #24
3000499c:	e58d300c 	str	r3, [sp, #12]
	ACORAL_ASSERT(thread,"in timeout deal");
300049a0:	e59d200c 	ldr	r2, [sp, #12]
300049a4:	e59f30c8 	ldr	r3, [pc, #200]	; 30004a74 <timeout_delay_deal+0x108>
300049a8:	e1a00002 	mov	r0, r2
300049ac:	e1a01003 	mov	r1, r3
300049b0:	ebfffca1 	bl	30003c3c <acoral_assert_res>
	if (thread->delay>0)
300049b4:	e59d300c 	ldr	r3, [sp, #12]
300049b8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300049bc:	e3530000 	cmp	r3, #0
300049c0:	da000004 	ble	300049d8 <timeout_delay_deal+0x6c>
		thread->delay--;
300049c4:	e59d300c 	ldr	r3, [sp, #12]
300049c8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300049cc:	e2432001 	sub	r2, r3, #1
300049d0:	e59d300c 	ldr	r3, [sp, #12]
300049d4:	e5832040 	str	r2, [r3, #64]	; 0x40
	for(tmp=head->next;tmp!=head;)
300049d8:	e59d3008 	ldr	r3, [sp, #8]
300049dc:	e5933000 	ldr	r3, [r3]
300049e0:	e58d3000 	str	r3, [sp]
300049e4:	ea000016 	b	30004a44 <timeout_delay_deal+0xd8>
	{
		thread=list_entry(tmp,acoral_thread_t,timeout);
300049e8:	e59d3000 	ldr	r3, [sp]
300049ec:	e2433018 	sub	r3, r3, #24
300049f0:	e58d300c 	str	r3, [sp, #12]
		ACORAL_ASSERT(thread,"in timeout deal");
300049f4:	e59d200c 	ldr	r2, [sp, #12]
300049f8:	e59f3074 	ldr	r3, [pc, #116]	; 30004a74 <timeout_delay_deal+0x108>
300049fc:	e1a00002 	mov	r0, r2
30004a00:	e1a01003 	mov	r1, r3
30004a04:	ebfffc8c 	bl	30003c3c <acoral_assert_res>
		if(thread->delay>0)
30004a08:	e59d300c 	ldr	r3, [sp, #12]
30004a0c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004a10:	e3530000 	cmp	r3, #0
30004a14:	ca000011 	bgt	30004a60 <timeout_delay_deal+0xf4>
		    break;
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_lock(&head->lock);
		acoral_spin_lock(&tmp->lock);
#endif
		tmp1=tmp->next;
30004a18:	e59d3000 	ldr	r3, [sp]
30004a1c:	e5933000 	ldr	r3, [r3]
30004a20:	e58d3004 	str	r3, [sp, #4]
		acoral_list_del(&thread->timeout);
30004a24:	e59d300c 	ldr	r3, [sp, #12]
30004a28:	e2833018 	add	r3, r3, #24
30004a2c:	e1a00003 	mov	r0, r3
30004a30:	eb0015fc 	bl	3000a228 <acoral_list_del>
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_unlock(&tmp->lock);
		acoral_spin_unlock(&head->lock);
#endif
		tmp=tmp1;
30004a34:	e59d3004 	ldr	r3, [sp, #4]
30004a38:	e58d3000 	str	r3, [sp]
		/*thread->state*/
		acoral_rdy_thread(thread);
30004a3c:	e59d000c 	ldr	r0, [sp, #12]
30004a40:	ebfff84a 	bl	30002b70 <acoral_rdy_thread>

	thread=list_entry(head->next,acoral_thread_t,timeout);
	ACORAL_ASSERT(thread,"in timeout deal");
	if (thread->delay>0)
		thread->delay--;
	for(tmp=head->next;tmp!=head;)
30004a44:	e59d2000 	ldr	r2, [sp]
30004a48:	e59d3008 	ldr	r3, [sp, #8]
30004a4c:	e1520003 	cmp	r2, r3
30004a50:	1affffe4 	bne	300049e8 <timeout_delay_deal+0x7c>
30004a54:	ea000002 	b	30004a64 <timeout_delay_deal+0xf8>
	acoral_thread_t  *thread;

	head = &timeout_queue.head;
	if(acoral_list_empty(head))
	{
	  	return;
30004a58:	e1a00000 	nop			; (mov r0, r0)
30004a5c:	ea000000 	b	30004a64 <timeout_delay_deal+0xf8>
	for(tmp=head->next;tmp!=head;)
	{
		thread=list_entry(tmp,acoral_thread_t,timeout);
		ACORAL_ASSERT(thread,"in timeout deal");
		if(thread->delay>0)
		    break;
30004a60:	e1a00000 	nop			; (mov r0, r0)
#endif
		tmp=tmp1;
		/*thread->state*/
		acoral_rdy_thread(thread);
	}
}
30004a64:	e28dd014 	add	sp, sp, #20
30004a68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004a6c:	e12fff1e 	bx	lr
30004a70:	3001061c 	.word	0x3001061c
30004a74:	3000e5d8 	.word	0x3000e5d8

30004a78 <acoral_mem_sys_init>:
#include<mem.h>
/*================================
 *   memory system initialize
 *	内存管理系统初始化
 *================================*/
void acoral_mem_sys_init(){
30004a78:	e92d4008 	push	{r3, lr}
	/*硬件相关的内存初始化，比如内存控制器等*/
  	HAL_MEM_INIT();
30004a7c:	ebffefbc 	bl	30000974 <hal_mem_init>
	/*堆初始化,这个可以选择不同管理系统，比如buddy内存管理等*/
  	acoral_mem_init((acoral_u32)HAL_HEAP_START,(acoral_u32)HAL_HEAP_END);
30004a80:	e59f2018 	ldr	r2, [pc, #24]	; 30004aa0 <acoral_mem_sys_init+0x28>
30004a84:	e59f3018 	ldr	r3, [pc, #24]	; 30004aa4 <acoral_mem_sys_init+0x2c>
30004a88:	e1a00002 	mov	r0, r2
30004a8c:	e1a01003 	mov	r1, r3
30004a90:	eb000334 	bl	30005768 <buddy_init>
#ifdef CFG_MEM2
  	acoral_mem_init2();
30004a94:	eb000997 	bl	300070f8 <v_mem_init>
#endif
}
30004a98:	e8bd4008 	pop	{r3, lr}
30004a9c:	e12fff1e 	bx	lr
30004aa0:	3001065c 	.word	0x3001065c
30004aa4:	33eff000 	.word	0x33eff000

30004aa8 <spin_lock_intr_save>:
#include <hal.h>
#include <spinlock.h>
#include <lsched.h>
acoral_sr spin_lock_intr_save(acoral_spinlock_t *v){
30004aa8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004aac:	e24dd014 	sub	sp, sp, #20
30004ab0:	e58d0004 	str	r0, [sp, #4]
	acoral_sr sr;
	sr=HAL_INTR_DISABLE_SAVE();
30004ab4:	ebfff30e 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30004ab8:	e1a03000 	mov	r3, r0
30004abc:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(v);
	return sr;
30004ac0:	e59d300c 	ldr	r3, [sp, #12]
}
30004ac4:	e1a00003 	mov	r0, r3
30004ac8:	e28dd014 	add	sp, sp, #20
30004acc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004ad0:	e12fff1e 	bx	lr

30004ad4 <spin_unlock_intr_restore>:

void spin_unlock_intr_restore(acoral_sr sr,acoral_spinlock_t *v){
30004ad4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004ad8:	e24dd00c 	sub	sp, sp, #12
30004adc:	e58d0004 	str	r0, [sp, #4]
30004ae0:	e58d1000 	str	r1, [sp]
	acoral_spin_unlock(v);
	HAL_INTR_RESTORE(sr);
30004ae4:	e59d0004 	ldr	r0, [sp, #4]
30004ae8:	ebfff2ff 	bl	300016ec <HAL_INTR_RESTORE>
}
30004aec:	e28dd00c 	add	sp, sp, #12
30004af0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004af4:	e12fff1e 	bx	lr

30004af8 <spin_lock_intr>:

void spin_lock_intr(acoral_spinlock_t *v){
30004af8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004afc:	e24dd00c 	sub	sp, sp, #12
30004b00:	e58d0004 	str	r0, [sp, #4]
	HAL_INTR_DISABLE();
30004b04:	ebfff2f3 	bl	300016d8 <HAL_INTR_DISABLE>
	acoral_spin_lock(v);
}
30004b08:	e28dd00c 	add	sp, sp, #12
30004b0c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004b10:	e12fff1e 	bx	lr

30004b14 <spin_unlock_intr>:

void spin_unlock_intr(acoral_spinlock_t *v){
30004b14:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004b18:	e24dd00c 	sub	sp, sp, #12
30004b1c:	e58d0004 	str	r0, [sp, #4]
	acoral_spin_unlock(v);
	HAL_INTR_ENABLE();
30004b20:	ebfff2e8 	bl	300016c8 <HAL_INTR_ENABLE>
}
30004b24:	e28dd00c 	add	sp, sp, #12
30004b28:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004b2c:	e12fff1e 	bx	lr

30004b30 <spin_lock_stamp>:

void spin_lock_stamp(acoral_spinlock_t *v){
30004b30:	e24dd008 	sub	sp, sp, #8
30004b34:	e58d0004 	str	r0, [sp, #4]
	acoral_sched_lock();
30004b38:	e59f300c 	ldr	r3, [pc, #12]	; 30004b4c <spin_lock_stamp+0x1c>
30004b3c:	e3a02001 	mov	r2, #1
30004b40:	e5c32000 	strb	r2, [r3]
	acoral_spin_lock(v);
}
30004b44:	e28dd008 	add	sp, sp, #8
30004b48:	e12fff1e 	bx	lr
30004b4c:	3000f61c 	.word	0x3000f61c

30004b50 <spin_unlock_stamp>:

void spin_unlock_stamp(acoral_spinlock_t *v){
30004b50:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004b54:	e24dd00c 	sub	sp, sp, #12
30004b58:	e58d0004 	str	r0, [sp, #4]
	acoral_spin_unlock(v);
	acoral_sched_unlock();
30004b5c:	ebfff529 	bl	30002008 <acoral_sched_unlock>
}
30004b60:	e28dd00c 	add	sp, sp, #12
30004b64:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004b68:	e12fff1e 	bx	lr

30004b6c <acoral_evt_sys_init>:
#include "acoral.h"
#include "event.h"
acoral_pool_ctrl_t acoral_evt_pool_ctrl;
void acoral_evt_sys_init(){
30004b6c:	e92d4008 	push	{r3, lr}
	acoral_evt_pool_init();
30004b70:	eb000001 	bl	30004b7c <acoral_evt_pool_init>
}
30004b74:	e8bd4008 	pop	{r3, lr}
30004b78:	e12fff1e 	bx	lr

30004b7c <acoral_evt_pool_init>:

void acoral_evt_pool_init(){
30004b7c:	e92d4008 	push	{r3, lr}
	acoral_evt_pool_ctrl.type=ACORAL_RES_EVENT;
30004b80:	e59f3048 	ldr	r3, [pc, #72]	; 30004bd0 <acoral_evt_pool_init+0x54>
30004b84:	e3a02002 	mov	r2, #2
30004b88:	e5832000 	str	r2, [r3]
	acoral_evt_pool_ctrl.size=sizeof(acoral_evt_t);
30004b8c:	e59f303c 	ldr	r3, [pc, #60]	; 30004bd0 <acoral_evt_pool_init+0x54>
30004b90:	e3a02024 	mov	r2, #36	; 0x24
30004b94:	e5832004 	str	r2, [r3, #4]
	acoral_evt_pool_ctrl.num_per_pool=8;
30004b98:	e59f3030 	ldr	r3, [pc, #48]	; 30004bd0 <acoral_evt_pool_init+0x54>
30004b9c:	e3a02008 	mov	r2, #8
30004ba0:	e5832008 	str	r2, [r3, #8]
	acoral_evt_pool_ctrl.num=0;
30004ba4:	e59f3024 	ldr	r3, [pc, #36]	; 30004bd0 <acoral_evt_pool_init+0x54>
30004ba8:	e3a02000 	mov	r2, #0
30004bac:	e583200c 	str	r2, [r3, #12]
	acoral_evt_pool_ctrl.max_pools=4;
30004bb0:	e59f3018 	ldr	r3, [pc, #24]	; 30004bd0 <acoral_evt_pool_init+0x54>
30004bb4:	e3a02004 	mov	r2, #4
30004bb8:	e5832010 	str	r2, [r3, #16]
	acoral_pool_ctrl_init(&acoral_evt_pool_ctrl);
30004bbc:	e59f000c 	ldr	r0, [pc, #12]	; 30004bd0 <acoral_evt_pool_init+0x54>
30004bc0:	ebfffbaa 	bl	30003a70 <acoral_pool_ctrl_init>
#ifdef CFG_MSG
	acoral_msg_sys_init();
30004bc4:	eb000bfb 	bl	30007bb8 <acoral_msg_sys_init>
#endif
}
30004bc8:	e8bd4008 	pop	{r3, lr}
30004bcc:	e12fff1e 	bx	lr
30004bd0:	300105ac 	.word	0x300105ac

30004bd4 <acoral_alloc_evt>:

acoral_evt_t *acoral_alloc_evt(){
30004bd4:	e92d4008 	push	{r3, lr}
  	return (acoral_evt_t *)acoral_get_res(&acoral_evt_pool_ctrl);
30004bd8:	e59f0010 	ldr	r0, [pc, #16]	; 30004bf0 <acoral_alloc_evt+0x1c>
30004bdc:	ebfffa44 	bl	300034f4 <acoral_get_res>
30004be0:	e1a03000 	mov	r3, r0
}
30004be4:	e1a00003 	mov	r0, r3
30004be8:	e8bd4008 	pop	{r3, lr}
30004bec:	e12fff1e 	bx	lr
30004bf0:	300105ac 	.word	0x300105ac

30004bf4 <acoral_evt_init>:

void acoral_evt_init(acoral_evt_t *evt){
30004bf4:	e24dd008 	sub	sp, sp, #8
30004bf8:	e58d0004 	str	r0, [sp, #4]
	acoral_spin_init(&evt->spin_lock);
	acoral_list_init(&evt->wait_queue.head);
30004bfc:	e59d3004 	ldr	r3, [sp, #4]
30004c00:	e2832010 	add	r2, r3, #16
30004c04:	e59d3004 	ldr	r3, [sp, #4]
30004c08:	e5832010 	str	r2, [r3, #16]
30004c0c:	e59d3004 	ldr	r3, [sp, #4]
30004c10:	e2832010 	add	r2, r3, #16
30004c14:	e59d3004 	ldr	r3, [sp, #4]
30004c18:	e5832014 	str	r2, [r3, #20]
}
30004c1c:	e28dd008 	add	sp, sp, #8
30004c20:	e12fff1e 	bx	lr

30004c24 <acoral_evt_queue_empty>:

bool acoral_evt_queue_empty(acoral_evt_t *evt){
30004c24:	e24dd008 	sub	sp, sp, #8
30004c28:	e58d0004 	str	r0, [sp, #4]
	return acoral_list_empty(&evt->wait_queue.head);
30004c2c:	e59d3004 	ldr	r3, [sp, #4]
30004c30:	e5932010 	ldr	r2, [r3, #16]
30004c34:	e59d3004 	ldr	r3, [sp, #4]
30004c38:	e2833010 	add	r3, r3, #16
30004c3c:	e1520003 	cmp	r2, r3
30004c40:	13a03000 	movne	r3, #0
30004c44:	03a03001 	moveq	r3, #1
30004c48:	e1a03c03 	lsl	r3, r3, #24
30004c4c:	e1a03c43 	asr	r3, r3, #24
}
30004c50:	e1a00003 	mov	r0, r3
30004c54:	e28dd008 	add	sp, sp, #8
30004c58:	e12fff1e 	bx	lr

30004c5c <acoral_evt_high_thread>:

acoral_thread_t *acoral_evt_high_thread(acoral_evt_t *evt){
30004c5c:	e24dd010 	sub	sp, sp, #16
30004c60:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t *head;
	acoral_thread_t *thread;
	head=&evt->wait_queue.head;
30004c64:	e59d3004 	ldr	r3, [sp, #4]
30004c68:	e2833010 	add	r3, r3, #16
30004c6c:	e58d3008 	str	r3, [sp, #8]
	if(acoral_list_empty(head))
30004c70:	e59d3008 	ldr	r3, [sp, #8]
30004c74:	e5932000 	ldr	r2, [r3]
30004c78:	e59d3008 	ldr	r3, [sp, #8]
30004c7c:	e1520003 	cmp	r2, r3
30004c80:	1a000001 	bne	30004c8c <acoral_evt_high_thread+0x30>
		return NULL;
30004c84:	e3a03000 	mov	r3, #0
30004c88:	ea000004 	b	30004ca0 <acoral_evt_high_thread+0x44>
	thread=list_entry(head->next,acoral_thread_t,waiting);
30004c8c:	e59d3008 	ldr	r3, [sp, #8]
30004c90:	e5933000 	ldr	r3, [r3]
30004c94:	e2433020 	sub	r3, r3, #32
30004c98:	e58d300c 	str	r3, [sp, #12]
	return thread;	
30004c9c:	e59d300c 	ldr	r3, [sp, #12]
}
30004ca0:	e1a00003 	mov	r0, r3
30004ca4:	e28dd010 	add	sp, sp, #16
30004ca8:	e12fff1e 	bx	lr

30004cac <acoral_evt_queue_add>:

void acoral_evt_queue_add(acoral_evt_t *evt,acoral_thread_t *new){
30004cac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004cb0:	e24dd01c 	sub	sp, sp, #28
30004cb4:	e58d0004 	str	r0, [sp, #4]
30004cb8:	e58d1000 	str	r1, [sp]
	acoral_list_t *head,*tmp;
	acoral_thread_t *thread;
  	new->evt=evt;
30004cbc:	e59d3000 	ldr	r3, [sp]
30004cc0:	e59d2004 	ldr	r2, [sp, #4]
30004cc4:	e5832030 	str	r2, [r3, #48]	; 0x30
	head=&evt->wait_queue.head;
30004cc8:	e59d3004 	ldr	r3, [sp, #4]
30004ccc:	e2833010 	add	r3, r3, #16
30004cd0:	e58d300c 	str	r3, [sp, #12]
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30004cd4:	e59d300c 	ldr	r3, [sp, #12]
30004cd8:	e5933000 	ldr	r3, [r3]
30004cdc:	e58d3010 	str	r3, [sp, #16]
30004ce0:	ea000010 	b	30004d28 <acoral_evt_queue_add+0x7c>
		thread=list_entry(tmp,acoral_thread_t,waiting);
30004ce4:	e59d3010 	ldr	r3, [sp, #16]
30004ce8:	e2433020 	sub	r3, r3, #32
30004cec:	e58d3014 	str	r3, [sp, #20]
		/*如果线程资源已经不在使用，即release状态则释放*/
		if(thread->prio>new->prio)
30004cf0:	e59d3014 	ldr	r3, [sp, #20]
30004cf4:	e5d32005 	ldrb	r2, [r3, #5]
30004cf8:	e59d3000 	ldr	r3, [sp]
30004cfc:	e5d33005 	ldrb	r3, [r3, #5]
30004d00:	e1520003 	cmp	r2, r3
30004d04:	8a00000c 	bhi	30004d3c <acoral_evt_queue_add+0x90>
			break;


		if(tmp == tmp->next)
30004d08:	e59d3010 	ldr	r3, [sp, #16]
30004d0c:	e5932000 	ldr	r2, [r3]
30004d10:	e59d3010 	ldr	r3, [sp, #16]
30004d14:	e1520003 	cmp	r2, r3
30004d18:	0a000009 	beq	30004d44 <acoral_evt_queue_add+0x98>
void acoral_evt_queue_add(acoral_evt_t *evt,acoral_thread_t *new){
	acoral_list_t *head,*tmp;
	acoral_thread_t *thread;
  	new->evt=evt;
	head=&evt->wait_queue.head;
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30004d1c:	e59d3010 	ldr	r3, [sp, #16]
30004d20:	e5933000 	ldr	r3, [r3]
30004d24:	e58d3010 	str	r3, [sp, #16]
30004d28:	e59d2010 	ldr	r2, [sp, #16]
30004d2c:	e59d300c 	ldr	r3, [sp, #12]
30004d30:	e1520003 	cmp	r2, r3
30004d34:	1affffea 	bne	30004ce4 <acoral_evt_queue_add+0x38>
30004d38:	ea000002 	b	30004d48 <acoral_evt_queue_add+0x9c>
		thread=list_entry(tmp,acoral_thread_t,waiting);
		/*如果线程资源已经不在使用，即release状态则释放*/
		if(thread->prio>new->prio)
			break;
30004d3c:	e1a00000 	nop			; (mov r0, r0)
30004d40:	ea000000 	b	30004d48 <acoral_evt_queue_add+0x9c>


		if(tmp == tmp->next)
			break;
30004d44:	e1a00000 	nop			; (mov r0, r0)

	}
	acoral_list_add(&new->waiting,tmp->prev);
30004d48:	e59d3000 	ldr	r3, [sp]
30004d4c:	e2832020 	add	r2, r3, #32
30004d50:	e59d3010 	ldr	r3, [sp, #16]
30004d54:	e5933004 	ldr	r3, [r3, #4]
30004d58:	e1a00002 	mov	r0, r2
30004d5c:	e1a01003 	mov	r1, r3
30004d60:	eb00150a 	bl	3000a190 <acoral_list_add>
}
30004d64:	e28dd01c 	add	sp, sp, #28
30004d68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004d6c:	e12fff1e 	bx	lr

30004d70 <acoral_evt_queue_del>:

void acoral_evt_queue_del(acoral_thread_t *thread){
30004d70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004d74:	e24dd00c 	sub	sp, sp, #12
30004d78:	e58d0004 	str	r0, [sp, #4]
	acoral_list_del(&thread->waiting);
30004d7c:	e59d3004 	ldr	r3, [sp, #4]
30004d80:	e2833020 	add	r3, r3, #32
30004d84:	e1a00003 	mov	r0, r3
30004d88:	eb001526 	bl	3000a228 <acoral_list_del>
	thread->evt=NULL;
30004d8c:	e59d3004 	ldr	r3, [sp, #4]
30004d90:	e3a02000 	mov	r2, #0
30004d94:	e5832030 	str	r2, [r3, #48]	; 0x30
}
30004d98:	e28dd00c 	add	sp, sp, #12
30004d9c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004da0:	e12fff1e 	bx	lr

30004da4 <acoral_mutex_init>:
/*==============================
 *  The initialize of the mutex
 *       信号量初始化函数
 *==============================*/
acoral_u32 acoral_mutex_init(acoral_evt_t *evt, acoral_u8 prio)
{
30004da4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004da8:	e24dd00c 	sub	sp, sp, #12
30004dac:	e58d0004 	str	r0, [sp, #4]
30004db0:	e1a03001 	mov	r3, r1
30004db4:	e5cd3003 	strb	r3, [sp, #3]
	if ((acoral_evt_t*)0 == evt)
30004db8:	e59d3004 	ldr	r3, [sp, #4]
30004dbc:	e3530000 	cmp	r3, #0
30004dc0:	1a000001 	bne	30004dcc <acoral_mutex_init+0x28>
	{
		return MUTEX_ERR_NULL;
30004dc4:	e3a03002 	mov	r3, #2
30004dc8:	ea00000d 	b	30004e04 <acoral_mutex_init+0x60>
	}
	evt->count  = (prio << 8) | MUTEX_AVAI;
30004dcc:	e5dd3003 	ldrb	r3, [sp, #3]
30004dd0:	e1a03403 	lsl	r3, r3, #8
30004dd4:	e38320ff 	orr	r2, r3, #255	; 0xff
30004dd8:	e59d3004 	ldr	r3, [sp, #4]
30004ddc:	e583200c 	str	r2, [r3, #12]
	evt->type = ACORAL_EVENT_MUTEX;
30004de0:	e59d3004 	ldr	r3, [sp, #4]
30004de4:	e3a02001 	mov	r2, #1
30004de8:	e5c32004 	strb	r2, [r3, #4]
	evt->data = NULL;
30004dec:	e59d3004 	ldr	r3, [sp, #4]
30004df0:	e3a02000 	mov	r2, #0
30004df4:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
30004df8:	e59d0004 	ldr	r0, [sp, #4]
30004dfc:	ebffff7c 	bl	30004bf4 <acoral_evt_init>
	return MUTEX_SUCCED;
30004e00:	e3a03000 	mov	r3, #0
}
30004e04:	e1a00003 	mov	r0, r3
30004e08:	e28dd00c 	add	sp, sp, #12
30004e0c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004e10:	e12fff1e 	bx	lr

30004e14 <acoral_mutex_create>:
/*==============================
 *  The creation of the mutex
 *       信号量创建函数
 *==============================*/
acoral_evt_t *acoral_mutex_create(acoral_u8 prio, acoral_u32 *err)
{
30004e14:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004e18:	e24dd014 	sub	sp, sp, #20
30004e1c:	e1a03000 	mov	r3, r0
30004e20:	e58d1000 	str	r1, [sp]
30004e24:	e5cd3007 	strb	r3, [sp, #7]
	acoral_evt_t *evt;

	/* 是否大于最小优先线，和是否该优先级已占用*/
	evt = acoral_alloc_evt();      /* alloc a RAM for the event*/
30004e28:	ebffff69 	bl	30004bd4 <acoral_alloc_evt>
30004e2c:	e1a03000 	mov	r3, r0
30004e30:	e58d300c 	str	r3, [sp, #12]
	if (NULL == evt)
30004e34:	e59d300c 	ldr	r3, [sp, #12]
30004e38:	e3530000 	cmp	r3, #0
30004e3c:	1a000004 	bne	30004e54 <acoral_mutex_create+0x40>
	{
		*err = MUTEX_ERR_NULL;
30004e40:	e59d3000 	ldr	r3, [sp]
30004e44:	e3a02002 	mov	r2, #2
30004e48:	e5832000 	str	r2, [r3]
		return NULL;
30004e4c:	e3a03000 	mov	r3, #0
30004e50:	ea00000d 	b	30004e8c <acoral_mutex_create+0x78>
	}
	evt->count  = (prio << 8) | MUTEX_AVAI;
30004e54:	e5dd3007 	ldrb	r3, [sp, #7]
30004e58:	e1a03403 	lsl	r3, r3, #8
30004e5c:	e38320ff 	orr	r2, r3, #255	; 0xff
30004e60:	e59d300c 	ldr	r3, [sp, #12]
30004e64:	e583200c 	str	r2, [r3, #12]
	evt->type = ACORAL_EVENT_MUTEX;
30004e68:	e59d300c 	ldr	r3, [sp, #12]
30004e6c:	e3a02001 	mov	r2, #1
30004e70:	e5c32004 	strb	r2, [r3, #4]
	evt->data = NULL;
30004e74:	e59d300c 	ldr	r3, [sp, #12]
30004e78:	e3a02000 	mov	r2, #0
30004e7c:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
30004e80:	e59d000c 	ldr	r0, [sp, #12]
30004e84:	ebffff5a 	bl	30004bf4 <acoral_evt_init>
	return evt;
30004e88:	e59d300c 	ldr	r3, [sp, #12]
}
30004e8c:	e1a00003 	mov	r0, r3
30004e90:	e28dd014 	add	sp, sp, #20
30004e94:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004e98:	e12fff1e 	bx	lr

30004e9c <acoral_mutex_del>:
/*=============================
 *  The deletion of the mutex
 *      信号号删除函数
 *============================= */
acoral_u32 acoral_mutex_del(acoral_evt_t *evt, acoral_u32 opt)
{
30004e9c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004ea0:	e24dd014 	sub	sp, sp, #20
30004ea4:	e58d0004 	str	r0, [sp, #4]
30004ea8:	e58d1000 	str	r1, [sp]
	acoral_sr            cpu_sr;

	/* 参数检测 */
	if (NULL == evt)
30004eac:	e59d3004 	ldr	r3, [sp, #4]
30004eb0:	e3530000 	cmp	r3, #0
30004eb4:	1a000001 	bne	30004ec0 <acoral_mutex_del+0x24>
	{
		return MUTEX_ERR_NULL; /*error*/
30004eb8:	e3a03002 	mov	r3, #2
30004ebc:	ea000015 	b	30004f18 <acoral_mutex_del+0x7c>
	}

	if ( ACORAL_EVENT_MUTEX != evt->type )
30004ec0:	e59d3004 	ldr	r3, [sp, #4]
30004ec4:	e5d33004 	ldrb	r3, [r3, #4]
30004ec8:	e3530001 	cmp	r3, #1
30004ecc:	0a000001 	beq	30004ed8 <acoral_mutex_del+0x3c>
	{
		return MUTEX_ERR_TYPE; /*error*/
30004ed0:	e3a03003 	mov	r3, #3
30004ed4:	ea00000f 	b	30004f18 <acoral_mutex_del+0x7c>
	}

	/* 是否有任务等待*/
	HAL_ENTER_CRITICAL();
30004ed8:	ebfff205 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30004edc:	e1a03000 	mov	r3, r0
30004ee0:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if (acoral_evt_queue_empty(evt))
30004ee4:	e59d0004 	ldr	r0, [sp, #4]
30004ee8:	ebffff4d 	bl	30004c24 <acoral_evt_queue_empty>
30004eec:	e1a03000 	mov	r3, r0
30004ef0:	e20330ff 	and	r3, r3, #255	; 0xff
30004ef4:	e3530000 	cmp	r3, #0
30004ef8:	0a000003 	beq	30004f0c <acoral_mutex_del+0x70>
	{
		/*无等待任务删除*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004efc:	e59d000c 	ldr	r0, [sp, #12]
30004f00:	ebfff1f9 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_SUCCED;
30004f04:	e3a03000 	mov	r3, #0
30004f08:	ea000002 	b	30004f18 <acoral_mutex_del+0x7c>
	}
	else
	{
		/*有等待任务*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004f0c:	e59d000c 	ldr	r0, [sp, #12]
30004f10:	ebfff1f5 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_TASK_EXIST;
30004f14:	e3a03004 	mov	r3, #4
	}
}
30004f18:	e1a00003 	mov	r0, r3
30004f1c:	e28dd014 	add	sp, sp, #20
30004f20:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004f24:	e12fff1e 	bx	lr

30004f28 <acoral_mutex_trypend>:
 *  the appliation for mutex
 *      信号号申请操作
 *  	  非阻塞式
 *=============================*/
acoral_u32 acoral_mutex_trypend(acoral_evt_t *evt)
{
30004f28:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004f2c:	e24dd014 	sub	sp, sp, #20
30004f30:	e58d0004 	str	r0, [sp, #4]
	acoral_sr        cpu_sr;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
30004f34:	ebfff209 	bl	30001760 <hal_get_intr_nesting_comm>
30004f38:	e1a03000 	mov	r3, r0
30004f3c:	e3530000 	cmp	r3, #0
30004f40:	da000001 	ble	30004f4c <acoral_mutex_trypend+0x24>
		return MUTEX_ERR_INTR;
30004f44:	e3a03005 	mov	r3, #5
30004f48:	ea000027 	b	30004fec <acoral_mutex_trypend+0xc4>
	
	cur=acoral_cur_thread;
30004f4c:	e59f30a8 	ldr	r3, [pc, #168]	; 30004ffc <acoral_mutex_trypend+0xd4>
30004f50:	e5933000 	ldr	r3, [r3]
30004f54:	e58d300c 	str	r3, [sp, #12]
	
	HAL_ENTER_CRITICAL();
30004f58:	ebfff1e5 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30004f5c:	e1a03000 	mov	r3, r0
30004f60:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if (NULL== evt)
30004f64:	e59d3004 	ldr	r3, [sp, #4]
30004f68:	e3530000 	cmp	r3, #0
30004f6c:	1a000003 	bne	30004f80 <acoral_mutex_trypend+0x58>
	{
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004f70:	e59d0008 	ldr	r0, [sp, #8]
30004f74:	ebfff1dc 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_NULL;
30004f78:	e3a03002 	mov	r3, #2
30004f7c:	ea00001a 	b	30004fec <acoral_mutex_trypend+0xc4>
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
30004f80:	e59d3004 	ldr	r3, [sp, #4]
30004f84:	e593300c 	ldr	r3, [r3, #12]
30004f88:	e20330ff 	and	r3, r3, #255	; 0xff
30004f8c:	e35300ff 	cmp	r3, #255	; 0xff
30004f90:	1a000012 	bne	30004fe0 <acoral_mutex_trypend+0xb8>
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
30004f94:	e59d3004 	ldr	r3, [sp, #4]
30004f98:	e593300c 	ldr	r3, [r3, #12]
30004f9c:	e2032cff 	and	r2, r3, #65280	; 0xff00
30004fa0:	e59d3004 	ldr	r3, [sp, #4]
30004fa4:	e583200c 	str	r2, [r3, #12]
		evt->count |= cur->prio;
30004fa8:	e59d3004 	ldr	r3, [sp, #4]
30004fac:	e593200c 	ldr	r2, [r3, #12]
30004fb0:	e59d300c 	ldr	r3, [sp, #12]
30004fb4:	e5d33005 	ldrb	r3, [r3, #5]
30004fb8:	e1822003 	orr	r2, r2, r3
30004fbc:	e59d3004 	ldr	r3, [sp, #4]
30004fc0:	e583200c 	str	r2, [r3, #12]
		evt->data = (void*)cur;
30004fc4:	e59d3004 	ldr	r3, [sp, #4]
30004fc8:	e59d200c 	ldr	r2, [sp, #12]
30004fcc:	e5832020 	str	r2, [r3, #32]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004fd0:	e59d0008 	ldr	r0, [sp, #8]
30004fd4:	ebfff1c4 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_SUCCED;
30004fd8:	e3a03000 	mov	r3, #0
30004fdc:	ea000002 	b	30004fec <acoral_mutex_trypend+0xc4>
	}

	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30004fe0:	e59d0008 	ldr	r0, [sp, #8]
30004fe4:	ebfff1c0 	bl	300016ec <HAL_INTR_RESTORE>
	return MUTEX_ERR_TIMEOUT;
30004fe8:	e3a03007 	mov	r3, #7
}
30004fec:	e1a00003 	mov	r0, r3
30004ff0:	e28dd014 	add	sp, sp, #20
30004ff4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004ff8:	e12fff1e 	bx	lr
30004ffc:	30010630 	.word	0x30010630

30005000 <acoral_mutex_pend>:
 *  the appliation for mutex
 *      信号号申请操作
 *  优先级继承的优先级反转解决
 *=============================*/
acoral_u32 acoral_mutex_pend(acoral_evt_t *evt, acoral_time timeout)
{
30005000:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30005004:	e24dd01c 	sub	sp, sp, #28
30005008:	e58d0004 	str	r0, [sp, #4]
3000500c:	e58d1000 	str	r1, [sp]
	acoral_u8        highPrio;
	acoral_u8        ownerPrio;
	acoral_thread_t *thread;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
30005010:	ebfff1d2 	bl	30001760 <hal_get_intr_nesting_comm>
30005014:	e1a03000 	mov	r3, r0
30005018:	e3530000 	cmp	r3, #0
3000501c:	da000001 	ble	30005028 <acoral_mutex_pend+0x28>
		return MUTEX_ERR_INTR;
30005020:	e3a03005 	mov	r3, #5
30005024:	ea000087 	b	30005248 <acoral_mutex_pend+0x248>
	
	cur=acoral_cur_thread;
30005028:	e59f3228 	ldr	r3, [pc, #552]	; 30005258 <acoral_mutex_pend+0x258>
3000502c:	e5933000 	ldr	r3, [r3]
30005030:	e58d3014 	str	r3, [sp, #20]
	
	HAL_ENTER_CRITICAL();
30005034:	ebfff1ae 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30005038:	e1a03000 	mov	r3, r0
3000503c:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if (NULL== evt)
30005040:	e59d3004 	ldr	r3, [sp, #4]
30005044:	e3530000 	cmp	r3, #0
30005048:	1a000003 	bne	3000505c <acoral_mutex_pend+0x5c>
	{
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
3000504c:	e59d0008 	ldr	r0, [sp, #8]
30005050:	ebfff1a5 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_NULL;
30005054:	e3a03002 	mov	r3, #2
30005058:	ea00007a 	b	30005248 <acoral_mutex_pend+0x248>
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
3000505c:	e59d3004 	ldr	r3, [sp, #4]
30005060:	e593300c 	ldr	r3, [r3, #12]
30005064:	e20330ff 	and	r3, r3, #255	; 0xff
30005068:	e35300ff 	cmp	r3, #255	; 0xff
3000506c:	1a000012 	bne	300050bc <acoral_mutex_pend+0xbc>
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
30005070:	e59d3004 	ldr	r3, [sp, #4]
30005074:	e593300c 	ldr	r3, [r3, #12]
30005078:	e2032cff 	and	r2, r3, #65280	; 0xff00
3000507c:	e59d3004 	ldr	r3, [sp, #4]
30005080:	e583200c 	str	r2, [r3, #12]
		evt->count |= cur->prio;
30005084:	e59d3004 	ldr	r3, [sp, #4]
30005088:	e593200c 	ldr	r2, [r3, #12]
3000508c:	e59d3014 	ldr	r3, [sp, #20]
30005090:	e5d33005 	ldrb	r3, [r3, #5]
30005094:	e1822003 	orr	r2, r2, r3
30005098:	e59d3004 	ldr	r3, [sp, #4]
3000509c:	e583200c 	str	r2, [r3, #12]
		evt->data = (void*)cur;
300050a0:	e59d3004 	ldr	r3, [sp, #4]
300050a4:	e59d2014 	ldr	r2, [sp, #20]
300050a8:	e5832020 	str	r2, [r3, #32]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300050ac:	e59d0008 	ldr	r0, [sp, #8]
300050b0:	ebfff18d 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_SUCCED;
300050b4:	e3a03000 	mov	r3, #0
300050b8:	ea000062 	b	30005248 <acoral_mutex_pend+0x248>
	}
	
	/* 互斥量已被占有*/
	highPrio = (acoral_u8)(evt->count >> 8);
300050bc:	e59d3004 	ldr	r3, [sp, #4]
300050c0:	e593300c 	ldr	r3, [r3, #12]
300050c4:	e1a03443 	asr	r3, r3, #8
300050c8:	e5cd300e 	strb	r3, [sp, #14]
	thread = (acoral_thread_t*)evt->data;
300050cc:	e59d3004 	ldr	r3, [sp, #4]
300050d0:	e5933020 	ldr	r3, [r3, #32]
300050d4:	e58d3010 	str	r3, [sp, #16]

	if (thread->prio>cur->prio)
300050d8:	e59d3010 	ldr	r3, [sp, #16]
300050dc:	e5d32005 	ldrb	r2, [r3, #5]
300050e0:	e59d3014 	ldr	r3, [sp, #20]
300050e4:	e5d33005 	ldrb	r3, [r3, #5]
300050e8:	e1520003 	cmp	r2, r3
300050ec:	9a000017 	bls	30005150 <acoral_mutex_pend+0x150>
	{
		/*有可能优先级反转，继承最高优先级*/
		if(cur->prio<highPrio)
300050f0:	e59d3014 	ldr	r3, [sp, #20]
300050f4:	e5d33005 	ldrb	r3, [r3, #5]
300050f8:	e5dd200e 	ldrb	r2, [sp, #14]
300050fc:	e1520003 	cmp	r2, r3
30005100:	9a00000e 	bls	30005140 <acoral_mutex_pend+0x140>
		{
			highPrio=cur->prio;
30005104:	e59d3014 	ldr	r3, [sp, #20]
30005108:	e5d33005 	ldrb	r3, [r3, #5]
3000510c:	e5cd300e 	strb	r3, [sp, #14]
			evt->count &= ~MUTEX_U_MASK;
30005110:	e59d3004 	ldr	r3, [sp, #4]
30005114:	e593300c 	ldr	r3, [r3, #12]
30005118:	e3c32cff 	bic	r2, r3, #65280	; 0xff00
3000511c:	e59d3004 	ldr	r3, [sp, #4]
30005120:	e583200c 	str	r2, [r3, #12]
			evt->count |= highPrio << 8;
30005124:	e59d3004 	ldr	r3, [sp, #4]
30005128:	e593200c 	ldr	r2, [r3, #12]
3000512c:	e5dd300e 	ldrb	r3, [sp, #14]
30005130:	e1a03403 	lsl	r3, r3, #8
30005134:	e1822003 	orr	r2, r2, r3
30005138:	e59d3004 	ldr	r3, [sp, #4]
3000513c:	e583200c 	str	r2, [r3, #12]
		}
		acoral_thread_change_prio(thread,highPrio);
30005140:	e5dd300e 	ldrb	r3, [sp, #14]
30005144:	e59d0010 	ldr	r0, [sp, #16]
30005148:	e1a01003 	mov	r1, r3
3000514c:	ebfff64d 	bl	30002a88 <acoral_thread_change_prio>
	}
	/*不需要或不能提高优先级*/
	acoral_unrdy_thread(cur);
30005150:	e59d0014 	ldr	r0, [sp, #20]
30005154:	ebfff694 	bl	30002bac <acoral_unrdy_thread>
	acoral_evt_queue_add(evt,cur);
30005158:	e59d0004 	ldr	r0, [sp, #4]
3000515c:	e59d1014 	ldr	r1, [sp, #20]
30005160:	ebfffed1 	bl	30004cac <acoral_evt_queue_add>
	if (timeout > 0)
30005164:	e59d3000 	ldr	r3, [sp]
30005168:	e3530000 	cmp	r3, #0
3000516c:	0a00000f 	beq	300051b0 <acoral_mutex_pend+0x1b0>
	{
		/*加载到超时队列*/
		cur->delay = TIME_TO_TICKS(timeout);
30005170:	e59d2000 	ldr	r2, [sp]
30005174:	e1a03002 	mov	r3, r2
30005178:	e1a03103 	lsl	r3, r3, #2
3000517c:	e0833002 	add	r3, r3, r2
30005180:	e1a02103 	lsl	r2, r3, #2
30005184:	e0833002 	add	r3, r3, r2
30005188:	e1a03103 	lsl	r3, r3, #2
3000518c:	e1a02003 	mov	r2, r3
30005190:	e59f30c4 	ldr	r3, [pc, #196]	; 3000525c <acoral_mutex_pend+0x25c>
30005194:	e0831392 	umull	r1, r3, r2, r3
30005198:	e1a03323 	lsr	r3, r3, #6
3000519c:	e1a02003 	mov	r2, r3
300051a0:	e59d3014 	ldr	r3, [sp, #20]
300051a4:	e5832040 	str	r2, [r3, #64]	; 0x40
		timeout_queue_add(cur);
300051a8:	e59d0014 	ldr	r0, [sp, #20]
300051ac:	ebfffd93 	bl	30004800 <timeout_queue_add>
	}
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
300051b0:	e59d0008 	ldr	r0, [sp, #8]
300051b4:	ebfff14c 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
300051b8:	ebfff494 	bl	30002410 <acoral_sched>
	HAL_ENTER_CRITICAL();
300051bc:	ebfff14c 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300051c0:	e1a03000 	mov	r3, r0
300051c4:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if(evt->data!=cur&&timeout>0&&cur->delay<=0){
300051c8:	e59d3004 	ldr	r3, [sp, #4]
300051cc:	e5932020 	ldr	r2, [r3, #32]
300051d0:	e59d3014 	ldr	r3, [sp, #20]
300051d4:	e1520003 	cmp	r2, r3
300051d8:	0a00000c 	beq	30005210 <acoral_mutex_pend+0x210>
300051dc:	e59d3000 	ldr	r3, [sp]
300051e0:	e3530000 	cmp	r3, #0
300051e4:	0a000009 	beq	30005210 <acoral_mutex_pend+0x210>
300051e8:	e59d3014 	ldr	r3, [sp, #20]
300051ec:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300051f0:	e3530000 	cmp	r3, #0
300051f4:	ca000005 	bgt	30005210 <acoral_mutex_pend+0x210>
		acoral_printk("Time Out Return\n");
		acoral_evt_queue_del(cur);
300051f8:	e59d0014 	ldr	r0, [sp, #20]
300051fc:	ebfffedb 	bl	30004d70 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005200:	e59d0008 	ldr	r0, [sp, #8]
30005204:	ebfff138 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_TIMEOUT;
30005208:	e3a03007 	mov	r3, #7
3000520c:	ea00000d 	b	30005248 <acoral_mutex_pend+0x248>
	}

	//---------------
	// modify by pegasus 0804: timeout_queue_del [+]
	timeout_queue_del(cur);
30005210:	e59d0014 	ldr	r0, [sp, #20]
30005214:	ebfffdbb 	bl	30004908 <timeout_queue_del>

	if(evt->data!=cur){
30005218:	e59d3004 	ldr	r3, [sp, #4]
3000521c:	e5932020 	ldr	r2, [r3, #32]
30005220:	e59d3014 	ldr	r3, [sp, #20]
30005224:	e1520003 	cmp	r2, r3
30005228:	0a000005 	beq	30005244 <acoral_mutex_pend+0x244>
		acoral_printk("Err Ready Return\n");
		acoral_evt_queue_del(cur);
3000522c:	e59d0014 	ldr	r0, [sp, #20]
30005230:	ebfffece 	bl	30004d70 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005234:	e59d0008 	ldr	r0, [sp, #8]
30005238:	ebfff12b 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_RDY;
3000523c:	e3a03008 	mov	r3, #8
30005240:	ea000000 	b	30005248 <acoral_mutex_pend+0x248>
	}
	
	return MUTEX_SUCCED;
30005244:	e3a03000 	mov	r3, #0
}
30005248:	e1a00003 	mov	r0, r3
3000524c:	e28dd01c 	add	sp, sp, #28
30005250:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30005254:	e12fff1e 	bx	lr
30005258:	30010630 	.word	0x30010630
3000525c:	10624dd3 	.word	0x10624dd3

30005260 <acoral_mutex_pend2>:
 *  the appliation for mutex
 *      信号号申请操作
 *  优先级天花板的优先级反转解决
 *=============================*/
acoral_u32 acoral_mutex_pend2(acoral_evt_t *evt, acoral_time timeout)
{
30005260:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30005264:	e24dd01c 	sub	sp, sp, #28
30005268:	e58d0004 	str	r0, [sp, #4]
3000526c:	e58d1000 	str	r1, [sp]
	acoral_u8        highPrio;
	acoral_u8        ownerPrio;
	acoral_thread_t *thread;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
30005270:	ebfff13a 	bl	30001760 <hal_get_intr_nesting_comm>
30005274:	e1a03000 	mov	r3, r0
30005278:	e3530000 	cmp	r3, #0
3000527c:	da000001 	ble	30005288 <acoral_mutex_pend2+0x28>
		return MUTEX_ERR_INTR;
30005280:	e3a03005 	mov	r3, #5
30005284:	ea000069 	b	30005430 <acoral_mutex_pend2+0x1d0>
	
	cur=acoral_cur_thread;
30005288:	e59f31b0 	ldr	r3, [pc, #432]	; 30005440 <acoral_mutex_pend2+0x1e0>
3000528c:	e5933000 	ldr	r3, [r3]
30005290:	e58d3014 	str	r3, [sp, #20]
	
	HAL_ENTER_CRITICAL();
30005294:	ebfff116 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30005298:	e1a03000 	mov	r3, r0
3000529c:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if (NULL== evt)
300052a0:	e59d3004 	ldr	r3, [sp, #4]
300052a4:	e3530000 	cmp	r3, #0
300052a8:	1a000003 	bne	300052bc <acoral_mutex_pend2+0x5c>
	{
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300052ac:	e59d0008 	ldr	r0, [sp, #8]
300052b0:	ebfff10d 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_NULL;
300052b4:	e3a03002 	mov	r3, #2
300052b8:	ea00005c 	b	30005430 <acoral_mutex_pend2+0x1d0>
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
300052bc:	e59d3004 	ldr	r3, [sp, #4]
300052c0:	e593300c 	ldr	r3, [r3, #12]
300052c4:	e20330ff 	and	r3, r3, #255	; 0xff
300052c8:	e35300ff 	cmp	r3, #255	; 0xff
300052cc:	1a000019 	bne	30005338 <acoral_mutex_pend2+0xd8>
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
300052d0:	e59d3004 	ldr	r3, [sp, #4]
300052d4:	e593300c 	ldr	r3, [r3, #12]
300052d8:	e2032cff 	and	r2, r3, #65280	; 0xff00
300052dc:	e59d3004 	ldr	r3, [sp, #4]
300052e0:	e583200c 	str	r2, [r3, #12]
		evt->count |= cur->prio;
300052e4:	e59d3004 	ldr	r3, [sp, #4]
300052e8:	e593200c 	ldr	r2, [r3, #12]
300052ec:	e59d3014 	ldr	r3, [sp, #20]
300052f0:	e5d33005 	ldrb	r3, [r3, #5]
300052f4:	e1822003 	orr	r2, r2, r3
300052f8:	e59d3004 	ldr	r3, [sp, #4]
300052fc:	e583200c 	str	r2, [r3, #12]
		evt->data = (void*)cur;
30005300:	e59d3004 	ldr	r3, [sp, #4]
30005304:	e59d2014 	ldr	r2, [sp, #20]
30005308:	e5832020 	str	r2, [r3, #32]

		/*提升至天花板优先级*/
		cur->prio = (evt->count & MUTEX_CEILING_MASK)>> 16;
3000530c:	e59d3004 	ldr	r3, [sp, #4]
30005310:	e593300c 	ldr	r3, [r3, #12]
30005314:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
30005318:	e1a03843 	asr	r3, r3, #16
3000531c:	e20320ff 	and	r2, r3, #255	; 0xff
30005320:	e59d3014 	ldr	r3, [sp, #20]
30005324:	e5c32005 	strb	r2, [r3, #5]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005328:	e59d0008 	ldr	r0, [sp, #8]
3000532c:	ebfff0ee 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_SUCCED;
30005330:	e3a03000 	mov	r3, #0
30005334:	ea00003d 	b	30005430 <acoral_mutex_pend2+0x1d0>
	}
	
	/* 互斥量已被占有*/
	acoral_unrdy_thread(cur);
30005338:	e59d0014 	ldr	r0, [sp, #20]
3000533c:	ebfff61a 	bl	30002bac <acoral_unrdy_thread>
	acoral_evt_queue_add(evt,cur);
30005340:	e59d0004 	ldr	r0, [sp, #4]
30005344:	e59d1014 	ldr	r1, [sp, #20]
30005348:	ebfffe57 	bl	30004cac <acoral_evt_queue_add>
	if (timeout > 0)
3000534c:	e59d3000 	ldr	r3, [sp]
30005350:	e3530000 	cmp	r3, #0
30005354:	0a00000f 	beq	30005398 <acoral_mutex_pend2+0x138>
	{
		/*加载到超时队列*/
		cur->delay = TIME_TO_TICKS(timeout);
30005358:	e59d2000 	ldr	r2, [sp]
3000535c:	e1a03002 	mov	r3, r2
30005360:	e1a03103 	lsl	r3, r3, #2
30005364:	e0833002 	add	r3, r3, r2
30005368:	e1a02103 	lsl	r2, r3, #2
3000536c:	e0833002 	add	r3, r3, r2
30005370:	e1a03103 	lsl	r3, r3, #2
30005374:	e1a02003 	mov	r2, r3
30005378:	e59f30c4 	ldr	r3, [pc, #196]	; 30005444 <acoral_mutex_pend2+0x1e4>
3000537c:	e0831392 	umull	r1, r3, r2, r3
30005380:	e1a03323 	lsr	r3, r3, #6
30005384:	e1a02003 	mov	r2, r3
30005388:	e59d3014 	ldr	r3, [sp, #20]
3000538c:	e5832040 	str	r2, [r3, #64]	; 0x40
		timeout_queue_add(cur);
30005390:	e59d0014 	ldr	r0, [sp, #20]
30005394:	ebfffd19 	bl	30004800 <timeout_queue_add>
	}
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30005398:	e59d0008 	ldr	r0, [sp, #8]
3000539c:	ebfff0d2 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
300053a0:	ebfff41a 	bl	30002410 <acoral_sched>
	HAL_ENTER_CRITICAL();
300053a4:	ebfff0d2 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300053a8:	e1a03000 	mov	r3, r0
300053ac:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if(evt->data!=cur&&timeout>0&&cur->delay<=0){
300053b0:	e59d3004 	ldr	r3, [sp, #4]
300053b4:	e5932020 	ldr	r2, [r3, #32]
300053b8:	e59d3014 	ldr	r3, [sp, #20]
300053bc:	e1520003 	cmp	r2, r3
300053c0:	0a00000c 	beq	300053f8 <acoral_mutex_pend2+0x198>
300053c4:	e59d3000 	ldr	r3, [sp]
300053c8:	e3530000 	cmp	r3, #0
300053cc:	0a000009 	beq	300053f8 <acoral_mutex_pend2+0x198>
300053d0:	e59d3014 	ldr	r3, [sp, #20]
300053d4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300053d8:	e3530000 	cmp	r3, #0
300053dc:	ca000005 	bgt	300053f8 <acoral_mutex_pend2+0x198>
		acoral_printk("Time Out Return\n");
		acoral_evt_queue_del(cur);
300053e0:	e59d0014 	ldr	r0, [sp, #20]
300053e4:	ebfffe61 	bl	30004d70 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300053e8:	e59d0008 	ldr	r0, [sp, #8]
300053ec:	ebfff0be 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_TIMEOUT;
300053f0:	e3a03007 	mov	r3, #7
300053f4:	ea00000d 	b	30005430 <acoral_mutex_pend2+0x1d0>
	}

	//---------------
	// modify by pegasus 0804: timeout_queue_del [+]
	timeout_queue_del(cur);
300053f8:	e59d0014 	ldr	r0, [sp, #20]
300053fc:	ebfffd41 	bl	30004908 <timeout_queue_del>

	if(evt->data!=cur){
30005400:	e59d3004 	ldr	r3, [sp, #4]
30005404:	e5932020 	ldr	r2, [r3, #32]
30005408:	e59d3014 	ldr	r3, [sp, #20]
3000540c:	e1520003 	cmp	r2, r3
30005410:	0a000005 	beq	3000542c <acoral_mutex_pend2+0x1cc>
		acoral_printk("Err Ready Return\n");
		acoral_evt_queue_del(cur);
30005414:	e59d0014 	ldr	r0, [sp, #20]
30005418:	ebfffe54 	bl	30004d70 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
3000541c:	e59d0008 	ldr	r0, [sp, #8]
30005420:	ebfff0b1 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_RDY;
30005424:	e3a03008 	mov	r3, #8
30005428:	ea000000 	b	30005430 <acoral_mutex_pend2+0x1d0>
	}
	
	return MUTEX_SUCCED;
3000542c:	e3a03000 	mov	r3, #0
}
30005430:	e1a00003 	mov	r0, r3
30005434:	e28dd01c 	add	sp, sp, #28
30005438:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000543c:	e12fff1e 	bx	lr
30005440:	30010630 	.word	0x30010630
30005444:	10624dd3 	.word	0x10624dd3

30005448 <acoral_mutex_post>:
/*============================
 *  post a mutex to thread
 *     信号量的释放
 *===========================*/
acoral_u32 acoral_mutex_post(acoral_evt_t *evt)
{
30005448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000544c:	e24dd01c 	sub	sp, sp, #28
30005450:	e58d0004 	str	r0, [sp, #4]
	acoral_u8             ownerPrio;
	acoral_u8             highPrio;
	acoral_thread_t      *thread;
	acoral_thread_t      *cur;

	HAL_ENTER_CRITICAL();
30005454:	ebfff0a6 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30005458:	e1a03000 	mov	r3, r0
3000545c:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);

	if ( NULL == evt )
30005460:	e59d3004 	ldr	r3, [sp, #4]
30005464:	e3530000 	cmp	r3, #0
30005468:	1a000005 	bne	30005484 <acoral_mutex_post+0x3c>
	{
		acoral_printerr("mutex NULL\n");
3000546c:	e59f0170 	ldr	r0, [pc, #368]	; 300055e4 <acoral_mutex_post+0x19c>
30005470:	eb0017eb 	bl	3000b424 <acoral_print>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005474:	e59d0008 	ldr	r0, [sp, #8]
30005478:	ebfff09b 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_NULL;   /*error*/
3000547c:	e3a03002 	mov	r3, #2
30005480:	ea000053 	b	300055d4 <acoral_mutex_post+0x18c>
	}
	
	highPrio  = (acoral_u8)(evt->count >> 8);
30005484:	e59d3004 	ldr	r3, [sp, #4]
30005488:	e593300c 	ldr	r3, [r3, #12]
3000548c:	e1a03443 	asr	r3, r3, #8
30005490:	e5cd300f 	strb	r3, [sp, #15]
	ownerPrio = (acoral_u8)(evt->count & MUTEX_L_MASK);
30005494:	e59d3004 	ldr	r3, [sp, #4]
30005498:	e593300c 	ldr	r3, [r3, #12]
3000549c:	e5cd300e 	strb	r3, [sp, #14]
	cur=acoral_cur_thread;
300054a0:	e59f3140 	ldr	r3, [pc, #320]	; 300055e8 <acoral_mutex_post+0x1a0>
300054a4:	e5933000 	ldr	r3, [r3]
300054a8:	e58d3014 	str	r3, [sp, #20]
	if (highPrio!=0&&cur->prio != highPrio && cur->prio != ownerPrio )
300054ac:	e5dd300f 	ldrb	r3, [sp, #15]
300054b0:	e3530000 	cmp	r3, #0
300054b4:	0a00000f 	beq	300054f8 <acoral_mutex_post+0xb0>
300054b8:	e59d3014 	ldr	r3, [sp, #20]
300054bc:	e5d33005 	ldrb	r3, [r3, #5]
300054c0:	e5dd200f 	ldrb	r2, [sp, #15]
300054c4:	e1520003 	cmp	r2, r3
300054c8:	0a00000a 	beq	300054f8 <acoral_mutex_post+0xb0>
300054cc:	e59d3014 	ldr	r3, [sp, #20]
300054d0:	e5d33005 	ldrb	r3, [r3, #5]
300054d4:	e5dd200e 	ldrb	r2, [sp, #14]
300054d8:	e1520003 	cmp	r2, r3
300054dc:	0a000005 	beq	300054f8 <acoral_mutex_post+0xb0>
	{
		acoral_printerr("mutex prio err\n");
300054e0:	e59f0104 	ldr	r0, [pc, #260]	; 300055ec <acoral_mutex_post+0x1a4>
300054e4:	eb0017ce 	bl	3000b424 <acoral_print>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300054e8:	e59d0008 	ldr	r0, [sp, #8]
300054ec:	ebfff07e 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_UNDEF;
300054f0:	e3a03006 	mov	r3, #6
300054f4:	ea000036 	b	300055d4 <acoral_mutex_post+0x18c>
	}
	cur->evt=NULL;	
300054f8:	e59d3014 	ldr	r3, [sp, #20]
300054fc:	e3a02000 	mov	r2, #0
30005500:	e5832030 	str	r2, [r3, #48]	; 0x30
	if (cur->prio != ownerPrio)
30005504:	e59d3014 	ldr	r3, [sp, #20]
30005508:	e5d33005 	ldrb	r3, [r3, #5]
3000550c:	e5dd200e 	ldrb	r2, [sp, #14]
30005510:	e1520003 	cmp	r2, r3
30005514:	0a000002 	beq	30005524 <acoral_mutex_post+0xdc>
	{
		/* 提升过优先级，进行优先级复原*/
		acoral_change_prio_self(ownerPrio);
30005518:	e5dd300e 	ldrb	r3, [sp, #14]
3000551c:	e1a00003 	mov	r0, r3
30005520:	ebfff577 	bl	30002b04 <acoral_change_prio_self>
	}
    
	thread =acoral_evt_high_thread(evt);
30005524:	e59d0004 	ldr	r0, [sp, #4]
30005528:	ebfffdcb 	bl	30004c5c <acoral_evt_high_thread>
3000552c:	e1a03000 	mov	r3, r0
30005530:	e58d3010 	str	r3, [sp, #16]
	if (thread==NULL){
30005534:	e59d3010 	ldr	r3, [sp, #16]
30005538:	e3530000 	cmp	r3, #0
3000553c:	1a00000b 	bne	30005570 <acoral_mutex_post+0x128>
			evt->count |= MUTEX_AVAI;
30005540:	e59d3004 	ldr	r3, [sp, #4]
30005544:	e593300c 	ldr	r3, [r3, #12]
30005548:	e38320ff 	orr	r2, r3, #255	; 0xff
3000554c:	e59d3004 	ldr	r3, [sp, #4]
30005550:	e583200c 	str	r2, [r3, #12]
			evt->data = NULL;
30005554:	e59d3004 	ldr	r3, [sp, #4]
30005558:	e3a02000 	mov	r2, #0
3000555c:	e5832020 	str	r2, [r3, #32]
			acoral_spin_unlock(&evt->spin_lock);
			HAL_EXIT_CRITICAL();
30005560:	e59d0008 	ldr	r0, [sp, #8]
30005564:	ebfff060 	bl	300016ec <HAL_INTR_RESTORE>
			return MUTEX_SUCCED;
30005568:	e3a03000 	mov	r3, #0
3000556c:	ea000018 	b	300055d4 <acoral_mutex_post+0x18c>
	}
	timeout_queue_del(thread);
30005570:	e59d0010 	ldr	r0, [sp, #16]
30005574:	ebfffce3 	bl	30004908 <timeout_queue_del>
	acoral_evt_queue_del(thread);
30005578:	e59d0010 	ldr	r0, [sp, #16]
3000557c:	ebfffdfb 	bl	30004d70 <acoral_evt_queue_del>
#ifdef CFG_TEST
	acoral_print("%d post %d\n",cur->prio,thread->prio);
#endif
	evt->count &= MUTEX_U_MASK;
30005580:	e59d3004 	ldr	r3, [sp, #4]
30005584:	e593300c 	ldr	r3, [r3, #12]
30005588:	e2032cff 	and	r2, r3, #65280	; 0xff00
3000558c:	e59d3004 	ldr	r3, [sp, #4]
30005590:	e583200c 	str	r2, [r3, #12]
	evt->count |= thread->prio;
30005594:	e59d3004 	ldr	r3, [sp, #4]
30005598:	e593200c 	ldr	r2, [r3, #12]
3000559c:	e59d3010 	ldr	r3, [sp, #16]
300055a0:	e5d33005 	ldrb	r3, [r3, #5]
300055a4:	e1822003 	orr	r2, r2, r3
300055a8:	e59d3004 	ldr	r3, [sp, #4]
300055ac:	e583200c 	str	r2, [r3, #12]
	evt->data = thread;
300055b0:	e59d3004 	ldr	r3, [sp, #4]
300055b4:	e59d2010 	ldr	r2, [sp, #16]
300055b8:	e5832020 	str	r2, [r3, #32]
	acoral_rdy_thread(thread);
300055bc:	e59d0010 	ldr	r0, [sp, #16]
300055c0:	ebfff56a 	bl	30002b70 <acoral_rdy_thread>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
300055c4:	e59d0008 	ldr	r0, [sp, #8]
300055c8:	ebfff047 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
300055cc:	ebfff38f 	bl	30002410 <acoral_sched>
	return MUTEX_SUCCED;
300055d0:	e3a03000 	mov	r3, #0
}
300055d4:	e1a00003 	mov	r0, r3
300055d8:	e28dd01c 	add	sp, sp, #28
300055dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300055e0:	e12fff1e 	bx	lr
300055e4:	3000e5e8 	.word	0x3000e5e8
300055e8:	30010630 	.word	0x30010630
300055ec:	3000e5f4 	.word	0x3000e5f4

300055f0 <buddy_scan>:
}acoral_block_ctr_t;

acoral_block_ctr_t *acoral_mem_ctrl;
acoral_block_t *acoral_mem_blocks;

void buddy_scan(){
300055f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300055f4:	e24dd01c 	sub	sp, sp, #28
	acoral_u32 i,k,num,n;	
	acoral_u32 max_level=acoral_mem_ctrl->level;
300055f8:	e59f314c 	ldr	r3, [pc, #332]	; 3000574c <buddy_scan+0x15c>
300055fc:	e5933000 	ldr	r3, [r3]
30005600:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30005604:	e1a03c03 	lsl	r3, r3, #24
30005608:	e1a03c43 	asr	r3, r3, #24
3000560c:	e58d3014 	str	r3, [sp, #20]
	for(i=0;i<max_level;i++){
30005610:	e3a03000 	mov	r3, #0
30005614:	e58d3004 	str	r3, [sp, #4]
30005618:	ea00003c 	b	30005710 <buddy_scan+0x120>
		acoral_print("Level%d\r\n",i); 	
3000561c:	e59f012c 	ldr	r0, [pc, #300]	; 30005750 <buddy_scan+0x160>
30005620:	e59d1004 	ldr	r1, [sp, #4]
30005624:	eb00177e 	bl	3000b424 <acoral_print>
		acoral_prints("bitmap:"); 	
30005628:	e59f0124 	ldr	r0, [pc, #292]	; 30005754 <buddy_scan+0x164>
3000562c:	eb00179f 	bl	3000b4b0 <acoral_prints>
		num=acoral_mem_ctrl->num[i];
30005630:	e59f3114 	ldr	r3, [pc, #276]	; 3000574c <buddy_scan+0x15c>
30005634:	e5933000 	ldr	r3, [r3]
30005638:	e59d2004 	ldr	r2, [sp, #4]
3000563c:	e282202a 	add	r2, r2, #42	; 0x2a
30005640:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005644:	e58d300c 	str	r3, [sp, #12]
		for(k=0;k<num;){
30005648:	e3a03000 	mov	r3, #0
3000564c:	e58d3008 	str	r3, [sp, #8]
30005650:	ea00001d 	b	300056cc <buddy_scan+0xdc>
			for(n=0;n<8&&k<num;n++,k++){
30005654:	e3a03000 	mov	r3, #0
30005658:	e58d3010 	str	r3, [sp, #16]
3000565c:	ea000011 	b	300056a8 <buddy_scan+0xb8>
				acoral_print("%x ",acoral_mem_ctrl->bitmap[i][k]); 
30005660:	e59f30e4 	ldr	r3, [pc, #228]	; 3000574c <buddy_scan+0x15c>
30005664:	e5933000 	ldr	r3, [r3]
30005668:	e59d2004 	ldr	r2, [sp, #4]
3000566c:	e282200e 	add	r2, r2, #14
30005670:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005674:	e59d3008 	ldr	r3, [sp, #8]
30005678:	e1a03103 	lsl	r3, r3, #2
3000567c:	e0823003 	add	r3, r2, r3
30005680:	e5933000 	ldr	r3, [r3]
30005684:	e59f00cc 	ldr	r0, [pc, #204]	; 30005758 <buddy_scan+0x168>
30005688:	e1a01003 	mov	r1, r3
3000568c:	eb001764 	bl	3000b424 <acoral_print>
	for(i=0;i<max_level;i++){
		acoral_print("Level%d\r\n",i); 	
		acoral_prints("bitmap:"); 	
		num=acoral_mem_ctrl->num[i];
		for(k=0;k<num;){
			for(n=0;n<8&&k<num;n++,k++){
30005690:	e59d3010 	ldr	r3, [sp, #16]
30005694:	e2833001 	add	r3, r3, #1
30005698:	e58d3010 	str	r3, [sp, #16]
3000569c:	e59d3008 	ldr	r3, [sp, #8]
300056a0:	e2833001 	add	r3, r3, #1
300056a4:	e58d3008 	str	r3, [sp, #8]
300056a8:	e59d3010 	ldr	r3, [sp, #16]
300056ac:	e3530007 	cmp	r3, #7
300056b0:	8a000003 	bhi	300056c4 <buddy_scan+0xd4>
300056b4:	e59d2008 	ldr	r2, [sp, #8]
300056b8:	e59d300c 	ldr	r3, [sp, #12]
300056bc:	e1520003 	cmp	r2, r3
300056c0:	3affffe6 	bcc	30005660 <buddy_scan+0x70>
				acoral_print("%x ",acoral_mem_ctrl->bitmap[i][k]); 
			}	
			acoral_prints("\r\n"); 	
300056c4:	e59f0090 	ldr	r0, [pc, #144]	; 3000575c <buddy_scan+0x16c>
300056c8:	eb001778 	bl	3000b4b0 <acoral_prints>
	acoral_u32 max_level=acoral_mem_ctrl->level;
	for(i=0;i<max_level;i++){
		acoral_print("Level%d\r\n",i); 	
		acoral_prints("bitmap:"); 	
		num=acoral_mem_ctrl->num[i];
		for(k=0;k<num;){
300056cc:	e59d2008 	ldr	r2, [sp, #8]
300056d0:	e59d300c 	ldr	r3, [sp, #12]
300056d4:	e1520003 	cmp	r2, r3
300056d8:	3affffdd 	bcc	30005654 <buddy_scan+0x64>
			for(n=0;n<8&&k<num;n++,k++){
				acoral_print("%x ",acoral_mem_ctrl->bitmap[i][k]); 
			}	
			acoral_prints("\r\n"); 	
		}
		acoral_print("Free Block head:%d\r\n",acoral_mem_ctrl->free_cur[i]); 	
300056dc:	e59f3068 	ldr	r3, [pc, #104]	; 3000574c <buddy_scan+0x15c>
300056e0:	e5933000 	ldr	r3, [r3]
300056e4:	e59d2004 	ldr	r2, [sp, #4]
300056e8:	e282201c 	add	r2, r2, #28
300056ec:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300056f0:	e59f0068 	ldr	r0, [pc, #104]	; 30005760 <buddy_scan+0x170>
300056f4:	e1a01003 	mov	r1, r3
300056f8:	eb001749 	bl	3000b424 <acoral_print>
		acoral_prints("\r\n"); 	
300056fc:	e59f0058 	ldr	r0, [pc, #88]	; 3000575c <buddy_scan+0x16c>
30005700:	eb00176a 	bl	3000b4b0 <acoral_prints>
acoral_block_t *acoral_mem_blocks;

void buddy_scan(){
	acoral_u32 i,k,num,n;	
	acoral_u32 max_level=acoral_mem_ctrl->level;
	for(i=0;i<max_level;i++){
30005704:	e59d3004 	ldr	r3, [sp, #4]
30005708:	e2833001 	add	r3, r3, #1
3000570c:	e58d3004 	str	r3, [sp, #4]
30005710:	e59d2004 	ldr	r2, [sp, #4]
30005714:	e59d3014 	ldr	r3, [sp, #20]
30005718:	e1520003 	cmp	r2, r3
3000571c:	3affffbe 	bcc	3000561c <buddy_scan+0x2c>
			acoral_prints("\r\n"); 	
		}
		acoral_print("Free Block head:%d\r\n",acoral_mem_ctrl->free_cur[i]); 	
		acoral_prints("\r\n"); 	
	}
	acoral_print("Free Mem Block Number:%d\r\n",acoral_mem_ctrl->free_num); 	
30005720:	e59f3024 	ldr	r3, [pc, #36]	; 3000574c <buddy_scan+0x15c>
30005724:	e5933000 	ldr	r3, [r3]
30005728:	e59330f0 	ldr	r3, [r3, #240]	; 0xf0
3000572c:	e59f0030 	ldr	r0, [pc, #48]	; 30005764 <buddy_scan+0x174>
30005730:	e1a01003 	mov	r1, r3
30005734:	eb00173a 	bl	3000b424 <acoral_print>
	acoral_print("\r\n"); 	
30005738:	e59f001c 	ldr	r0, [pc, #28]	; 3000575c <buddy_scan+0x16c>
3000573c:	eb001738 	bl	3000b424 <acoral_print>
}
30005740:	e28dd01c 	add	sp, sp, #28
30005744:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30005748:	e12fff1e 	bx	lr
3000574c:	3001057c 	.word	0x3001057c
30005750:	3000e604 	.word	0x3000e604
30005754:	3000e610 	.word	0x3000e610
30005758:	3000e618 	.word	0x3000e618
3000575c:	3000e61c 	.word	0x3000e61c
30005760:	3000e620 	.word	0x3000e620
30005764:	3000e638 	.word	0x3000e638

30005768 <buddy_init>:

acoral_err buddy_init(acoral_u32 start_adr,acoral_u32 end_adr){
30005768:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000576c:	e24dd03c 	sub	sp, sp, #60	; 0x3c
30005770:	e58d0004 	str	r0, [sp, #4]
30005774:	e58d1000 	str	r1, [sp]
	acoral_32 i,k;
	acoral_u32 resize_size;
	acoral_u32 save_adr;
	acoral_u32 index;
	acoral_u32 num=1;
30005778:	e3a03001 	mov	r3, #1
3000577c:	e58d3020 	str	r3, [sp, #32]
	acoral_u32 adjust_level=1;
30005780:	e3a03001 	mov	r3, #1
30005784:	e58d3024 	str	r3, [sp, #36]	; 0x24
	acoral_32 level=0;
30005788:	e3a03000 	mov	r3, #0
3000578c:	e58d3028 	str	r3, [sp, #40]	; 0x28
	acoral_u32 max_num,o_num;
	acoral_u32 cur;
	start_adr+=3;
30005790:	e59d3004 	ldr	r3, [sp, #4]
30005794:	e2833003 	add	r3, r3, #3
30005798:	e58d3004 	str	r3, [sp, #4]
	start_adr&=~(4-1);		
3000579c:	e59d3004 	ldr	r3, [sp, #4]
300057a0:	e3c33003 	bic	r3, r3, #3
300057a4:	e58d3004 	str	r3, [sp, #4]
	end_adr&=~(4-1);		
300057a8:	e59d3000 	ldr	r3, [sp]
300057ac:	e3c33003 	bic	r3, r3, #3
300057b0:	e58d3000 	str	r3, [sp]
	resize_size=BLOCK_SIZE;
300057b4:	e3a03080 	mov	r3, #128	; 0x80
300057b8:	e58d3014 	str	r3, [sp, #20]
	end_adr=end_adr - sizeof(acoral_block_ctr_t);
300057bc:	e59d3000 	ldr	r3, [sp]
300057c0:	e24330fc 	sub	r3, r3, #252	; 0xfc
300057c4:	e58d3000 	str	r3, [sp]
	end_adr&=~(4-1);
300057c8:	e59d3000 	ldr	r3, [sp]
300057cc:	e3c33003 	bic	r3, r3, #3
300057d0:	e58d3000 	str	r3, [sp]
	acoral_mem_ctrl=(acoral_block_ctr_t *)end_adr;
300057d4:	e59d2000 	ldr	r2, [sp]
300057d8:	e59f3720 	ldr	r3, [pc, #1824]	; 30005f00 <buddy_init+0x798>
300057dc:	e5832000 	str	r2, [r3]
	/*如果内存这么少，不适合分配*/
	if(start_adr>end_adr||end_adr-start_adr<BLOCK_SIZE){
300057e0:	e59d2004 	ldr	r2, [sp, #4]
300057e4:	e59d3000 	ldr	r3, [sp]
300057e8:	e1520003 	cmp	r2, r3
300057ec:	8a000004 	bhi	30005804 <buddy_init+0x9c>
300057f0:	e59d2000 	ldr	r2, [sp]
300057f4:	e59d3004 	ldr	r3, [sp, #4]
300057f8:	e0633002 	rsb	r3, r3, r2
300057fc:	e353007f 	cmp	r3, #127	; 0x7f
30005800:	8a000005 	bhi	3000581c <buddy_init+0xb4>
		acoral_mem_ctrl->state=MEM_NO_ALLOC;
30005804:	e59f36f4 	ldr	r3, [pc, #1780]	; 30005f00 <buddy_init+0x798>
30005808:	e5933000 	ldr	r3, [r3]
3000580c:	e3a02000 	mov	r2, #0
30005810:	e5c320e1 	strb	r2, [r3, #225]	; 0xe1
		return -1;
30005814:	e3e03000 	mvn	r3, #0
30005818:	ea0001b4 	b	30005ef0 <buddy_init+0x788>
	}
	acoral_mem_ctrl->state=MEM_OK;
3000581c:	e59f36dc 	ldr	r3, [pc, #1756]	; 30005f00 <buddy_init+0x798>
30005820:	e5933000 	ldr	r3, [r3]
30005824:	e3a02001 	mov	r2, #1
30005828:	e5c320e1 	strb	r2, [r3, #225]	; 0xe1
	while(1){
		if(end_adr<=start_adr+resize_size)
3000582c:	e59d2004 	ldr	r2, [sp, #4]
30005830:	e59d3014 	ldr	r3, [sp, #20]
30005834:	e0822003 	add	r2, r2, r3
30005838:	e59d3000 	ldr	r3, [sp]
3000583c:	e1520003 	cmp	r2, r3
30005840:	3a00000e 	bcc	30005880 <buddy_init+0x118>
			break;
		resize_size=resize_size<<1;
		num=num<<1;
		adjust_level++;
	}
	acoral_mem_blocks=(acoral_block_t *)end_adr-num;
30005844:	e59d2000 	ldr	r2, [sp]
30005848:	e59d3020 	ldr	r3, [sp, #32]
3000584c:	e0633002 	rsb	r3, r3, r2
30005850:	e1a02003 	mov	r2, r3
30005854:	e59f36a8 	ldr	r3, [pc, #1704]	; 30005f04 <buddy_init+0x79c>
30005858:	e5832000 	str	r2, [r3]
	save_adr=(acoral_u32)acoral_mem_blocks;
3000585c:	e59f36a0 	ldr	r3, [pc, #1696]	; 30005f04 <buddy_init+0x79c>
30005860:	e5933000 	ldr	r3, [r3]
30005864:	e58d3018 	str	r3, [sp, #24]
	level=adjust_level;
30005868:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000586c:	e58d3028 	str	r3, [sp, #40]	; 0x28
	if(adjust_level>LEVEL)
30005870:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30005874:	e353000e 	cmp	r3, #14
30005878:	8a00000a 	bhi	300058a8 <buddy_init+0x140>
3000587c:	ea00000b 	b	300058b0 <buddy_init+0x148>
	}
	acoral_mem_ctrl->state=MEM_OK;
	while(1){
		if(end_adr<=start_adr+resize_size)
			break;
		resize_size=resize_size<<1;
30005880:	e59d3014 	ldr	r3, [sp, #20]
30005884:	e1a03083 	lsl	r3, r3, #1
30005888:	e58d3014 	str	r3, [sp, #20]
		num=num<<1;
3000588c:	e59d3020 	ldr	r3, [sp, #32]
30005890:	e1a03083 	lsl	r3, r3, #1
30005894:	e58d3020 	str	r3, [sp, #32]
		adjust_level++;
30005898:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000589c:	e2833001 	add	r3, r3, #1
300058a0:	e58d3024 	str	r3, [sp, #36]	; 0x24
	}
300058a4:	eaffffe0 	b	3000582c <buddy_init+0xc4>
	acoral_mem_blocks=(acoral_block_t *)end_adr-num;
	save_adr=(acoral_u32)acoral_mem_blocks;
	level=adjust_level;
	if(adjust_level>LEVEL)
		level=LEVEL;
300058a8:	e3a0300e 	mov	r3, #14
300058ac:	e58d3028 	str	r3, [sp, #40]	; 0x28
	num=num/32; 
300058b0:	e59d3020 	ldr	r3, [sp, #32]
300058b4:	e1a032a3 	lsr	r3, r3, #5
300058b8:	e58d3020 	str	r3, [sp, #32]
	for(i=0;i<level-1;i++){
300058bc:	e3a03000 	mov	r3, #0
300058c0:	e58d300c 	str	r3, [sp, #12]
300058c4:	ea00004e 	b	30005a04 <buddy_init+0x29c>
		num=num>>1;
300058c8:	e59d3020 	ldr	r3, [sp, #32]
300058cc:	e1a030a3 	lsr	r3, r3, #1
300058d0:	e58d3020 	str	r3, [sp, #32]
		if(num==0)
300058d4:	e59d3020 	ldr	r3, [sp, #32]
300058d8:	e3530000 	cmp	r3, #0
300058dc:	1a000001 	bne	300058e8 <buddy_init+0x180>
			num=1;
300058e0:	e3a03001 	mov	r3, #1
300058e4:	e58d3020 	str	r3, [sp, #32]
		save_adr-=num*4;
300058e8:	e59d3020 	ldr	r3, [sp, #32]
300058ec:	e1a03103 	lsl	r3, r3, #2
300058f0:	e59d2018 	ldr	r2, [sp, #24]
300058f4:	e0633002 	rsb	r3, r3, r2
300058f8:	e58d3018 	str	r3, [sp, #24]
		save_adr&=~(4-1);
300058fc:	e59d3018 	ldr	r3, [sp, #24]
30005900:	e3c33003 	bic	r3, r3, #3
30005904:	e58d3018 	str	r3, [sp, #24]
		acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
30005908:	e59f35f0 	ldr	r3, [pc, #1520]	; 30005f00 <buddy_init+0x798>
3000590c:	e5933000 	ldr	r3, [r3]
30005910:	e59d200c 	ldr	r2, [sp, #12]
30005914:	e59d1018 	ldr	r1, [sp, #24]
30005918:	e282200e 	add	r2, r2, #14
3000591c:	e7831102 	str	r1, [r3, r2, lsl #2]
		acoral_mem_ctrl->num[i]=num;
30005920:	e59f35d8 	ldr	r3, [pc, #1496]	; 30005f00 <buddy_init+0x798>
30005924:	e5933000 	ldr	r3, [r3]
30005928:	e59d200c 	ldr	r2, [sp, #12]
3000592c:	e282202a 	add	r2, r2, #42	; 0x2a
30005930:	e59d1020 	ldr	r1, [sp, #32]
30005934:	e7831102 	str	r1, [r3, r2, lsl #2]
		save_adr-=num*4;
30005938:	e59d3020 	ldr	r3, [sp, #32]
3000593c:	e1a03103 	lsl	r3, r3, #2
30005940:	e59d2018 	ldr	r2, [sp, #24]
30005944:	e0633002 	rsb	r3, r3, r2
30005948:	e58d3018 	str	r3, [sp, #24]
		save_adr&=~(4-1);
3000594c:	e59d3018 	ldr	r3, [sp, #24]
30005950:	e3c33003 	bic	r3, r3, #3
30005954:	e58d3018 	str	r3, [sp, #24]
		acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
30005958:	e59f35a0 	ldr	r3, [pc, #1440]	; 30005f00 <buddy_init+0x798>
3000595c:	e5933000 	ldr	r3, [r3]
30005960:	e59d200c 	ldr	r2, [sp, #12]
30005964:	e59d1018 	ldr	r1, [sp, #24]
30005968:	e7831102 	str	r1, [r3, r2, lsl #2]
		for(k=0;k<num;k++){
3000596c:	e3a03000 	mov	r3, #0
30005970:	e58d3010 	str	r3, [sp, #16]
30005974:	ea000015 	b	300059d0 <buddy_init+0x268>
			acoral_mem_ctrl->bitmap[i][k]=0;;
30005978:	e59f3580 	ldr	r3, [pc, #1408]	; 30005f00 <buddy_init+0x798>
3000597c:	e5933000 	ldr	r3, [r3]
30005980:	e59d200c 	ldr	r2, [sp, #12]
30005984:	e282200e 	add	r2, r2, #14
30005988:	e7932102 	ldr	r2, [r3, r2, lsl #2]
3000598c:	e59d3010 	ldr	r3, [sp, #16]
30005990:	e1a03103 	lsl	r3, r3, #2
30005994:	e0823003 	add	r3, r2, r3
30005998:	e3a02000 	mov	r2, #0
3000599c:	e5832000 	str	r2, [r3]
			acoral_mem_ctrl->free_list[i][k]=-1;
300059a0:	e59f3558 	ldr	r3, [pc, #1368]	; 30005f00 <buddy_init+0x798>
300059a4:	e5933000 	ldr	r3, [r3]
300059a8:	e59d200c 	ldr	r2, [sp, #12]
300059ac:	e7932102 	ldr	r2, [r3, r2, lsl #2]
300059b0:	e59d3010 	ldr	r3, [sp, #16]
300059b4:	e1a03103 	lsl	r3, r3, #2
300059b8:	e0823003 	add	r3, r2, r3
300059bc:	e3e02000 	mvn	r2, #0
300059c0:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
		acoral_mem_ctrl->num[i]=num;
		save_adr-=num*4;
		save_adr&=~(4-1);
		acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
		for(k=0;k<num;k++){
300059c4:	e59d3010 	ldr	r3, [sp, #16]
300059c8:	e2833001 	add	r3, r3, #1
300059cc:	e58d3010 	str	r3, [sp, #16]
300059d0:	e59d2010 	ldr	r2, [sp, #16]
300059d4:	e59d3020 	ldr	r3, [sp, #32]
300059d8:	e1520003 	cmp	r2, r3
300059dc:	3affffe5 	bcc	30005978 <buddy_init+0x210>
			acoral_mem_ctrl->bitmap[i][k]=0;;
			acoral_mem_ctrl->free_list[i][k]=-1;
		}
		acoral_mem_ctrl->free_cur[i]=-1;
300059e0:	e59f3518 	ldr	r3, [pc, #1304]	; 30005f00 <buddy_init+0x798>
300059e4:	e5933000 	ldr	r3, [r3]
300059e8:	e59d200c 	ldr	r2, [sp, #12]
300059ec:	e282201c 	add	r2, r2, #28
300059f0:	e3e01000 	mvn	r1, #0
300059f4:	e7831102 	str	r1, [r3, r2, lsl #2]
	save_adr=(acoral_u32)acoral_mem_blocks;
	level=adjust_level;
	if(adjust_level>LEVEL)
		level=LEVEL;
	num=num/32; 
	for(i=0;i<level-1;i++){
300059f8:	e59d300c 	ldr	r3, [sp, #12]
300059fc:	e2833001 	add	r3, r3, #1
30005a00:	e58d300c 	str	r3, [sp, #12]
30005a04:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005a08:	e2432001 	sub	r2, r3, #1
30005a0c:	e59d300c 	ldr	r3, [sp, #12]
30005a10:	e1520003 	cmp	r2, r3
30005a14:	caffffab 	bgt	300058c8 <buddy_init+0x160>
			acoral_mem_ctrl->bitmap[i][k]=0;;
			acoral_mem_ctrl->free_list[i][k]=-1;
		}
		acoral_mem_ctrl->free_cur[i]=-1;
	}
	if(num==0)
30005a18:	e59d3020 	ldr	r3, [sp, #32]
30005a1c:	e3530000 	cmp	r3, #0
30005a20:	1a000001 	bne	30005a2c <buddy_init+0x2c4>
		num=1;
30005a24:	e3a03001 	mov	r3, #1
30005a28:	e58d3020 	str	r3, [sp, #32]
	save_adr-=num*4;
30005a2c:	e59d3020 	ldr	r3, [sp, #32]
30005a30:	e1a03103 	lsl	r3, r3, #2
30005a34:	e59d2018 	ldr	r2, [sp, #24]
30005a38:	e0633002 	rsb	r3, r3, r2
30005a3c:	e58d3018 	str	r3, [sp, #24]
	save_adr&=~(4-1);
30005a40:	e59d3018 	ldr	r3, [sp, #24]
30005a44:	e3c33003 	bic	r3, r3, #3
30005a48:	e58d3018 	str	r3, [sp, #24]
	acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
30005a4c:	e59f34ac 	ldr	r3, [pc, #1196]	; 30005f00 <buddy_init+0x798>
30005a50:	e5933000 	ldr	r3, [r3]
30005a54:	e59d200c 	ldr	r2, [sp, #12]
30005a58:	e59d1018 	ldr	r1, [sp, #24]
30005a5c:	e282200e 	add	r2, r2, #14
30005a60:	e7831102 	str	r1, [r3, r2, lsl #2]
	acoral_mem_ctrl->num[i]=num;
30005a64:	e59f3494 	ldr	r3, [pc, #1172]	; 30005f00 <buddy_init+0x798>
30005a68:	e5933000 	ldr	r3, [r3]
30005a6c:	e59d200c 	ldr	r2, [sp, #12]
30005a70:	e282202a 	add	r2, r2, #42	; 0x2a
30005a74:	e59d1020 	ldr	r1, [sp, #32]
30005a78:	e7831102 	str	r1, [r3, r2, lsl #2]
	save_adr-=num*4;
30005a7c:	e59d3020 	ldr	r3, [sp, #32]
30005a80:	e1a03103 	lsl	r3, r3, #2
30005a84:	e59d2018 	ldr	r2, [sp, #24]
30005a88:	e0633002 	rsb	r3, r3, r2
30005a8c:	e58d3018 	str	r3, [sp, #24]
	save_adr&=~(4-1);
30005a90:	e59d3018 	ldr	r3, [sp, #24]
30005a94:	e3c33003 	bic	r3, r3, #3
30005a98:	e58d3018 	str	r3, [sp, #24]
	acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
30005a9c:	e59f345c 	ldr	r3, [pc, #1116]	; 30005f00 <buddy_init+0x798>
30005aa0:	e5933000 	ldr	r3, [r3]
30005aa4:	e59d200c 	ldr	r2, [sp, #12]
30005aa8:	e59d1018 	ldr	r1, [sp, #24]
30005aac:	e7831102 	str	r1, [r3, r2, lsl #2]
	for(k=0;k<num;k++){
30005ab0:	e3a03000 	mov	r3, #0
30005ab4:	e58d3010 	str	r3, [sp, #16]
30005ab8:	ea000015 	b	30005b14 <buddy_init+0x3ac>
		acoral_mem_ctrl->bitmap[i][k]=0;;
30005abc:	e59f343c 	ldr	r3, [pc, #1084]	; 30005f00 <buddy_init+0x798>
30005ac0:	e5933000 	ldr	r3, [r3]
30005ac4:	e59d200c 	ldr	r2, [sp, #12]
30005ac8:	e282200e 	add	r2, r2, #14
30005acc:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005ad0:	e59d3010 	ldr	r3, [sp, #16]
30005ad4:	e1a03103 	lsl	r3, r3, #2
30005ad8:	e0823003 	add	r3, r2, r3
30005adc:	e3a02000 	mov	r2, #0
30005ae0:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_list[i][k]=-1;
30005ae4:	e59f3414 	ldr	r3, [pc, #1044]	; 30005f00 <buddy_init+0x798>
30005ae8:	e5933000 	ldr	r3, [r3]
30005aec:	e59d200c 	ldr	r2, [sp, #12]
30005af0:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005af4:	e59d3010 	ldr	r3, [sp, #16]
30005af8:	e1a03103 	lsl	r3, r3, #2
30005afc:	e0823003 	add	r3, r2, r3
30005b00:	e3e02000 	mvn	r2, #0
30005b04:	e5832000 	str	r2, [r3]
	acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
	acoral_mem_ctrl->num[i]=num;
	save_adr-=num*4;
	save_adr&=~(4-1);
	acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
	for(k=0;k<num;k++){
30005b08:	e59d3010 	ldr	r3, [sp, #16]
30005b0c:	e2833001 	add	r3, r3, #1
30005b10:	e58d3010 	str	r3, [sp, #16]
30005b14:	e59d2010 	ldr	r2, [sp, #16]
30005b18:	e59d3020 	ldr	r3, [sp, #32]
30005b1c:	e1520003 	cmp	r2, r3
30005b20:	3affffe5 	bcc	30005abc <buddy_init+0x354>
		acoral_mem_ctrl->bitmap[i][k]=0;;
		acoral_mem_ctrl->free_list[i][k]=-1;
	}
	acoral_mem_ctrl->free_cur[i]=-1;
30005b24:	e59f33d4 	ldr	r3, [pc, #980]	; 30005f00 <buddy_init+0x798>
30005b28:	e5933000 	ldr	r3, [r3]
30005b2c:	e59d200c 	ldr	r2, [sp, #12]
30005b30:	e282201c 	add	r2, r2, #28
30005b34:	e3e01000 	mvn	r1, #0
30005b38:	e7831102 	str	r1, [r3, r2, lsl #2]

	/*如果减去刚才bitmap用的内存刚好是下一level*/
	if(save_adr<=(start_adr+(resize_size>>1)))
30005b3c:	e59d3014 	ldr	r3, [sp, #20]
30005b40:	e1a020a3 	lsr	r2, r3, #1
30005b44:	e59d3004 	ldr	r3, [sp, #4]
30005b48:	e0822003 	add	r2, r2, r3
30005b4c:	e59d3018 	ldr	r3, [sp, #24]
30005b50:	e1520003 	cmp	r2, r3
30005b54:	3a000002 	bcc	30005b64 <buddy_init+0x3fc>
		adjust_level--;
30005b58:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30005b5c:	e2433001 	sub	r3, r3, #1
30005b60:	e58d3024 	str	r3, [sp, #36]	; 0x24
	if(adjust_level>LEVEL)
30005b64:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30005b68:	e353000e 	cmp	r3, #14
30005b6c:	9a000001 	bls	30005b78 <buddy_init+0x410>
		level=LEVEL;
30005b70:	e3a0300e 	mov	r3, #14
30005b74:	e58d3028 	str	r3, [sp, #40]	; 0x28
	acoral_mem_ctrl->level=level;
30005b78:	e59f3380 	ldr	r3, [pc, #896]	; 30005f00 <buddy_init+0x798>
30005b7c:	e5933000 	ldr	r3, [r3]
30005b80:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005b84:	e20220ff 	and	r2, r2, #255	; 0xff
30005b88:	e5c320e0 	strb	r2, [r3, #224]	; 0xe0
	acoral_mem_ctrl->start_adr=start_adr;
30005b8c:	e59f336c 	ldr	r3, [pc, #876]	; 30005f00 <buddy_init+0x798>
30005b90:	e5933000 	ldr	r3, [r3]
30005b94:	e59d2004 	ldr	r2, [sp, #4]
30005b98:	e58320e4 	str	r2, [r3, #228]	; 0xe4
	num=(save_adr-start_adr)>>BLOCK_SHIFT;
30005b9c:	e59d2018 	ldr	r2, [sp, #24]
30005ba0:	e59d3004 	ldr	r3, [sp, #4]
30005ba4:	e0633002 	rsb	r3, r3, r2
30005ba8:	e1a033a3 	lsr	r3, r3, #7
30005bac:	e58d3020 	str	r3, [sp, #32]
	acoral_mem_ctrl->end_adr=start_adr+(num<<BLOCK_SHIFT);
30005bb0:	e59f3348 	ldr	r3, [pc, #840]	; 30005f00 <buddy_init+0x798>
30005bb4:	e5933000 	ldr	r3, [r3]
30005bb8:	e59d2020 	ldr	r2, [sp, #32]
30005bbc:	e1a01382 	lsl	r1, r2, #7
30005bc0:	e59d2004 	ldr	r2, [sp, #4]
30005bc4:	e0812002 	add	r2, r1, r2
30005bc8:	e58320e8 	str	r2, [r3, #232]	; 0xe8
	acoral_mem_ctrl->block_num=num;
30005bcc:	e59f332c 	ldr	r3, [pc, #812]	; 30005f00 <buddy_init+0x798>
30005bd0:	e5933000 	ldr	r3, [r3]
30005bd4:	e59d2020 	ldr	r2, [sp, #32]
30005bd8:	e58320ec 	str	r2, [r3, #236]	; 0xec
	acoral_mem_ctrl->free_num=num;
30005bdc:	e59f331c 	ldr	r3, [pc, #796]	; 30005f00 <buddy_init+0x798>
30005be0:	e5933000 	ldr	r3, [r3]
30005be4:	e59d2020 	ldr	r2, [sp, #32]
30005be8:	e58320f0 	str	r2, [r3, #240]	; 0xf0
	acoral_mem_ctrl->block_size=BLOCK_SIZE;
30005bec:	e59f330c 	ldr	r3, [pc, #780]	; 30005f00 <buddy_init+0x798>
30005bf0:	e5933000 	ldr	r3, [r3]
30005bf4:	e3a02080 	mov	r2, #128	; 0x80
30005bf8:	e58320f4 	str	r2, [r3, #244]	; 0xf4

	i=0;
30005bfc:	e3a03000 	mov	r3, #0
30005c00:	e58d300c 	str	r3, [sp, #12]
	max_num=1<<level-1;
30005c04:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005c08:	e2433001 	sub	r3, r3, #1
30005c0c:	e3a02001 	mov	r2, #1
30005c10:	e1a03312 	lsl	r3, r2, r3
30005c14:	e58d302c 	str	r3, [sp, #44]	; 0x2c
	o_num=0;
30005c18:	e3a03000 	mov	r3, #0
30005c1c:	e58d3030 	str	r3, [sp, #48]	; 0x30
	if(num>0)
30005c20:	e59d3020 	ldr	r3, [sp, #32]
30005c24:	e3530000 	cmp	r3, #0
30005c28:	0a000007 	beq	30005c4c <buddy_init+0x4e4>
		acoral_mem_ctrl->free_cur[level-1]=0;
30005c2c:	e59f32cc 	ldr	r3, [pc, #716]	; 30005f00 <buddy_init+0x798>
30005c30:	e5933000 	ldr	r3, [r3]
30005c34:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005c38:	e2422001 	sub	r2, r2, #1
30005c3c:	e282201c 	add	r2, r2, #28
30005c40:	e3a01000 	mov	r1, #0
30005c44:	e7831102 	str	r1, [r3, r2, lsl #2]
	else
		acoral_mem_ctrl->free_cur[level-1]=-1;

	while(num>=max_num*32){
30005c48:	ea00002a 	b	30005cf8 <buddy_init+0x590>
	max_num=1<<level-1;
	o_num=0;
	if(num>0)
		acoral_mem_ctrl->free_cur[level-1]=0;
	else
		acoral_mem_ctrl->free_cur[level-1]=-1;
30005c4c:	e59f32ac 	ldr	r3, [pc, #684]	; 30005f00 <buddy_init+0x798>
30005c50:	e5933000 	ldr	r3, [r3]
30005c54:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005c58:	e2422001 	sub	r2, r2, #1
30005c5c:	e282201c 	add	r2, r2, #28
30005c60:	e3e01000 	mvn	r1, #0
30005c64:	e7831102 	str	r1, [r3, r2, lsl #2]

	while(num>=max_num*32){
30005c68:	ea000022 	b	30005cf8 <buddy_init+0x590>
		acoral_mem_ctrl->bitmap[level-1][i]=-1;;
30005c6c:	e59f328c 	ldr	r3, [pc, #652]	; 30005f00 <buddy_init+0x798>
30005c70:	e5933000 	ldr	r3, [r3]
30005c74:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005c78:	e2422001 	sub	r2, r2, #1
30005c7c:	e282200e 	add	r2, r2, #14
30005c80:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005c84:	e59d300c 	ldr	r3, [sp, #12]
30005c88:	e1a03103 	lsl	r3, r3, #2
30005c8c:	e0823003 	add	r3, r2, r3
30005c90:	e3e02000 	mvn	r2, #0
30005c94:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_list[level-1][i]=i+1;
30005c98:	e59f3260 	ldr	r3, [pc, #608]	; 30005f00 <buddy_init+0x798>
30005c9c:	e5933000 	ldr	r3, [r3]
30005ca0:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005ca4:	e2422001 	sub	r2, r2, #1
30005ca8:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005cac:	e59d300c 	ldr	r3, [sp, #12]
30005cb0:	e1a03103 	lsl	r3, r3, #2
30005cb4:	e0823003 	add	r3, r2, r3
30005cb8:	e59d200c 	ldr	r2, [sp, #12]
30005cbc:	e2822001 	add	r2, r2, #1
30005cc0:	e5832000 	str	r2, [r3]
		num-=max_num*32;
30005cc4:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005cc8:	e1a03283 	lsl	r3, r3, #5
30005ccc:	e59d2020 	ldr	r2, [sp, #32]
30005cd0:	e0633002 	rsb	r3, r3, r2
30005cd4:	e58d3020 	str	r3, [sp, #32]
		o_num+=max_num*32;
30005cd8:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005cdc:	e1a03283 	lsl	r3, r3, #5
30005ce0:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005ce4:	e0823003 	add	r3, r2, r3
30005ce8:	e58d3030 	str	r3, [sp, #48]	; 0x30
		i++;
30005cec:	e59d300c 	ldr	r3, [sp, #12]
30005cf0:	e2833001 	add	r3, r3, #1
30005cf4:	e58d300c 	str	r3, [sp, #12]
	if(num>0)
		acoral_mem_ctrl->free_cur[level-1]=0;
	else
		acoral_mem_ctrl->free_cur[level-1]=-1;

	while(num>=max_num*32){
30005cf8:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005cfc:	e1a02283 	lsl	r2, r3, #5
30005d00:	e59d3020 	ldr	r3, [sp, #32]
30005d04:	e1520003 	cmp	r2, r3
30005d08:	9affffd7 	bls	30005c6c <buddy_init+0x504>
		acoral_mem_ctrl->free_list[level-1][i]=i+1;
		num-=max_num*32;
		o_num+=max_num*32;
		i++;
	}
	if(num==0)
30005d0c:	e59d3020 	ldr	r3, [sp, #32]
30005d10:	e3530000 	cmp	r3, #0
30005d14:	1a000021 	bne	30005da0 <buddy_init+0x638>
		acoral_mem_ctrl->free_list[level-1][i-1]=-1;
30005d18:	e59f31e0 	ldr	r3, [pc, #480]	; 30005f00 <buddy_init+0x798>
30005d1c:	e5933000 	ldr	r3, [r3]
30005d20:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005d24:	e2422001 	sub	r2, r2, #1
30005d28:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005d2c:	e59d300c 	ldr	r3, [sp, #12]
30005d30:	e2433001 	sub	r3, r3, #1
30005d34:	e1a03103 	lsl	r3, r3, #2
30005d38:	e0823003 	add	r3, r2, r3
30005d3c:	e3e02000 	mvn	r2, #0
30005d40:	e5832000 	str	r2, [r3]
	while(num>=max_num){
30005d44:	ea000015 	b	30005da0 <buddy_init+0x638>
		index=o_num>>level-1;
30005d48:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005d4c:	e2433001 	sub	r3, r3, #1
30005d50:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005d54:	e1a03332 	lsr	r3, r2, r3
30005d58:	e58d301c 	str	r3, [sp, #28]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
30005d5c:	e59f319c 	ldr	r3, [pc, #412]	; 30005f00 <buddy_init+0x798>
30005d60:	e5933000 	ldr	r3, [r3]
30005d64:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005d68:	e2422001 	sub	r2, r2, #1
30005d6c:	e282200e 	add	r2, r2, #14
30005d70:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005d74:	e59d001c 	ldr	r0, [sp, #28]
30005d78:	e1a01003 	mov	r1, r3
30005d7c:	eb001034 	bl	30009e54 <acoral_set_bit>
		num-=max_num;
30005d80:	e59d2020 	ldr	r2, [sp, #32]
30005d84:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005d88:	e0633002 	rsb	r3, r3, r2
30005d8c:	e58d3020 	str	r3, [sp, #32]
		o_num+=max_num;
30005d90:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005d94:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005d98:	e0823003 	add	r3, r2, r3
30005d9c:	e58d3030 	str	r3, [sp, #48]	; 0x30
		o_num+=max_num*32;
		i++;
	}
	if(num==0)
		acoral_mem_ctrl->free_list[level-1][i-1]=-1;
	while(num>=max_num){
30005da0:	e59d2020 	ldr	r2, [sp, #32]
30005da4:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005da8:	e1520003 	cmp	r2, r3
30005dac:	2affffe5 	bcs	30005d48 <buddy_init+0x5e0>
		index=o_num>>level-1;
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
		num-=max_num;
		o_num+=max_num;
	}
	acoral_mem_ctrl->free_list[level-1][i]=-1;
30005db0:	e59f3148 	ldr	r3, [pc, #328]	; 30005f00 <buddy_init+0x798>
30005db4:	e5933000 	ldr	r3, [r3]
30005db8:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005dbc:	e2422001 	sub	r2, r2, #1
30005dc0:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005dc4:	e59d300c 	ldr	r3, [sp, #12]
30005dc8:	e1a03103 	lsl	r3, r3, #2
30005dcc:	e0823003 	add	r3, r2, r3
30005dd0:	e3e02000 	mvn	r2, #0
30005dd4:	e5832000 	str	r2, [r3]

	
	while(--level>0){
30005dd8:	ea00003b 	b	30005ecc <buddy_init+0x764>
		index=o_num>>level;
30005ddc:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005de0:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005de4:	e1a03332 	lsr	r3, r2, r3
30005de8:	e58d301c 	str	r3, [sp, #28]
		if(num==0)
30005dec:	e59d3020 	ldr	r3, [sp, #32]
30005df0:	e3530000 	cmp	r3, #0
30005df4:	0a00003b 	beq	30005ee8 <buddy_init+0x780>
			break;
		cur=index/32;
30005df8:	e59d301c 	ldr	r3, [sp, #28]
30005dfc:	e1a032a3 	lsr	r3, r3, #5
30005e00:	e58d3034 	str	r3, [sp, #52]	; 0x34
		max_num=1<<level-1;
30005e04:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005e08:	e2433001 	sub	r3, r3, #1
30005e0c:	e3a02001 	mov	r2, #1
30005e10:	e1a03312 	lsl	r3, r2, r3
30005e14:	e58d302c 	str	r3, [sp, #44]	; 0x2c
		if(num>=max_num){
30005e18:	e59d2020 	ldr	r2, [sp, #32]
30005e1c:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005e20:	e1520003 	cmp	r2, r3
30005e24:	3a000028 	bcc	30005ecc <buddy_init+0x764>
			acoral_mem_blocks[BLOCK_INDEX(o_num)].level=-1;	
30005e28:	e59f30d4 	ldr	r3, [pc, #212]	; 30005f04 <buddy_init+0x79c>
30005e2c:	e5932000 	ldr	r2, [r3]
30005e30:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
30005e34:	e1a030a3 	lsr	r3, r3, #1
30005e38:	e0823003 	add	r3, r2, r3
30005e3c:	e3e02000 	mvn	r2, #0
30005e40:	e5c32000 	strb	r2, [r3]
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
30005e44:	e59f30b4 	ldr	r3, [pc, #180]	; 30005f00 <buddy_init+0x798>
30005e48:	e5933000 	ldr	r3, [r3]
30005e4c:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005e50:	e2422001 	sub	r2, r2, #1
30005e54:	e282200e 	add	r2, r2, #14
30005e58:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005e5c:	e59d001c 	ldr	r0, [sp, #28]
30005e60:	e1a01003 	mov	r1, r3
30005e64:	eb000ffa 	bl	30009e54 <acoral_set_bit>
			acoral_mem_ctrl->free_list[level-1][cur]=-1;	
30005e68:	e59f3090 	ldr	r3, [pc, #144]	; 30005f00 <buddy_init+0x798>
30005e6c:	e5933000 	ldr	r3, [r3]
30005e70:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005e74:	e2422001 	sub	r2, r2, #1
30005e78:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005e7c:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
30005e80:	e1a03103 	lsl	r3, r3, #2
30005e84:	e0823003 	add	r3, r2, r3
30005e88:	e3e02000 	mvn	r2, #0
30005e8c:	e5832000 	str	r2, [r3]
			acoral_mem_ctrl->free_cur[level-1]=cur;	
30005e90:	e59f3068 	ldr	r3, [pc, #104]	; 30005f00 <buddy_init+0x798>
30005e94:	e5933000 	ldr	r3, [r3]
30005e98:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005e9c:	e2422001 	sub	r2, r2, #1
30005ea0:	e59d1034 	ldr	r1, [sp, #52]	; 0x34
30005ea4:	e282201c 	add	r2, r2, #28
30005ea8:	e7831102 	str	r1, [r3, r2, lsl #2]
			o_num+=max_num;
30005eac:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005eb0:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005eb4:	e0823003 	add	r3, r2, r3
30005eb8:	e58d3030 	str	r3, [sp, #48]	; 0x30
			num-=max_num;
30005ebc:	e59d2020 	ldr	r2, [sp, #32]
30005ec0:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005ec4:	e0633002 	rsb	r3, r3, r2
30005ec8:	e58d3020 	str	r3, [sp, #32]
		o_num+=max_num;
	}
	acoral_mem_ctrl->free_list[level-1][i]=-1;

	
	while(--level>0){
30005ecc:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005ed0:	e2433001 	sub	r3, r3, #1
30005ed4:	e58d3028 	str	r3, [sp, #40]	; 0x28
30005ed8:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005edc:	e3530000 	cmp	r3, #0
30005ee0:	caffffbd 	bgt	30005ddc <buddy_init+0x674>
30005ee4:	ea000000 	b	30005eec <buddy_init+0x784>
		index=o_num>>level;
		if(num==0)
			break;
30005ee8:	e1a00000 	nop			; (mov r0, r0)
			o_num+=max_num;
			num-=max_num;
		}
	}
	acoral_spin_init(&acoral_mem_ctrl->lock);
	return 0;
30005eec:	e3a03000 	mov	r3, #0
}
30005ef0:	e1a00003 	mov	r0, r3
30005ef4:	e28dd03c 	add	sp, sp, #60	; 0x3c
30005ef8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30005efc:	e12fff1e 	bx	lr
30005f00:	3001057c 	.word	0x3001057c
30005f04:	3000fcd0 	.word	0x3000fcd0

30005f08 <recus_malloc>:

static acoral_32 recus_malloc(level){
30005f08:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30005f0c:	e24dd01c 	sub	sp, sp, #28
30005f10:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 index;
	acoral_32 cur;
	acoral_32 num;
	if(level>=acoral_mem_ctrl->level)
30005f14:	e59f328c 	ldr	r3, [pc, #652]	; 300061a8 <recus_malloc+0x2a0>
30005f18:	e5933000 	ldr	r3, [r3]
30005f1c:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30005f20:	e1a03c03 	lsl	r3, r3, #24
30005f24:	e1a02c43 	asr	r2, r3, #24
30005f28:	e59d3004 	ldr	r3, [sp, #4]
30005f2c:	e1520003 	cmp	r2, r3
30005f30:	ca000001 	bgt	30005f3c <recus_malloc+0x34>
		return -1;
30005f34:	e3e03000 	mvn	r3, #0
30005f38:	ea000096 	b	30006198 <recus_malloc+0x290>
	cur=acoral_mem_ctrl->free_cur[level];
30005f3c:	e59f3264 	ldr	r3, [pc, #612]	; 300061a8 <recus_malloc+0x2a0>
30005f40:	e5933000 	ldr	r3, [r3]
30005f44:	e59d2004 	ldr	r2, [sp, #4]
30005f48:	e282201c 	add	r2, r2, #28
30005f4c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005f50:	e58d3010 	str	r3, [sp, #16]
	if(cur<0){
30005f54:	e59d3010 	ldr	r3, [sp, #16]
30005f58:	e3530000 	cmp	r3, #0
30005f5c:	aa00002b 	bge	30006010 <recus_malloc+0x108>
		num=recus_malloc(level+1);
30005f60:	e59d3004 	ldr	r3, [sp, #4]
30005f64:	e2833001 	add	r3, r3, #1
30005f68:	e1a00003 	mov	r0, r3
30005f6c:	ebffffe5 	bl	30005f08 <recus_malloc>
30005f70:	e1a03000 	mov	r3, r0
30005f74:	e58d3014 	str	r3, [sp, #20]
		if(num<0)
30005f78:	e59d3014 	ldr	r3, [sp, #20]
30005f7c:	e3530000 	cmp	r3, #0
30005f80:	aa000001 	bge	30005f8c <recus_malloc+0x84>
			return -1;
30005f84:	e3e03000 	mvn	r3, #0
30005f88:	ea000082 	b	30006198 <recus_malloc+0x290>
		index=num>>level+1;
30005f8c:	e59d3004 	ldr	r3, [sp, #4]
30005f90:	e2833001 	add	r3, r3, #1
30005f94:	e59d2014 	ldr	r2, [sp, #20]
30005f98:	e1a03352 	asr	r3, r2, r3
30005f9c:	e58d300c 	str	r3, [sp, #12]
		cur=index/32;
30005fa0:	e59d300c 	ldr	r3, [sp, #12]
30005fa4:	e1a032a3 	lsr	r3, r3, #5
30005fa8:	e58d3010 	str	r3, [sp, #16]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
30005fac:	e59f31f4 	ldr	r3, [pc, #500]	; 300061a8 <recus_malloc+0x2a0>
30005fb0:	e5933000 	ldr	r3, [r3]
30005fb4:	e59d2004 	ldr	r2, [sp, #4]
30005fb8:	e282200e 	add	r2, r2, #14
30005fbc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005fc0:	e59d000c 	ldr	r0, [sp, #12]
30005fc4:	e1a01003 	mov	r1, r3
30005fc8:	eb000fa1 	bl	30009e54 <acoral_set_bit>
		acoral_mem_ctrl->free_list[level][cur]=-1;
30005fcc:	e59f31d4 	ldr	r3, [pc, #468]	; 300061a8 <recus_malloc+0x2a0>
30005fd0:	e5933000 	ldr	r3, [r3]
30005fd4:	e59d2004 	ldr	r2, [sp, #4]
30005fd8:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005fdc:	e59d3010 	ldr	r3, [sp, #16]
30005fe0:	e1a03103 	lsl	r3, r3, #2
30005fe4:	e0823003 	add	r3, r2, r3
30005fe8:	e3e02000 	mvn	r2, #0
30005fec:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_cur[level]=cur;
30005ff0:	e59f31b0 	ldr	r3, [pc, #432]	; 300061a8 <recus_malloc+0x2a0>
30005ff4:	e5933000 	ldr	r3, [r3]
30005ff8:	e59d2004 	ldr	r2, [sp, #4]
30005ffc:	e282201c 	add	r2, r2, #28
30006000:	e59d1010 	ldr	r1, [sp, #16]
30006004:	e7831102 	str	r1, [r3, r2, lsl #2]
		return num;
30006008:	e59d3014 	ldr	r3, [sp, #20]
3000600c:	ea000061 	b	30006198 <recus_malloc+0x290>
	}
	index=acoral_ffs(acoral_mem_ctrl->bitmap[level][cur]);
30006010:	e59f3190 	ldr	r3, [pc, #400]	; 300061a8 <recus_malloc+0x2a0>
30006014:	e5933000 	ldr	r3, [r3]
30006018:	e59d2004 	ldr	r2, [sp, #4]
3000601c:	e282200e 	add	r2, r2, #14
30006020:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006024:	e59d3010 	ldr	r3, [sp, #16]
30006028:	e1a03103 	lsl	r3, r3, #2
3000602c:	e0823003 	add	r3, r2, r3
30006030:	e5933000 	ldr	r3, [r3]
30006034:	e1a00003 	mov	r0, r3
30006038:	eb000f2a 	bl	30009ce8 <acoral_ffs>
3000603c:	e1a03000 	mov	r3, r0
30006040:	e58d300c 	str	r3, [sp, #12]
	index=cur*32+index;
30006044:	e59d3010 	ldr	r3, [sp, #16]
30006048:	e1a03283 	lsl	r3, r3, #5
3000604c:	e59d200c 	ldr	r2, [sp, #12]
30006050:	e0823003 	add	r3, r2, r3
30006054:	e58d300c 	str	r3, [sp, #12]
	acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
30006058:	e59f3148 	ldr	r3, [pc, #328]	; 300061a8 <recus_malloc+0x2a0>
3000605c:	e5933000 	ldr	r3, [r3]
30006060:	e59d2004 	ldr	r2, [sp, #4]
30006064:	e282200e 	add	r2, r2, #14
30006068:	e7933102 	ldr	r3, [r3, r2, lsl #2]
3000606c:	e59d000c 	ldr	r0, [sp, #12]
30006070:	e1a01003 	mov	r1, r3
30006074:	eb000f8e 	bl	30009eb4 <acoral_clear_bit>
	if(acoral_mem_ctrl->bitmap[level][cur]==0)
30006078:	e59f3128 	ldr	r3, [pc, #296]	; 300061a8 <recus_malloc+0x2a0>
3000607c:	e5933000 	ldr	r3, [r3]
30006080:	e59d2004 	ldr	r2, [sp, #4]
30006084:	e282200e 	add	r2, r2, #14
30006088:	e7932102 	ldr	r2, [r3, r2, lsl #2]
3000608c:	e59d3010 	ldr	r3, [sp, #16]
30006090:	e1a03103 	lsl	r3, r3, #2
30006094:	e0823003 	add	r3, r2, r3
30006098:	e5933000 	ldr	r3, [r3]
3000609c:	e3530000 	cmp	r3, #0
300060a0:	1a00000c 	bne	300060d8 <recus_malloc+0x1d0>
		acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];
300060a4:	e59f30fc 	ldr	r3, [pc, #252]	; 300061a8 <recus_malloc+0x2a0>
300060a8:	e5933000 	ldr	r3, [r3]
300060ac:	e59d2004 	ldr	r2, [sp, #4]
300060b0:	e59f10f0 	ldr	r1, [pc, #240]	; 300061a8 <recus_malloc+0x2a0>
300060b4:	e5911000 	ldr	r1, [r1]
300060b8:	e59d0004 	ldr	r0, [sp, #4]
300060bc:	e7910100 	ldr	r0, [r1, r0, lsl #2]
300060c0:	e59d1010 	ldr	r1, [sp, #16]
300060c4:	e1a01101 	lsl	r1, r1, #2
300060c8:	e0801001 	add	r1, r0, r1
300060cc:	e5911000 	ldr	r1, [r1]
300060d0:	e282201c 	add	r2, r2, #28
300060d4:	e7831102 	str	r1, [r3, r2, lsl #2]
	num=index<<level+1;
300060d8:	e59d3004 	ldr	r3, [sp, #4]
300060dc:	e2833001 	add	r3, r3, #1
300060e0:	e59d200c 	ldr	r2, [sp, #12]
300060e4:	e1a03312 	lsl	r3, r2, r3
300060e8:	e58d3014 	str	r3, [sp, #20]
	/*最高level情况*/
	if(level==acoral_mem_ctrl->level-1){
300060ec:	e59f30b4 	ldr	r3, [pc, #180]	; 300061a8 <recus_malloc+0x2a0>
300060f0:	e5933000 	ldr	r3, [r3]
300060f4:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
300060f8:	e1a03c03 	lsl	r3, r3, #24
300060fc:	e1a03c43 	asr	r3, r3, #24
30006100:	e2432001 	sub	r2, r3, #1
30006104:	e59d3004 	ldr	r3, [sp, #4]
30006108:	e1520003 	cmp	r2, r3
3000610c:	1a000010 	bne	30006154 <recus_malloc+0x24c>
		if((num>>1)+(1<<level)>acoral_mem_ctrl->block_num)
30006110:	e59d3014 	ldr	r3, [sp, #20]
30006114:	e1a020c3 	asr	r2, r3, #1
30006118:	e3a01001 	mov	r1, #1
3000611c:	e59d3004 	ldr	r3, [sp, #4]
30006120:	e1a03311 	lsl	r3, r1, r3
30006124:	e0823003 	add	r3, r2, r3
30006128:	e1a02003 	mov	r2, r3
3000612c:	e59f3074 	ldr	r3, [pc, #116]	; 300061a8 <recus_malloc+0x2a0>
30006130:	e5933000 	ldr	r3, [r3]
30006134:	e59330ec 	ldr	r3, [r3, #236]	; 0xec
30006138:	e1520003 	cmp	r2, r3
3000613c:	9a000001 	bls	30006148 <recus_malloc+0x240>
			return -1;
30006140:	e3e03000 	mvn	r3, #0
30006144:	ea000013 	b	30006198 <recus_malloc+0x290>
		return num>>1;
30006148:	e59d3014 	ldr	r3, [sp, #20]
3000614c:	e1a030c3 	asr	r3, r3, #1
30006150:	ea000010 	b	30006198 <recus_malloc+0x290>
	}
	if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
30006154:	e59f3050 	ldr	r3, [pc, #80]	; 300061ac <recus_malloc+0x2a4>
30006158:	e5932000 	ldr	r2, [r3]
3000615c:	e59d3014 	ldr	r3, [sp, #20]
30006160:	e1a030c3 	asr	r3, r3, #1
30006164:	e0823003 	add	r3, r2, r3
30006168:	e5d33000 	ldrb	r3, [r3]
3000616c:	e1a03c03 	lsl	r3, r3, #24
30006170:	e1a03c43 	asr	r3, r3, #24
30006174:	e3530000 	cmp	r3, #0
30006178:	ba000005 	blt	30006194 <recus_malloc+0x28c>
		return num+(1<<level);
3000617c:	e3a02001 	mov	r2, #1
30006180:	e59d3004 	ldr	r3, [sp, #4]
30006184:	e1a02312 	lsl	r2, r2, r3
30006188:	e59d3014 	ldr	r3, [sp, #20]
3000618c:	e0823003 	add	r3, r2, r3
30006190:	ea000000 	b	30006198 <recus_malloc+0x290>
	else
		return num;
30006194:	e59d3014 	ldr	r3, [sp, #20]
}
30006198:	e1a00003 	mov	r0, r3
3000619c:	e28dd01c 	add	sp, sp, #28
300061a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300061a4:	e12fff1e 	bx	lr
300061a8:	3001057c 	.word	0x3001057c
300061ac:	3000fcd0 	.word	0x3000fcd0

300061b0 <r_malloc>:

static void *r_malloc(acoral_u8 level){
300061b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300061b4:	e24dd01c 	sub	sp, sp, #28
300061b8:	e1a03000 	mov	r3, r0
300061bc:	e5cd3007 	strb	r3, [sp, #7]
	acoral_sr cpu_sr;
	acoral_u32 index;
	acoral_32 num,cur;
	HAL_ENTER_CRITICAL();
300061c0:	ebffed4b 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300061c4:	e1a03000 	mov	r3, r0
300061c8:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&acoral_mem_ctrl->lock);
	acoral_mem_ctrl->free_num-=1<<level;
300061cc:	e59f3334 	ldr	r3, [pc, #820]	; 30006508 <r_malloc+0x358>
300061d0:	e5933000 	ldr	r3, [r3]
300061d4:	e59f232c 	ldr	r2, [pc, #812]	; 30006508 <r_malloc+0x358>
300061d8:	e5922000 	ldr	r2, [r2]
300061dc:	e59210f0 	ldr	r1, [r2, #240]	; 0xf0
300061e0:	e5dd2007 	ldrb	r2, [sp, #7]
300061e4:	e3a00001 	mov	r0, #1
300061e8:	e1a02210 	lsl	r2, r0, r2
300061ec:	e0622001 	rsb	r2, r2, r1
300061f0:	e58320f0 	str	r2, [r3, #240]	; 0xf0
	cur=acoral_mem_ctrl->free_cur[level];
300061f4:	e59f330c 	ldr	r3, [pc, #780]	; 30006508 <r_malloc+0x358>
300061f8:	e5933000 	ldr	r3, [r3]
300061fc:	e5dd2007 	ldrb	r2, [sp, #7]
30006200:	e282201c 	add	r2, r2, #28
30006204:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006208:	e58d3014 	str	r3, [sp, #20]
	if(cur<0){
3000620c:	e59d3014 	ldr	r3, [sp, #20]
30006210:	e3530000 	cmp	r3, #0
30006214:	aa00003f 	bge	30006318 <r_malloc+0x168>
		num=recus_malloc(level+1);
30006218:	e5dd3007 	ldrb	r3, [sp, #7]
3000621c:	e2833001 	add	r3, r3, #1
30006220:	e1a00003 	mov	r0, r3
30006224:	ebffff37 	bl	30005f08 <recus_malloc>
30006228:	e1a03000 	mov	r3, r0
3000622c:	e58d3010 	str	r3, [sp, #16]
		if(num<0){
30006230:	e59d3010 	ldr	r3, [sp, #16]
30006234:	e3530000 	cmp	r3, #0
30006238:	aa000003 	bge	3000624c <r_malloc+0x9c>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
3000623c:	e59d0008 	ldr	r0, [sp, #8]
30006240:	ebffed29 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL;
30006244:	e3a03000 	mov	r3, #0
30006248:	ea0000aa 	b	300064f8 <r_malloc+0x348>
		}
		index=num>>level+1;
3000624c:	e5dd3007 	ldrb	r3, [sp, #7]
30006250:	e2833001 	add	r3, r3, #1
30006254:	e59d2010 	ldr	r2, [sp, #16]
30006258:	e1a03352 	asr	r3, r2, r3
3000625c:	e58d300c 	str	r3, [sp, #12]
		cur=index/32;
30006260:	e59d300c 	ldr	r3, [sp, #12]
30006264:	e1a032a3 	lsr	r3, r3, #5
30006268:	e58d3014 	str	r3, [sp, #20]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
3000626c:	e59f3294 	ldr	r3, [pc, #660]	; 30006508 <r_malloc+0x358>
30006270:	e5933000 	ldr	r3, [r3]
30006274:	e5dd2007 	ldrb	r2, [sp, #7]
30006278:	e282200e 	add	r2, r2, #14
3000627c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006280:	e59d000c 	ldr	r0, [sp, #12]
30006284:	e1a01003 	mov	r1, r3
30006288:	eb000ef1 	bl	30009e54 <acoral_set_bit>
		acoral_mem_ctrl->free_list[level][cur]=-1;
3000628c:	e59f3274 	ldr	r3, [pc, #628]	; 30006508 <r_malloc+0x358>
30006290:	e5933000 	ldr	r3, [r3]
30006294:	e5dd2007 	ldrb	r2, [sp, #7]
30006298:	e7932102 	ldr	r2, [r3, r2, lsl #2]
3000629c:	e59d3014 	ldr	r3, [sp, #20]
300062a0:	e1a03103 	lsl	r3, r3, #2
300062a4:	e0823003 	add	r3, r2, r3
300062a8:	e3e02000 	mvn	r2, #0
300062ac:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_cur[level]=cur;
300062b0:	e59f3250 	ldr	r3, [pc, #592]	; 30006508 <r_malloc+0x358>
300062b4:	e5933000 	ldr	r3, [r3]
300062b8:	e5dd2007 	ldrb	r2, [sp, #7]
300062bc:	e282201c 	add	r2, r2, #28
300062c0:	e59d1014 	ldr	r1, [sp, #20]
300062c4:	e7831102 	str	r1, [r3, r2, lsl #2]
		if((num&0x1)==0)
300062c8:	e59d3010 	ldr	r3, [sp, #16]
300062cc:	e2033001 	and	r3, r3, #1
300062d0:	e3530000 	cmp	r3, #0
300062d4:	1a000006 	bne	300062f4 <r_malloc+0x144>
			acoral_mem_blocks[BLOCK_INDEX(num)].level=level;
300062d8:	e59f322c 	ldr	r3, [pc, #556]	; 3000650c <r_malloc+0x35c>
300062dc:	e5932000 	ldr	r2, [r3]
300062e0:	e59d3010 	ldr	r3, [sp, #16]
300062e4:	e1a030c3 	asr	r3, r3, #1
300062e8:	e0823003 	add	r3, r2, r3
300062ec:	e5dd2007 	ldrb	r2, [sp, #7]
300062f0:	e5c32000 	strb	r2, [r3]
#endif
#ifdef CFG_TEST_MEM
		buddy_scan();
#endif
		acoral_spin_unlock(&acoral_mem_ctrl->lock);
		HAL_EXIT_CRITICAL();
300062f4:	e59d0008 	ldr	r0, [sp, #8]
300062f8:	ebffecfb 	bl	300016ec <HAL_INTR_RESTORE>
		return (void *)(acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT));
300062fc:	e59f3204 	ldr	r3, [pc, #516]	; 30006508 <r_malloc+0x358>
30006300:	e5933000 	ldr	r3, [r3]
30006304:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
30006308:	e59d3010 	ldr	r3, [sp, #16]
3000630c:	e1a03383 	lsl	r3, r3, #7
30006310:	e0823003 	add	r3, r2, r3
30006314:	ea000077 	b	300064f8 <r_malloc+0x348>
	}
	index=acoral_ffs(acoral_mem_ctrl->bitmap[level][cur]);
30006318:	e59f31e8 	ldr	r3, [pc, #488]	; 30006508 <r_malloc+0x358>
3000631c:	e5933000 	ldr	r3, [r3]
30006320:	e5dd2007 	ldrb	r2, [sp, #7]
30006324:	e282200e 	add	r2, r2, #14
30006328:	e7932102 	ldr	r2, [r3, r2, lsl #2]
3000632c:	e59d3014 	ldr	r3, [sp, #20]
30006330:	e1a03103 	lsl	r3, r3, #2
30006334:	e0823003 	add	r3, r2, r3
30006338:	e5933000 	ldr	r3, [r3]
3000633c:	e1a00003 	mov	r0, r3
30006340:	eb000e68 	bl	30009ce8 <acoral_ffs>
30006344:	e1a03000 	mov	r3, r0
30006348:	e58d300c 	str	r3, [sp, #12]
	index=index+cur*32;
3000634c:	e59d3014 	ldr	r3, [sp, #20]
30006350:	e1a03283 	lsl	r3, r3, #5
30006354:	e59d200c 	ldr	r2, [sp, #12]
30006358:	e0823003 	add	r3, r2, r3
3000635c:	e58d300c 	str	r3, [sp, #12]
	acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
30006360:	e59f31a0 	ldr	r3, [pc, #416]	; 30006508 <r_malloc+0x358>
30006364:	e5933000 	ldr	r3, [r3]
30006368:	e5dd2007 	ldrb	r2, [sp, #7]
3000636c:	e282200e 	add	r2, r2, #14
30006370:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006374:	e59d000c 	ldr	r0, [sp, #12]
30006378:	e1a01003 	mov	r1, r3
3000637c:	eb000ecc 	bl	30009eb4 <acoral_clear_bit>
	if(acoral_mem_ctrl->bitmap[level][cur]==0){
30006380:	e59f3180 	ldr	r3, [pc, #384]	; 30006508 <r_malloc+0x358>
30006384:	e5933000 	ldr	r3, [r3]
30006388:	e5dd2007 	ldrb	r2, [sp, #7]
3000638c:	e282200e 	add	r2, r2, #14
30006390:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006394:	e59d3014 	ldr	r3, [sp, #20]
30006398:	e1a03103 	lsl	r3, r3, #2
3000639c:	e0823003 	add	r3, r2, r3
300063a0:	e5933000 	ldr	r3, [r3]
300063a4:	e3530000 	cmp	r3, #0
300063a8:	1a00000c 	bne	300063e0 <r_malloc+0x230>
		acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];
300063ac:	e59f3154 	ldr	r3, [pc, #340]	; 30006508 <r_malloc+0x358>
300063b0:	e5933000 	ldr	r3, [r3]
300063b4:	e5dd2007 	ldrb	r2, [sp, #7]
300063b8:	e59f1148 	ldr	r1, [pc, #328]	; 30006508 <r_malloc+0x358>
300063bc:	e5911000 	ldr	r1, [r1]
300063c0:	e5dd0007 	ldrb	r0, [sp, #7]
300063c4:	e7910100 	ldr	r0, [r1, r0, lsl #2]
300063c8:	e59d1014 	ldr	r1, [sp, #20]
300063cc:	e1a01101 	lsl	r1, r1, #2
300063d0:	e0801001 	add	r1, r0, r1
300063d4:	e5911000 	ldr	r1, [r1]
300063d8:	e282201c 	add	r2, r2, #28
300063dc:	e7831102 	str	r1, [r3, r2, lsl #2]
	}
	if(level==acoral_mem_ctrl->level-1){
300063e0:	e5dd2007 	ldrb	r2, [sp, #7]
300063e4:	e59f311c 	ldr	r3, [pc, #284]	; 30006508 <r_malloc+0x358>
300063e8:	e5933000 	ldr	r3, [r3]
300063ec:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
300063f0:	e1a03c03 	lsl	r3, r3, #24
300063f4:	e1a03c43 	asr	r3, r3, #24
300063f8:	e2433001 	sub	r3, r3, #1
300063fc:	e1520003 	cmp	r2, r3
30006400:	1a000012 	bne	30006450 <r_malloc+0x2a0>
		num=index<<level;
30006404:	e5dd3007 	ldrb	r3, [sp, #7]
30006408:	e59d200c 	ldr	r2, [sp, #12]
3000640c:	e1a03312 	lsl	r3, r2, r3
30006410:	e58d3010 	str	r3, [sp, #16]
		if(num+(1<<level)>acoral_mem_ctrl->block_num){
30006414:	e5dd3007 	ldrb	r3, [sp, #7]
30006418:	e3a02001 	mov	r2, #1
3000641c:	e1a02312 	lsl	r2, r2, r3
30006420:	e59d3010 	ldr	r3, [sp, #16]
30006424:	e0823003 	add	r3, r2, r3
30006428:	e1a02003 	mov	r2, r3
3000642c:	e59f30d4 	ldr	r3, [pc, #212]	; 30006508 <r_malloc+0x358>
30006430:	e5933000 	ldr	r3, [r3]
30006434:	e59330ec 	ldr	r3, [r3, #236]	; 0xec
30006438:	e1520003 	cmp	r2, r3
3000643c:	9a000019 	bls	300064a8 <r_malloc+0x2f8>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
30006440:	e59d0008 	ldr	r0, [sp, #8]
30006444:	ebffeca8 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL; 
30006448:	e3a03000 	mov	r3, #0
3000644c:	ea000029 	b	300064f8 <r_malloc+0x348>
		}
	}
	else{
		num=index<<level+1;
30006450:	e5dd3007 	ldrb	r3, [sp, #7]
30006454:	e2833001 	add	r3, r3, #1
30006458:	e59d200c 	ldr	r2, [sp, #12]
3000645c:	e1a03312 	lsl	r3, r2, r3
30006460:	e58d3010 	str	r3, [sp, #16]
		if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
30006464:	e59f30a0 	ldr	r3, [pc, #160]	; 3000650c <r_malloc+0x35c>
30006468:	e5932000 	ldr	r2, [r3]
3000646c:	e59d3010 	ldr	r3, [sp, #16]
30006470:	e1a030c3 	asr	r3, r3, #1
30006474:	e0823003 	add	r3, r2, r3
30006478:	e5d33000 	ldrb	r3, [r3]
3000647c:	e1a03c03 	lsl	r3, r3, #24
30006480:	e1a03c43 	asr	r3, r3, #24
30006484:	e3530000 	cmp	r3, #0
30006488:	ba000007 	blt	300064ac <r_malloc+0x2fc>
			num+=(1<<level);
3000648c:	e5dd3007 	ldrb	r3, [sp, #7]
30006490:	e3a02001 	mov	r2, #1
30006494:	e1a03312 	lsl	r3, r2, r3
30006498:	e59d2010 	ldr	r2, [sp, #16]
3000649c:	e0823003 	add	r3, r2, r3
300064a0:	e58d3010 	str	r3, [sp, #16]
300064a4:	ea000000 	b	300064ac <r_malloc+0x2fc>
	if(level==acoral_mem_ctrl->level-1){
		num=index<<level;
		if(num+(1<<level)>acoral_mem_ctrl->block_num){
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
			return NULL; 
300064a8:	e1a00000 	nop			; (mov r0, r0)
	else{
		num=index<<level+1;
		if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
			num+=(1<<level);
	}
	if((num&0x1)==0)
300064ac:	e59d3010 	ldr	r3, [sp, #16]
300064b0:	e2033001 	and	r3, r3, #1
300064b4:	e3530000 	cmp	r3, #0
300064b8:	1a000006 	bne	300064d8 <r_malloc+0x328>
		acoral_mem_blocks[BLOCK_INDEX(num)].level=level;
300064bc:	e59f3048 	ldr	r3, [pc, #72]	; 3000650c <r_malloc+0x35c>
300064c0:	e5932000 	ldr	r2, [r3]
300064c4:	e59d3010 	ldr	r3, [sp, #16]
300064c8:	e1a030c3 	asr	r3, r3, #1
300064cc:	e0823003 	add	r3, r2, r3
300064d0:	e5dd2007 	ldrb	r2, [sp, #7]
300064d4:	e5c32000 	strb	r2, [r3]
#endif
#ifdef CFG_TEST_MEM
	buddy_scan();
#endif
	acoral_spin_unlock(&acoral_mem_ctrl->lock);
	HAL_EXIT_CRITICAL();
300064d8:	e59d0008 	ldr	r0, [sp, #8]
300064dc:	ebffec82 	bl	300016ec <HAL_INTR_RESTORE>
	return (void *)(acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT));
300064e0:	e59f3020 	ldr	r3, [pc, #32]	; 30006508 <r_malloc+0x358>
300064e4:	e5933000 	ldr	r3, [r3]
300064e8:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
300064ec:	e59d3010 	ldr	r3, [sp, #16]
300064f0:	e1a03383 	lsl	r3, r3, #7
300064f4:	e0823003 	add	r3, r2, r3
}
300064f8:	e1a00003 	mov	r0, r3
300064fc:	e28dd01c 	add	sp, sp, #28
30006500:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006504:	e12fff1e 	bx	lr
30006508:	3001057c 	.word	0x3001057c
3000650c:	3000fcd0 	.word	0x3000fcd0

30006510 <buddy_malloc_size>:

acoral_u32 buddy_malloc_size(acoral_u32 size){
30006510:	e24dd018 	sub	sp, sp, #24
30006514:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 resize_size;	
	acoral_u8 level=0;	
30006518:	e3a03000 	mov	r3, #0
3000651c:	e5cd3013 	strb	r3, [sp, #19]
	acoral_u32 num=1;	
30006520:	e3a03001 	mov	r3, #1
30006524:	e58d3014 	str	r3, [sp, #20]
	resize_size=BLOCK_SIZE;
30006528:	e3a03080 	mov	r3, #128	; 0x80
3000652c:	e58d300c 	str	r3, [sp, #12]
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
30006530:	e59f3078 	ldr	r3, [pc, #120]	; 300065b0 <buddy_malloc_size+0xa0>
30006534:	e5933000 	ldr	r3, [r3]
30006538:	e5d330e1 	ldrb	r3, [r3, #225]	; 0xe1
3000653c:	e3530000 	cmp	r3, #0
30006540:	1a00000a 	bne	30006570 <buddy_malloc_size+0x60>
		return 0;
30006544:	e3a03000 	mov	r3, #0
30006548:	ea000015 	b	300065a4 <buddy_malloc_size+0x94>
	while(resize_size<size&&level<acoral_mem_ctrl->level){
		num=num<<1;
3000654c:	e59d3014 	ldr	r3, [sp, #20]
30006550:	e1a03083 	lsl	r3, r3, #1
30006554:	e58d3014 	str	r3, [sp, #20]
		level++;
30006558:	e5dd3013 	ldrb	r3, [sp, #19]
3000655c:	e2833001 	add	r3, r3, #1
30006560:	e5cd3013 	strb	r3, [sp, #19]
		resize_size=resize_size<<1;
30006564:	e59d300c 	ldr	r3, [sp, #12]
30006568:	e1a03083 	lsl	r3, r3, #1
3000656c:	e58d300c 	str	r3, [sp, #12]
	acoral_u8 level=0;	
	acoral_u32 num=1;	
	resize_size=BLOCK_SIZE;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return 0;
	while(resize_size<size&&level<acoral_mem_ctrl->level){
30006570:	e59d200c 	ldr	r2, [sp, #12]
30006574:	e59d3004 	ldr	r3, [sp, #4]
30006578:	e1520003 	cmp	r2, r3
3000657c:	2a000007 	bcs	300065a0 <buddy_malloc_size+0x90>
30006580:	e5dd2013 	ldrb	r2, [sp, #19]
30006584:	e59f3024 	ldr	r3, [pc, #36]	; 300065b0 <buddy_malloc_size+0xa0>
30006588:	e5933000 	ldr	r3, [r3]
3000658c:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30006590:	e1a03c03 	lsl	r3, r3, #24
30006594:	e1a03c43 	asr	r3, r3, #24
30006598:	e1520003 	cmp	r2, r3
3000659c:	baffffea 	blt	3000654c <buddy_malloc_size+0x3c>
		num=num<<1;
		level++;
		resize_size=resize_size<<1;
	}
	return resize_size;
300065a0:	e59d300c 	ldr	r3, [sp, #12]
}
300065a4:	e1a00003 	mov	r0, r3
300065a8:	e28dd018 	add	sp, sp, #24
300065ac:	e12fff1e 	bx	lr
300065b0:	3001057c 	.word	0x3001057c

300065b4 <buddy_malloc>:

void *buddy_malloc(acoral_u32 size){
300065b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300065b8:	e24dd01c 	sub	sp, sp, #28
300065bc:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 resize_size;	
	acoral_u8 level=0;	
300065c0:	e3a03000 	mov	r3, #0
300065c4:	e5cd3013 	strb	r3, [sp, #19]
	acoral_u32 num=1;	
300065c8:	e3a03001 	mov	r3, #1
300065cc:	e58d3014 	str	r3, [sp, #20]
	resize_size=BLOCK_SIZE;
300065d0:	e3a03080 	mov	r3, #128	; 0x80
300065d4:	e58d300c 	str	r3, [sp, #12]
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
300065d8:	e59f30b0 	ldr	r3, [pc, #176]	; 30006690 <buddy_malloc+0xdc>
300065dc:	e5933000 	ldr	r3, [r3]
300065e0:	e5d330e1 	ldrb	r3, [r3, #225]	; 0xe1
300065e4:	e3530000 	cmp	r3, #0
300065e8:	1a00000a 	bne	30006618 <buddy_malloc+0x64>
		return NULL;
300065ec:	e3a03000 	mov	r3, #0
300065f0:	ea000022 	b	30006680 <buddy_malloc+0xcc>
	while(resize_size<size){
		num=num<<1;
300065f4:	e59d3014 	ldr	r3, [sp, #20]
300065f8:	e1a03083 	lsl	r3, r3, #1
300065fc:	e58d3014 	str	r3, [sp, #20]
		level++;
30006600:	e5dd3013 	ldrb	r3, [sp, #19]
30006604:	e2833001 	add	r3, r3, #1
30006608:	e5cd3013 	strb	r3, [sp, #19]
		resize_size=resize_size<<1;
3000660c:	e59d300c 	ldr	r3, [sp, #12]
30006610:	e1a03083 	lsl	r3, r3, #1
30006614:	e58d300c 	str	r3, [sp, #12]
	acoral_u8 level=0;	
	acoral_u32 num=1;	
	resize_size=BLOCK_SIZE;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return NULL;
	while(resize_size<size){
30006618:	e59d200c 	ldr	r2, [sp, #12]
3000661c:	e59d3004 	ldr	r3, [sp, #4]
30006620:	e1520003 	cmp	r2, r3
30006624:	3afffff2 	bcc	300065f4 <buddy_malloc+0x40>
		num=num<<1;
		level++;
		resize_size=resize_size<<1;
	}
	if(num>acoral_mem_ctrl->free_num)
30006628:	e59f3060 	ldr	r3, [pc, #96]	; 30006690 <buddy_malloc+0xdc>
3000662c:	e5933000 	ldr	r3, [r3]
30006630:	e59320f0 	ldr	r2, [r3, #240]	; 0xf0
30006634:	e59d3014 	ldr	r3, [sp, #20]
30006638:	e1520003 	cmp	r2, r3
3000663c:	2a000001 	bcs	30006648 <buddy_malloc+0x94>
		return NULL;
30006640:	e3a03000 	mov	r3, #0
30006644:	ea00000d 	b	30006680 <buddy_malloc+0xcc>
	if(level>=acoral_mem_ctrl->level)
30006648:	e5dd2013 	ldrb	r2, [sp, #19]
3000664c:	e59f303c 	ldr	r3, [pc, #60]	; 30006690 <buddy_malloc+0xdc>
30006650:	e5933000 	ldr	r3, [r3]
30006654:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30006658:	e1a03c03 	lsl	r3, r3, #24
3000665c:	e1a03c43 	asr	r3, r3, #24
30006660:	e1520003 	cmp	r2, r3
30006664:	ba000001 	blt	30006670 <buddy_malloc+0xbc>
		return NULL;	
30006668:	e3a03000 	mov	r3, #0
3000666c:	ea000003 	b	30006680 <buddy_malloc+0xcc>
	return r_malloc(level);
30006670:	e5dd3013 	ldrb	r3, [sp, #19]
30006674:	e1a00003 	mov	r0, r3
30006678:	ebfffecc 	bl	300061b0 <r_malloc>
3000667c:	e1a03000 	mov	r3, r0
}
30006680:	e1a00003 	mov	r0, r3
30006684:	e28dd01c 	add	sp, sp, #28
30006688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000668c:	e12fff1e 	bx	lr
30006690:	3001057c 	.word	0x3001057c

30006694 <buddy_free>:

void buddy_free(void *ptr){
30006694:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006698:	e24dd02c 	sub	sp, sp, #44	; 0x2c
3000669c:	e58d0004 	str	r0, [sp, #4]
	acoral_32 cur;
	acoral_u32 index;
	acoral_u32 num;
	acoral_u32 max_level;
	acoral_u32 adr;
	adr=(acoral_u32)ptr;
300066a0:	e59d3004 	ldr	r3, [sp, #4]
300066a4:	e58d3024 	str	r3, [sp, #36]	; 0x24
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
300066a8:	e59f348c 	ldr	r3, [pc, #1164]	; 30006b3c <buddy_free+0x4a8>
300066ac:	e5933000 	ldr	r3, [r3]
300066b0:	e5d330e1 	ldrb	r3, [r3, #225]	; 0xe1
300066b4:	e3530000 	cmp	r3, #0
300066b8:	0a00011b 	beq	30006b2c <buddy_free+0x498>
		return;
	if(ptr==NULL||adr<acoral_mem_ctrl->start_adr||adr+BLOCK_SIZE>acoral_mem_ctrl->end_adr){
300066bc:	e59d3004 	ldr	r3, [sp, #4]
300066c0:	e3530000 	cmp	r3, #0
300066c4:	0a00000c 	beq	300066fc <buddy_free+0x68>
300066c8:	e59f346c 	ldr	r3, [pc, #1132]	; 30006b3c <buddy_free+0x4a8>
300066cc:	e5933000 	ldr	r3, [r3]
300066d0:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
300066d4:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300066d8:	e1520003 	cmp	r2, r3
300066dc:	8a000006 	bhi	300066fc <buddy_free+0x68>
300066e0:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300066e4:	e2832080 	add	r2, r3, #128	; 0x80
300066e8:	e59f344c 	ldr	r3, [pc, #1100]	; 30006b3c <buddy_free+0x4a8>
300066ec:	e5933000 	ldr	r3, [r3]
300066f0:	e59330e8 	ldr	r3, [r3, #232]	; 0xe8
300066f4:	e1520003 	cmp	r2, r3
300066f8:	9a000003 	bls	3000670c <buddy_free+0x78>
		acoral_printerr("Invalid Free Address:0x%x\n",ptr);
300066fc:	e59f043c 	ldr	r0, [pc, #1084]	; 30006b40 <buddy_free+0x4ac>
30006700:	e59d1004 	ldr	r1, [sp, #4]
30006704:	eb001346 	bl	3000b424 <acoral_print>
		return;
30006708:	ea000108 	b	30006b30 <buddy_free+0x49c>
	}
	max_level=acoral_mem_ctrl->level;
3000670c:	e59f3428 	ldr	r3, [pc, #1064]	; 30006b3c <buddy_free+0x4a8>
30006710:	e5933000 	ldr	r3, [r3]
30006714:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30006718:	e1a03c03 	lsl	r3, r3, #24
3000671c:	e1a03c43 	asr	r3, r3, #24
30006720:	e58d3020 	str	r3, [sp, #32]
	num=(adr-acoral_mem_ctrl->start_adr)>>BLOCK_SHIFT;
30006724:	e59f3410 	ldr	r3, [pc, #1040]	; 30006b3c <buddy_free+0x4a8>
30006728:	e5933000 	ldr	r3, [r3]
3000672c:	e59330e4 	ldr	r3, [r3, #228]	; 0xe4
30006730:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
30006734:	e0633002 	rsb	r3, r3, r2
30006738:	e1a033a3 	lsr	r3, r3, #7
3000673c:	e58d301c 	str	r3, [sp, #28]
	/*如果不是block整数倍，肯定是非法地址*/
	if(adr!=acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT)){
30006740:	e59f33f4 	ldr	r3, [pc, #1012]	; 30006b3c <buddy_free+0x4a8>
30006744:	e5933000 	ldr	r3, [r3]
30006748:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
3000674c:	e59d301c 	ldr	r3, [sp, #28]
30006750:	e1a03383 	lsl	r3, r3, #7
30006754:	e0822003 	add	r2, r2, r3
30006758:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000675c:	e1520003 	cmp	r2, r3
30006760:	0a000003 	beq	30006774 <buddy_free+0xe0>
		acoral_printerr("Invalid Free Address:0x%x\n",ptr);
30006764:	e59f03d4 	ldr	r0, [pc, #980]	; 30006b40 <buddy_free+0x4ac>
30006768:	e59d1004 	ldr	r1, [sp, #4]
3000676c:	eb00132c 	bl	3000b424 <acoral_print>
		return;
30006770:	ea0000ee 	b	30006b30 <buddy_free+0x49c>
	}
	HAL_ENTER_CRITICAL();
30006774:	ebffebde 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30006778:	e1a03000 	mov	r3, r0
3000677c:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&acoral_mem_ctrl->lock);
	if(num&0x1){
30006780:	e59d301c 	ldr	r3, [sp, #28]
30006784:	e2033001 	and	r3, r3, #1
30006788:	e20330ff 	and	r3, r3, #255	; 0xff
3000678c:	e3530000 	cmp	r3, #0
30006790:	0a00003c 	beq	30006888 <buddy_free+0x1f4>
		level=0;
30006794:	e3a03000 	mov	r3, #0
30006798:	e5cd3012 	strb	r3, [sp, #18]
		/*下面是地址检查*/
		index=num>>1;
3000679c:	e59d301c 	ldr	r3, [sp, #28]
300067a0:	e1a030a3 	lsr	r3, r3, #1
300067a4:	e58d3018 	str	r3, [sp, #24]
		buddy_level=acoral_mem_blocks[BLOCK_INDEX(num)].level;
300067a8:	e59f3394 	ldr	r3, [pc, #916]	; 30006b44 <buddy_free+0x4b0>
300067ac:	e5932000 	ldr	r2, [r3]
300067b0:	e59d301c 	ldr	r3, [sp, #28]
300067b4:	e1a030a3 	lsr	r3, r3, #1
300067b8:	e0823003 	add	r3, r2, r3
300067bc:	e5d33000 	ldrb	r3, [r3]
300067c0:	e5cd3013 	strb	r3, [sp, #19]
		if(buddy_level>0){
300067c4:	e1dd31d3 	ldrsb	r3, [sp, #19]
300067c8:	e3530000 	cmp	r3, #0
300067cc:	da000005 	ble	300067e8 <buddy_free+0x154>
			acoral_printerr("Invalid Free Address:0x%x\n",ptr);
300067d0:	e59f0368 	ldr	r0, [pc, #872]	; 30006b40 <buddy_free+0x4ac>
300067d4:	e59d1004 	ldr	r1, [sp, #4]
300067d8:	eb001311 	bl	3000b424 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
300067dc:	e59d000c 	ldr	r0, [sp, #12]
300067e0:	ebffebc1 	bl	300016ec <HAL_INTR_RESTORE>
			return;
300067e4:	ea0000d1 	b	30006b30 <buddy_free+0x49c>
		}
		/*伙伴分配出去，如果对应的位为1,肯定是回收过一次了*/
		if(buddy_level==0&&acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
300067e8:	e1dd31d3 	ldrsb	r3, [sp, #19]
300067ec:	e3530000 	cmp	r3, #0
300067f0:	1a000010 	bne	30006838 <buddy_free+0x1a4>
300067f4:	e59f3340 	ldr	r3, [pc, #832]	; 30006b3c <buddy_free+0x4a8>
300067f8:	e5933000 	ldr	r3, [r3]
300067fc:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006800:	e282200e 	add	r2, r2, #14
30006804:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006808:	e59d0018 	ldr	r0, [sp, #24]
3000680c:	e1a01003 	mov	r1, r3
30006810:	eb000dc0 	bl	30009f18 <acoral_get_bit>
30006814:	e1a03000 	mov	r3, r0
30006818:	e3530000 	cmp	r3, #0
3000681c:	0a000005 	beq	30006838 <buddy_free+0x1a4>
			acoral_printerr("Address:0x%x have been freed\n",ptr);
30006820:	e59f0320 	ldr	r0, [pc, #800]	; 30006b48 <buddy_free+0x4b4>
30006824:	e59d1004 	ldr	r1, [sp, #4]
30006828:	eb0012fd 	bl	3000b424 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
3000682c:	e59d000c 	ldr	r0, [sp, #12]
30006830:	ebffebad 	bl	300016ec <HAL_INTR_RESTORE>
			return;
30006834:	ea0000bd 	b	30006b30 <buddy_free+0x49c>
		}
		/*伙伴没有分配出去了，如果对应的位为0,肯定是回收过一次了*/
		if(buddy_level<0&&!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
30006838:	e1dd31d3 	ldrsb	r3, [sp, #19]
3000683c:	e3530000 	cmp	r3, #0
30006840:	aa000032 	bge	30006910 <buddy_free+0x27c>
30006844:	e59f32f0 	ldr	r3, [pc, #752]	; 30006b3c <buddy_free+0x4a8>
30006848:	e5933000 	ldr	r3, [r3]
3000684c:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006850:	e282200e 	add	r2, r2, #14
30006854:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006858:	e59d0018 	ldr	r0, [sp, #24]
3000685c:	e1a01003 	mov	r1, r3
30006860:	eb000dac 	bl	30009f18 <acoral_get_bit>
30006864:	e1a03000 	mov	r3, r0
30006868:	e3530000 	cmp	r3, #0
3000686c:	1a000029 	bne	30006918 <buddy_free+0x284>
			acoral_printerr("Address:0x%x have been freed\n",ptr);
30006870:	e59f02d0 	ldr	r0, [pc, #720]	; 30006b48 <buddy_free+0x4b4>
30006874:	e59d1004 	ldr	r1, [sp, #4]
30006878:	eb0012e9 	bl	3000b424 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
3000687c:	e59d000c 	ldr	r0, [sp, #12]
30006880:	ebffeb99 	bl	300016ec <HAL_INTR_RESTORE>
			return;
30006884:	ea0000a9 	b	30006b30 <buddy_free+0x49c>
		}
	}else{
		level=acoral_mem_blocks[BLOCK_INDEX(num)].level;
30006888:	e59f32b4 	ldr	r3, [pc, #692]	; 30006b44 <buddy_free+0x4b0>
3000688c:	e5932000 	ldr	r2, [r3]
30006890:	e59d301c 	ldr	r3, [sp, #28]
30006894:	e1a030a3 	lsr	r3, r3, #1
30006898:	e0823003 	add	r3, r2, r3
3000689c:	e5d33000 	ldrb	r3, [r3]
300068a0:	e5cd3012 	strb	r3, [sp, #18]
		/*已经释放*/
		if(level<0){
300068a4:	e1dd31d2 	ldrsb	r3, [sp, #18]
300068a8:	e3530000 	cmp	r3, #0
300068ac:	aa000005 	bge	300068c8 <buddy_free+0x234>
			acoral_printerr("Address:0x%x have been freed\n",ptr);
300068b0:	e59f0290 	ldr	r0, [pc, #656]	; 30006b48 <buddy_free+0x4b4>
300068b4:	e59d1004 	ldr	r1, [sp, #4]
300068b8:	eb0012d9 	bl	3000b424 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
300068bc:	e59d000c 	ldr	r0, [sp, #12]
300068c0:	ebffeb89 	bl	300016ec <HAL_INTR_RESTORE>
			return;
300068c4:	ea000099 	b	30006b30 <buddy_free+0x49c>
		}	
		acoral_mem_ctrl->free_num+=1<<level;
300068c8:	e59f326c 	ldr	r3, [pc, #620]	; 30006b3c <buddy_free+0x4a8>
300068cc:	e5933000 	ldr	r3, [r3]
300068d0:	e59f2264 	ldr	r2, [pc, #612]	; 30006b3c <buddy_free+0x4a8>
300068d4:	e5922000 	ldr	r2, [r2]
300068d8:	e59210f0 	ldr	r1, [r2, #240]	; 0xf0
300068dc:	e1dd21d2 	ldrsb	r2, [sp, #18]
300068e0:	e3a00001 	mov	r0, #1
300068e4:	e1a02210 	lsl	r2, r0, r2
300068e8:	e0812002 	add	r2, r1, r2
300068ec:	e58320f0 	str	r2, [r3, #240]	; 0xf0
		acoral_mem_blocks[BLOCK_INDEX(num)].level=-1;
300068f0:	e59f324c 	ldr	r3, [pc, #588]	; 30006b44 <buddy_free+0x4b0>
300068f4:	e5932000 	ldr	r2, [r3]
300068f8:	e59d301c 	ldr	r3, [sp, #28]
300068fc:	e1a030a3 	lsr	r3, r3, #1
30006900:	e0823003 	add	r3, r2, r3
30006904:	e3e02000 	mvn	r2, #0
30006908:	e5c32000 	strb	r2, [r3]
3000690c:	ea000002 	b	3000691c <buddy_free+0x288>
		/*伙伴没有分配出去了，如果对应的位为0,肯定是回收过一次了*/
		if(buddy_level<0&&!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
			acoral_printerr("Address:0x%x have been freed\n",ptr);
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
			return;
30006910:	e1a00000 	nop			; (mov r0, r0)
30006914:	ea000000 	b	3000691c <buddy_free+0x288>
30006918:	e1a00000 	nop			; (mov r0, r0)
		acoral_mem_blocks[BLOCK_INDEX(num)].level=-1;
	}
#ifdef CFG_TEST
	acoral_print("Free-level:%d,num:%d\n",level,num);
#endif
	if(level==max_level-1){
3000691c:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006920:	e59d3020 	ldr	r3, [sp, #32]
30006924:	e2433001 	sub	r3, r3, #1
30006928:	e1520003 	cmp	r2, r3
3000692c:	1a00000e 	bne	3000696c <buddy_free+0x2d8>
		index=num>>level;
30006930:	e1dd31d2 	ldrsb	r3, [sp, #18]
30006934:	e59d201c 	ldr	r2, [sp, #28]
30006938:	e1a03332 	lsr	r3, r2, r3
3000693c:	e58d3018 	str	r3, [sp, #24]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
30006940:	e59f31f4 	ldr	r3, [pc, #500]	; 30006b3c <buddy_free+0x4a8>
30006944:	e5933000 	ldr	r3, [r3]
30006948:	e1dd21d2 	ldrsb	r2, [sp, #18]
3000694c:	e282200e 	add	r2, r2, #14
30006950:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006954:	e59d0018 	ldr	r0, [sp, #24]
30006958:	e1a01003 	mov	r1, r3
3000695c:	eb000d3c 	bl	30009e54 <acoral_set_bit>
		HAL_EXIT_CRITICAL();
30006960:	e59d000c 	ldr	r0, [sp, #12]
30006964:	ebffeb60 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_spin_unlock(&acoral_mem_ctrl->lock);
		return;
30006968:	ea000070 	b	30006b30 <buddy_free+0x49c>
	}
	index=num>>1+level;
3000696c:	e1dd31d2 	ldrsb	r3, [sp, #18]
30006970:	e2833001 	add	r3, r3, #1
30006974:	e59d201c 	ldr	r2, [sp, #28]
30006978:	e1a03332 	lsr	r3, r2, r3
3000697c:	e58d3018 	str	r3, [sp, #24]
	while(level<max_level){
30006980:	ea000060 	b	30006b08 <buddy_free+0x474>
		cur=index/32;
30006984:	e59d3018 	ldr	r3, [sp, #24]
30006988:	e1a032a3 	lsr	r3, r3, #5
3000698c:	e58d3014 	str	r3, [sp, #20]
		if(!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
30006990:	e59f31a4 	ldr	r3, [pc, #420]	; 30006b3c <buddy_free+0x4a8>
30006994:	e5933000 	ldr	r3, [r3]
30006998:	e1dd21d2 	ldrsb	r2, [sp, #18]
3000699c:	e282200e 	add	r2, r2, #14
300069a0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300069a4:	e59d0018 	ldr	r0, [sp, #24]
300069a8:	e1a01003 	mov	r1, r3
300069ac:	eb000d59 	bl	30009f18 <acoral_get_bit>
300069b0:	e1a03000 	mov	r3, r0
300069b4:	e3530000 	cmp	r3, #0
300069b8:	1a00002a 	bne	30006a68 <buddy_free+0x3d4>
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
300069bc:	e59f3178 	ldr	r3, [pc, #376]	; 30006b3c <buddy_free+0x4a8>
300069c0:	e5933000 	ldr	r3, [r3]
300069c4:	e1dd21d2 	ldrsb	r2, [sp, #18]
300069c8:	e282200e 	add	r2, r2, #14
300069cc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300069d0:	e59d0018 	ldr	r0, [sp, #24]
300069d4:	e1a01003 	mov	r1, r3
300069d8:	eb000d1d 	bl	30009e54 <acoral_set_bit>
			if(acoral_mem_ctrl->free_cur[level]<0||cur<acoral_mem_ctrl->free_cur[level]){
300069dc:	e59f3158 	ldr	r3, [pc, #344]	; 30006b3c <buddy_free+0x4a8>
300069e0:	e5933000 	ldr	r3, [r3]
300069e4:	e1dd21d2 	ldrsb	r2, [sp, #18]
300069e8:	e282201c 	add	r2, r2, #28
300069ec:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300069f0:	e3530000 	cmp	r3, #0
300069f4:	ba000007 	blt	30006a18 <buddy_free+0x384>
300069f8:	e59f313c 	ldr	r3, [pc, #316]	; 30006b3c <buddy_free+0x4a8>
300069fc:	e5933000 	ldr	r3, [r3]
30006a00:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006a04:	e282201c 	add	r2, r2, #28
30006a08:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006a0c:	e59d3014 	ldr	r3, [sp, #20]
30006a10:	e1520003 	cmp	r2, r3
30006a14:	da000040 	ble	30006b1c <buddy_free+0x488>
				acoral_mem_ctrl->free_list[level][cur]=acoral_mem_ctrl->free_cur[level];	
30006a18:	e59f311c 	ldr	r3, [pc, #284]	; 30006b3c <buddy_free+0x4a8>
30006a1c:	e5933000 	ldr	r3, [r3]
30006a20:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006a24:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006a28:	e59d3014 	ldr	r3, [sp, #20]
30006a2c:	e1a03103 	lsl	r3, r3, #2
30006a30:	e0823003 	add	r3, r2, r3
30006a34:	e59f2100 	ldr	r2, [pc, #256]	; 30006b3c <buddy_free+0x4a8>
30006a38:	e5922000 	ldr	r2, [r2]
30006a3c:	e1dd11d2 	ldrsb	r1, [sp, #18]
30006a40:	e281101c 	add	r1, r1, #28
30006a44:	e7922101 	ldr	r2, [r2, r1, lsl #2]
30006a48:	e5832000 	str	r2, [r3]
				acoral_mem_ctrl->free_cur[level]=cur;	
30006a4c:	e59f30e8 	ldr	r3, [pc, #232]	; 30006b3c <buddy_free+0x4a8>
30006a50:	e5933000 	ldr	r3, [r3]
30006a54:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006a58:	e282201c 	add	r2, r2, #28
30006a5c:	e59d1014 	ldr	r1, [sp, #20]
30006a60:	e7831102 	str	r1, [r3, r2, lsl #2]
			}
			break;
30006a64:	ea00002d 	b	30006b20 <buddy_free+0x48c>
		}
		/*有个伙伴是空闲的，向上级回收*/
		acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
30006a68:	e59f30cc 	ldr	r3, [pc, #204]	; 30006b3c <buddy_free+0x4a8>
30006a6c:	e5933000 	ldr	r3, [r3]
30006a70:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006a74:	e282200e 	add	r2, r2, #14
30006a78:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006a7c:	e59d0018 	ldr	r0, [sp, #24]
30006a80:	e1a01003 	mov	r1, r3
30006a84:	eb000d0a 	bl	30009eb4 <acoral_clear_bit>
		if(cur==acoral_mem_ctrl->free_cur[level])
30006a88:	e59f30ac 	ldr	r3, [pc, #172]	; 30006b3c <buddy_free+0x4a8>
30006a8c:	e5933000 	ldr	r3, [r3]
30006a90:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006a94:	e282201c 	add	r2, r2, #28
30006a98:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006a9c:	e59d3014 	ldr	r3, [sp, #20]
30006aa0:	e1520003 	cmp	r2, r3
30006aa4:	1a00000c 	bne	30006adc <buddy_free+0x448>
			acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];	
30006aa8:	e59f308c 	ldr	r3, [pc, #140]	; 30006b3c <buddy_free+0x4a8>
30006aac:	e5933000 	ldr	r3, [r3]
30006ab0:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006ab4:	e59f1080 	ldr	r1, [pc, #128]	; 30006b3c <buddy_free+0x4a8>
30006ab8:	e5911000 	ldr	r1, [r1]
30006abc:	e1dd01d2 	ldrsb	r0, [sp, #18]
30006ac0:	e7910100 	ldr	r0, [r1, r0, lsl #2]
30006ac4:	e59d1014 	ldr	r1, [sp, #20]
30006ac8:	e1a01101 	lsl	r1, r1, #2
30006acc:	e0801001 	add	r1, r0, r1
30006ad0:	e5911000 	ldr	r1, [r1]
30006ad4:	e282201c 	add	r2, r2, #28
30006ad8:	e7831102 	str	r1, [r3, r2, lsl #2]
		level++;
30006adc:	e5dd3012 	ldrb	r3, [sp, #18]
30006ae0:	e2833001 	add	r3, r3, #1
30006ae4:	e5cd3012 	strb	r3, [sp, #18]
		if(level<max_level-1)
30006ae8:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006aec:	e59d3020 	ldr	r3, [sp, #32]
30006af0:	e2433001 	sub	r3, r3, #1
30006af4:	e1520003 	cmp	r2, r3
30006af8:	2a000002 	bcs	30006b08 <buddy_free+0x474>
			index=index>>1;
30006afc:	e59d3018 	ldr	r3, [sp, #24]
30006b00:	e1a030a3 	lsr	r3, r3, #1
30006b04:	e58d3018 	str	r3, [sp, #24]
		HAL_EXIT_CRITICAL();
		acoral_spin_unlock(&acoral_mem_ctrl->lock);
		return;
	}
	index=num>>1+level;
	while(level<max_level){
30006b08:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006b0c:	e59d3020 	ldr	r3, [sp, #32]
30006b10:	e1520003 	cmp	r2, r3
30006b14:	3affff9a 	bcc	30006984 <buddy_free+0x2f0>
30006b18:	ea000000 	b	30006b20 <buddy_free+0x48c>
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
			if(acoral_mem_ctrl->free_cur[level]<0||cur<acoral_mem_ctrl->free_cur[level]){
				acoral_mem_ctrl->free_list[level][cur]=acoral_mem_ctrl->free_cur[level];	
				acoral_mem_ctrl->free_cur[level]=cur;	
			}
			break;
30006b1c:	e1a00000 	nop			; (mov r0, r0)
			acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];	
		level++;
		if(level<max_level-1)
			index=index>>1;
	}
	HAL_EXIT_CRITICAL();
30006b20:	e59d000c 	ldr	r0, [sp, #12]
30006b24:	ebffeaf0 	bl	300016ec <HAL_INTR_RESTORE>
30006b28:	ea000000 	b	30006b30 <buddy_free+0x49c>
	acoral_u32 num;
	acoral_u32 max_level;
	acoral_u32 adr;
	adr=(acoral_u32)ptr;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return;
30006b2c:	e1a00000 	nop			; (mov r0, r0)
	HAL_EXIT_CRITICAL();
	acoral_spin_unlock(&acoral_mem_ctrl->lock);
#ifdef CFG_TEST_MEM
	buddy_scan();
#endif
}
30006b30:	e28dd02c 	add	sp, sp, #44	; 0x2c
30006b34:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006b38:	e12fff1e 	bx	lr
30006b3c:	3001057c 	.word	0x3001057c
30006b40:	3000e654 	.word	0x3000e654
30006b44:	3000fcd0 	.word	0x3000fcd0
30006b48:	3000e670 	.word	0x3000e670

30006b4c <r_malloc>:
	acoral_u32 alloc_size;
#endif
	acoral_u8 mem_state;
}mem_ctrl;

static void *r_malloc(acoral_32 size){
30006b4c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006b50:	e24dd01c 	sub	sp, sp, #28
30006b54:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 * tp;
	acoral_8 * ctp;
	acoral_u32 b_size;
	size=size+4;
30006b58:	e59d3004 	ldr	r3, [sp, #4]
30006b5c:	e2833004 	add	r3, r3, #4
30006b60:	e58d3004 	str	r3, [sp, #4]
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=MUTEX_SUCCED)
30006b64:	ea000000 	b	30006b6c <r_malloc+0x20>
		acoral_suspend_self();
30006b68:	ebffef17 	bl	300027cc <acoral_suspend_self>
static void *r_malloc(acoral_32 size){
	acoral_u32 * tp;
	acoral_8 * ctp;
	acoral_u32 b_size;
	size=size+4;
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=MUTEX_SUCCED)
30006b6c:	e59f0284 	ldr	r0, [pc, #644]	; 30006df8 <r_malloc+0x2ac>
30006b70:	e3a01000 	mov	r1, #0
30006b74:	ebfff921 	bl	30005000 <acoral_mutex_pend>
30006b78:	e1a03000 	mov	r3, r0
30006b7c:	e3530000 	cmp	r3, #0
30006b80:	1afffff8 	bne	30006b68 <r_malloc+0x1c>
#ifdef CFG_TEST
	mem_ctrl.alloc_size+=size;
	mem_ctrl.alloc_num++;
	acoral_print("In malloc:%d\n",size);
#endif
	tp=mem_ctrl.freep_p;
30006b84:	e59f326c 	ldr	r3, [pc, #620]	; 30006df8 <r_malloc+0x2ac>
30006b88:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
30006b8c:	e58d300c 	str	r3, [sp, #12]
	ctp=(acoral_8 *)tp;
30006b90:	e59d300c 	ldr	r3, [sp, #12]
30006b94:	e58d3010 	str	r3, [sp, #16]
	while(ctp<mem_ctrl.top_p){
30006b98:	ea00003f 	b	30006c9c <r_malloc+0x150>
             b_size=BLOCK_SIZE(*tp);
30006b9c:	e59d300c 	ldr	r3, [sp, #12]
30006ba0:	e5933000 	ldr	r3, [r3]
30006ba4:	e1a03423 	lsr	r3, r3, #8
30006ba8:	e58d3014 	str	r3, [sp, #20]
	     if(b_size==0){
30006bac:	e59d3014 	ldr	r3, [sp, #20]
30006bb0:	e3530000 	cmp	r3, #0
30006bb4:	1a000006 	bne	30006bd4 <r_malloc+0x88>
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
30006bb8:	e59f023c 	ldr	r0, [pc, #572]	; 30006dfc <r_malloc+0x2b0>
30006bbc:	e59d100c 	ldr	r1, [sp, #12]
30006bc0:	eb001217 	bl	3000b424 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
30006bc4:	e59f022c 	ldr	r0, [pc, #556]	; 30006df8 <r_malloc+0x2ac>
30006bc8:	ebfffa1e 	bl	30005448 <acoral_mutex_post>
			return NULL;
30006bcc:	e3a03000 	mov	r3, #0
30006bd0:	ea000084 	b	30006de8 <r_malloc+0x29c>
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
30006bd4:	e59d300c 	ldr	r3, [sp, #12]
30006bd8:	e5933000 	ldr	r3, [r3]
30006bdc:	e2033001 	and	r3, r3, #1
30006be0:	e20330ff 	and	r3, r3, #255	; 0xff
30006be4:	e3530000 	cmp	r3, #0
30006be8:	1a000003 	bne	30006bfc <r_malloc+0xb0>
30006bec:	e59d2004 	ldr	r2, [sp, #4]
30006bf0:	e59d3014 	ldr	r3, [sp, #20]
30006bf4:	e1520003 	cmp	r2, r3
30006bf8:	9a000006 	bls	30006c18 <r_malloc+0xcc>
        	ctp=ctp+b_size;
30006bfc:	e59d2010 	ldr	r2, [sp, #16]
30006c00:	e59d3014 	ldr	r3, [sp, #20]
30006c04:	e0823003 	add	r3, r2, r3
30006c08:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
30006c0c:	e59d3010 	ldr	r3, [sp, #16]
30006c10:	e58d300c 	str	r3, [sp, #12]
	     if(b_size==0){
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
			acoral_mutex_post(&mem_ctrl.mutex);
			return NULL;
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
30006c14:	ea000020 	b	30006c9c <r_malloc+0x150>
        	ctp=ctp+b_size;
		tp=(acoral_u32 *)ctp;
	     }
	     else
	     {
		BLOCK_SET_USED(tp,size);
30006c18:	e59d3004 	ldr	r3, [sp, #4]
30006c1c:	e1a03403 	lsl	r3, r3, #8
30006c20:	e38330cd 	orr	r3, r3, #205	; 0xcd
30006c24:	e1a02003 	mov	r2, r3
30006c28:	e59d300c 	ldr	r3, [sp, #12]
30006c2c:	e5832000 	str	r2, [r3]
		ctp=ctp+size;
30006c30:	e59d3004 	ldr	r3, [sp, #4]
30006c34:	e59d2010 	ldr	r2, [sp, #16]
30006c38:	e0823003 	add	r3, r2, r3
30006c3c:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
30006c40:	e59d3010 	ldr	r3, [sp, #16]
30006c44:	e58d300c 	str	r3, [sp, #12]
		if(b_size-size>0)
30006c48:	e59d2004 	ldr	r2, [sp, #4]
30006c4c:	e59d3014 	ldr	r3, [sp, #20]
30006c50:	e1520003 	cmp	r2, r3
30006c54:	0a000006 	beq	30006c74 <r_malloc+0x128>
			BLOCK_SET_FREE(tp,b_size-size);
30006c58:	e59d3004 	ldr	r3, [sp, #4]
30006c5c:	e59d2014 	ldr	r2, [sp, #20]
30006c60:	e0633002 	rsb	r3, r3, r2
30006c64:	e1a03403 	lsl	r3, r3, #8
30006c68:	e38320cc 	orr	r2, r3, #204	; 0xcc
30006c6c:	e59d300c 	ldr	r3, [sp, #12]
30006c70:	e5832000 	str	r2, [r3]
		mem_ctrl.freep_p=tp;
30006c74:	e59f317c 	ldr	r3, [pc, #380]	; 30006df8 <r_malloc+0x2ac>
30006c78:	e59d200c 	ldr	r2, [sp, #12]
30006c7c:	e583202c 	str	r2, [r3, #44]	; 0x2c
#ifdef CFG_TEST_MEM2
		acoral_print("After malloc\n");
		v_mem_scan();
		acoral_print("...................\n");
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
30006c80:	e59f0170 	ldr	r0, [pc, #368]	; 30006df8 <r_malloc+0x2ac>
30006c84:	ebfff9ef 	bl	30005448 <acoral_mutex_post>
	        return (void *)(ctp-size+4);	
30006c88:	e59d3004 	ldr	r3, [sp, #4]
30006c8c:	e2632004 	rsb	r2, r3, #4
30006c90:	e59d3010 	ldr	r3, [sp, #16]
30006c94:	e0823003 	add	r3, r2, r3
30006c98:	ea000052 	b	30006de8 <r_malloc+0x29c>
	mem_ctrl.alloc_num++;
	acoral_print("In malloc:%d\n",size);
#endif
	tp=mem_ctrl.freep_p;
	ctp=(acoral_8 *)tp;
	while(ctp<mem_ctrl.top_p){
30006c9c:	e59f3154 	ldr	r3, [pc, #340]	; 30006df8 <r_malloc+0x2ac>
30006ca0:	e5932024 	ldr	r2, [r3, #36]	; 0x24
30006ca4:	e59d3010 	ldr	r3, [sp, #16]
30006ca8:	e1520003 	cmp	r2, r3
30006cac:	8affffba 	bhi	30006b9c <r_malloc+0x50>
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
	        return (void *)(ctp-size+4);	
	     }
	}
    	ctp=mem_ctrl.down_p;
30006cb0:	e59f3140 	ldr	r3, [pc, #320]	; 30006df8 <r_malloc+0x2ac>
30006cb4:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30006cb8:	e58d3010 	str	r3, [sp, #16]
	tp=(acoral_u32 *)ctp;
30006cbc:	e59d3010 	ldr	r3, [sp, #16]
30006cc0:	e58d300c 	str	r3, [sp, #12]
	while(tp<mem_ctrl.freep_p){
30006cc4:	ea00003f 	b	30006dc8 <r_malloc+0x27c>
	     b_size=BLOCK_SIZE(*tp);
30006cc8:	e59d300c 	ldr	r3, [sp, #12]
30006ccc:	e5933000 	ldr	r3, [r3]
30006cd0:	e1a03423 	lsr	r3, r3, #8
30006cd4:	e58d3014 	str	r3, [sp, #20]
	     if(b_size==0){
30006cd8:	e59d3014 	ldr	r3, [sp, #20]
30006cdc:	e3530000 	cmp	r3, #0
30006ce0:	1a000006 	bne	30006d00 <r_malloc+0x1b4>
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
30006ce4:	e59f0110 	ldr	r0, [pc, #272]	; 30006dfc <r_malloc+0x2b0>
30006ce8:	e59d100c 	ldr	r1, [sp, #12]
30006cec:	eb0011cc 	bl	3000b424 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
30006cf0:	e59f0100 	ldr	r0, [pc, #256]	; 30006df8 <r_malloc+0x2ac>
30006cf4:	ebfff9d3 	bl	30005448 <acoral_mutex_post>
			return NULL;
30006cf8:	e3a03000 	mov	r3, #0
30006cfc:	ea000039 	b	30006de8 <r_malloc+0x29c>
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
30006d00:	e59d300c 	ldr	r3, [sp, #12]
30006d04:	e5933000 	ldr	r3, [r3]
30006d08:	e2033001 	and	r3, r3, #1
30006d0c:	e20330ff 	and	r3, r3, #255	; 0xff
30006d10:	e3530000 	cmp	r3, #0
30006d14:	1a000003 	bne	30006d28 <r_malloc+0x1dc>
30006d18:	e59d2004 	ldr	r2, [sp, #4]
30006d1c:	e59d3014 	ldr	r3, [sp, #20]
30006d20:	e1520003 	cmp	r2, r3
30006d24:	9a000006 	bls	30006d44 <r_malloc+0x1f8>
        	ctp=ctp+b_size;
30006d28:	e59d2010 	ldr	r2, [sp, #16]
30006d2c:	e59d3014 	ldr	r3, [sp, #20]
30006d30:	e0823003 	add	r3, r2, r3
30006d34:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
30006d38:	e59d3010 	ldr	r3, [sp, #16]
30006d3c:	e58d300c 	str	r3, [sp, #12]
	     if(b_size==0){
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
			acoral_mutex_post(&mem_ctrl.mutex);
			return NULL;
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
30006d40:	ea000020 	b	30006dc8 <r_malloc+0x27c>
        	ctp=ctp+b_size;
		tp=(acoral_u32 *)ctp;
	     }
	     else
	     {
		BLOCK_SET_USED(tp,size);
30006d44:	e59d3004 	ldr	r3, [sp, #4]
30006d48:	e1a03403 	lsl	r3, r3, #8
30006d4c:	e38330cd 	orr	r3, r3, #205	; 0xcd
30006d50:	e1a02003 	mov	r2, r3
30006d54:	e59d300c 	ldr	r3, [sp, #12]
30006d58:	e5832000 	str	r2, [r3]
		ctp=ctp+size;
30006d5c:	e59d3004 	ldr	r3, [sp, #4]
30006d60:	e59d2010 	ldr	r2, [sp, #16]
30006d64:	e0823003 	add	r3, r2, r3
30006d68:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
30006d6c:	e59d3010 	ldr	r3, [sp, #16]
30006d70:	e58d300c 	str	r3, [sp, #12]
		if(b_size-size>0)
30006d74:	e59d2004 	ldr	r2, [sp, #4]
30006d78:	e59d3014 	ldr	r3, [sp, #20]
30006d7c:	e1520003 	cmp	r2, r3
30006d80:	0a000006 	beq	30006da0 <r_malloc+0x254>
			BLOCK_SET_FREE(tp,b_size-size);
30006d84:	e59d3004 	ldr	r3, [sp, #4]
30006d88:	e59d2014 	ldr	r2, [sp, #20]
30006d8c:	e0633002 	rsb	r3, r3, r2
30006d90:	e1a03403 	lsl	r3, r3, #8
30006d94:	e38320cc 	orr	r2, r3, #204	; 0xcc
30006d98:	e59d300c 	ldr	r3, [sp, #12]
30006d9c:	e5832000 	str	r2, [r3]
		mem_ctrl.freep_p=tp;
30006da0:	e59f3050 	ldr	r3, [pc, #80]	; 30006df8 <r_malloc+0x2ac>
30006da4:	e59d200c 	ldr	r2, [sp, #12]
30006da8:	e583202c 	str	r2, [r3, #44]	; 0x2c
#ifdef CFG_TEST_MEM2
		acoral_print("After malloc\n");
		v_mem_scan();
		acoral_print("...................\n");
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
30006dac:	e59f0044 	ldr	r0, [pc, #68]	; 30006df8 <r_malloc+0x2ac>
30006db0:	ebfff9a4 	bl	30005448 <acoral_mutex_post>
	        return (void *)(ctp-size+4);	
30006db4:	e59d3004 	ldr	r3, [sp, #4]
30006db8:	e2632004 	rsb	r2, r3, #4
30006dbc:	e59d3010 	ldr	r3, [sp, #16]
30006dc0:	e0823003 	add	r3, r2, r3
30006dc4:	ea000007 	b	30006de8 <r_malloc+0x29c>
	        return (void *)(ctp-size+4);	
	     }
	}
    	ctp=mem_ctrl.down_p;
	tp=(acoral_u32 *)ctp;
	while(tp<mem_ctrl.freep_p){
30006dc8:	e59f3028 	ldr	r3, [pc, #40]	; 30006df8 <r_malloc+0x2ac>
30006dcc:	e593202c 	ldr	r2, [r3, #44]	; 0x2c
30006dd0:	e59d300c 	ldr	r3, [sp, #12]
30006dd4:	e1520003 	cmp	r2, r3
30006dd8:	8affffba 	bhi	30006cc8 <r_malloc+0x17c>
	acoral_print("...................\n");
#endif
#ifdef CFG_TEST
	mem_ctrl.alloc_size-=size;
#endif
	acoral_mutex_post(&mem_ctrl.mutex);
30006ddc:	e59f0014 	ldr	r0, [pc, #20]	; 30006df8 <r_malloc+0x2ac>
30006de0:	ebfff998 	bl	30005448 <acoral_mutex_post>
	return NULL;
30006de4:	e3a03000 	mov	r3, #0
}
30006de8:	e1a00003 	mov	r0, r3
30006dec:	e28dd01c 	add	sp, sp, #28
30006df0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006df4:	e12fff1e 	bx	lr
30006df8:	3000fbb8 	.word	0x3000fbb8
30006dfc:	3000e690 	.word	0x3000e690

30006e00 <v_malloc>:

void * v_malloc(acoral_32 size){
30006e00:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006e04:	e24dd00c 	sub	sp, sp, #12
30006e08:	e58d0004 	str	r0, [sp, #4]
	if(mem_ctrl.mem_state==0)
30006e0c:	e59f303c 	ldr	r3, [pc, #60]	; 30006e50 <v_malloc+0x50>
30006e10:	e5d33030 	ldrb	r3, [r3, #48]	; 0x30
30006e14:	e3530000 	cmp	r3, #0
30006e18:	1a000001 	bne	30006e24 <v_malloc+0x24>
		return NULL;
30006e1c:	e3a03000 	mov	r3, #0
30006e20:	ea000006 	b	30006e40 <v_malloc+0x40>
	size=(size+3)&~3;
30006e24:	e59d3004 	ldr	r3, [sp, #4]
30006e28:	e2833003 	add	r3, r3, #3
30006e2c:	e3c33003 	bic	r3, r3, #3
30006e30:	e58d3004 	str	r3, [sp, #4]
    return r_malloc(size);
30006e34:	e59d0004 	ldr	r0, [sp, #4]
30006e38:	ebffff43 	bl	30006b4c <r_malloc>
30006e3c:	e1a03000 	mov	r3, r0
}
30006e40:	e1a00003 	mov	r0, r3
30006e44:	e28dd00c 	add	sp, sp, #12
30006e48:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006e4c:	e12fff1e 	bx	lr
30006e50:	3000fbb8 	.word	0x3000fbb8

30006e54 <v_free>:

void v_free(void * p){
30006e54:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006e58:	e24dd024 	sub	sp, sp, #36	; 0x24
30006e5c:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 * tp,*prev_tp;
	acoral_8 * ctp;
	acoral_u32 b_size,size;
	if(mem_ctrl.mem_state==0)
30006e60:	e59f327c 	ldr	r3, [pc, #636]	; 300070e4 <v_free+0x290>
30006e64:	e5d33030 	ldrb	r3, [r3, #48]	; 0x30
30006e68:	e3530000 	cmp	r3, #0
30006e6c:	0a000098 	beq	300070d4 <v_free+0x280>
		return;
	p=(acoral_8 *)p-4;
30006e70:	e59d3004 	ldr	r3, [sp, #4]
30006e74:	e2433004 	sub	r3, r3, #4
30006e78:	e58d3004 	str	r3, [sp, #4]
	tp=(acoral_u32 *)p;
30006e7c:	e59d3004 	ldr	r3, [sp, #4]
30006e80:	e58d300c 	str	r3, [sp, #12]
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=0) //周期性任务
30006e84:	ea000000 	b	30006e8c <v_free+0x38>
		acoral_suspend_self();
30006e88:	ebffee4f 	bl	300027cc <acoral_suspend_self>
	acoral_u32 b_size,size;
	if(mem_ctrl.mem_state==0)
		return;
	p=(acoral_8 *)p-4;
	tp=(acoral_u32 *)p;
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=0) //周期性任务
30006e8c:	e59f0250 	ldr	r0, [pc, #592]	; 300070e4 <v_free+0x290>
30006e90:	e3a01000 	mov	r1, #0
30006e94:	ebfff859 	bl	30005000 <acoral_mutex_pend>
30006e98:	e1a03000 	mov	r3, r0
30006e9c:	e3530000 	cmp	r3, #0
30006ea0:	1afffff8 	bne	30006e88 <v_free+0x34>
		acoral_suspend_self();
	if(p==NULL||(acoral_8 *)p<mem_ctrl.down_p||(acoral_8 *)p>=mem_ctrl.top_p||!BLOCK_CHECK(*tp)){
30006ea4:	e59d3004 	ldr	r3, [sp, #4]
30006ea8:	e3530000 	cmp	r3, #0
30006eac:	0a00000e 	beq	30006eec <v_free+0x98>
30006eb0:	e59f322c 	ldr	r3, [pc, #556]	; 300070e4 <v_free+0x290>
30006eb4:	e5932028 	ldr	r2, [r3, #40]	; 0x28
30006eb8:	e59d3004 	ldr	r3, [sp, #4]
30006ebc:	e1520003 	cmp	r2, r3
30006ec0:	8a000009 	bhi	30006eec <v_free+0x98>
30006ec4:	e59f3218 	ldr	r3, [pc, #536]	; 300070e4 <v_free+0x290>
30006ec8:	e5932024 	ldr	r2, [r3, #36]	; 0x24
30006ecc:	e59d3004 	ldr	r3, [sp, #4]
30006ed0:	e1520003 	cmp	r2, r3
30006ed4:	9a000004 	bls	30006eec <v_free+0x98>
30006ed8:	e59d300c 	ldr	r3, [sp, #12]
30006edc:	e5933000 	ldr	r3, [r3]
30006ee0:	e20330fe 	and	r3, r3, #254	; 0xfe
30006ee4:	e35300cc 	cmp	r3, #204	; 0xcc
30006ee8:	0a000003 	beq	30006efc <v_free+0xa8>
		acoral_printerr("Invalide Free address:0x%x\n",tp);
30006eec:	e59f01f4 	ldr	r0, [pc, #500]	; 300070e8 <v_free+0x294>
30006ef0:	e59d100c 	ldr	r1, [sp, #12]
30006ef4:	eb00114a 	bl	3000b424 <acoral_print>
		return;
30006ef8:	ea000076 	b	300070d8 <v_free+0x284>
	}
	if(BLOCK_FREE(*tp)){
30006efc:	e59d300c 	ldr	r3, [sp, #12]
30006f00:	e5933000 	ldr	r3, [r3]
30006f04:	e2033001 	and	r3, r3, #1
30006f08:	e3530000 	cmp	r3, #0
30006f0c:	1a000003 	bne	30006f20 <v_free+0xcc>
		acoral_printerr("Address:0x%x have been freed\n",tp);
30006f10:	e59f01d4 	ldr	r0, [pc, #468]	; 300070ec <v_free+0x298>
30006f14:	e59d100c 	ldr	r1, [sp, #12]
30006f18:	eb001141 	bl	3000b424 <acoral_print>
		return;
30006f1c:	ea00006d 	b	300070d8 <v_free+0x284>
	}
	prev_tp=tp;
30006f20:	e59d300c 	ldr	r3, [sp, #12]
30006f24:	e58d3010 	str	r3, [sp, #16]
	ctp=(acoral_8 *)tp;
30006f28:	e59d300c 	ldr	r3, [sp, #12]
30006f2c:	e58d3014 	str	r3, [sp, #20]
    b_size=BLOCK_SIZE(*tp);
30006f30:	e59d300c 	ldr	r3, [sp, #12]
30006f34:	e5933000 	ldr	r3, [r3]
30006f38:	e1a03423 	lsr	r3, r3, #8
30006f3c:	e58d3018 	str	r3, [sp, #24]
#ifdef CFG_TEST_MEM2
	acoral_print("...................\n");
	acoral_print("Before free\n");
	v_mem_scan();
#endif
   	ctp=ctp+b_size;
30006f40:	e59d2014 	ldr	r2, [sp, #20]
30006f44:	e59d3018 	ldr	r3, [sp, #24]
30006f48:	e0823003 	add	r3, r2, r3
30006f4c:	e58d3014 	str	r3, [sp, #20]
	tp=(acoral_u32 *)ctp;
30006f50:	e59d3014 	ldr	r3, [sp, #20]
30006f54:	e58d300c 	str	r3, [sp, #12]
	if(BLOCK_FREE(*tp)){
30006f58:	e59d300c 	ldr	r3, [sp, #12]
30006f5c:	e5933000 	ldr	r3, [r3]
30006f60:	e2033001 	and	r3, r3, #1
30006f64:	e3530000 	cmp	r3, #0
30006f68:	1a000013 	bne	30006fbc <v_free+0x168>
		size=BLOCK_SIZE(*tp);
30006f6c:	e59d300c 	ldr	r3, [sp, #12]
30006f70:	e5933000 	ldr	r3, [r3]
30006f74:	e1a03423 	lsr	r3, r3, #8
30006f78:	e58d301c 	str	r3, [sp, #28]
		if(size==0){
30006f7c:	e59d301c 	ldr	r3, [sp, #28]
30006f80:	e3530000 	cmp	r3, #0
30006f84:	1a000005 	bne	30006fa0 <v_free+0x14c>
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
30006f88:	e59f0160 	ldr	r0, [pc, #352]	; 300070f0 <v_free+0x29c>
30006f8c:	e59d100c 	ldr	r1, [sp, #12]
30006f90:	eb001123 	bl	3000b424 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
30006f94:	e59f0148 	ldr	r0, [pc, #328]	; 300070e4 <v_free+0x290>
30006f98:	ebfff92a 	bl	30005448 <acoral_mutex_post>
			return;
30006f9c:	ea00004d 	b	300070d8 <v_free+0x284>
		}
		b_size+=size;
30006fa0:	e59d2018 	ldr	r2, [sp, #24]
30006fa4:	e59d301c 	ldr	r3, [sp, #28]
30006fa8:	e0823003 	add	r3, r2, r3
30006fac:	e58d3018 	str	r3, [sp, #24]
		BLOCK_CLEAR(tp);
30006fb0:	e59d300c 	ldr	r3, [sp, #12]
30006fb4:	e3a02000 	mov	r2, #0
30006fb8:	e5832000 	str	r2, [r3]
	}
	BLOCK_SET_FREE(prev_tp,b_size);
30006fbc:	e59d3018 	ldr	r3, [sp, #24]
30006fc0:	e1a03403 	lsl	r3, r3, #8
30006fc4:	e38320cc 	orr	r2, r3, #204	; 0xcc
30006fc8:	e59d3010 	ldr	r3, [sp, #16]
30006fcc:	e5832000 	str	r2, [r3]
	mem_ctrl.freep_p=prev_tp;
30006fd0:	e59f310c 	ldr	r3, [pc, #268]	; 300070e4 <v_free+0x290>
30006fd4:	e59d2010 	ldr	r2, [sp, #16]
30006fd8:	e583202c 	str	r2, [r3, #44]	; 0x2c
	if(p==mem_ctrl.down_p){
30006fdc:	e59f3100 	ldr	r3, [pc, #256]	; 300070e4 <v_free+0x290>
30006fe0:	e5932028 	ldr	r2, [r3, #40]	; 0x28
30006fe4:	e59d3004 	ldr	r3, [sp, #4]
30006fe8:	e1520003 	cmp	r2, r3
30006fec:	1a000002 	bne	30006ffc <v_free+0x1a8>
#ifdef CFG_TEST_MEM2
		acoral_print("After free\n");
		v_mem_scan();
		acoral_print("...................\n");
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
30006ff0:	e59f00ec 	ldr	r0, [pc, #236]	; 300070e4 <v_free+0x290>
30006ff4:	ebfff913 	bl	30005448 <acoral_mutex_post>
		return;
30006ff8:	ea000036 	b	300070d8 <v_free+0x284>
	}
	ctp=mem_ctrl.down_p;
30006ffc:	e59f30e0 	ldr	r3, [pc, #224]	; 300070e4 <v_free+0x290>
30007000:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30007004:	e58d3014 	str	r3, [sp, #20]
	tp=(acoral_u32 *)ctp;
30007008:	e59d3014 	ldr	r3, [sp, #20]
3000700c:	e58d300c 	str	r3, [sp, #12]
	while(ctp<(acoral_8 *)p){
30007010:	ea000014 	b	30007068 <v_free+0x214>
	     size=BLOCK_SIZE(*tp);
30007014:	e59d300c 	ldr	r3, [sp, #12]
30007018:	e5933000 	ldr	r3, [r3]
3000701c:	e1a03423 	lsr	r3, r3, #8
30007020:	e58d301c 	str	r3, [sp, #28]
	     if(size==0){
30007024:	e59d301c 	ldr	r3, [sp, #28]
30007028:	e3530000 	cmp	r3, #0
3000702c:	1a000005 	bne	30007048 <v_free+0x1f4>
			acoral_printerr("err address is 0x%x,size should not be 0",tp);
30007030:	e59f00bc 	ldr	r0, [pc, #188]	; 300070f4 <v_free+0x2a0>
30007034:	e59d100c 	ldr	r1, [sp, #12]
30007038:	eb0010f9 	bl	3000b424 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
3000703c:	e59f00a0 	ldr	r0, [pc, #160]	; 300070e4 <v_free+0x290>
30007040:	ebfff900 	bl	30005448 <acoral_mutex_post>
			return;
30007044:	ea000023 	b	300070d8 <v_free+0x284>
             }
	     ctp=ctp+size;
30007048:	e59d2014 	ldr	r2, [sp, #20]
3000704c:	e59d301c 	ldr	r3, [sp, #28]
30007050:	e0823003 	add	r3, r2, r3
30007054:	e58d3014 	str	r3, [sp, #20]
	     prev_tp=tp;
30007058:	e59d300c 	ldr	r3, [sp, #12]
3000705c:	e58d3010 	str	r3, [sp, #16]
	     tp=(acoral_u32 *)ctp;
30007060:	e59d3014 	ldr	r3, [sp, #20]
30007064:	e58d300c 	str	r3, [sp, #12]
		acoral_mutex_post(&mem_ctrl.mutex);
		return;
	}
	ctp=mem_ctrl.down_p;
	tp=(acoral_u32 *)ctp;
	while(ctp<(acoral_8 *)p){
30007068:	e59d3004 	ldr	r3, [sp, #4]
3000706c:	e59d2014 	ldr	r2, [sp, #20]
30007070:	e1520003 	cmp	r2, r3
30007074:	3affffe6 	bcc	30007014 <v_free+0x1c0>
             }
	     ctp=ctp+size;
	     prev_tp=tp;
	     tp=(acoral_u32 *)ctp;
	}
	if(BLOCK_FREE(*prev_tp)){
30007078:	e59d3010 	ldr	r3, [sp, #16]
3000707c:	e5933000 	ldr	r3, [r3]
30007080:	e2033001 	and	r3, r3, #1
30007084:	e3530000 	cmp	r3, #0
30007088:	1a00000e 	bne	300070c8 <v_free+0x274>
		tp=(acoral_u32*)p;
3000708c:	e59d3004 	ldr	r3, [sp, #4]
30007090:	e58d300c 	str	r3, [sp, #12]
		BLOCK_CLEAR(tp);
30007094:	e59d300c 	ldr	r3, [sp, #12]
30007098:	e3a02000 	mov	r2, #0
3000709c:	e5832000 	str	r2, [r3]
		BLOCK_SET_FREE(prev_tp,b_size+size);
300070a0:	e59d2018 	ldr	r2, [sp, #24]
300070a4:	e59d301c 	ldr	r3, [sp, #28]
300070a8:	e0823003 	add	r3, r2, r3
300070ac:	e1a03403 	lsl	r3, r3, #8
300070b0:	e38320cc 	orr	r2, r3, #204	; 0xcc
300070b4:	e59d3010 	ldr	r3, [sp, #16]
300070b8:	e5832000 	str	r2, [r3]
		mem_ctrl.freep_p=prev_tp;
300070bc:	e59f3020 	ldr	r3, [pc, #32]	; 300070e4 <v_free+0x290>
300070c0:	e59d2010 	ldr	r2, [sp, #16]
300070c4:	e583202c 	str	r2, [r3, #44]	; 0x2c
#ifdef CFG_TEST_MEM2
	acoral_print("After free\n");
	v_mem_scan();
	acoral_print("...................\n");
#endif
	acoral_mutex_post(&mem_ctrl.mutex);
300070c8:	e59f0014 	ldr	r0, [pc, #20]	; 300070e4 <v_free+0x290>
300070cc:	ebfff8dd 	bl	30005448 <acoral_mutex_post>
300070d0:	ea000000 	b	300070d8 <v_free+0x284>
void v_free(void * p){
	acoral_u32 * tp,*prev_tp;
	acoral_8 * ctp;
	acoral_u32 b_size,size;
	if(mem_ctrl.mem_state==0)
		return;
300070d4:	e1a00000 	nop			; (mov r0, r0)
	acoral_print("After free\n");
	v_mem_scan();
	acoral_print("...................\n");
#endif
	acoral_mutex_post(&mem_ctrl.mutex);
}
300070d8:	e28dd024 	add	sp, sp, #36	; 0x24
300070dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300070e0:	e12fff1e 	bx	lr
300070e4:	3000fbb8 	.word	0x3000fbb8
300070e8:	3000e6bc 	.word	0x3000e6bc
300070ec:	3000e6d8 	.word	0x3000e6d8
300070f0:	3000e690 	.word	0x3000e690
300070f4:	3000e6f8 	.word	0x3000e6f8

300070f8 <v_mem_init>:

void v_mem_init(){
300070f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300070fc:	e24dd00c 	sub	sp, sp, #12
	acoral_size size;
	size=acoral_malloc_size(MEM_SIZE);
30007100:	e3a00afa 	mov	r0, #1024000	; 0xfa000
30007104:	ebfffd01 	bl	30006510 <buddy_malloc_size>
30007108:	e1a03000 	mov	r3, r0
3000710c:	e58d3004 	str	r3, [sp, #4]
	mem_ctrl.down_p=(acoral_8 *)acoral_malloc(size);
30007110:	e59d0004 	ldr	r0, [sp, #4]
30007114:	ebfffd26 	bl	300065b4 <buddy_malloc>
30007118:	e1a03000 	mov	r3, r0
3000711c:	e1a02003 	mov	r2, r3
30007120:	e59f3088 	ldr	r3, [pc, #136]	; 300071b0 <v_mem_init+0xb8>
30007124:	e5832028 	str	r2, [r3, #40]	; 0x28
	if(mem_ctrl.down_p==NULL){
30007128:	e59f3080 	ldr	r3, [pc, #128]	; 300071b0 <v_mem_init+0xb8>
3000712c:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30007130:	e3530000 	cmp	r3, #0
30007134:	1a000003 	bne	30007148 <v_mem_init+0x50>
		mem_ctrl.mem_state=0;
30007138:	e59f3070 	ldr	r3, [pc, #112]	; 300071b0 <v_mem_init+0xb8>
3000713c:	e3a02000 	mov	r2, #0
30007140:	e5c32030 	strb	r2, [r3, #48]	; 0x30
		return;
30007144:	ea000016 	b	300071a4 <v_mem_init+0xac>
	}
	else{
		mem_ctrl.mem_state=1;
30007148:	e59f3060 	ldr	r3, [pc, #96]	; 300071b0 <v_mem_init+0xb8>
3000714c:	e3a02001 	mov	r2, #1
30007150:	e5c32030 	strb	r2, [r3, #48]	; 0x30
	}
	acoral_mutex_init(&mem_ctrl.mutex,0);
30007154:	e59f0054 	ldr	r0, [pc, #84]	; 300071b0 <v_mem_init+0xb8>
30007158:	e3a01000 	mov	r1, #0
3000715c:	ebfff710 	bl	30004da4 <acoral_mutex_init>
	mem_ctrl.top_p=mem_ctrl.down_p+size;
30007160:	e59f3048 	ldr	r3, [pc, #72]	; 300071b0 <v_mem_init+0xb8>
30007164:	e5932028 	ldr	r2, [r3, #40]	; 0x28
30007168:	e59d3004 	ldr	r3, [sp, #4]
3000716c:	e0822003 	add	r2, r2, r3
30007170:	e59f3038 	ldr	r3, [pc, #56]	; 300071b0 <v_mem_init+0xb8>
30007174:	e5832024 	str	r2, [r3, #36]	; 0x24
	mem_ctrl.freep_p=(acoral_u32 *)mem_ctrl.down_p;
30007178:	e59f3030 	ldr	r3, [pc, #48]	; 300071b0 <v_mem_init+0xb8>
3000717c:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30007180:	e1a02003 	mov	r2, r3
30007184:	e59f3024 	ldr	r3, [pc, #36]	; 300071b0 <v_mem_init+0xb8>
30007188:	e583202c 	str	r2, [r3, #44]	; 0x2c
	BLOCK_SET_FREE(mem_ctrl.freep_p,size);
3000718c:	e59f301c 	ldr	r3, [pc, #28]	; 300071b0 <v_mem_init+0xb8>
30007190:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
30007194:	e59d2004 	ldr	r2, [sp, #4]
30007198:	e1a02402 	lsl	r2, r2, #8
3000719c:	e38220cc 	orr	r2, r2, #204	; 0xcc
300071a0:	e5832000 	str	r2, [r3]
#ifdef CFG_TEST
	mem_ctrl.alloc_size=0;
	mem_ctrl.alloc_num=0;
	mem_ctrl.free_num=0;
#endif
}
300071a4:	e28dd00c 	add	sp, sp, #12
300071a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300071ac:	e12fff1e 	bx	lr
300071b0:	3000fbb8 	.word	0x3000fbb8

300071b4 <v_mem_scan>:

void v_mem_scan(void){
300071b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300071b8:	e24dd014 	sub	sp, sp, #20
        acoral_8 * ctp;
	acoral_u32 * tp;
	acoral_u32 size;
	if(mem_ctrl.mem_state==0){
300071bc:	e59f30c0 	ldr	r3, [pc, #192]	; 30007284 <v_mem_scan+0xd0>
300071c0:	e5d33030 	ldrb	r3, [r3, #48]	; 0x30
300071c4:	e3530000 	cmp	r3, #0
300071c8:	1a000002 	bne	300071d8 <v_mem_scan+0x24>
		acoral_print("Mem Init Err ,so no mem space to malloc\r\n");
300071cc:	e59f00b4 	ldr	r0, [pc, #180]	; 30007288 <v_mem_scan+0xd4>
300071d0:	eb001093 	bl	3000b424 <acoral_print>
		return;
300071d4:	ea000027 	b	30007278 <v_mem_scan+0xc4>
	}
	ctp=mem_ctrl.down_p;
300071d8:	e59f30a4 	ldr	r3, [pc, #164]	; 30007284 <v_mem_scan+0xd0>
300071dc:	e5933028 	ldr	r3, [r3, #40]	; 0x28
300071e0:	e58d3004 	str	r3, [sp, #4]
	do{
		tp=(acoral_u32 *)ctp;
300071e4:	e59d3004 	ldr	r3, [sp, #4]
300071e8:	e58d3008 	str	r3, [sp, #8]
		size=BLOCK_SIZE(*tp);
300071ec:	e59d3008 	ldr	r3, [sp, #8]
300071f0:	e5933000 	ldr	r3, [r3]
300071f4:	e1a03423 	lsr	r3, r3, #8
300071f8:	e58d300c 	str	r3, [sp, #12]
		if(size==0){
300071fc:	e59d300c 	ldr	r3, [sp, #12]
30007200:	e3530000 	cmp	r3, #0
30007204:	1a000003 	bne	30007218 <v_mem_scan+0x64>
			acoral_print("Err address is 0x%x,size should not be 0\r\n",tp);
30007208:	e59f007c 	ldr	r0, [pc, #124]	; 3000728c <v_mem_scan+0xd8>
3000720c:	e59d1008 	ldr	r1, [sp, #8]
30007210:	eb001083 	bl	3000b424 <acoral_print>
			break;
30007214:	ea000017 	b	30007278 <v_mem_scan+0xc4>
		}
		if(BLOCK_USED(*tp)){
30007218:	e59d3008 	ldr	r3, [sp, #8]
3000721c:	e5933000 	ldr	r3, [r3]
30007220:	e2033001 	and	r3, r3, #1
30007224:	e20330ff 	and	r3, r3, #255	; 0xff
30007228:	e3530000 	cmp	r3, #0
3000722c:	0a000004 	beq	30007244 <v_mem_scan+0x90>
			acoral_print("The address is 0x%x,the block is used and it's size is %d\r\n",tp,size);
30007230:	e59f0058 	ldr	r0, [pc, #88]	; 30007290 <v_mem_scan+0xdc>
30007234:	e59d1008 	ldr	r1, [sp, #8]
30007238:	e59d200c 	ldr	r2, [sp, #12]
3000723c:	eb001078 	bl	3000b424 <acoral_print>
30007240:	ea000003 	b	30007254 <v_mem_scan+0xa0>
		}
		else{
			
			acoral_print("The address is 0x%x,the block is unused and it's size is %d\r\n",tp,size);
30007244:	e59f0048 	ldr	r0, [pc, #72]	; 30007294 <v_mem_scan+0xe0>
30007248:	e59d1008 	ldr	r1, [sp, #8]
3000724c:	e59d200c 	ldr	r2, [sp, #12]
30007250:	eb001073 	bl	3000b424 <acoral_print>
		}
		ctp=ctp+size;
30007254:	e59d2004 	ldr	r2, [sp, #4]
30007258:	e59d300c 	ldr	r3, [sp, #12]
3000725c:	e0823003 	add	r3, r2, r3
30007260:	e58d3004 	str	r3, [sp, #4]
	}while(ctp<mem_ctrl.top_p);
30007264:	e59f3018 	ldr	r3, [pc, #24]	; 30007284 <v_mem_scan+0xd0>
30007268:	e5932024 	ldr	r2, [r3, #36]	; 0x24
3000726c:	e59d3004 	ldr	r3, [sp, #4]
30007270:	e1520003 	cmp	r2, r3
30007274:	8affffda 	bhi	300071e4 <v_mem_scan+0x30>
#ifdef CFG_TEST
	acoral_print("Alloc Size:%d  Free_num:%d  alloc_num:%d\r\n",mem_ctrl.alloc_size,mem_ctrl.free_num,mem_ctrl.alloc_num);
#endif
}
30007278:	e28dd014 	add	sp, sp, #20
3000727c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007280:	e12fff1e 	bx	lr
30007284:	3000fbb8 	.word	0x3000fbb8
30007288:	3000e724 	.word	0x3000e724
3000728c:	3000e750 	.word	0x3000e750
30007290:	3000e77c 	.word	0x3000e77c
30007294:	3000e7b8 	.word	0x3000e7b8

30007298 <acoral_mbox_create>:
/*====================================
 *     create a mailbox
 *       创建一个邮箱
 *====================================*/
acoral_evt_t *acoral_mbox_create()
{
30007298:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000729c:	e24dd00c 	sub	sp, sp, #12
  	acoral_evt_t * event;
	
	event=acoral_alloc_evt();
300072a0:	ebfff64b 	bl	30004bd4 <acoral_alloc_evt>
300072a4:	e1a03000 	mov	r3, r0
300072a8:	e58d3004 	str	r3, [sp, #4]
	if (NULL == event)
300072ac:	e59d3004 	ldr	r3, [sp, #4]
300072b0:	e3530000 	cmp	r3, #0
300072b4:	1a000001 	bne	300072c0 <acoral_mbox_create+0x28>
		return NULL;
300072b8:	e3a03000 	mov	r3, #0
300072bc:	ea00000b 	b	300072f0 <acoral_mbox_create+0x58>

	event->type  = ACORAL_EVENT_MBOX;
300072c0:	e59d3004 	ldr	r3, [sp, #4]
300072c4:	e3a02003 	mov	r2, #3
300072c8:	e5c32004 	strb	r2, [r3, #4]
	event->count = 0x00000000;
300072cc:	e59d3004 	ldr	r3, [sp, #4]
300072d0:	e3a02000 	mov	r2, #0
300072d4:	e583200c 	str	r2, [r3, #12]
	event->data  = NULL;
300072d8:	e59d3004 	ldr	r3, [sp, #4]
300072dc:	e3a02000 	mov	r2, #0
300072e0:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(event);
300072e4:	e59d0004 	ldr	r0, [sp, #4]
300072e8:	ebfff641 	bl	30004bf4 <acoral_evt_init>
	return event;
300072ec:	e59d3004 	ldr	r3, [sp, #4]
}
300072f0:	e1a00003 	mov	r0, r3
300072f4:	e28dd00c 	add	sp, sp, #12
300072f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300072fc:	e12fff1e 	bx	lr

30007300 <acoral_mbox_del>:
/*=====================================
 *   delete a mailbox
 *     删除一个邮箱
 *=====================================*/
acoral_u32 acoral_mbox_del(acoral_evt_t* event)
{
30007300:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007304:	e24dd00c 	sub	sp, sp, #12
30007308:	e58d0004 	str	r0, [sp, #4]
	if (acoral_intr_nesting > 0)
3000730c:	ebffe913 	bl	30001760 <hal_get_intr_nesting_comm>
30007310:	e1a03000 	mov	r3, r0
30007314:	e3530000 	cmp	r3, #0
30007318:	da000001 	ble	30007324 <acoral_mbox_del+0x24>
		return MBOX_ERR_INTR;
3000731c:	e3a03006 	mov	r3, #6
30007320:	ea00000e 	b	30007360 <acoral_mbox_del+0x60>
	
	if (NULL == event)
30007324:	e59d3004 	ldr	r3, [sp, #4]
30007328:	e3530000 	cmp	r3, #0
3000732c:	1a000001 	bne	30007338 <acoral_mbox_del+0x38>
		return MBOX_ERR_NULL;
30007330:	e3a03002 	mov	r3, #2
30007334:	ea000009 	b	30007360 <acoral_mbox_del+0x60>

	if(event->type != ACORAL_EVENT_MBOX)
30007338:	e59d3004 	ldr	r3, [sp, #4]
3000733c:	e5d33004 	ldrb	r3, [r3, #4]
30007340:	e3530003 	cmp	r3, #3
30007344:	0a000001 	beq	30007350 <acoral_mbox_del+0x50>
		return MBOX_ERR_TYPE;
30007348:	e3a03004 	mov	r3, #4
3000734c:	ea000003 	b	30007360 <acoral_mbox_del+0x60>

	acoral_release_thread((acoral_res_t *)event); 
30007350:	e59d3004 	ldr	r3, [sp, #4]
30007354:	e1a00003 	mov	r0, r3
30007358:	ebffecf1 	bl	30002724 <acoral_release_thread>
	return MBOX_SUCCED;
3000735c:	e3a03000 	mov	r3, #0
}
30007360:	e1a00003 	mov	r0, r3
30007364:	e28dd00c 	add	sp, sp, #12
30007368:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000736c:	e12fff1e 	bx	lr

30007370 <acoral_mbox_send>:
/*======================================
 *     send a mail to mailbox
 *       发送邮件至邮箱
 *======================================*/
acoral_u32 acoral_mbox_send(acoral_evt_t * event, void *msg)
{
30007370:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007374:	e24dd014 	sub	sp, sp, #20
30007378:	e58d0004 	str	r0, [sp, #4]
3000737c:	e58d1000 	str	r1, [sp]
	acoral_thread_t     *thread;

	/*if (acoral_intr_nesting > 0)
		return MBOX_ERR_INTR;
	*/
	if (NULL == event)
30007380:	e59d3004 	ldr	r3, [sp, #4]
30007384:	e3530000 	cmp	r3, #0
30007388:	1a000001 	bne	30007394 <acoral_mbox_send+0x24>
		return MBOX_ERR_NULL;
3000738c:	e3a03002 	mov	r3, #2
30007390:	ea000028 	b	30007438 <acoral_mbox_send+0xc8>

	if(event->type != ACORAL_EVENT_MBOX)
30007394:	e59d3004 	ldr	r3, [sp, #4]
30007398:	e5d33004 	ldrb	r3, [r3, #4]
3000739c:	e3530003 	cmp	r3, #3
300073a0:	0a000001 	beq	300073ac <acoral_mbox_send+0x3c>
		return MBOX_ERR_TYPE;
300073a4:	e3a03004 	mov	r3, #4
300073a8:	ea000022 	b	30007438 <acoral_mbox_send+0xc8>

	HAL_ENTER_CRITICAL();
300073ac:	ebffe8d0 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300073b0:	e1a03000 	mov	r3, r0
300073b4:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&event->spin_lock);
	if(event->data != NULL)
300073b8:	e59d3004 	ldr	r3, [sp, #4]
300073bc:	e5933020 	ldr	r3, [r3, #32]
300073c0:	e3530000 	cmp	r3, #0
300073c4:	0a000003 	beq	300073d8 <acoral_mbox_send+0x68>
	{
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
300073c8:	e59d0008 	ldr	r0, [sp, #8]
300073cc:	ebffe8c6 	bl	300016ec <HAL_INTR_RESTORE>
		return MBOX_ERR_MES_EXIST;
300073d0:	e3a03005 	mov	r3, #5
300073d4:	ea000017 	b	30007438 <acoral_mbox_send+0xc8>
	}
	event->data = msg;
300073d8:	e59d3004 	ldr	r3, [sp, #4]
300073dc:	e59d2000 	ldr	r2, [sp]
300073e0:	e5832020 	str	r2, [r3, #32]
	thread =acoral_evt_high_thread(event);
300073e4:	e59d0004 	ldr	r0, [sp, #4]
300073e8:	ebfff61b 	bl	30004c5c <acoral_evt_high_thread>
300073ec:	e1a03000 	mov	r3, r0
300073f0:	e58d300c 	str	r3, [sp, #12]
	/* 释放等待进程*/
	if (thread==NULL)
300073f4:	e59d300c 	ldr	r3, [sp, #12]
300073f8:	e3530000 	cmp	r3, #0
300073fc:	1a000003 	bne	30007410 <acoral_mbox_send+0xa0>
	{
		/* 没有等待队列*/
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
30007400:	e59d0008 	ldr	r0, [sp, #8]
30007404:	ebffe8b8 	bl	300016ec <HAL_INTR_RESTORE>
		return  MBOX_SUCCED;
30007408:	e3a03000 	mov	r3, #0
3000740c:	ea000009 	b	30007438 <acoral_mbox_send+0xc8>
	}
	/*释放等待任务*/
	timeout_queue_del(thread);
30007410:	e59d000c 	ldr	r0, [sp, #12]
30007414:	ebfff53b 	bl	30004908 <timeout_queue_del>
	acoral_evt_queue_del(thread);
30007418:	e59d000c 	ldr	r0, [sp, #12]
3000741c:	ebfff653 	bl	30004d70 <acoral_evt_queue_del>
	acoral_rdy_thread(thread);
30007420:	e59d000c 	ldr	r0, [sp, #12]
30007424:	ebffedd1 	bl	30002b70 <acoral_rdy_thread>
	acoral_spin_unlock(&event->spin_lock);
	HAL_EXIT_CRITICAL();
30007428:	e59d0008 	ldr	r0, [sp, #8]
3000742c:	ebffe8ae 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30007430:	ebffebf6 	bl	30002410 <acoral_sched>
	return MBOX_SUCCED;
30007434:	e3a03000 	mov	r3, #0
}
30007438:	e1a00003 	mov	r0, r3
3000743c:	e28dd014 	add	sp, sp, #20
30007440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007444:	e12fff1e 	bx	lr

30007448 <acoral_mbox_recv>:
/*======================================
 *    receive  a mail to mailbox
 *       接收邮件从邮箱
 *======================================*/
void* acoral_mbox_recv(acoral_evt_t * event, acoral_time timeout)
{
30007448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000744c:	e24dd01c 	sub	sp, sp, #28
30007450:	e58d0004 	str	r0, [sp, #4]
30007454:	e58d1000 	str	r1, [sp]
	void            *msg;
	acoral_sr         cpu_sr;
	acoral_thread_t  *cur;
	
	if (acoral_intr_nesting > 0)
30007458:	ebffe8c0 	bl	30001760 <hal_get_intr_nesting_comm>
3000745c:	e1a03000 	mov	r3, r0
30007460:	e3530000 	cmp	r3, #0
30007464:	da000001 	ble	30007470 <acoral_mbox_recv+0x28>
		return NULL;
30007468:	e3a03000 	mov	r3, #0
3000746c:	ea00004d 	b	300075a8 <acoral_mbox_recv+0x160>

	if(event->type!=ACORAL_EVENT_MBOX)
30007470:	e59d3004 	ldr	r3, [sp, #4]
30007474:	e5d33004 	ldrb	r3, [r3, #4]
30007478:	e3530003 	cmp	r3, #3
3000747c:	0a000001 	beq	30007488 <acoral_mbox_recv+0x40>
		return NULL;
30007480:	e3a03000 	mov	r3, #0
30007484:	ea000047 	b	300075a8 <acoral_mbox_recv+0x160>
	
	HAL_ENTER_CRITICAL();
30007488:	ebffe899 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000748c:	e1a03000 	mov	r3, r0
30007490:	e58d3010 	str	r3, [sp, #16]
	acoral_spin_lock(&event->spin_lock);
	if( event->data == NULL)
30007494:	e59d3004 	ldr	r3, [sp, #4]
30007498:	e5933020 	ldr	r3, [r3, #32]
3000749c:	e3530000 	cmp	r3, #0
300074a0:	1a000037 	bne	30007584 <acoral_mbox_recv+0x13c>
	{
		cur = acoral_cur_thread;
300074a4:	e59f310c 	ldr	r3, [pc, #268]	; 300075b8 <acoral_mbox_recv+0x170>
300074a8:	e5933000 	ldr	r3, [r3]
300074ac:	e58d3014 	str	r3, [sp, #20]
		if (timeout > 0)
300074b0:	e59d3000 	ldr	r3, [sp]
300074b4:	e3530000 	cmp	r3, #0
300074b8:	0a00000f 	beq	300074fc <acoral_mbox_recv+0xb4>
		{
			cur->delay = TIME_TO_TICKS(timeout);
300074bc:	e59d2000 	ldr	r2, [sp]
300074c0:	e1a03002 	mov	r3, r2
300074c4:	e1a03103 	lsl	r3, r3, #2
300074c8:	e0833002 	add	r3, r3, r2
300074cc:	e1a02103 	lsl	r2, r3, #2
300074d0:	e0833002 	add	r3, r3, r2
300074d4:	e1a03103 	lsl	r3, r3, #2
300074d8:	e1a02003 	mov	r2, r3
300074dc:	e59f30d8 	ldr	r3, [pc, #216]	; 300075bc <acoral_mbox_recv+0x174>
300074e0:	e0831392 	umull	r1, r3, r2, r3
300074e4:	e1a03323 	lsr	r3, r3, #6
300074e8:	e1a02003 	mov	r2, r3
300074ec:	e59d3014 	ldr	r3, [sp, #20]
300074f0:	e5832040 	str	r2, [r3, #64]	; 0x40
			timeout_queue_add(cur);
300074f4:	e59d0014 	ldr	r0, [sp, #20]
300074f8:	ebfff4c0 	bl	30004800 <timeout_queue_add>
		}
		acoral_unrdy_thread(cur);
300074fc:	e59d0014 	ldr	r0, [sp, #20]
30007500:	ebffeda9 	bl	30002bac <acoral_unrdy_thread>
		acoral_evt_queue_add(event, cur);
30007504:	e59d0004 	ldr	r0, [sp, #4]
30007508:	e59d1014 	ldr	r1, [sp, #20]
3000750c:	ebfff5e6 	bl	30004cac <acoral_evt_queue_add>
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
30007510:	e59d0010 	ldr	r0, [sp, #16]
30007514:	ebffe874 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_sched();
30007518:	ebffebbc 	bl	30002410 <acoral_sched>
		HAL_ENTER_CRITICAL();
3000751c:	ebffe874 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007520:	e1a03000 	mov	r3, r0
30007524:	e58d3010 	str	r3, [sp, #16]
		acoral_spin_lock(&event->spin_lock);

		if (timeout > 0 && cur->delay <= 0)
30007528:	e59d3000 	ldr	r3, [sp]
3000752c:	e3530000 	cmp	r3, #0
30007530:	0a000009 	beq	3000755c <acoral_mbox_recv+0x114>
30007534:	e59d3014 	ldr	r3, [sp, #20]
30007538:	e5933040 	ldr	r3, [r3, #64]	; 0x40
3000753c:	e3530000 	cmp	r3, #0
30007540:	ca000005 	bgt	3000755c <acoral_mbox_recv+0x114>
		{
			acoral_evt_queue_del(cur);
30007544:	e59d0014 	ldr	r0, [sp, #20]
30007548:	ebfff608 	bl	30004d70 <acoral_evt_queue_del>
			acoral_spin_unlock(&event->spin_lock);
			HAL_EXIT_CRITICAL();
3000754c:	e59d0010 	ldr	r0, [sp, #16]
30007550:	ebffe865 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL;
30007554:	e3a03000 	mov	r3, #0
30007558:	ea000012 	b	300075a8 <acoral_mbox_recv+0x160>
		}

		msg        = event->data;
3000755c:	e59d3004 	ldr	r3, [sp, #4]
30007560:	e5933020 	ldr	r3, [r3, #32]
30007564:	e58d300c 	str	r3, [sp, #12]
		event->data = NULL;
30007568:	e59d3004 	ldr	r3, [sp, #4]
3000756c:	e3a02000 	mov	r2, #0
30007570:	e5832020 	str	r2, [r3, #32]
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
30007574:	e59d0010 	ldr	r0, [sp, #16]
30007578:	ebffe85b 	bl	300016ec <HAL_INTR_RESTORE>
		return msg;
3000757c:	e59d300c 	ldr	r3, [sp, #12]
30007580:	ea000008 	b	300075a8 <acoral_mbox_recv+0x160>
	}
	
	msg         = event->data;
30007584:	e59d3004 	ldr	r3, [sp, #4]
30007588:	e5933020 	ldr	r3, [r3, #32]
3000758c:	e58d300c 	str	r3, [sp, #12]
	event->data = NULL;
30007590:	e59d3004 	ldr	r3, [sp, #4]
30007594:	e3a02000 	mov	r2, #0
30007598:	e5832020 	str	r2, [r3, #32]
	acoral_spin_unlock(&event->spin_lock);
	HAL_EXIT_CRITICAL();
3000759c:	e59d0010 	ldr	r0, [sp, #16]
300075a0:	ebffe851 	bl	300016ec <HAL_INTR_RESTORE>

	return msg;
300075a4:	e59d300c 	ldr	r3, [sp, #12]
}
300075a8:	e1a00003 	mov	r0, r3
300075ac:	e28dd01c 	add	sp, sp, #28
300075b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300075b4:	e12fff1e 	bx	lr
300075b8:	30010630 	.word	0x30010630
300075bc:	10624dd3 	.word	0x10624dd3

300075c0 <acoral_mbox_tryrecv>:
/*======================================
 *   try receive  a mail to mailbox
 *       接收邮件从邮箱
 *======================================*/
void* acoral_mbox_tryrecv(acoral_evt_t * event)
{
300075c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300075c4:	e24dd014 	sub	sp, sp, #20
300075c8:	e58d0004 	str	r0, [sp, #4]
	void            *msg;
	acoral_sr         cpu_sr;
	
	if (acoral_intr_nesting > 0)
300075cc:	ebffe863 	bl	30001760 <hal_get_intr_nesting_comm>
300075d0:	e1a03000 	mov	r3, r0
300075d4:	e3530000 	cmp	r3, #0
300075d8:	da000001 	ble	300075e4 <acoral_mbox_tryrecv+0x24>
		return NULL;
300075dc:	e3a03000 	mov	r3, #0
300075e0:	ea000019 	b	3000764c <acoral_mbox_tryrecv+0x8c>

	if(event->type!=ACORAL_EVENT_MBOX)
300075e4:	e59d3004 	ldr	r3, [sp, #4]
300075e8:	e5d33004 	ldrb	r3, [r3, #4]
300075ec:	e3530003 	cmp	r3, #3
300075f0:	0a000001 	beq	300075fc <acoral_mbox_tryrecv+0x3c>
		return NULL;
300075f4:	e3a03000 	mov	r3, #0
300075f8:	ea000013 	b	3000764c <acoral_mbox_tryrecv+0x8c>
	
	HAL_ENTER_CRITICAL();
300075fc:	ebffe83c 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007600:	e1a03000 	mov	r3, r0
30007604:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&event->spin_lock);
	if( event->data == NULL)
30007608:	e59d3004 	ldr	r3, [sp, #4]
3000760c:	e5933020 	ldr	r3, [r3, #32]
30007610:	e3530000 	cmp	r3, #0
30007614:	1a000003 	bne	30007628 <acoral_mbox_tryrecv+0x68>
	{
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
30007618:	e59d000c 	ldr	r0, [sp, #12]
3000761c:	ebffe832 	bl	300016ec <HAL_INTR_RESTORE>
		return NULL;
30007620:	e3a03000 	mov	r3, #0
30007624:	ea000008 	b	3000764c <acoral_mbox_tryrecv+0x8c>
	}
	
	msg         = event->data;
30007628:	e59d3004 	ldr	r3, [sp, #4]
3000762c:	e5933020 	ldr	r3, [r3, #32]
30007630:	e58d3008 	str	r3, [sp, #8]
	event->data = NULL;
30007634:	e59d3004 	ldr	r3, [sp, #4]
30007638:	e3a02000 	mov	r2, #0
3000763c:	e5832020 	str	r2, [r3, #32]
	acoral_spin_unlock(&event->spin_lock);
	HAL_EXIT_CRITICAL();
30007640:	e59d000c 	ldr	r0, [sp, #12]
30007644:	ebffe828 	bl	300016ec <HAL_INTR_RESTORE>

	return msg;
30007648:	e59d3008 	ldr	r3, [sp, #8]
}
3000764c:	e1a00003 	mov	r0, r3
30007650:	e28dd014 	add	sp, sp, #20
30007654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007658:	e12fff1e 	bx	lr

3000765c <acoral_sem_init>:
#include <timer.h>
#include <print.h>
#include <sem.h>
acoral_thread_t *acoral_evt_high_thread(acoral_evt_t *evt);
acoral_u32 *acoral_sem_init(acoral_evt_t *evt,acoral_u32 semNum)
{
3000765c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007660:	e24dd00c 	sub	sp, sp, #12
30007664:	e58d0004 	str	r0, [sp, #4]
30007668:	e58d1000 	str	r1, [sp]
	if (NULL == evt)
3000766c:	e59d3004 	ldr	r3, [sp, #4]
30007670:	e3530000 	cmp	r3, #0
30007674:	1a000001 	bne	30007680 <acoral_sem_init+0x24>
	{
		return NULL;
30007678:	e3a03000 	mov	r3, #0
3000767c:	ea00000e 	b	300076bc <acoral_sem_init+0x60>
	}
	semNum = 1 - semNum;  /* 拥有多个资源，0,一个  -1 两个， -2 三个 ....*/
30007680:	e59d3000 	ldr	r3, [sp]
30007684:	e2633001 	rsb	r3, r3, #1
30007688:	e58d3000 	str	r3, [sp]
	evt->count = semNum;
3000768c:	e59d2000 	ldr	r2, [sp]
30007690:	e59d3004 	ldr	r3, [sp, #4]
30007694:	e583200c 	str	r2, [r3, #12]
	evt->type  = ACORAL_EVENT_SEM;
30007698:	e59d3004 	ldr	r3, [sp, #4]
3000769c:	e3a02000 	mov	r2, #0
300076a0:	e5c32004 	strb	r2, [r3, #4]
	evt->data  = NULL;
300076a4:	e59d3004 	ldr	r3, [sp, #4]
300076a8:	e3a02000 	mov	r2, #0
300076ac:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
300076b0:	e59d0004 	ldr	r0, [sp, #4]
300076b4:	ebfff54e 	bl	30004bf4 <acoral_evt_init>
	return SEM_SUCCED;
300076b8:	e3a03000 	mov	r3, #0
}
300076bc:	e1a00003 	mov	r0, r3
300076c0:	e28dd00c 	add	sp, sp, #12
300076c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300076c8:	e12fff1e 	bx	lr

300076cc <acoral_sem_create>:
/*============================
 *   the creation of signal
 *   计算信号量的创建
 *============================*/
acoral_evt_t *acoral_sem_create(acoral_u32 semNum)
{
300076cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300076d0:	e24dd014 	sub	sp, sp, #20
300076d4:	e58d0004 	str	r0, [sp, #4]
	acoral_evt_t *evt;
	evt = acoral_alloc_evt();
300076d8:	ebfff53d 	bl	30004bd4 <acoral_alloc_evt>
300076dc:	e1a03000 	mov	r3, r0
300076e0:	e58d300c 	str	r3, [sp, #12]
	if (NULL == evt)
300076e4:	e59d300c 	ldr	r3, [sp, #12]
300076e8:	e3530000 	cmp	r3, #0
300076ec:	1a000001 	bne	300076f8 <acoral_sem_create+0x2c>
	{
		return NULL;
300076f0:	e3a03000 	mov	r3, #0
300076f4:	ea00000e 	b	30007734 <acoral_sem_create+0x68>
	}
	semNum = 1 - semNum;  /* 拥有多个资源，0,一个  -1 两个， -2 三个 ....*/
300076f8:	e59d3004 	ldr	r3, [sp, #4]
300076fc:	e2633001 	rsb	r3, r3, #1
30007700:	e58d3004 	str	r3, [sp, #4]
	evt->count = semNum;
30007704:	e59d2004 	ldr	r2, [sp, #4]
30007708:	e59d300c 	ldr	r3, [sp, #12]
3000770c:	e583200c 	str	r2, [r3, #12]
	evt->type  = ACORAL_EVENT_SEM;
30007710:	e59d300c 	ldr	r3, [sp, #12]
30007714:	e3a02000 	mov	r2, #0
30007718:	e5c32004 	strb	r2, [r3, #4]
	evt->data  = NULL;
3000771c:	e59d300c 	ldr	r3, [sp, #12]
30007720:	e3a02000 	mov	r2, #0
30007724:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
30007728:	e59d000c 	ldr	r0, [sp, #12]
3000772c:	ebfff530 	bl	30004bf4 <acoral_evt_init>
	return evt;
30007730:	e59d300c 	ldr	r3, [sp, #12]
}
30007734:	e1a00003 	mov	r0, r3
30007738:	e28dd014 	add	sp, sp, #20
3000773c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007740:	e12fff1e 	bx	lr

30007744 <acoral_sem_del>:
/*============================
 *  the deletion of singal 
 *   计算信号量的删除
 *============================*/
acoral_u32 acoral_sem_del(acoral_evt_t *evt, acoral_u32 opt)
{
30007744:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007748:	e24dd014 	sub	sp, sp, #20
3000774c:	e58d0004 	str	r0, [sp, #4]
30007750:	e58d1000 	str	r1, [sp]
	acoral_sr            cpu_sr;
	acoral_thread_t     *thread;
	if (acoral_intr_nesting)
30007754:	ebffe801 	bl	30001760 <hal_get_intr_nesting_comm>
30007758:	e1a03000 	mov	r3, r0
3000775c:	e3530000 	cmp	r3, #0
30007760:	0a000001 	beq	3000776c <acoral_sem_del+0x28>
	{
		return SEM_ERR_INTR;
30007764:	e3a03006 	mov	r3, #6
30007768:	ea00001d 	b	300077e4 <acoral_sem_del+0xa0>
	}
	/* 参数检测*/
	if (NULL == evt)
3000776c:	e59d3004 	ldr	r3, [sp, #4]
30007770:	e3530000 	cmp	r3, #0
30007774:	1a000001 	bne	30007780 <acoral_sem_del+0x3c>
		return SEM_ERR_NULL; /* error*/
30007778:	e3a03002 	mov	r3, #2
3000777c:	ea000018 	b	300077e4 <acoral_sem_del+0xa0>
	if ( evt->type != ACORAL_EVENT_SEM )
30007780:	e59d3004 	ldr	r3, [sp, #4]
30007784:	e5d33004 	ldrb	r3, [r3, #4]
30007788:	e3530000 	cmp	r3, #0
3000778c:	0a000001 	beq	30007798 <acoral_sem_del+0x54>
		return SEM_ERR_TYPE; /* error*/
30007790:	e3a03004 	mov	r3, #4
30007794:	ea000012 	b	300077e4 <acoral_sem_del+0xa0>

	HAL_ENTER_CRITICAL();
30007798:	ebffe7d5 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000779c:	e1a03000 	mov	r3, r0
300077a0:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	thread =acoral_evt_high_thread(evt);
300077a4:	e59d0004 	ldr	r0, [sp, #4]
300077a8:	ebfff52b 	bl	30004c5c <acoral_evt_high_thread>
300077ac:	e1a03000 	mov	r3, r0
300077b0:	e58d300c 	str	r3, [sp, #12]
	if (thread==NULL)
300077b4:	e59d300c 	ldr	r3, [sp, #12]
300077b8:	e3530000 	cmp	r3, #0
300077bc:	1a000005 	bne	300077d8 <acoral_sem_del+0x94>
	{
		/*队列上无等待任务*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300077c0:	e59d0008 	ldr	r0, [sp, #8]
300077c4:	ebffe7c8 	bl	300016ec <HAL_INTR_RESTORE>
		evt = NULL;
300077c8:	e3a03000 	mov	r3, #0
300077cc:	e58d3004 	str	r3, [sp, #4]
		return SEM_ERR_UNDEF;
300077d0:	e3a03007 	mov	r3, #7
300077d4:	ea000002 	b	300077e4 <acoral_sem_del+0xa0>
	}
	else
	{
		/*有等待任务*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300077d8:	e59d0008 	ldr	r0, [sp, #8]
300077dc:	ebffe7c2 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_ERR_TASK_EXIST; /*error*/
300077e0:	e3a03005 	mov	r3, #5
	}
}
300077e4:	e1a00003 	mov	r0, r3
300077e8:	e28dd014 	add	sp, sp, #20
300077ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300077f0:	e12fff1e 	bx	lr

300077f4 <acoral_sem_trypend>:
 *  计算信号量的申请
 *  desp: count <= SEM_RES_AVAI  信号量有效 a++
 *        count >  SEM_RES_AVAI  信号量无效 a++ && thread suspend
 *============================*/
acoral_u32 acoral_sem_trypend(acoral_evt_t *evt)
{
300077f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300077f8:	e24dd014 	sub	sp, sp, #20
300077fc:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;

	if (acoral_intr_nesting)
30007800:	ebffe7d6 	bl	30001760 <hal_get_intr_nesting_comm>
30007804:	e1a03000 	mov	r3, r0
30007808:	e3530000 	cmp	r3, #0
3000780c:	0a000001 	beq	30007818 <acoral_sem_trypend+0x24>
	{
		return SEM_ERR_INTR;
30007810:	e3a03006 	mov	r3, #6
30007814:	ea000020 	b	3000789c <acoral_sem_trypend+0xa8>
	}

	/* 参数检测 */
	if (NULL == evt)
30007818:	e59d3004 	ldr	r3, [sp, #4]
3000781c:	e3530000 	cmp	r3, #0
30007820:	1a000001 	bne	3000782c <acoral_sem_trypend+0x38>
	{
		return SEM_ERR_NULL; /*error*/
30007824:	e3a03002 	mov	r3, #2
30007828:	ea00001b 	b	3000789c <acoral_sem_trypend+0xa8>
	}
	if (ACORAL_EVENT_SEM != evt->type)
3000782c:	e59d3004 	ldr	r3, [sp, #4]
30007830:	e5d33004 	ldrb	r3, [r3, #4]
30007834:	e3530000 	cmp	r3, #0
30007838:	0a000001 	beq	30007844 <acoral_sem_trypend+0x50>
	{
		return SEM_ERR_TYPE; /*error*/
3000783c:	e3a03004 	mov	r3, #4
30007840:	ea000015 	b	3000789c <acoral_sem_trypend+0xa8>
	}

	/* 计算信号量处理*/
	HAL_ENTER_CRITICAL();
30007844:	ebffe7aa 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007848:	e1a03000 	mov	r3, r0
3000784c:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if ((acoral_8)evt->count <= SEM_RES_AVAI)
30007850:	e59d3004 	ldr	r3, [sp, #4]
30007854:	e593300c 	ldr	r3, [r3, #12]
30007858:	e20330ff 	and	r3, r3, #255	; 0xff
3000785c:	e1a03c03 	lsl	r3, r3, #24
30007860:	e1a03c43 	asr	r3, r3, #24
30007864:	e3530000 	cmp	r3, #0
30007868:	ca000008 	bgt	30007890 <acoral_sem_trypend+0x9c>
	{   /* available*/
		evt->count++;
3000786c:	e59d3004 	ldr	r3, [sp, #4]
30007870:	e593300c 	ldr	r3, [r3, #12]
30007874:	e2832001 	add	r2, r3, #1
30007878:	e59d3004 	ldr	r3, [sp, #4]
3000787c:	e583200c 	str	r2, [r3, #12]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30007880:	e59d000c 	ldr	r0, [sp, #12]
30007884:	ebffe798 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_SUCCED;
30007888:	e3a03000 	mov	r3, #0
3000788c:	ea000002 	b	3000789c <acoral_sem_trypend+0xa8>
	}

	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007890:	e59d000c 	ldr	r0, [sp, #12]
30007894:	ebffe794 	bl	300016ec <HAL_INTR_RESTORE>
	return SEM_ERR_TIMEOUT;
30007898:	e3a03008 	mov	r3, #8
}
3000789c:	e1a00003 	mov	r0, r3
300078a0:	e28dd014 	add	sp, sp, #20
300078a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300078a8:	e12fff1e 	bx	lr

300078ac <acoral_sem_pend>:
 *  计算信号量的申请
 *  desp: count <= SEM_RES_AVAI  信号量有效 a++
 *        count >  SEM_RES_AVAI  信号量无效 a++ && thread suspend
 *============================*/
acoral_u32 acoral_sem_pend(acoral_evt_t *evt, acoral_time timeout)
{
300078ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300078b0:	e24dd014 	sub	sp, sp, #20
300078b4:	e58d0004 	str	r0, [sp, #4]
300078b8:	e58d1000 	str	r1, [sp]
	acoral_thread_t *cur = acoral_cur_thread;
300078bc:	e59f318c 	ldr	r3, [pc, #396]	; 30007a50 <acoral_sem_pend+0x1a4>
300078c0:	e5933000 	ldr	r3, [r3]
300078c4:	e58d3008 	str	r3, [sp, #8]
	acoral_sr cpu_sr;

	if (acoral_intr_nesting)
300078c8:	ebffe7a4 	bl	30001760 <hal_get_intr_nesting_comm>
300078cc:	e1a03000 	mov	r3, r0
300078d0:	e3530000 	cmp	r3, #0
300078d4:	0a000001 	beq	300078e0 <acoral_sem_pend+0x34>
	{
		return SEM_ERR_INTR;
300078d8:	e3a03006 	mov	r3, #6
300078dc:	ea000057 	b	30007a40 <acoral_sem_pend+0x194>
	}

	/* 参数检测 */
	if (NULL == evt)
300078e0:	e59d3004 	ldr	r3, [sp, #4]
300078e4:	e3530000 	cmp	r3, #0
300078e8:	1a000001 	bne	300078f4 <acoral_sem_pend+0x48>
	{
		return SEM_ERR_NULL; /*error*/
300078ec:	e3a03002 	mov	r3, #2
300078f0:	ea000052 	b	30007a40 <acoral_sem_pend+0x194>
	}
	if (ACORAL_EVENT_SEM != evt->type)
300078f4:	e59d3004 	ldr	r3, [sp, #4]
300078f8:	e5d33004 	ldrb	r3, [r3, #4]
300078fc:	e3530000 	cmp	r3, #0
30007900:	0a000001 	beq	3000790c <acoral_sem_pend+0x60>
	{
		return SEM_ERR_TYPE; /*error*/
30007904:	e3a03004 	mov	r3, #4
30007908:	ea00004c 	b	30007a40 <acoral_sem_pend+0x194>
	}

	/* 计算信号量处理*/
	HAL_ENTER_CRITICAL();
3000790c:	ebffe778 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007910:	e1a03000 	mov	r3, r0
30007914:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if ((acoral_8)evt->count <= SEM_RES_AVAI)
30007918:	e59d3004 	ldr	r3, [sp, #4]
3000791c:	e593300c 	ldr	r3, [r3, #12]
30007920:	e20330ff 	and	r3, r3, #255	; 0xff
30007924:	e1a03c03 	lsl	r3, r3, #24
30007928:	e1a03c43 	asr	r3, r3, #24
3000792c:	e3530000 	cmp	r3, #0
30007930:	ca000008 	bgt	30007958 <acoral_sem_pend+0xac>
	{   /* available*/
		evt->count++;
30007934:	e59d3004 	ldr	r3, [sp, #4]
30007938:	e593300c 	ldr	r3, [r3, #12]
3000793c:	e2832001 	add	r2, r3, #1
30007940:	e59d3004 	ldr	r3, [sp, #4]
30007944:	e583200c 	str	r2, [r3, #12]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30007948:	e59d000c 	ldr	r0, [sp, #12]
3000794c:	ebffe766 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_SUCCED;
30007950:	e3a03000 	mov	r3, #0
30007954:	ea000039 	b	30007a40 <acoral_sem_pend+0x194>
	}

	evt->count++;
30007958:	e59d3004 	ldr	r3, [sp, #4]
3000795c:	e593300c 	ldr	r3, [r3, #12]
30007960:	e2832001 	add	r2, r3, #1
30007964:	e59d3004 	ldr	r3, [sp, #4]
30007968:	e583200c 	str	r2, [r3, #12]
	acoral_unrdy_thread(cur);
3000796c:	e59d0008 	ldr	r0, [sp, #8]
30007970:	ebffec8d 	bl	30002bac <acoral_unrdy_thread>
	if (timeout > 0)
30007974:	e59d3000 	ldr	r3, [sp]
30007978:	e3530000 	cmp	r3, #0
3000797c:	0a00000f 	beq	300079c0 <acoral_sem_pend+0x114>
	{
		cur->delay = TIME_TO_TICKS(timeout);
30007980:	e59d2000 	ldr	r2, [sp]
30007984:	e1a03002 	mov	r3, r2
30007988:	e1a03103 	lsl	r3, r3, #2
3000798c:	e0833002 	add	r3, r3, r2
30007990:	e1a02103 	lsl	r2, r3, #2
30007994:	e0833002 	add	r3, r3, r2
30007998:	e1a03103 	lsl	r3, r3, #2
3000799c:	e1a02003 	mov	r2, r3
300079a0:	e59f30ac 	ldr	r3, [pc, #172]	; 30007a54 <acoral_sem_pend+0x1a8>
300079a4:	e0831392 	umull	r1, r3, r2, r3
300079a8:	e1a03323 	lsr	r3, r3, #6
300079ac:	e1a02003 	mov	r2, r3
300079b0:	e59d3008 	ldr	r3, [sp, #8]
300079b4:	e5832040 	str	r2, [r3, #64]	; 0x40
		timeout_queue_add(cur);
300079b8:	e59d0008 	ldr	r0, [sp, #8]
300079bc:	ebfff38f 	bl	30004800 <timeout_queue_add>
	}
	acoral_evt_queue_add(evt,cur);
300079c0:	e59d0004 	ldr	r0, [sp, #4]
300079c4:	e59d1008 	ldr	r1, [sp, #8]
300079c8:	ebfff4b7 	bl	30004cac <acoral_evt_queue_add>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
300079cc:	e59d000c 	ldr	r0, [sp, #12]
300079d0:	ebffe745 	bl	300016ec <HAL_INTR_RESTORE>
	
	acoral_sched();
300079d4:	ebffea8d 	bl	30002410 <acoral_sched>

	HAL_ENTER_CRITICAL();
300079d8:	ebffe745 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300079dc:	e1a03000 	mov	r3, r0
300079e0:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if(timeout>0 && cur->delay<=0)
300079e4:	e59d3000 	ldr	r3, [sp]
300079e8:	e3530000 	cmp	r3, #0
300079ec:	0a00000e 	beq	30007a2c <acoral_sem_pend+0x180>
300079f0:	e59d3008 	ldr	r3, [sp, #8]
300079f4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300079f8:	e3530000 	cmp	r3, #0
300079fc:	ca00000a 	bgt	30007a2c <acoral_sem_pend+0x180>
	{
		//--------------
		// modify by pegasus 0804: count-- [+]
		evt->count--;
30007a00:	e59d3004 	ldr	r3, [sp, #4]
30007a04:	e593300c 	ldr	r3, [r3, #12]
30007a08:	e2432001 	sub	r2, r3, #1
30007a0c:	e59d3004 	ldr	r3, [sp, #4]
30007a10:	e583200c 	str	r2, [r3, #12]
		acoral_evt_queue_del(cur);
30007a14:	e59d0008 	ldr	r0, [sp, #8]
30007a18:	ebfff4d4 	bl	30004d70 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30007a1c:	e59d000c 	ldr	r0, [sp, #12]
30007a20:	ebffe731 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_ERR_TIMEOUT;
30007a24:	e3a03008 	mov	r3, #8
30007a28:	ea000004 	b	30007a40 <acoral_sem_pend+0x194>
	}

	//-------------------
	// modify by pegasus 0804: timeout_queue_del [+]
	timeout_queue_del(cur);
30007a2c:	e59d0008 	ldr	r0, [sp, #8]
30007a30:	ebfff3b4 	bl	30004908 <timeout_queue_del>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007a34:	e59d000c 	ldr	r0, [sp, #12]
30007a38:	ebffe72b 	bl	300016ec <HAL_INTR_RESTORE>
	return SEM_SUCCED;
30007a3c:	e3a03000 	mov	r3, #0
}
30007a40:	e1a00003 	mov	r0, r3
30007a44:	e28dd014 	add	sp, sp, #20
30007a48:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007a4c:	e12fff1e 	bx	lr
30007a50:	30010630 	.word	0x30010630
30007a54:	10624dd3 	.word	0x10624dd3

30007a58 <acoral_sem_post>:
 *  计算信号量的释放
 *  desp: count > SEM_RES_NOAVAI 有等待线程 a-- && resume waiting thread.
 *        count <= SEM_RES_NOAVAI 无等待线程 a--
 *===========================*/
acoral_u32 acoral_sem_post(acoral_evt_t *evt)
{
30007a58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007a5c:	e24dd014 	sub	sp, sp, #20
30007a60:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t     *thread;
	acoral_sr            cpu_sr;

	/* 参数检测*/
	if ( NULL == evt)
30007a64:	e59d3004 	ldr	r3, [sp, #4]
30007a68:	e3530000 	cmp	r3, #0
30007a6c:	1a000001 	bne	30007a78 <acoral_sem_post+0x20>
	{
		return SEM_ERR_NULL; /* error*/
30007a70:	e3a03002 	mov	r3, #2
30007a74:	ea000034 	b	30007b4c <acoral_sem_post+0xf4>
	}
	if (ACORAL_EVENT_SEM != evt->type)
30007a78:	e59d3004 	ldr	r3, [sp, #4]
30007a7c:	e5d33004 	ldrb	r3, [r3, #4]
30007a80:	e3530000 	cmp	r3, #0
30007a84:	0a000001 	beq	30007a90 <acoral_sem_post+0x38>
	{
		return SEM_ERR_TYPE;
30007a88:	e3a03004 	mov	r3, #4
30007a8c:	ea00002e 	b	30007b4c <acoral_sem_post+0xf4>
	}

	HAL_ENTER_CRITICAL();
30007a90:	ebffe717 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007a94:	e1a03000 	mov	r3, r0
30007a98:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);

	/* 计算信号量的释放*/
	if ((acoral_8)evt->count <= SEM_RES_NOAVAI)
30007a9c:	e59d3004 	ldr	r3, [sp, #4]
30007aa0:	e593300c 	ldr	r3, [r3, #12]
30007aa4:	e20330ff 	and	r3, r3, #255	; 0xff
30007aa8:	e1a03c03 	lsl	r3, r3, #24
30007aac:	e1a03c43 	asr	r3, r3, #24
30007ab0:	e3530001 	cmp	r3, #1
30007ab4:	ca000008 	bgt	30007adc <acoral_sem_post+0x84>
	{ /* no waiting thread*/
		evt->count--;
30007ab8:	e59d3004 	ldr	r3, [sp, #4]
30007abc:	e593300c 	ldr	r3, [r3, #12]
30007ac0:	e2432001 	sub	r2, r3, #1
30007ac4:	e59d3004 	ldr	r3, [sp, #4]
30007ac8:	e583200c 	str	r2, [r3, #12]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30007acc:	e59d000c 	ldr	r0, [sp, #12]
30007ad0:	ebffe705 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_SUCCED;
30007ad4:	e3a03000 	mov	r3, #0
30007ad8:	ea00001b 	b	30007b4c <acoral_sem_post+0xf4>
	}
	/* 有等待线程*/
	evt->count--;
30007adc:	e59d3004 	ldr	r3, [sp, #4]
30007ae0:	e593300c 	ldr	r3, [r3, #12]
30007ae4:	e2432001 	sub	r2, r3, #1
30007ae8:	e59d3004 	ldr	r3, [sp, #4]
30007aec:	e583200c 	str	r2, [r3, #12]
	thread =acoral_evt_high_thread(evt);
30007af0:	e59d0004 	ldr	r0, [sp, #4]
30007af4:	ebfff458 	bl	30004c5c <acoral_evt_high_thread>
30007af8:	e1a03000 	mov	r3, r0
30007afc:	e58d3008 	str	r3, [sp, #8]
	if (thread==NULL)
30007b00:	e59d3008 	ldr	r3, [sp, #8]
30007b04:	e3530000 	cmp	r3, #0
30007b08:	1a000005 	bne	30007b24 <acoral_sem_post+0xcc>
	{
		/*应该有等待线程却没有找到*/
		acoral_printerr("Err Sem post\n");
30007b0c:	e59f0048 	ldr	r0, [pc, #72]	; 30007b5c <acoral_sem_post+0x104>
30007b10:	eb000e43 	bl	3000b424 <acoral_print>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30007b14:	e59d000c 	ldr	r0, [sp, #12]
30007b18:	ebffe6f3 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_ERR_UNDEF;
30007b1c:	e3a03007 	mov	r3, #7
30007b20:	ea000009 	b	30007b4c <acoral_sem_post+0xf4>
	}
	timeout_queue_del(thread);
30007b24:	e59d0008 	ldr	r0, [sp, #8]
30007b28:	ebfff376 	bl	30004908 <timeout_queue_del>
	/*释放等待任务*/
	acoral_evt_queue_del(thread);
30007b2c:	e59d0008 	ldr	r0, [sp, #8]
30007b30:	ebfff48e 	bl	30004d70 <acoral_evt_queue_del>
	acoral_rdy_thread(thread);
30007b34:	e59d0008 	ldr	r0, [sp, #8]
30007b38:	ebffec0c 	bl	30002b70 <acoral_rdy_thread>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007b3c:	e59d000c 	ldr	r0, [sp, #12]
30007b40:	ebffe6e9 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30007b44:	ebffea31 	bl	30002410 <acoral_sched>
	return SEM_SUCCED;
30007b48:	e3a03000 	mov	r3, #0
}
30007b4c:	e1a00003 	mov	r0, r3
30007b50:	e28dd014 	add	sp, sp, #20
30007b54:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007b58:	e12fff1e 	bx	lr
30007b5c:	3000e7f8 	.word	0x3000e7f8

30007b60 <acoral_sem_getnum>:
/*===================================
 *   get singal's number now
 *     得到当前信号量数目
 *===================================*/
acoral_32 acoral_sem_getnum(acoral_evt_t* evt)
{
30007b60:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007b64:	e24dd014 	sub	sp, sp, #20
30007b68:	e58d0004 	str	r0, [sp, #4]
	acoral_32 t;
	acoral_sr cpu_sr;

	if (NULL == evt)
30007b6c:	e59d3004 	ldr	r3, [sp, #4]
30007b70:	e3530000 	cmp	r3, #0
30007b74:	1a000001 	bne	30007b80 <acoral_sem_getnum+0x20>
		return SEM_ERR_NULL;
30007b78:	e3a03002 	mov	r3, #2
30007b7c:	ea000009 	b	30007ba8 <acoral_sem_getnum+0x48>

	HAL_ENTER_CRITICAL();
30007b80:	ebffe6db 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007b84:	e1a03000 	mov	r3, r0
30007b88:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	t = 1 - (acoral_32)evt->count;
30007b8c:	e59d3004 	ldr	r3, [sp, #4]
30007b90:	e593300c 	ldr	r3, [r3, #12]
30007b94:	e2633001 	rsb	r3, r3, #1
30007b98:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007b9c:	e59d000c 	ldr	r0, [sp, #12]
30007ba0:	ebffe6d1 	bl	300016ec <HAL_INTR_RESTORE>
	return t;
30007ba4:	e59d3008 	ldr	r3, [sp, #8]
}
30007ba8:	e1a00003 	mov	r0, r3
30007bac:	e28dd014 	add	sp, sp, #20
30007bb0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007bb4:	e12fff1e 	bx	lr

30007bb8 <acoral_msg_sys_init>:
/*=============================
 *
 *  mssage 机制缓冲池初始化
 *=============================*/
void acoral_msg_sys_init()
{
30007bb8:	e92d4008 	push	{r3, lr}
	/*初始化全局事件列表头*/
	acoral_init_list (&(g_msgctr_header.head));
30007bbc:	e59f3094 	ldr	r3, [pc, #148]	; 30007c58 <acoral_msg_sys_init+0xa0>
30007bc0:	e59f2090 	ldr	r2, [pc, #144]	; 30007c58 <acoral_msg_sys_init+0xa0>
30007bc4:	e5832000 	str	r2, [r3]
30007bc8:	e59f3088 	ldr	r3, [pc, #136]	; 30007c58 <acoral_msg_sys_init+0xa0>
30007bcc:	e59f2084 	ldr	r2, [pc, #132]	; 30007c58 <acoral_msg_sys_init+0xa0>
30007bd0:	e5832004 	str	r2, [r3, #4]
	g_msgctr_header.data = NULL;
30007bd4:	e59f307c 	ldr	r3, [pc, #124]	; 30007c58 <acoral_msg_sys_init+0xa0>
30007bd8:	e3a02000 	mov	r2, #0
30007bdc:	e5832008 	str	r2, [r3, #8]
	acoral_msgctr_pool_ctrl.type=ACORAL_RES_MST;
30007be0:	e59f3074 	ldr	r3, [pc, #116]	; 30007c5c <acoral_msg_sys_init+0xa4>
30007be4:	e3a02006 	mov	r2, #6
30007be8:	e5832000 	str	r2, [r3]
	acoral_msgctr_pool_ctrl.size=sizeof(acoral_msgctr_t);
30007bec:	e59f3068 	ldr	r3, [pc, #104]	; 30007c5c <acoral_msg_sys_init+0xa4>
30007bf0:	e3a02030 	mov	r2, #48	; 0x30
30007bf4:	e5832004 	str	r2, [r3, #4]
	acoral_msgctr_pool_ctrl.num_per_pool=10;
30007bf8:	e59f305c 	ldr	r3, [pc, #92]	; 30007c5c <acoral_msg_sys_init+0xa4>
30007bfc:	e3a0200a 	mov	r2, #10
30007c00:	e5832008 	str	r2, [r3, #8]
	acoral_msgctr_pool_ctrl.max_pools=4;
30007c04:	e59f3050 	ldr	r3, [pc, #80]	; 30007c5c <acoral_msg_sys_init+0xa4>
30007c08:	e3a02004 	mov	r2, #4
30007c0c:	e5832010 	str	r2, [r3, #16]

	acoral_msg_pool_ctrl.type=ACORAL_RES_MSG;
30007c10:	e59f3048 	ldr	r3, [pc, #72]	; 30007c60 <acoral_msg_sys_init+0xa8>
30007c14:	e3a02005 	mov	r2, #5
30007c18:	e5832000 	str	r2, [r3]
	acoral_msg_pool_ctrl.size=sizeof(acoral_msg_t);
30007c1c:	e59f303c 	ldr	r3, [pc, #60]	; 30007c60 <acoral_msg_sys_init+0xa8>
30007c20:	e3a0201c 	mov	r2, #28
30007c24:	e5832004 	str	r2, [r3, #4]
	acoral_msg_pool_ctrl.num_per_pool=10;
30007c28:	e59f3030 	ldr	r3, [pc, #48]	; 30007c60 <acoral_msg_sys_init+0xa8>
30007c2c:	e3a0200a 	mov	r2, #10
30007c30:	e5832008 	str	r2, [r3, #8]
	acoral_msg_pool_ctrl.max_pools=4;
30007c34:	e59f3024 	ldr	r3, [pc, #36]	; 30007c60 <acoral_msg_sys_init+0xa8>
30007c38:	e3a02004 	mov	r2, #4
30007c3c:	e5832010 	str	r2, [r3, #16]

	acoral_pool_ctrl_init(&acoral_msgctr_pool_ctrl);
30007c40:	e59f0014 	ldr	r0, [pc, #20]	; 30007c5c <acoral_msg_sys_init+0xa4>
30007c44:	ebffef89 	bl	30003a70 <acoral_pool_ctrl_init>
	acoral_pool_ctrl_init(&acoral_msg_pool_ctrl);
30007c48:	e59f0010 	ldr	r0, [pc, #16]	; 30007c60 <acoral_msg_sys_init+0xa8>
30007c4c:	ebffef87 	bl	30003a70 <acoral_pool_ctrl_init>
}
30007c50:	e8bd4008 	pop	{r3, lr}
30007c54:	e12fff1e 	bx	lr
30007c58:	3000f584 	.word	0x3000f584
30007c5c:	300105e4 	.word	0x300105e4
30007c60:	30010534 	.word	0x30010534

30007c64 <acoral_msgctr_list_queueadd>:
 *  静态创建的acoral_msgctr_t调用
 *  message container 挂全局队列
 *  在中断中处理 ttl 时使用
 *==============================*/
void acoral_msgctr_list_queueadd(acoral_msgctr_t* msgctr)
{
30007c64:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007c68:	e24dd00c 	sub	sp, sp, #12
30007c6c:	e58d0004 	str	r0, [sp, #4]
  	acoral_list_add2_tail (&msgctr->msgctr_list, &(g_msgctr_header.head));
30007c70:	e59d3004 	ldr	r3, [sp, #4]
30007c74:	e283300c 	add	r3, r3, #12
30007c78:	e1a00003 	mov	r0, r3
30007c7c:	e59f100c 	ldr	r1, [pc, #12]	; 30007c90 <acoral_msgctr_list_queueadd+0x2c>
30007c80:	eb000955 	bl	3000a1dc <acoral_list_add2_tail>
}
30007c84:	e28dd00c 	add	sp, sp, #12
30007c88:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007c8c:	e12fff1e 	bx	lr
30007c90:	3000f584 	.word	0x3000f584

30007c94 <acoral_alloc_msgctr>:
/*==============================
 *
 *  message 分配
 *==============================*/
acoral_msgctr_t* acoral_alloc_msgctr()
{
30007c94:	e92d4008 	push	{r3, lr}
	return (acoral_msgctr_t*)acoral_get_res (&acoral_msgctr_pool_ctrl);
30007c98:	e59f0010 	ldr	r0, [pc, #16]	; 30007cb0 <acoral_alloc_msgctr+0x1c>
30007c9c:	ebffee14 	bl	300034f4 <acoral_get_res>
30007ca0:	e1a03000 	mov	r3, r0
}
30007ca4:	e1a00003 	mov	r0, r3
30007ca8:	e8bd4008 	pop	{r3, lr}
30007cac:	e12fff1e 	bx	lr
30007cb0:	300105e4 	.word	0x300105e4

30007cb4 <acoral_alloc_msg>:

acoral_msg_t* acoral_alloc_msg()
{
30007cb4:	e92d4008 	push	{r3, lr}
	return (acoral_msg_t*)acoral_get_res (&acoral_msg_pool_ctrl);
30007cb8:	e59f0010 	ldr	r0, [pc, #16]	; 30007cd0 <acoral_alloc_msg+0x1c>
30007cbc:	ebffee0c 	bl	300034f4 <acoral_get_res>
30007cc0:	e1a03000 	mov	r3, r0
}
30007cc4:	e1a00003 	mov	r0, r3
30007cc8:	e8bd4008 	pop	{r3, lr}
30007ccc:	e12fff1e 	bx	lr
30007cd0:	30010534 	.word	0x30010534

30007cd4 <acoral_msgctr_queue_add>:
 *
 *  message 等待队列增加
 *==============================*/
void acoral_msgctr_queue_add (acoral_msgctr_t* msgctr, 
		                            acoral_thread_t* thread)
{   /*需按优先级排序*/
30007cd4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007cd8:	e24dd01c 	sub	sp, sp, #28
30007cdc:	e58d0004 	str	r0, [sp, #4]
30007ce0:	e58d1000 	str	r1, [sp]
	/*acoral_list_add2_tail (&thread->waiting, &msgctr->waiting);*/
	acoral_list_t *p, *q;
	acoral_thread_t*  ptd;
	
	p = &msgctr->waiting;
30007ce4:	e59d3004 	ldr	r3, [sp, #4]
30007ce8:	e2833020 	add	r3, r3, #32
30007cec:	e58d300c 	str	r3, [sp, #12]
	q = p->next;
30007cf0:	e59d300c 	ldr	r3, [sp, #12]
30007cf4:	e5933000 	ldr	r3, [r3]
30007cf8:	e58d3010 	str	r3, [sp, #16]
	for( ; p != q; q=q->next)
30007cfc:	ea00000b 	b	30007d30 <acoral_msgctr_queue_add+0x5c>
	{
		ptd = list_entry( q, acoral_thread_t, waiting);
30007d00:	e59d3010 	ldr	r3, [sp, #16]
30007d04:	e2433020 	sub	r3, r3, #32
30007d08:	e58d3014 	str	r3, [sp, #20]
		if (ptd->prio > thread->prio)
30007d0c:	e59d3014 	ldr	r3, [sp, #20]
30007d10:	e5d32005 	ldrb	r2, [r3, #5]
30007d14:	e59d3000 	ldr	r3, [sp]
30007d18:	e5d33005 	ldrb	r3, [r3, #5]
30007d1c:	e1520003 	cmp	r2, r3
30007d20:	8a000007 	bhi	30007d44 <acoral_msgctr_queue_add+0x70>
	acoral_list_t *p, *q;
	acoral_thread_t*  ptd;
	
	p = &msgctr->waiting;
	q = p->next;
	for( ; p != q; q=q->next)
30007d24:	e59d3010 	ldr	r3, [sp, #16]
30007d28:	e5933000 	ldr	r3, [r3]
30007d2c:	e58d3010 	str	r3, [sp, #16]
30007d30:	e59d200c 	ldr	r2, [sp, #12]
30007d34:	e59d3010 	ldr	r3, [sp, #16]
30007d38:	e1520003 	cmp	r2, r3
30007d3c:	1affffef 	bne	30007d00 <acoral_msgctr_queue_add+0x2c>
30007d40:	ea000000 	b	30007d48 <acoral_msgctr_queue_add+0x74>
	{
		ptd = list_entry( q, acoral_thread_t, waiting);
		if (ptd->prio > thread->prio)
			break;
30007d44:	e1a00000 	nop			; (mov r0, r0)
	}
	acoral_list_add( &thread->waiting, q->prev);
30007d48:	e59d3000 	ldr	r3, [sp]
30007d4c:	e2832020 	add	r2, r3, #32
30007d50:	e59d3010 	ldr	r3, [sp, #16]
30007d54:	e5933004 	ldr	r3, [r3, #4]
30007d58:	e1a00002 	mov	r0, r2
30007d5c:	e1a01003 	mov	r1, r3
30007d60:	eb00090a 	bl	3000a190 <acoral_list_add>
}
30007d64:	e28dd01c 	add	sp, sp, #28
30007d68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007d6c:	e12fff1e 	bx	lr

30007d70 <acoral_msg_queue_add>:

void acoral_msg_queue_add (acoral_msgctr_t* msgctr, 
		                          acoral_msg_t* msg)
{
30007d70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007d74:	e24dd00c 	sub	sp, sp, #12
30007d78:	e58d0004 	str	r0, [sp, #4]
30007d7c:	e58d1000 	str	r1, [sp]
	acoral_list_add2_tail (&msg->msglist, &msgctr->msglist);
30007d80:	e59d3000 	ldr	r3, [sp]
30007d84:	e2832004 	add	r2, r3, #4
30007d88:	e59d3004 	ldr	r3, [sp, #4]
30007d8c:	e2833028 	add	r3, r3, #40	; 0x28
30007d90:	e1a00002 	mov	r0, r2
30007d94:	e1a01003 	mov	r1, r3
30007d98:	eb00090f 	bl	3000a1dc <acoral_list_add2_tail>
}
30007d9c:	e28dd00c 	add	sp, sp, #12
30007da0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007da4:	e12fff1e 	bx	lr

30007da8 <acoral_msgctr_init>:
/*==============================
 * The initialize of the message
 *       消息容器初始化
 *==============================*/
acoral_u32  acoral_msgctr_init(acoral_msgctr_t *msgctr)
{
30007da8:	e24dd008 	sub	sp, sp, #8
30007dac:	e58d0004 	str	r0, [sp, #4]
	if (msgctr == NULL)
30007db0:	e59d3004 	ldr	r3, [sp, #4]
30007db4:	e3530000 	cmp	r3, #0
30007db8:	1a000001 	bne	30007dc4 <acoral_msgctr_init+0x1c>
		return MST_ERR_NULL;
30007dbc:	e3a03000 	mov	r3, #0
30007dc0:	ea000024 	b	30007e58 <acoral_msgctr_init+0xb0>

	msgctr->name  = NULL;
30007dc4:	e59d3004 	ldr	r3, [sp, #4]
30007dc8:	e3a02000 	mov	r2, #0
30007dcc:	e5832004 	str	r2, [r3, #4]
	msgctr->type  = ACORAL_MSGCTR;
30007dd0:	e59d3004 	ldr	r3, [sp, #4]
30007dd4:	e3a02001 	mov	r2, #1
30007dd8:	e5c32008 	strb	r2, [r3, #8]
	msgctr->count = 0;
30007ddc:	e59d3004 	ldr	r3, [sp, #4]
30007de0:	e3a02000 	mov	r2, #0
30007de4:	e5832018 	str	r2, [r3, #24]
	msgctr->wait_thread_num = 0;
30007de8:	e59d3004 	ldr	r3, [sp, #4]
30007dec:	e3a02000 	mov	r2, #0
30007df0:	e583201c 	str	r2, [r3, #28]

	acoral_init_list(&msgctr->msglist);
30007df4:	e59d3004 	ldr	r3, [sp, #4]
30007df8:	e2832028 	add	r2, r3, #40	; 0x28
30007dfc:	e59d3004 	ldr	r3, [sp, #4]
30007e00:	e5832028 	str	r2, [r3, #40]	; 0x28
30007e04:	e59d3004 	ldr	r3, [sp, #4]
30007e08:	e2832028 	add	r2, r3, #40	; 0x28
30007e0c:	e59d3004 	ldr	r3, [sp, #4]
30007e10:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_init_list(&msgctr->waiting);
30007e14:	e59d3004 	ldr	r3, [sp, #4]
30007e18:	e2832020 	add	r2, r3, #32
30007e1c:	e59d3004 	ldr	r3, [sp, #4]
30007e20:	e5832020 	str	r2, [r3, #32]
30007e24:	e59d3004 	ldr	r3, [sp, #4]
30007e28:	e2832020 	add	r2, r3, #32
30007e2c:	e59d3004 	ldr	r3, [sp, #4]
30007e30:	e5832024 	str	r2, [r3, #36]	; 0x24
	acoral_init_list(&msgctr->msgctr_list);
30007e34:	e59d3004 	ldr	r3, [sp, #4]
30007e38:	e283200c 	add	r2, r3, #12
30007e3c:	e59d3004 	ldr	r3, [sp, #4]
30007e40:	e583200c 	str	r2, [r3, #12]
30007e44:	e59d3004 	ldr	r3, [sp, #4]
30007e48:	e283200c 	add	r2, r3, #12
30007e4c:	e59d3004 	ldr	r3, [sp, #4]
30007e50:	e5832010 	str	r2, [r3, #16]
	acoral_spin_init(&msgctr->spin_lock);
	return MSGCTR_SUCCED;
30007e54:	e3a03004 	mov	r3, #4
}
30007e58:	e1a00003 	mov	r0, r3
30007e5c:	e28dd008 	add	sp, sp, #8
30007e60:	e12fff1e 	bx	lr

30007e64 <acoral_msg_init>:

acoral_u32 acoral_msg_init(
		acoral_msg_t *msg, acoral_u32 id /*= 0*/, acoral_u32 n /*= 0*/, 
		acoral_u32  nTtl /*= 0*/, void* dat /*= NULL*/)
{
30007e64:	e24dd010 	sub	sp, sp, #16
30007e68:	e58d000c 	str	r0, [sp, #12]
30007e6c:	e58d1008 	str	r1, [sp, #8]
30007e70:	e58d2004 	str	r2, [sp, #4]
30007e74:	e58d3000 	str	r3, [sp]
	if (msg == NULL)
30007e78:	e59d300c 	ldr	r3, [sp, #12]
30007e7c:	e3530000 	cmp	r3, #0
30007e80:	1a000001 	bne	30007e8c <acoral_msg_init+0x28>
		return MSG_ERR_NULL;
30007e84:	e3a03007 	mov	r3, #7
30007e88:	ea000014 	b	30007ee0 <acoral_msg_init+0x7c>

	msg->id   =  id;                /*消息标识*/
30007e8c:	e59d300c 	ldr	r3, [sp, #12]
30007e90:	e59d2008 	ldr	r2, [sp, #8]
30007e94:	e583200c 	str	r2, [r3, #12]
	msg->n    =  n;                 /*消息被接收次数*/
30007e98:	e59d300c 	ldr	r3, [sp, #12]
30007e9c:	e59d2004 	ldr	r2, [sp, #4]
30007ea0:	e5832010 	str	r2, [r3, #16]
	msg->ttl  =  nTtl;              /*消息生存周期*/
30007ea4:	e59d300c 	ldr	r3, [sp, #12]
30007ea8:	e59d2000 	ldr	r2, [sp]
30007eac:	e5832014 	str	r2, [r3, #20]
	msg->data =  dat;               /*消息指针*/
30007eb0:	e59d300c 	ldr	r3, [sp, #12]
30007eb4:	e59d2010 	ldr	r2, [sp, #16]
30007eb8:	e5832018 	str	r2, [r3, #24]
	acoral_init_list(&msg->msglist);
30007ebc:	e59d300c 	ldr	r3, [sp, #12]
30007ec0:	e2832004 	add	r2, r3, #4
30007ec4:	e59d300c 	ldr	r3, [sp, #12]
30007ec8:	e5832004 	str	r2, [r3, #4]
30007ecc:	e59d300c 	ldr	r3, [sp, #12]
30007ed0:	e2832004 	add	r2, r3, #4
30007ed4:	e59d300c 	ldr	r3, [sp, #12]
30007ed8:	e5832008 	str	r2, [r3, #8]
	acoral_spin_init(&(msg->msglist.lock));
	return 0;
30007edc:	e3a03000 	mov	r3, #0
}
30007ee0:	e1a00003 	mov	r0, r3
30007ee4:	e28dd010 	add	sp, sp, #16
30007ee8:	e12fff1e 	bx	lr

30007eec <acoral_msg_assign>:

acoral_32 acoral_msg_assign(
		acoral_msg_t* msg, void* dat, acoral_u32 id,
		acoral_u32 nTtl, acoral_u32 n)
{
30007eec:	e24dd010 	sub	sp, sp, #16
30007ef0:	e58d000c 	str	r0, [sp, #12]
30007ef4:	e58d1008 	str	r1, [sp, #8]
30007ef8:	e58d2004 	str	r2, [sp, #4]
30007efc:	e58d3000 	str	r3, [sp]
	if (msg == NULL)
30007f00:	e59d300c 	ldr	r3, [sp, #12]
30007f04:	e3530000 	cmp	r3, #0
30007f08:	1a000001 	bne	30007f14 <acoral_msg_assign+0x28>
		return MSG_ERR_NULL;
30007f0c:	e3a03007 	mov	r3, #7
30007f10:	ea00000c 	b	30007f48 <acoral_msg_assign+0x5c>

	msg->id   =  id;                /*消息标识*/
30007f14:	e59d300c 	ldr	r3, [sp, #12]
30007f18:	e59d2004 	ldr	r2, [sp, #4]
30007f1c:	e583200c 	str	r2, [r3, #12]
	msg->n    =  n;                 /*消息被接收次数*/
30007f20:	e59d300c 	ldr	r3, [sp, #12]
30007f24:	e59d2010 	ldr	r2, [sp, #16]
30007f28:	e5832010 	str	r2, [r3, #16]
	msg->ttl  =  nTtl;              /*消息生存周期*/
30007f2c:	e59d300c 	ldr	r3, [sp, #12]
30007f30:	e59d2000 	ldr	r2, [sp]
30007f34:	e5832014 	str	r2, [r3, #20]
	msg->data =  dat;               /*消息指针*/
30007f38:	e59d300c 	ldr	r3, [sp, #12]
30007f3c:	e59d2008 	ldr	r2, [sp, #8]
30007f40:	e5832018 	str	r2, [r3, #24]
	return 0;
30007f44:	e3a03000 	mov	r3, #0
}
30007f48:	e1a00003 	mov	r0, r3
30007f4c:	e28dd010 	add	sp, sp, #16
30007f50:	e12fff1e 	bx	lr

30007f54 <acoral_msgctr_create>:
/*==================================
 *
 *   消息创建
 *==================================*/
acoral_msgctr_t*  acoral_msgctr_create (acoral_u32 *err)
{
30007f54:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007f58:	e24dd014 	sub	sp, sp, #20
30007f5c:	e58d0004 	str	r0, [sp, #4]
	acoral_msgctr_t *msgctr;

	msgctr = acoral_alloc_msgctr();
30007f60:	ebffff4b 	bl	30007c94 <acoral_alloc_msgctr>
30007f64:	e1a03000 	mov	r3, r0
30007f68:	e58d300c 	str	r3, [sp, #12]

	if (msgctr == NULL)
30007f6c:	e59d300c 	ldr	r3, [sp, #12]
30007f70:	e3530000 	cmp	r3, #0
30007f74:	1a000001 	bne	30007f80 <acoral_msgctr_create+0x2c>
		return NULL;
30007f78:	e3a03000 	mov	r3, #0
30007f7c:	ea000029 	b	30008028 <acoral_msgctr_create+0xd4>

	msgctr->name  = NULL;
30007f80:	e59d300c 	ldr	r3, [sp, #12]
30007f84:	e3a02000 	mov	r2, #0
30007f88:	e5832004 	str	r2, [r3, #4]
	msgctr->type  = ACORAL_MSGCTR;
30007f8c:	e59d300c 	ldr	r3, [sp, #12]
30007f90:	e3a02001 	mov	r2, #1
30007f94:	e5c32008 	strb	r2, [r3, #8]
	msgctr->count = 0;
30007f98:	e59d300c 	ldr	r3, [sp, #12]
30007f9c:	e3a02000 	mov	r2, #0
30007fa0:	e5832018 	str	r2, [r3, #24]
	msgctr->wait_thread_num = 0;
30007fa4:	e59d300c 	ldr	r3, [sp, #12]
30007fa8:	e3a02000 	mov	r2, #0
30007fac:	e583201c 	str	r2, [r3, #28]

	acoral_init_list(&msgctr->msgctr_list);
30007fb0:	e59d300c 	ldr	r3, [sp, #12]
30007fb4:	e283200c 	add	r2, r3, #12
30007fb8:	e59d300c 	ldr	r3, [sp, #12]
30007fbc:	e583200c 	str	r2, [r3, #12]
30007fc0:	e59d300c 	ldr	r3, [sp, #12]
30007fc4:	e283200c 	add	r2, r3, #12
30007fc8:	e59d300c 	ldr	r3, [sp, #12]
30007fcc:	e5832010 	str	r2, [r3, #16]
	acoral_init_list(&msgctr->msglist);
30007fd0:	e59d300c 	ldr	r3, [sp, #12]
30007fd4:	e2832028 	add	r2, r3, #40	; 0x28
30007fd8:	e59d300c 	ldr	r3, [sp, #12]
30007fdc:	e5832028 	str	r2, [r3, #40]	; 0x28
30007fe0:	e59d300c 	ldr	r3, [sp, #12]
30007fe4:	e2832028 	add	r2, r3, #40	; 0x28
30007fe8:	e59d300c 	ldr	r3, [sp, #12]
30007fec:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_init_list(&msgctr->waiting);
30007ff0:	e59d300c 	ldr	r3, [sp, #12]
30007ff4:	e2832020 	add	r2, r3, #32
30007ff8:	e59d300c 	ldr	r3, [sp, #12]
30007ffc:	e5832020 	str	r2, [r3, #32]
30008000:	e59d300c 	ldr	r3, [sp, #12]
30008004:	e2832020 	add	r2, r3, #32
30008008:	e59d300c 	ldr	r3, [sp, #12]
3000800c:	e5832024 	str	r2, [r3, #36]	; 0x24
	acoral_spin_init(&(msgctr->msgctr_list.lock));
	acoral_spin_init(&(msgctr->msglist.lock));
	acoral_spin_init(&(msgctr->waiting.lock));

	acoral_spin_init(&msgctr->spin_lock);
	acoral_list_add2_tail (&msgctr->msgctr_list, &(g_msgctr_header.head));
30008010:	e59d300c 	ldr	r3, [sp, #12]
30008014:	e283300c 	add	r3, r3, #12
30008018:	e1a00003 	mov	r0, r3
3000801c:	e59f1014 	ldr	r1, [pc, #20]	; 30008038 <acoral_msgctr_create+0xe4>
30008020:	eb00086d 	bl	3000a1dc <acoral_list_add2_tail>
	return msgctr;
30008024:	e59d300c 	ldr	r3, [sp, #12]
}
30008028:	e1a00003 	mov	r0, r3
3000802c:	e28dd014 	add	sp, sp, #20
30008030:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008034:	e12fff1e 	bx	lr
30008038:	3000f584 	.word	0x3000f584

3000803c <acoral_msg_create>:

acoral_msg_t* acoral_msg_create (
		acoral_u32 n, acoral_u32 *err, acoral_u32 id, 
		acoral_u32 nTtl/* = 0*/, void* dat /*= NULL*/)
{
3000803c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008040:	e24dd01c 	sub	sp, sp, #28
30008044:	e58d000c 	str	r0, [sp, #12]
30008048:	e58d1008 	str	r1, [sp, #8]
3000804c:	e58d2004 	str	r2, [sp, #4]
30008050:	e58d3000 	str	r3, [sp]
	acoral_msg_t *msg;

	msg = acoral_alloc_msg();
30008054:	ebffff16 	bl	30007cb4 <acoral_alloc_msg>
30008058:	e1a03000 	mov	r3, r0
3000805c:	e58d3014 	str	r3, [sp, #20]

	if (msg == NULL)
30008060:	e59d3014 	ldr	r3, [sp, #20]
30008064:	e3530000 	cmp	r3, #0
30008068:	1a000001 	bne	30008074 <acoral_msg_create+0x38>
		return NULL;
3000806c:	e3a03000 	mov	r3, #0
30008070:	ea000014 	b	300080c8 <acoral_msg_create+0x8c>

	msg->id   =  id;                 /*消息标识*/
30008074:	e59d3014 	ldr	r3, [sp, #20]
30008078:	e59d2004 	ldr	r2, [sp, #4]
3000807c:	e583200c 	str	r2, [r3, #12]
	msg->n    =  n;                  /*消息被接收次数*/
30008080:	e59d3014 	ldr	r3, [sp, #20]
30008084:	e59d200c 	ldr	r2, [sp, #12]
30008088:	e5832010 	str	r2, [r3, #16]
	msg->ttl  =  nTtl;               /*消息生存周期*/
3000808c:	e59d3014 	ldr	r3, [sp, #20]
30008090:	e59d2000 	ldr	r2, [sp]
30008094:	e5832014 	str	r2, [r3, #20]
	msg->data =  dat;                /*消息指针*/
30008098:	e59d3014 	ldr	r3, [sp, #20]
3000809c:	e59d2020 	ldr	r2, [sp, #32]
300080a0:	e5832018 	str	r2, [r3, #24]
	acoral_init_list(&msg->msglist);
300080a4:	e59d3014 	ldr	r3, [sp, #20]
300080a8:	e2832004 	add	r2, r3, #4
300080ac:	e59d3014 	ldr	r3, [sp, #20]
300080b0:	e5832004 	str	r2, [r3, #4]
300080b4:	e59d3014 	ldr	r3, [sp, #20]
300080b8:	e2832004 	add	r2, r3, #4
300080bc:	e59d3014 	ldr	r3, [sp, #20]
300080c0:	e5832008 	str	r2, [r3, #8]
	return msg;
300080c4:	e59d3014 	ldr	r3, [sp, #20]
}
300080c8:	e1a00003 	mov	r0, r3
300080cc:	e28dd01c 	add	sp, sp, #28
300080d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300080d4:	e12fff1e 	bx	lr

300080d8 <acoral_msg_send>:
/*===================================
 * 
 *   消息发送
 *===================================*/
acoral_u32 acoral_msg_send(acoral_msgctr_t* msgctr, acoral_msg_t* msg)
{
300080d8:	e92d4010 	push	{r4, lr}
300080dc:	e24dd010 	sub	sp, sp, #16
300080e0:	e58d0004 	str	r0, [sp, #4]
300080e4:	e58d1000 	str	r1, [sp]
	acoral_sr     cpu_sr;
	
/*	if (acoral_intr_nesting > 0)
		return MST_ERR_INTR;
*/
	HAL_ENTER_CRITICAL();
300080e8:	ebffe581 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300080ec:	e1a03000 	mov	r3, r0
300080f0:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&msgctr->spin_lock);

	if (NULL == msgctr)
300080f4:	e59d3004 	ldr	r3, [sp, #4]
300080f8:	e3530000 	cmp	r3, #0
300080fc:	1a000003 	bne	30008110 <acoral_msg_send+0x38>
	{
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
30008100:	e59d000c 	ldr	r0, [sp, #12]
30008104:	ebffe578 	bl	300016ec <HAL_INTR_RESTORE>
		return MST_ERR_NULL;
30008108:	e3a03000 	mov	r3, #0
3000810c:	ea000032 	b	300081dc <acoral_msg_send+0x104>
	}

	if (NULL == msg)
30008110:	e59d3000 	ldr	r3, [sp]
30008114:	e3530000 	cmp	r3, #0
30008118:	1a000003 	bne	3000812c <acoral_msg_send+0x54>
	{
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
3000811c:	e59d000c 	ldr	r0, [sp, #12]
30008120:	ebffe571 	bl	300016ec <HAL_INTR_RESTORE>
		return MSG_ERR_NULL;
30008124:	e3a03007 	mov	r3, #7
30008128:	ea00002b 	b	300081dc <acoral_msg_send+0x104>
	}

	/*----------------*/
	/*   消息数限制*/
	/*----------------*/
	if (ACORAL_MESSAGE_MAX_COUNT <= msgctr->count)
3000812c:	e59d3004 	ldr	r3, [sp, #4]
30008130:	e5933018 	ldr	r3, [r3, #24]
30008134:	e3530009 	cmp	r3, #9
30008138:	9a000003 	bls	3000814c <acoral_msg_send+0x74>
	{
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
3000813c:	e59d000c 	ldr	r0, [sp, #12]
30008140:	ebffe569 	bl	300016ec <HAL_INTR_RESTORE>
		return MSG_ERR_COUNT;
30008144:	e3a03003 	mov	r3, #3
30008148:	ea000023 	b	300081dc <acoral_msg_send+0x104>
	}

	/*----------------*/
	/*   增加消息*/
	/*----------------*/
	msgctr->count++;
3000814c:	e59d3004 	ldr	r3, [sp, #4]
30008150:	e5933018 	ldr	r3, [r3, #24]
30008154:	e2832001 	add	r2, r3, #1
30008158:	e59d3004 	ldr	r3, [sp, #4]
3000815c:	e5832018 	str	r2, [r3, #24]
	msg->ttl += acoral_get_ticks();
30008160:	e59d3000 	ldr	r3, [sp]
30008164:	e5934014 	ldr	r4, [r3, #20]
30008168:	ebfff0e5 	bl	30004504 <acoral_get_ticks>
3000816c:	e1a03000 	mov	r3, r0
30008170:	e0842003 	add	r2, r4, r3
30008174:	e59d3000 	ldr	r3, [sp]
30008178:	e5832014 	str	r2, [r3, #20]
	acoral_list_add2_tail(&msg->msglist, &msgctr->msglist);
3000817c:	e59d3000 	ldr	r3, [sp]
30008180:	e2832004 	add	r2, r3, #4
30008184:	e59d3004 	ldr	r3, [sp, #4]
30008188:	e2833028 	add	r3, r3, #40	; 0x28
3000818c:	e1a00002 	mov	r0, r2
30008190:	e1a01003 	mov	r1, r3
30008194:	eb000810 	bl	3000a1dc <acoral_list_add2_tail>

	/*----------------*/
	/*   唤醒等待*/
	/*----------------*/
	if (msgctr->wait_thread_num > 0)
30008198:	e59d3004 	ldr	r3, [sp, #4]
3000819c:	e593301c 	ldr	r3, [r3, #28]
300081a0:	e3530000 	cmp	r3, #0
300081a4:	0a000008 	beq	300081cc <acoral_msg_send+0xf4>
	{
		/* 此处将最高优先级唤醒*/
		wake_up_thread(&msgctr->waiting);
300081a8:	e59d3004 	ldr	r3, [sp, #4]
300081ac:	e2833020 	add	r3, r3, #32
300081b0:	e1a00003 	mov	r0, r3
300081b4:	eb000103 	bl	300085c8 <wake_up_thread>
		msgctr->wait_thread_num--;
300081b8:	e59d3004 	ldr	r3, [sp, #4]
300081bc:	e593301c 	ldr	r3, [r3, #28]
300081c0:	e2432001 	sub	r2, r3, #1
300081c4:	e59d3004 	ldr	r3, [sp, #4]
300081c8:	e583201c 	str	r2, [r3, #28]
	}
	acoral_spin_unlock(&msgctr->spin_lock);
	HAL_EXIT_CRITICAL();
300081cc:	e59d000c 	ldr	r0, [sp, #12]
300081d0:	ebffe545 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
300081d4:	ebffe88d 	bl	30002410 <acoral_sched>
	return MSGCTR_SUCCED;
300081d8:	e3a03004 	mov	r3, #4
}
300081dc:	e1a00003 	mov	r0, r3
300081e0:	e28dd010 	add	sp, sp, #16
300081e4:	e8bd4010 	pop	{r4, lr}
300081e8:	e12fff1e 	bx	lr

300081ec <acoral_msg_recv>:
 *===================================*/
void* acoral_msg_recv (acoral_msgctr_t* msgctr,
						acoral_u32  id,
						acoral_time  timeout,
						acoral_u32  *err)
{
300081ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300081f0:	e24dd02c 	sub	sp, sp, #44	; 0x2c
300081f4:	e58d000c 	str	r0, [sp, #12]
300081f8:	e58d1008 	str	r1, [sp, #8]
300081fc:	e58d2004 	str	r2, [sp, #4]
30008200:	e58d3000 	str	r3, [sp]
	acoral_sr        cpu_sr;
	acoral_list_t    *p, *q;
	acoral_msg_t     *pmsg;
	acoral_thread_t  *cur;

	if (acoral_intr_nesting > 0)
30008204:	ebffe555 	bl	30001760 <hal_get_intr_nesting_comm>
30008208:	e1a03000 	mov	r3, r0
3000820c:	e3530000 	cmp	r3, #0
30008210:	da000004 	ble	30008228 <acoral_msg_recv+0x3c>
	{
		*err = MST_ERR_INTR;
30008214:	e59d3000 	ldr	r3, [sp]
30008218:	e3a02001 	mov	r2, #1
3000821c:	e5832000 	str	r2, [r3]
		return NULL;
30008220:	e3a03000 	mov	r3, #0
30008224:	ea000080 	b	3000842c <acoral_msg_recv+0x240>
	}
	if (NULL == msgctr)
30008228:	e59d300c 	ldr	r3, [sp, #12]
3000822c:	e3530000 	cmp	r3, #0
30008230:	1a000004 	bne	30008248 <acoral_msg_recv+0x5c>
	{
		*err = MST_ERR_NULL;
30008234:	e59d3000 	ldr	r3, [sp]
30008238:	e3a02000 	mov	r2, #0
3000823c:	e5832000 	str	r2, [r3]
		return NULL;
30008240:	e3a03000 	mov	r3, #0
30008244:	ea000078 	b	3000842c <acoral_msg_recv+0x240>
	}

	cur = acoral_cur_thread;
30008248:	e59f31ec 	ldr	r3, [pc, #492]	; 3000843c <acoral_msg_recv+0x250>
3000824c:	e5933000 	ldr	r3, [r3]
30008250:	e58d3024 	str	r3, [sp, #36]	; 0x24

	HAL_ENTER_CRITICAL();
30008254:	ebffe526 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008258:	e1a03000 	mov	r3, r0
3000825c:	e58d3014 	str	r3, [sp, #20]
	acoral_spin_lock(&msgctr->spin_lock);
	if(timeout>0){
30008260:	e59d3004 	ldr	r3, [sp, #4]
30008264:	e3530000 	cmp	r3, #0
30008268:	0a000013 	beq	300082bc <acoral_msg_recv+0xd0>
		cur->delay = TIME_TO_TICKS(timeout);
3000826c:	e59d2004 	ldr	r2, [sp, #4]
30008270:	e1a03002 	mov	r3, r2
30008274:	e1a03103 	lsl	r3, r3, #2
30008278:	e0833002 	add	r3, r3, r2
3000827c:	e1a02103 	lsl	r2, r3, #2
30008280:	e0833002 	add	r3, r3, r2
30008284:	e1a03103 	lsl	r3, r3, #2
30008288:	e1a02003 	mov	r2, r3
3000828c:	e59f31ac 	ldr	r3, [pc, #428]	; 30008440 <acoral_msg_recv+0x254>
30008290:	e0831392 	umull	r1, r3, r2, r3
30008294:	e1a03323 	lsr	r3, r3, #6
30008298:	e1a02003 	mov	r2, r3
3000829c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300082a0:	e5832040 	str	r2, [r3, #64]	; 0x40
		timeout_queue_add( cur);
300082a4:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
300082a8:	ebfff154 	bl	30004800 <timeout_queue_add>
300082ac:	ea000002 	b	300082bc <acoral_msg_recv+0xd0>
		acoral_spin_lock(&msgctr->spin_lock);
	
		if (timeout>0&&(acoral_32)cur->delay <=0 )
			break;

	}
300082b0:	e1a00000 	nop			; (mov r0, r0)
300082b4:	ea000000 	b	300082bc <acoral_msg_recv+0xd0>
300082b8:	e1a00000 	nop			; (mov r0, r0)
		cur->delay = TIME_TO_TICKS(timeout);
		timeout_queue_add( cur);
	}
	while(1)
	{
		p = &msgctr->msglist;
300082bc:	e59d300c 	ldr	r3, [sp, #12]
300082c0:	e2833028 	add	r3, r3, #40	; 0x28
300082c4:	e58d3018 	str	r3, [sp, #24]
		q = p->next;
300082c8:	e59d3018 	ldr	r3, [sp, #24]
300082cc:	e5933000 	ldr	r3, [r3]
300082d0:	e58d301c 	str	r3, [sp, #28]
		for( ;p != q; q = q->next)
300082d4:	ea000026 	b	30008374 <acoral_msg_recv+0x188>
		{
			pmsg = list_entry( q, acoral_msg_t, msglist);
300082d8:	e59d301c 	ldr	r3, [sp, #28]
300082dc:	e2433004 	sub	r3, r3, #4
300082e0:	e58d3020 	str	r3, [sp, #32]
			if ( (pmsg->id == id) && (pmsg->n > 0))
300082e4:	e59d3020 	ldr	r3, [sp, #32]
300082e8:	e593200c 	ldr	r2, [r3, #12]
300082ec:	e59d3008 	ldr	r3, [sp, #8]
300082f0:	e1520003 	cmp	r2, r3
300082f4:	1a00001b 	bne	30008368 <acoral_msg_recv+0x17c>
300082f8:	e59d3020 	ldr	r3, [sp, #32]
300082fc:	e5933010 	ldr	r3, [r3, #16]
30008300:	e3530000 	cmp	r3, #0
30008304:	0a000017 	beq	30008368 <acoral_msg_recv+0x17c>
			{
				/*-----------------*/
				/* 有接收消息*/
				/*-----------------*/
				pmsg->n--;
30008308:	e59d3020 	ldr	r3, [sp, #32]
3000830c:	e5933010 	ldr	r3, [r3, #16]
30008310:	e2432001 	sub	r2, r3, #1
30008314:	e59d3020 	ldr	r3, [sp, #32]
30008318:	e5832010 	str	r2, [r3, #16]
				/*-----------------*/
				/* 延时列表删除*/
				/*-----------------*/
				timeout_queue_del(cur);
3000831c:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
30008320:	ebfff178 	bl	30004908 <timeout_queue_del>
				dat = pmsg->data;
30008324:	e59d3020 	ldr	r3, [sp, #32]
30008328:	e5933018 	ldr	r3, [r3, #24]
3000832c:	e58d3010 	str	r3, [sp, #16]
				acoral_list_del (q);
30008330:	e59d001c 	ldr	r0, [sp, #28]
30008334:	eb0007bb 	bl	3000a228 <acoral_list_del>
				acoral_release_res ((acoral_res_t *)pmsg);		
30008338:	e59d3020 	ldr	r3, [sp, #32]
3000833c:	e1a00003 	mov	r0, r3
30008340:	ebffecb6 	bl	30003620 <acoral_release_res>
				msgctr->count--;
30008344:	e59d300c 	ldr	r3, [sp, #12]
30008348:	e5933018 	ldr	r3, [r3, #24]
3000834c:	e2432001 	sub	r2, r3, #1
30008350:	e59d300c 	ldr	r3, [sp, #12]
30008354:	e5832018 	str	r2, [r3, #24]
				acoral_spin_unlock(&msgctr->spin_lock);
				HAL_EXIT_CRITICAL();
30008358:	e59d0014 	ldr	r0, [sp, #20]
3000835c:	ebffe4e2 	bl	300016ec <HAL_INTR_RESTORE>
				return dat;
30008360:	e59d3010 	ldr	r3, [sp, #16]
30008364:	ea000030 	b	3000842c <acoral_msg_recv+0x240>
	}
	while(1)
	{
		p = &msgctr->msglist;
		q = p->next;
		for( ;p != q; q = q->next)
30008368:	e59d301c 	ldr	r3, [sp, #28]
3000836c:	e5933000 	ldr	r3, [r3]
30008370:	e58d301c 	str	r3, [sp, #28]
30008374:	e59d2018 	ldr	r2, [sp, #24]
30008378:	e59d301c 	ldr	r3, [sp, #28]
3000837c:	e1520003 	cmp	r2, r3
30008380:	1affffd4 	bne	300082d8 <acoral_msg_recv+0xec>
		}
	
		/*-----------------*/
		/*  没有接收消息*/
		/*-----------------*/
		msgctr->wait_thread_num++;
30008384:	e59d300c 	ldr	r3, [sp, #12]
30008388:	e593301c 	ldr	r3, [r3, #28]
3000838c:	e2832001 	add	r2, r3, #1
30008390:	e59d300c 	ldr	r3, [sp, #12]
30008394:	e583201c 	str	r2, [r3, #28]
		acoral_msgctr_queue_add(msgctr, cur);
30008398:	e59d000c 	ldr	r0, [sp, #12]
3000839c:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
300083a0:	ebfffe4b 	bl	30007cd4 <acoral_msgctr_queue_add>
		acoral_unrdy_thread(cur);
300083a4:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
300083a8:	ebffe9ff 	bl	30002bac <acoral_unrdy_thread>
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
300083ac:	e59d0014 	ldr	r0, [sp, #20]
300083b0:	ebffe4cd 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_sched();
300083b4:	ebffe815 	bl	30002410 <acoral_sched>
		/*-----------------*/
		/*  看有没有超时*/
		/*-----------------*/
		HAL_ENTER_CRITICAL();
300083b8:	ebffe4cd 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300083bc:	e1a03000 	mov	r3, r0
300083c0:	e58d3014 	str	r3, [sp, #20]
		acoral_spin_lock(&msgctr->spin_lock);
	
		if (timeout>0&&(acoral_32)cur->delay <=0 )
300083c4:	e59d3004 	ldr	r3, [sp, #4]
300083c8:	e3530000 	cmp	r3, #0
300083cc:	0affffb7 	beq	300082b0 <acoral_msg_recv+0xc4>
300083d0:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300083d4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300083d8:	e3530000 	cmp	r3, #0
300083dc:	caffffb5 	bgt	300082b8 <acoral_msg_recv+0xcc>

	/*---------------*/
	/*  超时退出*/
	/*---------------*/
//	timeout_queue_del(cur);
	if(msgctr->wait_thread_num>0)
300083e0:	e59d300c 	ldr	r3, [sp, #12]
300083e4:	e593301c 	ldr	r3, [r3, #28]
300083e8:	e3530000 	cmp	r3, #0
300083ec:	0a000004 	beq	30008404 <acoral_msg_recv+0x218>
		msgctr->wait_thread_num--;
300083f0:	e59d300c 	ldr	r3, [sp, #12]
300083f4:	e593301c 	ldr	r3, [r3, #28]
300083f8:	e2432001 	sub	r2, r3, #1
300083fc:	e59d300c 	ldr	r3, [sp, #12]
30008400:	e583201c 	str	r2, [r3, #28]
	acoral_list_del(&cur->waiting);
30008404:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30008408:	e2833020 	add	r3, r3, #32
3000840c:	e1a00003 	mov	r0, r3
30008410:	eb000784 	bl	3000a228 <acoral_list_del>
	acoral_spin_unlock(&msgctr->spin_lock);
	HAL_EXIT_CRITICAL();
30008414:	e59d0014 	ldr	r0, [sp, #20]
30008418:	ebffe4b3 	bl	300016ec <HAL_INTR_RESTORE>
	*err = MST_ERR_TIMEOUT;
3000841c:	e59d3000 	ldr	r3, [sp]
30008420:	e3a02002 	mov	r2, #2
30008424:	e5832000 	str	r2, [r3]
	return NULL;
30008428:	e3a03000 	mov	r3, #0

}
3000842c:	e1a00003 	mov	r0, r3
30008430:	e28dd02c 	add	sp, sp, #44	; 0x2c
30008434:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008438:	e12fff1e 	bx	lr
3000843c:	30010630 	.word	0x30010630
30008440:	10624dd3 	.word	0x10624dd3

30008444 <acoral_msgctr_del>:
/*===================================
 *
 *  消息删除
 *===================================*/
acoral_u32 acoral_msgctr_del(acoral_msgctr_t* pmsgctr, acoral_u32 flag)
{
30008444:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008448:	e24dd01c 	sub	sp, sp, #28
3000844c:	e58d0004 	str	r0, [sp, #4]
30008450:	e58d1000 	str	r1, [sp]
	acoral_list_t    *p, *q;
	acoral_thread_t  *thread;
	acoral_msg_t     *pmsg;
	
	if(NULL == pmsgctr)
30008454:	e59d3004 	ldr	r3, [sp, #4]
30008458:	e3530000 	cmp	r3, #0
3000845c:	1a000001 	bne	30008468 <acoral_msgctr_del+0x24>
		return MST_ERR_NULL;
30008460:	e3a03000 	mov	r3, #0
30008464:	ea000045 	b	30008580 <acoral_msgctr_del+0x13c>
	if (flag == MST_DEL_UNFORCE)
30008468:	e59d3000 	ldr	r3, [sp]
3000846c:	e3530000 	cmp	r3, #0
30008470:	1a00000d 	bne	300084ac <acoral_msgctr_del+0x68>
	{
		if ((pmsgctr->count > 0) || (pmsgctr->wait_thread_num > 0))
30008474:	e59d3004 	ldr	r3, [sp, #4]
30008478:	e5933018 	ldr	r3, [r3, #24]
3000847c:	e3530000 	cmp	r3, #0
30008480:	1a000003 	bne	30008494 <acoral_msgctr_del+0x50>
30008484:	e59d3004 	ldr	r3, [sp, #4]
30008488:	e593301c 	ldr	r3, [r3, #28]
3000848c:	e3530000 	cmp	r3, #0
30008490:	0a000001 	beq	3000849c <acoral_msgctr_del+0x58>
			return MST_ERR_UNDEF;
30008494:	e3a03003 	mov	r3, #3
30008498:	ea000038 	b	30008580 <acoral_msgctr_del+0x13c>
		else
			acoral_release_res((acoral_res_t *)pmsgctr);
3000849c:	e59d3004 	ldr	r3, [sp, #4]
300084a0:	e1a00003 	mov	r0, r3
300084a4:	ebffec5d 	bl	30003620 <acoral_release_res>
300084a8:	ea000033 	b	3000857c <acoral_msgctr_del+0x138>
	}
	else
	{
		// 释放等待进程
		if (pmsgctr->wait_thread_num > 0)
300084ac:	e59d3004 	ldr	r3, [sp, #4]
300084b0:	e593301c 	ldr	r3, [r3, #28]
300084b4:	e3530000 	cmp	r3, #0
300084b8:	0a000012 	beq	30008508 <acoral_msgctr_del+0xc4>
		{
			p = &pmsgctr->waiting;
300084bc:	e59d3004 	ldr	r3, [sp, #4]
300084c0:	e2833020 	add	r3, r3, #32
300084c4:	e58d3008 	str	r3, [sp, #8]
			q = p->next;
300084c8:	e59d3008 	ldr	r3, [sp, #8]
300084cc:	e5933000 	ldr	r3, [r3]
300084d0:	e58d300c 	str	r3, [sp, #12]
			for(; q != p; q = q->next)
300084d4:	ea000007 	b	300084f8 <acoral_msgctr_del+0xb4>
			{
				thread=list_entry( q, acoral_thread_t, waiting);
300084d8:	e59d300c 	ldr	r3, [sp, #12]
300084dc:	e2433020 	sub	r3, r3, #32
300084e0:	e58d3010 	str	r3, [sp, #16]
				//acoral_list_del  (&thread->waiting);
				acoral_rdy_thread(thread);
300084e4:	e59d0010 	ldr	r0, [sp, #16]
300084e8:	ebffe9a0 	bl	30002b70 <acoral_rdy_thread>
		// 释放等待进程
		if (pmsgctr->wait_thread_num > 0)
		{
			p = &pmsgctr->waiting;
			q = p->next;
			for(; q != p; q = q->next)
300084ec:	e59d300c 	ldr	r3, [sp, #12]
300084f0:	e5933000 	ldr	r3, [r3]
300084f4:	e58d300c 	str	r3, [sp, #12]
300084f8:	e59d200c 	ldr	r2, [sp, #12]
300084fc:	e59d3008 	ldr	r3, [sp, #8]
30008500:	e1520003 	cmp	r2, r3
30008504:	1afffff3 	bne	300084d8 <acoral_msgctr_del+0x94>
				acoral_rdy_thread(thread);
			}
		}
		
		// 释放消息结构
		if (pmsgctr->count > 0)
30008508:	e59d3004 	ldr	r3, [sp, #4]
3000850c:	e5933018 	ldr	r3, [r3, #24]
30008510:	e3530000 	cmp	r3, #0
30008514:	0a000015 	beq	30008570 <acoral_msgctr_del+0x12c>
		{
			p = &pmsgctr->msglist;
30008518:	e59d3004 	ldr	r3, [sp, #4]
3000851c:	e2833028 	add	r3, r3, #40	; 0x28
30008520:	e58d3008 	str	r3, [sp, #8]
			q = p->next;
30008524:	e59d3008 	ldr	r3, [sp, #8]
30008528:	e5933000 	ldr	r3, [r3]
3000852c:	e58d300c 	str	r3, [sp, #12]
			for( ;p != q; q = p->next)
30008530:	ea00000a 	b	30008560 <acoral_msgctr_del+0x11c>
			{
				pmsg = list_entry( q, acoral_msg_t, msglist);
30008534:	e59d300c 	ldr	r3, [sp, #12]
30008538:	e2433004 	sub	r3, r3, #4
3000853c:	e58d3014 	str	r3, [sp, #20]
				acoral_list_del (q);
30008540:	e59d000c 	ldr	r0, [sp, #12]
30008544:	eb000737 	bl	3000a228 <acoral_list_del>
				acoral_release_res ((acoral_res_t *)pmsg);		
30008548:	e59d3014 	ldr	r3, [sp, #20]
3000854c:	e1a00003 	mov	r0, r3
30008550:	ebffec32 	bl	30003620 <acoral_release_res>
		// 释放消息结构
		if (pmsgctr->count > 0)
		{
			p = &pmsgctr->msglist;
			q = p->next;
			for( ;p != q; q = p->next)
30008554:	e59d3008 	ldr	r3, [sp, #8]
30008558:	e5933000 	ldr	r3, [r3]
3000855c:	e58d300c 	str	r3, [sp, #12]
30008560:	e59d2008 	ldr	r2, [sp, #8]
30008564:	e59d300c 	ldr	r3, [sp, #12]
30008568:	e1520003 	cmp	r2, r3
3000856c:	1afffff0 	bne	30008534 <acoral_msgctr_del+0xf0>
				acoral_release_res ((acoral_res_t *)pmsg);		
			}		
		}
		
		// 释放资源
		acoral_release_res((acoral_res_t *)pmsgctr);
30008570:	e59d3004 	ldr	r3, [sp, #4]
30008574:	e1a00003 	mov	r0, r3
30008578:	ebffec28 	bl	30003620 <acoral_release_res>
3000857c:	eaffffff 	b	30008580 <acoral_msgctr_del+0x13c>
	}
}
30008580:	e1a00003 	mov	r0, r3
30008584:	e28dd01c 	add	sp, sp, #28
30008588:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000858c:	e12fff1e 	bx	lr

30008590 <acoral_msg_del>:

acoral_u32 acoral_msg_del(acoral_msg_t* pmsg)
{
30008590:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008594:	e24dd00c 	sub	sp, sp, #12
30008598:	e58d0004 	str	r0, [sp, #4]
	if (NULL != pmsg)
3000859c:	e59d3004 	ldr	r3, [sp, #4]
300085a0:	e3530000 	cmp	r3, #0
300085a4:	0a000002 	beq	300085b4 <acoral_msg_del+0x24>
		acoral_release_res ((acoral_res_t *)pmsg);
300085a8:	e59d3004 	ldr	r3, [sp, #4]
300085ac:	e1a00003 	mov	r0, r3
300085b0:	ebffec1a 	bl	30003620 <acoral_release_res>
	return 0;
300085b4:	e3a03000 	mov	r3, #0
}
300085b8:	e1a00003 	mov	r0, r3
300085bc:	e28dd00c 	add	sp, sp, #12
300085c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300085c4:	e12fff1e 	bx	lr

300085c8 <wake_up_thread>:
/*==========================
 *
 *  唤醒最高优先等待线程
 *==========================*/
void wake_up_thread(acoral_list_t  *head)
{
300085c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300085cc:	e24dd01c 	sub	sp, sp, #28
300085d0:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t    *p, *q;
	acoral_thread_t  *thread;

	p = head;
300085d4:	e59d3004 	ldr	r3, [sp, #4]
300085d8:	e58d300c 	str	r3, [sp, #12]
	q = p->next;
300085dc:	e59d300c 	ldr	r3, [sp, #12]
300085e0:	e5933000 	ldr	r3, [r3]
300085e4:	e58d3010 	str	r3, [sp, #16]
	thread=list_entry( q, acoral_thread_t, waiting);
300085e8:	e59d3010 	ldr	r3, [sp, #16]
300085ec:	e2433020 	sub	r3, r3, #32
300085f0:	e58d3014 	str	r3, [sp, #20]
	acoral_list_del  (&thread->waiting);
300085f4:	e59d3014 	ldr	r3, [sp, #20]
300085f8:	e2833020 	add	r3, r3, #32
300085fc:	e1a00003 	mov	r0, r3
30008600:	eb000708 	bl	3000a228 <acoral_list_del>
	acoral_rdy_thread(thread);
30008604:	e59d0014 	ldr	r0, [sp, #20]
30008608:	ebffe958 	bl	30002b70 <acoral_rdy_thread>
}
3000860c:	e28dd01c 	add	sp, sp, #28
30008610:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008614:	e12fff1e 	bx	lr

30008618 <acoral_print_all_msg>:
/*======================*/
/**/
/*  输出事件容器上全部消息*/
/*======================*/
void acoral_print_all_msg(acoral_msgctr_t* msgctr)
{
30008618:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000861c:	e24dd01c 	sub	sp, sp, #28
30008620:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t *p, *q;
	acoral_msg_t  *pmsg;

	acoral_doMsgTtl_checked = DO_CHECKED_TRUE;
30008624:	e59f3074 	ldr	r3, [pc, #116]	; 300086a0 <acoral_print_all_msg+0x88>
30008628:	e3a02000 	mov	r2, #0
3000862c:	e5832000 	str	r2, [r3]

	p = &msgctr->msglist;
30008630:	e59d3004 	ldr	r3, [sp, #4]
30008634:	e2833028 	add	r3, r3, #40	; 0x28
30008638:	e58d300c 	str	r3, [sp, #12]
	q = p->next;
3000863c:	e59d300c 	ldr	r3, [sp, #12]
30008640:	e5933000 	ldr	r3, [r3]
30008644:	e58d3010 	str	r3, [sp, #16]
	for( ;p != q; q = q->next)
30008648:	ea00000a 	b	30008678 <acoral_print_all_msg+0x60>
	{
		pmsg = list_entry( q, acoral_msg_t, msglist);
3000864c:	e59d3010 	ldr	r3, [sp, #16]
30008650:	e2433004 	sub	r3, r3, #4
30008654:	e58d3014 	str	r3, [sp, #20]
		acoral_print ("\nid = %d", pmsg->id);
30008658:	e59d3014 	ldr	r3, [sp, #20]
3000865c:	e593300c 	ldr	r3, [r3, #12]
30008660:	e59f003c 	ldr	r0, [pc, #60]	; 300086a4 <acoral_print_all_msg+0x8c>
30008664:	e1a01003 	mov	r1, r3
30008668:	eb000b6d 	bl	3000b424 <acoral_print>

	acoral_doMsgTtl_checked = DO_CHECKED_TRUE;

	p = &msgctr->msglist;
	q = p->next;
	for( ;p != q; q = q->next)
3000866c:	e59d3010 	ldr	r3, [sp, #16]
30008670:	e5933000 	ldr	r3, [r3]
30008674:	e58d3010 	str	r3, [sp, #16]
30008678:	e59d200c 	ldr	r2, [sp, #12]
3000867c:	e59d3010 	ldr	r3, [sp, #16]
30008680:	e1520003 	cmp	r2, r3
30008684:	1afffff0 	bne	3000864c <acoral_print_all_msg+0x34>
	{
		pmsg = list_entry( q, acoral_msg_t, msglist);
		acoral_print ("\nid = %d", pmsg->id);
	}

	acoral_doMsgTtl_checked = DO_CHECKED_FALSE;
30008688:	e59f3010 	ldr	r3, [pc, #16]	; 300086a0 <acoral_print_all_msg+0x88>
3000868c:	e3a02001 	mov	r2, #1
30008690:	e5832000 	str	r2, [r3]

}
30008694:	e28dd01c 	add	sp, sp, #28
30008698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000869c:	e12fff1e 	bx	lr
300086a0:	3000ec7c 	.word	0x3000ec7c
300086a4:	3000e808 	.word	0x3000e808

300086a8 <acoral_print_waitThreadsNum>:
/*======================*/
/**/
/*  输出等待任务数目*/
/*======================*/
void acoral_print_waitThreadsNum(acoral_msgctr_t* msgctr)
{
300086a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300086ac:	e24dd00c 	sub	sp, sp, #12
300086b0:	e58d0004 	str	r0, [sp, #4]
	acoral_print("\n wait threads mum = %d", msgctr->wait_thread_num);
300086b4:	e59d3004 	ldr	r3, [sp, #4]
300086b8:	e593301c 	ldr	r3, [r3, #28]
300086bc:	e59f0010 	ldr	r0, [pc, #16]	; 300086d4 <acoral_print_waitThreadsNum+0x2c>
300086c0:	e1a01003 	mov	r1, r3
300086c4:	eb000b56 	bl	3000b424 <acoral_print>
}
300086c8:	e28dd00c 	add	sp, sp, #12
300086cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300086d0:	e12fff1e 	bx	lr
300086d4:	3000e814 	.word	0x3000e814

300086d8 <rm_policy_thread_init>:
struct{
	acoral_u32 num;
	acoral_fl sum;
}left[HAL_MAX_CPU];

acoral_id rm_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
300086d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300086dc:	e24dd024 	sub	sp, sp, #36	; 0x24
300086e0:	e58d000c 	str	r0, [sp, #12]
300086e4:	e58d1008 	str	r1, [sp, #8]
300086e8:	e58d2004 	str	r2, [sp, #4]
300086ec:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_rm_policy_data_t *policy_data;
	rm_policy_data_t *private_data;
	policy_data=(acoral_rm_policy_data_t *)data;
300086f0:	e59d3000 	ldr	r3, [sp]
300086f4:	e58d3018 	str	r3, [sp, #24]
	private_data=(rm_policy_data_t *)acoral_malloc2(sizeof(rm_policy_data_t));
300086f8:	e3a0001c 	mov	r0, #28
300086fc:	ebfff9bf 	bl	30006e00 <v_malloc>
30008700:	e1a03000 	mov	r3, r0
30008704:	e58d301c 	str	r3, [sp, #28]
	if(private_data==NULL){
30008708:	e59d301c 	ldr	r3, [sp, #28]
3000870c:	e3530000 	cmp	r3, #0
30008710:	1a00000e 	bne	30008750 <rm_policy_thread_init+0x78>
		acoral_printerr("No level2 mem space for private_data:%s\n",thread->name);
30008714:	e59d300c 	ldr	r3, [sp, #12]
30008718:	e5933048 	ldr	r3, [r3, #72]	; 0x48
3000871c:	e59f00f8 	ldr	r0, [pc, #248]	; 3000881c <rm_policy_thread_init+0x144>
30008720:	e1a01003 	mov	r1, r3
30008724:	eb000b3e 	bl	3000b424 <acoral_print>
		HAL_ENTER_CRITICAL();
30008728:	ebffe3f1 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000872c:	e1a03000 	mov	r3, r0
30008730:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
30008734:	e59d300c 	ldr	r3, [sp, #12]
30008738:	e1a00003 	mov	r0, r3
3000873c:	ebffebb7 	bl	30003620 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30008740:	e59d0014 	ldr	r0, [sp, #20]
30008744:	ebffe3e8 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
30008748:	e3e03000 	mvn	r3, #0
3000874c:	ea00002e 	b	3000880c <rm_policy_thread_init+0x134>
	}
	private_data->t=100*policy_data->t;
30008750:	e59d3018 	ldr	r3, [sp, #24]
30008754:	e5932000 	ldr	r2, [r3]
30008758:	e1a03002 	mov	r3, r2
3000875c:	e1a03103 	lsl	r3, r3, #2
30008760:	e0833002 	add	r3, r3, r2
30008764:	e1a02103 	lsl	r2, r3, #2
30008768:	e0833002 	add	r3, r3, r2
3000876c:	e1a03103 	lsl	r3, r3, #2
30008770:	e1a02003 	mov	r2, r3
30008774:	e59d301c 	ldr	r3, [sp, #28]
30008778:	e583200c 	str	r2, [r3, #12]
	private_data->lt=private_data->t;
3000877c:	e59d301c 	ldr	r3, [sp, #28]
30008780:	e593200c 	ldr	r2, [r3, #12]
30008784:	e59d301c 	ldr	r3, [sp, #28]
30008788:	e5832010 	str	r2, [r3, #16]
	private_data->e=100*policy_data->e;
3000878c:	e59d3018 	ldr	r3, [sp, #24]
30008790:	e5932004 	ldr	r2, [r3, #4]
30008794:	e1a03002 	mov	r3, r2
30008798:	e1a03103 	lsl	r3, r3, #2
3000879c:	e0833002 	add	r3, r3, r2
300087a0:	e1a02103 	lsl	r2, r3, #2
300087a4:	e0833002 	add	r3, r3, r2
300087a8:	e1a03103 	lsl	r3, r3, #2
300087ac:	e1a02003 	mov	r2, r3
300087b0:	e59d301c 	ldr	r3, [sp, #28]
300087b4:	e5832014 	str	r2, [r3, #20]
	private_data->le=private_data->e;
300087b8:	e59d301c 	ldr	r3, [sp, #28]
300087bc:	e5932014 	ldr	r2, [r3, #20]
300087c0:	e59d301c 	ldr	r3, [sp, #28]
300087c4:	e5832018 	str	r2, [r3, #24]
	private_data->period_data.args=args;
300087c8:	e59d301c 	ldr	r3, [sp, #28]
300087cc:	e59d2004 	ldr	r2, [sp, #4]
300087d0:	e5832008 	str	r2, [r3, #8]
	private_data->period_data.route=route;
300087d4:	e59d301c 	ldr	r3, [sp, #28]
300087d8:	e59d2008 	ldr	r2, [sp, #8]
300087dc:	e5832004 	str	r2, [r3, #4]
	private_data->period_data.time=private_data->t;
300087e0:	e59d301c 	ldr	r3, [sp, #28]
300087e4:	e593200c 	ldr	r2, [r3, #12]
300087e8:	e59d301c 	ldr	r3, [sp, #28]
300087ec:	e5832000 	str	r2, [r3]
	thread->private_data=private_data;
300087f0:	e59d300c 	ldr	r3, [sp, #12]
300087f4:	e59d201c 	ldr	r2, [sp, #28]
300087f8:	e5832050 	str	r2, [r3, #80]	; 0x50
	rm_queue_ascend_add(thread);
300087fc:	e59d000c 	ldr	r0, [sp, #12]
30008800:	eb000021 	bl	3000888c <rm_queue_ascend_add>
	return thread->res.id;
30008804:	e59d300c 	ldr	r3, [sp, #12]
30008808:	e5933000 	ldr	r3, [r3]
}
3000880c:	e1a00003 	mov	r0, r3
30008810:	e28dd024 	add	sp, sp, #36	; 0x24
30008814:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008818:	e12fff1e 	bx	lr
3000881c:	3000e82c 	.word	0x3000e82c

30008820 <rm_policy_thread_release>:

void rm_policy_thread_release(acoral_thread_t *thread){
30008820:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008824:	e24dd00c 	sub	sp, sp, #12
30008828:	e58d0004 	str	r0, [sp, #4]
	acoral_printk("Release Rm thread\n");
	acoral_free2(thread->private_data);	
3000882c:	e59d3004 	ldr	r3, [sp, #4]
30008830:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008834:	e1a00003 	mov	r0, r3
30008838:	ebfff985 	bl	30006e54 <v_free>
}
3000883c:	e28dd00c 	add	sp, sp, #12
30008840:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008844:	e12fff1e 	bx	lr

30008848 <rm_discard_thread>:

void rm_discard_thread(acoral_thread_t *thread){
30008848:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000884c:	e24dd00c 	sub	sp, sp, #12
30008850:	e58d0004 	str	r0, [sp, #4]
	acoral_list_del(&thread->ready);
30008854:	e59d3004 	ldr	r3, [sp, #4]
30008858:	e2833010 	add	r3, r3, #16
3000885c:	e1a00003 	mov	r0, r3
30008860:	eb000670 	bl	3000a228 <acoral_list_del>
	acoral_free2(thread->private_data);	
30008864:	e59d3004 	ldr	r3, [sp, #4]
30008868:	e5933050 	ldr	r3, [r3, #80]	; 0x50
3000886c:	e1a00003 	mov	r0, r3
30008870:	ebfff977 	bl	30006e54 <v_free>
	acoral_release_res((acoral_res_t *)thread);
30008874:	e59d3004 	ldr	r3, [sp, #4]
30008878:	e1a00003 	mov	r0, r3
3000887c:	ebffeb67 	bl	30003620 <acoral_release_res>
}
30008880:	e28dd00c 	add	sp, sp, #12
30008884:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008888:	e12fff1e 	bx	lr

3000888c <rm_queue_ascend_add>:

void rm_queue_ascend_add(acoral_thread_t *new){
3000888c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008890:	e24dd024 	sub	sp, sp, #36	; 0x24
30008894:	e58d0004 	str	r0, [sp, #4]
      rm_policy_data_t *new_data;
      rm_policy_data_t *old_data;
      acoral_thread_t * thread;
      acoral_list_t *tmp,*head;
      head=&rm_queue->head;
30008898:	e59f309c 	ldr	r3, [pc, #156]	; 3000893c <rm_queue_ascend_add+0xb0>
3000889c:	e5933000 	ldr	r3, [r3]
300088a0:	e58d301c 	str	r3, [sp, #28]
      new_data=new->private_data; 
300088a4:	e59d3004 	ldr	r3, [sp, #4]
300088a8:	e5933050 	ldr	r3, [r3, #80]	; 0x50
300088ac:	e58d300c 	str	r3, [sp, #12]
      for (tmp=head->next;tmp!=head; tmp=tmp->next){
300088b0:	e59d301c 	ldr	r3, [sp, #28]
300088b4:	e5933000 	ldr	r3, [r3]
300088b8:	e58d3018 	str	r3, [sp, #24]
300088bc:	ea00000e 	b	300088fc <rm_queue_ascend_add+0x70>
		thread =list_entry(tmp, acoral_thread_t,ready);
300088c0:	e59d3018 	ldr	r3, [sp, #24]
300088c4:	e2433010 	sub	r3, r3, #16
300088c8:	e58d3014 	str	r3, [sp, #20]
		old_data=thread->private_data;
300088cc:	e59d3014 	ldr	r3, [sp, #20]
300088d0:	e5933050 	ldr	r3, [r3, #80]	; 0x50
300088d4:	e58d3010 	str	r3, [sp, #16]
      	        if(old_data->lt>new_data->lt)
300088d8:	e59d3010 	ldr	r3, [sp, #16]
300088dc:	e5932010 	ldr	r2, [r3, #16]
300088e0:	e59d300c 	ldr	r3, [sp, #12]
300088e4:	e5933010 	ldr	r3, [r3, #16]
300088e8:	e1520003 	cmp	r2, r3
300088ec:	8a000007 	bhi	30008910 <rm_queue_ascend_add+0x84>
      rm_policy_data_t *old_data;
      acoral_thread_t * thread;
      acoral_list_t *tmp,*head;
      head=&rm_queue->head;
      new_data=new->private_data; 
      for (tmp=head->next;tmp!=head; tmp=tmp->next){
300088f0:	e59d3018 	ldr	r3, [sp, #24]
300088f4:	e5933000 	ldr	r3, [r3]
300088f8:	e58d3018 	str	r3, [sp, #24]
300088fc:	e59d2018 	ldr	r2, [sp, #24]
30008900:	e59d301c 	ldr	r3, [sp, #28]
30008904:	e1520003 	cmp	r2, r3
30008908:	1affffec 	bne	300088c0 <rm_queue_ascend_add+0x34>
3000890c:	ea000000 	b	30008914 <rm_queue_ascend_add+0x88>
		thread =list_entry(tmp, acoral_thread_t,ready);
		old_data=thread->private_data;
      	        if(old_data->lt>new_data->lt)
			break;		  
30008910:	e1a00000 	nop			; (mov r0, r0)
     }
     acoral_list_add(&new->ready,tmp->prev);
30008914:	e59d3004 	ldr	r3, [sp, #4]
30008918:	e2832010 	add	r2, r3, #16
3000891c:	e59d3018 	ldr	r3, [sp, #24]
30008920:	e5933004 	ldr	r3, [r3, #4]
30008924:	e1a00002 	mov	r0, r2
30008928:	e1a01003 	mov	r1, r3
3000892c:	eb000617 	bl	3000a190 <acoral_list_add>
}
30008930:	e28dd024 	add	sp, sp, #36	; 0x24
30008934:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008938:	e12fff1e 	bx	lr
3000893c:	3000ec84 	.word	0x3000ec84

30008940 <rm_check>:

acoral_u8 rm_check(acoral_thread_t *thread,acoral_u32 cpu){
30008940:	e92d4010 	push	{r4, lr}
30008944:	e24dd010 	sub	sp, sp, #16
30008948:	e58d0004 	str	r0, [sp, #4]
3000894c:	e58d1000 	str	r1, [sp]
	rm_policy_data_t *data;
	acoral_fl tmp;
	data=thread->private_data;
30008950:	e59d3004 	ldr	r3, [sp, #4]
30008954:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008958:	e58d3008 	str	r3, [sp, #8]
	tmp=(acoral_fl)data->e/(acoral_fl)data->t;		
3000895c:	e59d3008 	ldr	r3, [sp, #8]
30008960:	e5933014 	ldr	r3, [r3, #20]
30008964:	e1a00003 	mov	r0, r3
30008968:	eb001564 	bl	3000df00 <__aeabi_ui2f>
3000896c:	e1a04000 	mov	r4, r0
30008970:	e59d3008 	ldr	r3, [sp, #8]
30008974:	e593300c 	ldr	r3, [r3, #12]
30008978:	e1a00003 	mov	r0, r3
3000897c:	eb00155f 	bl	3000df00 <__aeabi_ui2f>
30008980:	e1a03000 	mov	r3, r0
30008984:	e1a00004 	mov	r0, r4
30008988:	e1a01003 	mov	r1, r3
3000898c:	eb0015fa 	bl	3000e17c <__aeabi_fdiv>
30008990:	e1a03000 	mov	r3, r0
30008994:	e58d300c 	str	r3, [sp, #12]
	if(left[cpu].sum+tmp<right[left[cpu].num]){
30008998:	e59d1000 	ldr	r1, [sp]
3000899c:	e59f20ec 	ldr	r2, [pc, #236]	; 30008a90 <rm_check+0x150>
300089a0:	e3a03004 	mov	r3, #4
300089a4:	e1a01181 	lsl	r1, r1, #3
300089a8:	e0812002 	add	r2, r1, r2
300089ac:	e0823003 	add	r3, r2, r3
300089b0:	e5933000 	ldr	r3, [r3]
300089b4:	e1a00003 	mov	r0, r3
300089b8:	e59d100c 	ldr	r1, [sp, #12]
300089bc:	eb0014e0 	bl	3000dd44 <__addsf3>
300089c0:	e1a03000 	mov	r3, r0
300089c4:	e1a02003 	mov	r2, r3
300089c8:	e59d1000 	ldr	r1, [sp]
300089cc:	e59f30bc 	ldr	r3, [pc, #188]	; 30008a90 <rm_check+0x150>
300089d0:	e7931181 	ldr	r1, [r3, r1, lsl #3]
300089d4:	e59f30b8 	ldr	r3, [pc, #184]	; 30008a94 <rm_check+0x154>
300089d8:	e7933101 	ldr	r3, [r3, r1, lsl #2]
300089dc:	e3a01000 	mov	r1, #0
300089e0:	e1a04001 	mov	r4, r1
300089e4:	e1a00002 	mov	r0, r2
300089e8:	e1a01003 	mov	r1, r3
300089ec:	eb001667 	bl	3000e390 <__aeabi_fcmplt>
300089f0:	e1a03000 	mov	r3, r0
300089f4:	e3530000 	cmp	r3, #0
300089f8:	0a000001 	beq	30008a04 <rm_check+0xc4>
300089fc:	e3a03001 	mov	r3, #1
30008a00:	e1a04003 	mov	r4, r3
30008a04:	e20430ff 	and	r3, r4, #255	; 0xff
30008a08:	e3530000 	cmp	r3, #0
30008a0c:	0a00001a 	beq	30008a7c <rm_check+0x13c>
		left[cpu].sum+=tmp;
30008a10:	e59d4000 	ldr	r4, [sp]
30008a14:	e59d1000 	ldr	r1, [sp]
30008a18:	e59f2070 	ldr	r2, [pc, #112]	; 30008a90 <rm_check+0x150>
30008a1c:	e3a03004 	mov	r3, #4
30008a20:	e1a01181 	lsl	r1, r1, #3
30008a24:	e0812002 	add	r2, r1, r2
30008a28:	e0823003 	add	r3, r2, r3
30008a2c:	e5933000 	ldr	r3, [r3]
30008a30:	e1a00003 	mov	r0, r3
30008a34:	e59d100c 	ldr	r1, [sp, #12]
30008a38:	eb0014c1 	bl	3000dd44 <__addsf3>
30008a3c:	e1a03000 	mov	r3, r0
30008a40:	e1a02003 	mov	r2, r3
30008a44:	e59f1044 	ldr	r1, [pc, #68]	; 30008a90 <rm_check+0x150>
30008a48:	e3a03004 	mov	r3, #4
30008a4c:	e1a00184 	lsl	r0, r4, #3
30008a50:	e0801001 	add	r1, r0, r1
30008a54:	e0813003 	add	r3, r1, r3
30008a58:	e5832000 	str	r2, [r3]
		left[cpu].num++;
30008a5c:	e59d3000 	ldr	r3, [sp]
30008a60:	e59f2028 	ldr	r2, [pc, #40]	; 30008a90 <rm_check+0x150>
30008a64:	e7922183 	ldr	r2, [r2, r3, lsl #3]
30008a68:	e2821001 	add	r1, r2, #1
30008a6c:	e59f201c 	ldr	r2, [pc, #28]	; 30008a90 <rm_check+0x150>
30008a70:	e7821183 	str	r1, [r2, r3, lsl #3]
		return 1;
30008a74:	e3a03001 	mov	r3, #1
30008a78:	ea000000 	b	30008a80 <rm_check+0x140>
	}
	return 0;
30008a7c:	e3a03000 	mov	r3, #0
}
30008a80:	e1a00003 	mov	r0, r3
30008a84:	e28dd010 	add	sp, sp, #16
30008a88:	e8bd4010 	pop	{r4, lr}
30008a8c:	e12fff1e 	bx	lr
30008a90:	3000fcec 	.word	0x3000fcec
30008a94:	3000ec88 	.word	0x3000ec88

30008a98 <rm_thread_dispatch>:

void rm_thread_dispatch(){
30008a98:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008a9c:	e24dd01c 	sub	sp, sp, #28
	acoral_sr cpu_sr;
	acoral_u32 i;
	acoral_thread_t * thread;
	acoral_list_t *tmp,*head;
	HAL_ENTER_CRITICAL();
30008aa0:	ebffe313 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008aa4:	e1a03000 	mov	r3, r0
30008aa8:	e58d3004 	str	r3, [sp, #4]
	head=&rm_queue->head;
30008aac:	e59f3120 	ldr	r3, [pc, #288]	; 30008bd4 <rm_thread_dispatch+0x13c>
30008ab0:	e5933000 	ldr	r3, [r3]
30008ab4:	e58d3014 	str	r3, [sp, #20]
	for (tmp=head->next;tmp!=head;){
30008ab8:	e59d3014 	ldr	r3, [sp, #20]
30008abc:	e5933000 	ldr	r3, [r3]
30008ac0:	e58d3010 	str	r3, [sp, #16]
30008ac4:	ea000039 	b	30008bb0 <rm_thread_dispatch+0x118>
		thread =list_entry(tmp, acoral_thread_t,ready);
30008ac8:	e59d3010 	ldr	r3, [sp, #16]
30008acc:	e2433010 	sub	r3, r3, #16
30008ad0:	e58d300c 	str	r3, [sp, #12]
		tmp=tmp->next;
30008ad4:	e59d3010 	ldr	r3, [sp, #16]
30008ad8:	e5933000 	ldr	r3, [r3]
30008adc:	e58d3010 	str	r3, [sp, #16]
		if(prio>=ACORAL_HARD_RT_PRIO_MAX){
30008ae0:	e59f30f0 	ldr	r3, [pc, #240]	; 30008bd8 <rm_thread_dispatch+0x140>
30008ae4:	e5933000 	ldr	r3, [r3]
30008ae8:	e3530001 	cmp	r3, #1
30008aec:	9a000007 	bls	30008b10 <rm_thread_dispatch+0x78>
				acoral_printerr("RM thread %s Err,Prio is not enough\n",thread->name);
30008af0:	e59d300c 	ldr	r3, [sp, #12]
30008af4:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008af8:	e59f00dc 	ldr	r0, [pc, #220]	; 30008bdc <rm_thread_dispatch+0x144>
30008afc:	e1a01003 	mov	r1, r3
30008b00:	eb000a47 	bl	3000b424 <acoral_print>
				/*这个线程还没初始化，包括它的stack,lock等,原来是用acoral_release_thread导致很多错误*/
				rm_discard_thread(thread);
30008b04:	e59d000c 	ldr	r0, [sp, #12]
30008b08:	ebffff4e 	bl	30008848 <rm_discard_thread>
30008b0c:	ea000027 	b	30008bb0 <rm_thread_dispatch+0x118>
		}else{
			thread->prio=prio;
30008b10:	e59f30c0 	ldr	r3, [pc, #192]	; 30008bd8 <rm_thread_dispatch+0x140>
30008b14:	e5933000 	ldr	r3, [r3]
30008b18:	e20320ff 	and	r2, r3, #255	; 0xff
30008b1c:	e59d300c 	ldr	r3, [sp, #12]
30008b20:	e5c32005 	strb	r2, [r3, #5]
			prio++;
30008b24:	e59f30ac 	ldr	r3, [pc, #172]	; 30008bd8 <rm_thread_dispatch+0x140>
30008b28:	e5933000 	ldr	r3, [r3]
30008b2c:	e2832001 	add	r2, r3, #1
30008b30:	e59f30a0 	ldr	r3, [pc, #160]	; 30008bd8 <rm_thread_dispatch+0x140>
30008b34:	e5832000 	str	r2, [r3]
			for(i=0;i<HAL_MAX_CPU;i++){
30008b38:	e3a03000 	mov	r3, #0
30008b3c:	e58d3008 	str	r3, [sp, #8]
30008b40:	ea00000d 	b	30008b7c <rm_thread_dispatch+0xe4>
				if(rm_check(thread,i)){
30008b44:	e59d000c 	ldr	r0, [sp, #12]
30008b48:	e59d1008 	ldr	r1, [sp, #8]
30008b4c:	ebffff7b 	bl	30008940 <rm_check>
30008b50:	e1a03000 	mov	r3, r0
30008b54:	e3530000 	cmp	r3, #0
30008b58:	0a000004 	beq	30008b70 <rm_thread_dispatch+0xd8>
					thread->cpu=i;
30008b5c:	e59d3008 	ldr	r3, [sp, #8]
30008b60:	e20320ff 	and	r2, r3, #255	; 0xff
30008b64:	e59d300c 	ldr	r3, [sp, #12]
30008b68:	e5c32006 	strb	r2, [r3, #6]
					break;
30008b6c:	ea000005 	b	30008b88 <rm_thread_dispatch+0xf0>
				/*这个线程还没初始化，包括它的stack,lock等,原来是用acoral_release_thread导致很多错误*/
				rm_discard_thread(thread);
		}else{
			thread->prio=prio;
			prio++;
			for(i=0;i<HAL_MAX_CPU;i++){
30008b70:	e59d3008 	ldr	r3, [sp, #8]
30008b74:	e2833001 	add	r3, r3, #1
30008b78:	e58d3008 	str	r3, [sp, #8]
30008b7c:	e59d3008 	ldr	r3, [sp, #8]
30008b80:	e3530000 	cmp	r3, #0
30008b84:	0affffee 	beq	30008b44 <rm_thread_dispatch+0xac>
				if(rm_check(thread,i)){
					thread->cpu=i;
					break;
				}
			}
			if(i==HAL_MAX_CPU){
30008b88:	e59d3008 	ldr	r3, [sp, #8]
30008b8c:	e3530001 	cmp	r3, #1
30008b90:	1a000006 	bne	30008bb0 <rm_thread_dispatch+0x118>
				acoral_printerr("Discard thread %s\n",thread->name);
30008b94:	e59d300c 	ldr	r3, [sp, #12]
30008b98:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008b9c:	e59f003c 	ldr	r0, [pc, #60]	; 30008be0 <rm_thread_dispatch+0x148>
30008ba0:	e1a01003 	mov	r1, r3
30008ba4:	eb000a1e 	bl	3000b424 <acoral_print>
				/*这个线程还没初始化，包括它的stack,lock等*/
				rm_discard_thread(thread);
30008ba8:	e59d000c 	ldr	r0, [sp, #12]
30008bac:	ebffff25 	bl	30008848 <rm_discard_thread>
	acoral_u32 i;
	acoral_thread_t * thread;
	acoral_list_t *tmp,*head;
	HAL_ENTER_CRITICAL();
	head=&rm_queue->head;
	for (tmp=head->next;tmp!=head;){
30008bb0:	e59d2010 	ldr	r2, [sp, #16]
30008bb4:	e59d3014 	ldr	r3, [sp, #20]
30008bb8:	e1520003 	cmp	r2, r3
30008bbc:	1affffc1 	bne	30008ac8 <rm_thread_dispatch+0x30>
				/*这个线程还没初始化，包括它的stack,lock等*/
				rm_discard_thread(thread);
			}
		} 
	}
	HAL_EXIT_CRITICAL();
30008bc0:	e59d0004 	ldr	r0, [sp, #4]
30008bc4:	ebffe2c8 	bl	300016ec <HAL_INTR_RESTORE>
	return;
}
30008bc8:	e28dd01c 	add	sp, sp, #28
30008bcc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008bd0:	e12fff1e 	bx	lr
30008bd4:	3000ec84 	.word	0x3000ec84
30008bd8:	3000ec80 	.word	0x3000ec80
30008bdc:	3000e858 	.word	0x3000e858
30008be0:	3000e880 	.word	0x3000e880

30008be4 <rm_init>:

void rm_init(){
30008be4:	e24dd008 	sub	sp, sp, #8
      acoral_u32 i;
      acoral_init_list(&rm_queue->head);
30008be8:	e59f307c 	ldr	r3, [pc, #124]	; 30008c6c <rm_init+0x88>
30008bec:	e5933000 	ldr	r3, [r3]
30008bf0:	e59f2074 	ldr	r2, [pc, #116]	; 30008c6c <rm_init+0x88>
30008bf4:	e5922000 	ldr	r2, [r2]
30008bf8:	e5832000 	str	r2, [r3]
30008bfc:	e59f3068 	ldr	r3, [pc, #104]	; 30008c6c <rm_init+0x88>
30008c00:	e5933000 	ldr	r3, [r3]
30008c04:	e59f2060 	ldr	r2, [pc, #96]	; 30008c6c <rm_init+0x88>
30008c08:	e5922000 	ldr	r2, [r2]
30008c0c:	e5832004 	str	r2, [r3, #4]
      for(i=0;i<HAL_MAX_CPU;i++){
30008c10:	e3a03000 	mov	r3, #0
30008c14:	e58d3004 	str	r3, [sp, #4]
30008c18:	ea00000e 	b	30008c58 <rm_init+0x74>
		left[i].sum=0;
30008c1c:	e59d1004 	ldr	r1, [sp, #4]
30008c20:	e59f2048 	ldr	r2, [pc, #72]	; 30008c70 <rm_init+0x8c>
30008c24:	e3a03004 	mov	r3, #4
30008c28:	e1a01181 	lsl	r1, r1, #3
30008c2c:	e0812002 	add	r2, r1, r2
30008c30:	e0823003 	add	r3, r2, r3
30008c34:	e59f2038 	ldr	r2, [pc, #56]	; 30008c74 <rm_init+0x90>
30008c38:	e5832000 	str	r2, [r3]
		left[i].num=0;
30008c3c:	e59d2004 	ldr	r2, [sp, #4]
30008c40:	e59f3028 	ldr	r3, [pc, #40]	; 30008c70 <rm_init+0x8c>
30008c44:	e3a01000 	mov	r1, #0
30008c48:	e7831182 	str	r1, [r3, r2, lsl #3]
}

void rm_init(){
      acoral_u32 i;
      acoral_init_list(&rm_queue->head);
      for(i=0;i<HAL_MAX_CPU;i++){
30008c4c:	e59d3004 	ldr	r3, [sp, #4]
30008c50:	e2833001 	add	r3, r3, #1
30008c54:	e58d3004 	str	r3, [sp, #4]
30008c58:	e59d3004 	ldr	r3, [sp, #4]
30008c5c:	e3530000 	cmp	r3, #0
30008c60:	0affffed 	beq	30008c1c <rm_init+0x38>
		left[i].sum=0;
		left[i].num=0;
      }
}
30008c64:	e28dd008 	add	sp, sp, #8
30008c68:	e12fff1e 	bx	lr
30008c6c:	3000ec84 	.word	0x3000ec84
30008c70:	3000fcec 	.word	0x3000fcec
30008c74:	00000000 	.word	0x00000000

30008c78 <rm_policy_init>:

acoral_sched_policy_t rm_policy;
void rm_policy_init(){
30008c78:	e92d4008 	push	{r3, lr}
	rm_init();
30008c7c:	ebffffd8 	bl	30008be4 <rm_init>
	rm_policy.type=ACORAL_SCHED_POLICY_RM;
30008c80:	e59f3044 	ldr	r3, [pc, #68]	; 30008ccc <rm_policy_init+0x54>
30008c84:	e3a02017 	mov	r2, #23
30008c88:	e5c32008 	strb	r2, [r3, #8]
	rm_policy.policy_thread_init=rm_policy_thread_init;
30008c8c:	e59f3038 	ldr	r3, [pc, #56]	; 30008ccc <rm_policy_init+0x54>
30008c90:	e59f2038 	ldr	r2, [pc, #56]	; 30008cd0 <rm_policy_init+0x58>
30008c94:	e583200c 	str	r2, [r3, #12]
	rm_policy.policy_thread_release=rm_policy_thread_release;
30008c98:	e59f302c 	ldr	r3, [pc, #44]	; 30008ccc <rm_policy_init+0x54>
30008c9c:	e59f2030 	ldr	r2, [pc, #48]	; 30008cd4 <rm_policy_init+0x5c>
30008ca0:	e5832010 	str	r2, [r3, #16]
	rm_policy.delay_deal=NULL;
30008ca4:	e59f3020 	ldr	r3, [pc, #32]	; 30008ccc <rm_policy_init+0x54>
30008ca8:	e3a02000 	mov	r2, #0
30008cac:	e5832014 	str	r2, [r3, #20]
	rm_policy.name="rm";
30008cb0:	e59f3014 	ldr	r3, [pc, #20]	; 30008ccc <rm_policy_init+0x54>
30008cb4:	e59f201c 	ldr	r2, [pc, #28]	; 30008cd8 <rm_policy_init+0x60>
30008cb8:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&rm_policy);
30008cbc:	e59f0008 	ldr	r0, [pc, #8]	; 30008ccc <rm_policy_init+0x54>
30008cc0:	ebffe466 	bl	30001e60 <acoral_register_sched_policy>
}
30008cc4:	e8bd4008 	pop	{r3, lr}
30008cc8:	e12fff1e 	bx	lr
30008ccc:	30010580 	.word	0x30010580
30008cd0:	300086d8 	.word	0x300086d8
30008cd4:	30008820 	.word	0x30008820
30008cd8:	3000e894 	.word	0x3000e894

30008cdc <rm_end>:

void rm_end(){
30008cdc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008ce0:	e24dd024 	sub	sp, sp, #36	; 0x24
      acoral_sr cpu_sr;
      acoral_thread_t * thread;
      rm_policy_data_t *private_data;
      acoral_list_t *tmp,*head;
      rm_thread_dispatch();
30008ce4:	ebffff6b 	bl	30008a98 <rm_thread_dispatch>
      HAL_ENTER_CRITICAL();
30008ce8:	ebffe281 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008cec:	e1a03000 	mov	r3, r0
30008cf0:	e58d300c 	str	r3, [sp, #12]
      head=&rm_queue->head;
30008cf4:	e59f3090 	ldr	r3, [pc, #144]	; 30008d8c <rm_end+0xb0>
30008cf8:	e5933000 	ldr	r3, [r3]
30008cfc:	e58d301c 	str	r3, [sp, #28]
      for (tmp=head->next;tmp!=head;){
30008d00:	e59d301c 	ldr	r3, [sp, #28]
30008d04:	e5933000 	ldr	r3, [r3]
30008d08:	e58d3018 	str	r3, [sp, #24]
30008d0c:	ea000015 	b	30008d68 <rm_end+0x8c>
	  thread =list_entry(tmp, acoral_thread_t,ready);
30008d10:	e59d3018 	ldr	r3, [sp, #24]
30008d14:	e2433010 	sub	r3, r3, #16
30008d18:	e58d3010 	str	r3, [sp, #16]
	  tmp=tmp->next;
30008d1c:	e59d3018 	ldr	r3, [sp, #24]
30008d20:	e5933000 	ldr	r3, [r3]
30008d24:	e58d3018 	str	r3, [sp, #24]
	  acoral_list_del(&thread->ready); /*从队列上取下线程*/
30008d28:	e59d3010 	ldr	r3, [sp, #16]
30008d2c:	e2833010 	add	r3, r3, #16
30008d30:	e1a00003 	mov	r0, r3
30008d34:	eb00053b 	bl	3000a228 <acoral_list_del>
	  private_data=thread->private_data;
30008d38:	e59d3010 	ldr	r3, [sp, #16]
30008d3c:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008d40:	e58d3014 	str	r3, [sp, #20]
	  acoral_policy_thread_init(ACORAL_SCHED_POLICY_PERIOD,thread,private_data->period_data.route,private_data->period_data.args,NULL);
30008d44:	e59d3014 	ldr	r3, [sp, #20]
30008d48:	e5932004 	ldr	r2, [r3, #4]
30008d4c:	e59d3014 	ldr	r3, [sp, #20]
30008d50:	e5933008 	ldr	r3, [r3, #8]
30008d54:	e3a01000 	mov	r1, #0
30008d58:	e58d1000 	str	r1, [sp]
30008d5c:	e3a00016 	mov	r0, #22
30008d60:	e59d1010 	ldr	r1, [sp, #16]
30008d64:	ebffe40d 	bl	30001da0 <acoral_policy_thread_init>
      rm_policy_data_t *private_data;
      acoral_list_t *tmp,*head;
      rm_thread_dispatch();
      HAL_ENTER_CRITICAL();
      head=&rm_queue->head;
      for (tmp=head->next;tmp!=head;){
30008d68:	e59d2018 	ldr	r2, [sp, #24]
30008d6c:	e59d301c 	ldr	r3, [sp, #28]
30008d70:	e1520003 	cmp	r2, r3
30008d74:	1affffe5 	bne	30008d10 <rm_end+0x34>
	  tmp=tmp->next;
	  acoral_list_del(&thread->ready); /*从队列上取下线程*/
	  private_data=thread->private_data;
	  acoral_policy_thread_init(ACORAL_SCHED_POLICY_PERIOD,thread,private_data->period_data.route,private_data->period_data.args,NULL);
     }
     HAL_EXIT_CRITICAL();
30008d78:	e59d000c 	ldr	r0, [sp, #12]
30008d7c:	ebffe25a 	bl	300016ec <HAL_INTR_RESTORE>
}
30008d80:	e28dd024 	add	sp, sp, #36	; 0x24
30008d84:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008d88:	e12fff1e 	bx	lr
30008d8c:	3000ec84 	.word	0x3000ec84

30008d90 <period_policy_thread_init>:
#include<policy.h>
#include<mem.h>
#include<timer.h>
#include<period_thrd.h>
acoral_queue_t period_delay_queue;
acoral_id period_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30008d90:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008d94:	e24dd024 	sub	sp, sp, #36	; 0x24
30008d98:	e58d000c 	str	r0, [sp, #12]
30008d9c:	e58d1008 	str	r1, [sp, #8]
30008da0:	e58d2004 	str	r2, [sp, #4]
30008da4:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 prio;
	acoral_period_policy_data_t *policy_data;
	period_policy_data_t *private_data;
	if(thread->policy==ACORAL_SCHED_POLICY_PERIOD){
30008da8:	e59d300c 	ldr	r3, [sp, #12]
30008dac:	e5d3300c 	ldrb	r3, [r3, #12]
30008db0:	e3530016 	cmp	r3, #22
30008db4:	1a000040 	bne	30008ebc <period_policy_thread_init+0x12c>
		policy_data=(acoral_period_policy_data_t *)data;
30008db8:	e59d3000 	ldr	r3, [sp]
30008dbc:	e58d3018 	str	r3, [sp, #24]
		thread->cpu=policy_data->cpu;
30008dc0:	e59d3018 	ldr	r3, [sp, #24]
30008dc4:	e5d32000 	ldrb	r2, [r3]
30008dc8:	e59d300c 	ldr	r3, [sp, #12]
30008dcc:	e5c32006 	strb	r2, [r3, #6]
		prio=policy_data->prio;
30008dd0:	e59d3018 	ldr	r3, [sp, #24]
30008dd4:	e5d33001 	ldrb	r3, [r3, #1]
30008dd8:	e58d3014 	str	r3, [sp, #20]
		if(policy_data->prio_type==ACORAL_BASE_PRIO){
30008ddc:	e59d3018 	ldr	r3, [sp, #24]
30008de0:	e5d33002 	ldrb	r3, [r3, #2]
30008de4:	e1a03c03 	lsl	r3, r3, #24
30008de8:	e1a03c43 	asr	r3, r3, #24
30008dec:	e3530002 	cmp	r3, #2
30008df0:	1a000007 	bne	30008e14 <period_policy_thread_init+0x84>
			prio+=ACORAL_BASE_PRIO_MIN;
30008df4:	e59d3014 	ldr	r3, [sp, #20]
30008df8:	e2833002 	add	r3, r3, #2
30008dfc:	e58d3014 	str	r3, [sp, #20]
			if(prio>=ACORAL_BASE_PRIO_MAX)
30008e00:	e59d3014 	ldr	r3, [sp, #20]
30008e04:	e3530026 	cmp	r3, #38	; 0x26
30008e08:	9a000001 	bls	30008e14 <period_policy_thread_init+0x84>
				prio=ACORAL_BASE_PRIO_MAX-1;
30008e0c:	e3a03026 	mov	r3, #38	; 0x26
30008e10:	e58d3014 	str	r3, [sp, #20]
		}
		thread->prio=prio;
30008e14:	e59d3014 	ldr	r3, [sp, #20]
30008e18:	e20320ff 	and	r2, r3, #255	; 0xff
30008e1c:	e59d300c 	ldr	r3, [sp, #12]
30008e20:	e5c32005 	strb	r2, [r3, #5]
		private_data=(period_policy_data_t *)acoral_malloc2(sizeof(period_policy_data_t));
30008e24:	e3a0000c 	mov	r0, #12
30008e28:	ebfff7f4 	bl	30006e00 <v_malloc>
30008e2c:	e1a03000 	mov	r3, r0
30008e30:	e58d301c 	str	r3, [sp, #28]
		if(private_data==NULL){
30008e34:	e59d301c 	ldr	r3, [sp, #28]
30008e38:	e3530000 	cmp	r3, #0
30008e3c:	1a00000e 	bne	30008e7c <period_policy_thread_init+0xec>
			acoral_printerr("No level2 mem space for private_data:%s\n",thread->name);
30008e40:	e59d300c 	ldr	r3, [sp, #12]
30008e44:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008e48:	e59f0118 	ldr	r0, [pc, #280]	; 30008f68 <period_policy_thread_init+0x1d8>
30008e4c:	e1a01003 	mov	r1, r3
30008e50:	eb000973 	bl	3000b424 <acoral_print>
			HAL_ENTER_CRITICAL();
30008e54:	ebffe226 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008e58:	e1a03000 	mov	r3, r0
30008e5c:	e58d3010 	str	r3, [sp, #16]
			acoral_release_res((acoral_res_t *)thread);
30008e60:	e59d300c 	ldr	r3, [sp, #12]
30008e64:	e1a00003 	mov	r0, r3
30008e68:	ebffe9ec 	bl	30003620 <acoral_release_res>
			HAL_EXIT_CRITICAL();
30008e6c:	e59d0010 	ldr	r0, [sp, #16]
30008e70:	ebffe21d 	bl	300016ec <HAL_INTR_RESTORE>
			return -1;
30008e74:	e3e03000 	mvn	r3, #0
30008e78:	ea000036 	b	30008f58 <period_policy_thread_init+0x1c8>
		}
		private_data->time=policy_data->time;
30008e7c:	e59d3018 	ldr	r3, [sp, #24]
30008e80:	e5932004 	ldr	r2, [r3, #4]
30008e84:	e59d301c 	ldr	r3, [sp, #28]
30008e88:	e5832000 	str	r2, [r3]
		private_data->route=route;
30008e8c:	e59d301c 	ldr	r3, [sp, #28]
30008e90:	e59d2008 	ldr	r2, [sp, #8]
30008e94:	e5832004 	str	r2, [r3, #4]
		private_data->args=args;
30008e98:	e59d301c 	ldr	r3, [sp, #28]
30008e9c:	e59d2004 	ldr	r2, [sp, #4]
30008ea0:	e5832008 	str	r2, [r3, #8]
		thread->private_data=private_data;
30008ea4:	e59d300c 	ldr	r3, [sp, #12]
30008ea8:	e59d201c 	ldr	r2, [sp, #28]
30008eac:	e5832050 	str	r2, [r3, #80]	; 0x50
		thread->cpu_mask=-1;
30008eb0:	e59d300c 	ldr	r3, [sp, #12]
30008eb4:	e3e02000 	mvn	r2, #0
30008eb8:	e5832008 	str	r2, [r3, #8]
	}
	if(acoral_thread_init(thread,route,period_thread_exit,args)!=0){
30008ebc:	e59f30a8 	ldr	r3, [pc, #168]	; 30008f6c <period_policy_thread_init+0x1dc>
30008ec0:	e59d000c 	ldr	r0, [sp, #12]
30008ec4:	e59d1008 	ldr	r1, [sp, #8]
30008ec8:	e1a02003 	mov	r2, r3
30008ecc:	e59d3004 	ldr	r3, [sp, #4]
30008ed0:	ebffe768 	bl	30002c78 <acoral_thread_init>
30008ed4:	e1a03000 	mov	r3, r0
30008ed8:	e3530000 	cmp	r3, #0
30008edc:	0a00000e 	beq	30008f1c <period_policy_thread_init+0x18c>
		acoral_printerr("No thread stack:%s\n",thread->name);
30008ee0:	e59d300c 	ldr	r3, [sp, #12]
30008ee4:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008ee8:	e59f0080 	ldr	r0, [pc, #128]	; 30008f70 <period_policy_thread_init+0x1e0>
30008eec:	e1a01003 	mov	r1, r3
30008ef0:	eb00094b 	bl	3000b424 <acoral_print>
		HAL_ENTER_CRITICAL();
30008ef4:	ebffe1fe 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008ef8:	e1a03000 	mov	r3, r0
30008efc:	e58d3010 	str	r3, [sp, #16]
		acoral_release_res((acoral_res_t *)thread);
30008f00:	e59d300c 	ldr	r3, [sp, #12]
30008f04:	e1a00003 	mov	r0, r3
30008f08:	ebffe9c4 	bl	30003620 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30008f0c:	e59d0010 	ldr	r0, [sp, #16]
30008f10:	ebffe1f5 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
30008f14:	e3e03000 	mvn	r3, #0
30008f18:	ea00000e 	b	30008f58 <period_policy_thread_init+0x1c8>
	}
        /*将线程就绪，并重新调度*/
	acoral_resume_thread(thread);
30008f1c:	e59d000c 	ldr	r0, [sp, #12]
30008f20:	ebffe64b 	bl	30002854 <acoral_resume_thread>
	HAL_ENTER_CRITICAL();
30008f24:	ebffe1f2 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008f28:	e1a03000 	mov	r3, r0
30008f2c:	e58d3010 	str	r3, [sp, #16]
	period_thread_delay(thread,((period_policy_data_t *)thread->private_data)->time);
30008f30:	e59d300c 	ldr	r3, [sp, #12]
30008f34:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008f38:	e5933000 	ldr	r3, [r3]
30008f3c:	e59d000c 	ldr	r0, [sp, #12]
30008f40:	e1a01003 	mov	r1, r3
30008f44:	eb000057 	bl	300090a8 <period_thread_delay>
	HAL_EXIT_CRITICAL();
30008f48:	e59d0010 	ldr	r0, [sp, #16]
30008f4c:	ebffe1e6 	bl	300016ec <HAL_INTR_RESTORE>
	return thread->res.id;
30008f50:	e59d300c 	ldr	r3, [sp, #12]
30008f54:	e5933000 	ldr	r3, [r3]
}
30008f58:	e1a00003 	mov	r0, r3
30008f5c:	e28dd024 	add	sp, sp, #36	; 0x24
30008f60:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008f64:	e12fff1e 	bx	lr
30008f68:	3000e898 	.word	0x3000e898
30008f6c:	30009288 	.word	0x30009288
30008f70:	3000e8c4 	.word	0x3000e8c4

30008f74 <period_policy_thread_release>:

void period_policy_thread_release(acoral_thread_t *thread){
30008f74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008f78:	e24dd00c 	sub	sp, sp, #12
30008f7c:	e58d0004 	str	r0, [sp, #4]
	acoral_free2(thread->private_data);	
30008f80:	e59d3004 	ldr	r3, [sp, #4]
30008f84:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008f88:	e1a00003 	mov	r0, r3
30008f8c:	ebfff7b0 	bl	30006e54 <v_free>
}
30008f90:	e28dd00c 	add	sp, sp, #12
30008f94:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008f98:	e12fff1e 	bx	lr

30008f9c <acoral_periodqueue_add>:

void acoral_periodqueue_add(acoral_thread_t *new){
30008f9c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008fa0:	e24dd024 	sub	sp, sp, #36	; 0x24
30008fa4:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t   *tmp,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
30008fa8:	e59d3004 	ldr	r3, [sp, #4]
30008fac:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30008fb0:	e58d301c 	str	r3, [sp, #28]
	head=&period_delay_queue.head;
30008fb4:	e59f30e8 	ldr	r3, [pc, #232]	; 300090a4 <acoral_periodqueue_add+0x108>
30008fb8:	e58d3010 	str	r3, [sp, #16]
	acoral_spin_lock(&head->lock);
	new->state|=ACORAL_THREAD_STATE_DELAY;
30008fbc:	e59d3004 	ldr	r3, [sp, #4]
30008fc0:	e5d33004 	ldrb	r3, [r3, #4]
30008fc4:	e3833020 	orr	r3, r3, #32
30008fc8:	e20320ff 	and	r2, r3, #255	; 0xff
30008fcc:	e59d3004 	ldr	r3, [sp, #4]
30008fd0:	e5c32004 	strb	r2, [r3, #4]
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30008fd4:	e59d3010 	ldr	r3, [sp, #16]
30008fd8:	e5933000 	ldr	r3, [r3]
30008fdc:	e58d300c 	str	r3, [sp, #12]
30008fe0:	ea00000d 	b	3000901c <acoral_periodqueue_add+0x80>
		thread = list_entry (tmp, acoral_thread_t, waiting);
30008fe4:	e59d300c 	ldr	r3, [sp, #12]
30008fe8:	e2433020 	sub	r3, r3, #32
30008fec:	e58d3014 	str	r3, [sp, #20]
		delay  = delay-thread->delay;
30008ff0:	e59d3014 	ldr	r3, [sp, #20]
30008ff4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30008ff8:	e59d201c 	ldr	r2, [sp, #28]
30008ffc:	e0633002 	rsb	r3, r3, r2
30009000:	e58d301c 	str	r3, [sp, #28]
		if (delay < 0)
30009004:	e59d301c 	ldr	r3, [sp, #28]
30009008:	e3530000 	cmp	r3, #0
3000900c:	ba000009 	blt	30009038 <acoral_periodqueue_add+0x9c>
	acoral_32  delay2;
	acoral_32  delay= new->delay;
	head=&period_delay_queue.head;
	acoral_spin_lock(&head->lock);
	new->state|=ACORAL_THREAD_STATE_DELAY;
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30009010:	e59d300c 	ldr	r3, [sp, #12]
30009014:	e5933000 	ldr	r3, [r3]
30009018:	e58d300c 	str	r3, [sp, #12]
3000901c:	e59d301c 	ldr	r3, [sp, #28]
30009020:	e58d3018 	str	r3, [sp, #24]
30009024:	e59d200c 	ldr	r2, [sp, #12]
30009028:	e59d3010 	ldr	r3, [sp, #16]
3000902c:	e1520003 	cmp	r2, r3
30009030:	1affffeb 	bne	30008fe4 <acoral_periodqueue_add+0x48>
30009034:	ea000000 	b	3000903c <acoral_periodqueue_add+0xa0>
		thread = list_entry (tmp, acoral_thread_t, waiting);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
30009038:	e1a00000 	nop			; (mov r0, r0)
	}
	new->delay = delay2;
3000903c:	e59d3004 	ldr	r3, [sp, #4]
30009040:	e59d2018 	ldr	r2, [sp, #24]
30009044:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_list_add(&new->waiting,tmp->prev);
30009048:	e59d3004 	ldr	r3, [sp, #4]
3000904c:	e2832020 	add	r2, r3, #32
30009050:	e59d300c 	ldr	r3, [sp, #12]
30009054:	e5933004 	ldr	r3, [r3, #4]
30009058:	e1a00002 	mov	r0, r2
3000905c:	e1a01003 	mov	r1, r3
30009060:	eb00044a 	bl	3000a190 <acoral_list_add>
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
30009064:	e59d200c 	ldr	r2, [sp, #12]
30009068:	e59d3010 	ldr	r3, [sp, #16]
3000906c:	e1520003 	cmp	r2, r3
30009070:	0a000008 	beq	30009098 <acoral_periodqueue_add+0xfc>
		thread = list_entry(tmp, acoral_thread_t, waiting);
30009074:	e59d300c 	ldr	r3, [sp, #12]
30009078:	e2433020 	sub	r3, r3, #32
3000907c:	e58d3014 	str	r3, [sp, #20]
		thread->delay-=delay2;
30009080:	e59d3014 	ldr	r3, [sp, #20]
30009084:	e5932040 	ldr	r2, [r3, #64]	; 0x40
30009088:	e59d3018 	ldr	r3, [sp, #24]
3000908c:	e0632002 	rsb	r2, r3, r2
30009090:	e59d3014 	ldr	r3, [sp, #20]
30009094:	e5832040 	str	r2, [r3, #64]	; 0x40
	}
	acoral_spin_unlock(&head->lock);
}
30009098:	e28dd024 	add	sp, sp, #36	; 0x24
3000909c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300090a0:	e12fff1e 	bx	lr
300090a4:	3000fcf8 	.word	0x3000fcf8

300090a8 <period_thread_delay>:

void period_thread_delay(acoral_thread_t* thread,acoral_time time){
300090a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300090ac:	e24dd00c 	sub	sp, sp, #12
300090b0:	e58d0004 	str	r0, [sp, #4]
300090b4:	e58d1000 	str	r1, [sp]
	thread->delay=TIME_TO_TICKS(time);
300090b8:	e59d2000 	ldr	r2, [sp]
300090bc:	e1a03002 	mov	r3, r2
300090c0:	e1a03103 	lsl	r3, r3, #2
300090c4:	e0833002 	add	r3, r3, r2
300090c8:	e1a02103 	lsl	r2, r3, #2
300090cc:	e0833002 	add	r3, r3, r2
300090d0:	e1a03103 	lsl	r3, r3, #2
300090d4:	e1a02003 	mov	r2, r3
300090d8:	e59f3024 	ldr	r3, [pc, #36]	; 30009104 <period_thread_delay+0x5c>
300090dc:	e0831392 	umull	r1, r3, r2, r3
300090e0:	e1a03323 	lsr	r3, r3, #6
300090e4:	e1a02003 	mov	r2, r3
300090e8:	e59d3004 	ldr	r3, [sp, #4]
300090ec:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_periodqueue_add(thread);
300090f0:	e59d0004 	ldr	r0, [sp, #4]
300090f4:	ebffffa8 	bl	30008f9c <acoral_periodqueue_add>
}
300090f8:	e28dd00c 	add	sp, sp, #12
300090fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009100:	e12fff1e 	bx	lr
30009104:	10624dd3 	.word	0x10624dd3

30009108 <period_delay_deal>:

void period_delay_deal(){
30009108:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000910c:	e24dd01c 	sub	sp, sp, #28
	acoral_list_t *tmp,*tmp1,*head;
	acoral_thread_t * thread;
	period_policy_data_t * private_data;
	head=&period_delay_queue.head;
30009110:	e59f3160 	ldr	r3, [pc, #352]	; 30009278 <period_delay_deal+0x170>
30009114:	e58d300c 	str	r3, [sp, #12]
	if(acoral_list_empty(head))
30009118:	e59d300c 	ldr	r3, [sp, #12]
3000911c:	e5932000 	ldr	r2, [r3]
30009120:	e59d300c 	ldr	r3, [sp, #12]
30009124:	e1520003 	cmp	r2, r3
30009128:	0a00004c 	beq	30009260 <period_delay_deal+0x158>
	    	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
3000912c:	e59d300c 	ldr	r3, [sp, #12]
30009130:	e5933000 	ldr	r3, [r3]
30009134:	e2433020 	sub	r3, r3, #32
30009138:	e58d3010 	str	r3, [sp, #16]
	ACORAL_ASSERT(thread,"in period thread deal");
3000913c:	e59d2010 	ldr	r2, [sp, #16]
30009140:	e59f3134 	ldr	r3, [pc, #308]	; 3000927c <period_delay_deal+0x174>
30009144:	e1a00002 	mov	r0, r2
30009148:	e1a01003 	mov	r1, r3
3000914c:	ebffeaba 	bl	30003c3c <acoral_assert_res>
	thread->delay--;
30009150:	e59d3010 	ldr	r3, [sp, #16]
30009154:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30009158:	e2432001 	sub	r2, r3, #1
3000915c:	e59d3010 	ldr	r3, [sp, #16]
30009160:	e5832040 	str	r2, [r3, #64]	; 0x40
	for(tmp=head->next;tmp!=head;){
30009164:	e59d300c 	ldr	r3, [sp, #12]
30009168:	e5933000 	ldr	r3, [r3]
3000916c:	e58d3004 	str	r3, [sp, #4]
30009170:	ea000035 	b	3000924c <period_delay_deal+0x144>
		thread=list_entry(tmp,acoral_thread_t,waiting);
30009174:	e59d3004 	ldr	r3, [sp, #4]
30009178:	e2433020 	sub	r3, r3, #32
3000917c:	e58d3010 	str	r3, [sp, #16]
		ACORAL_ASSERT(thread,"in period thread deal ");
30009180:	e59d2010 	ldr	r2, [sp, #16]
30009184:	e59f30f4 	ldr	r3, [pc, #244]	; 30009280 <period_delay_deal+0x178>
30009188:	e1a00002 	mov	r0, r2
3000918c:	e1a01003 	mov	r1, r3
30009190:	ebffeaa9 	bl	30003c3c <acoral_assert_res>
		if(thread->delay>0)
30009194:	e59d3010 	ldr	r3, [sp, #16]
30009198:	e5933040 	ldr	r3, [r3, #64]	; 0x40
3000919c:	e3530000 	cmp	r3, #0
300091a0:	ca000030 	bgt	30009268 <period_delay_deal+0x160>
		    break;
		private_data=thread->private_data;
300091a4:	e59d3010 	ldr	r3, [sp, #16]
300091a8:	e5933050 	ldr	r3, [r3, #80]	; 0x50
300091ac:	e58d3014 	str	r3, [sp, #20]
		/*防止add判断delay时取下thread*/
		acoral_spin_lock(&head->lock);
		tmp1=tmp->next;
300091b0:	e59d3004 	ldr	r3, [sp, #4]
300091b4:	e5933000 	ldr	r3, [r3]
300091b8:	e58d3008 	str	r3, [sp, #8]
		acoral_list_del(&thread->waiting);
300091bc:	e59d3010 	ldr	r3, [sp, #16]
300091c0:	e2833020 	add	r3, r3, #32
300091c4:	e1a00003 	mov	r0, r3
300091c8:	eb000416 	bl	3000a228 <acoral_list_del>
		tmp=tmp1;
300091cc:	e59d3008 	ldr	r3, [sp, #8]
300091d0:	e58d3004 	str	r3, [sp, #4]
		acoral_spin_unlock(&head->lock);
		if(thread->state&ACORAL_THREAD_STATE_SUSPEND){
300091d4:	e59d3010 	ldr	r3, [sp, #16]
300091d8:	e5d33004 	ldrb	r3, [r3, #4]
300091dc:	e2033002 	and	r3, r3, #2
300091e0:	e3530000 	cmp	r3, #0
300091e4:	0a000013 	beq	30009238 <period_delay_deal+0x130>
			thread->stack=(acoral_u32 *)((acoral_8 *)thread->stack_buttom+thread->stack_size-4);
300091e8:	e59d3010 	ldr	r3, [sp, #16]
300091ec:	e5932038 	ldr	r2, [r3, #56]	; 0x38
300091f0:	e59d3010 	ldr	r3, [sp, #16]
300091f4:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
300091f8:	e2433004 	sub	r3, r3, #4
300091fc:	e0822003 	add	r2, r2, r3
30009200:	e59d3010 	ldr	r3, [sp, #16]
30009204:	e5832034 	str	r2, [r3, #52]	; 0x34
			HAL_STACK_INIT(&thread->stack,private_data->route,period_thread_exit,private_data->args);
30009208:	e59d3010 	ldr	r3, [sp, #16]
3000920c:	e2831034 	add	r1, r3, #52	; 0x34
30009210:	e59d3014 	ldr	r3, [sp, #20]
30009214:	e5932004 	ldr	r2, [r3, #4]
30009218:	e59d3014 	ldr	r3, [sp, #20]
3000921c:	e5933008 	ldr	r3, [r3, #8]
30009220:	e1a00001 	mov	r0, r1
30009224:	e1a01002 	mov	r1, r2
30009228:	e59f2054 	ldr	r2, [pc, #84]	; 30009284 <period_delay_deal+0x17c>
3000922c:	ebffdc23 	bl	300002c0 <hal_stack_init>
			acoral_rdy_thread(thread);
30009230:	e59d0010 	ldr	r0, [sp, #16]
30009234:	ebffe64d 	bl	30002b70 <acoral_rdy_thread>
		}
		period_thread_delay(thread,private_data->time);
30009238:	e59d3014 	ldr	r3, [sp, #20]
3000923c:	e5933000 	ldr	r3, [r3]
30009240:	e59d0010 	ldr	r0, [sp, #16]
30009244:	e1a01003 	mov	r1, r3
30009248:	ebffff96 	bl	300090a8 <period_thread_delay>
	if(acoral_list_empty(head))
	    	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
	ACORAL_ASSERT(thread,"in period thread deal");
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
3000924c:	e59d2004 	ldr	r2, [sp, #4]
30009250:	e59d300c 	ldr	r3, [sp, #12]
30009254:	e1520003 	cmp	r2, r3
30009258:	1affffc5 	bne	30009174 <period_delay_deal+0x6c>
3000925c:	ea000002 	b	3000926c <period_delay_deal+0x164>
	acoral_list_t *tmp,*tmp1,*head;
	acoral_thread_t * thread;
	period_policy_data_t * private_data;
	head=&period_delay_queue.head;
	if(acoral_list_empty(head))
	    	return;
30009260:	e1a00000 	nop			; (mov r0, r0)
30009264:	ea000000 	b	3000926c <period_delay_deal+0x164>
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
		thread=list_entry(tmp,acoral_thread_t,waiting);
		ACORAL_ASSERT(thread,"in period thread deal ");
		if(thread->delay>0)
		    break;
30009268:	e1a00000 	nop			; (mov r0, r0)
			HAL_STACK_INIT(&thread->stack,private_data->route,period_thread_exit,private_data->args);
			acoral_rdy_thread(thread);
		}
		period_thread_delay(thread,private_data->time);
	}
}
3000926c:	e28dd01c 	add	sp, sp, #28
30009270:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009274:	e12fff1e 	bx	lr
30009278:	3000fcf8 	.word	0x3000fcf8
3000927c:	3000e8d8 	.word	0x3000e8d8
30009280:	3000e8f0 	.word	0x3000e8f0
30009284:	30009288 	.word	0x30009288

30009288 <period_thread_exit>:

void period_thread_exit(){
30009288:	e92d4008 	push	{r3, lr}
	acoral_suspend_self();
3000928c:	ebffe54e 	bl	300027cc <acoral_suspend_self>
}
30009290:	e8bd4008 	pop	{r3, lr}
30009294:	e12fff1e 	bx	lr

30009298 <period_policy_init>:

acoral_sched_policy_t period_policy;
void period_policy_init(){
30009298:	e92d4008 	push	{r3, lr}
	acoral_list_init(&period_delay_queue.head);
3000929c:	e59f305c 	ldr	r3, [pc, #92]	; 30009300 <period_policy_init+0x68>
300092a0:	e59f2058 	ldr	r2, [pc, #88]	; 30009300 <period_policy_init+0x68>
300092a4:	e5832000 	str	r2, [r3]
300092a8:	e59f3050 	ldr	r3, [pc, #80]	; 30009300 <period_policy_init+0x68>
300092ac:	e59f204c 	ldr	r2, [pc, #76]	; 30009300 <period_policy_init+0x68>
300092b0:	e5832004 	str	r2, [r3, #4]
	acoral_spin_init(&period_delay_queue.head.lock);
	period_policy.type=ACORAL_SCHED_POLICY_PERIOD;
300092b4:	e59f3048 	ldr	r3, [pc, #72]	; 30009304 <period_policy_init+0x6c>
300092b8:	e3a02016 	mov	r2, #22
300092bc:	e5c32008 	strb	r2, [r3, #8]
	period_policy.policy_thread_init=period_policy_thread_init;
300092c0:	e59f303c 	ldr	r3, [pc, #60]	; 30009304 <period_policy_init+0x6c>
300092c4:	e59f203c 	ldr	r2, [pc, #60]	; 30009308 <period_policy_init+0x70>
300092c8:	e583200c 	str	r2, [r3, #12]
	period_policy.policy_thread_release=period_policy_thread_release;
300092cc:	e59f3030 	ldr	r3, [pc, #48]	; 30009304 <period_policy_init+0x6c>
300092d0:	e59f2034 	ldr	r2, [pc, #52]	; 3000930c <period_policy_init+0x74>
300092d4:	e5832010 	str	r2, [r3, #16]
	period_policy.delay_deal=period_delay_deal;
300092d8:	e59f3024 	ldr	r3, [pc, #36]	; 30009304 <period_policy_init+0x6c>
300092dc:	e59f202c 	ldr	r2, [pc, #44]	; 30009310 <period_policy_init+0x78>
300092e0:	e5832014 	str	r2, [r3, #20]
	period_policy.name="period";
300092e4:	e59f3018 	ldr	r3, [pc, #24]	; 30009304 <period_policy_init+0x6c>
300092e8:	e59f2024 	ldr	r2, [pc, #36]	; 30009314 <period_policy_init+0x7c>
300092ec:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&period_policy);
300092f0:	e59f000c 	ldr	r0, [pc, #12]	; 30009304 <period_policy_init+0x6c>
300092f4:	ebffe2d9 	bl	30001e60 <acoral_register_sched_policy>
}
300092f8:	e8bd4008 	pop	{r3, lr}
300092fc:	e12fff1e 	bx	lr
30009300:	3000fcf8 	.word	0x3000fcf8
30009304:	30010638 	.word	0x30010638
30009308:	30008d90 	.word	0x30008d90
3000930c:	30008f74 	.word	0x30008f74
30009310:	30009108 	.word	0x30009108
30009314:	3000e908 	.word	0x3000e908

30009318 <slice_policy_thread_init>:
#include<policy.h>
#include<timer.h>
#include<mem.h>
#include<slice_thrd.h>
acoral_sched_policy_t slice_policy;
acoral_id slice_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30009318:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000931c:	e24dd024 	sub	sp, sp, #36	; 0x24
30009320:	e58d000c 	str	r0, [sp, #12]
30009324:	e58d1008 	str	r1, [sp, #8]
30009328:	e58d2004 	str	r2, [sp, #4]
3000932c:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 prio;
	acoral_slice_policy_data_t *policy_data;
	slice_policy_data_t *private_data;
	if(thread->policy==ACORAL_SCHED_POLICY_SLICE){
30009330:	e59d300c 	ldr	r3, [sp, #12]
30009334:	e5d3300c 	ldrb	r3, [r3, #12]
30009338:	e3530018 	cmp	r3, #24
3000933c:	1a000046 	bne	3000945c <slice_policy_thread_init+0x144>
		policy_data=(acoral_slice_policy_data_t *)data;
30009340:	e59d3000 	ldr	r3, [sp]
30009344:	e58d3018 	str	r3, [sp, #24]
		thread->cpu=policy_data->cpu;
30009348:	e59d3018 	ldr	r3, [sp, #24]
3000934c:	e5d32000 	ldrb	r2, [r3]
30009350:	e59d300c 	ldr	r3, [sp, #12]
30009354:	e5c32006 	strb	r2, [r3, #6]
		prio=policy_data->prio;
30009358:	e59d3018 	ldr	r3, [sp, #24]
3000935c:	e5d33001 	ldrb	r3, [r3, #1]
30009360:	e58d3014 	str	r3, [sp, #20]
		if(policy_data->prio_type==ACORAL_BASE_PRIO){
30009364:	e59d3018 	ldr	r3, [sp, #24]
30009368:	e5d33002 	ldrb	r3, [r3, #2]
3000936c:	e3530002 	cmp	r3, #2
30009370:	1a000007 	bne	30009394 <slice_policy_thread_init+0x7c>
			prio+=ACORAL_BASE_PRIO_MIN;
30009374:	e59d3014 	ldr	r3, [sp, #20]
30009378:	e2833002 	add	r3, r3, #2
3000937c:	e58d3014 	str	r3, [sp, #20]
			if(prio>=ACORAL_BASE_PRIO_MAX)
30009380:	e59d3014 	ldr	r3, [sp, #20]
30009384:	e3530026 	cmp	r3, #38	; 0x26
30009388:	9a000001 	bls	30009394 <slice_policy_thread_init+0x7c>
				prio=ACORAL_BASE_PRIO_MAX-1;
3000938c:	e3a03026 	mov	r3, #38	; 0x26
30009390:	e58d3014 	str	r3, [sp, #20]
		}
		thread->prio=prio;
30009394:	e59d3014 	ldr	r3, [sp, #20]
30009398:	e20320ff 	and	r2, r3, #255	; 0xff
3000939c:	e59d300c 	ldr	r3, [sp, #12]
300093a0:	e5c32005 	strb	r2, [r3, #5]
		private_data=(slice_policy_data_t *)acoral_malloc2(sizeof(slice_policy_data_t));
300093a4:	e3a00004 	mov	r0, #4
300093a8:	ebfff694 	bl	30006e00 <v_malloc>
300093ac:	e1a03000 	mov	r3, r0
300093b0:	e58d301c 	str	r3, [sp, #28]
		if(private_data==NULL){
300093b4:	e59d301c 	ldr	r3, [sp, #28]
300093b8:	e3530000 	cmp	r3, #0
300093bc:	1a00000e 	bne	300093fc <slice_policy_thread_init+0xe4>
			acoral_printerr("No level2 mem space for private_data:%s\n",thread->name);
300093c0:	e59d300c 	ldr	r3, [sp, #12]
300093c4:	e5933048 	ldr	r3, [r3, #72]	; 0x48
300093c8:	e59f0108 	ldr	r0, [pc, #264]	; 300094d8 <slice_policy_thread_init+0x1c0>
300093cc:	e1a01003 	mov	r1, r3
300093d0:	eb000813 	bl	3000b424 <acoral_print>
			HAL_ENTER_CRITICAL();
300093d4:	ebffe0c6 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300093d8:	e1a03000 	mov	r3, r0
300093dc:	e58d3010 	str	r3, [sp, #16]
			acoral_release_res((acoral_res_t *)thread);
300093e0:	e59d300c 	ldr	r3, [sp, #12]
300093e4:	e1a00003 	mov	r0, r3
300093e8:	ebffe88c 	bl	30003620 <acoral_release_res>
			HAL_EXIT_CRITICAL();
300093ec:	e59d0010 	ldr	r0, [sp, #16]
300093f0:	ebffe0bd 	bl	300016ec <HAL_INTR_RESTORE>
			return -1;
300093f4:	e3e03000 	mvn	r3, #0
300093f8:	ea000032 	b	300094c8 <slice_policy_thread_init+0x1b0>
		}
		private_data->slice_ld=TIME_TO_TICKS(policy_data->slice);
300093fc:	e59d3018 	ldr	r3, [sp, #24]
30009400:	e5932004 	ldr	r2, [r3, #4]
30009404:	e1a03002 	mov	r3, r2
30009408:	e1a03103 	lsl	r3, r3, #2
3000940c:	e0833002 	add	r3, r3, r2
30009410:	e1a02103 	lsl	r2, r3, #2
30009414:	e0833002 	add	r3, r3, r2
30009418:	e1a03103 	lsl	r3, r3, #2
3000941c:	e1a02003 	mov	r2, r3
30009420:	e59f30b4 	ldr	r3, [pc, #180]	; 300094dc <slice_policy_thread_init+0x1c4>
30009424:	e0831392 	umull	r1, r3, r2, r3
30009428:	e1a02323 	lsr	r2, r3, #6
3000942c:	e59d301c 	ldr	r3, [sp, #28]
30009430:	e5832000 	str	r2, [r3]
		thread->slice=private_data->slice_ld;
30009434:	e59d301c 	ldr	r3, [sp, #28]
30009438:	e5932000 	ldr	r2, [r3]
3000943c:	e59d300c 	ldr	r3, [sp, #12]
30009440:	e5832044 	str	r2, [r3, #68]	; 0x44
		thread->private_data=private_data;
30009444:	e59d300c 	ldr	r3, [sp, #12]
30009448:	e59d201c 	ldr	r2, [sp, #28]
3000944c:	e5832050 	str	r2, [r3, #80]	; 0x50
		thread->cpu_mask=-1;
30009450:	e59d300c 	ldr	r3, [sp, #12]
30009454:	e3e02000 	mvn	r2, #0
30009458:	e5832008 	str	r2, [r3, #8]
	}
	if(acoral_thread_init(thread,route,acoral_thread_exit,args)!=0){
3000945c:	e59d000c 	ldr	r0, [sp, #12]
30009460:	e59d1008 	ldr	r1, [sp, #8]
30009464:	e59f2074 	ldr	r2, [pc, #116]	; 300094e0 <slice_policy_thread_init+0x1c8>
30009468:	e59d3004 	ldr	r3, [sp, #4]
3000946c:	ebffe601 	bl	30002c78 <acoral_thread_init>
30009470:	e1a03000 	mov	r3, r0
30009474:	e3530000 	cmp	r3, #0
30009478:	0a00000e 	beq	300094b8 <slice_policy_thread_init+0x1a0>
		acoral_printerr("No thread stack:%s\n",thread->name);
3000947c:	e59d300c 	ldr	r3, [sp, #12]
30009480:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30009484:	e59f0058 	ldr	r0, [pc, #88]	; 300094e4 <slice_policy_thread_init+0x1cc>
30009488:	e1a01003 	mov	r1, r3
3000948c:	eb0007e4 	bl	3000b424 <acoral_print>
		HAL_ENTER_CRITICAL();
30009490:	ebffe097 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30009494:	e1a03000 	mov	r3, r0
30009498:	e58d3010 	str	r3, [sp, #16]
		acoral_release_res((acoral_res_t *)thread);
3000949c:	e59d300c 	ldr	r3, [sp, #12]
300094a0:	e1a00003 	mov	r0, r3
300094a4:	ebffe85d 	bl	30003620 <acoral_release_res>
		HAL_EXIT_CRITICAL();
300094a8:	e59d0010 	ldr	r0, [sp, #16]
300094ac:	ebffe08e 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
300094b0:	e3e03000 	mvn	r3, #0
300094b4:	ea000003 	b	300094c8 <slice_policy_thread_init+0x1b0>
	}
        /*将线程就绪，并重新调度*/
	acoral_resume_thread(thread);
300094b8:	e59d000c 	ldr	r0, [sp, #12]
300094bc:	ebffe4e4 	bl	30002854 <acoral_resume_thread>
	return thread->res.id;
300094c0:	e59d300c 	ldr	r3, [sp, #12]
300094c4:	e5933000 	ldr	r3, [r3]
}
300094c8:	e1a00003 	mov	r0, r3
300094cc:	e28dd024 	add	sp, sp, #36	; 0x24
300094d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300094d4:	e12fff1e 	bx	lr
300094d8:	3000e910 	.word	0x3000e910
300094dc:	10624dd3 	.word	0x10624dd3
300094e0:	30002a68 	.word	0x30002a68
300094e4:	3000e93c 	.word	0x3000e93c

300094e8 <slice_policy_thread_release>:

void slice_policy_thread_release(acoral_thread_t *thread){
300094e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300094ec:	e24dd00c 	sub	sp, sp, #12
300094f0:	e58d0004 	str	r0, [sp, #4]
	acoral_free2(thread->private_data);	
300094f4:	e59d3004 	ldr	r3, [sp, #4]
300094f8:	e5933050 	ldr	r3, [r3, #80]	; 0x50
300094fc:	e1a00003 	mov	r0, r3
30009500:	ebfff653 	bl	30006e54 <v_free>
}
30009504:	e28dd00c 	add	sp, sp, #12
30009508:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000950c:	e12fff1e 	bx	lr

30009510 <slice_delay_deal>:

void slice_delay_deal(){
30009510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009514:	e24dd00c 	sub	sp, sp, #12
#ifndef CFG_TICKS_PRIVATE
	acoral_u32 i;
	for(i=0;i<HAL_MAX_CPU;i++){
		cur=acoral_get_running_thread(i);
#else
		cur=acoral_cur_thread;
30009518:	e59f3068 	ldr	r3, [pc, #104]	; 30009588 <slice_delay_deal+0x78>
3000951c:	e5933000 	ldr	r3, [r3]
30009520:	e58d3000 	str	r3, [sp]
#endif
		if(cur->policy==ACORAL_SCHED_POLICY_SLICE){
30009524:	e59d3000 	ldr	r3, [sp]
30009528:	e5d3300c 	ldrb	r3, [r3, #12]
3000952c:	e3530018 	cmp	r3, #24
30009530:	1a000011 	bne	3000957c <slice_delay_deal+0x6c>
			cur->slice--;
30009534:	e59d3000 	ldr	r3, [sp]
30009538:	e5933044 	ldr	r3, [r3, #68]	; 0x44
3000953c:	e2432001 	sub	r2, r3, #1
30009540:	e59d3000 	ldr	r3, [sp]
30009544:	e5832044 	str	r2, [r3, #68]	; 0x44
			if(cur->slice<=0){
30009548:	e59d3000 	ldr	r3, [sp]
3000954c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
30009550:	e3530000 	cmp	r3, #0
30009554:	1a000008 	bne	3000957c <slice_delay_deal+0x6c>
				data=(slice_policy_data_t *)cur->private_data;
30009558:	e59d3000 	ldr	r3, [sp]
3000955c:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30009560:	e58d3004 	str	r3, [sp, #4]
				cur->slice=data->slice_ld;
30009564:	e59d3004 	ldr	r3, [sp, #4]
30009568:	e5932000 	ldr	r2, [r3]
3000956c:	e59d3000 	ldr	r3, [sp]
30009570:	e5832044 	str	r2, [r3, #68]	; 0x44
				acoral_thread_move2_tail(cur);
30009574:	e59d0000 	ldr	r0, [sp]
30009578:	ebffe59a 	bl	30002be8 <acoral_thread_move2_tail>
			}
		}
#ifndef CFG_TICKS_PRIVATE
	}
#endif
}
3000957c:	e28dd00c 	add	sp, sp, #12
30009580:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009584:	e12fff1e 	bx	lr
30009588:	30010630 	.word	0x30010630

3000958c <slice_policy_init>:

void slice_policy_init(){
3000958c:	e92d4008 	push	{r3, lr}
	slice_policy.type=ACORAL_SCHED_POLICY_SLICE;
30009590:	e59f3044 	ldr	r3, [pc, #68]	; 300095dc <slice_policy_init+0x50>
30009594:	e3a02018 	mov	r2, #24
30009598:	e5c32008 	strb	r2, [r3, #8]
	slice_policy.policy_thread_release=slice_policy_thread_release;
3000959c:	e59f3038 	ldr	r3, [pc, #56]	; 300095dc <slice_policy_init+0x50>
300095a0:	e59f2038 	ldr	r2, [pc, #56]	; 300095e0 <slice_policy_init+0x54>
300095a4:	e5832010 	str	r2, [r3, #16]
	slice_policy.policy_thread_init=slice_policy_thread_init;
300095a8:	e59f302c 	ldr	r3, [pc, #44]	; 300095dc <slice_policy_init+0x50>
300095ac:	e59f2030 	ldr	r2, [pc, #48]	; 300095e4 <slice_policy_init+0x58>
300095b0:	e583200c 	str	r2, [r3, #12]
	slice_policy.delay_deal=slice_delay_deal;
300095b4:	e59f3020 	ldr	r3, [pc, #32]	; 300095dc <slice_policy_init+0x50>
300095b8:	e59f2028 	ldr	r2, [pc, #40]	; 300095e8 <slice_policy_init+0x5c>
300095bc:	e5832014 	str	r2, [r3, #20]
	slice_policy.name="slice";
300095c0:	e59f3014 	ldr	r3, [pc, #20]	; 300095dc <slice_policy_init+0x50>
300095c4:	e59f2020 	ldr	r2, [pc, #32]	; 300095ec <slice_policy_init+0x60>
300095c8:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&slice_policy);
300095cc:	e59f0008 	ldr	r0, [pc, #8]	; 300095dc <slice_policy_init+0x50>
300095d0:	ebffe222 	bl	30001e60 <acoral_register_sched_policy>
}
300095d4:	e8bd4008 	pop	{r3, lr}
300095d8:	e12fff1e 	bx	lr
300095dc:	3000fb98 	.word	0x3000fb98
300095e0:	300094e8 	.word	0x300094e8
300095e4:	30009318 	.word	0x30009318
300095e8:	30009510 	.word	0x30009510
300095ec:	3000e950 	.word	0x3000e950

300095f0 <posix_delay_deal>:
#include<policy.h>
#include<mem.h>
#include<timer.h>
#include<posix_thrd.h>
#define POSIX_SLICE_RATE 5
void posix_delay_deal(){
300095f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300095f4:	e24dd00c 	sub	sp, sp, #12
#ifndef CFG_TICKS_PRIVATE
	acoral_u32 i;
	for(i=0;i<HAL_MAX_CPU;i++){
		cur=acoral_get_running_thread(i);
#else
		cur=acoral_cur_thread;
300095f8:	e59f3178 	ldr	r3, [pc, #376]	; 30009778 <posix_delay_deal+0x188>
300095fc:	e5933000 	ldr	r3, [r3]
30009600:	e58d3000 	str	r3, [sp]
#endif
		if(cur->policy==ACORAL_SCHED_POLICY_POSIX){
30009604:	e59d3000 	ldr	r3, [sp]
30009608:	e5d3300c 	ldrb	r3, [r3, #12]
3000960c:	e3530019 	cmp	r3, #25
30009610:	1a000055 	bne	3000976c <posix_delay_deal+0x17c>
			cur->slice--;
30009614:	e59d3000 	ldr	r3, [sp]
30009618:	e5933044 	ldr	r3, [r3, #68]	; 0x44
3000961c:	e2432001 	sub	r2, r3, #1
30009620:	e59d3000 	ldr	r3, [sp]
30009624:	e5832044 	str	r2, [r3, #68]	; 0x44
			if(cur->slice==0){
30009628:	e59d3000 	ldr	r3, [sp]
3000962c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
30009630:	e3530000 	cmp	r3, #0
30009634:	1a00004c 	bne	3000976c <posix_delay_deal+0x17c>
				data=(posix_policy_data_t *)cur->private_data;
30009638:	e59d3000 	ldr	r3, [sp]
3000963c:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30009640:	e58d3004 	str	r3, [sp, #4]
				data->stair++;
30009644:	e59d3004 	ldr	r3, [sp, #4]
30009648:	e5d33008 	ldrb	r3, [r3, #8]
3000964c:	e2833001 	add	r3, r3, #1
30009650:	e20320ff 	and	r2, r3, #255	; 0xff
30009654:	e59d3004 	ldr	r3, [sp, #4]
30009658:	e5c32008 	strb	r2, [r3, #8]
				if(data->stair>=ACORAL_POSIX_PRIO_MAX){
3000965c:	e59d3004 	ldr	r3, [sp, #4]
30009660:	e5d33008 	ldrb	r3, [r3, #8]
30009664:	e3530044 	cmp	r3, #68	; 0x44
30009668:	9a000029 	bls	30009714 <posix_delay_deal+0x124>
					if(data->time<ACORAL_POSIX_STAIR_NUM){
3000966c:	e59d3004 	ldr	r3, [sp, #4]
30009670:	e5d33009 	ldrb	r3, [r3, #9]
30009674:	e353001d 	cmp	r3, #29
30009678:	8a00000c 	bhi	300096b0 <posix_delay_deal+0xc0>
						data->stair=ACORAL_POSIX_PRIO_MIN+data->time;
3000967c:	e59d3004 	ldr	r3, [sp, #4]
30009680:	e5d33009 	ldrb	r3, [r3, #9]
30009684:	e2833027 	add	r3, r3, #39	; 0x27
30009688:	e20320ff 	and	r2, r3, #255	; 0xff
3000968c:	e59d3004 	ldr	r3, [sp, #4]
30009690:	e5c32008 	strb	r2, [r3, #8]
						data->time++;
30009694:	e59d3004 	ldr	r3, [sp, #4]
30009698:	e5d33009 	ldrb	r3, [r3, #9]
3000969c:	e2833001 	add	r3, r3, #1
300096a0:	e20320ff 	and	r2, r3, #255	; 0xff
300096a4:	e59d3004 	ldr	r3, [sp, #4]
300096a8:	e5c32009 	strb	r2, [r3, #9]
300096ac:	ea000018 	b	30009714 <posix_delay_deal+0x124>
					}
					else{
						cur->policy=ACORAL_SCHED_POLICY_SLICE;
300096b0:	e59d3000 	ldr	r3, [sp]
300096b4:	e3a02018 	mov	r2, #24
300096b8:	e5c3200c 	strb	r2, [r3, #12]
						((slice_policy_data_t *)data)->slice_ld=TIME_TO_TICKS(data->time<<POSIX_SLICE_RATE);
300096bc:	e59d1004 	ldr	r1, [sp, #4]
300096c0:	e59d3004 	ldr	r3, [sp, #4]
300096c4:	e5d33009 	ldrb	r3, [r3, #9]
300096c8:	e1a02283 	lsl	r2, r3, #5
300096cc:	e1a03002 	mov	r3, r2
300096d0:	e1a03103 	lsl	r3, r3, #2
300096d4:	e0833002 	add	r3, r3, r2
300096d8:	e1a02103 	lsl	r2, r3, #2
300096dc:	e0833002 	add	r3, r3, r2
300096e0:	e1a03103 	lsl	r3, r3, #2
300096e4:	e59f2090 	ldr	r2, [pc, #144]	; 3000977c <posix_delay_deal+0x18c>
300096e8:	e0c20293 	smull	r0, r2, r3, r2
300096ec:	e1a02342 	asr	r2, r2, #6
300096f0:	e1a03fc3 	asr	r3, r3, #31
300096f4:	e0633002 	rsb	r3, r3, r2
300096f8:	e5813000 	str	r3, [r1]
						data->stair--;
300096fc:	e59d3004 	ldr	r3, [sp, #4]
30009700:	e5d33008 	ldrb	r3, [r3, #8]
30009704:	e2433001 	sub	r3, r3, #1
30009708:	e20320ff 	and	r2, r3, #255	; 0xff
3000970c:	e59d3004 	ldr	r3, [sp, #4]
30009710:	e5c32008 	strb	r2, [r3, #8]
					}
				}
				cur->slice=TIME_TO_TICKS(data->time<<POSIX_SLICE_RATE);
30009714:	e59d3004 	ldr	r3, [sp, #4]
30009718:	e5d33009 	ldrb	r3, [r3, #9]
3000971c:	e1a02283 	lsl	r2, r3, #5
30009720:	e1a03002 	mov	r3, r2
30009724:	e1a03103 	lsl	r3, r3, #2
30009728:	e0833002 	add	r3, r3, r2
3000972c:	e1a02103 	lsl	r2, r3, #2
30009730:	e0833002 	add	r3, r3, r2
30009734:	e1a03103 	lsl	r3, r3, #2
30009738:	e59f203c 	ldr	r2, [pc, #60]	; 3000977c <posix_delay_deal+0x18c>
3000973c:	e0c21293 	smull	r1, r2, r3, r2
30009740:	e1a02342 	asr	r2, r2, #6
30009744:	e1a03fc3 	asr	r3, r3, #31
30009748:	e0633002 	rsb	r3, r3, r2
3000974c:	e1a02003 	mov	r2, r3
30009750:	e59d3000 	ldr	r3, [sp]
30009754:	e5832044 	str	r2, [r3, #68]	; 0x44
				acoral_thread_change_prio(cur,data->stair);
30009758:	e59d3004 	ldr	r3, [sp, #4]
3000975c:	e5d33008 	ldrb	r3, [r3, #8]
30009760:	e59d0000 	ldr	r0, [sp]
30009764:	e1a01003 	mov	r1, r3
30009768:	ebffe4c6 	bl	30002a88 <acoral_thread_change_prio>
			}
		}
#ifndef CFG_TICKS_PRIVATE
	}
#endif
}
3000976c:	e28dd00c 	add	sp, sp, #12
30009770:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009774:	e12fff1e 	bx	lr
30009778:	30010630 	.word	0x30010630
3000977c:	10624dd3 	.word	0x10624dd3

30009780 <acoral_posix_create>:

void acoral_posix_create(acoral_id* id,acoral_posix_policy_data_t *data,void (*route)(void *args),void *args){
30009780:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009784:	e24dd01c 	sub	sp, sp, #28
30009788:	e58d000c 	str	r0, [sp, #12]
3000978c:	e58d1008 	str	r1, [sp, #8]
30009790:	e58d2004 	str	r2, [sp, #4]
30009794:	e58d3000 	str	r3, [sp]
	acoral_thread_t *thread;
	thread=acoral_alloc_thread();
30009798:	ebffe52e 	bl	30002c58 <acoral_alloc_thread>
3000979c:	e1a03000 	mov	r3, r0
300097a0:	e58d3014 	str	r3, [sp, #20]
	if(NULL==thread){
300097a4:	e59d3014 	ldr	r3, [sp, #20]
300097a8:	e3530000 	cmp	r3, #0
300097ac:	1a000002 	bne	300097bc <acoral_posix_create+0x3c>
		acoral_printerr("Alloc Posix thread fail\n");
300097b0:	e59f0084 	ldr	r0, [pc, #132]	; 3000983c <acoral_posix_create+0xbc>
300097b4:	eb00071a 	bl	3000b424 <acoral_print>
		acoral_printk("No Mem Space or Beyond the max thread\n");
		return ;
300097b8:	ea00001c 	b	30009830 <acoral_posix_create+0xb0>
	}
	thread->stack_size=0;
300097bc:	e59d3014 	ldr	r3, [sp, #20]
300097c0:	e3a02000 	mov	r2, #0
300097c4:	e583203c 	str	r2, [r3, #60]	; 0x3c
	thread->stack_buttom=NULL;
300097c8:	e59d3014 	ldr	r3, [sp, #20]
300097cc:	e3a02000 	mov	r2, #0
300097d0:	e5832038 	str	r2, [r3, #56]	; 0x38
	thread->name=NULL;
300097d4:	e59d3014 	ldr	r3, [sp, #20]
300097d8:	e3a02000 	mov	r2, #0
300097dc:	e5832048 	str	r2, [r3, #72]	; 0x48
	thread->policy=ACORAL_SCHED_POLICY_POSIX;
300097e0:	e59d3014 	ldr	r3, [sp, #20]
300097e4:	e3a02019 	mov	r2, #25
300097e8:	e5c3200c 	strb	r2, [r3, #12]
	if(id!=NULL)
300097ec:	e59d300c 	ldr	r3, [sp, #12]
300097f0:	e3530000 	cmp	r3, #0
300097f4:	0a000008 	beq	3000981c <acoral_posix_create+0x9c>
		*id=posix_policy_thread_init(thread,route,args,data);
300097f8:	e59d0014 	ldr	r0, [sp, #20]
300097fc:	e59d1004 	ldr	r1, [sp, #4]
30009800:	e59d2000 	ldr	r2, [sp]
30009804:	e59d3008 	ldr	r3, [sp, #8]
30009808:	eb00000c 	bl	30009840 <posix_policy_thread_init>
3000980c:	e1a02000 	mov	r2, r0
30009810:	e59d300c 	ldr	r3, [sp, #12]
30009814:	e5832000 	str	r2, [r3]
30009818:	ea000004 	b	30009830 <acoral_posix_create+0xb0>
	else
		posix_policy_thread_init(thread,route,args,data);
3000981c:	e59d0014 	ldr	r0, [sp, #20]
30009820:	e59d1004 	ldr	r1, [sp, #4]
30009824:	e59d2000 	ldr	r2, [sp]
30009828:	e59d3008 	ldr	r3, [sp, #8]
3000982c:	eb000003 	bl	30009840 <posix_policy_thread_init>
}
30009830:	e28dd01c 	add	sp, sp, #28
30009834:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009838:	e12fff1e 	bx	lr
3000983c:	3000e958 	.word	0x3000e958

30009840 <posix_policy_thread_init>:

acoral_id posix_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30009840:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009844:	e24dd024 	sub	sp, sp, #36	; 0x24
30009848:	e58d000c 	str	r0, [sp, #12]
3000984c:	e58d1008 	str	r1, [sp, #8]
30009850:	e58d2004 	str	r2, [sp, #4]
30009854:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_posix_policy_data_t *policy_data;
	posix_policy_data_t *private_data;
	policy_data=(acoral_posix_policy_data_t *)data;
30009858:	e59d3000 	ldr	r3, [sp]
3000985c:	e58d3018 	str	r3, [sp, #24]
	private_data=(posix_policy_data_t *)posix_malloc(sizeof(posix_policy_data_t));
30009860:	e3a0000c 	mov	r0, #12
30009864:	ebfff565 	bl	30006e00 <v_malloc>
30009868:	e1a03000 	mov	r3, r0
3000986c:	e58d301c 	str	r3, [sp, #28]
	if(private_data==NULL){
30009870:	e59d301c 	ldr	r3, [sp, #28]
30009874:	e3530000 	cmp	r3, #0
30009878:	1a00000e 	bne	300098b8 <posix_policy_thread_init+0x78>
		acoral_printerr("No mem space for posix private_data:%s\n",thread->name);
3000987c:	e59d300c 	ldr	r3, [sp, #12]
30009880:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30009884:	e59f01a4 	ldr	r0, [pc, #420]	; 30009a30 <posix_policy_thread_init+0x1f0>
30009888:	e1a01003 	mov	r1, r3
3000988c:	eb0006e4 	bl	3000b424 <acoral_print>
		HAL_ENTER_CRITICAL();
30009890:	ebffdf97 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30009894:	e1a03000 	mov	r3, r0
30009898:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
3000989c:	e59d300c 	ldr	r3, [sp, #12]
300098a0:	e1a00003 	mov	r0, r3
300098a4:	ebffe75d 	bl	30003620 <acoral_release_res>
		HAL_EXIT_CRITICAL();
300098a8:	e59d0014 	ldr	r0, [sp, #20]
300098ac:	ebffdf8e 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
300098b0:	e3e03000 	mvn	r3, #0
300098b4:	ea000059 	b	30009a20 <posix_policy_thread_init+0x1e0>
	}
	posix_policy_data_init(private_data);
300098b8:	e59d001c 	ldr	r0, [sp, #28]
300098bc:	eb000069 	bl	30009a68 <posix_policy_data_init>
	if(policy_data!=NULL){
300098c0:	e59d3018 	ldr	r3, [sp, #24]
300098c4:	e3530000 	cmp	r3, #0
300098c8:	0a000014 	beq	30009920 <posix_policy_thread_init+0xe0>
		private_data->attach_state=policy_data->attach_state;
300098cc:	e59d3018 	ldr	r3, [sp, #24]
300098d0:	e5d32004 	ldrb	r2, [r3, #4]
300098d4:	e59d301c 	ldr	r3, [sp, #28]
300098d8:	e5c32004 	strb	r2, [r3, #4]
		private_data->cpu_mask=policy_data->cpu_mask;
300098dc:	e59d3018 	ldr	r3, [sp, #24]
300098e0:	e5933008 	ldr	r3, [r3, #8]
300098e4:	e20320ff 	and	r2, r3, #255	; 0xff
300098e8:	e59d301c 	ldr	r3, [sp, #28]
300098ec:	e5c32007 	strb	r2, [r3, #7]
		private_data->cancel_type=policy_data->cancel_type;
300098f0:	e59d3018 	ldr	r3, [sp, #24]
300098f4:	e5d32005 	ldrb	r2, [r3, #5]
300098f8:	e59d301c 	ldr	r3, [sp, #28]
300098fc:	e5c32005 	strb	r2, [r3, #5]
		private_data->cancel_enable=policy_data->cancel_enable;
30009900:	e59d3018 	ldr	r3, [sp, #24]
30009904:	e5d32006 	ldrb	r2, [r3, #6]
30009908:	e59d301c 	ldr	r3, [sp, #28]
3000990c:	e5c32006 	strb	r2, [r3, #6]
		thread->stack_size=policy_data->stack_size;
30009910:	e59d3018 	ldr	r3, [sp, #24]
30009914:	e593200c 	ldr	r2, [r3, #12]
30009918:	e59d300c 	ldr	r3, [sp, #12]
3000991c:	e583203c 	str	r2, [r3, #60]	; 0x3c
	}
	thread->private_data=private_data;
30009920:	e59d300c 	ldr	r3, [sp, #12]
30009924:	e59d201c 	ldr	r2, [sp, #28]
30009928:	e5832050 	str	r2, [r3, #80]	; 0x50
	if(thread->stack_size==0)
3000992c:	e59d300c 	ldr	r3, [sp, #12]
30009930:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
30009934:	e3530000 	cmp	r3, #0
30009938:	1a000002 	bne	30009948 <posix_policy_thread_init+0x108>
		thread->stack_size=POSIX_DEFAULT_STACK_SIZE;
3000993c:	e59d300c 	ldr	r3, [sp, #12]
30009940:	e3a02b05 	mov	r2, #5120	; 0x1400
30009944:	e583203c 	str	r2, [r3, #60]	; 0x3c
	thread->cpu=-1;
30009948:	e59d300c 	ldr	r3, [sp, #12]
3000994c:	e3e02000 	mvn	r2, #0
30009950:	e5c32006 	strb	r2, [r3, #6]
	thread->cpu_mask=-1;
30009954:	e59d300c 	ldr	r3, [sp, #12]
30009958:	e3e02000 	mvn	r2, #0
3000995c:	e5832008 	str	r2, [r3, #8]
	thread->prio=private_data->stair;
30009960:	e59d301c 	ldr	r3, [sp, #28]
30009964:	e5d32008 	ldrb	r2, [r3, #8]
30009968:	e59d300c 	ldr	r3, [sp, #12]
3000996c:	e5c32005 	strb	r2, [r3, #5]
	thread->slice=TIME_TO_TICKS(private_data->time<<POSIX_SLICE_RATE);
30009970:	e59d301c 	ldr	r3, [sp, #28]
30009974:	e5d33009 	ldrb	r3, [r3, #9]
30009978:	e1a02283 	lsl	r2, r3, #5
3000997c:	e1a03002 	mov	r3, r2
30009980:	e1a03103 	lsl	r3, r3, #2
30009984:	e0833002 	add	r3, r3, r2
30009988:	e1a02103 	lsl	r2, r3, #2
3000998c:	e0833002 	add	r3, r3, r2
30009990:	e1a03103 	lsl	r3, r3, #2
30009994:	e59f2098 	ldr	r2, [pc, #152]	; 30009a34 <posix_policy_thread_init+0x1f4>
30009998:	e0c21293 	smull	r1, r2, r3, r2
3000999c:	e1a02342 	asr	r2, r2, #6
300099a0:	e1a03fc3 	asr	r3, r3, #31
300099a4:	e0633002 	rsb	r3, r3, r2
300099a8:	e1a02003 	mov	r2, r3
300099ac:	e59d300c 	ldr	r3, [sp, #12]
300099b0:	e5832044 	str	r2, [r3, #68]	; 0x44
	if(acoral_thread_init(thread,route,acoral_thread_exit,args)!=0){
300099b4:	e59d000c 	ldr	r0, [sp, #12]
300099b8:	e59d1008 	ldr	r1, [sp, #8]
300099bc:	e59f2074 	ldr	r2, [pc, #116]	; 30009a38 <posix_policy_thread_init+0x1f8>
300099c0:	e59d3004 	ldr	r3, [sp, #4]
300099c4:	ebffe4ab 	bl	30002c78 <acoral_thread_init>
300099c8:	e1a03000 	mov	r3, r0
300099cc:	e3530000 	cmp	r3, #0
300099d0:	0a00000e 	beq	30009a10 <posix_policy_thread_init+0x1d0>
		acoral_printerr("No thread stack:%s\n",thread->name);
300099d4:	e59d300c 	ldr	r3, [sp, #12]
300099d8:	e5933048 	ldr	r3, [r3, #72]	; 0x48
300099dc:	e59f0058 	ldr	r0, [pc, #88]	; 30009a3c <posix_policy_thread_init+0x1fc>
300099e0:	e1a01003 	mov	r1, r3
300099e4:	eb00068e 	bl	3000b424 <acoral_print>
		HAL_ENTER_CRITICAL();
300099e8:	ebffdf41 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300099ec:	e1a03000 	mov	r3, r0
300099f0:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
300099f4:	e59d300c 	ldr	r3, [sp, #12]
300099f8:	e1a00003 	mov	r0, r3
300099fc:	ebffe707 	bl	30003620 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30009a00:	e59d0014 	ldr	r0, [sp, #20]
30009a04:	ebffdf38 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
30009a08:	e3e03000 	mvn	r3, #0
30009a0c:	ea000003 	b	30009a20 <posix_policy_thread_init+0x1e0>
	}
	acoral_resume_thread(thread);
30009a10:	e59d000c 	ldr	r0, [sp, #12]
30009a14:	ebffe38e 	bl	30002854 <acoral_resume_thread>
	return thread->res.id;
30009a18:	e59d300c 	ldr	r3, [sp, #12]
30009a1c:	e5933000 	ldr	r3, [r3]
}
30009a20:	e1a00003 	mov	r0, r3
30009a24:	e28dd024 	add	sp, sp, #36	; 0x24
30009a28:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009a2c:	e12fff1e 	bx	lr
30009a30:	3000e974 	.word	0x3000e974
30009a34:	10624dd3 	.word	0x10624dd3
30009a38:	30002a68 	.word	0x30002a68
30009a3c:	3000e99c 	.word	0x3000e99c

30009a40 <posix_policy_thread_release>:

void posix_policy_thread_release(acoral_thread_t *thread){
30009a40:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009a44:	e24dd00c 	sub	sp, sp, #12
30009a48:	e58d0004 	str	r0, [sp, #4]
	posix_free(thread->private_data);
30009a4c:	e59d3004 	ldr	r3, [sp, #4]
30009a50:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30009a54:	e1a00003 	mov	r0, r3
30009a58:	ebfff4fd 	bl	30006e54 <v_free>
}
30009a5c:	e28dd00c 	add	sp, sp, #12
30009a60:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009a64:	e12fff1e 	bx	lr

30009a68 <posix_policy_data_init>:

void posix_policy_data_init(posix_policy_data_t *private_data){
30009a68:	e24dd008 	sub	sp, sp, #8
30009a6c:	e58d0004 	str	r0, [sp, #4]
	private_data->attach_state=POSIX_JOINABLE;
30009a70:	e59d3004 	ldr	r3, [sp, #4]
30009a74:	e3a02001 	mov	r2, #1
30009a78:	e5c32004 	strb	r2, [r3, #4]
	private_data->cancel_type=POSIX_CANCEL_DEFER;
30009a7c:	e59d3004 	ldr	r3, [sp, #4]
30009a80:	e3a02000 	mov	r2, #0
30009a84:	e5c32005 	strb	r2, [r3, #5]
	private_data->cancel_enable=true;
30009a88:	e59d3004 	ldr	r3, [sp, #4]
30009a8c:	e3a02001 	mov	r2, #1
30009a90:	e5c32006 	strb	r2, [r3, #6]
	private_data->cpu_mask=0xff;
30009a94:	e59d3004 	ldr	r3, [sp, #4]
30009a98:	e3e02000 	mvn	r2, #0
30009a9c:	e5c32007 	strb	r2, [r3, #7]
	private_data->stair=ACORAL_POSIX_PRIO_MIN;
30009aa0:	e59d3004 	ldr	r3, [sp, #4]
30009aa4:	e3a02027 	mov	r2, #39	; 0x27
30009aa8:	e5c32008 	strb	r2, [r3, #8]
	private_data->time=1;
30009aac:	e59d3004 	ldr	r3, [sp, #4]
30009ab0:	e3a02001 	mov	r2, #1
30009ab4:	e5c32009 	strb	r2, [r3, #9]
}
30009ab8:	e28dd008 	add	sp, sp, #8
30009abc:	e12fff1e 	bx	lr

30009ac0 <posix_policy_init>:

acoral_sched_policy_t posix_policy;
void posix_policy_init(){
30009ac0:	e92d4008 	push	{r3, lr}
	posix_policy.type=ACORAL_SCHED_POLICY_POSIX;
30009ac4:	e59f3044 	ldr	r3, [pc, #68]	; 30009b10 <posix_policy_init+0x50>
30009ac8:	e3a02019 	mov	r2, #25
30009acc:	e5c32008 	strb	r2, [r3, #8]
	posix_policy.policy_thread_init=posix_policy_thread_init;
30009ad0:	e59f3038 	ldr	r3, [pc, #56]	; 30009b10 <posix_policy_init+0x50>
30009ad4:	e59f2038 	ldr	r2, [pc, #56]	; 30009b14 <posix_policy_init+0x54>
30009ad8:	e583200c 	str	r2, [r3, #12]
	posix_policy.policy_thread_release=posix_policy_thread_release;
30009adc:	e59f302c 	ldr	r3, [pc, #44]	; 30009b10 <posix_policy_init+0x50>
30009ae0:	e59f2030 	ldr	r2, [pc, #48]	; 30009b18 <posix_policy_init+0x58>
30009ae4:	e5832010 	str	r2, [r3, #16]
	posix_policy.delay_deal=posix_delay_deal;
30009ae8:	e59f3020 	ldr	r3, [pc, #32]	; 30009b10 <posix_policy_init+0x50>
30009aec:	e59f2028 	ldr	r2, [pc, #40]	; 30009b1c <posix_policy_init+0x5c>
30009af0:	e5832014 	str	r2, [r3, #20]
	posix_policy.name="posix";
30009af4:	e59f3014 	ldr	r3, [pc, #20]	; 30009b10 <posix_policy_init+0x50>
30009af8:	e59f2020 	ldr	r2, [pc, #32]	; 30009b20 <posix_policy_init+0x60>
30009afc:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&posix_policy);
30009b00:	e59f0008 	ldr	r0, [pc, #8]	; 30009b10 <posix_policy_init+0x50>
30009b04:	ebffe0d5 	bl	30001e60 <acoral_register_sched_policy>
}
30009b08:	e8bd4008 	pop	{r3, lr}
30009b0c:	e12fff1e 	bx	lr
30009b10:	3000f600 	.word	0x3000f600
30009b14:	30009840 	.word	0x30009840
30009b18:	30009a40 	.word	0x30009a40
30009b1c:	300095f0 	.word	0x300095f0
30009b20:	3000e9b0 	.word	0x3000e9b0

30009b24 <delay>:
#include<hal.h>
#include<cpu.h>
#include<policy.h>
acoral_u32 sample_100ms;
volatile acoral_u32 sample;
void delay(){
30009b24:	e24dd008 	sub	sp, sp, #8
	volatile acoral_32 tmp=0xfff;
30009b28:	e3a03eff 	mov	r3, #4080	; 0xff0
30009b2c:	e283300f 	add	r3, r3, #15
30009b30:	e58d3004 	str	r3, [sp, #4]
	while(tmp-->0);
30009b34:	e59d3004 	ldr	r3, [sp, #4]
30009b38:	e3530000 	cmp	r3, #0
30009b3c:	d3a02000 	movle	r2, #0
30009b40:	c3a02001 	movgt	r2, #1
30009b44:	e20220ff 	and	r2, r2, #255	; 0xff
30009b48:	e2433001 	sub	r3, r3, #1
30009b4c:	e58d3004 	str	r3, [sp, #4]
30009b50:	e3520000 	cmp	r2, #0
30009b54:	1afffff6 	bne	30009b34 <delay+0x10>
	sample++;
30009b58:	e59f3014 	ldr	r3, [pc, #20]	; 30009b74 <delay+0x50>
30009b5c:	e5933000 	ldr	r3, [r3]
30009b60:	e2832001 	add	r2, r3, #1
30009b64:	e59f3008 	ldr	r3, [pc, #8]	; 30009b74 <delay+0x50>
30009b68:	e5832000 	str	r2, [r3]
}
30009b6c:	e28dd008 	add	sp, sp, #8
30009b70:	e12fff1e 	bx	lr
30009b74:	30010654 	.word	0x30010654

30009b78 <delay_task>:

void delay_task(void *args){
30009b78:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009b7c:	e24dd00c 	sub	sp, sp, #12
30009b80:	e58d0004 	str	r0, [sp, #4]
	sample=0;
30009b84:	e59f300c 	ldr	r3, [pc, #12]	; 30009b98 <delay_task+0x20>
30009b88:	e3a02000 	mov	r2, #0
30009b8c:	e5832000 	str	r2, [r3]
	for(;;){
		delay();
30009b90:	ebffffe3 	bl	30009b24 <delay>
	}
30009b94:	eafffffd 	b	30009b90 <delay_task+0x18>
30009b98:	30010654 	.word	0x30010654

30009b9c <acoral_soft_delay>:
}

void acoral_soft_delay(acoral_u32 n100ms){
30009b9c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009ba0:	e24dd014 	sub	sp, sp, #20
30009ba4:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 i;
	acoral_u32 tmp=n100ms*sample_100ms;	
30009ba8:	e59f3044 	ldr	r3, [pc, #68]	; 30009bf4 <acoral_soft_delay+0x58>
30009bac:	e5932000 	ldr	r2, [r3]
30009bb0:	e59d3004 	ldr	r3, [sp, #4]
30009bb4:	e0030392 	mul	r3, r2, r3
30009bb8:	e58d300c 	str	r3, [sp, #12]
	for(i=0;i<tmp;i++)
30009bbc:	e3a03000 	mov	r3, #0
30009bc0:	e58d3008 	str	r3, [sp, #8]
30009bc4:	ea000003 	b	30009bd8 <acoral_soft_delay+0x3c>
		delay();
30009bc8:	ebffffd5 	bl	30009b24 <delay>
}

void acoral_soft_delay(acoral_u32 n100ms){
	acoral_u32 i;
	acoral_u32 tmp=n100ms*sample_100ms;	
	for(i=0;i<tmp;i++)
30009bcc:	e59d3008 	ldr	r3, [sp, #8]
30009bd0:	e2833001 	add	r3, r3, #1
30009bd4:	e58d3008 	str	r3, [sp, #8]
30009bd8:	e59d2008 	ldr	r2, [sp, #8]
30009bdc:	e59d300c 	ldr	r3, [sp, #12]
30009be0:	e1520003 	cmp	r2, r3
30009be4:	3afffff7 	bcc	30009bc8 <acoral_soft_delay+0x2c>
		delay();
}
30009be8:	e28dd014 	add	sp, sp, #20
30009bec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009bf0:	e12fff1e 	bx	lr
30009bf4:	3000fcd4 	.word	0x3000fcd4

30009bf8 <soft_delay_init>:

void soft_delay_init(){
30009bf8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009bfc:	e24dd024 	sub	sp, sp, #36	; 0x24
	acoral_sr cpu_sr;
	acoral_comm_policy_data_t data;
	acoral_thread_t *thread;
	acoral_id tmp_id;
	data.cpu=acoral_current_cpu;
30009c00:	e3a03000 	mov	r3, #0
30009c04:	e5cd3010 	strb	r3, [sp, #16]
	data.prio=ACORAL_TMP_PRIO;
30009c08:	e3a03045 	mov	r3, #69	; 0x45
30009c0c:	e5cd3011 	strb	r3, [sp, #17]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
30009c10:	e3a03004 	mov	r3, #4
30009c14:	e5cd3012 	strb	r3, [sp, #18]
	tmp_id=acoral_create_thread_ext(delay_task,256,NULL,"softdelay",NULL,ACORAL_SCHED_POLICY_COMM,&data);
30009c18:	e3a03000 	mov	r3, #0
30009c1c:	e58d3000 	str	r3, [sp]
30009c20:	e3a03015 	mov	r3, #21
30009c24:	e58d3004 	str	r3, [sp, #4]
30009c28:	e28d3010 	add	r3, sp, #16
30009c2c:	e58d3008 	str	r3, [sp, #8]
30009c30:	e59f0090 	ldr	r0, [pc, #144]	; 30009cc8 <soft_delay_init+0xd0>
30009c34:	e3a01c01 	mov	r1, #256	; 0x100
30009c38:	e3a02000 	mov	r2, #0
30009c3c:	e59f3088 	ldr	r3, [pc, #136]	; 30009ccc <soft_delay_init+0xd4>
30009c40:	ebffe001 	bl	30001c4c <create_thread_ext>
30009c44:	e1a03000 	mov	r3, r0
30009c48:	e58d301c 	str	r3, [sp, #28]
	if(tmp_id==-1)
30009c4c:	e59d301c 	ldr	r3, [sp, #28]
30009c50:	e3730001 	cmn	r3, #1
30009c54:	0a000017 	beq	30009cb8 <soft_delay_init+0xc0>
		return;
	acoral_delay_self(1000);
30009c58:	e3a00ffa 	mov	r0, #1000	; 0x3e8
30009c5c:	ebffe342 	bl	3000296c <acoral_delay_self>
	sample_100ms=sample/10;
30009c60:	e59f3068 	ldr	r3, [pc, #104]	; 30009cd0 <soft_delay_init+0xd8>
30009c64:	e5932000 	ldr	r2, [r3]
30009c68:	e59f3064 	ldr	r3, [pc, #100]	; 30009cd4 <soft_delay_init+0xdc>
30009c6c:	e0831392 	umull	r1, r3, r2, r3
30009c70:	e1a021a3 	lsr	r2, r3, #3
30009c74:	e59f305c 	ldr	r3, [pc, #92]	; 30009cd8 <soft_delay_init+0xe0>
30009c78:	e5832000 	str	r2, [r3]
	/*这里daemo回收进程还没启动，不能使用acoral_kill_thread*/
	thread=(acoral_thread_t *)acoral_get_res_by_id(tmp_id);
30009c7c:	e59d001c 	ldr	r0, [sp, #28]
30009c80:	ebffe6fa 	bl	30003870 <acoral_get_res_by_id>
30009c84:	e1a03000 	mov	r3, r0
30009c88:	e58d3018 	str	r3, [sp, #24]
	HAL_ENTER_CRITICAL();
30009c8c:	ebffde98 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30009c90:	e1a03000 	mov	r3, r0
30009c94:	e58d3014 	str	r3, [sp, #20]
	acoral_unrdy_thread(thread);
30009c98:	e59d0018 	ldr	r0, [sp, #24]
30009c9c:	ebffe3c2 	bl	30002bac <acoral_unrdy_thread>
	acoral_release_thread((acoral_res_t *)thread);
30009ca0:	e59d3018 	ldr	r3, [sp, #24]
30009ca4:	e1a00003 	mov	r0, r3
30009ca8:	ebffe29d 	bl	30002724 <acoral_release_thread>
	HAL_EXIT_CRITICAL();
30009cac:	e59d0014 	ldr	r0, [sp, #20]
30009cb0:	ebffde8d 	bl	300016ec <HAL_INTR_RESTORE>
30009cb4:	ea000000 	b	30009cbc <soft_delay_init+0xc4>
	data.cpu=acoral_current_cpu;
	data.prio=ACORAL_TMP_PRIO;
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
	tmp_id=acoral_create_thread_ext(delay_task,256,NULL,"softdelay",NULL,ACORAL_SCHED_POLICY_COMM,&data);
	if(tmp_id==-1)
		return;
30009cb8:	e1a00000 	nop			; (mov r0, r0)
	thread=(acoral_thread_t *)acoral_get_res_by_id(tmp_id);
	HAL_ENTER_CRITICAL();
	acoral_unrdy_thread(thread);
	acoral_release_thread((acoral_res_t *)thread);
	HAL_EXIT_CRITICAL();
}
30009cbc:	e28dd024 	add	sp, sp, #36	; 0x24
30009cc0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009cc4:	e12fff1e 	bx	lr
30009cc8:	30009b78 	.word	0x30009b78
30009ccc:	3000e9b8 	.word	0x3000e9b8
30009cd0:	30010654 	.word	0x30010654
30009cd4:	cccccccd 	.word	0xcccccccd
30009cd8:	3000fcd4 	.word	0x3000fcd4

30009cdc <dummy_print>:
#include<type.h>
acoral_32 dummy_print(const acoral_char *fmt, ...){
30009cdc:	e92d000f 	push	{r0, r1, r2, r3}
}
30009ce0:	e28dd010 	add	sp, sp, #16
30009ce4:	e12fff1e 	bx	lr

30009ce8 <acoral_ffs>:
#include<type.h>
#include<bitops.h>
acoral_u32 acoral_ffs(acoral_u32 word)
{
30009ce8:	e24dd010 	sub	sp, sp, #16
30009cec:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 k;
	k = 31;
30009cf0:	e3a0301f 	mov	r3, #31
30009cf4:	e58d300c 	str	r3, [sp, #12]
	if (word & 0x0000ffff) { k -= 16; word <<= 16; }
30009cf8:	e59d3004 	ldr	r3, [sp, #4]
30009cfc:	e1a03803 	lsl	r3, r3, #16
30009d00:	e1a03823 	lsr	r3, r3, #16
30009d04:	e3530000 	cmp	r3, #0
30009d08:	0a000005 	beq	30009d24 <acoral_ffs+0x3c>
30009d0c:	e59d300c 	ldr	r3, [sp, #12]
30009d10:	e2433010 	sub	r3, r3, #16
30009d14:	e58d300c 	str	r3, [sp, #12]
30009d18:	e59d3004 	ldr	r3, [sp, #4]
30009d1c:	e1a03803 	lsl	r3, r3, #16
30009d20:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x00ff0000) { k -= 8;  word <<= 8;  }
30009d24:	e59d3004 	ldr	r3, [sp, #4]
30009d28:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
30009d2c:	e3530000 	cmp	r3, #0
30009d30:	0a000005 	beq	30009d4c <acoral_ffs+0x64>
30009d34:	e59d300c 	ldr	r3, [sp, #12]
30009d38:	e2433008 	sub	r3, r3, #8
30009d3c:	e58d300c 	str	r3, [sp, #12]
30009d40:	e59d3004 	ldr	r3, [sp, #4]
30009d44:	e1a03403 	lsl	r3, r3, #8
30009d48:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x0f000000) { k -= 4;  word <<= 4;  }
30009d4c:	e59d3004 	ldr	r3, [sp, #4]
30009d50:	e203340f 	and	r3, r3, #251658240	; 0xf000000
30009d54:	e3530000 	cmp	r3, #0
30009d58:	0a000005 	beq	30009d74 <acoral_ffs+0x8c>
30009d5c:	e59d300c 	ldr	r3, [sp, #12]
30009d60:	e2433004 	sub	r3, r3, #4
30009d64:	e58d300c 	str	r3, [sp, #12]
30009d68:	e59d3004 	ldr	r3, [sp, #4]
30009d6c:	e1a03203 	lsl	r3, r3, #4
30009d70:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x30000000) { k -= 2;  word <<= 2;  }
30009d74:	e59d3004 	ldr	r3, [sp, #4]
30009d78:	e2033203 	and	r3, r3, #805306368	; 0x30000000
30009d7c:	e3530000 	cmp	r3, #0
30009d80:	0a000005 	beq	30009d9c <acoral_ffs+0xb4>
30009d84:	e59d300c 	ldr	r3, [sp, #12]
30009d88:	e2433002 	sub	r3, r3, #2
30009d8c:	e58d300c 	str	r3, [sp, #12]
30009d90:	e59d3004 	ldr	r3, [sp, #4]
30009d94:	e1a03103 	lsl	r3, r3, #2
30009d98:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x40000000) { k -= 1; }
30009d9c:	e59d3004 	ldr	r3, [sp, #4]
30009da0:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
30009da4:	e3530000 	cmp	r3, #0
30009da8:	0a000002 	beq	30009db8 <acoral_ffs+0xd0>
30009dac:	e59d300c 	ldr	r3, [sp, #12]
30009db0:	e2433001 	sub	r3, r3, #1
30009db4:	e58d300c 	str	r3, [sp, #12]
        return k;
30009db8:	e59d300c 	ldr	r3, [sp, #12]
}
30009dbc:	e1a00003 	mov	r0, r3
30009dc0:	e28dd010 	add	sp, sp, #16
30009dc4:	e12fff1e 	bx	lr

30009dc8 <acoral_find_first_bit>:

acoral_u32 acoral_find_first_bit(const acoral_u32 *b,acoral_u32 length)
{
30009dc8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009dcc:	e24dd014 	sub	sp, sp, #20
30009dd0:	e58d0004 	str	r0, [sp, #4]
30009dd4:	e58d1000 	str	r1, [sp]
	acoral_u32 v;
	acoral_u32 off;

	for (off = 0; v = b[off], off < length; off++) {
30009dd8:	e3a03000 	mov	r3, #0
30009ddc:	e58d300c 	str	r3, [sp, #12]
30009de0:	ea000005 	b	30009dfc <acoral_find_first_bit+0x34>
		if (v)
30009de4:	e59d3008 	ldr	r3, [sp, #8]
30009de8:	e3530000 	cmp	r3, #0
30009dec:	1a00000d 	bne	30009e28 <acoral_find_first_bit+0x60>
acoral_u32 acoral_find_first_bit(const acoral_u32 *b,acoral_u32 length)
{
	acoral_u32 v;
	acoral_u32 off;

	for (off = 0; v = b[off], off < length; off++) {
30009df0:	e59d300c 	ldr	r3, [sp, #12]
30009df4:	e2833001 	add	r3, r3, #1
30009df8:	e58d300c 	str	r3, [sp, #12]
30009dfc:	e59d300c 	ldr	r3, [sp, #12]
30009e00:	e1a02103 	lsl	r2, r3, #2
30009e04:	e59d3004 	ldr	r3, [sp, #4]
30009e08:	e0823003 	add	r3, r2, r3
30009e0c:	e5933000 	ldr	r3, [r3]
30009e10:	e58d3008 	str	r3, [sp, #8]
30009e14:	e59d200c 	ldr	r2, [sp, #12]
30009e18:	e59d3000 	ldr	r3, [sp]
30009e1c:	e1520003 	cmp	r2, r3
30009e20:	3affffef 	bcc	30009de4 <acoral_find_first_bit+0x1c>
30009e24:	ea000000 	b	30009e2c <acoral_find_first_bit+0x64>
		if (v)
			break;
30009e28:	e1a00000 	nop			; (mov r0, r0)
	}
	return acoral_ffs(v) + off * 32;
30009e2c:	e59d0008 	ldr	r0, [sp, #8]
30009e30:	ebffffac 	bl	30009ce8 <acoral_ffs>
30009e34:	e1a02000 	mov	r2, r0
30009e38:	e59d300c 	ldr	r3, [sp, #12]
30009e3c:	e1a03283 	lsl	r3, r3, #5
30009e40:	e0823003 	add	r3, r2, r3
}
30009e44:	e1a00003 	mov	r0, r3
30009e48:	e28dd014 	add	sp, sp, #20
30009e4c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009e50:	e12fff1e 	bx	lr

30009e54 <acoral_set_bit>:

void acoral_set_bit(acoral_32 nr,acoral_u32 *bitmap)
{
30009e54:	e24dd018 	sub	sp, sp, #24
30009e58:	e58d0004 	str	r0, [sp, #4]
30009e5c:	e58d1000 	str	r1, [sp]
	acoral_u32 oldval, mask = 1UL << (nr & 31);
30009e60:	e59d3004 	ldr	r3, [sp, #4]
30009e64:	e203301f 	and	r3, r3, #31
30009e68:	e3a02001 	mov	r2, #1
30009e6c:	e1a03312 	lsl	r3, r2, r3
30009e70:	e58d3010 	str	r3, [sp, #16]
	acoral_u32 *p;
	p =bitmap+(nr>>5);
30009e74:	e59d3004 	ldr	r3, [sp, #4]
30009e78:	e1a032c3 	asr	r3, r3, #5
30009e7c:	e1a03103 	lsl	r3, r3, #2
30009e80:	e59d2000 	ldr	r2, [sp]
30009e84:	e0823003 	add	r3, r2, r3
30009e88:	e58d3014 	str	r3, [sp, #20]
	oldval = *p;
30009e8c:	e59d3014 	ldr	r3, [sp, #20]
30009e90:	e5933000 	ldr	r3, [r3]
30009e94:	e58d300c 	str	r3, [sp, #12]
	*p = oldval | mask;
30009e98:	e59d200c 	ldr	r2, [sp, #12]
30009e9c:	e59d3010 	ldr	r3, [sp, #16]
30009ea0:	e1822003 	orr	r2, r2, r3
30009ea4:	e59d3014 	ldr	r3, [sp, #20]
30009ea8:	e5832000 	str	r2, [r3]
}
30009eac:	e28dd018 	add	sp, sp, #24
30009eb0:	e12fff1e 	bx	lr
00
30009eb4 <acoral_clear_bit>:

void acoral_clear_bit(acoral_32 nr,acoral_u32 *bitmap)
{
30009eb4:	e24dd018 	sub	sp, sp, #24
30009eb8:	e58d0004 	str	r0, [sp, #4]
30009ebc:	e58d1000 	str	r1, [sp]
	acoral_u32 oldval, mask = 1UL << (nr & 31);
30009ec0:	e59d3004 	ldr	r3, [sp, #4]
30009ec4:	e203301f 	and	r3, r3, #31
30009ec8:	e3a02001 	mov	r2, #1
30009ecc:	e1a03312 	lsl	r3, r2, r3
30009ed0:	e58d3010 	str	r3, [sp, #16]
	acoral_u32 *p;
	p =bitmap+(nr >> 5);
30009ed4:	e59d3004 	ldr	r3, [sp, #4]
30009ed8:	e1a032c3 	asr	r3, r3, #5
30009edc:	e1a03103 	lsl	r3, r3, #2
30009ee0:	e59d2000 	ldr	r2, [sp]
30009ee4:	e0823003 	add	r3, r2, r3
30009ee8:	e58d3014 	str	r3, [sp, #20]
	oldval = *p;
30009eec:	e59d3014 	ldr	r3, [sp, #20]
30009ef0:	e5933000 	ldr	r3, [r3]
30009ef4:	e58d300c 	str	r3, [sp, #12]
	*p = oldval &(~mask);
30009ef8:	e59d3010 	ldr	r3, [sp, #16]
30009efc:	e1e02003 	mvn	r2, r3
30009f00:	e59d300c 	ldr	r3, [sp, #12]
30009f04:	e0022003 	and	r2, r2, r3
30009f08:	e59d3014 	ldr	r3, [sp, #20]
30009f0c:	e5832000 	str	r2, [r3]
}
30009f10:	e28dd018 	add	sp, sp, #24
30009f14:	e12fff1e 	bx	lr

30009f18 <acoral_get_bit>:

acoral_u32 acoral_get_bit(acoral_32 nr,acoral_u32 *bitmap)
{
30009f18:	e24dd018 	sub	sp, sp, #24
30009f1c:	e58d0004 	str	r0, [sp, #4]
30009f20:	e58d1000 	str	r1, [sp]
	acoral_u32 oldval, mask = 1UL << (nr & 31);
30009f24:	e59d3004 	ldr	r3, [sp, #4]
30009f28:	e203301f 	and	r3, r3, #31
30009f2c:	e3a02001 	mov	r2, #1
30009f30:	e1a03312 	lsl	r3, r2, r3
30009f34:	e58d3010 	str	r3, [sp, #16]
	acoral_u32 *p;
	p =bitmap+(nr>>5);
30009f38:	e59d3004 	ldr	r3, [sp, #4]
30009f3c:	e1a032c3 	asr	r3, r3, #5
30009f40:	e1a03103 	lsl	r3, r3, #2
30009f44:	e59d2000 	ldr	r2, [sp]
30009f48:	e0823003 	add	r3, r2, r3
30009f4c:	e58d3014 	str	r3, [sp, #20]
	oldval = *p;
30009f50:	e59d3014 	ldr	r3, [sp, #20]
30009f54:	e5933000 	ldr	r3, [r3]
30009f58:	e58d300c 	str	r3, [sp, #12]
	return oldval & mask;
30009f5c:	e59d200c 	ldr	r2, [sp, #12]
30009f60:	e59d3010 	ldr	r3, [sp, #16]
30009f64:	e0023003 	and	r3, r2, r3
}
30009f68:	e1a00003 	mov	r0, r3
30009f6c:	e28dd018 	add	sp, sp, #24
30009f70:	e12fff1e 	bx	lr

30009f74 <acoral_prio_queue_add>:
#include<queue.h>
#include<list.h>
#include<bitops.h>
void acoral_prio_queue_add(acoral_prio_array_t *array,acoral_u8 prio,acoral_list_t *list){
30009f74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009f78:	e24dd01c 	sub	sp, sp, #28
30009f7c:	e58d000c 	str	r0, [sp, #12]
30009f80:	e1a03001 	mov	r3, r1
30009f84:	e58d2004 	str	r2, [sp, #4]
30009f88:	e5cd300b 	strb	r3, [sp, #11]
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num++;
30009f8c:	e59d300c 	ldr	r3, [sp, #12]
30009f90:	e5933000 	ldr	r3, [r3]
30009f94:	e2832001 	add	r2, r3, #1
30009f98:	e59d300c 	ldr	r3, [sp, #12]
30009f9c:	e5832000 	str	r2, [r3]
        queue=array->queue + prio;
30009fa0:	e59d300c 	ldr	r3, [sp, #12]
30009fa4:	e2831010 	add	r1, r3, #16
30009fa8:	e5dd200b 	ldrb	r2, [sp, #11]
30009fac:	e1a03002 	mov	r3, r2
30009fb0:	e1a03083 	lsl	r3, r3, #1
30009fb4:	e0833002 	add	r3, r3, r2
30009fb8:	e1a03103 	lsl	r3, r3, #2
30009fbc:	e0813003 	add	r3, r1, r3
30009fc0:	e58d3010 	str	r3, [sp, #16]
	head=&queue->head;
30009fc4:	e59d3010 	ldr	r3, [sp, #16]
30009fc8:	e58d3014 	str	r3, [sp, #20]
	acoral_list_add2_tail(list,head);
30009fcc:	e59d0004 	ldr	r0, [sp, #4]
30009fd0:	e59d1014 	ldr	r1, [sp, #20]
30009fd4:	eb000080 	bl	3000a1dc <acoral_list_add2_tail>
	acoral_set_bit(prio,array->bitmap);
30009fd8:	e5dd200b 	ldrb	r2, [sp, #11]
30009fdc:	e59d300c 	ldr	r3, [sp, #12]
30009fe0:	e2833004 	add	r3, r3, #4
30009fe4:	e1a00002 	mov	r0, r2
30009fe8:	e1a01003 	mov	r1, r3
30009fec:	ebffff98 	bl	30009e54 <acoral_set_bit>
}
30009ff0:	e28dd01c 	add	sp, sp, #28
30009ff4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009ff8:	e12fff1e 	bx	lr

30009ffc <acoral_prio_queue_del>:

void acoral_prio_queue_del(acoral_prio_array_t *array,acoral_u8 prio,acoral_list_t *list){
30009ffc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000a000:	e24dd01c 	sub	sp, sp, #28
3000a004:	e58d000c 	str	r0, [sp, #12]
3000a008:	e1a03001 	mov	r3, r1
3000a00c:	e58d2004 	str	r2, [sp, #4]
3000a010:	e5cd300b 	strb	r3, [sp, #11]
	acoral_queue_t *queue;
	acoral_list_t *head;
        queue= array->queue + prio;
3000a014:	e59d300c 	ldr	r3, [sp, #12]
3000a018:	e2831010 	add	r1, r3, #16
3000a01c:	e5dd200b 	ldrb	r2, [sp, #11]
3000a020:	e1a03002 	mov	r3, r2
3000a024:	e1a03083 	lsl	r3, r3, #1
3000a028:	e0833002 	add	r3, r3, r2
3000a02c:	e1a03103 	lsl	r3, r3, #2
3000a030:	e0813003 	add	r3, r1, r3
3000a034:	e58d3010 	str	r3, [sp, #16]
	head=&queue->head;
3000a038:	e59d3010 	ldr	r3, [sp, #16]
3000a03c:	e58d3014 	str	r3, [sp, #20]
	array->num--;
3000a040:	e59d300c 	ldr	r3, [sp, #12]
3000a044:	e5933000 	ldr	r3, [r3]
3000a048:	e2432001 	sub	r2, r3, #1
3000a04c:	e59d300c 	ldr	r3, [sp, #12]
3000a050:	e5832000 	str	r2, [r3]
	acoral_list_del(list);
3000a054:	e59d0004 	ldr	r0, [sp, #4]
3000a058:	eb000072 	bl	3000a228 <acoral_list_del>
	if(acoral_list_empty(head))
3000a05c:	e59d3014 	ldr	r3, [sp, #20]
3000a060:	e5932000 	ldr	r2, [r3]
3000a064:	e59d3014 	ldr	r3, [sp, #20]
3000a068:	e1520003 	cmp	r2, r3
3000a06c:	1a000005 	bne	3000a088 <acoral_prio_queue_del+0x8c>
		acoral_clear_bit(prio,array->bitmap);
3000a070:	e5dd200b 	ldrb	r2, [sp, #11]
3000a074:	e59d300c 	ldr	r3, [sp, #12]
3000a078:	e2833004 	add	r3, r3, #4
3000a07c:	e1a00002 	mov	r0, r2
3000a080:	e1a01003 	mov	r1, r3
3000a084:	ebffff8a 	bl	30009eb4 <acoral_clear_bit>
}
3000a088:	e28dd01c 	add	sp, sp, #28
3000a08c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000a090:	e12fff1e 	bx	lr

3000a094 <acoral_get_highprio>:

acoral_u32 acoral_get_highprio(acoral_prio_array_t *array){
3000a094:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000a098:	e24dd00c 	sub	sp, sp, #12
3000a09c:	e58d0004 	str	r0, [sp, #4]
	return acoral_find_first_bit(array->bitmap,PRIO_BITMAP_SIZE);
3000a0a0:	e59d3004 	ldr	r3, [sp, #4]
3000a0a4:	e2833004 	add	r3, r3, #4
3000a0a8:	e1a00003 	mov	r0, r3
3000a0ac:	e3a01003 	mov	r1, #3
3000a0b0:	ebffff44 	bl	30009dc8 <acoral_find_first_bit>
3000a0b4:	e1a03000 	mov	r3, r0
}
3000a0b8:	e1a00003 	mov	r0, r3
3000a0bc:	e28dd00c 	add	sp, sp, #12
3000a0c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000a0c4:	e12fff1e 	bx	lr

3000a0c8 <acoral_prio_queue_init>:

void acoral_prio_queue_init(acoral_prio_array_t *array){
3000a0c8:	e24dd018 	sub	sp, sp, #24
3000a0cc:	e58d0004 	str	r0, [sp, #4]
  	acoral_u8 i;
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num=0;
3000a0d0:	e59d3004 	ldr	r3, [sp, #4]
3000a0d4:	e3a02000 	mov	r2, #0
3000a0d8:	e5832000 	str	r2, [r3]
	for(i=0;i<PRIO_BITMAP_SIZE;i++)
3000a0dc:	e3a03000 	mov	r3, #0
3000a0e0:	e5cd300f 	strb	r3, [sp, #15]
3000a0e4:	ea00000a 	b	3000a114 <acoral_prio_queue_init+0x4c>
	    array->bitmap[i]=0;
3000a0e8:	e5dd100f 	ldrb	r1, [sp, #15]
3000a0ec:	e59d2004 	ldr	r2, [sp, #4]
3000a0f0:	e3a03004 	mov	r3, #4
3000a0f4:	e1a01101 	lsl	r1, r1, #2
3000a0f8:	e0812002 	add	r2, r1, r2
3000a0fc:	e0823003 	add	r3, r2, r3
3000a100:	e3a02000 	mov	r2, #0
3000a104:	e5832000 	str	r2, [r3]
void acoral_prio_queue_init(acoral_prio_array_t *array){
  	acoral_u8 i;
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num=0;
	for(i=0;i<PRIO_BITMAP_SIZE;i++)
3000a108:	e5dd300f 	ldrb	r3, [sp, #15]
3000a10c:	e2833001 	add	r3, r3, #1
3000a110:	e5cd300f 	strb	r3, [sp, #15]
3000a114:	e5dd300f 	ldrb	r3, [sp, #15]
3000a118:	e3530002 	cmp	r3, #2
3000a11c:	9afffff1 	bls	3000a0e8 <acoral_prio_queue_init+0x20>
	    array->bitmap[i]=0;
  	for(i=0;i<ACORAL_MAX_PRIO_NUM;i++){
3000a120:	e3a03000 	mov	r3, #0
3000a124:	e5cd300f 	strb	r3, [sp, #15]
3000a128:	ea000013 	b	3000a17c <acoral_prio_queue_init+0xb4>
	    queue= array->queue + i;
3000a12c:	e59d3004 	ldr	r3, [sp, #4]
3000a130:	e2831010 	add	r1, r3, #16
3000a134:	e5dd200f 	ldrb	r2, [sp, #15]
3000a138:	e1a03002 	mov	r3, r2
3000a13c:	e1a03083 	lsl	r3, r3, #1
3000a140:	e0833002 	add	r3, r3, r2
3000a144:	e1a03103 	lsl	r3, r3, #2
3000a148:	e0813003 	add	r3, r1, r3
3000a14c:	e58d3010 	str	r3, [sp, #16]
	    head=&queue->head;
3000a150:	e59d3010 	ldr	r3, [sp, #16]
3000a154:	e58d3014 	str	r3, [sp, #20]
	    acoral_init_list(head);
3000a158:	e59d3014 	ldr	r3, [sp, #20]
3000a15c:	e59d2014 	ldr	r2, [sp, #20]
3000a160:	e5832000 	str	r2, [r3]
3000a164:	e59d3014 	ldr	r3, [sp, #20]
3000a168:	e59d2014 	ldr	r2, [sp, #20]
3000a16c:	e5832004 	str	r2, [r3, #4]
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num=0;
	for(i=0;i<PRIO_BITMAP_SIZE;i++)
	    array->bitmap[i]=0;
  	for(i=0;i<ACORAL_MAX_PRIO_NUM;i++){
3000a170:	e5dd300f 	ldrb	r3, [sp, #15]
3000a174:	e2833001 	add	r3, r3, #1
3000a178:	e5cd300f 	strb	r3, [sp, #15]
3000a17c:	e5dd300f 	ldrb	r3, [sp, #15]
3000a180:	e3530046 	cmp	r3, #70	; 0x46
3000a184:	9affffe8 	bls	3000a12c <acoral_prio_queue_init+0x64>
	    queue= array->queue + i;
	    head=&queue->head;
	    acoral_init_list(head);
	} 	
}
3000a188:	e28dd018 	add	sp, sp, #24
3000a18c:	e12fff1e 	bx	lr

3000a190 <acoral_list_add>:
#include<list.h>
void acoral_list_add(acoral_list_t *new, acoral_list_t *head)
{
3000a190:	e24dd008 	sub	sp, sp, #8
3000a194:	e58d0004 	str	r0, [sp, #4]
3000a198:	e58d1000 	str	r1, [sp]
	new->prev=head;	
3000a19c:	e59d3004 	ldr	r3, [sp, #4]
3000a1a0:	e59d2000 	ldr	r2, [sp]
3000a1a4:	e5832004 	str	r2, [r3, #4]
	new->next=head->next;	
3000a1a8:	e59d3000 	ldr	r3, [sp]
3000a1ac:	e5932000 	ldr	r2, [r3]
3000a1b0:	e59d3004 	ldr	r3, [sp, #4]
3000a1b4:	e5832000 	str	r2, [r3]
	head->next->prev=new;	
3000a1b8:	e59d3000 	ldr	r3, [sp]
3000a1bc:	e5933000 	ldr	r3, [r3]
3000a1c0:	e59d2004 	ldr	r2, [sp, #4]
3000a1c4:	e5832004 	str	r2, [r3, #4]
	head->next=new;	
3000a1c8:	e59d3000 	ldr	r3, [sp]
3000a1cc:	e59d2004 	ldr	r2, [sp, #4]
3000a1d0:	e5832000 	str	r2, [r3]
}
3000a1d4:	e28dd008 	add	sp, sp, #8
3000a1d8:	e12fff1e 	bx	lr

3000a1dc <acoral_list_add2_tail>:

void acoral_list_add2_tail(acoral_list_t *new, acoral_list_t *head)
{
3000a1dc:	e24dd008 	sub	sp, sp, #8
3000a1e0:	e58d0004 	str	r0, [sp, #4]
3000a1e4:	e58d1000 	str	r1, [sp]
	new->prev=head->prev;
3000a1e8:	e59d3000 	ldr	r3, [sp]
3000a1ec:	e5932004 	ldr	r2, [r3, #4]
3000a1f0:	e59d3004 	ldr	r3, [sp, #4]
3000a1f4:	e5832004 	str	r2, [r3, #4]
	new->next=head;
3000a1f8:	e59d3004 	ldr	r3, [sp, #4]
3000a1fc:	e59d2000 	ldr	r2, [sp]
3000a200:	e5832000 	str	r2, [r3]
	head->prev->next=new;
3000a204:	e59d3000 	ldr	r3, [sp]
3000a208:	e5933004 	ldr	r3, [r3, #4]
3000a20c:	e59d2004 	ldr	r2, [sp, #4]
3000a210:	e5832000 	str	r2, [r3]
	head->prev=new;
3000a214:	e59d3000 	ldr	r3, [sp]
3000a218:	e59d2004 	ldr	r2, [sp, #4]
3000a21c:	e5832004 	str	r2, [r3, #4]
}
3000a220:	e28dd008 	add	sp, sp, #8
3000a224:	e12fff1e 	bx	lr

3000a228 <acoral_list_del>:

void acoral_list_del(acoral_list_t *entry)
{
3000a228:	e24dd008 	sub	sp, sp, #8
3000a22c:	e58d0004 	str	r0, [sp, #4]
	entry->prev->next= entry->next;
3000a230:	e59d3004 	ldr	r3, [sp, #4]
3000a234:	e5933004 	ldr	r3, [r3, #4]
3000a238:	e59d2004 	ldr	r2, [sp, #4]
3000a23c:	e5922000 	ldr	r2, [r2]
3000a240:	e5832000 	str	r2, [r3]
	entry->next->prev=entry->prev;
3000a244:	e59d3004 	ldr	r3, [sp, #4]
3000a248:	e5933000 	ldr	r3, [r3]
3000a24c:	e59d2004 	ldr	r2, [sp, #4]
3000a250:	e5922004 	ldr	r2, [r2, #4]
3000a254:	e5832004 	str	r2, [r3, #4]
	entry->next = entry;
3000a258:	e59d3004 	ldr	r3, [sp, #4]
3000a25c:	e59d2004 	ldr	r2, [sp, #4]
3000a260:	e5832000 	str	r2, [r3]
	entry->prev = entry;
3000a264:	e59d3004 	ldr	r3, [sp, #4]
3000a268:	e59d2004 	ldr	r2, [sp, #4]
3000a26c:	e5832004 	str	r2, [r3, #4]
}
3000a270:	e28dd008 	add	sp, sp, #8
3000a274:	e12fff1e 	bx	lr

3000a278 <do_div>:
#define SPACE	8		/* space if plus */
#define LEFT	16		/* left justified */
#define SPECIAL	32		/* 0x */
#define LARGE	64		/* use 'ABCDEF' instead of 'abcdef' */
static acoral_32 do_div(acoral_64 *n,acoral_32 base)		
{								
3000a278:	e92d4010 	push	{r4, lr}
3000a27c:	e24dd010 	sub	sp, sp, #16
3000a280:	e58d0004 	str	r0, [sp, #4]
3000a284:	e58d1000 	str	r1, [sp]
	acoral_32 __res;				
	__res = ((acoral_u32)*n) % (acoral_u32)base;
3000a288:	e59d3004 	ldr	r3, [sp, #4]
3000a28c:	e8930018 	ldm	r3, {r3, r4}
3000a290:	e1a02003 	mov	r2, r3
3000a294:	e59d3000 	ldr	r3, [sp]
3000a298:	e1a00002 	mov	r0, r2
3000a29c:	e1a01003 	mov	r1, r3
3000a2a0:	eb000e9b 	bl	3000dd14 <__aeabi_uidivmod>
3000a2a4:	e1a03001 	mov	r3, r1
3000a2a8:	e58d300c 	str	r3, [sp, #12]
	*n = ((acoral_u32)*n) / (acoral_u32)base;	
3000a2ac:	e59d3004 	ldr	r3, [sp, #4]
3000a2b0:	e8930018 	ldm	r3, {r3, r4}
3000a2b4:	e1a02003 	mov	r2, r3
3000a2b8:	e59d3000 	ldr	r3, [sp]
3000a2bc:	e1a00002 	mov	r0, r2
3000a2c0:	e1a01003 	mov	r1, r3
3000a2c4:	eb000e55 	bl	3000dc20 <__aeabi_uidiv>
3000a2c8:	e1a03000 	mov	r3, r0
3000a2cc:	e3a04000 	mov	r4, #0
3000a2d0:	e59d2004 	ldr	r2, [sp, #4]
3000a2d4:	e8820018 	stm	r2, {r3, r4}
	return __res;					
3000a2d8:	e59d300c 	ldr	r3, [sp, #12]
}
3000a2dc:	e1a00003 	mov	r0, r3
3000a2e0:	e28dd010 	add	sp, sp, #16
3000a2e4:	e8bd4010 	pop	{r4, lr}
3000a2e8:	e12fff1e 	bx	lr

3000a2ec <skip_atoi>:


acoral_32 skip_atoi(const acoral_char **s)
    {/*change the string "s" to digit*/
3000a2ec:	e24dd010 	sub	sp, sp, #16
3000a2f0:	e58d0004 	str	r0, [sp, #4]
            acoral_32 i=0;
3000a2f4:	e3a03000 	mov	r3, #0
3000a2f8:	e58d300c 	str	r3, [sp, #12]
 
            while (IS_DIGIT(**s))
3000a2fc:	ea00000e 	b	3000a33c <skip_atoi+0x50>
                    i = i*10 + *((*s)++) - '0';
3000a300:	e59d200c 	ldr	r2, [sp, #12]
3000a304:	e1a03002 	mov	r3, r2
3000a308:	e1a03103 	lsl	r3, r3, #2
3000a30c:	e0833002 	add	r3, r3, r2
3000a310:	e1a03083 	lsl	r3, r3, #1
3000a314:	e1a01003 	mov	r1, r3
3000a318:	e59d3004 	ldr	r3, [sp, #4]
3000a31c:	e5933000 	ldr	r3, [r3]
3000a320:	e5d32000 	ldrb	r2, [r3]
3000a324:	e0812002 	add	r2, r1, r2
3000a328:	e2422030 	sub	r2, r2, #48	; 0x30
3000a32c:	e58d200c 	str	r2, [sp, #12]
3000a330:	e2832001 	add	r2, r3, #1
3000a334:	e59d3004 	ldr	r3, [sp, #4]
3000a338:	e5832000 	str	r2, [r3]

acoral_32 skip_atoi(const acoral_char **s)
    {/*change the string "s" to digit*/
            acoral_32 i=0;
 
            while (IS_DIGIT(**s))
3000a33c:	e59d3004 	ldr	r3, [sp, #4]
3000a340:	e5933000 	ldr	r3, [r3]
3000a344:	e5d33000 	ldrb	r3, [r3]
3000a348:	e353002f 	cmp	r3, #47	; 0x2f
3000a34c:	9a000004 	bls	3000a364 <skip_atoi+0x78>
3000a350:	e59d3004 	ldr	r3, [sp, #4]
3000a354:	e5933000 	ldr	r3, [r3]
3000a358:	e5d33000 	ldrb	r3, [r3]
3000a35c:	e3530038 	cmp	r3, #56	; 0x38
3000a360:	9affffe6 	bls	3000a300 <skip_atoi+0x14>
                    i = i*10 + *((*s)++) - '0';
            return i;
3000a364:	e59d300c 	ldr	r3, [sp, #12]
} 
3000a368:	e1a00003 	mov	r0, r3
3000a36c:	e28dd010 	add	sp, sp, #16
3000a370:	e12fff1e 	bx	lr

3000a374 <number>:

const acoral_char small_digits[] = "0123456789abcdefghijklmnopqrstuvwxyz";
const acoral_char large_digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
acoral_char * number(acoral_char * buf, acoral_char * end, acoral_64 num, acoral_32 base, acoral_32 size, acoral_32 precision, acoral_32 type)
{
3000a374:	e92d4010 	push	{r4, lr}
3000a378:	e24dd060 	sub	sp, sp, #96	; 0x60
3000a37c:	e58d000c 	str	r0, [sp, #12]
3000a380:	e58d1008 	str	r1, [sp, #8]
3000a384:	e88d000c 	stm	sp, {r2, r3}
	acoral_char c,sign,tmp[66];
	const acoral_char *digits;
	acoral_32 i;

	digits = (type & LARGE) ? large_digits : small_digits;
3000a388:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a38c:	e2033040 	and	r3, r3, #64	; 0x40
3000a390:	e3530000 	cmp	r3, #0
3000a394:	0a000001 	beq	3000a3a0 <number+0x2c>
3000a398:	e59f34e4 	ldr	r3, [pc, #1252]	; 3000a884 <number+0x510>
3000a39c:	ea000000 	b	3000a3a4 <number+0x30>
3000a3a0:	e59f34e0 	ldr	r3, [pc, #1248]	; 3000a888 <number+0x514>
3000a3a4:	e58d3058 	str	r3, [sp, #88]	; 0x58
	if (type & LEFT)
3000a3a8:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a3ac:	e2033010 	and	r3, r3, #16
3000a3b0:	e3530000 	cmp	r3, #0
3000a3b4:	0a000002 	beq	3000a3c4 <number+0x50>
		type &= ~ZEROPAD;
3000a3b8:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a3bc:	e3c33001 	bic	r3, r3, #1
3000a3c0:	e58d3074 	str	r3, [sp, #116]	; 0x74
	if (base < 2 || base > 36)
3000a3c4:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a3c8:	e3530001 	cmp	r3, #1
3000a3cc:	da000002 	ble	3000a3dc <number+0x68>
3000a3d0:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a3d4:	e3530024 	cmp	r3, #36	; 0x24
3000a3d8:	da000001 	ble	3000a3e4 <number+0x70>
		return 0;
3000a3dc:	e3a03000 	mov	r3, #0
3000a3e0:	ea000123 	b	3000a874 <number+0x500>
	c = (type & ZEROPAD) ? '0' : ' ';
3000a3e4:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a3e8:	e2033001 	and	r3, r3, #1
3000a3ec:	e20330ff 	and	r3, r3, #255	; 0xff
3000a3f0:	e3530000 	cmp	r3, #0
3000a3f4:	0a000001 	beq	3000a400 <number+0x8c>
3000a3f8:	e3a03030 	mov	r3, #48	; 0x30
3000a3fc:	ea000000 	b	3000a404 <number+0x90>
3000a400:	e3a03020 	mov	r3, #32
3000a404:	e5cd3056 	strb	r3, [sp, #86]	; 0x56
	sign = 0;
3000a408:	e3a03000 	mov	r3, #0
3000a40c:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
	if (type & SIGN) {
3000a410:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a414:	e2033002 	and	r3, r3, #2
3000a418:	e3530000 	cmp	r3, #0
3000a41c:	0a000020 	beq	3000a4a4 <number+0x130>
		if (num < 0) {
3000a420:	e89d0018 	ldm	sp, {r3, r4}
3000a424:	e3530000 	cmp	r3, #0
3000a428:	e2d40000 	sbcs	r0, r4, #0
3000a42c:	aa000009 	bge	3000a458 <number+0xe4>
			sign = '-';
3000a430:	e3a0302d 	mov	r3, #45	; 0x2d
3000a434:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
			num = -num;
3000a438:	e89d0018 	ldm	sp, {r3, r4}
3000a43c:	e2733000 	rsbs	r3, r3, #0
3000a440:	e2e44000 	rsc	r4, r4, #0
3000a444:	e88d0018 	stm	sp, {r3, r4}
			size--;
3000a448:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a44c:	e2433001 	sub	r3, r3, #1
3000a450:	e58d306c 	str	r3, [sp, #108]	; 0x6c
3000a454:	ea000012 	b	3000a4a4 <number+0x130>
		} else if (type & PLUS) {
3000a458:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a45c:	e2033004 	and	r3, r3, #4
3000a460:	e3530000 	cmp	r3, #0
3000a464:	0a000005 	beq	3000a480 <number+0x10c>
			sign = '+';
3000a468:	e3a0302b 	mov	r3, #43	; 0x2b
3000a46c:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
			size--;
3000a470:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a474:	e2433001 	sub	r3, r3, #1
3000a478:	e58d306c 	str	r3, [sp, #108]	; 0x6c
3000a47c:	ea000008 	b	3000a4a4 <number+0x130>
		} else if (type & SPACE) {
3000a480:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a484:	e2033008 	and	r3, r3, #8
3000a488:	e3530000 	cmp	r3, #0
3000a48c:	0a000004 	beq	3000a4a4 <number+0x130>
			sign = ' ';
3000a490:	e3a03020 	mov	r3, #32
3000a494:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
			size--;
3000a498:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a49c:	e2433001 	sub	r3, r3, #1
3000a4a0:	e58d306c 	str	r3, [sp, #108]	; 0x6c
		}
	}
	if (type & SPECIAL) {
3000a4a4:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a4a8:	e2033020 	and	r3, r3, #32
3000a4ac:	e3530000 	cmp	r3, #0
3000a4b0:	0a00000c 	beq	3000a4e8 <number+0x174>
		if (base == 16)
3000a4b4:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a4b8:	e3530010 	cmp	r3, #16
3000a4bc:	1a000003 	bne	3000a4d0 <number+0x15c>
			size -= 2;
3000a4c0:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a4c4:	e2433002 	sub	r3, r3, #2
3000a4c8:	e58d306c 	str	r3, [sp, #108]	; 0x6c
3000a4cc:	ea000005 	b	3000a4e8 <number+0x174>
		else if (base == 8)
3000a4d0:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a4d4:	e3530008 	cmp	r3, #8
3000a4d8:	1a000002 	bne	3000a4e8 <number+0x174>
			size--;
3000a4dc:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a4e0:	e2433001 	sub	r3, r3, #1
3000a4e4:	e58d306c 	str	r3, [sp, #108]	; 0x6c
	}
	i = 0;
3000a4e8:	e3a03000 	mov	r3, #0
3000a4ec:	e58d305c 	str	r3, [sp, #92]	; 0x5c
	if (num == 0)
3000a4f0:	e89d0018 	ldm	sp, {r3, r4}
3000a4f4:	e1931004 	orrs	r1, r3, r4
3000a4f8:	1a00001d 	bne	3000a574 <number+0x200>
		tmp[i++]='0';
3000a4fc:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a500:	e3e0304b 	mvn	r3, #75	; 0x4b
3000a504:	e28d0060 	add	r0, sp, #96	; 0x60
3000a508:	e0802002 	add	r2, r0, r2
3000a50c:	e0823003 	add	r3, r2, r3
3000a510:	e3a02030 	mov	r2, #48	; 0x30
3000a514:	e5c32000 	strb	r2, [r3]
3000a518:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a51c:	e2833001 	add	r3, r3, #1
3000a520:	e58d305c 	str	r3, [sp, #92]	; 0x5c
3000a524:	ea000016 	b	3000a584 <number+0x210>
	else while (num != 0)
		tmp[i++] = digits[do_div(&num,base)];
3000a528:	e59d405c 	ldr	r4, [sp, #92]	; 0x5c
3000a52c:	e1a0300d 	mov	r3, sp
3000a530:	e1a00003 	mov	r0, r3
3000a534:	e59d1068 	ldr	r1, [sp, #104]	; 0x68
3000a538:	ebffff4e 	bl	3000a278 <do_div>
3000a53c:	e1a03000 	mov	r3, r0
3000a540:	e1a02003 	mov	r2, r3
3000a544:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000a548:	e0823003 	add	r3, r2, r3
3000a54c:	e5d32000 	ldrb	r2, [r3]
3000a550:	e3e0304b 	mvn	r3, #75	; 0x4b
3000a554:	e28d0060 	add	r0, sp, #96	; 0x60
3000a558:	e0801004 	add	r1, r0, r4
3000a55c:	e0813003 	add	r3, r1, r3
3000a560:	e5c32000 	strb	r2, [r3]
3000a564:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a568:	e2833001 	add	r3, r3, #1
3000a56c:	e58d305c 	str	r3, [sp, #92]	; 0x5c
3000a570:	ea000000 	b	3000a578 <number+0x204>
			size--;
	}
	i = 0;
	if (num == 0)
		tmp[i++]='0';
	else while (num != 0)
3000a574:	e1a00000 	nop			; (mov r0, r0)
3000a578:	e89d0018 	ldm	sp, {r3, r4}
3000a57c:	e1931004 	orrs	r1, r3, r4
3000a580:	1affffe8 	bne	3000a528 <number+0x1b4>
		tmp[i++] = digits[do_div(&num,base)];
	if (i > precision)
3000a584:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a588:	e59d3070 	ldr	r3, [sp, #112]	; 0x70
3000a58c:	e1520003 	cmp	r2, r3
3000a590:	da000001 	ble	3000a59c <number+0x228>
		precision = i;
3000a594:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a598:	e58d3070 	str	r3, [sp, #112]	; 0x70
	size -= precision;
3000a59c:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a5a0:	e59d3070 	ldr	r3, [sp, #112]	; 0x70
3000a5a4:	e0633002 	rsb	r3, r3, r2
3000a5a8:	e58d306c 	str	r3, [sp, #108]	; 0x6c
	if (!(type&(ZEROPAD+LEFT))) {
3000a5ac:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a5b0:	e2033011 	and	r3, r3, #17
3000a5b4:	e3530000 	cmp	r3, #0
3000a5b8:	1a000014 	bne	3000a610 <number+0x29c>
		while(size-->0) {
3000a5bc:	ea000009 	b	3000a5e8 <number+0x274>
			if (buf <= end)
3000a5c0:	e59d200c 	ldr	r2, [sp, #12]
3000a5c4:	e59d3008 	ldr	r3, [sp, #8]
3000a5c8:	e1520003 	cmp	r2, r3
3000a5cc:	8a000002 	bhi	3000a5dc <number+0x268>
				*buf = ' ';
3000a5d0:	e59d300c 	ldr	r3, [sp, #12]
3000a5d4:	e3a02020 	mov	r2, #32
3000a5d8:	e5c32000 	strb	r2, [r3]
			++buf;
3000a5dc:	e59d300c 	ldr	r3, [sp, #12]
3000a5e0:	e2833001 	add	r3, r3, #1
3000a5e4:	e58d300c 	str	r3, [sp, #12]
		tmp[i++] = digits[do_div(&num,base)];
	if (i > precision)
		precision = i;
	size -= precision;
	if (!(type&(ZEROPAD+LEFT))) {
		while(size-->0) {
3000a5e8:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a5ec:	e3530000 	cmp	r3, #0
3000a5f0:	d3a03000 	movle	r3, #0
3000a5f4:	c3a03001 	movgt	r3, #1
3000a5f8:	e20330ff 	and	r3, r3, #255	; 0xff
3000a5fc:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a600:	e2422001 	sub	r2, r2, #1
3000a604:	e58d206c 	str	r2, [sp, #108]	; 0x6c
3000a608:	e3530000 	cmp	r3, #0
3000a60c:	1affffeb 	bne	3000a5c0 <number+0x24c>
			if (buf <= end)
				*buf = ' ';
			++buf;
		}
	}
	if (sign) {
3000a610:	e5dd3057 	ldrb	r3, [sp, #87]	; 0x57
3000a614:	e3530000 	cmp	r3, #0
3000a618:	0a000009 	beq	3000a644 <number+0x2d0>
		if (buf <= end)
3000a61c:	e59d200c 	ldr	r2, [sp, #12]
3000a620:	e59d3008 	ldr	r3, [sp, #8]
3000a624:	e1520003 	cmp	r2, r3
3000a628:	8a000002 	bhi	3000a638 <number+0x2c4>
			*buf = sign;
3000a62c:	e59d300c 	ldr	r3, [sp, #12]
3000a630:	e5dd2057 	ldrb	r2, [sp, #87]	; 0x57
3000a634:	e5c32000 	strb	r2, [r3]
		++buf;
3000a638:	e59d300c 	ldr	r3, [sp, #12]
3000a63c:	e2833001 	add	r3, r3, #1
3000a640:	e58d300c 	str	r3, [sp, #12]
	}
	if (type & SPECIAL) {
3000a644:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a648:	e2033020 	and	r3, r3, #32
3000a64c:	e3530000 	cmp	r3, #0
3000a650:	0a000026 	beq	3000a6f0 <number+0x37c>
		if (base==8) {
3000a654:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a658:	e3530008 	cmp	r3, #8
3000a65c:	1a00000a 	bne	3000a68c <number+0x318>
			if (buf <= end)
3000a660:	e59d200c 	ldr	r2, [sp, #12]
3000a664:	e59d3008 	ldr	r3, [sp, #8]
3000a668:	e1520003 	cmp	r2, r3
3000a66c:	8a000002 	bhi	3000a67c <number+0x308>
				*buf = '0';
3000a670:	e59d300c 	ldr	r3, [sp, #12]
3000a674:	e3a02030 	mov	r2, #48	; 0x30
3000a678:	e5c32000 	strb	r2, [r3]
			++buf;
3000a67c:	e59d300c 	ldr	r3, [sp, #12]
3000a680:	e2833001 	add	r3, r3, #1
3000a684:	e58d300c 	str	r3, [sp, #12]
3000a688:	ea000018 	b	3000a6f0 <number+0x37c>
		} else if (base==16) {
3000a68c:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a690:	e3530010 	cmp	r3, #16
3000a694:	1a000015 	bne	3000a6f0 <number+0x37c>
			if (buf <= end)
3000a698:	e59d200c 	ldr	r2, [sp, #12]
3000a69c:	e59d3008 	ldr	r3, [sp, #8]
3000a6a0:	e1520003 	cmp	r2, r3
3000a6a4:	8a000002 	bhi	3000a6b4 <number+0x340>
				*buf = '0';
3000a6a8:	e59d300c 	ldr	r3, [sp, #12]
3000a6ac:	e3a02030 	mov	r2, #48	; 0x30
3000a6b0:	e5c32000 	strb	r2, [r3]
			++buf;
3000a6b4:	e59d300c 	ldr	r3, [sp, #12]
3000a6b8:	e2833001 	add	r3, r3, #1
3000a6bc:	e58d300c 	str	r3, [sp, #12]
			if (buf <= end)
3000a6c0:	e59d200c 	ldr	r2, [sp, #12]
3000a6c4:	e59d3008 	ldr	r3, [sp, #8]
3000a6c8:	e1520003 	cmp	r2, r3
3000a6cc:	8a000004 	bhi	3000a6e4 <number+0x370>
				*buf = digits[33];
3000a6d0:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000a6d4:	e2833021 	add	r3, r3, #33	; 0x21
3000a6d8:	e5d32000 	ldrb	r2, [r3]
3000a6dc:	e59d300c 	ldr	r3, [sp, #12]
3000a6e0:	e5c32000 	strb	r2, [r3]
			++buf;
3000a6e4:	e59d300c 	ldr	r3, [sp, #12]
3000a6e8:	e2833001 	add	r3, r3, #1
3000a6ec:	e58d300c 	str	r3, [sp, #12]
		}
	}
	if (!(type & LEFT)) {
3000a6f0:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a6f4:	e2033010 	and	r3, r3, #16
3000a6f8:	e3530000 	cmp	r3, #0
3000a6fc:	1a000020 	bne	3000a784 <number+0x410>
		while (size-- > 0) {
3000a700:	ea000009 	b	3000a72c <number+0x3b8>
			if (buf <= end)
3000a704:	e59d200c 	ldr	r2, [sp, #12]
3000a708:	e59d3008 	ldr	r3, [sp, #8]
3000a70c:	e1520003 	cmp	r2, r3
3000a710:	8a000002 	bhi	3000a720 <number+0x3ac>
				*buf = c;
3000a714:	e59d300c 	ldr	r3, [sp, #12]
3000a718:	e5dd2056 	ldrb	r2, [sp, #86]	; 0x56
3000a71c:	e5c32000 	strb	r2, [r3]
			++buf;
3000a720:	e59d300c 	ldr	r3, [sp, #12]
3000a724:	e2833001 	add	r3, r3, #1
3000a728:	e58d300c 	str	r3, [sp, #12]
				*buf = digits[33];
			++buf;
		}
	}
	if (!(type & LEFT)) {
		while (size-- > 0) {
3000a72c:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a730:	e3530000 	cmp	r3, #0
3000a734:	d3a03000 	movle	r3, #0
3000a738:	c3a03001 	movgt	r3, #1
3000a73c:	e20330ff 	and	r3, r3, #255	; 0xff
3000a740:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a744:	e2422001 	sub	r2, r2, #1
3000a748:	e58d206c 	str	r2, [sp, #108]	; 0x6c
3000a74c:	e3530000 	cmp	r3, #0
3000a750:	1affffeb 	bne	3000a704 <number+0x390>
			if (buf <= end)
				*buf = c;
			++buf;
		}
	}
	while (i < precision--) {
3000a754:	ea00000b 	b	3000a788 <number+0x414>
		if (buf <= end)
3000a758:	e59d200c 	ldr	r2, [sp, #12]
3000a75c:	e59d3008 	ldr	r3, [sp, #8]
3000a760:	e1520003 	cmp	r2, r3
3000a764:	8a000002 	bhi	3000a774 <number+0x400>
			*buf = '0';
3000a768:	e59d300c 	ldr	r3, [sp, #12]
3000a76c:	e3a02030 	mov	r2, #48	; 0x30
3000a770:	e5c32000 	strb	r2, [r3]
		++buf;
3000a774:	e59d300c 	ldr	r3, [sp, #12]
3000a778:	e2833001 	add	r3, r3, #1
3000a77c:	e58d300c 	str	r3, [sp, #12]
3000a780:	ea000000 	b	3000a788 <number+0x414>
			if (buf <= end)
				*buf = c;
			++buf;
		}
	}
	while (i < precision--) {
3000a784:	e1a00000 	nop			; (mov r0, r0)
3000a788:	e59d2070 	ldr	r2, [sp, #112]	; 0x70
3000a78c:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a790:	e1520003 	cmp	r2, r3
3000a794:	d3a03000 	movle	r3, #0
3000a798:	c3a03001 	movgt	r3, #1
3000a79c:	e20330ff 	and	r3, r3, #255	; 0xff
3000a7a0:	e59d2070 	ldr	r2, [sp, #112]	; 0x70
3000a7a4:	e2422001 	sub	r2, r2, #1
3000a7a8:	e58d2070 	str	r2, [sp, #112]	; 0x70
3000a7ac:	e3530000 	cmp	r3, #0
3000a7b0:	1affffe8 	bne	3000a758 <number+0x3e4>
		if (buf <= end)
			*buf = '0';
		++buf;
	}
	while (i-- > 0) {
3000a7b4:	ea00000e 	b	3000a7f4 <number+0x480>
		if (buf <= end)
3000a7b8:	e59d200c 	ldr	r2, [sp, #12]
3000a7bc:	e59d3008 	ldr	r3, [sp, #8]
3000a7c0:	e1520003 	cmp	r2, r3
3000a7c4:	8a000007 	bhi	3000a7e8 <number+0x474>
			*buf = tmp[i];
3000a7c8:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a7cc:	e3e0304b 	mvn	r3, #75	; 0x4b
3000a7d0:	e28d0060 	add	r0, sp, #96	; 0x60
3000a7d4:	e0802002 	add	r2, r0, r2
3000a7d8:	e0823003 	add	r3, r2, r3
3000a7dc:	e5d32000 	ldrb	r2, [r3]
3000a7e0:	e59d300c 	ldr	r3, [sp, #12]
3000a7e4:	e5c32000 	strb	r2, [r3]
		++buf;
3000a7e8:	e59d300c 	ldr	r3, [sp, #12]
3000a7ec:	e2833001 	add	r3, r3, #1
3000a7f0:	e58d300c 	str	r3, [sp, #12]
	while (i < precision--) {
		if (buf <= end)
			*buf = '0';
		++buf;
	}
	while (i-- > 0) {
3000a7f4:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a7f8:	e3530000 	cmp	r3, #0
3000a7fc:	d3a03000 	movle	r3, #0
3000a800:	c3a03001 	movgt	r3, #1
3000a804:	e20330ff 	and	r3, r3, #255	; 0xff
3000a808:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a80c:	e2422001 	sub	r2, r2, #1
3000a810:	e58d205c 	str	r2, [sp, #92]	; 0x5c
3000a814:	e3530000 	cmp	r3, #0
3000a818:	1affffe6 	bne	3000a7b8 <number+0x444>
		if (buf <= end)
			*buf = tmp[i];
		++buf;
	}
	while (size-- > 0) {
3000a81c:	ea000009 	b	3000a848 <number+0x4d4>
		if (buf <= end)
3000a820:	e59d200c 	ldr	r2, [sp, #12]
3000a824:	e59d3008 	ldr	r3, [sp, #8]
3000a828:	e1520003 	cmp	r2, r3
3000a82c:	8a000002 	bhi	3000a83c <number+0x4c8>
			*buf = ' ';
3000a830:	e59d300c 	ldr	r3, [sp, #12]
3000a834:	e3a02020 	mov	r2, #32
3000a838:	e5c32000 	strb	r2, [r3]
		++buf;
3000a83c:	e59d300c 	ldr	r3, [sp, #12]
3000a840:	e2833001 	add	r3, r3, #1
3000a844:	e58d300c 	str	r3, [sp, #12]
	while (i-- > 0) {
		if (buf <= end)
			*buf = tmp[i];
		++buf;
	}
	while (size-- > 0) {
3000a848:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a84c:	e3530000 	cmp	r3, #0
3000a850:	d3a03000 	movle	r3, #0
3000a854:	c3a03001 	movgt	r3, #1
3000a858:	e20330ff 	and	r3, r3, #255	; 0xff
3000a85c:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a860:	e2422001 	sub	r2, r2, #1
3000a864:	e58d206c 	str	r2, [sp, #108]	; 0x6c
3000a868:	e3530000 	cmp	r3, #0
3000a86c:	1affffeb 	bne	3000a820 <number+0x4ac>
		if (buf <= end)
			*buf = ' ';
		++buf;
	}
	return buf;
3000a870:	e59d300c 	ldr	r3, [sp, #12]
}
3000a874:	e1a00003 	mov	r0, r3
3000a878:	e28dd060 	add	sp, sp, #96	; 0x60
3000a87c:	e8bd4010 	pop	{r4, lr}
3000a880:	e12fff1e 	bx	lr
3000a884:	3000e9ec 	.word	0x3000e9ec
3000a888:	3000e9c4 	.word	0x3000e9c4

3000a88c <vsnprintf>:
				   number of acoral_chars for from string */
	acoral_32 qualifier;		/* 'h', 'l', or 'L' for acoral_32eger fields */
				/* 'z' support added 23/7/1999 S.H.    */
				/* 'z' changed to 'Z' --davidm 1/25/99 */

	str = buf;
3000a88c:	e92d4010 	push	{r4, lr}
3000a890:	e24dd068 	sub	sp, sp, #104	; 0x68
3000a894:	e58d001c 	str	r0, [sp, #28]
3000a898:	e58d1018 	str	r1, [sp, #24]
3000a89c:	e58d2014 	str	r2, [sp, #20]
3000a8a0:	e58d3010 	str	r3, [sp, #16]
3000a8a4:	e59d301c 	ldr	r3, [sp, #28]
3000a8a8:	e58d303c 	str	r3, [sp, #60]	; 0x3c
	end = buf + size - 1;
3000a8ac:	e59d3018 	ldr	r3, [sp, #24]
3000a8b0:	e2433001 	sub	r3, r3, #1
3000a8b4:	e59d201c 	ldr	r2, [sp, #28]
3000a8b8:	e0823003 	add	r3, r2, r3
3000a8bc:	e58d3040 	str	r3, [sp, #64]	; 0x40

	if (end < buf - 1) {
3000a8c0:	e59d301c 	ldr	r3, [sp, #28]
3000a8c4:	e2432001 	sub	r2, r3, #1
3000a8c8:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000a8cc:	e1520003 	cmp	r2, r3
3000a8d0:	9a0002a0 	bls	3000b358 <vsnprintf+0xacc>
		end = ((void *) -1);
3000a8d4:	e3e03000 	mvn	r3, #0
3000a8d8:	e58d3040 	str	r3, [sp, #64]	; 0x40
		size = end - buf + 1;
3000a8dc:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
3000a8e0:	e59d301c 	ldr	r3, [sp, #28]
3000a8e4:	e0633002 	rsb	r3, r3, r2
3000a8e8:	e2833001 	add	r3, r3, #1
3000a8ec:	e58d3018 	str	r3, [sp, #24]
	}

	for (; *fmt ; ++fmt) {
3000a8f0:	ea000299 	b	3000b35c <vsnprintf+0xad0>
		if (*fmt != '%') {
3000a8f4:	e59d3014 	ldr	r3, [sp, #20]
3000a8f8:	e5d33000 	ldrb	r3, [r3]
3000a8fc:	e3530025 	cmp	r3, #37	; 0x25
3000a900:	0a00000b 	beq	3000a934 <vsnprintf+0xa8>
			if (str <= end)
3000a904:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000a908:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000a90c:	e1520003 	cmp	r2, r3
3000a910:	8a000003 	bhi	3000a924 <vsnprintf+0x98>
				*str = *fmt;
3000a914:	e59d3014 	ldr	r3, [sp, #20]
3000a918:	e5d32000 	ldrb	r2, [r3]
3000a91c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000a920:	e5c32000 	strb	r2, [r3]
			++str;
3000a924:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000a928:	e2833001 	add	r3, r3, #1
3000a92c:	e58d303c 	str	r3, [sp, #60]	; 0x3c
			continue;
3000a930:	ea000284 	b	3000b348 <vsnprintf+0xabc>
		}

		/* process flags */
		flags = 0;
3000a934:	e3a03000 	mov	r3, #0
3000a938:	e58d304c 	str	r3, [sp, #76]	; 0x4c
		repeat:
			++fmt;		/* this also skips first '%' */
3000a93c:	e59d3014 	ldr	r3, [sp, #20]
3000a940:	e2833001 	add	r3, r3, #1
3000a944:	e58d3014 	str	r3, [sp, #20]
			switch (*fmt) {
3000a948:	e59d3014 	ldr	r3, [sp, #20]
3000a94c:	e5d33000 	ldrb	r3, [r3]
3000a950:	e2433020 	sub	r3, r3, #32
3000a954:	e3530010 	cmp	r3, #16
3000a958:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
3000a95c:	ea000024 	b	3000a9f4 <vsnprintf+0x168>
3000a960:	3000a9c4 	.word	0x3000a9c4
3000a964:	3000a9f4 	.word	0x3000a9f4
3000a968:	3000a9f4 	.word	0x3000a9f4
3000a96c:	3000a9d4 	.word	0x3000a9d4
3000a970:	3000a9f4 	.word	0x3000a9f4
3000a974:	3000a9f4 	.word	0x3000a9f4
3000a978:	3000a9f4 	.word	0x3000a9f4
3000a97c:	3000a9f4 	.word	0x3000a9f4
3000a980:	3000a9f4 	.word	0x3000a9f4
3000a984:	3000a9f4 	.word	0x3000a9f4
3000a988:	3000a9f4 	.word	0x3000a9f4
3000a98c:	3000a9b4 	.word	0x3000a9b4
3000a990:	3000a9f4 	.word	0x3000a9f4
3000a994:	3000a9a4 	.word	0x3000a9a4
3000a998:	3000a9f4 	.word	0x3000a9f4
3000a99c:	3000a9f4 	.word	0x3000a9f4
3000a9a0:	3000a9e4 	.word	0x3000a9e4
				case '-': flags |= LEFT; goto repeat;
3000a9a4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a9a8:	e3833010 	orr	r3, r3, #16
3000a9ac:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a9b0:	eaffffe1 	b	3000a93c <vsnprintf+0xb0>
				case '+': flags |= PLUS; goto repeat;
3000a9b4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a9b8:	e3833004 	orr	r3, r3, #4
3000a9bc:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a9c0:	eaffffdd 	b	3000a93c <vsnprintf+0xb0>
				case ' ': flags |= SPACE; goto repeat;
3000a9c4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a9c8:	e3833008 	orr	r3, r3, #8
3000a9cc:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a9d0:	eaffffd9 	b	3000a93c <vsnprintf+0xb0>
				case '#': flags |= SPECIAL; goto repeat;
3000a9d4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a9d8:	e3833020 	orr	r3, r3, #32
3000a9dc:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a9e0:	eaffffd5 	b	3000a93c <vsnprintf+0xb0>
				case '0': flags |= ZEROPAD; goto repeat;
3000a9e4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a9e8:	e3833001 	orr	r3, r3, #1
3000a9ec:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a9f0:	eaffffd1 	b	3000a93c <vsnprintf+0xb0>
			}

		/* get field width */
		field_width = -1;
3000a9f4:	e3e03000 	mvn	r3, #0
3000a9f8:	e58d3050 	str	r3, [sp, #80]	; 0x50
		if (IS_DIGIT(*fmt))
3000a9fc:	e59d3014 	ldr	r3, [sp, #20]
3000aa00:	e5d33000 	ldrb	r3, [r3]
3000aa04:	e353002f 	cmp	r3, #47	; 0x2f
3000aa08:	9a000009 	bls	3000aa34 <vsnprintf+0x1a8>
3000aa0c:	e59d3014 	ldr	r3, [sp, #20]
3000aa10:	e5d33000 	ldrb	r3, [r3]
3000aa14:	e3530038 	cmp	r3, #56	; 0x38
3000aa18:	8a000005 	bhi	3000aa34 <vsnprintf+0x1a8>
			field_width = skip_atoi(&fmt);
3000aa1c:	e28d3014 	add	r3, sp, #20
3000aa20:	e1a00003 	mov	r0, r3
3000aa24:	ebfffe30 	bl	3000a2ec <skip_atoi>
3000aa28:	e1a03000 	mov	r3, r0
3000aa2c:	e58d3050 	str	r3, [sp, #80]	; 0x50
				case '0': flags |= ZEROPAD; goto repeat;
			}

		/* get field width */
		field_width = -1;
		if (IS_DIGIT(*fmt))
3000aa30:	ea000016 	b	3000aa90 <vsnprintf+0x204>
			field_width = skip_atoi(&fmt);
		else if (*fmt == '*') {
3000aa34:	e59d3014 	ldr	r3, [sp, #20]
3000aa38:	e5d33000 	ldrb	r3, [r3]
3000aa3c:	e353002a 	cmp	r3, #42	; 0x2a
3000aa40:	1a000012 	bne	3000aa90 <vsnprintf+0x204>
			++fmt;
3000aa44:	e59d3014 	ldr	r3, [sp, #20]
3000aa48:	e2833001 	add	r3, r3, #1
3000aa4c:	e58d3014 	str	r3, [sp, #20]
			/* it's the next argument */
			field_width = va_arg(args, acoral_32);
3000aa50:	e59d3010 	ldr	r3, [sp, #16]
3000aa54:	e2833004 	add	r3, r3, #4
3000aa58:	e58d3010 	str	r3, [sp, #16]
3000aa5c:	e59d3010 	ldr	r3, [sp, #16]
3000aa60:	e2433004 	sub	r3, r3, #4
3000aa64:	e5933000 	ldr	r3, [r3]
3000aa68:	e58d3050 	str	r3, [sp, #80]	; 0x50
			if (field_width < 0) {
3000aa6c:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000aa70:	e3530000 	cmp	r3, #0
3000aa74:	aa000005 	bge	3000aa90 <vsnprintf+0x204>
				field_width = -field_width;
3000aa78:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000aa7c:	e2633000 	rsb	r3, r3, #0
3000aa80:	e58d3050 	str	r3, [sp, #80]	; 0x50
				flags |= LEFT;
3000aa84:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000aa88:	e3833010 	orr	r3, r3, #16
3000aa8c:	e58d304c 	str	r3, [sp, #76]	; 0x4c
			}
		}

		/* get the precision */
		precision = -1;
3000aa90:	e3e03000 	mvn	r3, #0
3000aa94:	e58d3054 	str	r3, [sp, #84]	; 0x54
		if (*fmt == '.') {
3000aa98:	e59d3014 	ldr	r3, [sp, #20]
3000aa9c:	e5d33000 	ldrb	r3, [r3]
3000aaa0:	e353002e 	cmp	r3, #46	; 0x2e
3000aaa4:	1a000023 	bne	3000ab38 <vsnprintf+0x2ac>
			++fmt;	
3000aaa8:	e59d3014 	ldr	r3, [sp, #20]
3000aaac:	e2833001 	add	r3, r3, #1
3000aab0:	e58d3014 	str	r3, [sp, #20]
			if (IS_DIGIT(*fmt))
3000aab4:	e59d3014 	ldr	r3, [sp, #20]
3000aab8:	e5d33000 	ldrb	r3, [r3]
3000aabc:	e353002f 	cmp	r3, #47	; 0x2f
3000aac0:	9a000009 	bls	3000aaec <vsnprintf+0x260>
3000aac4:	e59d3014 	ldr	r3, [sp, #20]
3000aac8:	e5d33000 	ldrb	r3, [r3]
3000aacc:	e3530038 	cmp	r3, #56	; 0x38
3000aad0:	8a000005 	bhi	3000aaec <vsnprintf+0x260>
				precision = skip_atoi(&fmt);
3000aad4:	e28d3014 	add	r3, sp, #20
3000aad8:	e1a00003 	mov	r0, r3
3000aadc:	ebfffe02 	bl	3000a2ec <skip_atoi>
3000aae0:	e1a03000 	mov	r3, r0
3000aae4:	e58d3054 	str	r3, [sp, #84]	; 0x54

		/* get the precision */
		precision = -1;
		if (*fmt == '.') {
			++fmt;	
			if (IS_DIGIT(*fmt))
3000aae8:	ea00000d 	b	3000ab24 <vsnprintf+0x298>
				precision = skip_atoi(&fmt);
			else if (*fmt == '*') {
3000aaec:	e59d3014 	ldr	r3, [sp, #20]
3000aaf0:	e5d33000 	ldrb	r3, [r3]
3000aaf4:	e353002a 	cmp	r3, #42	; 0x2a
3000aaf8:	1a000009 	bne	3000ab24 <vsnprintf+0x298>
				++fmt;
3000aafc:	e59d3014 	ldr	r3, [sp, #20]
3000ab00:	e2833001 	add	r3, r3, #1
3000ab04:	e58d3014 	str	r3, [sp, #20]
				/* it's the next argument */
				precision = va_arg(args, acoral_32);
3000ab08:	e59d3010 	ldr	r3, [sp, #16]
3000ab0c:	e2833004 	add	r3, r3, #4
3000ab10:	e58d3010 	str	r3, [sp, #16]
3000ab14:	e59d3010 	ldr	r3, [sp, #16]
3000ab18:	e2433004 	sub	r3, r3, #4
3000ab1c:	e5933000 	ldr	r3, [r3]
3000ab20:	e58d3054 	str	r3, [sp, #84]	; 0x54
			}
			if (precision < 0)
3000ab24:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
3000ab28:	e3530000 	cmp	r3, #0
3000ab2c:	aa000001 	bge	3000ab38 <vsnprintf+0x2ac>
				precision = 0;
3000ab30:	e3a03000 	mov	r3, #0
3000ab34:	e58d3054 	str	r3, [sp, #84]	; 0x54
		}

		/* get the conversion qualifier */
		qualifier = -1;
3000ab38:	e3e03000 	mvn	r3, #0
3000ab3c:	e58d3058 	str	r3, [sp, #88]	; 0x58
		if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L' || *fmt =='Z') {
3000ab40:	e59d3014 	ldr	r3, [sp, #20]
3000ab44:	e5d33000 	ldrb	r3, [r3]
3000ab48:	e3530068 	cmp	r3, #104	; 0x68
3000ab4c:	0a00000b 	beq	3000ab80 <vsnprintf+0x2f4>
3000ab50:	e59d3014 	ldr	r3, [sp, #20]
3000ab54:	e5d33000 	ldrb	r3, [r3]
3000ab58:	e353006c 	cmp	r3, #108	; 0x6c
3000ab5c:	0a000007 	beq	3000ab80 <vsnprintf+0x2f4>
3000ab60:	e59d3014 	ldr	r3, [sp, #20]
3000ab64:	e5d33000 	ldrb	r3, [r3]
3000ab68:	e353004c 	cmp	r3, #76	; 0x4c
3000ab6c:	0a000003 	beq	3000ab80 <vsnprintf+0x2f4>
3000ab70:	e59d3014 	ldr	r3, [sp, #20]
3000ab74:	e5d33000 	ldrb	r3, [r3]
3000ab78:	e353005a 	cmp	r3, #90	; 0x5a
3000ab7c:	1a000011 	bne	3000abc8 <vsnprintf+0x33c>
			qualifier = *fmt;
3000ab80:	e59d3014 	ldr	r3, [sp, #20]
3000ab84:	e5d33000 	ldrb	r3, [r3]
3000ab88:	e58d3058 	str	r3, [sp, #88]	; 0x58
			++fmt;
3000ab8c:	e59d3014 	ldr	r3, [sp, #20]
3000ab90:	e2833001 	add	r3, r3, #1
3000ab94:	e58d3014 	str	r3, [sp, #20]
			if (qualifier == 'l' && *fmt == 'l') {
3000ab98:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000ab9c:	e353006c 	cmp	r3, #108	; 0x6c
3000aba0:	1a000008 	bne	3000abc8 <vsnprintf+0x33c>
3000aba4:	e59d3014 	ldr	r3, [sp, #20]
3000aba8:	e5d33000 	ldrb	r3, [r3]
3000abac:	e353006c 	cmp	r3, #108	; 0x6c
3000abb0:	1a000004 	bne	3000abc8 <vsnprintf+0x33c>
				qualifier = 'L';
3000abb4:	e3a0304c 	mov	r3, #76	; 0x4c
3000abb8:	e58d3058 	str	r3, [sp, #88]	; 0x58
				++fmt;
3000abbc:	e59d3014 	ldr	r3, [sp, #20]
3000abc0:	e2833001 	add	r3, r3, #1
3000abc4:	e58d3014 	str	r3, [sp, #20]
			}
		}

		/* default base */
		base = 10;
3000abc8:	e3a0300a 	mov	r3, #10
3000abcc:	e58d3038 	str	r3, [sp, #56]	; 0x38

		switch (*fmt) {
3000abd0:	e59d3014 	ldr	r3, [sp, #20]
3000abd4:	e5d33000 	ldrb	r3, [r3]
3000abd8:	e2433025 	sub	r3, r3, #37	; 0x25
3000abdc:	e3530053 	cmp	r3, #83	; 0x53
3000abe0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
3000abe4:	ea00014b 	b	3000b118 <vsnprintf+0x88c>
3000abe8:	3000b0b8 	.word	0x3000b0b8
3000abec:	3000b118 	.word	0x3000b118
3000abf0:	3000b118 	.word	0x3000b118
3000abf4:	3000b118 	.word	0x3000b118
3000abf8:	3000b118 	.word	0x3000b118
3000abfc:	3000b118 	.word	0x3000b118
3000ac00:	3000b118 	.word	0x3000b118
3000ac04:	3000b118 	.word	0x3000b118
3000ac08:	3000b118 	.word	0x3000b118
3000ac0c:	3000b118 	.word	0x3000b118
3000ac10:	3000b118 	.word	0x3000b118
3000ac14:	3000b118 	.word	0x3000b118
3000ac18:	3000b118 	.word	0x3000b118
3000ac1c:	3000b118 	.word	0x3000b118
3000ac20:	3000b118 	.word	0x3000b118
3000ac24:	3000b118 	.word	0x3000b118
3000ac28:	3000b118 	.word	0x3000b118
3000ac2c:	3000b118 	.word	0x3000b118
3000ac30:	3000b118 	.word	0x3000b118
3000ac34:	3000b118 	.word	0x3000b118
3000ac38:	3000b118 	.word	0x3000b118
3000ac3c:	3000b118 	.word	0x3000b118
3000ac40:	3000b118 	.word	0x3000b118
3000ac44:	3000b118 	.word	0x3000b118
3000ac48:	3000b118 	.word	0x3000b118
3000ac4c:	3000b118 	.word	0x3000b118
3000ac50:	3000b118 	.word	0x3000b118
3000ac54:	3000b118 	.word	0x3000b118
3000ac58:	3000b118 	.word	0x3000b118
3000ac5c:	3000b118 	.word	0x3000b118
3000ac60:	3000b118 	.word	0x3000b118
3000ac64:	3000b118 	.word	0x3000b118
3000ac68:	3000b118 	.word	0x3000b118
3000ac6c:	3000b118 	.word	0x3000b118
3000ac70:	3000b118 	.word	0x3000b118
3000ac74:	3000b118 	.word	0x3000b118
3000ac78:	3000b118 	.word	0x3000b118
3000ac7c:	3000b118 	.word	0x3000b118
3000ac80:	3000b118 	.word	0x3000b118
3000ac84:	3000b118 	.word	0x3000b118
3000ac88:	3000b118 	.word	0x3000b118
3000ac8c:	3000b118 	.word	0x3000b118
3000ac90:	3000b118 	.word	0x3000b118
3000ac94:	3000b118 	.word	0x3000b118
3000ac98:	3000b118 	.word	0x3000b118
3000ac9c:	3000b118 	.word	0x3000b118
3000aca0:	3000b118 	.word	0x3000b118
3000aca4:	3000b118 	.word	0x3000b118
3000aca8:	3000b118 	.word	0x3000b118
3000acac:	3000b118 	.word	0x3000b118
3000acb0:	3000b118 	.word	0x3000b118
3000acb4:	3000b0f0 	.word	0x3000b0f0
3000acb8:	3000b118 	.word	0x3000b118
3000acbc:	3000b118 	.word	0x3000b118
3000acc0:	3000b118 	.word	0x3000b118
3000acc4:	3000b118 	.word	0x3000b118
3000acc8:	3000b118 	.word	0x3000b118
3000accc:	3000b118 	.word	0x3000b118
3000acd0:	3000b118 	.word	0x3000b118
3000acd4:	3000b118 	.word	0x3000b118
3000acd8:	3000b118 	.word	0x3000b118
3000acdc:	3000b118 	.word	0x3000b118
3000ace0:	3000ad38 	.word	0x3000ad38
3000ace4:	3000b108 	.word	0x3000b108
3000ace8:	3000b118 	.word	0x3000b118
3000acec:	3000b118 	.word	0x3000b118
3000acf0:	3000b118 	.word	0x3000b118
3000acf4:	3000b118 	.word	0x3000b118
3000acf8:	3000b108 	.word	0x3000b108
3000acfc:	3000b118 	.word	0x3000b118
3000ad00:	3000b118 	.word	0x3000b118
3000ad04:	3000b118 	.word	0x3000b118
3000ad08:	3000b118 	.word	0x3000b118
3000ad0c:	3000b000 	.word	0x3000b000
3000ad10:	3000b0e4 	.word	0x3000b0e4
3000ad14:	3000af84 	.word	0x3000af84
3000ad18:	3000b118 	.word	0x3000b118
3000ad1c:	3000b118 	.word	0x3000b118
3000ad20:	3000ae18 	.word	0x3000ae18
3000ad24:	3000b118 	.word	0x3000b118
3000ad28:	3000b190 	.word	0x3000b190
3000ad2c:	3000b118 	.word	0x3000b118
3000ad30:	3000b118 	.word	0x3000b118
3000ad34:	3000b0fc 	.word	0x3000b0fc
			case 'c':
				if (!(flags & LEFT)) {
3000ad38:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000ad3c:	e2033010 	and	r3, r3, #16
3000ad40:	e3530000 	cmp	r3, #0
3000ad44:	1a000010 	bne	3000ad8c <vsnprintf+0x500>
					while (--field_width > 0) {
3000ad48:	ea000009 	b	3000ad74 <vsnprintf+0x4e8>
						if (str <= end)
3000ad4c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ad50:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000ad54:	e1520003 	cmp	r2, r3
3000ad58:	8a000002 	bhi	3000ad68 <vsnprintf+0x4dc>
							*str = ' ';
3000ad5c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ad60:	e3a02020 	mov	r2, #32
3000ad64:	e5c32000 	strb	r2, [r3]
						++str;
3000ad68:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ad6c:	e2833001 	add	r3, r3, #1
3000ad70:	e58d303c 	str	r3, [sp, #60]	; 0x3c
		base = 10;

		switch (*fmt) {
			case 'c':
				if (!(flags & LEFT)) {
					while (--field_width > 0) {
3000ad74:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000ad78:	e2433001 	sub	r3, r3, #1
3000ad7c:	e58d3050 	str	r3, [sp, #80]	; 0x50
3000ad80:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000ad84:	e3530000 	cmp	r3, #0
3000ad88:	caffffef 	bgt	3000ad4c <vsnprintf+0x4c0>
						if (str <= end)
							*str = ' ';
						++str;
					}
				}
				c = (acoral_u8) va_arg(args, acoral_32);
3000ad8c:	e59d3010 	ldr	r3, [sp, #16]
3000ad90:	e2833004 	add	r3, r3, #4
3000ad94:	e58d3010 	str	r3, [sp, #16]
3000ad98:	e59d3010 	ldr	r3, [sp, #16]
3000ad9c:	e2433004 	sub	r3, r3, #4
3000ada0:	e5933000 	ldr	r3, [r3]
3000ada4:	e5cd3047 	strb	r3, [sp, #71]	; 0x47
				if (str <= end)
3000ada8:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000adac:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000adb0:	e1520003 	cmp	r2, r3
3000adb4:	8a000002 	bhi	3000adc4 <vsnprintf+0x538>
					*str = c;
3000adb8:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000adbc:	e5dd2047 	ldrb	r2, [sp, #71]	; 0x47
3000adc0:	e5c32000 	strb	r2, [r3]
				++str;
3000adc4:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000adc8:	e2833001 	add	r3, r3, #1
3000adcc:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				while (--field_width > 0) {
3000add0:	ea000009 	b	3000adfc <vsnprintf+0x570>
					if (str <= end)
3000add4:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000add8:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000addc:	e1520003 	cmp	r2, r3
3000ade0:	8a000002 	bhi	3000adf0 <vsnprintf+0x564>
						*str = ' ';
3000ade4:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ade8:	e3a02020 	mov	r2, #32
3000adec:	e5c32000 	strb	r2, [r3]
					++str;
3000adf0:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000adf4:	e2833001 	add	r3, r3, #1
3000adf8:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				}
				c = (acoral_u8) va_arg(args, acoral_32);
				if (str <= end)
					*str = c;
				++str;
				while (--field_width > 0) {
3000adfc:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000ae00:	e2433001 	sub	r3, r3, #1
3000ae04:	e58d3050 	str	r3, [sp, #80]	; 0x50
3000ae08:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000ae0c:	e3530000 	cmp	r3, #0
3000ae10:	caffffef 	bgt	3000add4 <vsnprintf+0x548>
					if (str <= end)
						*str = ' ';
					++str;
				}
				continue;
3000ae14:	ea00014b 	b	3000b348 <vsnprintf+0xabc>

			case 's':
				s = va_arg(args, acoral_char *);
3000ae18:	e59d3010 	ldr	r3, [sp, #16]
3000ae1c:	e2833004 	add	r3, r3, #4
3000ae20:	e58d3010 	str	r3, [sp, #16]
3000ae24:	e59d3010 	ldr	r3, [sp, #16]
3000ae28:	e2433004 	sub	r3, r3, #4
3000ae2c:	e5933000 	ldr	r3, [r3]
3000ae30:	e58d3048 	str	r3, [sp, #72]	; 0x48
				if (!s)
3000ae34:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
3000ae38:	e3530000 	cmp	r3, #0
3000ae3c:	1a000001 	bne	3000ae48 <vsnprintf+0x5bc>
					s = "<NULL>";
3000ae40:	e59f3578 	ldr	r3, [pc, #1400]	; 3000b3c0 <vsnprintf+0xb34>
3000ae44:	e58d3048 	str	r3, [sp, #72]	; 0x48

				len = acoral_str_nlen(s, precision);
3000ae48:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
3000ae4c:	e59d0048 	ldr	r0, [sp, #72]	; 0x48
3000ae50:	e1a01003 	mov	r1, r3
3000ae54:	eb0004c5 	bl	3000c170 <acoral_str_nlen>
3000ae58:	e1a03000 	mov	r3, r0
3000ae5c:	e58d3024 	str	r3, [sp, #36]	; 0x24

				if (!(flags & LEFT)) {
3000ae60:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000ae64:	e2033010 	and	r3, r3, #16
3000ae68:	e3530000 	cmp	r3, #0
3000ae6c:	1a000015 	bne	3000aec8 <vsnprintf+0x63c>
					while (len < field_width--) {
3000ae70:	ea000009 	b	3000ae9c <vsnprintf+0x610>
						if (str <= end)
3000ae74:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ae78:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000ae7c:	e1520003 	cmp	r2, r3
3000ae80:	8a000002 	bhi	3000ae90 <vsnprintf+0x604>
							*str = ' ';
3000ae84:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ae88:	e3a02020 	mov	r2, #32
3000ae8c:	e5c32000 	strb	r2, [r3]
						++str;
3000ae90:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ae94:	e2833001 	add	r3, r3, #1
3000ae98:	e58d303c 	str	r3, [sp, #60]	; 0x3c
					s = "<NULL>";

				len = acoral_str_nlen(s, precision);

				if (!(flags & LEFT)) {
					while (len < field_width--) {
3000ae9c:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000aea0:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000aea4:	e1520003 	cmp	r2, r3
3000aea8:	d3a03000 	movle	r3, #0
3000aeac:	c3a03001 	movgt	r3, #1
3000aeb0:	e20330ff 	and	r3, r3, #255	; 0xff
3000aeb4:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000aeb8:	e2422001 	sub	r2, r2, #1
3000aebc:	e58d2050 	str	r2, [sp, #80]	; 0x50
3000aec0:	e3530000 	cmp	r3, #0
3000aec4:	1affffea 	bne	3000ae74 <vsnprintf+0x5e8>
						if (str <= end)
							*str = ' ';
						++str;
					}
				}
				for (i = 0; i < len; ++i) {
3000aec8:	e3a03000 	mov	r3, #0
3000aecc:	e58d3034 	str	r3, [sp, #52]	; 0x34
3000aed0:	ea000010 	b	3000af18 <vsnprintf+0x68c>
					if (str <= end)
3000aed4:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000aed8:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000aedc:	e1520003 	cmp	r2, r3
3000aee0:	8a000003 	bhi	3000aef4 <vsnprintf+0x668>
						*str = *s;
3000aee4:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
3000aee8:	e5d32000 	ldrb	r2, [r3]
3000aeec:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000aef0:	e5c32000 	strb	r2, [r3]
					++str; ++s;
3000aef4:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000aef8:	e2833001 	add	r3, r3, #1
3000aefc:	e58d303c 	str	r3, [sp, #60]	; 0x3c
3000af00:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
3000af04:	e2833001 	add	r3, r3, #1
3000af08:	e58d3048 	str	r3, [sp, #72]	; 0x48
						if (str <= end)
							*str = ' ';
						++str;
					}
				}
				for (i = 0; i < len; ++i) {
3000af0c:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
3000af10:	e2833001 	add	r3, r3, #1
3000af14:	e58d3034 	str	r3, [sp, #52]	; 0x34
3000af18:	e59d2034 	ldr	r2, [sp, #52]	; 0x34
3000af1c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000af20:	e1520003 	cmp	r2, r3
3000af24:	baffffea 	blt	3000aed4 <vsnprintf+0x648>
					if (str <= end)
						*str = *s;
					++str; ++s;
				}
				while (len < field_width--) {
3000af28:	ea000009 	b	3000af54 <vsnprintf+0x6c8>
					if (str <= end)
3000af2c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000af30:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000af34:	e1520003 	cmp	r2, r3
3000af38:	8a000002 	bhi	3000af48 <vsnprintf+0x6bc>
						*str = ' ';
3000af3c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000af40:	e3a02020 	mov	r2, #32
3000af44:	e5c32000 	strb	r2, [r3]
					++str;
3000af48:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000af4c:	e2833001 	add	r3, r3, #1
3000af50:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				for (i = 0; i < len; ++i) {
					if (str <= end)
						*str = *s;
					++str; ++s;
				}
				while (len < field_width--) {
3000af54:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000af58:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000af5c:	e1520003 	cmp	r2, r3
3000af60:	d3a03000 	movle	r3, #0
3000af64:	c3a03001 	movgt	r3, #1
3000af68:	e20330ff 	and	r3, r3, #255	; 0xff
3000af6c:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000af70:	e2422001 	sub	r2, r2, #1
3000af74:	e58d2050 	str	r2, [sp, #80]	; 0x50
3000af78:	e3530000 	cmp	r3, #0
3000af7c:	1affffea 	bne	3000af2c <vsnprintf+0x6a0>
					if (str <= end)
						*str = ' ';
					++str;
				}
				continue;
3000af80:	ea0000f0 	b	3000b348 <vsnprintf+0xabc>

			case 'p':
				if (field_width == -1) {
3000af84:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000af88:	e3730001 	cmn	r3, #1
3000af8c:	1a000004 	bne	3000afa4 <vsnprintf+0x718>
					field_width = 2*sizeof(void *);
3000af90:	e3a03008 	mov	r3, #8
3000af94:	e58d3050 	str	r3, [sp, #80]	; 0x50
					flags |= ZEROPAD;
3000af98:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000af9c:	e3833001 	orr	r3, r3, #1
3000afa0:	e58d304c 	str	r3, [sp, #76]	; 0x4c
				}
				str = number(str, end,
3000afa4:	e59d3010 	ldr	r3, [sp, #16]
3000afa8:	e2833004 	add	r3, r3, #4
3000afac:	e58d3010 	str	r3, [sp, #16]
						(acoral_u32) va_arg(args, void *),
3000afb0:	e59d3010 	ldr	r3, [sp, #16]
3000afb4:	e2433004 	sub	r3, r3, #4
3000afb8:	e5933000 	ldr	r3, [r3]
			case 'p':
				if (field_width == -1) {
					field_width = 2*sizeof(void *);
					flags |= ZEROPAD;
				}
				str = number(str, end,
3000afbc:	e3a04000 	mov	r4, #0
3000afc0:	e3a02010 	mov	r2, #16
3000afc4:	e58d2000 	str	r2, [sp]
3000afc8:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000afcc:	e58d2004 	str	r2, [sp, #4]
3000afd0:	e59d2054 	ldr	r2, [sp, #84]	; 0x54
3000afd4:	e58d2008 	str	r2, [sp, #8]
3000afd8:	e59d204c 	ldr	r2, [sp, #76]	; 0x4c
3000afdc:	e58d200c 	str	r2, [sp, #12]
3000afe0:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
3000afe4:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
3000afe8:	e1a02003 	mov	r2, r3
3000afec:	e1a03004 	mov	r3, r4
3000aff0:	ebfffcdf 	bl	3000a374 <number>
3000aff4:	e1a03000 	mov	r3, r0
3000aff8:	e58d303c 	str	r3, [sp, #60]	; 0x3c
						(acoral_u32) va_arg(args, void *),
						16, field_width, precision, flags);
				continue;
3000affc:	ea0000d1 	b	3000b348 <vsnprintf+0xabc>


			case 'n':
				/* FIXME:
				* What does C99 say about the overflow case here? */
				if (qualifier == 'l') {
3000b000:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b004:	e353006c 	cmp	r3, #108	; 0x6c
3000b008:	1a00000c 	bne	3000b040 <vsnprintf+0x7b4>
					acoral_32 * ip = va_arg(args, acoral_32 *);
3000b00c:	e59d3010 	ldr	r3, [sp, #16]
3000b010:	e2833004 	add	r3, r3, #4
3000b014:	e58d3010 	str	r3, [sp, #16]
3000b018:	e59d3010 	ldr	r3, [sp, #16]
3000b01c:	e2433004 	sub	r3, r3, #4
3000b020:	e5933000 	ldr	r3, [r3]
3000b024:	e58d305c 	str	r3, [sp, #92]	; 0x5c
					*ip = (str - buf);
3000b028:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b02c:	e59d301c 	ldr	r3, [sp, #28]
3000b030:	e0632002 	rsb	r2, r3, r2
3000b034:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000b038:	e5832000 	str	r2, [r3]
					*ip = (str - buf);
				} else {
					acoral_32 * ip = va_arg(args, acoral_32 *);
					*ip = (str - buf);
				}
				continue;
3000b03c:	ea0000c1 	b	3000b348 <vsnprintf+0xabc>
				/* FIXME:
				* What does C99 say about the overflow case here? */
				if (qualifier == 'l') {
					acoral_32 * ip = va_arg(args, acoral_32 *);
					*ip = (str - buf);
				} else if (qualifier == 'Z') {
3000b040:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b044:	e353005a 	cmp	r3, #90	; 0x5a
3000b048:	1a00000d 	bne	3000b084 <vsnprintf+0x7f8>
					acoral_u32 * ip = va_arg(args, acoral_u32 *);
3000b04c:	e59d3010 	ldr	r3, [sp, #16]
3000b050:	e2833004 	add	r3, r3, #4
3000b054:	e58d3010 	str	r3, [sp, #16]
3000b058:	e59d3010 	ldr	r3, [sp, #16]
3000b05c:	e2433004 	sub	r3, r3, #4
3000b060:	e5933000 	ldr	r3, [r3]
3000b064:	e58d3060 	str	r3, [sp, #96]	; 0x60
					*ip = (str - buf);
3000b068:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b06c:	e59d301c 	ldr	r3, [sp, #28]
3000b070:	e0633002 	rsb	r3, r3, r2
3000b074:	e1a02003 	mov	r2, r3
3000b078:	e59d3060 	ldr	r3, [sp, #96]	; 0x60
3000b07c:	e5832000 	str	r2, [r3]
				} else {
					acoral_32 * ip = va_arg(args, acoral_32 *);
					*ip = (str - buf);
				}
				continue;
3000b080:	ea0000b0 	b	3000b348 <vsnprintf+0xabc>
					*ip = (str - buf);
				} else if (qualifier == 'Z') {
					acoral_u32 * ip = va_arg(args, acoral_u32 *);
					*ip = (str - buf);
				} else {
					acoral_32 * ip = va_arg(args, acoral_32 *);
3000b084:	e59d3010 	ldr	r3, [sp, #16]
3000b088:	e2833004 	add	r3, r3, #4
3000b08c:	e58d3010 	str	r3, [sp, #16]
3000b090:	e59d3010 	ldr	r3, [sp, #16]
3000b094:	e2433004 	sub	r3, r3, #4
3000b098:	e5933000 	ldr	r3, [r3]
3000b09c:	e58d3064 	str	r3, [sp, #100]	; 0x64
					*ip = (str - buf);
3000b0a0:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b0a4:	e59d301c 	ldr	r3, [sp, #28]
3000b0a8:	e0632002 	rsb	r2, r3, r2
3000b0ac:	e59d3064 	ldr	r3, [sp, #100]	; 0x64
3000b0b0:	e5832000 	str	r2, [r3]
				}
				continue;
3000b0b4:	ea0000a3 	b	3000b348 <vsnprintf+0xabc>

			case '%':
				if (str <= end)
3000b0b8:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b0bc:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000b0c0:	e1520003 	cmp	r2, r3
3000b0c4:	8a000002 	bhi	3000b0d4 <vsnprintf+0x848>
					*str = '%';
3000b0c8:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b0cc:	e3a02025 	mov	r2, #37	; 0x25
3000b0d0:	e5c32000 	strb	r2, [r3]
				++str;
3000b0d4:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b0d8:	e2833001 	add	r3, r3, #1
3000b0dc:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				continue;
3000b0e0:	ea000098 	b	3000b348 <vsnprintf+0xabc>

				/* acoral_32eger number formats - set up the flags and "break" */
			case 'o':
				base = 8;
3000b0e4:	e3a03008 	mov	r3, #8
3000b0e8:	e58d3038 	str	r3, [sp, #56]	; 0x38
				break;
3000b0ec:	ea000028 	b	3000b194 <vsnprintf+0x908>

			case 'X':
				flags |= LARGE;
3000b0f0:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000b0f4:	e3833040 	orr	r3, r3, #64	; 0x40
3000b0f8:	e58d304c 	str	r3, [sp, #76]	; 0x4c
			case 'x':
				base = 16;
3000b0fc:	e3a03010 	mov	r3, #16
3000b100:	e58d3038 	str	r3, [sp, #56]	; 0x38
				break;
3000b104:	ea000022 	b	3000b194 <vsnprintf+0x908>

			case 'd':
			case 'i':
				flags |= SIGN;
3000b108:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000b10c:	e3833002 	orr	r3, r3, #2
3000b110:	e58d304c 	str	r3, [sp, #76]	; 0x4c
			case 'u':
				break;
3000b114:	ea00001e 	b	3000b194 <vsnprintf+0x908>

			default:
				if (str <= end)
3000b118:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b11c:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000b120:	e1520003 	cmp	r2, r3
3000b124:	8a000002 	bhi	3000b134 <vsnprintf+0x8a8>
					*str = '%';
3000b128:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b12c:	e3a02025 	mov	r2, #37	; 0x25
3000b130:	e5c32000 	strb	r2, [r3]
				++str;
3000b134:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b138:	e2833001 	add	r3, r3, #1
3000b13c:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				if (*fmt) {
3000b140:	e59d3014 	ldr	r3, [sp, #20]
3000b144:	e5d33000 	ldrb	r3, [r3]
3000b148:	e3530000 	cmp	r3, #0
3000b14c:	0a00000b 	beq	3000b180 <vsnprintf+0x8f4>
					if (str <= end)
3000b150:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b154:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000b158:	e1520003 	cmp	r2, r3
3000b15c:	8a000003 	bhi	3000b170 <vsnprintf+0x8e4>
						*str = *fmt;
3000b160:	e59d3014 	ldr	r3, [sp, #20]
3000b164:	e5d32000 	ldrb	r2, [r3]
3000b168:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b16c:	e5c32000 	strb	r2, [r3]
					++str;
3000b170:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b174:	e2833001 	add	r3, r3, #1
3000b178:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				} else {
					--fmt;
				}
				continue;
3000b17c:	ea000071 	b	3000b348 <vsnprintf+0xabc>
				if (*fmt) {
					if (str <= end)
						*str = *fmt;
					++str;
				} else {
					--fmt;
3000b180:	e59d3014 	ldr	r3, [sp, #20]
3000b184:	e2433001 	sub	r3, r3, #1
3000b188:	e58d3014 	str	r3, [sp, #20]
				}
				continue;
3000b18c:	ea00006d 	b	3000b348 <vsnprintf+0xabc>

			case 'd':
			case 'i':
				flags |= SIGN;
			case 'u':
				break;
3000b190:	e1a00000 	nop			; (mov r0, r0)
				} else {
					--fmt;
				}
				continue;
		}
		if (qualifier == 'L')
3000b194:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b198:	e353004c 	cmp	r3, #76	; 0x4c
3000b19c:	1a000008 	bne	3000b1c4 <vsnprintf+0x938>
			num = va_arg(args, acoral_64);
3000b1a0:	e59d3010 	ldr	r3, [sp, #16]
3000b1a4:	e2833008 	add	r3, r3, #8
3000b1a8:	e58d3010 	str	r3, [sp, #16]
3000b1ac:	e59d3010 	ldr	r3, [sp, #16]
3000b1b0:	e2433008 	sub	r3, r3, #8
3000b1b4:	e8930018 	ldm	r3, {r3, r4}
3000b1b8:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b1bc:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b1c0:	ea00004f 	b	3000b304 <vsnprintf+0xa78>
		else if (qualifier == 'l') {
3000b1c4:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b1c8:	e353006c 	cmp	r3, #108	; 0x6c
3000b1cc:	1a000011 	bne	3000b218 <vsnprintf+0x98c>
			num = va_arg(args, acoral_u32);
3000b1d0:	e59d3010 	ldr	r3, [sp, #16]
3000b1d4:	e2833004 	add	r3, r3, #4
3000b1d8:	e58d3010 	str	r3, [sp, #16]
3000b1dc:	e59d3010 	ldr	r3, [sp, #16]
3000b1e0:	e2433004 	sub	r3, r3, #4
3000b1e4:	e5933000 	ldr	r3, [r3]
3000b1e8:	e3a04000 	mov	r4, #0
3000b1ec:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b1f0:	e58d402c 	str	r4, [sp, #44]	; 0x2c
			if (flags & SIGN)
3000b1f4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000b1f8:	e2033002 	and	r3, r3, #2
3000b1fc:	e3530000 	cmp	r3, #0
3000b200:	0a00003c 	beq	3000b2f8 <vsnprintf+0xa6c>
				num = (acoral_32) num;
3000b204:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
3000b208:	e1a04fc3 	asr	r4, r3, #31
3000b20c:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b210:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b214:	ea00003a 	b	3000b304 <vsnprintf+0xa78>
		} else if (qualifier == 'Z') {
3000b218:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b21c:	e353005a 	cmp	r3, #90	; 0x5a
3000b220:	1a000009 	bne	3000b24c <vsnprintf+0x9c0>
			num = va_arg(args, acoral_u32);
3000b224:	e59d3010 	ldr	r3, [sp, #16]
3000b228:	e2833004 	add	r3, r3, #4
3000b22c:	e58d3010 	str	r3, [sp, #16]
3000b230:	e59d3010 	ldr	r3, [sp, #16]
3000b234:	e2433004 	sub	r3, r3, #4
3000b238:	e5933000 	ldr	r3, [r3]
3000b23c:	e3a04000 	mov	r4, #0
3000b240:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b244:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b248:	ea00002d 	b	3000b304 <vsnprintf+0xa78>
		} else if (qualifier == 'h') {
3000b24c:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b250:	e3530068 	cmp	r3, #104	; 0x68
3000b254:	1a000015 	bne	3000b2b0 <vsnprintf+0xa24>
			num = (acoral_u16) va_arg(args, acoral_32);
3000b258:	e59d3010 	ldr	r3, [sp, #16]
3000b25c:	e2833004 	add	r3, r3, #4
3000b260:	e58d3010 	str	r3, [sp, #16]
3000b264:	e59d3010 	ldr	r3, [sp, #16]
3000b268:	e2433004 	sub	r3, r3, #4
3000b26c:	e5933000 	ldr	r3, [r3]
3000b270:	e1a03803 	lsl	r3, r3, #16
3000b274:	e1a03823 	lsr	r3, r3, #16
3000b278:	e3a04000 	mov	r4, #0
3000b27c:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b280:	e58d402c 	str	r4, [sp, #44]	; 0x2c
			if (flags & SIGN)
3000b284:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000b288:	e2033002 	and	r3, r3, #2
3000b28c:	e3530000 	cmp	r3, #0
3000b290:	0a00001a 	beq	3000b300 <vsnprintf+0xa74>
				num = (acoral_16) num;
3000b294:	e1dd32b8 	ldrh	r3, [sp, #40]	; 0x28
3000b298:	e1a03803 	lsl	r3, r3, #16
3000b29c:	e1a03843 	asr	r3, r3, #16
3000b2a0:	e1a04fc3 	asr	r4, r3, #31
3000b2a4:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b2a8:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b2ac:	ea000014 	b	3000b304 <vsnprintf+0xa78>
		} else {
			num = va_arg(args, acoral_u32);
3000b2b0:	e59d3010 	ldr	r3, [sp, #16]
3000b2b4:	e2833004 	add	r3, r3, #4
3000b2b8:	e58d3010 	str	r3, [sp, #16]
3000b2bc:	e59d3010 	ldr	r3, [sp, #16]
3000b2c0:	e2433004 	sub	r3, r3, #4
3000b2c4:	e5933000 	ldr	r3, [r3]
3000b2c8:	e3a04000 	mov	r4, #0
3000b2cc:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b2d0:	e58d402c 	str	r4, [sp, #44]	; 0x2c
			if (flags & SIGN)
3000b2d4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000b2d8:	e2033002 	and	r3, r3, #2
3000b2dc:	e3530000 	cmp	r3, #0
3000b2e0:	0a000007 	beq	3000b304 <vsnprintf+0xa78>
				num = (acoral_32) num;
3000b2e4:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
3000b2e8:	e1a04fc3 	asr	r4, r3, #31
3000b2ec:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b2f0:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b2f4:	ea000002 	b	3000b304 <vsnprintf+0xa78>
		if (qualifier == 'L')
			num = va_arg(args, acoral_64);
		else if (qualifier == 'l') {
			num = va_arg(args, acoral_u32);
			if (flags & SIGN)
				num = (acoral_32) num;
3000b2f8:	e1a00000 	nop			; (mov r0, r0)
3000b2fc:	ea000000 	b	3000b304 <vsnprintf+0xa78>
		} else if (qualifier == 'Z') {
			num = va_arg(args, acoral_u32);
		} else if (qualifier == 'h') {
			num = (acoral_u16) va_arg(args, acoral_32);
			if (flags & SIGN)
				num = (acoral_16) num;
3000b300:	e1a00000 	nop			; (mov r0, r0)
		} else {
			num = va_arg(args, acoral_u32);
			if (flags & SIGN)
				num = (acoral_32) num;
		}
		str = number(str, end, num, base,
3000b304:	e28d4028 	add	r4, sp, #40	; 0x28
3000b308:	e8940018 	ldm	r4, {r3, r4}
3000b30c:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
3000b310:	e58d2000 	str	r2, [sp]
3000b314:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000b318:	e58d2004 	str	r2, [sp, #4]
3000b31c:	e59d2054 	ldr	r2, [sp, #84]	; 0x54
3000b320:	e58d2008 	str	r2, [sp, #8]
3000b324:	e59d204c 	ldr	r2, [sp, #76]	; 0x4c
3000b328:	e58d200c 	str	r2, [sp, #12]
3000b32c:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
3000b330:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
3000b334:	e1a02003 	mov	r2, r3
3000b338:	e1a03004 	mov	r3, r4
3000b33c:	ebfffc0c 	bl	3000a374 <number>
3000b340:	e1a03000 	mov	r3, r0
3000b344:	e58d303c 	str	r3, [sp, #60]	; 0x3c
	if (end < buf - 1) {
		end = ((void *) -1);
		size = end - buf + 1;
	}

	for (; *fmt ; ++fmt) {
3000b348:	e59d3014 	ldr	r3, [sp, #20]
3000b34c:	e2833001 	add	r3, r3, #1
3000b350:	e58d3014 	str	r3, [sp, #20]
3000b354:	ea000000 	b	3000b35c <vsnprintf+0xad0>
3000b358:	e1a00000 	nop			; (mov r0, r0)
3000b35c:	e59d3014 	ldr	r3, [sp, #20]
3000b360:	e5d33000 	ldrb	r3, [r3]
3000b364:	e3530000 	cmp	r3, #0
3000b368:	1afffd61 	bne	3000a8f4 <vsnprintf+0x68>
				num = (acoral_32) num;
		}
		str = number(str, end, num, base,
				field_width, precision, flags);
	}
	if (str <= end)
3000b36c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b370:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000b374:	e1520003 	cmp	r2, r3
3000b378:	8a000003 	bhi	3000b38c <vsnprintf+0xb00>
		*str = '\0';
3000b37c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b380:	e3a02000 	mov	r2, #0
3000b384:	e5c32000 	strb	r2, [r3]
3000b388:	ea000005 	b	3000b3a4 <vsnprintf+0xb18>
	else if (size > 0)
3000b38c:	e59d3018 	ldr	r3, [sp, #24]
3000b390:	e3530000 	cmp	r3, #0
3000b394:	0a000002 	beq	3000b3a4 <vsnprintf+0xb18>
		/* don't write out a null byte if the buf size is zero */
		*end = '\0';
3000b398:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000b39c:	e3a02000 	mov	r2, #0
3000b3a0:	e5c32000 	strb	r2, [r3]
	/* the trailing null byte doesn't count towards the total
	* ++str;
	*/
	return str-buf;
3000b3a4:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b3a8:	e59d301c 	ldr	r3, [sp, #28]
3000b3ac:	e0633002 	rsb	r3, r3, r2
}
3000b3b0:	e1a00003 	mov	r0, r3
3000b3b4:	e28dd068 	add	sp, sp, #104	; 0x68
3000b3b8:	e8bd4010 	pop	{r4, lr}
3000b3bc:	e12fff1e 	bx	lr
3000b3c0:	3000ea14 	.word	0x3000ea14

3000b3c4 <acoral_sprint>:

acoral_32 acoral_sprint(acoral_char * buf, acoral_u32 size, const acoral_char *fmt, ...)
{
3000b3c4:	e92d000c 	push	{r2, r3}
3000b3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b3cc:	e24dd014 	sub	sp, sp, #20
3000b3d0:	e58d0004 	str	r0, [sp, #4]
3000b3d4:	e58d1000 	str	r1, [sp]
	acoral_32 i;
	va_list args;
	va_start(args, fmt);
3000b3d8:	e28d3018 	add	r3, sp, #24
3000b3dc:	e2833004 	add	r3, r3, #4
3000b3e0:	e58d300c 	str	r3, [sp, #12]
	i=vsnprintf(buf,size,fmt,args);
3000b3e4:	e59d3018 	ldr	r3, [sp, #24]
3000b3e8:	e59d0004 	ldr	r0, [sp, #4]
3000b3ec:	e59d1000 	ldr	r1, [sp]
3000b3f0:	e1a02003 	mov	r2, r3
3000b3f4:	e59d300c 	ldr	r3, [sp, #12]
3000b3f8:	ebfffd23 	bl	3000a88c <vsnprintf>
3000b3fc:	e1a03000 	mov	r3, r0
3000b400:	e58d3008 	str	r3, [sp, #8]
	va_end(args);
3000b404:	e3a03000 	mov	r3, #0
3000b408:	e58d300c 	str	r3, [sp, #12]
	return i;
3000b40c:	e59d3008 	ldr	r3, [sp, #8]
}
3000b410:	e1a00003 	mov	r0, r3
3000b414:	e28dd014 	add	sp, sp, #20
3000b418:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b41c:	e28dd008 	add	sp, sp, #8
3000b420:	e12fff1e 	bx	lr

3000b424 <acoral_print>:

acoral_32 acoral_print(const acoral_char *fmt, ...)
{
3000b424:	e92d000f 	push	{r0, r1, r2, r3}
3000b428:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b42c:	e24dd014 	sub	sp, sp, #20
	va_list args;
	acoral_32 printed_len;
	static acoral_char print_buf[256];
	va_start(args, fmt);
3000b430:	e28d3018 	add	r3, sp, #24
3000b434:	e2833004 	add	r3, r3, #4
3000b438:	e58d3008 	str	r3, [sp, #8]
	printed_len =vsnprintf(print_buf, sizeof(print_buf), fmt, args);
3000b43c:	e59d3018 	ldr	r3, [sp, #24]
3000b440:	e59f0060 	ldr	r0, [pc, #96]	; 3000b4a8 <acoral_print+0x84>
3000b444:	e3a01c01 	mov	r1, #256	; 0x100
3000b448:	e1a02003 	mov	r2, r3
3000b44c:	e59d3008 	ldr	r3, [sp, #8]
3000b450:	ebfffd0d 	bl	3000a88c <vsnprintf>
3000b454:	e1a03000 	mov	r3, r0
3000b458:	e58d300c 	str	r3, [sp, #12]
	va_end(args);
3000b45c:	e3a03000 	mov	r3, #0
3000b460:	e58d3008 	str	r3, [sp, #8]
	return acoral_dev_write(acoral_cur_thread->console_id,(void *)print_buf,printed_len,0,0);
3000b464:	e59f3040 	ldr	r3, [pc, #64]	; 3000b4ac <acoral_print+0x88>
3000b468:	e5933000 	ldr	r3, [r3]
3000b46c:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b470:	e59d300c 	ldr	r3, [sp, #12]
3000b474:	e3a01000 	mov	r1, #0
3000b478:	e58d1000 	str	r1, [sp]
3000b47c:	e1a00002 	mov	r0, r2
3000b480:	e59f1020 	ldr	r1, [pc, #32]	; 3000b4a8 <acoral_print+0x84>
3000b484:	e1a02003 	mov	r2, r3
3000b488:	e3a03000 	mov	r3, #0
3000b48c:	eb000880 	bl	3000d694 <acoral_dev_write>
3000b490:	e1a03000 	mov	r3, r0
}
3000b494:	e1a00003 	mov	r0, r3
3000b498:	e28dd014 	add	sp, sp, #20
3000b49c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b4a0:	e28dd010 	add	sp, sp, #16
3000b4a4:	e12fff1e 	bx	lr
3000b4a8:	3000f480 	.word	0x3000f480
3000b4ac:	30010630 	.word	0x30010630

3000b4b0 <acoral_prints>:

acoral_32 acoral_prints(const acoral_char *str)
{
3000b4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b4b4:	e24dd01c 	sub	sp, sp, #28
3000b4b8:	e58d000c 	str	r0, [sp, #12]
	acoral_32 printed_len;
	printed_len=acoral_str_len(str);  
3000b4bc:	e59d000c 	ldr	r0, [sp, #12]
3000b4c0:	eb000115 	bl	3000b91c <acoral_str_len>
3000b4c4:	e1a03000 	mov	r3, r0
3000b4c8:	e58d3014 	str	r3, [sp, #20]
	return acoral_dev_write(acoral_cur_thread->console_id,(void *)str,printed_len,0,0);
3000b4cc:	e59f3038 	ldr	r3, [pc, #56]	; 3000b50c <acoral_prints+0x5c>
3000b4d0:	e5933000 	ldr	r3, [r3]
3000b4d4:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b4d8:	e59d3014 	ldr	r3, [sp, #20]
3000b4dc:	e3a01000 	mov	r1, #0
3000b4e0:	e58d1000 	str	r1, [sp]
3000b4e4:	e1a00002 	mov	r0, r2
3000b4e8:	e59d100c 	ldr	r1, [sp, #12]
3000b4ec:	e1a02003 	mov	r2, r3
3000b4f0:	e3a03000 	mov	r3, #0
3000b4f4:	eb000866 	bl	3000d694 <acoral_dev_write>
3000b4f8:	e1a03000 	mov	r3, r0
}
3000b4fc:	e1a00003 	mov	r0, r3
3000b500:	e28dd01c 	add	sp, sp, #28
3000b504:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b508:	e12fff1e 	bx	lr
3000b50c:	30010630 	.word	0x30010630

3000b510 <acoral_getchar>:

acoral_char acoral_getchar(){
3000b510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b514:	e24dd014 	sub	sp, sp, #20
	acoral_char c;
	acoral_dev_read(acoral_cur_thread->console_id,&c,1,0,0);
3000b518:	e59f3038 	ldr	r3, [pc, #56]	; 3000b558 <acoral_getchar+0x48>
3000b51c:	e5933000 	ldr	r3, [r3]
3000b520:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b524:	e28d300f 	add	r3, sp, #15
3000b528:	e3a01000 	mov	r1, #0
3000b52c:	e58d1000 	str	r1, [sp]
3000b530:	e1a00002 	mov	r0, r2
3000b534:	e1a01003 	mov	r1, r3
3000b538:	e3a02001 	mov	r2, #1
3000b53c:	e3a03000 	mov	r3, #0
3000b540:	eb000879 	bl	3000d72c <acoral_dev_read>
	return c;
3000b544:	e5dd300f 	ldrb	r3, [sp, #15]
}
3000b548:	e1a00003 	mov	r0, r3
3000b54c:	e28dd014 	add	sp, sp, #20
3000b550:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b554:	e12fff1e 	bx	lr
3000b558:	30010630 	.word	0x30010630

3000b55c <acoral_putchar>:

acoral_char acoral_putchar(acoral_char c){
3000b55c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b560:	e24dd014 	sub	sp, sp, #20
3000b564:	e1a03000 	mov	r3, r0
3000b568:	e5cd300f 	strb	r3, [sp, #15]
	acoral_dev_write(acoral_cur_thread->console_id,&c,1,0,0);
3000b56c:	e59f3038 	ldr	r3, [pc, #56]	; 3000b5ac <acoral_putchar+0x50>
3000b570:	e5933000 	ldr	r3, [r3]
3000b574:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b578:	e28d300f 	add	r3, sp, #15
3000b57c:	e3a01000 	mov	r1, #0
3000b580:	e58d1000 	str	r1, [sp]
3000b584:	e1a00002 	mov	r0, r2
3000b588:	e1a01003 	mov	r1, r3
3000b58c:	e3a02001 	mov	r2, #1
3000b590:	e3a03000 	mov	r3, #0
3000b594:	eb00083e 	bl	3000d694 <acoral_dev_write>
	return c;
3000b598:	e5dd300f 	ldrb	r3, [sp, #15]
}
3000b59c:	e1a00003 	mov	r0, r3
3000b5a0:	e28dd014 	add	sp, sp, #20
3000b5a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b5a8:	e12fff1e 	bx	lr
3000b5ac:	30010630 	.word	0x30010630

3000b5b0 <acoral_debug>:

static acoral_id console_id=ACORAL_DEV_ERR_ID;
//======================
acoral_32 acoral_debug(const acoral_char *fmt, ...)
{
3000b5b0:	e92d000f 	push	{r0, r1, r2, r3}
3000b5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b5b8:	e24dd014 	sub	sp, sp, #20
	va_list args;
	acoral_32 printed_len;
	static acoral_char print_buf[1024];
	va_start(args, fmt);
3000b5bc:	e28d3018 	add	r3, sp, #24
3000b5c0:	e2833004 	add	r3, r3, #4
3000b5c4:	e58d3008 	str	r3, [sp, #8]
	printed_len =vsnprintf(print_buf, sizeof(print_buf), fmt, args);
3000b5c8:	e59d3018 	ldr	r3, [sp, #24]
3000b5cc:	e59f0094 	ldr	r0, [pc, #148]	; 3000b668 <acoral_debug+0xb8>
3000b5d0:	e3a01b01 	mov	r1, #1024	; 0x400
3000b5d4:	e1a02003 	mov	r2, r3
3000b5d8:	e59d3008 	ldr	r3, [sp, #8]
3000b5dc:	ebfffcaa 	bl	3000a88c <vsnprintf>
3000b5e0:	e1a03000 	mov	r3, r0
3000b5e4:	e58d300c 	str	r3, [sp, #12]
	va_end(args);
3000b5e8:	e3a03000 	mov	r3, #0
3000b5ec:	e58d3008 	str	r3, [sp, #8]
	if(console_id==ACORAL_DEV_ERR_ID){
3000b5f0:	e59f3074 	ldr	r3, [pc, #116]	; 3000b66c <acoral_debug+0xbc>
3000b5f4:	e5933000 	ldr	r3, [r3]
3000b5f8:	e3730001 	cmn	r3, #1
3000b5fc:	1a000009 	bne	3000b628 <acoral_debug+0x78>
		console_id=acoral_dev_open("console");
3000b600:	e59f0068 	ldr	r0, [pc, #104]	; 3000b670 <acoral_debug+0xc0>
3000b604:	eb0007fd 	bl	3000d600 <acoral_dev_open>
3000b608:	e1a02000 	mov	r2, r0
3000b60c:	e59f3058 	ldr	r3, [pc, #88]	; 3000b66c <acoral_debug+0xbc>
3000b610:	e5832000 	str	r2, [r3]
		if(console_id==ACORAL_DEV_ERR_ID)
3000b614:	e59f3050 	ldr	r3, [pc, #80]	; 3000b66c <acoral_debug+0xbc>
3000b618:	e5933000 	ldr	r3, [r3]
3000b61c:	e3730001 	cmn	r3, #1
3000b620:	1a000000 	bne	3000b628 <acoral_debug+0x78>
3000b624:	ea00000a 	b	3000b654 <acoral_debug+0xa4>
			return;
	}
	return acoral_dev_write(console_id,(void *)print_buf,printed_len,0,0);
3000b628:	e59f303c 	ldr	r3, [pc, #60]	; 3000b66c <acoral_debug+0xbc>
3000b62c:	e5932000 	ldr	r2, [r3]
3000b630:	e59d300c 	ldr	r3, [sp, #12]
3000b634:	e3a01000 	mov	r1, #0
3000b638:	e58d1000 	str	r1, [sp]
3000b63c:	e1a00002 	mov	r0, r2
3000b640:	e59f1020 	ldr	r1, [pc, #32]	; 3000b668 <acoral_debug+0xb8>
3000b644:	e1a02003 	mov	r2, r3
3000b648:	e3a03000 	mov	r3, #0
3000b64c:	eb000810 	bl	3000d694 <acoral_dev_write>
3000b650:	e1a03000 	mov	r3, r0
}
3000b654:	e1a00003 	mov	r0, r3
3000b658:	e28dd014 	add	sp, sp, #20
3000b65c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b660:	e28dd010 	add	sp, sp, #16
3000b664:	e12fff1e 	bx	lr
3000b668:	3000f080 	.word	0x3000f080
3000b66c:	3000ecb0 	.word	0x3000ecb0
3000b670:	3000ea1c 	.word	0x3000ea1c

3000b674 <acoral_debugs>:

acoral_32 acoral_debugs(const acoral_char *str)
{
3000b674:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b678:	e24dd01c 	sub	sp, sp, #28
3000b67c:	e58d000c 	str	r0, [sp, #12]
	acoral_32 printed_len;
	printed_len=acoral_str_len(str);  
3000b680:	e59d000c 	ldr	r0, [sp, #12]
3000b684:	eb0000a4 	bl	3000b91c <acoral_str_len>
3000b688:	e1a03000 	mov	r3, r0
3000b68c:	e58d3014 	str	r3, [sp, #20]
	if(console_id==ACORAL_DEV_ERR_ID){
3000b690:	e59f306c 	ldr	r3, [pc, #108]	; 3000b704 <acoral_debugs+0x90>
3000b694:	e5933000 	ldr	r3, [r3]
3000b698:	e3730001 	cmn	r3, #1
3000b69c:	1a000009 	bne	3000b6c8 <acoral_debugs+0x54>
		console_id=acoral_dev_open("console");
3000b6a0:	e59f0060 	ldr	r0, [pc, #96]	; 3000b708 <acoral_debugs+0x94>
3000b6a4:	eb0007d5 	bl	3000d600 <acoral_dev_open>
3000b6a8:	e1a02000 	mov	r2, r0
3000b6ac:	e59f3050 	ldr	r3, [pc, #80]	; 3000b704 <acoral_debugs+0x90>
3000b6b0:	e5832000 	str	r2, [r3]
		if(console_id==ACORAL_DEV_ERR_ID)
3000b6b4:	e59f3048 	ldr	r3, [pc, #72]	; 3000b704 <acoral_debugs+0x90>
3000b6b8:	e5933000 	ldr	r3, [r3]
3000b6bc:	e3730001 	cmn	r3, #1
3000b6c0:	1a000000 	bne	3000b6c8 <acoral_debugs+0x54>
3000b6c4:	ea00000a 	b	3000b6f4 <acoral_debugs+0x80>
			return;
	}
	return acoral_dev_write(console_id,(void *)str,printed_len,0,0);
3000b6c8:	e59f3034 	ldr	r3, [pc, #52]	; 3000b704 <acoral_debugs+0x90>
3000b6cc:	e5932000 	ldr	r2, [r3]
3000b6d0:	e59d3014 	ldr	r3, [sp, #20]
3000b6d4:	e3a01000 	mov	r1, #0
3000b6d8:	e58d1000 	str	r1, [sp]
3000b6dc:	e1a00002 	mov	r0, r2
3000b6e0:	e59d100c 	ldr	r1, [sp, #12]
3000b6e4:	e1a02003 	mov	r2, r3
3000b6e8:	e3a03000 	mov	r3, #0
3000b6ec:	eb0007e8 	bl	3000d694 <acoral_dev_write>
3000b6f0:	e1a03000 	mov	r3, r0
}
3000b6f4:	e1a00003 	mov	r0, r3
3000b6f8:	e28dd01c 	add	sp, sp, #28
3000b6fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b700:	e12fff1e 	bx	lr
3000b704:	3000ecb0 	.word	0x3000ecb0
3000b708:	3000ea1c 	.word	0x3000ea1c

3000b70c <acoral_tolower>:
#include<string.h>

acoral_u8  acoral_tolower(acoral_u8 c){
3000b70c:	e24dd008 	sub	sp, sp, #8
3000b710:	e1a03000 	mov	r3, r0
3000b714:	e5cd3007 	strb	r3, [sp, #7]
      if(IS_LOWER(c))
3000b718:	e5dd3007 	ldrb	r3, [sp, #7]
3000b71c:	e3530060 	cmp	r3, #96	; 0x60
3000b720:	9a000004 	bls	3000b738 <acoral_tolower+0x2c>
3000b724:	e5dd3007 	ldrb	r3, [sp, #7]
3000b728:	e353007a 	cmp	r3, #122	; 0x7a
3000b72c:	8a000001 	bhi	3000b738 <acoral_tolower+0x2c>
        return c;
3000b730:	e5dd3007 	ldrb	r3, [sp, #7]
3000b734:	ea00000a 	b	3000b764 <acoral_tolower+0x58>
      else if(IS_UPPER(c))
3000b738:	e5dd3007 	ldrb	r3, [sp, #7]
3000b73c:	e3530040 	cmp	r3, #64	; 0x40
3000b740:	9a000006 	bls	3000b760 <acoral_tolower+0x54>
3000b744:	e5dd3007 	ldrb	r3, [sp, #7]
3000b748:	e353005a 	cmp	r3, #90	; 0x5a
3000b74c:	8a000003 	bhi	3000b760 <acoral_tolower+0x54>
        return (acoral_u8)(c+32);
3000b750:	e5dd3007 	ldrb	r3, [sp, #7]
3000b754:	e2833020 	add	r3, r3, #32
3000b758:	e20330ff 	and	r3, r3, #255	; 0xff
3000b75c:	ea000000 	b	3000b764 <acoral_tolower+0x58>
      else
        return FALSE; 
3000b760:	e3a03000 	mov	r3, #0
            
}
3000b764:	e1a00003 	mov	r0, r3
3000b768:	e28dd008 	add	sp, sp, #8
3000b76c:	e12fff1e 	bx	lr

3000b770 <acoral_toupper>:
acoral_u8  acoral_toupper(acoral_u8 c){
3000b770:	e24dd008 	sub	sp, sp, #8
3000b774:	e1a03000 	mov	r3, r0
3000b778:	e5cd3007 	strb	r3, [sp, #7]
     if(IS_LOWER(c))
3000b77c:	e5dd3007 	ldrb	r3, [sp, #7]
3000b780:	e3530060 	cmp	r3, #96	; 0x60
3000b784:	9a000006 	bls	3000b7a4 <acoral_toupper+0x34>
3000b788:	e5dd3007 	ldrb	r3, [sp, #7]
3000b78c:	e353007a 	cmp	r3, #122	; 0x7a
3000b790:	8a000003 	bhi	3000b7a4 <acoral_toupper+0x34>
        return (acoral_u8)(c-32);
3000b794:	e5dd3007 	ldrb	r3, [sp, #7]
3000b798:	e2433020 	sub	r3, r3, #32
3000b79c:	e20330ff 	and	r3, r3, #255	; 0xff
3000b7a0:	ea000008 	b	3000b7c8 <acoral_toupper+0x58>
     else if(IS_UPPER(c))
3000b7a4:	e5dd3007 	ldrb	r3, [sp, #7]
3000b7a8:	e3530040 	cmp	r3, #64	; 0x40
3000b7ac:	9a000004 	bls	3000b7c4 <acoral_toupper+0x54>
3000b7b0:	e5dd3007 	ldrb	r3, [sp, #7]
3000b7b4:	e353005a 	cmp	r3, #90	; 0x5a
3000b7b8:	8a000001 	bhi	3000b7c4 <acoral_toupper+0x54>
        return c;
3000b7bc:	e5dd3007 	ldrb	r3, [sp, #7]
3000b7c0:	ea000000 	b	3000b7c8 <acoral_toupper+0x58>
     else
        return FALSE; 
3000b7c4:	e3a03000 	mov	r3, #0
}
3000b7c8:	e1a00003 	mov	r0, r3
3000b7cc:	e28dd008 	add	sp, sp, #8
3000b7d0:	e12fff1e 	bx	lr

3000b7d4 <acoral_str_upr>:

acoral_char *acoral_str_upr(acoral_char *str){
3000b7d4:	e24dd010 	sub	sp, sp, #16
3000b7d8:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 i=0;
3000b7dc:	e3a03000 	mov	r3, #0
3000b7e0:	e58d3008 	str	r3, [sp, #8]
	acoral_char *s=str;
3000b7e4:	e59d3004 	ldr	r3, [sp, #4]
3000b7e8:	e58d300c 	str	r3, [sp, #12]
	while(s[i]!='\0'){
3000b7ec:	ea000018 	b	3000b854 <acoral_str_upr+0x80>
		if(s[i]>='a'&&s[i]<='z')
3000b7f0:	e59d200c 	ldr	r2, [sp, #12]
3000b7f4:	e59d3008 	ldr	r3, [sp, #8]
3000b7f8:	e0823003 	add	r3, r2, r3
3000b7fc:	e5d33000 	ldrb	r3, [r3]
3000b800:	e3530060 	cmp	r3, #96	; 0x60
3000b804:	9a00000f 	bls	3000b848 <acoral_str_upr+0x74>
3000b808:	e59d200c 	ldr	r2, [sp, #12]
3000b80c:	e59d3008 	ldr	r3, [sp, #8]
3000b810:	e0823003 	add	r3, r2, r3
3000b814:	e5d33000 	ldrb	r3, [r3]
3000b818:	e353007a 	cmp	r3, #122	; 0x7a
3000b81c:	8a000009 	bhi	3000b848 <acoral_str_upr+0x74>
			s[i]-=32;
3000b820:	e59d200c 	ldr	r2, [sp, #12]
3000b824:	e59d3008 	ldr	r3, [sp, #8]
3000b828:	e0823003 	add	r3, r2, r3
3000b82c:	e59d100c 	ldr	r1, [sp, #12]
3000b830:	e59d2008 	ldr	r2, [sp, #8]
3000b834:	e0812002 	add	r2, r1, r2
3000b838:	e5d22000 	ldrb	r2, [r2]
3000b83c:	e2422020 	sub	r2, r2, #32
3000b840:	e20220ff 	and	r2, r2, #255	; 0xff
3000b844:	e5c32000 	strb	r2, [r3]
		i++;
3000b848:	e59d3008 	ldr	r3, [sp, #8]
3000b84c:	e2833001 	add	r3, r3, #1
3000b850:	e58d3008 	str	r3, [sp, #8]
}

acoral_char *acoral_str_upr(acoral_char *str){
	acoral_u32 i=0;
	acoral_char *s=str;
	while(s[i]!='\0'){
3000b854:	e59d200c 	ldr	r2, [sp, #12]
3000b858:	e59d3008 	ldr	r3, [sp, #8]
3000b85c:	e0823003 	add	r3, r2, r3
3000b860:	e5d33000 	ldrb	r3, [r3]
3000b864:	e3530000 	cmp	r3, #0
3000b868:	1affffe0 	bne	3000b7f0 <acoral_str_upr+0x1c>
		if(s[i]>='a'&&s[i]<='z')
			s[i]-=32;
		i++;
	} 
	return str;
3000b86c:	e59d3004 	ldr	r3, [sp, #4]
}
3000b870:	e1a00003 	mov	r0, r3
3000b874:	e28dd010 	add	sp, sp, #16
3000b878:	e12fff1e 	bx	lr

3000b87c <acoral_str_lwr>:

acoral_char *acoral_str_lwr(acoral_char *s){
3000b87c:	e24dd010 	sub	sp, sp, #16
3000b880:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 i=0;
3000b884:	e3a03000 	mov	r3, #0
3000b888:	e58d300c 	str	r3, [sp, #12]
	while(s[i]!='\0'){
3000b88c:	ea000018 	b	3000b8f4 <acoral_str_lwr+0x78>
		if(s[i]>='A'&&s[i]<='Z')
3000b890:	e59d2004 	ldr	r2, [sp, #4]
3000b894:	e59d300c 	ldr	r3, [sp, #12]
3000b898:	e0823003 	add	r3, r2, r3
3000b89c:	e5d33000 	ldrb	r3, [r3]
3000b8a0:	e3530040 	cmp	r3, #64	; 0x40
3000b8a4:	9a00000f 	bls	3000b8e8 <acoral_str_lwr+0x6c>
3000b8a8:	e59d2004 	ldr	r2, [sp, #4]
3000b8ac:	e59d300c 	ldr	r3, [sp, #12]
3000b8b0:	e0823003 	add	r3, r2, r3
3000b8b4:	e5d33000 	ldrb	r3, [r3]
3000b8b8:	e353005a 	cmp	r3, #90	; 0x5a
3000b8bc:	8a000009 	bhi	3000b8e8 <acoral_str_lwr+0x6c>
			s[i]+=32;
3000b8c0:	e59d2004 	ldr	r2, [sp, #4]
3000b8c4:	e59d300c 	ldr	r3, [sp, #12]
3000b8c8:	e0823003 	add	r3, r2, r3
3000b8cc:	e59d1004 	ldr	r1, [sp, #4]
3000b8d0:	e59d200c 	ldr	r2, [sp, #12]
3000b8d4:	e0812002 	add	r2, r1, r2
3000b8d8:	e5d22000 	ldrb	r2, [r2]
3000b8dc:	e2822020 	add	r2, r2, #32
3000b8e0:	e20220ff 	and	r2, r2, #255	; 0xff
3000b8e4:	e5c32000 	strb	r2, [r3]
		i++;
3000b8e8:	e59d300c 	ldr	r3, [sp, #12]
3000b8ec:	e2833001 	add	r3, r3, #1
3000b8f0:	e58d300c 	str	r3, [sp, #12]
	return str;
}

acoral_char *acoral_str_lwr(acoral_char *s){
	acoral_u32 i=0;
	while(s[i]!='\0'){
3000b8f4:	e59d2004 	ldr	r2, [sp, #4]
3000b8f8:	e59d300c 	ldr	r3, [sp, #12]
3000b8fc:	e0823003 	add	r3, r2, r3
3000b900:	e5d33000 	ldrb	r3, [r3]
3000b904:	e3530000 	cmp	r3, #0
3000b908:	1affffe0 	bne	3000b890 <acoral_str_lwr+0x14>
		if(s[i]>='A'&&s[i]<='Z')
			s[i]+=32;
		i++;
	} 
	return s;
3000b90c:	e59d3004 	ldr	r3, [sp, #4]
}
3000b910:	e1a00003 	mov	r0, r3
3000b914:	e28dd010 	add	sp, sp, #16
3000b918:	e12fff1e 	bx	lr

3000b91c <acoral_str_len>:

acoral_u32 acoral_str_len(const acoral_char *str)  
{  
3000b91c:	e24dd010 	sub	sp, sp, #16
3000b920:	e58d0004 	str	r0, [sp, #4]
  acoral_u32  i=0;  
3000b924:	e3a03000 	mov	r3, #0
3000b928:	e58d3008 	str	r3, [sp, #8]
  const acoral_char *p=str;
3000b92c:	e59d3004 	ldr	r3, [sp, #4]
3000b930:	e58d300c 	str	r3, [sp, #12]
  while(*p++)  
3000b934:	ea000002 	b	3000b944 <acoral_str_len+0x28>
      i++;  
3000b938:	e59d3008 	ldr	r3, [sp, #8]
3000b93c:	e2833001 	add	r3, r3, #1
3000b940:	e58d3008 	str	r3, [sp, #8]

acoral_u32 acoral_str_len(const acoral_char *str)  
{  
  acoral_u32  i=0;  
  const acoral_char *p=str;
  while(*p++)  
3000b944:	e59d300c 	ldr	r3, [sp, #12]
3000b948:	e5d33000 	ldrb	r3, [r3]
3000b94c:	e3530000 	cmp	r3, #0
3000b950:	03a03000 	moveq	r3, #0
3000b954:	13a03001 	movne	r3, #1
3000b958:	e20330ff 	and	r3, r3, #255	; 0xff
3000b95c:	e59d200c 	ldr	r2, [sp, #12]
3000b960:	e2822001 	add	r2, r2, #1
3000b964:	e58d200c 	str	r2, [sp, #12]
3000b968:	e3530000 	cmp	r3, #0
3000b96c:	1afffff1 	bne	3000b938 <acoral_str_len+0x1c>
      i++;  
  return  i;  
3000b970:	e59d3008 	ldr	r3, [sp, #8]
}
3000b974:	e1a00003 	mov	r0, r3
3000b978:	e28dd010 	add	sp, sp, #16
3000b97c:	e12fff1e 	bx	lr

3000b980 <acoral_str_cpy>:

acoral_char *acoral_str_cpy(acoral_char *to, const acoral_char *from)
{
3000b980:	e24dd010 	sub	sp, sp, #16
3000b984:	e58d0004 	str	r0, [sp, #4]
3000b988:	e58d1000 	str	r1, [sp]
    acoral_char *rev = to;
3000b98c:	e59d3004 	ldr	r3, [sp, #4]
3000b990:	e58d300c 	str	r3, [sp, #12]
    while(*to++ = *from++);
3000b994:	e59d3000 	ldr	r3, [sp]
3000b998:	e5d32000 	ldrb	r2, [r3]
3000b99c:	e59d3004 	ldr	r3, [sp, #4]
3000b9a0:	e5c32000 	strb	r2, [r3]
3000b9a4:	e59d3004 	ldr	r3, [sp, #4]
3000b9a8:	e5d33000 	ldrb	r3, [r3]
3000b9ac:	e3530000 	cmp	r3, #0
3000b9b0:	03a03000 	moveq	r3, #0
3000b9b4:	13a03001 	movne	r3, #1
3000b9b8:	e20330ff 	and	r3, r3, #255	; 0xff
3000b9bc:	e59d2004 	ldr	r2, [sp, #4]
3000b9c0:	e2822001 	add	r2, r2, #1
3000b9c4:	e58d2004 	str	r2, [sp, #4]
3000b9c8:	e59d2000 	ldr	r2, [sp]
3000b9cc:	e2822001 	add	r2, r2, #1
3000b9d0:	e58d2000 	str	r2, [sp]
3000b9d4:	e3530000 	cmp	r3, #0
3000b9d8:	1affffed 	bne	3000b994 <acoral_str_cpy+0x14>
    return rev;
3000b9dc:	e59d300c 	ldr	r3, [sp, #12]
}
3000b9e0:	e1a00003 	mov	r0, r3
3000b9e4:	e28dd010 	add	sp, sp, #16
3000b9e8:	e12fff1e 	bx	lr

3000b9ec <acoral_str_cmp>:

acoral_u32 acoral_str_cmp(const acoral_char * des,const  acoral_char * src)
{
3000b9ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b9f0:	e24dd01c 	sub	sp, sp, #28
3000b9f4:	e58d0004 	str	r0, [sp, #4]
3000b9f8:	e58d1000 	str	r1, [sp]
    acoral_u32 c;
    acoral_u32 len1;
    acoral_u32 len2;
    if(des == NULL || src == NULL)
3000b9fc:	e59d3004 	ldr	r3, [sp, #4]
3000ba00:	e3530000 	cmp	r3, #0
3000ba04:	0a000002 	beq	3000ba14 <acoral_str_cmp+0x28>
3000ba08:	e59d3000 	ldr	r3, [sp]
3000ba0c:	e3530000 	cmp	r3, #0
3000ba10:	1a000001 	bne	3000ba1c <acoral_str_cmp+0x30>
      	return -1;	
3000ba14:	e3e03000 	mvn	r3, #0
3000ba18:	ea00002b 	b	3000bacc <acoral_str_cmp+0xe0>
    len1 = acoral_str_len(des);
3000ba1c:	e59d0004 	ldr	r0, [sp, #4]
3000ba20:	ebffffbd 	bl	3000b91c <acoral_str_len>
3000ba24:	e1a03000 	mov	r3, r0
3000ba28:	e58d3010 	str	r3, [sp, #16]
    len2 = acoral_str_len(src);
3000ba2c:	e59d0000 	ldr	r0, [sp]
3000ba30:	ebffffb9 	bl	3000b91c <acoral_str_len>
3000ba34:	e1a03000 	mov	r3, r0
3000ba38:	e58d3014 	str	r3, [sp, #20]
    if(len1 != len2)
3000ba3c:	e59d2010 	ldr	r2, [sp, #16]
3000ba40:	e59d3014 	ldr	r3, [sp, #20]
3000ba44:	e1520003 	cmp	r2, r3
3000ba48:	0a000019 	beq	3000bab4 <acoral_str_cmp+0xc8>
    {
        return len1-len2;
3000ba4c:	e59d2010 	ldr	r2, [sp, #16]
3000ba50:	e59d3014 	ldr	r3, [sp, #20]
3000ba54:	e0633002 	rsb	r3, r3, r2
3000ba58:	ea00001b 	b	3000bacc <acoral_str_cmp+0xe0>
    }
    while(*des != '\0')
    {
        if((c=(*des++ - * src++)) != 0)
3000ba5c:	e59d3004 	ldr	r3, [sp, #4]
3000ba60:	e5d33000 	ldrb	r3, [r3]
3000ba64:	e1a02003 	mov	r2, r3
3000ba68:	e59d3000 	ldr	r3, [sp]
3000ba6c:	e5d33000 	ldrb	r3, [r3]
3000ba70:	e0633002 	rsb	r3, r3, r2
3000ba74:	e58d300c 	str	r3, [sp, #12]
3000ba78:	e59d300c 	ldr	r3, [sp, #12]
3000ba7c:	e3530000 	cmp	r3, #0
3000ba80:	03a03000 	moveq	r3, #0
3000ba84:	13a03001 	movne	r3, #1
3000ba88:	e20330ff 	and	r3, r3, #255	; 0xff
3000ba8c:	e59d2004 	ldr	r2, [sp, #4]
3000ba90:	e2822001 	add	r2, r2, #1
3000ba94:	e58d2004 	str	r2, [sp, #4]
3000ba98:	e59d2000 	ldr	r2, [sp]
3000ba9c:	e2822001 	add	r2, r2, #1
3000baa0:	e58d2000 	str	r2, [sp]
3000baa4:	e3530000 	cmp	r3, #0
3000baa8:	0a000002 	beq	3000bab8 <acoral_str_cmp+0xcc>
        {
            return c;
3000baac:	e59d300c 	ldr	r3, [sp, #12]
3000bab0:	ea000005 	b	3000bacc <acoral_str_cmp+0xe0>
    len2 = acoral_str_len(src);
    if(len1 != len2)
    {
        return len1-len2;
    }
    while(*des != '\0')
3000bab4:	e1a00000 	nop			; (mov r0, r0)
3000bab8:	e59d3004 	ldr	r3, [sp, #4]
3000babc:	e5d33000 	ldrb	r3, [r3]
3000bac0:	e3530000 	cmp	r3, #0
3000bac4:	1affffe4 	bne	3000ba5c <acoral_str_cmp+0x70>
        if((c=(*des++ - * src++)) != 0)
        {
            return c;
        }
    }
    return c;
3000bac8:	e59d300c 	ldr	r3, [sp, #12]
}
3000bacc:	e1a00003 	mov	r0, r3
3000bad0:	e28dd01c 	add	sp, sp, #28
3000bad4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000bad8:	e12fff1e 	bx	lr

3000badc <acoral_str_nicmp>:
 * @s1: One string
 * @s2: The other string
 * @len: the maximum number of characters to compare
 */
acoral_32 acoral_str_nicmp(const acoral_char *s1, const acoral_char *s2, acoral_u32 len)
{
3000badc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000bae0:	e24dd01c 	sub	sp, sp, #28
3000bae4:	e58d000c 	str	r0, [sp, #12]
3000bae8:	e58d1008 	str	r1, [sp, #8]
3000baec:	e58d2004 	str	r2, [sp, #4]
	/* Yes, Virginia, it had better be unsigned */
	acoral_u8 c1, c2;

	c1 = 0;	c2 = 0;
3000baf0:	e3a03000 	mov	r3, #0
3000baf4:	e5cd3016 	strb	r3, [sp, #22]
3000baf8:	e3a03000 	mov	r3, #0
3000bafc:	e5cd3017 	strb	r3, [sp, #23]
	if (len) {
3000bb00:	e59d3004 	ldr	r3, [sp, #4]
3000bb04:	e3530000 	cmp	r3, #0
3000bb08:	0a000031 	beq	3000bbd4 <acoral_str_nicmp+0xf8>
		do {
			c1 = *s1; c2 = *s2;
3000bb0c:	e59d300c 	ldr	r3, [sp, #12]
3000bb10:	e5d33000 	ldrb	r3, [r3]
3000bb14:	e5cd3016 	strb	r3, [sp, #22]
3000bb18:	e59d3008 	ldr	r3, [sp, #8]
3000bb1c:	e5d33000 	ldrb	r3, [r3]
3000bb20:	e5cd3017 	strb	r3, [sp, #23]
			s1++; s2++;
3000bb24:	e59d300c 	ldr	r3, [sp, #12]
3000bb28:	e2833001 	add	r3, r3, #1
3000bb2c:	e58d300c 	str	r3, [sp, #12]
3000bb30:	e59d3008 	ldr	r3, [sp, #8]
3000bb34:	e2833001 	add	r3, r3, #1
3000bb38:	e58d3008 	str	r3, [sp, #8]
			if (!c1)
3000bb3c:	e5dd3016 	ldrb	r3, [sp, #22]
3000bb40:	e3530000 	cmp	r3, #0
3000bb44:	0a00001d 	beq	3000bbc0 <acoral_str_nicmp+0xe4>
				break;
			if (!c2)
3000bb48:	e5dd3017 	ldrb	r3, [sp, #23]
3000bb4c:	e3530000 	cmp	r3, #0
3000bb50:	0a00001c 	beq	3000bbc8 <acoral_str_nicmp+0xec>
				break;
			if (c1 == c2)
3000bb54:	e5dd2016 	ldrb	r2, [sp, #22]
3000bb58:	e5dd3017 	ldrb	r3, [sp, #23]
3000bb5c:	e1520003 	cmp	r2, r3
3000bb60:	0a00000e 	beq	3000bba0 <acoral_str_nicmp+0xc4>
				continue;
			c1 = acoral_tolower(c1);
3000bb64:	e5dd3016 	ldrb	r3, [sp, #22]
3000bb68:	e1a00003 	mov	r0, r3
3000bb6c:	ebfffee6 	bl	3000b70c <acoral_tolower>
3000bb70:	e1a03000 	mov	r3, r0
3000bb74:	e5cd3016 	strb	r3, [sp, #22]
			c2 = acoral_tolower(c2);
3000bb78:	e5dd3017 	ldrb	r3, [sp, #23]
3000bb7c:	e1a00003 	mov	r0, r3
3000bb80:	ebfffee1 	bl	3000b70c <acoral_tolower>
3000bb84:	e1a03000 	mov	r3, r0
3000bb88:	e5cd3017 	strb	r3, [sp, #23]
			if (c1 != c2)
3000bb8c:	e5dd2016 	ldrb	r2, [sp, #22]
3000bb90:	e5dd3017 	ldrb	r3, [sp, #23]
3000bb94:	e1520003 	cmp	r2, r3
3000bb98:	1a00000c 	bne	3000bbd0 <acoral_str_nicmp+0xf4>
3000bb9c:	ea000000 	b	3000bba4 <acoral_str_nicmp+0xc8>
			if (!c1)
				break;
			if (!c2)
				break;
			if (c1 == c2)
				continue;
3000bba0:	e1a00000 	nop			; (mov r0, r0)
			c1 = acoral_tolower(c1);
			c2 = acoral_tolower(c2);
			if (c1 != c2)
				break;
		} while (--len);
3000bba4:	e59d3004 	ldr	r3, [sp, #4]
3000bba8:	e2433001 	sub	r3, r3, #1
3000bbac:	e58d3004 	str	r3, [sp, #4]
3000bbb0:	e59d3004 	ldr	r3, [sp, #4]
3000bbb4:	e3530000 	cmp	r3, #0
3000bbb8:	1affffd3 	bne	3000bb0c <acoral_str_nicmp+0x30>
3000bbbc:	ea000004 	b	3000bbd4 <acoral_str_nicmp+0xf8>
	if (len) {
		do {
			c1 = *s1; c2 = *s2;
			s1++; s2++;
			if (!c1)
				break;
3000bbc0:	e1a00000 	nop			; (mov r0, r0)
3000bbc4:	ea000002 	b	3000bbd4 <acoral_str_nicmp+0xf8>
			if (!c2)
				break;
3000bbc8:	e1a00000 	nop			; (mov r0, r0)
3000bbcc:	ea000000 	b	3000bbd4 <acoral_str_nicmp+0xf8>
			if (c1 == c2)
				continue;
			c1 = acoral_tolower(c1);
			c2 = acoral_tolower(c2);
			if (c1 != c2)
				break;
3000bbd0:	e1a00000 	nop			; (mov r0, r0)
		} while (--len);
	}
	return (acoral_32)c1 - (acoral_32)c2;
3000bbd4:	e5dd2016 	ldrb	r2, [sp, #22]
3000bbd8:	e5dd3017 	ldrb	r3, [sp, #23]
3000bbdc:	e0633002 	rsb	r3, r3, r2
}
3000bbe0:	e1a00003 	mov	r0, r3
3000bbe4:	e28dd01c 	add	sp, sp, #28
3000bbe8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000bbec:	e12fff1e 	bx	lr

3000bbf0 <acoral_str_ncpy>:
 *
 * The result is not %NUL-terminated if the source exceeds
 * @count bytes.
 */
acoral_char * acoral_str_ncpy(acoral_char * dest,const acoral_char *src,acoral_u32 count)
{
3000bbf0:	e24dd018 	sub	sp, sp, #24
3000bbf4:	e58d000c 	str	r0, [sp, #12]
3000bbf8:	e58d1008 	str	r1, [sp, #8]
3000bbfc:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp = dest;
3000bc00:	e59d300c 	ldr	r3, [sp, #12]
3000bc04:	e58d3014 	str	r3, [sp, #20]

	while (count) {
3000bc08:	ea000012 	b	3000bc58 <acoral_str_ncpy+0x68>
		if ((*tmp = *src) == '\0')
3000bc0c:	e59d3008 	ldr	r3, [sp, #8]
3000bc10:	e5d32000 	ldrb	r2, [r3]
3000bc14:	e59d3014 	ldr	r3, [sp, #20]
3000bc18:	e5c32000 	strb	r2, [r3]
3000bc1c:	e59d3014 	ldr	r3, [sp, #20]
3000bc20:	e5d33000 	ldrb	r3, [r3]
3000bc24:	e3530000 	cmp	r3, #0
3000bc28:	1a000001 	bne	3000bc34 <acoral_str_ncpy+0x44>
			return dest;
3000bc2c:	e59d300c 	ldr	r3, [sp, #12]
3000bc30:	ea00000f 	b	3000bc74 <acoral_str_ncpy+0x84>
		src++;
3000bc34:	e59d3008 	ldr	r3, [sp, #8]
3000bc38:	e2833001 	add	r3, r3, #1
3000bc3c:	e58d3008 	str	r3, [sp, #8]
		tmp++;
3000bc40:	e59d3014 	ldr	r3, [sp, #20]
3000bc44:	e2833001 	add	r3, r3, #1
3000bc48:	e58d3014 	str	r3, [sp, #20]
		count--;
3000bc4c:	e59d3004 	ldr	r3, [sp, #4]
3000bc50:	e2433001 	sub	r3, r3, #1
3000bc54:	e58d3004 	str	r3, [sp, #4]
 */
acoral_char * acoral_str_ncpy(acoral_char * dest,const acoral_char *src,acoral_u32 count)
{
	acoral_char *tmp = dest;

	while (count) {
3000bc58:	e59d3004 	ldr	r3, [sp, #4]
3000bc5c:	e3530000 	cmp	r3, #0
3000bc60:	1affffe9 	bne	3000bc0c <acoral_str_ncpy+0x1c>
			return dest;
		src++;
		tmp++;
		count--;
	}
	*tmp = '\0';
3000bc64:	e59d3014 	ldr	r3, [sp, #20]
3000bc68:	e3a02000 	mov	r2, #0
3000bc6c:	e5c32000 	strb	r2, [r3]
	return dest;
3000bc70:	e59d300c 	ldr	r3, [sp, #12]
}
3000bc74:	e1a00003 	mov	r0, r3
3000bc78:	e28dd018 	add	sp, sp, #24
3000bc7c:	e12fff1e 	bx	lr

3000bc80 <acoral_str_lcpy>:
 * NUL-terminated string that fits in the buffer (unless,
 * of course, the buffer size is zero). It does not pad
 * out the result like acoral_str_ncpy() does.
 */
acoral_u32 acoral_str_lcpy(acoral_char *dest, const acoral_char *src, acoral_u32 size)
{
3000bc80:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000bc84:	e24dd01c 	sub	sp, sp, #28
3000bc88:	e58d000c 	str	r0, [sp, #12]
3000bc8c:	e58d1008 	str	r1, [sp, #8]
3000bc90:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 ret = acoral_str_len(src);
3000bc94:	e59d0008 	ldr	r0, [sp, #8]
3000bc98:	ebffff1f 	bl	3000b91c <acoral_str_len>
3000bc9c:	e1a03000 	mov	r3, r0
3000bca0:	e58d3010 	str	r3, [sp, #16]

	if (size) {
3000bca4:	e59d3004 	ldr	r3, [sp, #4]
3000bca8:	e3530000 	cmp	r3, #0
3000bcac:	0a000011 	beq	3000bcf8 <acoral_str_lcpy+0x78>
		acoral_u32 len = (ret >= size) ? size-1 : ret;
3000bcb0:	e59d2010 	ldr	r2, [sp, #16]
3000bcb4:	e59d3004 	ldr	r3, [sp, #4]
3000bcb8:	e1520003 	cmp	r2, r3
3000bcbc:	3a000002 	bcc	3000bccc <acoral_str_lcpy+0x4c>
3000bcc0:	e59d3004 	ldr	r3, [sp, #4]
3000bcc4:	e2433001 	sub	r3, r3, #1
3000bcc8:	ea000000 	b	3000bcd0 <acoral_str_lcpy+0x50>
3000bccc:	e59d3010 	ldr	r3, [sp, #16]
3000bcd0:	e58d3014 	str	r3, [sp, #20]
		acoral_memcpy(dest, src, len);
3000bcd4:	e59d000c 	ldr	r0, [sp, #12]
3000bcd8:	e59d1008 	ldr	r1, [sp, #8]
3000bcdc:	e59d2014 	ldr	r2, [sp, #20]
3000bce0:	eb0001f6 	bl	3000c4c0 <acoral_memcpy>
		dest[len] = '\0';
3000bce4:	e59d200c 	ldr	r2, [sp, #12]
3000bce8:	e59d3014 	ldr	r3, [sp, #20]
3000bcec:	e0823003 	add	r3, r2, r3
3000bcf0:	e3a02000 	mov	r2, #0
3000bcf4:	e5c32000 	strb	r2, [r3]
	}
	return ret;
3000bcf8:	e59d3010 	ldr	r3, [sp, #16]
}
3000bcfc:	e1a00003 	mov	r0, r3
3000bd00:	e28dd01c 	add	sp, sp, #28
3000bd04:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000bd08:	e12fff1e 	bx	lr

3000bd0c <acoral_str_cat>:
 * acoral_str_cat - Append one %NUL-terminated string to another
 * @dest: The string to be appended to
 * @src: The string to append to it
 */
acoral_char * acoral_str_cat(acoral_char * dest, const acoral_char * src)
{
3000bd0c:	e24dd010 	sub	sp, sp, #16
3000bd10:	e58d0004 	str	r0, [sp, #4]
3000bd14:	e58d1000 	str	r1, [sp]
	acoral_char *tmp = dest;
3000bd18:	e59d3004 	ldr	r3, [sp, #4]
3000bd1c:	e58d300c 	str	r3, [sp, #12]

	while (*dest)
3000bd20:	ea000002 	b	3000bd30 <acoral_str_cat+0x24>
		dest++;
3000bd24:	e59d3004 	ldr	r3, [sp, #4]
3000bd28:	e2833001 	add	r3, r3, #1
3000bd2c:	e58d3004 	str	r3, [sp, #4]
 */
acoral_char * acoral_str_cat(acoral_char * dest, const acoral_char * src)
{
	acoral_char *tmp = dest;

	while (*dest)
3000bd30:	e59d3004 	ldr	r3, [sp, #4]
3000bd34:	e5d33000 	ldrb	r3, [r3]
3000bd38:	e3530000 	cmp	r3, #0
3000bd3c:	1afffff8 	bne	3000bd24 <acoral_str_cat+0x18>
		dest++;
	while ((*dest++ = *src++) != '\0')
3000bd40:	e59d3000 	ldr	r3, [sp]
3000bd44:	e5d32000 	ldrb	r2, [r3]
3000bd48:	e59d3004 	ldr	r3, [sp, #4]
3000bd4c:	e5c32000 	strb	r2, [r3]
3000bd50:	e59d3004 	ldr	r3, [sp, #4]
3000bd54:	e5d33000 	ldrb	r3, [r3]
3000bd58:	e3530000 	cmp	r3, #0
3000bd5c:	03a03000 	moveq	r3, #0
3000bd60:	13a03001 	movne	r3, #1
3000bd64:	e20330ff 	and	r3, r3, #255	; 0xff
3000bd68:	e59d2004 	ldr	r2, [sp, #4]
3000bd6c:	e2822001 	add	r2, r2, #1
3000bd70:	e58d2004 	str	r2, [sp, #4]
3000bd74:	e59d2000 	ldr	r2, [sp]
3000bd78:	e2822001 	add	r2, r2, #1
3000bd7c:	e58d2000 	str	r2, [sp]
3000bd80:	e3530000 	cmp	r3, #0
3000bd84:	1affffed 	bne	3000bd40 <acoral_str_cat+0x34>
		;

	return tmp;
3000bd88:	e59d300c 	ldr	r3, [sp, #12]
}
3000bd8c:	e1a00003 	mov	r0, r3
3000bd90:	e28dd010 	add	sp, sp, #16
3000bd94:	e12fff1e 	bx	lr

3000bd98 <acoral_str_ncat>:
 *
 * Note that in contrast to acoral_str_ncpy, acoral_str_ncat ensures the result is
 * terminated.
 */
acoral_char * acoral_str_ncat(acoral_char *dest, const acoral_char *src, acoral_u32 count)
{
3000bd98:	e24dd018 	sub	sp, sp, #24
3000bd9c:	e58d000c 	str	r0, [sp, #12]
3000bda0:	e58d1008 	str	r1, [sp, #8]
3000bda4:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp = dest;
3000bda8:	e59d300c 	ldr	r3, [sp, #12]
3000bdac:	e58d3014 	str	r3, [sp, #20]

	if (count) {
3000bdb0:	e59d3004 	ldr	r3, [sp, #4]
3000bdb4:	e3530000 	cmp	r3, #0
3000bdb8:	0a000024 	beq	3000be50 <acoral_str_ncat+0xb8>
		while (*dest)
3000bdbc:	ea000002 	b	3000bdcc <acoral_str_ncat+0x34>
			dest++;
3000bdc0:	e59d300c 	ldr	r3, [sp, #12]
3000bdc4:	e2833001 	add	r3, r3, #1
3000bdc8:	e58d300c 	str	r3, [sp, #12]
acoral_char * acoral_str_ncat(acoral_char *dest, const acoral_char *src, acoral_u32 count)
{
	acoral_char *tmp = dest;

	if (count) {
		while (*dest)
3000bdcc:	e59d300c 	ldr	r3, [sp, #12]
3000bdd0:	e5d33000 	ldrb	r3, [r3]
3000bdd4:	e3530000 	cmp	r3, #0
3000bdd8:	1afffff8 	bne	3000bdc0 <acoral_str_ncat+0x28>
			dest++;
		while ((*dest++ = *src++) != 0) {
3000bddc:	ea000009 	b	3000be08 <acoral_str_ncat+0x70>
			if (--count == 0) {
3000bde0:	e59d3004 	ldr	r3, [sp, #4]
3000bde4:	e2433001 	sub	r3, r3, #1
3000bde8:	e58d3004 	str	r3, [sp, #4]
3000bdec:	e59d3004 	ldr	r3, [sp, #4]
3000bdf0:	e3530000 	cmp	r3, #0
3000bdf4:	1a000003 	bne	3000be08 <acoral_str_ncat+0x70>
				*dest = '\0';
3000bdf8:	e59d300c 	ldr	r3, [sp, #12]
3000bdfc:	e3a02000 	mov	r2, #0
3000be00:	e5c32000 	strb	r2, [r3]
				break;
3000be04:	ea000011 	b	3000be50 <acoral_str_ncat+0xb8>
	acoral_char *tmp = dest;

	if (count) {
		while (*dest)
			dest++;
		while ((*dest++ = *src++) != 0) {
3000be08:	e59d3008 	ldr	r3, [sp, #8]
3000be0c:	e5d32000 	ldrb	r2, [r3]
3000be10:	e59d300c 	ldr	r3, [sp, #12]
3000be14:	e5c32000 	strb	r2, [r3]
3000be18:	e59d300c 	ldr	r3, [sp, #12]
3000be1c:	e5d33000 	ldrb	r3, [r3]
3000be20:	e3530000 	cmp	r3, #0
3000be24:	03a03000 	moveq	r3, #0
3000be28:	13a03001 	movne	r3, #1
3000be2c:	e20330ff 	and	r3, r3, #255	; 0xff
3000be30:	e59d200c 	ldr	r2, [sp, #12]
3000be34:	e2822001 	add	r2, r2, #1
3000be38:	e58d200c 	str	r2, [sp, #12]
3000be3c:	e59d2008 	ldr	r2, [sp, #8]
3000be40:	e2822001 	add	r2, r2, #1
3000be44:	e58d2008 	str	r2, [sp, #8]
3000be48:	e3530000 	cmp	r3, #0
3000be4c:	1affffe3 	bne	3000bde0 <acoral_str_ncat+0x48>
				break;
			}
		}
	}

	return tmp;
3000be50:	e59d3014 	ldr	r3, [sp, #20]
}
3000be54:	e1a00003 	mov	r0, r3
3000be58:	e28dd018 	add	sp, sp, #24
3000be5c:	e12fff1e 	bx	lr

3000be60 <acoral_str_lcat>:
 * @dest: The string to be appended to
 * @src: The string to append to it
 * @count: The size of the destination buffer.
 */
acoral_u32 acoral_str_lcat(acoral_char *dest, const acoral_char *src, acoral_u32 count)
{
3000be60:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000be64:	e24dd024 	sub	sp, sp, #36	; 0x24
3000be68:	e58d000c 	str	r0, [sp, #12]
3000be6c:	e58d1008 	str	r1, [sp, #8]
3000be70:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 dsize = acoral_str_len(dest);
3000be74:	e59d000c 	ldr	r0, [sp, #12]
3000be78:	ebfffea7 	bl	3000b91c <acoral_str_len>
3000be7c:	e1a03000 	mov	r3, r0
3000be80:	e58d3014 	str	r3, [sp, #20]
	acoral_u32 len = acoral_str_len(src);
3000be84:	e59d0008 	ldr	r0, [sp, #8]
3000be88:	ebfffea3 	bl	3000b91c <acoral_str_len>
3000be8c:	e1a03000 	mov	r3, r0
3000be90:	e58d3018 	str	r3, [sp, #24]
	acoral_u32 res = dsize + len;
3000be94:	e59d2014 	ldr	r2, [sp, #20]
3000be98:	e59d3018 	ldr	r3, [sp, #24]
3000be9c:	e0823003 	add	r3, r2, r3
3000bea0:	e58d301c 	str	r3, [sp, #28]

	/* This would be a bug */
//	BUG_ON(dsize >= count);

	dest += dsize;
3000bea4:	e59d200c 	ldr	r2, [sp, #12]
3000bea8:	e59d3014 	ldr	r3, [sp, #20]
3000beac:	e0823003 	add	r3, r2, r3
3000beb0:	e58d300c 	str	r3, [sp, #12]
	count -= dsize;
3000beb4:	e59d2004 	ldr	r2, [sp, #4]
3000beb8:	e59d3014 	ldr	r3, [sp, #20]
3000bebc:	e0633002 	rsb	r3, r3, r2
3000bec0:	e58d3004 	str	r3, [sp, #4]
	if (len >= count)
3000bec4:	e59d2018 	ldr	r2, [sp, #24]
3000bec8:	e59d3004 	ldr	r3, [sp, #4]
3000becc:	e1520003 	cmp	r2, r3
3000bed0:	3a000002 	bcc	3000bee0 <acoral_str_lcat+0x80>
		len = count-1;
3000bed4:	e59d3004 	ldr	r3, [sp, #4]
3000bed8:	e2433001 	sub	r3, r3, #1
3000bedc:	e58d3018 	str	r3, [sp, #24]
	acoral_memcpy(dest, src, len);
3000bee0:	e59d000c 	ldr	r0, [sp, #12]
3000bee4:	e59d1008 	ldr	r1, [sp, #8]
3000bee8:	e59d2018 	ldr	r2, [sp, #24]
3000beec:	eb000173 	bl	3000c4c0 <acoral_memcpy>
	dest[len] = 0;
3000bef0:	e59d200c 	ldr	r2, [sp, #12]
3000bef4:	e59d3018 	ldr	r3, [sp, #24]
3000bef8:	e0823003 	add	r3, r2, r3
3000befc:	e3a02000 	mov	r2, #0
3000bf00:	e5c32000 	strb	r2, [r3]
	return res;
3000bf04:	e59d301c 	ldr	r3, [sp, #28]
}
3000bf08:	e1a00003 	mov	r0, r3
3000bf0c:	e28dd024 	add	sp, sp, #36	; 0x24
3000bf10:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000bf14:	e12fff1e 	bx	lr

3000bf18 <acoral_str_ncmp>:
 * @cs: One string
 * @ct: Another string
 * @count: The maximum number of bytes to compare
 */
acoral_32 acoral_str_ncmp(const acoral_char * cs,const acoral_char * ct,acoral_u32 count)
{
3000bf18:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
3000bf1c:	e24dd014 	sub	sp, sp, #20
3000bf20:	e58d000c 	str	r0, [sp, #12]
3000bf24:	e58d1008 	str	r1, [sp, #8]
3000bf28:	e58d2004 	str	r2, [sp, #4]
	register acoral_8 __res = 0;
3000bf2c:	e3a04000 	mov	r4, #0

	while (count) {
3000bf30:	ea00001f 	b	3000bfb4 <acoral_str_ncmp+0x9c>
		if ((__res = *cs - *ct++) != 0 || !*cs++)
3000bf34:	e59d300c 	ldr	r3, [sp, #12]
3000bf38:	e5d32000 	ldrb	r2, [r3]
3000bf3c:	e59d3008 	ldr	r3, [sp, #8]
3000bf40:	e5d33000 	ldrb	r3, [r3]
3000bf44:	e0633002 	rsb	r3, r3, r2
3000bf48:	e20330ff 	and	r3, r3, #255	; 0xff
3000bf4c:	e1a04003 	mov	r4, r3
3000bf50:	e1a03c04 	lsl	r3, r4, #24
3000bf54:	e1a03c43 	asr	r3, r3, #24
3000bf58:	e3530000 	cmp	r3, #0
3000bf5c:	03a03000 	moveq	r3, #0
3000bf60:	13a03001 	movne	r3, #1
3000bf64:	e20330ff 	and	r3, r3, #255	; 0xff
3000bf68:	e59d2008 	ldr	r2, [sp, #8]
3000bf6c:	e2822001 	add	r2, r2, #1
3000bf70:	e58d2008 	str	r2, [sp, #8]
3000bf74:	e3530000 	cmp	r3, #0
3000bf78:	1a000010 	bne	3000bfc0 <acoral_str_ncmp+0xa8>
3000bf7c:	e59d300c 	ldr	r3, [sp, #12]
3000bf80:	e5d33000 	ldrb	r3, [r3]
3000bf84:	e3530000 	cmp	r3, #0
3000bf88:	13a03000 	movne	r3, #0
3000bf8c:	03a03001 	moveq	r3, #1
3000bf90:	e20330ff 	and	r3, r3, #255	; 0xff
3000bf94:	e59d200c 	ldr	r2, [sp, #12]
3000bf98:	e2822001 	add	r2, r2, #1
3000bf9c:	e58d200c 	str	r2, [sp, #12]
3000bfa0:	e3530000 	cmp	r3, #0
3000bfa4:	1a000005 	bne	3000bfc0 <acoral_str_ncmp+0xa8>
			break;
		count--;
3000bfa8:	e59d3004 	ldr	r3, [sp, #4]
3000bfac:	e2433001 	sub	r3, r3, #1
3000bfb0:	e58d3004 	str	r3, [sp, #4]
 */
acoral_32 acoral_str_ncmp(const acoral_char * cs,const acoral_char * ct,acoral_u32 count)
{
	register acoral_8 __res = 0;

	while (count) {
3000bfb4:	e59d3004 	ldr	r3, [sp, #4]
3000bfb8:	e3530000 	cmp	r3, #0
3000bfbc:	1affffdc 	bne	3000bf34 <acoral_str_ncmp+0x1c>
		if ((__res = *cs - *ct++) != 0 || !*cs++)
			break;
		count--;
	}

	return __res;
3000bfc0:	e1a03c04 	lsl	r3, r4, #24
3000bfc4:	e1a03c43 	asr	r3, r3, #24
}
3000bfc8:	e1a00003 	mov	r0, r3
3000bfcc:	e28dd014 	add	sp, sp, #20
3000bfd0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
3000bfd4:	e12fff1e 	bx	lr

3000bfd8 <acoral_str_chr>:
 * acoral_str_chr - Find the first occurrence of a character in a string
 * @s: The string to be searched
 * @c: The character to search for
 */
acoral_32  acoral_str_chr(const acoral_char * s, acoral_32 c)
{
3000bfd8:	e24dd010 	sub	sp, sp, #16
3000bfdc:	e58d0004 	str	r0, [sp, #4]
3000bfe0:	e58d1000 	str	r1, [sp]
	acoral_u32 pos = 1;
3000bfe4:	e3a03001 	mov	r3, #1
3000bfe8:	e58d300c 	str	r3, [sp, #12]
	for(; *s != (acoral_char) c; ++s,++pos)
3000bfec:	ea00000b 	b	3000c020 <acoral_str_chr+0x48>
		if (*s == '\0')
3000bff0:	e59d3004 	ldr	r3, [sp, #4]
3000bff4:	e5d33000 	ldrb	r3, [r3]
3000bff8:	e3530000 	cmp	r3, #0
3000bffc:	1a000001 	bne	3000c008 <acoral_str_chr+0x30>
			return 0;
3000c000:	e3a03000 	mov	r3, #0
3000c004:	ea00000c 	b	3000c03c <acoral_str_chr+0x64>
 * @c: The character to search for
 */
acoral_32  acoral_str_chr(const acoral_char * s, acoral_32 c)
{
	acoral_u32 pos = 1;
	for(; *s != (acoral_char) c; ++s,++pos)
3000c008:	e59d3004 	ldr	r3, [sp, #4]
3000c00c:	e2833001 	add	r3, r3, #1
3000c010:	e58d3004 	str	r3, [sp, #4]
3000c014:	e59d300c 	ldr	r3, [sp, #12]
3000c018:	e2833001 	add	r3, r3, #1
3000c01c:	e58d300c 	str	r3, [sp, #12]
3000c020:	e59d3004 	ldr	r3, [sp, #4]
3000c024:	e5d32000 	ldrb	r2, [r3]
3000c028:	e59d3000 	ldr	r3, [sp]
3000c02c:	e20330ff 	and	r3, r3, #255	; 0xff
3000c030:	e1520003 	cmp	r2, r3
3000c034:	1affffed 	bne	3000bff0 <acoral_str_chr+0x18>
		if (*s == '\0')
			return 0;
	return pos;
3000c038:	e59d300c 	ldr	r3, [sp, #12]
}
3000c03c:	e1a00003 	mov	r0, r3
3000c040:	e28dd010 	add	sp, sp, #16
3000c044:	e12fff1e 	bx	lr

3000c048 <acoral_str_rchr>:
 * acoral_str_rchr - Find the last occurrence of a character in a string
 * @s: The string to be searched
 * @c: The character to search for
 */
acoral_32  acoral_str_rchr(const acoral_char * s, acoral_32 c)
{
3000c048:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c04c:	e24dd014 	sub	sp, sp, #20
3000c050:	e58d0004 	str	r0, [sp, #4]
3000c054:	e58d1000 	str	r1, [sp]
	   acoral_u32 pos = acoral_str_len(s);
3000c058:	e59d0004 	ldr	r0, [sp, #4]
3000c05c:	ebfffe2e 	bl	3000b91c <acoral_str_len>
3000c060:	e1a03000 	mov	r3, r0
3000c064:	e58d3008 	str	r3, [sp, #8]
       const acoral_char *p = s + pos;
3000c068:	e59d2004 	ldr	r2, [sp, #4]
3000c06c:	e59d3008 	ldr	r3, [sp, #8]
3000c070:	e0823003 	add	r3, r2, r3
3000c074:	e58d300c 	str	r3, [sp, #12]
       do {
           if (*p == (acoral_char)c)
3000c078:	e59d300c 	ldr	r3, [sp, #12]
3000c07c:	e5d32000 	ldrb	r2, [r3]
3000c080:	e59d3000 	ldr	r3, [sp]
3000c084:	e20330ff 	and	r3, r3, #255	; 0xff
3000c088:	e1520003 	cmp	r2, r3
3000c08c:	1a000001 	bne	3000c098 <acoral_str_rchr+0x50>
               return pos;
3000c090:	e59d3008 	ldr	r3, [sp, #8]
3000c094:	ea00000a 	b	3000c0c4 <acoral_str_rchr+0x7c>
           --pos;
3000c098:	e59d3008 	ldr	r3, [sp, #8]
3000c09c:	e2433001 	sub	r3, r3, #1
3000c0a0:	e58d3008 	str	r3, [sp, #8]
       } while (--p >= s);
3000c0a4:	e59d300c 	ldr	r3, [sp, #12]
3000c0a8:	e2433001 	sub	r3, r3, #1
3000c0ac:	e58d300c 	str	r3, [sp, #12]
3000c0b0:	e59d200c 	ldr	r2, [sp, #12]
3000c0b4:	e59d3004 	ldr	r3, [sp, #4]
3000c0b8:	e1520003 	cmp	r2, r3
3000c0bc:	2affffed 	bcs	3000c078 <acoral_str_rchr+0x30>
       return 0;
3000c0c0:	e3a03000 	mov	r3, #0
}
3000c0c4:	e1a00003 	mov	r0, r3
3000c0c8:	e28dd014 	add	sp, sp, #20
3000c0cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000c0d0:	e12fff1e 	bx	lr

3000c0d4 <acoral_str_nchr>:
 * @s: The string to be searched
 * @count: The number of characters to be searched
 * @c: The character to search for
 */
acoral_32 acoral_str_nchr(const acoral_char *s, acoral_u32 count, acoral_32 c)
{
3000c0d4:	e24dd018 	sub	sp, sp, #24
3000c0d8:	e58d000c 	str	r0, [sp, #12]
3000c0dc:	e58d1008 	str	r1, [sp, #8]
3000c0e0:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 pos = 1;
3000c0e4:	e3a03001 	mov	r3, #1
3000c0e8:	e58d3014 	str	r3, [sp, #20]
	for (; count-- && *s != '\0'; ++s,++pos)
3000c0ec:	ea00000d 	b	3000c128 <acoral_str_nchr+0x54>
		if (*s == (acoral_char) c)
3000c0f0:	e59d300c 	ldr	r3, [sp, #12]
3000c0f4:	e5d32000 	ldrb	r2, [r3]
3000c0f8:	e59d3004 	ldr	r3, [sp, #4]
3000c0fc:	e20330ff 	and	r3, r3, #255	; 0xff
3000c100:	e1520003 	cmp	r2, r3
3000c104:	1a000001 	bne	3000c110 <acoral_str_nchr+0x3c>
			return pos;
3000c108:	e59d3014 	ldr	r3, [sp, #20]
3000c10c:	ea000014 	b	3000c164 <acoral_str_nchr+0x90>
 * @c: The character to search for
 */
acoral_32 acoral_str_nchr(const acoral_char *s, acoral_u32 count, acoral_32 c)
{
	acoral_u32 pos = 1;
	for (; count-- && *s != '\0'; ++s,++pos)
3000c110:	e59d300c 	ldr	r3, [sp, #12]
3000c114:	e2833001 	add	r3, r3, #1
3000c118:	e58d300c 	str	r3, [sp, #12]
3000c11c:	e59d3014 	ldr	r3, [sp, #20]
3000c120:	e2833001 	add	r3, r3, #1
3000c124:	e58d3014 	str	r3, [sp, #20]
3000c128:	e59d3008 	ldr	r3, [sp, #8]
3000c12c:	e3530000 	cmp	r3, #0
3000c130:	03a03000 	moveq	r3, #0
3000c134:	13a03001 	movne	r3, #1
3000c138:	e20330ff 	and	r3, r3, #255	; 0xff
3000c13c:	e59d2008 	ldr	r2, [sp, #8]
3000c140:	e2422001 	sub	r2, r2, #1
3000c144:	e58d2008 	str	r2, [sp, #8]
3000c148:	e3530000 	cmp	r3, #0
3000c14c:	0a000003 	beq	3000c160 <acoral_str_nchr+0x8c>
3000c150:	e59d300c 	ldr	r3, [sp, #12]
3000c154:	e5d33000 	ldrb	r3, [r3]
3000c158:	e3530000 	cmp	r3, #0
3000c15c:	1affffe3 	bne	3000c0f0 <acoral_str_nchr+0x1c>
		if (*s == (acoral_char) c)
			return pos;
	return 0;
3000c160:	e3a03000 	mov	r3, #0
}
3000c164:	e1a00003 	mov	r0, r3
3000c168:	e28dd018 	add	sp, sp, #24
3000c16c:	e12fff1e 	bx	lr

3000c170 <acoral_str_nlen>:
 * acoral_str_nlen - Find the length of a length-limited string
 * @s: The string to be sized
 * @count: The maximum number of bytes to search
 */
acoral_u32 acoral_str_nlen(const acoral_char * s, acoral_u32 count)
{
3000c170:	e24dd010 	sub	sp, sp, #16
3000c174:	e58d0004 	str	r0, [sp, #4]
3000c178:	e58d1000 	str	r1, [sp]
	const acoral_char *sc;

	for (sc = s; count-- && *sc != '\0'; ++sc)
3000c17c:	e59d3004 	ldr	r3, [sp, #4]
3000c180:	e58d300c 	str	r3, [sp, #12]
3000c184:	ea000002 	b	3000c194 <acoral_str_nlen+0x24>
3000c188:	e59d300c 	ldr	r3, [sp, #12]
3000c18c:	e2833001 	add	r3, r3, #1
3000c190:	e58d300c 	str	r3, [sp, #12]
3000c194:	e59d3000 	ldr	r3, [sp]
3000c198:	e3530000 	cmp	r3, #0
3000c19c:	03a03000 	moveq	r3, #0
3000c1a0:	13a03001 	movne	r3, #1
3000c1a4:	e20330ff 	and	r3, r3, #255	; 0xff
3000c1a8:	e59d2000 	ldr	r2, [sp]
3000c1ac:	e2422001 	sub	r2, r2, #1
3000c1b0:	e58d2000 	str	r2, [sp]
3000c1b4:	e3530000 	cmp	r3, #0
3000c1b8:	0a000003 	beq	3000c1cc <acoral_str_nlen+0x5c>
3000c1bc:	e59d300c 	ldr	r3, [sp, #12]
3000c1c0:	e5d33000 	ldrb	r3, [r3]
3000c1c4:	e3530000 	cmp	r3, #0
3000c1c8:	1affffee 	bne	3000c188 <acoral_str_nlen+0x18>
		/* nothing */;
	return sc - s;
3000c1cc:	e59d200c 	ldr	r2, [sp, #12]
3000c1d0:	e59d3004 	ldr	r3, [sp, #4]
3000c1d4:	e0633002 	rsb	r3, r3, r2
}
3000c1d8:	e1a00003 	mov	r0, r3
3000c1dc:	e28dd010 	add	sp, sp, #16
3000c1e0:	e12fff1e 	bx	lr

3000c1e4 <acoral_str_spn>:
 * 	contain letters in @accept
 * @s: The string to be searched
 * @accept: The string to search for
 */
acoral_u32 acoral_str_spn(const acoral_char *s, const acoral_char *accept)
{
3000c1e4:	e24dd018 	sub	sp, sp, #24
3000c1e8:	e58d0004 	str	r0, [sp, #4]
3000c1ec:	e58d1000 	str	r1, [sp]
	const acoral_char *p;
	const acoral_char *a;
	acoral_u32 count = 0;
3000c1f0:	e3a03000 	mov	r3, #0
3000c1f4:	e58d3014 	str	r3, [sp, #20]

	for (p = s; *p != '\0'; ++p) {
3000c1f8:	e59d3004 	ldr	r3, [sp, #4]
3000c1fc:	e58d300c 	str	r3, [sp, #12]
3000c200:	ea00001d 	b	3000c27c <acoral_str_spn+0x98>
		for (a = accept; *a != '\0'; ++a) {
3000c204:	e59d3000 	ldr	r3, [sp]
3000c208:	e58d3010 	str	r3, [sp, #16]
3000c20c:	ea000008 	b	3000c234 <acoral_str_spn+0x50>
			if (*p == *a)
3000c210:	e59d300c 	ldr	r3, [sp, #12]
3000c214:	e5d32000 	ldrb	r2, [r3]
3000c218:	e59d3010 	ldr	r3, [sp, #16]
3000c21c:	e5d33000 	ldrb	r3, [r3]
3000c220:	e1520003 	cmp	r2, r3
3000c224:	0a000007 	beq	3000c248 <acoral_str_spn+0x64>
	const acoral_char *p;
	const acoral_char *a;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
		for (a = accept; *a != '\0'; ++a) {
3000c228:	e59d3010 	ldr	r3, [sp, #16]
3000c22c:	e2833001 	add	r3, r3, #1
3000c230:	e58d3010 	str	r3, [sp, #16]
3000c234:	e59d3010 	ldr	r3, [sp, #16]
3000c238:	e5d33000 	ldrb	r3, [r3]
3000c23c:	e3530000 	cmp	r3, #0
3000c240:	1afffff2 	bne	3000c210 <acoral_str_spn+0x2c>
3000c244:	ea000000 	b	3000c24c <acoral_str_spn+0x68>
			if (*p == *a)
				break;
3000c248:	e1a00000 	nop			; (mov r0, r0)
		}
		if (*a == '\0')
3000c24c:	e59d3010 	ldr	r3, [sp, #16]
3000c250:	e5d33000 	ldrb	r3, [r3]
3000c254:	e3530000 	cmp	r3, #0
3000c258:	1a000001 	bne	3000c264 <acoral_str_spn+0x80>
			return count;
3000c25c:	e59d3014 	ldr	r3, [sp, #20]
3000c260:	ea00000a 	b	3000c290 <acoral_str_spn+0xac>
		++count;
3000c264:	e59d3014 	ldr	r3, [sp, #20]
3000c268:	e2833001 	add	r3, r3, #1
3000c26c:	e58d3014 	str	r3, [sp, #20]
{
	const acoral_char *p;
	const acoral_char *a;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
3000c270:	e59d300c 	ldr	r3, [sp, #12]
3000c274:	e2833001 	add	r3, r3, #1
3000c278:	e58d300c 	str	r3, [sp, #12]
3000c27c:	e59d300c 	ldr	r3, [sp, #12]
3000c280:	e5d33000 	ldrb	r3, [r3]
3000c284:	e3530000 	cmp	r3, #0
3000c288:	1affffdd 	bne	3000c204 <acoral_str_spn+0x20>
		if (*a == '\0')
			return count;
		++count;
	}

	return count;
3000c28c:	e59d3014 	ldr	r3, [sp, #20]
}
3000c290:	e1a00003 	mov	r0, r3
3000c294:	e28dd018 	add	sp, sp, #24
3000c298:	e12fff1e 	bx	lr

3000c29c <acoral_str_cspn>:
 * 	not contain letters in @reject
 * @s: The string to be searched
 * @reject: The string to avoid
 */
acoral_u32 acoral_str_cspn(const acoral_char *s, const acoral_char *reject)
{
3000c29c:	e24dd018 	sub	sp, sp, #24
3000c2a0:	e58d0004 	str	r0, [sp, #4]
3000c2a4:	e58d1000 	str	r1, [sp]
	const acoral_char *p;
	const acoral_char *r;
	acoral_u32 count = 0;
3000c2a8:	e3a03000 	mov	r3, #0
3000c2ac:	e58d3014 	str	r3, [sp, #20]

	for (p = s; *p != '\0'; ++p) {
3000c2b0:	e59d3004 	ldr	r3, [sp, #4]
3000c2b4:	e58d300c 	str	r3, [sp, #12]
3000c2b8:	ea000017 	b	3000c31c <acoral_str_cspn+0x80>
		for (r = reject; *r != '\0'; ++r) {
3000c2bc:	e59d3000 	ldr	r3, [sp]
3000c2c0:	e58d3010 	str	r3, [sp, #16]
3000c2c4:	ea00000a 	b	3000c2f4 <acoral_str_cspn+0x58>
			if (*p == *r)
3000c2c8:	e59d300c 	ldr	r3, [sp, #12]
3000c2cc:	e5d32000 	ldrb	r2, [r3]
3000c2d0:	e59d3010 	ldr	r3, [sp, #16]
3000c2d4:	e5d33000 	ldrb	r3, [r3]
3000c2d8:	e1520003 	cmp	r2, r3
3000c2dc:	1a000001 	bne	3000c2e8 <acoral_str_cspn+0x4c>
				return count;
3000c2e0:	e59d3014 	ldr	r3, [sp, #20]
3000c2e4:	ea000011 	b	3000c330 <acoral_str_cspn+0x94>
	const acoral_char *p;
	const acoral_char *r;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
		for (r = reject; *r != '\0'; ++r) {
3000c2e8:	e59d3010 	ldr	r3, [sp, #16]
3000c2ec:	e2833001 	add	r3, r3, #1
3000c2f0:	e58d3010 	str	r3, [sp, #16]
3000c2f4:	e59d3010 	ldr	r3, [sp, #16]
3000c2f8:	e5d33000 	ldrb	r3, [r3]
3000c2fc:	e3530000 	cmp	r3, #0
3000c300:	1afffff0 	bne	3000c2c8 <acoral_str_cspn+0x2c>
			if (*p == *r)
				return count;
		}
		++count;
3000c304:	e59d3014 	ldr	r3, [sp, #20]
3000c308:	e2833001 	add	r3, r3, #1
3000c30c:	e58d3014 	str	r3, [sp, #20]
{
	const acoral_char *p;
	const acoral_char *r;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
3000c310:	e59d300c 	ldr	r3, [sp, #12]
3000c314:	e2833001 	add	r3, r3, #1
3000c318:	e58d300c 	str	r3, [sp, #12]
3000c31c:	e59d300c 	ldr	r3, [sp, #12]
3000c320:	e5d33000 	ldrb	r3, [r3]
3000c324:	e3530000 	cmp	r3, #0
3000c328:	1affffe3 	bne	3000c2bc <acoral_str_cspn+0x20>
				return count;
		}
		++count;
	}

	return count;
3000c32c:	e59d3014 	ldr	r3, [sp, #20]
}	
3000c330:	e1a00003 	mov	r0, r3
3000c334:	e28dd018 	add	sp, sp, #24
3000c338:	e12fff1e 	bx	lr

3000c33c <acoral_str_pbrk>:
 * acoral_str_pbrk - Find the first occurrence of a set of characters
 * @cs: The string to be searched
 * @ct: The characters to search for
 */
acoral_char * acoral_str_pbrk(const acoral_char * cs,const acoral_char * ct)
{
3000c33c:	e24dd010 	sub	sp, sp, #16
3000c340:	e58d0004 	str	r0, [sp, #4]
3000c344:	e58d1000 	str	r1, [sp]
	const acoral_char *sc1,*sc2;

	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
3000c348:	e59d3004 	ldr	r3, [sp, #4]
3000c34c:	e58d3008 	str	r3, [sp, #8]
3000c350:	ea000014 	b	3000c3a8 <acoral_str_pbrk+0x6c>
		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
3000c354:	e59d3000 	ldr	r3, [sp]
3000c358:	e58d300c 	str	r3, [sp, #12]
3000c35c:	ea00000a 	b	3000c38c <acoral_str_pbrk+0x50>
			if (*sc1 == *sc2)
3000c360:	e59d3008 	ldr	r3, [sp, #8]
3000c364:	e5d32000 	ldrb	r2, [r3]
3000c368:	e59d300c 	ldr	r3, [sp, #12]
3000c36c:	e5d33000 	ldrb	r3, [r3]
3000c370:	e1520003 	cmp	r2, r3
3000c374:	1a000001 	bne	3000c380 <acoral_str_pbrk+0x44>
				return (acoral_char *) sc1;
3000c378:	e59d3008 	ldr	r3, [sp, #8]
3000c37c:	ea00000e 	b	3000c3bc <acoral_str_pbrk+0x80>
acoral_char * acoral_str_pbrk(const acoral_char * cs,const acoral_char * ct)
{
	const acoral_char *sc1,*sc2;

	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
3000c380:	e59d300c 	ldr	r3, [sp, #12]
3000c384:	e2833001 	add	r3, r3, #1
3000c388:	e58d300c 	str	r3, [sp, #12]
3000c38c:	e59d300c 	ldr	r3, [sp, #12]
3000c390:	e5d33000 	ldrb	r3, [r3]
3000c394:	e3530000 	cmp	r3, #0
3000c398:	1afffff0 	bne	3000c360 <acoral_str_pbrk+0x24>
 */
acoral_char * acoral_str_pbrk(const acoral_char * cs,const acoral_char * ct)
{
	const acoral_char *sc1,*sc2;

	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
3000c39c:	e59d3008 	ldr	r3, [sp, #8]
3000c3a0:	e2833001 	add	r3, r3, #1
3000c3a4:	e58d3008 	str	r3, [sp, #8]
3000c3a8:	e59d3008 	ldr	r3, [sp, #8]
3000c3ac:	e5d33000 	ldrb	r3, [r3]
3000c3b0:	e3530000 	cmp	r3, #0
3000c3b4:	1affffe6 	bne	3000c354 <acoral_str_pbrk+0x18>
		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
			if (*sc1 == *sc2)
				return (acoral_char *) sc1;
		}
	}
	return NULL;
3000c3b8:	e3a03000 	mov	r3, #0
}
3000c3bc:	e1a00003 	mov	r0, r3
3000c3c0:	e28dd010 	add	sp, sp, #16
3000c3c4:	e12fff1e 	bx	lr

3000c3c8 <acoral_str_sep>:
 * It returns empty tokens, too, behaving exactly like the libc function
 * of that name. In fact, it was stolen from glibc2 and de-fancy-fied.
 * Same semantics, slimmer shape. ;)
 */
acoral_char * acoral_str_sep(acoral_char **s, const acoral_char *ct)
{
3000c3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c3cc:	e24dd014 	sub	sp, sp, #20
3000c3d0:	e58d0004 	str	r0, [sp, #4]
3000c3d4:	e58d1000 	str	r1, [sp]
	acoral_char *sbegin = *s, *end;
3000c3d8:	e59d3004 	ldr	r3, [sp, #4]
3000c3dc:	e5933000 	ldr	r3, [r3]
3000c3e0:	e58d3008 	str	r3, [sp, #8]

	if (sbegin == NULL)
3000c3e4:	e59d3008 	ldr	r3, [sp, #8]
3000c3e8:	e3530000 	cmp	r3, #0
3000c3ec:	1a000001 	bne	3000c3f8 <acoral_str_sep+0x30>
		return NULL;
3000c3f0:	e3a03000 	mov	r3, #0
3000c3f4:	ea000011 	b	3000c440 <acoral_str_sep+0x78>

	end = acoral_str_pbrk(sbegin, ct);
3000c3f8:	e59d0008 	ldr	r0, [sp, #8]
3000c3fc:	e59d1000 	ldr	r1, [sp]
3000c400:	ebffffcd 	bl	3000c33c <acoral_str_pbrk>
3000c404:	e1a03000 	mov	r3, r0
3000c408:	e58d300c 	str	r3, [sp, #12]
	if (end)
3000c40c:	e59d300c 	ldr	r3, [sp, #12]
3000c410:	e3530000 	cmp	r3, #0
3000c414:	0a000005 	beq	3000c430 <acoral_str_sep+0x68>
		*end++ = '\0';
3000c418:	e59d300c 	ldr	r3, [sp, #12]
3000c41c:	e3a02000 	mov	r2, #0
3000c420:	e5c32000 	strb	r2, [r3]
3000c424:	e59d300c 	ldr	r3, [sp, #12]
3000c428:	e2833001 	add	r3, r3, #1
3000c42c:	e58d300c 	str	r3, [sp, #12]
	*s = end;
3000c430:	e59d3004 	ldr	r3, [sp, #4]
3000c434:	e59d200c 	ldr	r2, [sp, #12]
3000c438:	e5832000 	str	r2, [r3]

	return sbegin;
3000c43c:	e59d3008 	ldr	r3, [sp, #8]
}
3000c440:	e1a00003 	mov	r0, r3
3000c444:	e28dd014 	add	sp, sp, #20
3000c448:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000c44c:	e12fff1e 	bx	lr

3000c450 <acoral_memset>:
 * @count: The size of the area.
 *
 * Do not use memset() to access IO space, use memset_io() instead.
 */
void * acoral_memset(void * s,acoral_32 c,acoral_u32 count)
{
3000c450:	e24dd018 	sub	sp, sp, #24
3000c454:	e58d000c 	str	r0, [sp, #12]
3000c458:	e58d1008 	str	r1, [sp, #8]
3000c45c:	e58d2004 	str	r2, [sp, #4]
	acoral_char *xs = (acoral_char *) s;
3000c460:	e59d300c 	ldr	r3, [sp, #12]
3000c464:	e58d3014 	str	r3, [sp, #20]

	while (count--)
3000c468:	ea000006 	b	3000c488 <acoral_memset+0x38>
		*xs++ = c;
3000c46c:	e59d3008 	ldr	r3, [sp, #8]
3000c470:	e20320ff 	and	r2, r3, #255	; 0xff
3000c474:	e59d3014 	ldr	r3, [sp, #20]
3000c478:	e5c32000 	strb	r2, [r3]
3000c47c:	e59d3014 	ldr	r3, [sp, #20]
3000c480:	e2833001 	add	r3, r3, #1
3000c484:	e58d3014 	str	r3, [sp, #20]
 */
void * acoral_memset(void * s,acoral_32 c,acoral_u32 count)
{
	acoral_char *xs = (acoral_char *) s;

	while (count--)
3000c488:	e59d3004 	ldr	r3, [sp, #4]
3000c48c:	e3530000 	cmp	r3, #0
3000c490:	03a03000 	moveq	r3, #0
3000c494:	13a03001 	movne	r3, #1
3000c498:	e20330ff 	and	r3, r3, #255	; 0xff
3000c49c:	e59d2004 	ldr	r2, [sp, #4]
3000c4a0:	e2422001 	sub	r2, r2, #1
3000c4a4:	e58d2004 	str	r2, [sp, #4]
3000c4a8:	e3530000 	cmp	r3, #0
3000c4ac:	1affffee 	bne	3000c46c <acoral_memset+0x1c>
		*xs++ = c;

	return s;
3000c4b0:	e59d300c 	ldr	r3, [sp, #12]
}
3000c4b4:	e1a00003 	mov	r0, r3
3000c4b8:	e28dd018 	add	sp, sp, #24
3000c4bc:	e12fff1e 	bx	lr

3000c4c0 <acoral_memcpy>:
 *
 * You should not use this function to access IO space, use memcpy_toio()
 * or memcpy_fromio() instead.
 */
void * acoral_memcpy(void * dest,const void *src,acoral_u32 count)
{
3000c4c0:	e24dd018 	sub	sp, sp, #24
3000c4c4:	e58d000c 	str	r0, [sp, #12]
3000c4c8:	e58d1008 	str	r1, [sp, #8]
3000c4cc:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp = (acoral_char *) dest, *s = (acoral_char *) src;
3000c4d0:	e59d300c 	ldr	r3, [sp, #12]
3000c4d4:	e58d3010 	str	r3, [sp, #16]
3000c4d8:	e59d3008 	ldr	r3, [sp, #8]
3000c4dc:	e58d3014 	str	r3, [sp, #20]

	while (count--)
3000c4e0:	ea000009 	b	3000c50c <acoral_memcpy+0x4c>
		*tmp++ = *s++;
3000c4e4:	e59d3014 	ldr	r3, [sp, #20]
3000c4e8:	e5d32000 	ldrb	r2, [r3]
3000c4ec:	e59d3010 	ldr	r3, [sp, #16]
3000c4f0:	e5c32000 	strb	r2, [r3]
3000c4f4:	e59d3010 	ldr	r3, [sp, #16]
3000c4f8:	e2833001 	add	r3, r3, #1
3000c4fc:	e58d3010 	str	r3, [sp, #16]
3000c500:	e59d3014 	ldr	r3, [sp, #20]
3000c504:	e2833001 	add	r3, r3, #1
3000c508:	e58d3014 	str	r3, [sp, #20]
 */
void * acoral_memcpy(void * dest,const void *src,acoral_u32 count)
{
	acoral_char *tmp = (acoral_char *) dest, *s = (acoral_char *) src;

	while (count--)
3000c50c:	e59d3004 	ldr	r3, [sp, #4]
3000c510:	e3530000 	cmp	r3, #0
3000c514:	03a03000 	moveq	r3, #0
3000c518:	13a03001 	movne	r3, #1
3000c51c:	e20330ff 	and	r3, r3, #255	; 0xff
3000c520:	e59d2004 	ldr	r2, [sp, #4]
3000c524:	e2422001 	sub	r2, r2, #1
3000c528:	e58d2004 	str	r2, [sp, #4]
3000c52c:	e3530000 	cmp	r3, #0
3000c530:	1affffeb 	bne	3000c4e4 <acoral_memcpy+0x24>
		*tmp++ = *s++;

	return dest;
3000c534:	e59d300c 	ldr	r3, [sp, #12]
}
3000c538:	e1a00003 	mov	r0, r3
3000c53c:	e28dd018 	add	sp, sp, #24
3000c540:	e12fff1e 	bx	lr

3000c544 <acoral_memmove>:
 * @count: The size of the area.
 *
 * Unlike memcpy(), memmove() copes with overlapping areas.
 */
void * acoral_memmove(void * dest,const void *src,acoral_u32 count)
{
3000c544:	e24dd018 	sub	sp, sp, #24
3000c548:	e58d000c 	str	r0, [sp, #12]
3000c54c:	e58d1008 	str	r1, [sp, #8]
3000c550:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp, *s;

	if (dest <= src) {
3000c554:	e59d200c 	ldr	r2, [sp, #12]
3000c558:	e59d3008 	ldr	r3, [sp, #8]
3000c55c:	e1520003 	cmp	r2, r3
3000c560:	8a000019 	bhi	3000c5cc <acoral_memmove+0x88>
		tmp = (acoral_char *) dest;
3000c564:	e59d300c 	ldr	r3, [sp, #12]
3000c568:	e58d3010 	str	r3, [sp, #16]
		s = (acoral_char *) src;
3000c56c:	e59d3008 	ldr	r3, [sp, #8]
3000c570:	e58d3014 	str	r3, [sp, #20]
		while (count--)
3000c574:	ea000009 	b	3000c5a0 <acoral_memmove+0x5c>
			*tmp++ = *s++;
3000c578:	e59d3014 	ldr	r3, [sp, #20]
3000c57c:	e5d32000 	ldrb	r2, [r3]
3000c580:	e59d3010 	ldr	r3, [sp, #16]
3000c584:	e5c32000 	strb	r2, [r3]
3000c588:	e59d3010 	ldr	r3, [sp, #16]
3000c58c:	e2833001 	add	r3, r3, #1
3000c590:	e58d3010 	str	r3, [sp, #16]
3000c594:	e59d3014 	ldr	r3, [sp, #20]
3000c598:	e2833001 	add	r3, r3, #1
3000c59c:	e58d3014 	str	r3, [sp, #20]
	acoral_char *tmp, *s;

	if (dest <= src) {
		tmp = (acoral_char *) dest;
		s = (acoral_char *) src;
		while (count--)
3000c5a0:	e59d3004 	ldr	r3, [sp, #4]
3000c5a4:	e3530000 	cmp	r3, #0
3000c5a8:	03a03000 	moveq	r3, #0
3000c5ac:	13a03001 	movne	r3, #1
3000c5b0:	e20330ff 	and	r3, r3, #255	; 0xff
3000c5b4:	e59d2004 	ldr	r2, [sp, #4]
3000c5b8:	e2422001 	sub	r2, r2, #1
3000c5bc:	e58d2004 	str	r2, [sp, #4]
3000c5c0:	e3530000 	cmp	r3, #0
3000c5c4:	1affffeb 	bne	3000c578 <acoral_memmove+0x34>
3000c5c8:	ea00001c 	b	3000c640 <acoral_memmove+0xfc>
			*tmp++ = *s++;
		}
	else {
		tmp = (acoral_char *) dest + count;
3000c5cc:	e59d200c 	ldr	r2, [sp, #12]
3000c5d0:	e59d3004 	ldr	r3, [sp, #4]
3000c5d4:	e0823003 	add	r3, r2, r3
3000c5d8:	e58d3010 	str	r3, [sp, #16]
		s = (acoral_char *) src + count;
3000c5dc:	e59d2008 	ldr	r2, [sp, #8]
3000c5e0:	e59d3004 	ldr	r3, [sp, #4]
3000c5e4:	e0823003 	add	r3, r2, r3
3000c5e8:	e58d3014 	str	r3, [sp, #20]
		while (count--)
3000c5ec:	ea000009 	b	3000c618 <acoral_memmove+0xd4>
			*--tmp = *--s;
3000c5f0:	e59d3010 	ldr	r3, [sp, #16]
3000c5f4:	e2433001 	sub	r3, r3, #1
3000c5f8:	e58d3010 	str	r3, [sp, #16]
3000c5fc:	e59d3014 	ldr	r3, [sp, #20]
3000c600:	e2433001 	sub	r3, r3, #1
3000c604:	e58d3014 	str	r3, [sp, #20]
3000c608:	e59d3014 	ldr	r3, [sp, #20]
3000c60c:	e5d32000 	ldrb	r2, [r3]
3000c610:	e59d3010 	ldr	r3, [sp, #16]
3000c614:	e5c32000 	strb	r2, [r3]
			*tmp++ = *s++;
		}
	else {
		tmp = (acoral_char *) dest + count;
		s = (acoral_char *) src + count;
		while (count--)
3000c618:	e59d3004 	ldr	r3, [sp, #4]
3000c61c:	e3530000 	cmp	r3, #0
3000c620:	03a03000 	moveq	r3, #0
3000c624:	13a03001 	movne	r3, #1
3000c628:	e20330ff 	and	r3, r3, #255	; 0xff
3000c62c:	e59d2004 	ldr	r2, [sp, #4]
3000c630:	e2422001 	sub	r2, r2, #1
3000c634:	e58d2004 	str	r2, [sp, #4]
3000c638:	e3530000 	cmp	r3, #0
3000c63c:	1affffeb 	bne	3000c5f0 <acoral_memmove+0xac>
			*--tmp = *--s;
		}

	return dest;
3000c640:	e59d300c 	ldr	r3, [sp, #12]
}
3000c644:	e1a00003 	mov	r0, r3
3000c648:	e28dd018 	add	sp, sp, #24
3000c64c:	e12fff1e 	bx	lr

3000c650 <acoral_memcmp>:
 * @cs: One area of memory
 * @ct: Another area of memory
 * @count: The size of the area.
 */
acoral_32 acoral_memcmp(const void * cs,const void * ct,acoral_u32 count)
{
3000c650:	e24dd020 	sub	sp, sp, #32
3000c654:	e58d000c 	str	r0, [sp, #12]
3000c658:	e58d1008 	str	r1, [sp, #8]
3000c65c:	e58d2004 	str	r2, [sp, #4]
	const acoral_u8 *su1, *su2;
	acoral_32 res = 0;
3000c660:	e3a03000 	mov	r3, #0
3000c664:	e58d301c 	str	r3, [sp, #28]

	for( su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
3000c668:	e59d300c 	ldr	r3, [sp, #12]
3000c66c:	e58d3014 	str	r3, [sp, #20]
3000c670:	e59d3008 	ldr	r3, [sp, #8]
3000c674:	e58d3018 	str	r3, [sp, #24]
3000c678:	ea000012 	b	3000c6c8 <acoral_memcmp+0x78>
		if ((res = *su1 - *su2) != 0)
3000c67c:	e59d3014 	ldr	r3, [sp, #20]
3000c680:	e5d33000 	ldrb	r3, [r3]
3000c684:	e1a02003 	mov	r2, r3
3000c688:	e59d3018 	ldr	r3, [sp, #24]
3000c68c:	e5d33000 	ldrb	r3, [r3]
3000c690:	e0633002 	rsb	r3, r3, r2
3000c694:	e58d301c 	str	r3, [sp, #28]
3000c698:	e59d301c 	ldr	r3, [sp, #28]
3000c69c:	e3530000 	cmp	r3, #0
3000c6a0:	1a00000c 	bne	3000c6d8 <acoral_memcmp+0x88>
acoral_32 acoral_memcmp(const void * cs,const void * ct,acoral_u32 count)
{
	const acoral_u8 *su1, *su2;
	acoral_32 res = 0;

	for( su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
3000c6a4:	e59d3014 	ldr	r3, [sp, #20]
3000c6a8:	e2833001 	add	r3, r3, #1
3000c6ac:	e58d3014 	str	r3, [sp, #20]
3000c6b0:	e59d3018 	ldr	r3, [sp, #24]
3000c6b4:	e2833001 	add	r3, r3, #1
3000c6b8:	e58d3018 	str	r3, [sp, #24]
3000c6bc:	e59d3004 	ldr	r3, [sp, #4]
3000c6c0:	e2433001 	sub	r3, r3, #1
3000c6c4:	e58d3004 	str	r3, [sp, #4]
3000c6c8:	e59d3004 	ldr	r3, [sp, #4]
3000c6cc:	e3530000 	cmp	r3, #0
3000c6d0:	1affffe9 	bne	3000c67c <acoral_memcmp+0x2c>
3000c6d4:	ea000000 	b	3000c6dc <acoral_memcmp+0x8c>
		if ((res = *su1 - *su2) != 0)
			break;
3000c6d8:	e1a00000 	nop			; (mov r0, r0)
	return res;
3000c6dc:	e59d301c 	ldr	r3, [sp, #28]
}
3000c6e0:	e1a00003 	mov	r0, r3
3000c6e4:	e28dd020 	add	sp, sp, #32
3000c6e8:	e12fff1e 	bx	lr

3000c6ec <acoral_memscan>:
 *
 * returns the address of the first occurrence of @c, or 1 byte past
 * the area if @c is not found
 */
void * acoral_memscan(void * addr, acoral_32 c, acoral_u32 size)
{
3000c6ec:	e24dd018 	sub	sp, sp, #24
3000c6f0:	e58d000c 	str	r0, [sp, #12]
3000c6f4:	e58d1008 	str	r1, [sp, #8]
3000c6f8:	e58d2004 	str	r2, [sp, #4]
	acoral_u8 * p = (acoral_u8 *) addr;
3000c6fc:	e59d300c 	ldr	r3, [sp, #12]
3000c700:	e58d3014 	str	r3, [sp, #20]

	while (size) {
3000c704:	ea00000d 	b	3000c740 <acoral_memscan+0x54>
		if (*p == c)
3000c708:	e59d3014 	ldr	r3, [sp, #20]
3000c70c:	e5d33000 	ldrb	r3, [r3]
3000c710:	e1a02003 	mov	r2, r3
3000c714:	e59d3008 	ldr	r3, [sp, #8]
3000c718:	e1520003 	cmp	r2, r3
3000c71c:	1a000001 	bne	3000c728 <acoral_memscan+0x3c>
			return (void *) p;
3000c720:	e59d3014 	ldr	r3, [sp, #20]
3000c724:	ea000009 	b	3000c750 <acoral_memscan+0x64>
		p++;
3000c728:	e59d3014 	ldr	r3, [sp, #20]
3000c72c:	e2833001 	add	r3, r3, #1
3000c730:	e58d3014 	str	r3, [sp, #20]
		size--;
3000c734:	e59d3004 	ldr	r3, [sp, #4]
3000c738:	e2433001 	sub	r3, r3, #1
3000c73c:	e58d3004 	str	r3, [sp, #4]
 */
void * acoral_memscan(void * addr, acoral_32 c, acoral_u32 size)
{
	acoral_u8 * p = (acoral_u8 *) addr;

	while (size) {
3000c740:	e59d3004 	ldr	r3, [sp, #4]
3000c744:	e3530000 	cmp	r3, #0
3000c748:	1affffee 	bne	3000c708 <acoral_memscan+0x1c>
		if (*p == c)
			return (void *) p;
		p++;
		size--;
	}
  	return (void *) p;
3000c74c:	e59d3014 	ldr	r3, [sp, #20]
}
3000c750:	e1a00003 	mov	r0, r3
3000c754:	e28dd018 	add	sp, sp, #24
3000c758:	e12fff1e 	bx	lr

3000c75c <acoral_strstr>:
 * acoral_strstr - Find the first substring in a %NUL terminated string
 * @s1: The string to be searched
 * @s2: The string to search for
 */
acoral_char * acoral_strstr(const acoral_char * s1,const acoral_char * s2)
{
3000c75c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c760:	e24dd014 	sub	sp, sp, #20
3000c764:	e58d0004 	str	r0, [sp, #4]
3000c768:	e58d1000 	str	r1, [sp]
	acoral_32 l1, l2;

	l2 = acoral_str_len(s2);
3000c76c:	e59d0000 	ldr	r0, [sp]
3000c770:	ebfffc69 	bl	3000b91c <acoral_str_len>
3000c774:	e1a03000 	mov	r3, r0
3000c778:	e58d300c 	str	r3, [sp, #12]
	if (!l2)
3000c77c:	e59d300c 	ldr	r3, [sp, #12]
3000c780:	e3530000 	cmp	r3, #0
3000c784:	1a000001 	bne	3000c790 <acoral_strstr+0x34>
		return (acoral_char *) s1;
3000c788:	e59d3004 	ldr	r3, [sp, #4]
3000c78c:	ea000019 	b	3000c7f8 <acoral_strstr+0x9c>
	l1 = acoral_str_len(s1);
3000c790:	e59d0004 	ldr	r0, [sp, #4]
3000c794:	ebfffc60 	bl	3000b91c <acoral_str_len>
3000c798:	e1a03000 	mov	r3, r0
3000c79c:	e58d3008 	str	r3, [sp, #8]
	while (l1 >= l2) {
3000c7a0:	ea00000f 	b	3000c7e4 <acoral_strstr+0x88>
		l1--;
3000c7a4:	e59d3008 	ldr	r3, [sp, #8]
3000c7a8:	e2433001 	sub	r3, r3, #1
3000c7ac:	e58d3008 	str	r3, [sp, #8]
		if (!acoral_memcmp(s1,s2,l2))
3000c7b0:	e59d300c 	ldr	r3, [sp, #12]
3000c7b4:	e59d0004 	ldr	r0, [sp, #4]
3000c7b8:	e59d1000 	ldr	r1, [sp]
3000c7bc:	e1a02003 	mov	r2, r3
3000c7c0:	ebffffa2 	bl	3000c650 <acoral_memcmp>
3000c7c4:	e1a03000 	mov	r3, r0
3000c7c8:	e3530000 	cmp	r3, #0
3000c7cc:	1a000001 	bne	3000c7d8 <acoral_strstr+0x7c>
			return (acoral_char *) s1;
3000c7d0:	e59d3004 	ldr	r3, [sp, #4]
3000c7d4:	ea000007 	b	3000c7f8 <acoral_strstr+0x9c>
		s1++;
3000c7d8:	e59d3004 	ldr	r3, [sp, #4]
3000c7dc:	e2833001 	add	r3, r3, #1
3000c7e0:	e58d3004 	str	r3, [sp, #4]

	l2 = acoral_str_len(s2);
	if (!l2)
		return (acoral_char *) s1;
	l1 = acoral_str_len(s1);
	while (l1 >= l2) {
3000c7e4:	e59d2008 	ldr	r2, [sp, #8]
3000c7e8:	e59d300c 	ldr	r3, [sp, #12]
3000c7ec:	e1520003 	cmp	r2, r3
3000c7f0:	aaffffeb 	bge	3000c7a4 <acoral_strstr+0x48>
		l1--;
		if (!acoral_memcmp(s1,s2,l2))
			return (acoral_char *) s1;
		s1++;
	}
	return NULL;
3000c7f4:	e3a03000 	mov	r3, #0
}
3000c7f8:	e1a00003 	mov	r0, r3
3000c7fc:	e28dd014 	add	sp, sp, #20
3000c800:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000c804:	e12fff1e 	bx	lr

3000c808 <acoral_memchr>:
 *
 * returns the address of the first occurrence of @c, or %NULL
 * if @c is not found
 */
void *acoral_memchr(const void *s, acoral_32 c, acoral_u32 n)
{
3000c808:	e24dd018 	sub	sp, sp, #24
3000c80c:	e58d000c 	str	r0, [sp, #12]
3000c810:	e58d1008 	str	r1, [sp, #8]
3000c814:	e58d2004 	str	r2, [sp, #4]
	const acoral_u8 *p = s;
3000c818:	e59d300c 	ldr	r3, [sp, #12]
3000c81c:	e58d3014 	str	r3, [sp, #20]
	while (n-- != 0) {
3000c820:	ea00000f 	b	3000c864 <acoral_memchr+0x5c>
        	if ((acoral_u8)c == *p++) {
3000c824:	e59d3008 	ldr	r3, [sp, #8]
3000c828:	e20320ff 	and	r2, r3, #255	; 0xff
3000c82c:	e59d3014 	ldr	r3, [sp, #20]
3000c830:	e5d33000 	ldrb	r3, [r3]
3000c834:	e1520003 	cmp	r2, r3
3000c838:	13a03000 	movne	r3, #0
3000c83c:	03a03001 	moveq	r3, #1
3000c840:	e20330ff 	and	r3, r3, #255	; 0xff
3000c844:	e59d2014 	ldr	r2, [sp, #20]
3000c848:	e2822001 	add	r2, r2, #1
3000c84c:	e58d2014 	str	r2, [sp, #20]
3000c850:	e3530000 	cmp	r3, #0
3000c854:	0a000002 	beq	3000c864 <acoral_memchr+0x5c>
			return (void *)(p-1);
3000c858:	e59d3014 	ldr	r3, [sp, #20]
3000c85c:	e2433001 	sub	r3, r3, #1
3000c860:	ea00000a 	b	3000c890 <acoral_memchr+0x88>
 * if @c is not found
 */
void *acoral_memchr(const void *s, acoral_32 c, acoral_u32 n)
{
	const acoral_u8 *p = s;
	while (n-- != 0) {
3000c864:	e59d3004 	ldr	r3, [sp, #4]
3000c868:	e3530000 	cmp	r3, #0
3000c86c:	03a03000 	moveq	r3, #0
3000c870:	13a03001 	movne	r3, #1
3000c874:	e20330ff 	and	r3, r3, #255	; 0xff
3000c878:	e59d2004 	ldr	r2, [sp, #4]
3000c87c:	e2422001 	sub	r2, r2, #1
3000c880:	e58d2004 	str	r2, [sp, #4]
3000c884:	e3530000 	cmp	r3, #0
3000c888:	1affffe5 	bne	3000c824 <acoral_memchr+0x1c>
        	if ((acoral_u8)c == *p++) {
			return (void *)(p-1);
		}
	}
	return NULL;
3000c88c:	e3a03000 	mov	r3, #0
}
3000c890:	e1a00003 	mov	r0, r3
3000c894:	e28dd018 	add	sp, sp, #24
3000c898:	e12fff1e 	bx	lr

3000c89c <acoral_rand>:
#include<acoral.h>
static acoral_u32 rand_seed;
acoral_u32 acoral_rand(void)
{
	rand_seed=(rand_seed*123+59)%65536;
3000c89c:	e59f3038 	ldr	r3, [pc, #56]	; 3000c8dc <acoral_rand+0x40>
3000c8a0:	e5932000 	ldr	r2, [r3]
3000c8a4:	e1a03002 	mov	r3, r2
3000c8a8:	e1a03283 	lsl	r3, r3, #5
3000c8ac:	e0623003 	rsb	r3, r2, r3
3000c8b0:	e1a03103 	lsl	r3, r3, #2
3000c8b4:	e0623003 	rsb	r3, r2, r3
3000c8b8:	e283303b 	add	r3, r3, #59	; 0x3b
3000c8bc:	e1a03803 	lsl	r3, r3, #16
3000c8c0:	e1a03823 	lsr	r3, r3, #16
3000c8c4:	e59f2010 	ldr	r2, [pc, #16]	; 3000c8dc <acoral_rand+0x40>
3000c8c8:	e5823000 	str	r3, [r2]
	return rand_seed;
3000c8cc:	e59f3008 	ldr	r3, [pc, #8]	; 3000c8dc <acoral_rand+0x40>
3000c8d0:	e5933000 	ldr	r3, [r3]
}
3000c8d4:	e1a00003 	mov	r0, r3
3000c8d8:	e12fff1e 	bx	lr
3000c8dc:	3000f580 	.word	0x3000f580

3000c8e0 <acoral_rand_start>:

void acoral_rand_start(void)
{
3000c8e0:	e92d4008 	push	{r3, lr}
	rand_seed=acoral_ticks;
3000c8e4:	ebffdf06 	bl	30004504 <acoral_get_ticks>
3000c8e8:	e1a02000 	mov	r2, r0
3000c8ec:	e59f3008 	ldr	r3, [pc, #8]	; 3000c8fc <acoral_rand_start+0x1c>
3000c8f0:	e5832000 	str	r2, [r3]
}
3000c8f4:	e8bd4008 	pop	{r3, lr}
3000c8f8:	e12fff1e 	bx	lr
3000c8fc:	3000f580 	.word	0x3000f580

3000c900 <plugin_init>:
#endif

#ifdef CFG_PLUGIN_GUI
	acoral_gui_init();
#endif
}
3000c900:	e12fff1e 	bx	lr

3000c904 <dummy>:
#include"acoral.h"
#include"../include/shell.h"
void dummy(void *args){
3000c904:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c908:	e24dd014 	sub	sp, sp, #20
3000c90c:	e58d0004 	str	r0, [sp, #4]
	int i=0;
3000c910:	e3a03000 	mov	r3, #0
3000c914:	e58d300c 	str	r3, [sp, #12]
	while(1){
		i++;
3000c918:	e59d300c 	ldr	r3, [sp, #12]
3000c91c:	e2833001 	add	r3, r3, #1
3000c920:	e58d300c 	str	r3, [sp, #12]
//		LedControl(i);
		acoral_delay_self(1000);
3000c924:	e3a00ffa 	mov	r0, #1000	; 0x3e8
3000c928:	ebffd80f 	bl	3000296c <acoral_delay_self>
	}
3000c92c:	eafffff9 	b	3000c918 <dummy+0x14>

3000c930 <user_main>:
#endif
#ifdef CFG_WEB_SERVER
	user_httpd();
#endif
//	acoral_create_thread(dummy,256,NULL,NULL,20,0);
}
3000c930:	e12fff1e 	bx	lr

3000c934 <parse_args>:
	PS_STRING,
	PS_ESCAPE
};

void parse_args(acoral_char *argstr, acoral_32 *argc_p, acoral_char **argv, acoral_char** resid,enum parse_state *stacked)
{
3000c934:	e24dd018 	sub	sp, sp, #24
3000c938:	e58d000c 	str	r0, [sp, #12]
3000c93c:	e58d1008 	str	r1, [sp, #8]
3000c940:	e58d2004 	str	r2, [sp, #4]
3000c944:	e58d3000 	str	r3, [sp]
	acoral_32 argc = 0;
3000c948:	e3a03000 	mov	r3, #0
3000c94c:	e58d3010 	str	r3, [sp, #16]
	acoral_char c;
	enum parse_state newState;
	enum parse_state stacked_state=*stacked;
3000c950:	e59d3018 	ldr	r3, [sp, #24]
3000c954:	e5d33000 	ldrb	r3, [r3]
3000c958:	e5cd3016 	strb	r3, [sp, #22]
	enum parse_state lastState = PS_WHITESPACE;
3000c95c:	e3a03000 	mov	r3, #0
3000c960:	e5cd3017 	strb	r3, [sp, #23]

	while ((c = *argstr) != 0&&argc<MAX_ARGS_NUM) {
3000c964:	ea000059 	b	3000cad0 <parse_args+0x19c>

		if (c == ';' && lastState != PS_STRING && lastState != PS_ESCAPE)
3000c968:	e5dd3014 	ldrb	r3, [sp, #20]
3000c96c:	e353003b 	cmp	r3, #59	; 0x3b
3000c970:	1a000005 	bne	3000c98c <parse_args+0x58>
3000c974:	e5dd3017 	ldrb	r3, [sp, #23]
3000c978:	e3530002 	cmp	r3, #2
3000c97c:	0a000002 	beq	3000c98c <parse_args+0x58>
3000c980:	e5dd3017 	ldrb	r3, [sp, #23]
3000c984:	e3530003 	cmp	r3, #3
3000c988:	1a00005a 	bne	3000caf8 <parse_args+0x1c4>
			break;

		if (lastState == PS_ESCAPE) {
3000c98c:	e5dd3017 	ldrb	r3, [sp, #23]
3000c990:	e3530003 	cmp	r3, #3
3000c994:	1a000002 	bne	3000c9a4 <parse_args+0x70>
			newState = stacked_state;
3000c998:	e5dd3016 	ldrb	r3, [sp, #22]
3000c99c:	e5cd3015 	strb	r3, [sp, #21]
3000c9a0:	ea000045 	b	3000cabc <parse_args+0x188>
		} else if (lastState == PS_STRING) {
3000c9a4:	e5dd3017 	ldrb	r3, [sp, #23]
3000c9a8:	e3530002 	cmp	r3, #2
3000c9ac:	1a00000b 	bne	3000c9e0 <parse_args+0xac>
			if (c == '"') {
3000c9b0:	e5dd3014 	ldrb	r3, [sp, #20]
3000c9b4:	e3530022 	cmp	r3, #34	; 0x22
3000c9b8:	1a000005 	bne	3000c9d4 <parse_args+0xa0>
				newState = PS_WHITESPACE;
3000c9bc:	e3a03000 	mov	r3, #0
3000c9c0:	e5cd3015 	strb	r3, [sp, #21]
				*argstr = 0;
3000c9c4:	e59d300c 	ldr	r3, [sp, #12]
3000c9c8:	e3a02000 	mov	r2, #0
3000c9cc:	e5c32000 	strb	r2, [r3]
			} else {
				newState = PS_STRING;
3000c9d0:	ea000039 	b	3000cabc <parse_args+0x188>
3000c9d4:	e3a03002 	mov	r3, #2
3000c9d8:	e5cd3015 	strb	r3, [sp, #21]
3000c9dc:	ea000036 	b	3000cabc <parse_args+0x188>
			}
		} else if ((c == ' ') || (c == '\t')) {
3000c9e0:	e5dd3014 	ldrb	r3, [sp, #20]
3000c9e4:	e3530020 	cmp	r3, #32
3000c9e8:	0a000002 	beq	3000c9f8 <parse_args+0xc4>
3000c9ec:	e5dd3014 	ldrb	r3, [sp, #20]
3000c9f0:	e3530009 	cmp	r3, #9
3000c9f4:	1a000005 	bne	3000ca10 <parse_args+0xdc>
			*argstr = 0;
3000c9f8:	e59d300c 	ldr	r3, [sp, #12]
3000c9fc:	e3a02000 	mov	r2, #0
3000ca00:	e5c32000 	strb	r2, [r3]
			newState = PS_WHITESPACE;
3000ca04:	e3a03000 	mov	r3, #0
3000ca08:	e5cd3015 	strb	r3, [sp, #21]
				newState = PS_WHITESPACE;
				*argstr = 0;
			} else {
				newState = PS_STRING;
			}
		} else if ((c == ' ') || (c == '\t')) {
3000ca0c:	ea00002a 	b	3000cabc <parse_args+0x188>
			*argstr = 0;
			newState = PS_WHITESPACE;
		} else if (c == '"') {
3000ca10:	e5dd3014 	ldrb	r3, [sp, #20]
3000ca14:	e3530022 	cmp	r3, #34	; 0x22
3000ca18:	1a000011 	bne	3000ca64 <parse_args+0x130>
			newState = PS_STRING;
3000ca1c:	e3a03002 	mov	r3, #2
3000ca20:	e5cd3015 	strb	r3, [sp, #21]
			*argstr++ = 0;
3000ca24:	e59d300c 	ldr	r3, [sp, #12]
3000ca28:	e3a02000 	mov	r2, #0
3000ca2c:	e5c32000 	strb	r2, [r3]
3000ca30:	e59d300c 	ldr	r3, [sp, #12]
3000ca34:	e2833001 	add	r3, r3, #1
3000ca38:	e58d300c 	str	r3, [sp, #12]
			argv[argc++] = argstr;
3000ca3c:	e59d3010 	ldr	r3, [sp, #16]
3000ca40:	e1a02103 	lsl	r2, r3, #2
3000ca44:	e59d3004 	ldr	r3, [sp, #4]
3000ca48:	e0823003 	add	r3, r2, r3
3000ca4c:	e59d200c 	ldr	r2, [sp, #12]
3000ca50:	e5832000 	str	r2, [r3]
3000ca54:	e59d3010 	ldr	r3, [sp, #16]
3000ca58:	e2833001 	add	r3, r3, #1
3000ca5c:	e58d3010 	str	r3, [sp, #16]
3000ca60:	ea000015 	b	3000cabc <parse_args+0x188>
		} else if (c == '\\') {
3000ca64:	e5dd3014 	ldrb	r3, [sp, #20]
3000ca68:	e353005c 	cmp	r3, #92	; 0x5c
3000ca6c:	1a000004 	bne	3000ca84 <parse_args+0x150>
			stacked_state = lastState;
3000ca70:	e5dd3017 	ldrb	r3, [sp, #23]
3000ca74:	e5cd3016 	strb	r3, [sp, #22]
			newState = PS_ESCAPE;
3000ca78:	e3a03003 	mov	r3, #3
3000ca7c:	e5cd3015 	strb	r3, [sp, #21]
3000ca80:	ea00000d 	b	3000cabc <parse_args+0x188>
		} else {
			if (lastState == PS_WHITESPACE) {
3000ca84:	e5dd3017 	ldrb	r3, [sp, #23]
3000ca88:	e3530000 	cmp	r3, #0
3000ca8c:	1a000008 	bne	3000cab4 <parse_args+0x180>
				argv[argc++] = argstr;
3000ca90:	e59d3010 	ldr	r3, [sp, #16]
3000ca94:	e1a02103 	lsl	r2, r3, #2
3000ca98:	e59d3004 	ldr	r3, [sp, #4]
3000ca9c:	e0823003 	add	r3, r2, r3
3000caa0:	e59d200c 	ldr	r2, [sp, #12]
3000caa4:	e5832000 	str	r2, [r3]
3000caa8:	e59d3010 	ldr	r3, [sp, #16]
3000caac:	e2833001 	add	r3, r3, #1
3000cab0:	e58d3010 	str	r3, [sp, #16]
			}
			newState = PS_TOKEN;
3000cab4:	e3a03001 	mov	r3, #1
3000cab8:	e5cd3015 	strb	r3, [sp, #21]
		}

		lastState = newState;
3000cabc:	e5dd3015 	ldrb	r3, [sp, #21]
3000cac0:	e5cd3017 	strb	r3, [sp, #23]
		argstr++;
3000cac4:	e59d300c 	ldr	r3, [sp, #12]
3000cac8:	e2833001 	add	r3, r3, #1
3000cacc:	e58d300c 	str	r3, [sp, #12]
	acoral_char c;
	enum parse_state newState;
	enum parse_state stacked_state=*stacked;
	enum parse_state lastState = PS_WHITESPACE;

	while ((c = *argstr) != 0&&argc<MAX_ARGS_NUM) {
3000cad0:	e59d300c 	ldr	r3, [sp, #12]
3000cad4:	e5d33000 	ldrb	r3, [r3]
3000cad8:	e5cd3014 	strb	r3, [sp, #20]
3000cadc:	e5dd3014 	ldrb	r3, [sp, #20]
3000cae0:	e3530000 	cmp	r3, #0
3000cae4:	0a000004 	beq	3000cafc <parse_args+0x1c8>
3000cae8:	e59d3010 	ldr	r3, [sp, #16]
3000caec:	e3530007 	cmp	r3, #7
3000caf0:	daffff9c 	ble	3000c968 <parse_args+0x34>
3000caf4:	ea000000 	b	3000cafc <parse_args+0x1c8>

		if (c == ';' && lastState != PS_STRING && lastState != PS_ESCAPE)
			break;
3000caf8:	e1a00000 	nop			; (mov r0, r0)

		lastState = newState;
		argstr++;
	}

	argv[argc] = NULL;
3000cafc:	e59d3010 	ldr	r3, [sp, #16]
3000cb00:	e1a02103 	lsl	r2, r3, #2
3000cb04:	e59d3004 	ldr	r3, [sp, #4]
3000cb08:	e0823003 	add	r3, r2, r3
3000cb0c:	e3a02000 	mov	r2, #0
3000cb10:	e5832000 	str	r2, [r3]
	if (argc_p != NULL)
3000cb14:	e59d3008 	ldr	r3, [sp, #8]
3000cb18:	e3530000 	cmp	r3, #0
3000cb1c:	0a000002 	beq	3000cb2c <parse_args+0x1f8>
		*argc_p = argc;
3000cb20:	e59d3008 	ldr	r3, [sp, #8]
3000cb24:	e59d2010 	ldr	r2, [sp, #16]
3000cb28:	e5832000 	str	r2, [r3]

	if (*argstr == ';') {
3000cb2c:	e59d300c 	ldr	r3, [sp, #12]
3000cb30:	e5d33000 	ldrb	r3, [r3]
3000cb34:	e353003b 	cmp	r3, #59	; 0x3b
3000cb38:	1a000005 	bne	3000cb54 <parse_args+0x220>
		*argstr++ = '\0';
3000cb3c:	e59d300c 	ldr	r3, [sp, #12]
3000cb40:	e3a02000 	mov	r2, #0
3000cb44:	e5c32000 	strb	r2, [r3]
3000cb48:	e59d300c 	ldr	r3, [sp, #12]
3000cb4c:	e2833001 	add	r3, r3, #1
3000cb50:	e58d300c 	str	r3, [sp, #12]
	}
	*resid = argstr;
3000cb54:	e59d3000 	ldr	r3, [sp]
3000cb58:	e59d200c 	ldr	r2, [sp, #12]
3000cb5c:	e5832000 	str	r2, [r3]
	*stacked=stacked_state;
3000cb60:	e59d3018 	ldr	r3, [sp, #24]
3000cb64:	e5dd2016 	ldrb	r2, [sp, #22]
3000cb68:	e5c32000 	strb	r2, [r3]
}
3000cb6c:	e28dd018 	add	sp, sp, #24
3000cb70:	e12fff1e 	bx	lr

3000cb74 <add_command>:

void add_command(acoral_shell_cmd_t *cmd)
{
3000cb74:	e24dd008 	sub	sp, sp, #8
3000cb78:	e58d0004 	str	r0, [sp, #4]
	if (head_cmd == NULL) {
3000cb7c:	e59f304c 	ldr	r3, [pc, #76]	; 3000cbd0 <add_command+0x5c>
3000cb80:	e5933000 	ldr	r3, [r3]
3000cb84:	e3530000 	cmp	r3, #0
3000cb88:	1a000007 	bne	3000cbac <add_command+0x38>
		head_cmd = tail_cmd = cmd;
3000cb8c:	e59f3040 	ldr	r3, [pc, #64]	; 3000cbd4 <add_command+0x60>
3000cb90:	e59d2004 	ldr	r2, [sp, #4]
3000cb94:	e5832000 	str	r2, [r3]
3000cb98:	e59f3034 	ldr	r3, [pc, #52]	; 3000cbd4 <add_command+0x60>
3000cb9c:	e5932000 	ldr	r2, [r3]
3000cba0:	e59f3028 	ldr	r3, [pc, #40]	; 3000cbd0 <add_command+0x5c>
3000cba4:	e5832000 	str	r2, [r3]
3000cba8:	ea000006 	b	3000cbc8 <add_command+0x54>
	} else {
		tail_cmd->next = cmd;
3000cbac:	e59f3020 	ldr	r3, [pc, #32]	; 3000cbd4 <add_command+0x60>
3000cbb0:	e5933000 	ldr	r3, [r3]
3000cbb4:	e59d2004 	ldr	r2, [sp, #4]
3000cbb8:	e583200c 	str	r2, [r3, #12]
		tail_cmd = cmd;
3000cbbc:	e59f3010 	ldr	r3, [pc, #16]	; 3000cbd4 <add_command+0x60>
3000cbc0:	e59d2004 	ldr	r2, [sp, #4]
3000cbc4:	e5832000 	str	r2, [r3]
	}
}
3000cbc8:	e28dd008 	add	sp, sp, #8
3000cbcc:	e12fff1e 	bx	lr
3000cbd0:	3000fd04 	.word	0x3000fd04
3000cbd4:	30010658 	.word	0x30010658

3000cbd8 <find_cmd>:

acoral_shell_cmd_t *find_cmd(acoral_char *cmdname)
{
3000cbd8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cbdc:	e24dd014 	sub	sp, sp, #20
3000cbe0:	e58d0004 	str	r0, [sp, #4]
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
3000cbe4:	e59f305c 	ldr	r3, [pc, #92]	; 3000cc48 <find_cmd+0x70>
3000cbe8:	e5933000 	ldr	r3, [r3]
3000cbec:	e58d300c 	str	r3, [sp, #12]
	while(curr != NULL) {
3000cbf0:	ea00000c 	b	3000cc28 <find_cmd+0x50>
		if (acoral_str_cmp(curr->name, cmdname) == 0)
3000cbf4:	e59d300c 	ldr	r3, [sp, #12]
3000cbf8:	e5933000 	ldr	r3, [r3]
3000cbfc:	e1a00003 	mov	r0, r3
3000cc00:	e59d1004 	ldr	r1, [sp, #4]
3000cc04:	ebfffb78 	bl	3000b9ec <acoral_str_cmp>
3000cc08:	e1a03000 	mov	r3, r0
3000cc0c:	e3530000 	cmp	r3, #0
3000cc10:	1a000001 	bne	3000cc1c <find_cmd+0x44>
			return curr;
3000cc14:	e59d300c 	ldr	r3, [sp, #12]
3000cc18:	ea000006 	b	3000cc38 <find_cmd+0x60>
		curr = curr->next;
3000cc1c:	e59d300c 	ldr	r3, [sp, #12]
3000cc20:	e593300c 	ldr	r3, [r3, #12]
3000cc24:	e58d300c 	str	r3, [sp, #12]

acoral_shell_cmd_t *find_cmd(acoral_char *cmdname)
{
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
	while(curr != NULL) {
3000cc28:	e59d300c 	ldr	r3, [sp, #12]
3000cc2c:	e3530000 	cmp	r3, #0
3000cc30:	1affffef 	bne	3000cbf4 <find_cmd+0x1c>
		if (acoral_str_cmp(curr->name, cmdname) == 0)
			return curr;
		curr = curr->next;
	}
	return NULL;
3000cc34:	e3a03000 	mov	r3, #0
}
3000cc38:	e1a00003 	mov	r0, r3
3000cc3c:	e28dd014 	add	sp, sp, #20
3000cc40:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cc44:	e12fff1e 	bx	lr
3000cc48:	3000fd04 	.word	0x3000fd04

3000cc4c <execmd>:

void execmd(acoral_32 argc,acoral_char **argv)
{
3000cc4c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cc50:	e24dd014 	sub	sp, sp, #20
3000cc54:	e58d0004 	str	r0, [sp, #4]
3000cc58:	e58d1000 	str	r1, [sp]
	acoral_shell_cmd_t *cmd = find_cmd(argv[0]);
3000cc5c:	e59d3000 	ldr	r3, [sp]
3000cc60:	e5933000 	ldr	r3, [r3]
3000cc64:	e1a00003 	mov	r0, r3
3000cc68:	ebffffda 	bl	3000cbd8 <find_cmd>
3000cc6c:	e1a03000 	mov	r3, r0
3000cc70:	e58d300c 	str	r3, [sp, #12]
	if (cmd == NULL) {
3000cc74:	e59d300c 	ldr	r3, [sp, #12]
3000cc78:	e3530000 	cmp	r3, #0
3000cc7c:	1a000007 	bne	3000cca0 <execmd+0x54>
		acoral_print("Could not found '%s' command\r\n", argv[0]);
3000cc80:	e59d3000 	ldr	r3, [sp]
3000cc84:	e5933000 	ldr	r3, [r3]
3000cc88:	e59f0034 	ldr	r0, [pc, #52]	; 3000ccc4 <execmd+0x78>
3000cc8c:	e1a01003 	mov	r1, r3
3000cc90:	ebfff9e3 	bl	3000b424 <acoral_print>
		acoral_print("you can type 'help'\r\n"); 
3000cc94:	e59f002c 	ldr	r0, [pc, #44]	; 3000ccc8 <execmd+0x7c>
3000cc98:	ebfff9e1 	bl	3000b424 <acoral_print>
		return;
3000cc9c:	ea000005 	b	3000ccb8 <execmd+0x6c>
	}
	cmd->exe(argc, argv);
3000cca0:	e59d300c 	ldr	r3, [sp, #12]
3000cca4:	e5933004 	ldr	r3, [r3, #4]
3000cca8:	e59d0004 	ldr	r0, [sp, #4]
3000ccac:	e59d1000 	ldr	r1, [sp]
3000ccb0:	e1a0e00f 	mov	lr, pc
3000ccb4:	e12fff13 	bx	r3
}
3000ccb8:	e28dd014 	add	sp, sp, #20
3000ccbc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000ccc0:	e12fff1e 	bx	lr
3000ccc4:	3000ea24 	.word	0x3000ea24
3000ccc8:	3000ea44 	.word	0x3000ea44

3000cccc <cmd_exe>:


void cmd_exe(acoral_char *buf){
3000cccc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000ccd0:	e24dd044 	sub	sp, sp, #68	; 0x44
3000ccd4:	e58d000c 	str	r0, [sp, #12]
	acoral_32 argc;
	acoral_char *argv[MAX_ARGS_NUM];
	acoral_char *resid;
	enum parse_state stacked_state;
	while (*buf) {
3000ccd8:	ea000015 	b	3000cd34 <cmd_exe+0x68>
		acoral_memset(argv, 0, sizeof(argv));
3000ccdc:	e28d301c 	add	r3, sp, #28
3000cce0:	e1a00003 	mov	r0, r3
3000cce4:	e3a01000 	mov	r1, #0
3000cce8:	e3a02020 	mov	r2, #32
3000ccec:	ebfffdd7 	bl	3000c450 <acoral_memset>
		parse_args(buf, &argc, argv, &resid,&stacked_state);
3000ccf0:	e28d103c 	add	r1, sp, #60	; 0x3c
3000ccf4:	e28d201c 	add	r2, sp, #28
3000ccf8:	e28d3018 	add	r3, sp, #24
3000ccfc:	e28d0017 	add	r0, sp, #23
3000cd00:	e58d0000 	str	r0, [sp]
3000cd04:	e59d000c 	ldr	r0, [sp, #12]
3000cd08:	ebffff09 	bl	3000c934 <parse_args>
		if (argc > 0)
3000cd0c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000cd10:	e3530000 	cmp	r3, #0
3000cd14:	da000004 	ble	3000cd2c <cmd_exe+0x60>
			execmd(argc, (const acoral_char **)argv);
3000cd18:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000cd1c:	e28d301c 	add	r3, sp, #28
3000cd20:	e1a00002 	mov	r0, r2
3000cd24:	e1a01003 	mov	r1, r3
3000cd28:	ebffffc7 	bl	3000cc4c <execmd>
		buf = resid;
3000cd2c:	e59d3018 	ldr	r3, [sp, #24]
3000cd30:	e58d300c 	str	r3, [sp, #12]
void cmd_exe(acoral_char *buf){
	acoral_32 argc;
	acoral_char *argv[MAX_ARGS_NUM];
	acoral_char *resid;
	enum parse_state stacked_state;
	while (*buf) {
3000cd34:	e59d300c 	ldr	r3, [sp, #12]
3000cd38:	e5d33000 	ldrb	r3, [r3]
3000cd3c:	e3530000 	cmp	r3, #0
3000cd40:	1affffe5 	bne	3000ccdc <cmd_exe+0x10>
		parse_args(buf, &argc, argv, &resid,&stacked_state);
		if (argc > 0)
			execmd(argc, (const acoral_char **)argv);
		buf = resid;
	}	
}
3000cd44:	e28dd044 	add	sp, sp, #68	; 0x44
3000cd48:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cd4c:	e12fff1e 	bx	lr

3000cd50 <echo>:

void echo(acoral_char c){
3000cd50:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cd54:	e24dd00c 	sub	sp, sp, #12
3000cd58:	e1a03000 	mov	r3, r0
3000cd5c:	e5cd3007 	strb	r3, [sp, #7]
	acoral_putchar(c);
3000cd60:	e5dd3007 	ldrb	r3, [sp, #7]
3000cd64:	e1a00003 	mov	r0, r3
3000cd68:	ebfff9fb 	bl	3000b55c <acoral_putchar>
}
3000cd6c:	e28dd00c 	add	sp, sp, #12
3000cd70:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cd74:	e12fff1e 	bx	lr

3000cd78 <get_cmd>:

void get_cmd(acoral_char *cmd_buf){
3000cd78:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cd7c:	e24dd024 	sub	sp, sp, #36	; 0x24
3000cd80:	e58d000c 	str	r0, [sp, #12]
	acoral_u32 cur_pos;
	acoral_char c;
	acoral_u8 IsEcho=0;
3000cd84:	e3a03000 	mov	r3, #0
3000cd88:	e5cd3016 	strb	r3, [sp, #22]
	acoral_id console_id;
	console_id=acoral_cur_thread->console_id;
3000cd8c:	e59f31a8 	ldr	r3, [pc, #424]	; 3000cf3c <get_cmd+0x1c4>
3000cd90:	e5933000 	ldr	r3, [r3]
3000cd94:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000cd98:	e58d301c 	str	r3, [sp, #28]
	acoral_dev_config(console_id,CONSOLE_ECHO,&IsEcho,0);
3000cd9c:	e28d3016 	add	r3, sp, #22
3000cda0:	e59d001c 	ldr	r0, [sp, #28]
3000cda4:	e3a01001 	mov	r1, #1
3000cda8:	e1a02003 	mov	r2, r3
3000cdac:	e3a03000 	mov	r3, #0
3000cdb0:	eb000283 	bl	3000d7c4 <acoral_dev_config>
	cur_pos=0;
3000cdb4:	e3a03000 	mov	r3, #0
3000cdb8:	e58d3018 	str	r3, [sp, #24]
3000cdbc:	ea000000 	b	3000cdc4 <get_cmd+0x4c>
						echo(c);
					cur_pos++;
				}
				break;
		}
	}
3000cdc0:	e1a00000 	nop			; (mov r0, r0)
	acoral_id console_id;
	console_id=acoral_cur_thread->console_id;
	acoral_dev_config(console_id,CONSOLE_ECHO,&IsEcho,0);
	cur_pos=0;
	while(1){
		while(acoral_dev_read(console_id,&c,1,0,0)<1);
3000cdc4:	e28d3017 	add	r3, sp, #23
3000cdc8:	e3a02000 	mov	r2, #0
3000cdcc:	e58d2000 	str	r2, [sp]
3000cdd0:	e59d001c 	ldr	r0, [sp, #28]
3000cdd4:	e1a01003 	mov	r1, r3
3000cdd8:	e3a02001 	mov	r2, #1
3000cddc:	e3a03000 	mov	r3, #0
3000cde0:	eb000251 	bl	3000d72c <acoral_dev_read>
3000cde4:	e1a03000 	mov	r3, r0
3000cde8:	e3530000 	cmp	r3, #0
3000cdec:	dafffff4 	ble	3000cdc4 <get_cmd+0x4c>
		switch (c) {
3000cdf0:	e5dd3017 	ldrb	r3, [sp, #23]
3000cdf4:	e353000a 	cmp	r3, #10
3000cdf8:	0a000028 	beq	3000cea0 <get_cmd+0x128>
3000cdfc:	e353000a 	cmp	r3, #10
3000ce00:	ca000007 	bgt	3000ce24 <get_cmd+0xac>
3000ce04:	e3530000 	cmp	r3, #0
3000ce08:	0a000024 	beq	3000cea0 <get_cmd+0x128>
3000ce0c:	e3530000 	cmp	r3, #0
3000ce10:	ba000036 	blt	3000cef0 <get_cmd+0x178>
3000ce14:	e2433006 	sub	r3, r3, #6
3000ce18:	e3530002 	cmp	r3, #2
3000ce1c:	8a000033 	bhi	3000cef0 <get_cmd+0x178>
3000ce20:	ea000009 	b	3000ce4c <get_cmd+0xd4>
3000ce24:	e3530018 	cmp	r3, #24
3000ce28:	0a00002d 	beq	3000cee4 <get_cmd+0x16c>
3000ce2c:	e3530018 	cmp	r3, #24
3000ce30:	ca000002 	bgt	3000ce40 <get_cmd+0xc8>
3000ce34:	e353000d 	cmp	r3, #13
3000ce38:	0a000018 	beq	3000cea0 <get_cmd+0x128>
3000ce3c:	ea00002b 	b	3000cef0 <get_cmd+0x178>
3000ce40:	e243307e 	sub	r3, r3, #126	; 0x7e
3000ce44:	e3530001 	cmp	r3, #1
3000ce48:	8a000028 	bhi	3000cef0 <get_cmd+0x178>
			case 0x08:
			case 0x06:
			case 0x07:
			case 0x7E:
			case 0x7F:
				if (cur_pos) {
3000ce4c:	e59d3018 	ldr	r3, [sp, #24]
3000ce50:	e3530000 	cmp	r3, #0
3000ce54:	0a00000b 	beq	3000ce88 <get_cmd+0x110>
					cur_pos--;
3000ce58:	e59d3018 	ldr	r3, [sp, #24]
3000ce5c:	e2433001 	sub	r3, r3, #1
3000ce60:	e58d3018 	str	r3, [sp, #24]
					if(IsEcho){
3000ce64:	e5dd3016 	ldrb	r3, [sp, #22]
3000ce68:	e3530000 	cmp	r3, #0
3000ce6c:	0a000005 	beq	3000ce88 <get_cmd+0x110>
						echo(0x08);
3000ce70:	e3a00008 	mov	r0, #8
3000ce74:	ebffffb5 	bl	3000cd50 <echo>
						echo(' ');
3000ce78:	e3a00020 	mov	r0, #32
3000ce7c:	ebffffb3 	bl	3000cd50 <echo>
						echo(0x08);
3000ce80:	e3a00008 	mov	r0, #8
3000ce84:	ebffffb1 	bl	3000cd50 <echo>
					}
				}
				cmd_buf[cur_pos] = '\0';
3000ce88:	e59d200c 	ldr	r2, [sp, #12]
3000ce8c:	e59d3018 	ldr	r3, [sp, #24]
3000ce90:	e0823003 	add	r3, r2, r3
3000ce94:	e3a02000 	mov	r2, #0
3000ce98:	e5c32000 	strb	r2, [r3]
				break;
3000ce9c:	ea000025 	b	3000cf38 <get_cmd+0x1c0>
			case '\r':
			case '\n':
			case '\0':
				echo('\r');
3000cea0:	e3a0000d 	mov	r0, #13
3000cea4:	ebffffa9 	bl	3000cd50 <echo>
				echo('\n');
3000cea8:	e3a0000a 	mov	r0, #10
3000ceac:	ebffffa7 	bl	3000cd50 <echo>
				cmd_buf[cur_pos]='\0';
3000ceb0:	e59d200c 	ldr	r2, [sp, #12]
3000ceb4:	e59d3018 	ldr	r3, [sp, #24]
3000ceb8:	e0823003 	add	r3, r2, r3
3000cebc:	e3a02000 	mov	r2, #0
3000cec0:	e5c32000 	strb	r2, [r3]
				acoral_dev_config(console_id,CONSOLE_BUF_CLEAR,NULL,0);
3000cec4:	e59d001c 	ldr	r0, [sp, #28]
3000cec8:	e3a01004 	mov	r1, #4
3000cecc:	e3a02000 	mov	r2, #0
3000ced0:	e3a03000 	mov	r3, #0
3000ced4:	eb00023a 	bl	3000d7c4 <acoral_dev_config>
					cur_pos++;
				}
				break;
		}
	}
}
3000ced8:	e28dd024 	add	sp, sp, #36	; 0x24
3000cedc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cee0:	e12fff1e 	bx	lr
				echo('\n');
				cmd_buf[cur_pos]='\0';
				acoral_dev_config(console_id,CONSOLE_BUF_CLEAR,NULL,0);
				return;
			case 'x'-'a'+1:
				cur_pos = 0;
3000cee4:	e3a03000 	mov	r3, #0
3000cee8:	e58d3018 	str	r3, [sp, #24]
				break;
3000ceec:	ea000011 	b	3000cf38 <get_cmd+0x1c0>

			default:
				if (cur_pos < BUF_SIZE) {
3000cef0:	e59d3018 	ldr	r3, [sp, #24]
3000cef4:	e353007f 	cmp	r3, #127	; 0x7f
3000cef8:	8affffb0 	bhi	3000cdc0 <get_cmd+0x48>
					cmd_buf[cur_pos] = c;
3000cefc:	e59d200c 	ldr	r2, [sp, #12]
3000cf00:	e59d3018 	ldr	r3, [sp, #24]
3000cf04:	e0823003 	add	r3, r2, r3
3000cf08:	e5dd2017 	ldrb	r2, [sp, #23]
3000cf0c:	e5c32000 	strb	r2, [r3]
					if(IsEcho)
3000cf10:	e5dd3016 	ldrb	r3, [sp, #22]
3000cf14:	e3530000 	cmp	r3, #0
3000cf18:	0a000002 	beq	3000cf28 <get_cmd+0x1b0>
						echo(c);
3000cf1c:	e5dd3017 	ldrb	r3, [sp, #23]
3000cf20:	e1a00003 	mov	r0, r3
3000cf24:	ebffff89 	bl	3000cd50 <echo>
					cur_pos++;
3000cf28:	e59d3018 	ldr	r3, [sp, #24]
3000cf2c:	e2833001 	add	r3, r3, #1
3000cf30:	e58d3018 	str	r3, [sp, #24]
				}
				break;
		}
	}
3000cf34:	eaffffa2 	b	3000cdc4 <get_cmd+0x4c>
3000cf38:	eaffffa1 	b	3000cdc4 <get_cmd+0x4c>
3000cf3c:	30010630 	.word	0x30010630

3000cf40 <acoral_shell_init>:
}

#define SHELL_STACK_SIZE 1024
void acoral_shell_init(){
3000cf40:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cf44:	e24dd01c 	sub	sp, sp, #28
	acoral_comm_policy_data_t data;
	head_cmd=NULL;
3000cf48:	e59f3070 	ldr	r3, [pc, #112]	; 3000cfc0 <acoral_shell_init+0x80>
3000cf4c:	e3a02000 	mov	r2, #0
3000cf50:	e5832000 	str	r2, [r3]
	tail_cmd=NULL;
3000cf54:	e59f3068 	ldr	r3, [pc, #104]	; 3000cfc4 <acoral_shell_init+0x84>
3000cf58:	e3a02000 	mov	r2, #0
3000cf5c:	e5832000 	str	r2, [r3]
	cmd_init();
3000cf60:	eb000094 	bl	3000d1b8 <cmd_init>
#ifdef CFG_UART_SHELL
	data.cpu=acoral_current_cpu;
3000cf64:	e3a03000 	mov	r3, #0
3000cf68:	e5cd3014 	strb	r3, [sp, #20]
	data.prio=ACORAL_TMP_PRIO;
3000cf6c:	e3a03045 	mov	r3, #69	; 0x45
3000cf70:	e5cd3015 	strb	r3, [sp, #21]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
3000cf74:	e3a03004 	mov	r3, #4
3000cf78:	e5cd3016 	strb	r3, [sp, #22]
	acoral_create_thread_ext(acoral_shell_enter,SHELL_STACK_SIZE,(void *)acoral_cur_thread->console_id,"shell",NULL,ACORAL_SCHED_POLICY_COMM,&data);
3000cf7c:	e59f3044 	ldr	r3, [pc, #68]	; 3000cfc8 <acoral_shell_init+0x88>
3000cf80:	e5933000 	ldr	r3, [r3]
3000cf84:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000cf88:	e3a02000 	mov	r2, #0
3000cf8c:	e58d2000 	str	r2, [sp]
3000cf90:	e3a02015 	mov	r2, #21
3000cf94:	e58d2004 	str	r2, [sp, #4]
3000cf98:	e28d2014 	add	r2, sp, #20
3000cf9c:	e58d2008 	str	r2, [sp, #8]
3000cfa0:	e59f0024 	ldr	r0, [pc, #36]	; 3000cfcc <acoral_shell_init+0x8c>
3000cfa4:	e3a01b01 	mov	r1, #1024	; 0x400
3000cfa8:	e1a02003 	mov	r2, r3
3000cfac:	e59f301c 	ldr	r3, [pc, #28]	; 3000cfd0 <acoral_shell_init+0x90>
3000cfb0:	ebffd325 	bl	30001c4c <create_thread_ext>
#endif
}
3000cfb4:	e28dd01c 	add	sp, sp, #28
3000cfb8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cfbc:	e12fff1e 	bx	lr
3000cfc0:	3000fd04 	.word	0x3000fd04
3000cfc4:	30010658 	.word	0x30010658
3000cfc8:	30010630 	.word	0x30010630
3000cfcc:	3000cff8 	.word	0x3000cff8
3000cfd0:	3000ea5c 	.word	0x3000ea5c

3000cfd4 <acoral_shell_exit>:

void acoral_shell_exit(void *ptr){
3000cfd4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cfd8:	e24dd00c 	sub	sp, sp, #12
3000cfdc:	e58d0004 	str	r0, [sp, #4]
	acoral_free(ptr);
3000cfe0:	e59d0004 	ldr	r0, [sp, #4]
3000cfe4:	ebffe5aa 	bl	30006694 <buddy_free>
	acoral_thread_exit();
3000cfe8:	ebffd69e 	bl	30002a68 <acoral_thread_exit>
}
3000cfec:	e28dd00c 	add	sp, sp, #12
3000cff0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cff4:	e12fff1e 	bx	lr

3000cff8 <acoral_shell_enter>:

void acoral_shell_enter(void *args){
3000cff8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cffc:	e24dd014 	sub	sp, sp, #20
3000d000:	e58d0004 	str	r0, [sp, #4]
	acoral_char *cmd_buf;
	acoral_set_thread_console((acoral_id)args);
3000d004:	e59d3004 	ldr	r3, [sp, #4]
3000d008:	e1a00003 	mov	r0, r3
3000d00c:	ebffd7c4 	bl	30002f24 <acoral_set_thread_console>
	if(acoral_cur_thread->console_id<0){
3000d010:	e59f306c 	ldr	r3, [pc, #108]	; 3000d084 <acoral_shell_enter+0x8c>
3000d014:	e5933000 	ldr	r3, [r3]
3000d018:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000d01c:	e3530000 	cmp	r3, #0
3000d020:	aa000004 	bge	3000d038 <acoral_shell_enter+0x40>
		acoral_prints("The thread have no Console\n");
3000d024:	e59f005c 	ldr	r0, [pc, #92]	; 3000d088 <acoral_shell_enter+0x90>
3000d028:	ebfff920 	bl	3000b4b0 <acoral_prints>
		acoral_prints("aCoral:>");
		get_cmd(cmd_buf);
		if(cmd_buf[0])
			cmd_exe(cmd_buf);
	}
}
3000d02c:	e28dd014 	add	sp, sp, #20
3000d030:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d034:	e12fff1e 	bx	lr
	acoral_set_thread_console((acoral_id)args);
	if(acoral_cur_thread->console_id<0){
		acoral_prints("The thread have no Console\n");
		return;
	}
	cmd_buf=acoral_malloc(sizeof(BUF_SIZE));
3000d038:	e3a00004 	mov	r0, #4
3000d03c:	ebffe55c 	bl	300065b4 <buddy_malloc>
3000d040:	e1a03000 	mov	r3, r0
3000d044:	e58d300c 	str	r3, [sp, #12]
3000d048:	ea000000 	b	3000d050 <acoral_shell_enter+0x58>
		acoral_prints("\r\n");
		acoral_prints("aCoral:>");
		get_cmd(cmd_buf);
		if(cmd_buf[0])
			cmd_exe(cmd_buf);
	}
3000d04c:	e1a00000 	nop			; (mov r0, r0)
		acoral_prints("The thread have no Console\n");
		return;
	}
	cmd_buf=acoral_malloc(sizeof(BUF_SIZE));
	while(1){
		acoral_prints("\r\n");
3000d050:	e59f0034 	ldr	r0, [pc, #52]	; 3000d08c <acoral_shell_enter+0x94>
3000d054:	ebfff915 	bl	3000b4b0 <acoral_prints>
		acoral_prints("aCoral:>");
3000d058:	e59f0030 	ldr	r0, [pc, #48]	; 3000d090 <acoral_shell_enter+0x98>
3000d05c:	ebfff913 	bl	3000b4b0 <acoral_prints>
		get_cmd(cmd_buf);
3000d060:	e59d000c 	ldr	r0, [sp, #12]
3000d064:	ebffff43 	bl	3000cd78 <get_cmd>
		if(cmd_buf[0])
3000d068:	e59d300c 	ldr	r3, [sp, #12]
3000d06c:	e5d33000 	ldrb	r3, [r3]
3000d070:	e3530000 	cmp	r3, #0
3000d074:	0afffff4 	beq	3000d04c <acoral_shell_enter+0x54>
			cmd_exe(cmd_buf);
3000d078:	e59d000c 	ldr	r0, [sp, #12]
3000d07c:	ebffff12 	bl	3000cccc <cmd_exe>
	}
3000d080:	eafffff2 	b	3000d050 <acoral_shell_enter+0x58>
3000d084:	30010630 	.word	0x30010630
3000d088:	3000ea64 	.word	0x3000ea64
3000d08c:	3000ea80 	.word	0x3000ea80
3000d090:	3000ea84 	.word	0x3000ea84

3000d094 <malloc_scan>:
#include<kernel.h>
#include"../include/shell.h"
#include"console.h"
void malloc_scan(acoral_32 argc,acoral_char **argv){
3000d094:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d098:	e24dd00c 	sub	sp, sp, #12
3000d09c:	e58d0004 	str	r0, [sp, #4]
3000d0a0:	e58d1000 	str	r1, [sp]
	acoral_mem_scan();
3000d0a4:	ebffe151 	bl	300055f0 <buddy_scan>
}
3000d0a8:	e28dd00c 	add	sp, sp, #12
3000d0ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d0b0:	e12fff1e 	bx	lr

3000d0b4 <malloc_scan2>:
	malloc_scan,
	"View the first Level Memory Managment Info",
	NULL
};

void malloc_scan2(acoral_32 argc,acoral_char **argv){
3000d0b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d0b8:	e24dd00c 	sub	sp, sp, #12
3000d0bc:	e58d0004 	str	r0, [sp, #4]
3000d0c0:	e58d1000 	str	r1, [sp]
	acoral_mem_scan2();
3000d0c4:	ebffe83a 	bl	300071b4 <v_mem_scan>
}
3000d0c8:	e28dd00c 	add	sp, sp, #12
3000d0cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d0d0:	e12fff1e 	bx	lr

3000d0d4 <help>:
	"View the seconde Level Memory Managment Info",
	NULL
};

extern acoral_shell_cmd_t *head_cmd;
void help(acoral_32 argc,acoral_char **argv){
3000d0d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d0d8:	e24dd014 	sub	sp, sp, #20
3000d0dc:	e58d0004 	str	r0, [sp, #4]
3000d0e0:	e58d1000 	str	r1, [sp]
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
3000d0e4:	e59f304c 	ldr	r3, [pc, #76]	; 3000d138 <help+0x64>
3000d0e8:	e5933000 	ldr	r3, [r3]
3000d0ec:	e58d300c 	str	r3, [sp, #12]
	while(curr != NULL) {
3000d0f0:	ea00000a 	b	3000d120 <help+0x4c>
		acoral_print("%s  %s\n",curr->name,curr->comment);
3000d0f4:	e59d300c 	ldr	r3, [sp, #12]
3000d0f8:	e5932000 	ldr	r2, [r3]
3000d0fc:	e59d300c 	ldr	r3, [sp, #12]
3000d100:	e5933008 	ldr	r3, [r3, #8]
3000d104:	e59f0030 	ldr	r0, [pc, #48]	; 3000d13c <help+0x68>
3000d108:	e1a01002 	mov	r1, r2
3000d10c:	e1a02003 	mov	r2, r3
3000d110:	ebfff8c3 	bl	3000b424 <acoral_print>
		curr = curr->next;
3000d114:	e59d300c 	ldr	r3, [sp, #12]
3000d118:	e593300c 	ldr	r3, [r3, #12]
3000d11c:	e58d300c 	str	r3, [sp, #12]

extern acoral_shell_cmd_t *head_cmd;
void help(acoral_32 argc,acoral_char **argv){
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
	while(curr != NULL) {
3000d120:	e59d300c 	ldr	r3, [sp, #12]
3000d124:	e3530000 	cmp	r3, #0
3000d128:	1afffff1 	bne	3000d0f4 <help+0x20>
		acoral_print("%s  %s\n",curr->name,curr->comment);
		curr = curr->next;
	}
}
3000d12c:	e28dd014 	add	sp, sp, #20
3000d130:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d134:	e12fff1e 	bx	lr
3000d138:	3000fd04 	.word	0x3000fd04
3000d13c:	3000eb00 	.word	0x3000eb00

3000d140 <exit>:
	help,
	"View all Shell Command info",
	NULL
};

void exit(acoral_32 argc,acoral_char **argv){
3000d140:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d144:	e24dd00c 	sub	sp, sp, #12
3000d148:	e58d0004 	str	r0, [sp, #4]
3000d14c:	e58d1000 	str	r1, [sp]
	acoral_dev_config(acoral_cur_thread->console_id,CONSOLE_EXIT,NULL,0);
3000d150:	e59f3034 	ldr	r3, [pc, #52]	; 3000d18c <exit+0x4c>
3000d154:	e5933000 	ldr	r3, [r3]
3000d158:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000d15c:	e1a00003 	mov	r0, r3
3000d160:	e3a01003 	mov	r1, #3
3000d164:	e3a02000 	mov	r2, #0
3000d168:	e3a03000 	mov	r3, #0
3000d16c:	eb000194 	bl	3000d7c4 <acoral_dev_config>
	acoral_shell_exit((void *)argv[0]);
3000d170:	e59d3000 	ldr	r3, [sp]
3000d174:	e5933000 	ldr	r3, [r3]
3000d178:	e1a00003 	mov	r0, r3
3000d17c:	ebffff94 	bl	3000cfd4 <acoral_shell_exit>
}
3000d180:	e28dd00c 	add	sp, sp, #12
3000d184:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d188:	e12fff1e 	bx	lr
3000d18c:	30010630 	.word	0x30010630

3000d190 <spg>:
	"exit",
	exit,
	"Exit Shell",
	NULL
};
void spg(acoral_32 argc,acoral_char **argv){
3000d190:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d194:	e24dd00c 	sub	sp, sp, #12
3000d198:	e58d0004 	str	r0, [sp, #4]
3000d19c:	e58d1000 	str	r1, [sp]
	acoral_prints("SPGGOGOGO!!!");
3000d1a0:	e59f000c 	ldr	r0, [pc, #12]	; 3000d1b4 <spg+0x24>
3000d1a4:	ebfff8c1 	bl	3000b4b0 <acoral_prints>
}
3000d1a8:	e28dd00c 	add	sp, sp, #12
3000d1ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d1b0:	e12fff1e 	bx	lr
3000d1b4:	3000eb40 	.word	0x3000eb40

3000d1b8 <cmd_init>:
};
#endif

extern acoral_shell_cmd_t dt_cmd;
extern fs_cmd_init();
void cmd_init(){
3000d1b8:	e92d4008 	push	{r3, lr}
	add_command(&mem_cmd);
3000d1bc:	e59f0028 	ldr	r0, [pc, #40]	; 3000d1ec <cmd_init+0x34>
3000d1c0:	ebfffe6b 	bl	3000cb74 <add_command>
	//add_command(&mem2_cmd);
	add_command(&dt_cmd);
3000d1c4:	e59f0024 	ldr	r0, [pc, #36]	; 3000d1f0 <cmd_init+0x38>
3000d1c8:	ebfffe69 	bl	3000cb74 <add_command>
	add_command(&spg_cmd);
3000d1cc:	e59f0020 	ldr	r0, [pc, #32]	; 3000d1f4 <cmd_init+0x3c>
3000d1d0:	ebfffe67 	bl	3000cb74 <add_command>
#ifdef CFG_PM
	add_command(&suspend_cmd);
#endif
	add_command(&exit_cmd);
3000d1d4:	e59f001c 	ldr	r0, [pc, #28]	; 3000d1f8 <cmd_init+0x40>
3000d1d8:	ebfffe65 	bl	3000cb74 <add_command>
	add_command(&help_cmd);
3000d1dc:	e59f0018 	ldr	r0, [pc, #24]	; 3000d1fc <cmd_init+0x44>
3000d1e0:	ebfffe63 	bl	3000cb74 <add_command>
#ifdef CFG_SHELL_FS_CMD
	fs_cmd_init();
#endif

}
3000d1e4:	e8bd4008 	pop	{r3, lr}
3000d1e8:	e12fff1e 	bx	lr
3000d1ec:	3000ecb4 	.word	0x3000ecb4
3000d1f0:	3000ed04 	.word	0x3000ed04
3000d1f4:	3000ecf4 	.word	0x3000ecf4
3000d1f8:	3000ece4 	.word	0x3000ece4
3000d1fc:	3000ecd4 	.word	0x3000ecd4

3000d200 <display_thread>:
#include<thread.h>
#include<policy.h>
#include<hal.h>
#include"../include/shell.h"
void display_thread(acoral_32 argc,acoral_char **argv){
3000d200:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d204:	e24dd01c 	sub	sp, sp, #28
3000d208:	e58d0004 	str	r0, [sp, #4]
3000d20c:	e58d1000 	str	r1, [sp]
	acoral_sr cpu_sr;	
	acoral_list_t *head,*tmp;
	acoral_thread_t * thread;
	head=&acoral_threads_queue.head;
3000d210:	e59f31b4 	ldr	r3, [pc, #436]	; 3000d3cc <display_thread+0x1cc>
3000d214:	e58d300c 	str	r3, [sp, #12]
	acoral_prints("\t\tSystem Thread Information\r\n");
3000d218:	e59f01b0 	ldr	r0, [pc, #432]	; 3000d3d0 <display_thread+0x1d0>
3000d21c:	ebfff8a3 	bl	3000b4b0 <acoral_prints>
	acoral_prints("------------------------------------------------------\r\n");
3000d220:	e59f01ac 	ldr	r0, [pc, #428]	; 3000d3d4 <display_thread+0x1d4>
3000d224:	ebfff8a1 	bl	3000b4b0 <acoral_prints>
	acoral_prints("Name\t\tType\t\tConsole\t\tState\r\n");
3000d228:	e59f01a8 	ldr	r0, [pc, #424]	; 3000d3d8 <display_thread+0x1d8>
3000d22c:	ebfff89f 	bl	3000b4b0 <acoral_prints>
	HAL_ENTER_CRITICAL();
3000d230:	ebffd12f 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000d234:	e1a03000 	mov	r3, r0
3000d238:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
3000d23c:	e59d300c 	ldr	r3, [sp, #12]
3000d240:	e5933000 	ldr	r3, [r3]
3000d244:	e58d3010 	str	r3, [sp, #16]
3000d248:	ea000054 	b	3000d3a0 <display_thread+0x1a0>
		thread=list_entry(tmp,acoral_thread_t,global_list);
3000d24c:	e59d3010 	ldr	r3, [sp, #16]
3000d250:	e2433028 	sub	r3, r3, #40	; 0x28
3000d254:	e58d3014 	str	r3, [sp, #20]
		acoral_print("%s\t\t",thread->name);
3000d258:	e59d3014 	ldr	r3, [sp, #20]
3000d25c:	e5933048 	ldr	r3, [r3, #72]	; 0x48
3000d260:	e59f0174 	ldr	r0, [pc, #372]	; 3000d3dc <display_thread+0x1dc>
3000d264:	e1a01003 	mov	r1, r3
3000d268:	ebfff86d 	bl	3000b424 <acoral_print>
		switch(thread->policy){
3000d26c:	e59d3014 	ldr	r3, [sp, #20]
3000d270:	e5d3300c 	ldrb	r3, [r3, #12]
3000d274:	e2433015 	sub	r3, r3, #21
3000d278:	e3530004 	cmp	r3, #4
3000d27c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
3000d280:	ea000012 	b	3000d2d0 <display_thread+0xd0>
3000d284:	3000d298 	.word	0x3000d298
3000d288:	3000d2b0 	.word	0x3000d2b0
3000d28c:	3000d2bc 	.word	0x3000d2bc
3000d290:	3000d2a4 	.word	0x3000d2a4
3000d294:	3000d2c8 	.word	0x3000d2c8
			case ACORAL_SCHED_POLICY_COMM:
				acoral_prints("Common\t\t");
3000d298:	e59f0140 	ldr	r0, [pc, #320]	; 3000d3e0 <display_thread+0x1e0>
3000d29c:	ebfff883 	bl	3000b4b0 <acoral_prints>
				break;
3000d2a0:	ea00000a 	b	3000d2d0 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_SLICE:
				acoral_prints("Slice\t\t");
3000d2a4:	e59f0138 	ldr	r0, [pc, #312]	; 3000d3e4 <display_thread+0x1e4>
3000d2a8:	ebfff880 	bl	3000b4b0 <acoral_prints>
				break;
3000d2ac:	ea000007 	b	3000d2d0 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_PERIOD:
				acoral_prints("Period\t\t");
3000d2b0:	e59f0130 	ldr	r0, [pc, #304]	; 3000d3e8 <display_thread+0x1e8>
3000d2b4:	ebfff87d 	bl	3000b4b0 <acoral_prints>
				break;
3000d2b8:	ea000004 	b	3000d2d0 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_RM:
				acoral_prints("RM\t\t");
3000d2bc:	e59f0128 	ldr	r0, [pc, #296]	; 3000d3ec <display_thread+0x1ec>
3000d2c0:	ebfff87a 	bl	3000b4b0 <acoral_prints>
				break;
3000d2c4:	ea000001 	b	3000d2d0 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_POSIX:
				acoral_prints("Posix\t\t");
3000d2c8:	e59f0120 	ldr	r0, [pc, #288]	; 3000d3f0 <display_thread+0x1f0>
3000d2cc:	ebfff877 	bl	3000b4b0 <acoral_prints>
			default:
				break;
		}
		acoral_print("%d\t\t",thread->console_id);
3000d2d0:	e59d3014 	ldr	r3, [sp, #20]
3000d2d4:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000d2d8:	e59f0114 	ldr	r0, [pc, #276]	; 3000d3f4 <display_thread+0x1f4>
3000d2dc:	e1a01003 	mov	r1, r3
3000d2e0:	ebfff84f 	bl	3000b424 <acoral_print>
		if(thread->state&ACORAL_THREAD_STATE_RUNNING)
3000d2e4:	e59d3014 	ldr	r3, [sp, #20]
3000d2e8:	e5d33004 	ldrb	r3, [r3, #4]
3000d2ec:	e2033004 	and	r3, r3, #4
3000d2f0:	e3530000 	cmp	r3, #0
3000d2f4:	0a000002 	beq	3000d304 <display_thread+0x104>
				acoral_prints("Running\t\t");
3000d2f8:	e59f00f8 	ldr	r0, [pc, #248]	; 3000d3f8 <display_thread+0x1f8>
3000d2fc:	ebfff86b 	bl	3000b4b0 <acoral_prints>
3000d300:	ea000021 	b	3000d38c <display_thread+0x18c>
		else if(thread->state&ACORAL_THREAD_STATE_READY)
3000d304:	e59d3014 	ldr	r3, [sp, #20]
3000d308:	e5d33004 	ldrb	r3, [r3, #4]
3000d30c:	e2033001 	and	r3, r3, #1
3000d310:	e20330ff 	and	r3, r3, #255	; 0xff
3000d314:	e3530000 	cmp	r3, #0
3000d318:	0a000002 	beq	3000d328 <display_thread+0x128>
				acoral_prints("Ready\t\t");
3000d31c:	e59f00d8 	ldr	r0, [pc, #216]	; 3000d3fc <display_thread+0x1fc>
3000d320:	ebfff862 	bl	3000b4b0 <acoral_prints>
3000d324:	ea000018 	b	3000d38c <display_thread+0x18c>
		else if(thread->state&ACORAL_THREAD_STATE_DELAY)
3000d328:	e59d3014 	ldr	r3, [sp, #20]
3000d32c:	e5d33004 	ldrb	r3, [r3, #4]
3000d330:	e2033020 	and	r3, r3, #32
3000d334:	e3530000 	cmp	r3, #0
3000d338:	0a000002 	beq	3000d348 <display_thread+0x148>
				acoral_prints("Delay\t\t");
3000d33c:	e59f00bc 	ldr	r0, [pc, #188]	; 3000d400 <display_thread+0x200>
3000d340:	ebfff85a 	bl	3000b4b0 <acoral_prints>
3000d344:	ea000010 	b	3000d38c <display_thread+0x18c>
		else if(thread->state&ACORAL_THREAD_STATE_SUSPEND)
3000d348:	e59d3014 	ldr	r3, [sp, #20]
3000d34c:	e5d33004 	ldrb	r3, [r3, #4]
3000d350:	e2033002 	and	r3, r3, #2
3000d354:	e3530000 	cmp	r3, #0
3000d358:	0a000002 	beq	3000d368 <display_thread+0x168>
				acoral_prints("Sleep\t\t");
3000d35c:	e59f00a0 	ldr	r0, [pc, #160]	; 3000d404 <display_thread+0x204>
3000d360:	ebfff852 	bl	3000b4b0 <acoral_prints>
3000d364:	ea000008 	b	3000d38c <display_thread+0x18c>
		else if(thread->state==ACORAL_THREAD_STATE_EXIT)
3000d368:	e59d3014 	ldr	r3, [sp, #20]
3000d36c:	e5d33004 	ldrb	r3, [r3, #4]
3000d370:	e3530008 	cmp	r3, #8
3000d374:	1a000002 	bne	3000d384 <display_thread+0x184>
				acoral_prints("Freeze\t\t");
3000d378:	e59f0088 	ldr	r0, [pc, #136]	; 3000d408 <display_thread+0x208>
3000d37c:	ebfff84b 	bl	3000b4b0 <acoral_prints>
3000d380:	ea000001 	b	3000d38c <display_thread+0x18c>
		else
				acoral_prints("Error\t\t");
3000d384:	e59f0080 	ldr	r0, [pc, #128]	; 3000d40c <display_thread+0x20c>
3000d388:	ebfff848 	bl	3000b4b0 <acoral_prints>
		acoral_prints("\r\n");
3000d38c:	e59f007c 	ldr	r0, [pc, #124]	; 3000d410 <display_thread+0x210>
3000d390:	ebfff846 	bl	3000b4b0 <acoral_prints>
	acoral_prints("\t\tSystem Thread Information\r\n");
	acoral_prints("------------------------------------------------------\r\n");
	acoral_prints("Name\t\tType\t\tConsole\t\tState\r\n");
	HAL_ENTER_CRITICAL();
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
3000d394:	e59d3010 	ldr	r3, [sp, #16]
3000d398:	e5933000 	ldr	r3, [r3]
3000d39c:	e58d3010 	str	r3, [sp, #16]
3000d3a0:	e59d2010 	ldr	r2, [sp, #16]
3000d3a4:	e59d300c 	ldr	r3, [sp, #12]
3000d3a8:	e1520003 	cmp	r2, r3
3000d3ac:	1affffa6 	bne	3000d24c <display_thread+0x4c>
				acoral_prints("Freeze\t\t");
		else
				acoral_prints("Error\t\t");
		acoral_prints("\r\n");
	}
	acoral_prints("------------------------------------------------------\r\n");
3000d3b0:	e59f001c 	ldr	r0, [pc, #28]	; 3000d3d4 <display_thread+0x1d4>
3000d3b4:	ebfff83d 	bl	3000b4b0 <acoral_prints>
	acoral_spin_unlock(&acoral_threads_queue.head.lock);
	HAL_EXIT_CRITICAL();
3000d3b8:	e59d0008 	ldr	r0, [sp, #8]
3000d3bc:	ebffd0ca 	bl	300016ec <HAL_INTR_RESTORE>
}
3000d3c0:	e28dd01c 	add	sp, sp, #28
3000d3c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d3c8:	e12fff1e 	bx	lr
3000d3cc:	3000fc5c 	.word	0x3000fc5c
3000d3d0:	3000eb60 	.word	0x3000eb60
3000d3d4:	3000eb80 	.word	0x3000eb80
3000d3d8:	3000ebbc 	.word	0x3000ebbc
3000d3dc:	3000ebdc 	.word	0x3000ebdc
3000d3e0:	3000ebe4 	.word	0x3000ebe4
3000d3e4:	3000ebf0 	.word	0x3000ebf0
3000d3e8:	3000ebf8 	.word	0x3000ebf8
3000d3ec:	3000ec04 	.word	0x3000ec04
3000d3f0:	3000ec0c 	.word	0x3000ec0c
3000d3f4:	3000ec14 	.word	0x3000ec14
3000d3f8:	3000ec1c 	.word	0x3000ec1c
3000d3fc:	3000ec28 	.word	0x3000ec28
3000d400:	3000ec30 	.word	0x3000ec30
3000d404:	3000ec38 	.word	0x3000ec38
3000d408:	3000ec40 	.word	0x3000ec40
3000d40c:	3000ec4c 	.word	0x3000ec4c
3000d410:	3000ec54 	.word	0x3000ec54

3000d414 <acoral_get_drv_ctrl_by_name>:
#define DRV_MAIN_ID_SHIFT 5
#define DRV_MAIN_ID(id) (id>>DRV_MAIN_ID_SHIFT)
#define DRV_CHK_ID(id) (DRV_MAIN_ID(id)>=0&&DRV_MAIN_ID(id)<ACORAL_DEV_NUM)
acoral_pool_ctrl_t acoral_drv_pool_ctrl;
acoral_drv_ctrl_t *drv_table[ACORAL_DEV_NUM];
acoral_drv_ctrl_t *acoral_get_drv_ctrl_by_name(acoral_char *name){
3000d414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d418:	e24dd014 	sub	sp, sp, #20
3000d41c:	e58d0004 	str	r0, [sp, #4]
  	acoral_u32 i;
	acoral_drv_ctrl_t *ctrl;
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d420:	e3a03000 	mov	r3, #0
3000d424:	e58d3008 	str	r3, [sp, #8]
3000d428:	ea000013 	b	3000d47c <acoral_get_drv_ctrl_by_name+0x68>
	  	ctrl=drv_table[i];	    
3000d42c:	e59d2008 	ldr	r2, [sp, #8]
3000d430:	e59f3064 	ldr	r3, [pc, #100]	; 3000d49c <acoral_get_drv_ctrl_by_name+0x88>
3000d434:	e7933102 	ldr	r3, [r3, r2, lsl #2]
3000d438:	e58d300c 	str	r3, [sp, #12]
		if(ctrl!=NULL&&!acoral_str_cmp(ctrl->name,name))
3000d43c:	e59d300c 	ldr	r3, [sp, #12]
3000d440:	e3530000 	cmp	r3, #0
3000d444:	0a000009 	beq	3000d470 <acoral_get_drv_ctrl_by_name+0x5c>
3000d448:	e59d300c 	ldr	r3, [sp, #12]
3000d44c:	e593300c 	ldr	r3, [r3, #12]
3000d450:	e1a00003 	mov	r0, r3
3000d454:	e59d1004 	ldr	r1, [sp, #4]
3000d458:	ebfff963 	bl	3000b9ec <acoral_str_cmp>
3000d45c:	e1a03000 	mov	r3, r0
3000d460:	e3530000 	cmp	r3, #0
3000d464:	1a000001 	bne	3000d470 <acoral_get_drv_ctrl_by_name+0x5c>
		   return ctrl;
3000d468:	e59d300c 	ldr	r3, [sp, #12]
3000d46c:	ea000006 	b	3000d48c <acoral_get_drv_ctrl_by_name+0x78>
acoral_pool_ctrl_t acoral_drv_pool_ctrl;
acoral_drv_ctrl_t *drv_table[ACORAL_DEV_NUM];
acoral_drv_ctrl_t *acoral_get_drv_ctrl_by_name(acoral_char *name){
  	acoral_u32 i;
	acoral_drv_ctrl_t *ctrl;
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d470:	e59d3008 	ldr	r3, [sp, #8]
3000d474:	e2833001 	add	r3, r3, #1
3000d478:	e58d3008 	str	r3, [sp, #8]
3000d47c:	e59d3008 	ldr	r3, [sp, #8]
3000d480:	e3530013 	cmp	r3, #19
3000d484:	9affffe8 	bls	3000d42c <acoral_get_drv_ctrl_by_name+0x18>
	  	ctrl=drv_table[i];	    
		if(ctrl!=NULL&&!acoral_str_cmp(ctrl->name,name))
		   return ctrl;
	}
	return NULL;
3000d488:	e3a03000 	mov	r3, #0
}
3000d48c:	e1a00003 	mov	r0, r3
3000d490:	e28dd014 	add	sp, sp, #20
3000d494:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d498:	e12fff1e 	bx	lr
3000d49c:	3000f590 	.word	0x3000f590

3000d4a0 <acoral_drv_register>:

acoral_err acoral_drv_register(acoral_dev_ops_t *ops,acoral_char *name){
3000d4a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d4a4:	e24dd01c 	sub	sp, sp, #28
3000d4a8:	e58d0004 	str	r0, [sp, #4]
3000d4ac:	e58d1000 	str	r1, [sp]
	acoral_u32 i;
	acoral_drv_ctrl_t *tmp,*ctrl;
	ctrl=acoral_alloc_drv();
3000d4b0:	eb000107 	bl	3000d8d4 <acoral_alloc_drv>
3000d4b4:	e1a03000 	mov	r3, r0
3000d4b8:	e58d3014 	str	r3, [sp, #20]
	if(ctrl==NULL)
3000d4bc:	e59d3014 	ldr	r3, [sp, #20]
3000d4c0:	e3530000 	cmp	r3, #0
3000d4c4:	1a000001 	bne	3000d4d0 <acoral_drv_register+0x30>
		return ACORAL_ERR_NO_DRV_RES;
3000d4c8:	e3a03005 	mov	r3, #5
3000d4cc:	ea000024 	b	3000d564 <acoral_drv_register+0xc4>
	ctrl->name=name;
3000d4d0:	e59d3014 	ldr	r3, [sp, #20]
3000d4d4:	e59d2000 	ldr	r2, [sp]
3000d4d8:	e583200c 	str	r2, [r3, #12]
	ctrl->ops=ops;
3000d4dc:	e59d3014 	ldr	r3, [sp, #20]
3000d4e0:	e59d2004 	ldr	r2, [sp, #4]
3000d4e4:	e5832004 	str	r2, [r3, #4]
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d4e8:	e3a03000 	mov	r3, #0
3000d4ec:	e58d300c 	str	r3, [sp, #12]
3000d4f0:	ea000012 	b	3000d540 <acoral_drv_register+0xa0>
	  	tmp=drv_table[i];	    
3000d4f4:	e59d200c 	ldr	r2, [sp, #12]
3000d4f8:	e59f3074 	ldr	r3, [pc, #116]	; 3000d574 <acoral_drv_register+0xd4>
3000d4fc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
3000d500:	e58d3010 	str	r3, [sp, #16]
		if(tmp==NULL){
3000d504:	e59d3010 	ldr	r3, [sp, #16]
3000d508:	e3530000 	cmp	r3, #0
3000d50c:	1a000008 	bne	3000d534 <acoral_drv_register+0x94>
			drv_table[i]=ctrl;
3000d510:	e59d200c 	ldr	r2, [sp, #12]
3000d514:	e59f3058 	ldr	r3, [pc, #88]	; 3000d574 <acoral_drv_register+0xd4>
3000d518:	e59d1014 	ldr	r1, [sp, #20]
3000d51c:	e7831102 	str	r1, [r3, r2, lsl #2]
			ctrl->drv_id=i<<DRV_MAIN_ID_SHIFT;
3000d520:	e59d300c 	ldr	r3, [sp, #12]
3000d524:	e1a02283 	lsl	r2, r3, #5
3000d528:	e59d3014 	ldr	r3, [sp, #20]
3000d52c:	e5832008 	str	r2, [r3, #8]
			break;
3000d530:	ea000005 	b	3000d54c <acoral_drv_register+0xac>
	ctrl=acoral_alloc_drv();
	if(ctrl==NULL)
		return ACORAL_ERR_NO_DRV_RES;
	ctrl->name=name;
	ctrl->ops=ops;
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d534:	e59d300c 	ldr	r3, [sp, #12]
3000d538:	e2833001 	add	r3, r3, #1
3000d53c:	e58d300c 	str	r3, [sp, #12]
3000d540:	e59d300c 	ldr	r3, [sp, #12]
3000d544:	e3530013 	cmp	r3, #19
3000d548:	9affffe9 	bls	3000d4f4 <acoral_drv_register+0x54>
			drv_table[i]=ctrl;
			ctrl->drv_id=i<<DRV_MAIN_ID_SHIFT;
			break;
		}
	}
	if(i==ACORAL_DEV_NUM)
3000d54c:	e59d300c 	ldr	r3, [sp, #12]
3000d550:	e3530014 	cmp	r3, #20
3000d554:	1a000001 	bne	3000d560 <acoral_drv_register+0xc0>
		return ACORAL_ERR_DRV_FULL;
3000d558:	e3a03005 	mov	r3, #5
3000d55c:	ea000000 	b	3000d564 <acoral_drv_register+0xc4>
	return 0;
3000d560:	e3a03000 	mov	r3, #0
}
3000d564:	e1a00003 	mov	r0, r3
3000d568:	e28dd01c 	add	sp, sp, #28
3000d56c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d570:	e12fff1e 	bx	lr
3000d574:	3000f590 	.word	0x3000f590

3000d578 <acoral_drv_unregister>:

void acoral_drv_unregister(acoral_id res_id){
3000d578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d57c:	e24dd014 	sub	sp, sp, #20
3000d580:	e58d0004 	str	r0, [sp, #4]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(res_id);
3000d584:	e59d0004 	ldr	r0, [sp, #4]
3000d588:	ebffd8b8 	bl	30003870 <acoral_get_res_by_id>
3000d58c:	e1a03000 	mov	r3, r0
3000d590:	e58d300c 	str	r3, [sp, #12]
	if(ctrl->ops!=NULL&&ctrl->ops->close!=NULL)
3000d594:	e59d300c 	ldr	r3, [sp, #12]
3000d598:	e5933004 	ldr	r3, [r3, #4]
3000d59c:	e3530000 	cmp	r3, #0
3000d5a0:	0a000009 	beq	3000d5cc <acoral_drv_unregister+0x54>
3000d5a4:	e59d300c 	ldr	r3, [sp, #12]
3000d5a8:	e5933004 	ldr	r3, [r3, #4]
3000d5ac:	e5933010 	ldr	r3, [r3, #16]
3000d5b0:	e3530000 	cmp	r3, #0
3000d5b4:	0a000004 	beq	3000d5cc <acoral_drv_unregister+0x54>
		ctrl->ops->close();
3000d5b8:	e59d300c 	ldr	r3, [sp, #12]
3000d5bc:	e5933004 	ldr	r3, [r3, #4]
3000d5c0:	e5933010 	ldr	r3, [r3, #16]
3000d5c4:	e1a0e00f 	mov	lr, pc
3000d5c8:	e12fff13 	bx	r3
	drv_table[DRV_MAIN_ID(ctrl->drv_id)]=NULL;
3000d5cc:	e59d300c 	ldr	r3, [sp, #12]
3000d5d0:	e5933008 	ldr	r3, [r3, #8]
3000d5d4:	e1a022a3 	lsr	r2, r3, #5
3000d5d8:	e59f301c 	ldr	r3, [pc, #28]	; 3000d5fc <acoral_drv_unregister+0x84>
3000d5dc:	e3a01000 	mov	r1, #0
3000d5e0:	e7831102 	str	r1, [r3, r2, lsl #2]
	acoral_release_res((acoral_res_t *)ctrl);
3000d5e4:	e59d300c 	ldr	r3, [sp, #12]
3000d5e8:	e1a00003 	mov	r0, r3
3000d5ec:	ebffd80b 	bl	30003620 <acoral_release_res>
}
3000d5f0:	e28dd014 	add	sp, sp, #20
3000d5f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d5f8:	e12fff1e 	bx	lr
3000d5fc:	3000f590 	.word	0x3000f590

3000d600 <acoral_dev_open>:

acoral_id acoral_dev_open(acoral_char *name){
3000d600:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d604:	e24dd014 	sub	sp, sp, #20
3000d608:	e58d0004 	str	r0, [sp, #4]
	acoral_drv_ctrl_t *ctrl=acoral_get_drv_ctrl_by_name(name);
3000d60c:	e59d0004 	ldr	r0, [sp, #4]
3000d610:	ebffff7f 	bl	3000d414 <acoral_get_drv_ctrl_by_name>
3000d614:	e1a03000 	mov	r3, r0
3000d618:	e58d300c 	str	r3, [sp, #12]
	if(ctrl==NULL)
3000d61c:	e59d300c 	ldr	r3, [sp, #12]
3000d620:	e3530000 	cmp	r3, #0
3000d624:	1a000001 	bne	3000d630 <acoral_dev_open+0x30>
		return ACORAL_DEV_ERR_ID;
3000d628:	e3e03000 	mvn	r3, #0
3000d62c:	ea000014 	b	3000d684 <acoral_dev_open+0x84>
	if(ctrl->ops!=NULL&&ctrl->ops->open!=NULL){
3000d630:	e59d300c 	ldr	r3, [sp, #12]
3000d634:	e5933004 	ldr	r3, [r3, #4]
3000d638:	e3530000 	cmp	r3, #0
3000d63c:	0a00000e 	beq	3000d67c <acoral_dev_open+0x7c>
3000d640:	e59d300c 	ldr	r3, [sp, #12]
3000d644:	e5933004 	ldr	r3, [r3, #4]
3000d648:	e5933000 	ldr	r3, [r3]
3000d64c:	e3530000 	cmp	r3, #0
3000d650:	0a000009 	beq	3000d67c <acoral_dev_open+0x7c>
		if(ctrl->ops->open()!=0)
3000d654:	e59d300c 	ldr	r3, [sp, #12]
3000d658:	e5933004 	ldr	r3, [r3, #4]
3000d65c:	e5933000 	ldr	r3, [r3]
3000d660:	e1a0e00f 	mov	lr, pc
3000d664:	e12fff13 	bx	r3
3000d668:	e1a03000 	mov	r3, r0
3000d66c:	e3530000 	cmp	r3, #0
3000d670:	0a000001 	beq	3000d67c <acoral_dev_open+0x7c>
			return ACORAL_DEV_ERR_ID;
3000d674:	e3e03000 	mvn	r3, #0
3000d678:	ea000001 	b	3000d684 <acoral_dev_open+0x84>
	}
	return ctrl->res.id;
3000d67c:	e59d300c 	ldr	r3, [sp, #12]
3000d680:	e5933000 	ldr	r3, [r3]
}
3000d684:	e1a00003 	mov	r0, r3
3000d688:	e28dd014 	add	sp, sp, #20
3000d68c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d690:	e12fff1e 	bx	lr

3000d694 <acoral_dev_write>:

acoral_32 acoral_dev_write(acoral_id id,void *data,acoral_size size,acoral_size offset,acoral_time time_out){
3000d694:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d698:	e24dd01c 	sub	sp, sp, #28
3000d69c:	e58d000c 	str	r0, [sp, #12]
3000d6a0:	e58d1008 	str	r1, [sp, #8]
3000d6a4:	e58d2004 	str	r2, [sp, #4]
3000d6a8:	e58d3000 	str	r3, [sp]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d6ac:	e59d000c 	ldr	r0, [sp, #12]
3000d6b0:	ebffd86e 	bl	30003870 <acoral_get_res_by_id>
3000d6b4:	e1a03000 	mov	r3, r0
3000d6b8:	e58d3014 	str	r3, [sp, #20]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->write!=NULL)
3000d6bc:	e59d3014 	ldr	r3, [sp, #20]
3000d6c0:	e3530000 	cmp	r3, #0
3000d6c4:	0a000013 	beq	3000d718 <acoral_dev_write+0x84>
3000d6c8:	e59d3014 	ldr	r3, [sp, #20]
3000d6cc:	e5933004 	ldr	r3, [r3, #4]
3000d6d0:	e3530000 	cmp	r3, #0
3000d6d4:	0a00000f 	beq	3000d718 <acoral_dev_write+0x84>
3000d6d8:	e59d3014 	ldr	r3, [sp, #20]
3000d6dc:	e5933004 	ldr	r3, [r3, #4]
3000d6e0:	e5933008 	ldr	r3, [r3, #8]
3000d6e4:	e3530000 	cmp	r3, #0
3000d6e8:	0a00000a 	beq	3000d718 <acoral_dev_write+0x84>
		return ctrl->ops->write(data,size,offset,time_out);
3000d6ec:	e59d3014 	ldr	r3, [sp, #20]
3000d6f0:	e5933004 	ldr	r3, [r3, #4]
3000d6f4:	e593c008 	ldr	ip, [r3, #8]
3000d6f8:	e59d0008 	ldr	r0, [sp, #8]
3000d6fc:	e59d1004 	ldr	r1, [sp, #4]
3000d700:	e59d2000 	ldr	r2, [sp]
3000d704:	e59d3020 	ldr	r3, [sp, #32]
3000d708:	e1a0e00f 	mov	lr, pc
3000d70c:	e12fff1c 	bx	ip
3000d710:	e1a03000 	mov	r3, r0
3000d714:	ea000000 	b	3000d71c <acoral_dev_write+0x88>
	return 0;
3000d718:	e3a03000 	mov	r3, #0
}
3000d71c:	e1a00003 	mov	r0, r3
3000d720:	e28dd01c 	add	sp, sp, #28
3000d724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d728:	e12fff1e 	bx	lr

3000d72c <acoral_dev_read>:

acoral_32 acoral_dev_read(acoral_id id,void *data,acoral_size size,acoral_size offset,acoral_time time_out){
3000d72c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d730:	e24dd01c 	sub	sp, sp, #28
3000d734:	e58d000c 	str	r0, [sp, #12]
3000d738:	e58d1008 	str	r1, [sp, #8]
3000d73c:	e58d2004 	str	r2, [sp, #4]
3000d740:	e58d3000 	str	r3, [sp]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d744:	e59d000c 	ldr	r0, [sp, #12]
3000d748:	ebffd848 	bl	30003870 <acoral_get_res_by_id>
3000d74c:	e1a03000 	mov	r3, r0
3000d750:	e58d3014 	str	r3, [sp, #20]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->read!=NULL)
3000d754:	e59d3014 	ldr	r3, [sp, #20]
3000d758:	e3530000 	cmp	r3, #0
3000d75c:	0a000013 	beq	3000d7b0 <acoral_dev_read+0x84>
3000d760:	e59d3014 	ldr	r3, [sp, #20]
3000d764:	e5933004 	ldr	r3, [r3, #4]
3000d768:	e3530000 	cmp	r3, #0
3000d76c:	0a00000f 	beq	3000d7b0 <acoral_dev_read+0x84>
3000d770:	e59d3014 	ldr	r3, [sp, #20]
3000d774:	e5933004 	ldr	r3, [r3, #4]
3000d778:	e5933004 	ldr	r3, [r3, #4]
3000d77c:	e3530000 	cmp	r3, #0
3000d780:	0a00000a 	beq	3000d7b0 <acoral_dev_read+0x84>
		return ctrl->ops->read(data,size,offset,time_out);
3000d784:	e59d3014 	ldr	r3, [sp, #20]
3000d788:	e5933004 	ldr	r3, [r3, #4]
3000d78c:	e593c004 	ldr	ip, [r3, #4]
3000d790:	e59d0008 	ldr	r0, [sp, #8]
3000d794:	e59d1004 	ldr	r1, [sp, #4]
3000d798:	e59d2000 	ldr	r2, [sp]
3000d79c:	e59d3020 	ldr	r3, [sp, #32]
3000d7a0:	e1a0e00f 	mov	lr, pc
3000d7a4:	e12fff1c 	bx	ip
3000d7a8:	e1a03000 	mov	r3, r0
3000d7ac:	ea000000 	b	3000d7b4 <acoral_dev_read+0x88>
	return 0;
3000d7b0:	e3a03000 	mov	r3, #0
}
3000d7b4:	e1a00003 	mov	r0, r3
3000d7b8:	e28dd01c 	add	sp, sp, #28
3000d7bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d7c0:	e12fff1e 	bx	lr

3000d7c4 <acoral_dev_config>:

acoral_32 acoral_dev_config(acoral_id id,acoral_u32 cmd,void *data,acoral_time tm_out){
3000d7c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d7c8:	e24dd01c 	sub	sp, sp, #28
3000d7cc:	e58d000c 	str	r0, [sp, #12]
3000d7d0:	e58d1008 	str	r1, [sp, #8]
3000d7d4:	e58d2004 	str	r2, [sp, #4]
3000d7d8:	e58d3000 	str	r3, [sp]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d7dc:	e59d000c 	ldr	r0, [sp, #12]
3000d7e0:	ebffd822 	bl	30003870 <acoral_get_res_by_id>
3000d7e4:	e1a03000 	mov	r3, r0
3000d7e8:	e58d3014 	str	r3, [sp, #20]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->config!=NULL)
3000d7ec:	e59d3014 	ldr	r3, [sp, #20]
3000d7f0:	e3530000 	cmp	r3, #0
3000d7f4:	0a000012 	beq	3000d844 <acoral_dev_config+0x80>
3000d7f8:	e59d3014 	ldr	r3, [sp, #20]
3000d7fc:	e5933004 	ldr	r3, [r3, #4]
3000d800:	e3530000 	cmp	r3, #0
3000d804:	0a00000e 	beq	3000d844 <acoral_dev_config+0x80>
3000d808:	e59d3014 	ldr	r3, [sp, #20]
3000d80c:	e5933004 	ldr	r3, [r3, #4]
3000d810:	e593300c 	ldr	r3, [r3, #12]
3000d814:	e3530000 	cmp	r3, #0
3000d818:	0a000009 	beq	3000d844 <acoral_dev_config+0x80>
		return ctrl->ops->config(cmd,data,tm_out);
3000d81c:	e59d3014 	ldr	r3, [sp, #20]
3000d820:	e5933004 	ldr	r3, [r3, #4]
3000d824:	e593300c 	ldr	r3, [r3, #12]
3000d828:	e59d0008 	ldr	r0, [sp, #8]
3000d82c:	e59d1004 	ldr	r1, [sp, #4]
3000d830:	e59d2000 	ldr	r2, [sp]
3000d834:	e1a0e00f 	mov	lr, pc
3000d838:	e12fff13 	bx	r3
3000d83c:	e1a03000 	mov	r3, r0
3000d840:	ea000000 	b	3000d848 <acoral_dev_config+0x84>
	return 0;	
3000d844:	e3a03000 	mov	r3, #0
}
3000d848:	e1a00003 	mov	r0, r3
3000d84c:	e28dd01c 	add	sp, sp, #28
3000d850:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d854:	e12fff1e 	bx	lr

3000d858 <acoral_dev_close>:
acoral_32 acoral_dev_close(acoral_id id){
3000d858:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d85c:	e24dd014 	sub	sp, sp, #20
3000d860:	e58d0004 	str	r0, [sp, #4]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d864:	e59d0004 	ldr	r0, [sp, #4]
3000d868:	ebffd800 	bl	30003870 <acoral_get_res_by_id>
3000d86c:	e1a03000 	mov	r3, r0
3000d870:	e58d300c 	str	r3, [sp, #12]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->close!=NULL)
3000d874:	e59d300c 	ldr	r3, [sp, #12]
3000d878:	e3530000 	cmp	r3, #0
3000d87c:	0a00000f 	beq	3000d8c0 <acoral_dev_close+0x68>
3000d880:	e59d300c 	ldr	r3, [sp, #12]
3000d884:	e5933004 	ldr	r3, [r3, #4]
3000d888:	e3530000 	cmp	r3, #0
3000d88c:	0a00000b 	beq	3000d8c0 <acoral_dev_close+0x68>
3000d890:	e59d300c 	ldr	r3, [sp, #12]
3000d894:	e5933004 	ldr	r3, [r3, #4]
3000d898:	e5933010 	ldr	r3, [r3, #16]
3000d89c:	e3530000 	cmp	r3, #0
3000d8a0:	0a000006 	beq	3000d8c0 <acoral_dev_close+0x68>
		return ctrl->ops->close();
3000d8a4:	e59d300c 	ldr	r3, [sp, #12]
3000d8a8:	e5933004 	ldr	r3, [r3, #4]
3000d8ac:	e5933010 	ldr	r3, [r3, #16]
3000d8b0:	e1a0e00f 	mov	lr, pc
3000d8b4:	e12fff13 	bx	r3
3000d8b8:	e1a03000 	mov	r3, r0
3000d8bc:	ea000000 	b	3000d8c4 <acoral_dev_close+0x6c>
	return 0;
3000d8c0:	e3a03000 	mov	r3, #0
}
3000d8c4:	e1a00003 	mov	r0, r3
3000d8c8:	e28dd014 	add	sp, sp, #20
3000d8cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d8d0:	e12fff1e 	bx	lr

3000d8d4 <acoral_alloc_drv>:

acoral_drv_ctrl_t *acoral_alloc_drv(){
3000d8d4:	e92d4008 	push	{r3, lr}
  	return (acoral_drv_ctrl_t *)acoral_get_res(&acoral_drv_pool_ctrl);
3000d8d8:	e59f0010 	ldr	r0, [pc, #16]	; 3000d8f0 <acoral_alloc_drv+0x1c>
3000d8dc:	ebffd704 	bl	300034f4 <acoral_get_res>
3000d8e0:	e1a03000 	mov	r3, r0
}
3000d8e4:	e1a00003 	mov	r0, r3
3000d8e8:	e8bd4008 	pop	{r3, lr}
3000d8ec:	e12fff1e 	bx	lr
3000d8f0:	3000fc24 	.word	0x3000fc24

3000d8f4 <acoral_drv_pool_init>:


void acoral_drv_pool_init(){
3000d8f4:	e92d4008 	push	{r3, lr}
	acoral_drv_pool_ctrl.type=ACORAL_RES_DRIVER;
3000d8f8:	e59f3038 	ldr	r3, [pc, #56]	; 3000d938 <acoral_drv_pool_init+0x44>
3000d8fc:	e3a02004 	mov	r2, #4
3000d900:	e5832000 	str	r2, [r3]
	acoral_drv_pool_ctrl.size=sizeof(acoral_drv_ctrl_t);
3000d904:	e59f302c 	ldr	r3, [pc, #44]	; 3000d938 <acoral_drv_pool_init+0x44>
3000d908:	e3a02010 	mov	r2, #16
3000d90c:	e5832004 	str	r2, [r3, #4]
	acoral_drv_pool_ctrl.num_per_pool=10;
3000d910:	e59f3020 	ldr	r3, [pc, #32]	; 3000d938 <acoral_drv_pool_init+0x44>
3000d914:	e3a0200a 	mov	r2, #10
3000d918:	e5832008 	str	r2, [r3, #8]
	acoral_drv_pool_ctrl.max_pools=3;
3000d91c:	e59f3014 	ldr	r3, [pc, #20]	; 3000d938 <acoral_drv_pool_init+0x44>
3000d920:	e3a02003 	mov	r2, #3
3000d924:	e5832010 	str	r2, [r3, #16]
	acoral_pool_ctrl_init(&acoral_drv_pool_ctrl);
3000d928:	e59f0008 	ldr	r0, [pc, #8]	; 3000d938 <acoral_drv_pool_init+0x44>
3000d92c:	ebffd84f 	bl	30003a70 <acoral_pool_ctrl_init>
}
3000d930:	e8bd4008 	pop	{r3, lr}
3000d934:	e12fff1e 	bx	lr
3000d938:	3000fc24 	.word	0x3000fc24

3000d93c <acoral_drv_sys_init>:

void acoral_drv_sys_init(){
3000d93c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d940:	e24dd00c 	sub	sp, sp, #12
	acoral_u32 i;
	for(i=0;i<ACORAL_DEV_NUM;i++)
3000d944:	e3a03000 	mov	r3, #0
3000d948:	e58d3004 	str	r3, [sp, #4]
3000d94c:	ea000006 	b	3000d96c <acoral_drv_sys_init+0x30>
	  	drv_table[i]=NULL;	    
3000d950:	e59d2004 	ldr	r2, [sp, #4]
3000d954:	e59f3030 	ldr	r3, [pc, #48]	; 3000d98c <acoral_drv_sys_init+0x50>
3000d958:	e3a01000 	mov	r1, #0
3000d95c:	e7831102 	str	r1, [r3, r2, lsl #2]
	acoral_pool_ctrl_init(&acoral_drv_pool_ctrl);
}

void acoral_drv_sys_init(){
	acoral_u32 i;
	for(i=0;i<ACORAL_DEV_NUM;i++)
3000d960:	e59d3004 	ldr	r3, [sp, #4]
3000d964:	e2833001 	add	r3, r3, #1
3000d968:	e58d3004 	str	r3, [sp, #4]
3000d96c:	e59d3004 	ldr	r3, [sp, #4]
3000d970:	e3530013 	cmp	r3, #19
3000d974:	9afffff5 	bls	3000d950 <acoral_drv_sys_init+0x14>
	  	drv_table[i]=NULL;	    
	acoral_drv_pool_init();
3000d978:	ebffffdd 	bl	3000d8f4 <acoral_drv_pool_init>
	brd_driver_init();
3000d97c:	eb000003 	bl	3000d990 <brd_driver_init>
}
3000d980:	e28dd00c 	add	sp, sp, #12
3000d984:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d988:	e12fff1e 	bx	lr
3000d98c:	3000f590 	.word	0x3000f590

3000d990 <brd_driver_init>:
#include<autocfg.h>
void brd_driver_init(){
3000d990:	e92d4008 	push	{r3, lr}
#ifdef CFG_DRV_CON_UART
	con_uart_init();
3000d994:	eb000089 	bl	3000dbc0 <con_uart_init>
#endif

#ifdef CFG_DRV_NET_DM9000
	dm9000_init();
#endif
}
3000d998:	e8bd4008 	pop	{r3, lr}
3000d99c:	e12fff1e 	bx	lr

3000d9a0 <uart_write>:
#define put_char(ch) uart_write(ch)
#define get_char(ch) uart_read(ch)
acoral_dev_ops_t console_ops;
void uart_init();

void uart_write(acoral_u8 ch){
3000d9a0:	e24dd008 	sub	sp, sp, #8
3000d9a4:	e1a03000 	mov	r3, r0
3000d9a8:	e5cd3007 	strb	r3, [sp, #7]
	while(!(rUTRSTAT0 & 0x4));
3000d9ac:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d9b0:	e2833010 	add	r3, r3, #16
3000d9b4:	e5933000 	ldr	r3, [r3]
3000d9b8:	e2033004 	and	r3, r3, #4
3000d9bc:	e3530000 	cmp	r3, #0
3000d9c0:	0afffff9 	beq	3000d9ac <uart_write+0xc>
	WrUTXH0(ch);
3000d9c4:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d9c8:	e2833020 	add	r3, r3, #32
3000d9cc:	e5dd2007 	ldrb	r2, [sp, #7]
3000d9d0:	e5c32000 	strb	r2, [r3]
}
3000d9d4:	e28dd008 	add	sp, sp, #8
3000d9d8:	e12fff1e 	bx	lr

3000d9dc <uart_read>:

void uart_read(acoral_char *ch){
3000d9dc:	e24dd008 	sub	sp, sp, #8
3000d9e0:	e58d0004 	str	r0, [sp, #4]
	while(!(rUTRSTAT0 & 0x1));
3000d9e4:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d9e8:	e2833010 	add	r3, r3, #16
3000d9ec:	e5933000 	ldr	r3, [r3]
3000d9f0:	e2033001 	and	r3, r3, #1
3000d9f4:	e3530000 	cmp	r3, #0
3000d9f8:	0afffff9 	beq	3000d9e4 <uart_read+0x8>
	*ch=RdURXH0();
3000d9fc:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000da00:	e2833024 	add	r3, r3, #36	; 0x24
3000da04:	e5d33000 	ldrb	r3, [r3]
3000da08:	e20320ff 	and	r2, r3, #255	; 0xff
3000da0c:	e59d3004 	ldr	r3, [sp, #4]
3000da10:	e5c32000 	strb	r2, [r3]
}
3000da14:	e28dd008 	add	sp, sp, #8
3000da18:	e12fff1e 	bx	lr

3000da1c <console_write>:

acoral_32 console_write(void *data,acoral_u32 size,acoral_time tm_out){
3000da1c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000da20:	e24dd01c 	sub	sp, sp, #28
3000da24:	e58d000c 	str	r0, [sp, #12]
3000da28:	e58d1008 	str	r1, [sp, #8]
3000da2c:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 i;
  	char p;
	for(i=0;i<size;i++){
3000da30:	e3a03000 	mov	r3, #0
3000da34:	e58d3010 	str	r3, [sp, #16]
3000da38:	ea00000f 	b	3000da7c <console_write+0x60>
		p=*((acoral_char *)data+i);
3000da3c:	e59d200c 	ldr	r2, [sp, #12]
3000da40:	e59d3010 	ldr	r3, [sp, #16]
3000da44:	e0823003 	add	r3, r2, r3
3000da48:	e5d33000 	ldrb	r3, [r3]
3000da4c:	e5cd3017 	strb	r3, [sp, #23]
		if(p=='\n')
3000da50:	e5dd3017 	ldrb	r3, [sp, #23]
3000da54:	e353000a 	cmp	r3, #10
3000da58:	1a000001 	bne	3000da64 <console_write+0x48>
			put_char('\r');
3000da5c:	e3a0000d 	mov	r0, #13
3000da60:	ebffffce 	bl	3000d9a0 <uart_write>
		put_char(p);
3000da64:	e5dd3017 	ldrb	r3, [sp, #23]
3000da68:	e1a00003 	mov	r0, r3
3000da6c:	ebffffcb 	bl	3000d9a0 <uart_write>
}

acoral_32 console_write(void *data,acoral_u32 size,acoral_time tm_out){
	acoral_u32 i;
  	char p;
	for(i=0;i<size;i++){
3000da70:	e59d3010 	ldr	r3, [sp, #16]
3000da74:	e2833001 	add	r3, r3, #1
3000da78:	e58d3010 	str	r3, [sp, #16]
3000da7c:	e59d2010 	ldr	r2, [sp, #16]
3000da80:	e59d3008 	ldr	r3, [sp, #8]
3000da84:	e1520003 	cmp	r2, r3
3000da88:	3affffeb 	bcc	3000da3c <console_write+0x20>
		p=*((acoral_char *)data+i);
		if(p=='\n')
			put_char('\r');
		put_char(p);
	}
}
3000da8c:	e28dd01c 	add	sp, sp, #28
3000da90:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000da94:	e12fff1e 	bx	lr

3000da98 <console_read>:

acoral_32 console_read(void *data,acoral_size size,acoral_size offset,acoral_time tm_out){
3000da98:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000da9c:	e24dd01c 	sub	sp, sp, #28
3000daa0:	e58d000c 	str	r0, [sp, #12]
3000daa4:	e58d1008 	str	r1, [sp, #8]
3000daa8:	e58d2004 	str	r2, [sp, #4]
3000daac:	e58d3000 	str	r3, [sp]
	acoral_u32 i;
  	acoral_char *p;
	for(i=0;i<size;i++){
3000dab0:	e3a03000 	mov	r3, #0
3000dab4:	e58d3010 	str	r3, [sp, #16]
3000dab8:	ea000008 	b	3000dae0 <console_read+0x48>
		p=(acoral_char *)data+i;
3000dabc:	e59d200c 	ldr	r2, [sp, #12]
3000dac0:	e59d3010 	ldr	r3, [sp, #16]
3000dac4:	e0823003 	add	r3, r2, r3
3000dac8:	e58d3014 	str	r3, [sp, #20]
		get_char(p);
3000dacc:	e59d0014 	ldr	r0, [sp, #20]
3000dad0:	ebffffc1 	bl	3000d9dc <uart_read>
}

acoral_32 console_read(void *data,acoral_size size,acoral_size offset,acoral_time tm_out){
	acoral_u32 i;
  	acoral_char *p;
	for(i=0;i<size;i++){
3000dad4:	e59d3010 	ldr	r3, [sp, #16]
3000dad8:	e2833001 	add	r3, r3, #1
3000dadc:	e58d3010 	str	r3, [sp, #16]
3000dae0:	e59d2010 	ldr	r2, [sp, #16]
3000dae4:	e59d3008 	ldr	r3, [sp, #8]
3000dae8:	e1520003 	cmp	r2, r3
3000daec:	3afffff2 	bcc	3000dabc <console_read+0x24>
		p=(acoral_char *)data+i;
		get_char(p);
	}
	return size;
3000daf0:	e59d3008 	ldr	r3, [sp, #8]
}
3000daf4:	e1a00003 	mov	r0, r3
3000daf8:	e28dd01c 	add	sp, sp, #28
3000dafc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000db00:	e12fff1e 	bx	lr

3000db04 <console_config>:

acoral_32 console_config(acoral_u32 cmd,void *data,acoral_time time_out){
3000db04:	e24dd010 	sub	sp, sp, #16
3000db08:	e58d000c 	str	r0, [sp, #12]
3000db0c:	e58d1008 	str	r1, [sp, #8]
3000db10:	e58d2004 	str	r2, [sp, #4]
	switch(cmd){
3000db14:	e59d300c 	ldr	r3, [sp, #12]
3000db18:	e3530001 	cmp	r3, #1
3000db1c:	1a000002 	bne	3000db2c <console_config+0x28>
		case CONSOLE_ECHO:
			*(acoral_u8 *)data=1;
3000db20:	e59d3008 	ldr	r3, [sp, #8]
3000db24:	e3a02001 	mov	r2, #1
3000db28:	e5c32000 	strb	r2, [r3]
		default:
			break;
	}		
}
3000db2c:	e28dd010 	add	sp, sp, #16
3000db30:	e12fff1e 	bx	lr

3000db34 <console_open>:

acoral_32 console_open(){
3000db34:	e92d4008 	push	{r3, lr}
	uart_init();
3000db38:	eb000003 	bl	3000db4c <uart_init>
	return 0;
3000db3c:	e3a03000 	mov	r3, #0
}
3000db40:	e1a00003 	mov	r0, r3
3000db44:	e8bd4008 	pop	{r3, lr}
3000db48:	e12fff1e 	bx	lr

3000db4c <uart_init>:

void uart_init(){
	rUCON0=0x245;	
3000db4c:	e3a02245 	mov	r2, #1342177284	; 0x50000004
3000db50:	e3a03f91 	mov	r3, #580	; 0x244
3000db54:	e2833001 	add	r3, r3, #1
3000db58:	e5823000 	str	r3, [r2]
	rULCON0=0x3;	
3000db5c:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000db60:	e3a02003 	mov	r2, #3
3000db64:	e5832000 	str	r2, [r3]
	rUFCON0=0x0;	
3000db68:	e3a03285 	mov	r3, #1342177288	; 0x50000008
3000db6c:	e3a02000 	mov	r2, #0
3000db70:	e5832000 	str	r2, [r3]
	rUMCON0=0x0;	
3000db74:	e3a032c5 	mov	r3, #1342177292	; 0x5000000c
3000db78:	e3a02000 	mov	r2, #0
3000db7c:	e5832000 	str	r2, [r3]
	rUBRDIV0=(PCLK /(CFG_BAUD_RATE * 16))-1;
3000db80:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000db84:	e2833028 	add	r3, r3, #40	; 0x28
3000db88:	e3a0201a 	mov	r2, #26
3000db8c:	e5832000 	str	r2, [r3]
    rGPHCON = 0x0016faaa;
3000db90:	e3a02456 	mov	r2, #1442840576	; 0x56000000
3000db94:	e2822070 	add	r2, r2, #112	; 0x70
3000db98:	e3a0395b 	mov	r3, #1490944	; 0x16c000
3000db9c:	e2833dea 	add	r3, r3, #14976	; 0x3a80
3000dba0:	e283302a 	add	r3, r3, #42	; 0x2a
3000dba4:	e5823000 	str	r3, [r2]
	rGPHUP  = 0x7ff;    /* The pull up function is disabled GPH[10:0]*/
3000dba8:	e3a03456 	mov	r3, #1442840576	; 0x56000000
3000dbac:	e2833078 	add	r3, r3, #120	; 0x78
3000dbb0:	e3a02e7f 	mov	r2, #2032	; 0x7f0
3000dbb4:	e282200f 	add	r2, r2, #15
3000dbb8:	e5832000 	str	r2, [r3]
}
3000dbbc:	e12fff1e 	bx	lr

3000dbc0 <con_uart_init>:

void con_uart_init(){
3000dbc0:	e92d4008 	push	{r3, lr}
	console_ops.open=console_open;
3000dbc4:	e59f203c 	ldr	r2, [pc, #60]	; 3000dc08 <con_uart_init+0x48>
3000dbc8:	e59f303c 	ldr	r3, [pc, #60]	; 3000dc0c <con_uart_init+0x4c>
3000dbcc:	e5832000 	str	r2, [r3]
	console_ops.write=console_write;
3000dbd0:	e59f2038 	ldr	r2, [pc, #56]	; 3000dc10 <con_uart_init+0x50>
3000dbd4:	e59f3030 	ldr	r3, [pc, #48]	; 3000dc0c <con_uart_init+0x4c>
3000dbd8:	e5832008 	str	r2, [r3, #8]
	console_ops.read=console_read;
3000dbdc:	e59f3028 	ldr	r3, [pc, #40]	; 3000dc0c <con_uart_init+0x4c>
3000dbe0:	e59f202c 	ldr	r2, [pc, #44]	; 3000dc14 <con_uart_init+0x54>
3000dbe4:	e5832004 	str	r2, [r3, #4]
	console_ops.config=console_config;
3000dbe8:	e59f301c 	ldr	r3, [pc, #28]	; 3000dc0c <con_uart_init+0x4c>
3000dbec:	e59f2024 	ldr	r2, [pc, #36]	; 3000dc18 <con_uart_init+0x58>
3000dbf0:	e583200c 	str	r2, [r3, #12]
  	acoral_drv_register(&console_ops,"console");
3000dbf4:	e59f0010 	ldr	r0, [pc, #16]	; 3000dc0c <con_uart_init+0x4c>
3000dbf8:	e59f101c 	ldr	r1, [pc, #28]	; 3000dc1c <con_uart_init+0x5c>
3000dbfc:	ebfffe27 	bl	3000d4a0 <acoral_drv_register>
}
3000dc00:	e8bd4008 	pop	{r3, lr}
3000dc04:	e12fff1e 	bx	lr
3000dc08:	3000db34 	.word	0x3000db34
3000dc0c:	3000fcd8 	.word	0x3000fcd8
3000dc10:	3000da1c 	.word	0x3000da1c
3000dc14:	3000da98 	.word	0x3000da98
3000dc18:	3000db04 	.word	0x3000db04
3000dc1c:	3000ec74 	.word	0x3000ec74

3000dc20 <__aeabi_uidiv>:
3000dc20:	e2512001 	subs	r2, r1, #1
3000dc24:	012fff1e 	bxeq	lr
3000dc28:	3a000036 	bcc	3000dd08 <__aeabi_uidiv+0xe8>
3000dc2c:	e1500001 	cmp	r0, r1
3000dc30:	9a000022 	bls	3000dcc0 <__aeabi_uidiv+0xa0>
3000dc34:	e1110002 	tst	r1, r2
3000dc38:	0a000023 	beq	3000dccc <__aeabi_uidiv+0xac>
3000dc3c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
3000dc40:	01a01181 	lsleq	r1, r1, #3
3000dc44:	03a03008 	moveq	r3, #8
3000dc48:	13a03001 	movne	r3, #1
3000dc4c:	e3510201 	cmp	r1, #268435456	; 0x10000000
3000dc50:	31510000 	cmpcc	r1, r0
3000dc54:	31a01201 	lslcc	r1, r1, #4
3000dc58:	31a03203 	lslcc	r3, r3, #4
3000dc5c:	3afffffa 	bcc	3000dc4c <__aeabi_uidiv+0x2c>
3000dc60:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
3000dc64:	31510000 	cmpcc	r1, r0
3000dc68:	31a01081 	lslcc	r1, r1, #1
3000dc6c:	31a03083 	lslcc	r3, r3, #1
3000dc70:	3afffffa 	bcc	3000dc60 <__aeabi_uidiv+0x40>
3000dc74:	e3a02000 	mov	r2, #0
3000dc78:	e1500001 	cmp	r0, r1
3000dc7c:	20400001 	subcs	r0, r0, r1
3000dc80:	21822003 	orrcs	r2, r2, r3
3000dc84:	e15000a1 	cmp	r0, r1, lsr #1
3000dc88:	204000a1 	subcs	r0, r0, r1, lsr #1
3000dc8c:	218220a3 	orrcs	r2, r2, r3, lsr #1
3000dc90:	e1500121 	cmp	r0, r1, lsr #2
3000dc94:	20400121 	subcs	r0, r0, r1, lsr #2
3000dc98:	21822123 	orrcs	r2, r2, r3, lsr #2
3000dc9c:	e15001a1 	cmp	r0, r1, lsr #3
3000dca0:	204001a1 	subcs	r0, r0, r1, lsr #3
3000dca4:	218221a3 	orrcs	r2, r2, r3, lsr #3
3000dca8:	e3500000 	cmp	r0, #0
3000dcac:	11b03223 	lsrsne	r3, r3, #4
3000dcb0:	11a01221 	lsrne	r1, r1, #4
3000dcb4:	1affffef 	bne	3000dc78 <__aeabi_uidiv+0x58>
3000dcb8:	e1a00002 	mov	r0, r2
3000dcbc:	e12fff1e 	bx	lr
3000dcc0:	03a00001 	moveq	r0, #1
3000dcc4:	13a00000 	movne	r0, #0
3000dcc8:	e12fff1e 	bx	lr
3000dccc:	e3510801 	cmp	r1, #65536	; 0x10000
3000dcd0:	21a01821 	lsrcs	r1, r1, #16
3000dcd4:	23a02010 	movcs	r2, #16
3000dcd8:	33a02000 	movcc	r2, #0
3000dcdc:	e3510c01 	cmp	r1, #256	; 0x100
3000dce0:	21a01421 	lsrcs	r1, r1, #8
3000dce4:	22822008 	addcs	r2, r2, #8
3000dce8:	e3510010 	cmp	r1, #16
3000dcec:	21a01221 	lsrcs	r1, r1, #4
3000dcf0:	22822004 	addcs	r2, r2, #4
3000dcf4:	e3510004 	cmp	r1, #4
3000dcf8:	82822003 	addhi	r2, r2, #3
3000dcfc:	908220a1 	addls	r2, r2, r1, lsr #1
3000dd00:	e1a00230 	lsr	r0, r0, r2
3000dd04:	e12fff1e 	bx	lr
3000dd08:	e3500000 	cmp	r0, #0
3000dd0c:	13e00000 	mvnne	r0, #0
3000dd10:	ea000007 	b	3000dd34 <__aeabi_idiv0>

3000dd14 <__aeabi_uidivmod>:
3000dd14:	e3510000 	cmp	r1, #0
3000dd18:	0afffffa 	beq	3000dd08 <__aeabi_uidiv+0xe8>
3000dd1c:	e92d4003 	push	{r0, r1, lr}
3000dd20:	ebffffbe 	bl	3000dc20 <__aeabi_uidiv>
3000dd24:	e8bd4006 	pop	{r1, r2, lr}
3000dd28:	e0030092 	mul	r3, r2, r0
3000dd2c:	e0411003 	sub	r1, r1, r3
3000dd30:	e12fff1e 	bx	lr

3000dd34 <__aeabi_idiv0>:
3000dd34:	e12fff1e 	bx	lr

3000dd38 <__aeabi_frsub>:
3000dd38:	e2200102 	eor	r0, r0, #-2147483648	; 0x80000000
3000dd3c:	ea000000 	b	3000dd44 <__addsf3>

3000dd40 <__aeabi_fsub>:
3000dd40:	e2211102 	eor	r1, r1, #-2147483648	; 0x80000000

3000dd44 <__addsf3>:
3000dd44:	e1b02080 	lsls	r2, r0, #1
3000dd48:	11b03081 	lslsne	r3, r1, #1
3000dd4c:	11320003 	teqne	r2, r3
3000dd50:	11f0cc42 	mvnsne	ip, r2, asr #24
3000dd54:	11f0cc43 	mvnsne	ip, r3, asr #24
3000dd58:	0a000047 	beq	3000de7c <__addsf3+0x138>
3000dd5c:	e1a02c22 	lsr	r2, r2, #24
3000dd60:	e0723c23 	rsbs	r3, r2, r3, lsr #24
3000dd64:	c0822003 	addgt	r2, r2, r3
3000dd68:	c0201001 	eorgt	r1, r0, r1
3000dd6c:	c0210000 	eorgt	r0, r1, r0
3000dd70:	c0201001 	eorgt	r1, r0, r1
3000dd74:	b2633000 	rsblt	r3, r3, #0
3000dd78:	e3530019 	cmp	r3, #25
3000dd7c:	812fff1e 	bxhi	lr
3000dd80:	e3100102 	tst	r0, #-2147483648	; 0x80000000
3000dd84:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000dd88:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
3000dd8c:	12600000 	rsbne	r0, r0, #0
3000dd90:	e3110102 	tst	r1, #-2147483648	; 0x80000000
3000dd94:	e3811502 	orr	r1, r1, #8388608	; 0x800000
3000dd98:	e3c114ff 	bic	r1, r1, #-16777216	; 0xff000000
3000dd9c:	12611000 	rsbne	r1, r1, #0
3000dda0:	e1320003 	teq	r2, r3
3000dda4:	0a00002e 	beq	3000de64 <__addsf3+0x120>
3000dda8:	e2422001 	sub	r2, r2, #1
3000ddac:	e0900351 	adds	r0, r0, r1, asr r3
3000ddb0:	e2633020 	rsb	r3, r3, #32
3000ddb4:	e1a01311 	lsl	r1, r1, r3
3000ddb8:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
3000ddbc:	5a000001 	bpl	3000ddc8 <__addsf3+0x84>
3000ddc0:	e2711000 	rsbs	r1, r1, #0
3000ddc4:	e2e00000 	rsc	r0, r0, #0
3000ddc8:	e3500502 	cmp	r0, #8388608	; 0x800000
3000ddcc:	3a00000b 	bcc	3000de00 <__addsf3+0xbc>
3000ddd0:	e3500401 	cmp	r0, #16777216	; 0x1000000
3000ddd4:	3a000004 	bcc	3000ddec <__addsf3+0xa8>
3000ddd8:	e1b000a0 	lsrs	r0, r0, #1
3000dddc:	e1a01061 	rrx	r1, r1
3000dde0:	e2822001 	add	r2, r2, #1
3000dde4:	e35200fe 	cmp	r2, #254	; 0xfe
3000dde8:	2a000038 	bcs	3000ded0 <__addsf3+0x18c>
3000ddec:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
3000ddf0:	e0a00b82 	adc	r0, r0, r2, lsl #23
3000ddf4:	03c00001 	biceq	r0, r0, #1
3000ddf8:	e1800003 	orr	r0, r0, r3
3000ddfc:	e12fff1e 	bx	lr
3000de00:	e1b01081 	lsls	r1, r1, #1
3000de04:	e0a00000 	adc	r0, r0, r0
3000de08:	e3100502 	tst	r0, #8388608	; 0x800000
3000de0c:	e2422001 	sub	r2, r2, #1
3000de10:	1afffff5 	bne	3000ddec <__addsf3+0xa8>
3000de14:	e1b0c620 	lsrs	ip, r0, #12
3000de18:	01a00600 	lsleq	r0, r0, #12
3000de1c:	0242200c 	subeq	r2, r2, #12
3000de20:	e31008ff 	tst	r0, #16711680	; 0xff0000
3000de24:	01a00400 	lsleq	r0, r0, #8
3000de28:	02422008 	subeq	r2, r2, #8
3000de2c:	e310060f 	tst	r0, #15728640	; 0xf00000
3000de30:	01a00200 	lsleq	r0, r0, #4
3000de34:	02422004 	subeq	r2, r2, #4
3000de38:	e3100503 	tst	r0, #12582912	; 0xc00000
3000de3c:	01a00100 	lsleq	r0, r0, #2
3000de40:	02422002 	subeq	r2, r2, #2
3000de44:	e3500502 	cmp	r0, #8388608	; 0x800000
3000de48:	31a00080 	lslcc	r0, r0, #1
3000de4c:	e2d22000 	sbcs	r2, r2, #0
3000de50:	a0800b82 	addge	r0, r0, r2, lsl #23
3000de54:	b2622000 	rsblt	r2, r2, #0
3000de58:	a1800003 	orrge	r0, r0, r3
3000de5c:	b1830230 	orrlt	r0, r3, r0, lsr r2
3000de60:	e12fff1e 	bx	lr
3000de64:	e3320000 	teq	r2, #0
3000de68:	e2211502 	eor	r1, r1, #8388608	; 0x800000
3000de6c:	02200502 	eoreq	r0, r0, #8388608	; 0x800000
3000de70:	02822001 	addeq	r2, r2, #1
3000de74:	12433001 	subne	r3, r3, #1
3000de78:	eaffffca 	b	3000dda8 <__addsf3+0x64>
3000de7c:	e1a03081 	lsl	r3, r1, #1
3000de80:	e1f0cc42 	mvns	ip, r2, asr #24
3000de84:	11f0cc43 	mvnsne	ip, r3, asr #24
3000de88:	0a000013 	beq	3000dedc <__addsf3+0x198>
3000de8c:	e1320003 	teq	r2, r3
3000de90:	0a000002 	beq	3000dea0 <__addsf3+0x15c>
3000de94:	e3320000 	teq	r2, #0
3000de98:	01a00001 	moveq	r0, r1
3000de9c:	e12fff1e 	bx	lr
3000dea0:	e1300001 	teq	r0, r1
3000dea4:	13a00000 	movne	r0, #0
3000dea8:	112fff1e 	bxne	lr
3000deac:	e31204ff 	tst	r2, #-16777216	; 0xff000000
3000deb0:	1a000002 	bne	3000dec0 <__addsf3+0x17c>
3000deb4:	e1b00080 	lsls	r0, r0, #1
3000deb8:	23800102 	orrcs	r0, r0, #-2147483648	; 0x80000000
3000debc:	e12fff1e 	bx	lr
3000dec0:	e2922402 	adds	r2, r2, #33554432	; 0x2000000
3000dec4:	32800502 	addcc	r0, r0, #8388608	; 0x800000
3000dec8:	312fff1e 	bxcc	lr
3000decc:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
3000ded0:	e383047f 	orr	r0, r3, #2130706432	; 0x7f000000
3000ded4:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000ded8:	e12fff1e 	bx	lr
3000dedc:	e1f02c42 	mvns	r2, r2, asr #24
3000dee0:	11a00001 	movne	r0, r1
3000dee4:	01f03c43 	mvnseq	r3, r3, asr #24
3000dee8:	11a01000 	movne	r1, r0
3000deec:	e1b02480 	lsls	r2, r0, #9
3000def0:	01b03481 	lslseq	r3, r1, #9
3000def4:	01300001 	teqeq	r0, r1
3000def8:	13800501 	orrne	r0, r0, #4194304	; 0x400000
3000defc:	e12fff1e 	bx	lr

3000df00 <__aeabi_ui2f>:
3000df00:	e3a03000 	mov	r3, #0
3000df04:	ea000001 	b	3000df10 <__aeabi_i2f+0x8>

3000df08 <__aeabi_i2f>:
3000df08:	e2103102 	ands	r3, r0, #-2147483648	; 0x80000000
3000df0c:	42600000 	rsbmi	r0, r0, #0
3000df10:	e1b0c000 	movs	ip, r0
3000df14:	012fff1e 	bxeq	lr
3000df18:	e383344b 	orr	r3, r3, #1258291200	; 0x4b000000
3000df1c:	e1a01000 	mov	r1, r0
3000df20:	e3a00000 	mov	r0, #0
3000df24:	ea00000f 	b	3000df68 <__aeabi_l2f+0x30>

3000df28 <__aeabi_ul2f>:
3000df28:	e1902001 	orrs	r2, r0, r1
3000df2c:	012fff1e 	bxeq	lr
3000df30:	e3a03000 	mov	r3, #0
3000df34:	ea000005 	b	3000df50 <__aeabi_l2f+0x18>

3000df38 <__aeabi_l2f>:
3000df38:	e1902001 	orrs	r2, r0, r1
3000df3c:	012fff1e 	bxeq	lr
3000df40:	e2113102 	ands	r3, r1, #-2147483648	; 0x80000000
3000df44:	5a000001 	bpl	3000df50 <__aeabi_l2f+0x18>
3000df48:	e2700000 	rsbs	r0, r0, #0
3000df4c:	e2e11000 	rsc	r1, r1, #0
3000df50:	e1b0c001 	movs	ip, r1
3000df54:	01a0c000 	moveq	ip, r0
3000df58:	01a01000 	moveq	r1, r0
3000df5c:	03a00000 	moveq	r0, #0
3000df60:	e383345b 	orr	r3, r3, #1526726656	; 0x5b000000
3000df64:	02433201 	subeq	r3, r3, #268435456	; 0x10000000
3000df68:	e2433502 	sub	r3, r3, #8388608	; 0x800000
3000df6c:	e3a02017 	mov	r2, #23
3000df70:	e35c0801 	cmp	ip, #65536	; 0x10000
3000df74:	21a0c82c 	lsrcs	ip, ip, #16
3000df78:	22422010 	subcs	r2, r2, #16
3000df7c:	e35c0c01 	cmp	ip, #256	; 0x100
3000df80:	21a0c42c 	lsrcs	ip, ip, #8
3000df84:	22422008 	subcs	r2, r2, #8
3000df88:	e35c0010 	cmp	ip, #16
3000df8c:	21a0c22c 	lsrcs	ip, ip, #4
3000df90:	22422004 	subcs	r2, r2, #4
3000df94:	e35c0004 	cmp	ip, #4
3000df98:	22422002 	subcs	r2, r2, #2
3000df9c:	304220ac 	subcc	r2, r2, ip, lsr #1
3000dfa0:	e05221ac 	subs	r2, r2, ip, lsr #3
3000dfa4:	e0433b82 	sub	r3, r3, r2, lsl #23
3000dfa8:	ba000006 	blt	3000dfc8 <__aeabi_l2f+0x90>
3000dfac:	e0833211 	add	r3, r3, r1, lsl r2
3000dfb0:	e1a0c210 	lsl	ip, r0, r2
3000dfb4:	e2622020 	rsb	r2, r2, #32
3000dfb8:	e35c0102 	cmp	ip, #-2147483648	; 0x80000000
3000dfbc:	e0a30230 	adc	r0, r3, r0, lsr r2
3000dfc0:	03c00001 	biceq	r0, r0, #1
3000dfc4:	e12fff1e 	bx	lr
3000dfc8:	e2822020 	add	r2, r2, #32
3000dfcc:	e1a0c211 	lsl	ip, r1, r2
3000dfd0:	e2622020 	rsb	r2, r2, #32
3000dfd4:	e190008c 	orrs	r0, r0, ip, lsl #1
3000dfd8:	e0a30231 	adc	r0, r3, r1, lsr r2
3000dfdc:	01c00fac 	biceq	r0, r0, ip, lsr #31
3000dfe0:	e12fff1e 	bx	lr

3000dfe4 <__aeabi_fmul>:
3000dfe4:	e3a0c0ff 	mov	ip, #255	; 0xff
3000dfe8:	e01c2ba0 	ands	r2, ip, r0, lsr #23
3000dfec:	101c3ba1 	andsne	r3, ip, r1, lsr #23
3000dff0:	1132000c 	teqne	r2, ip
3000dff4:	1133000c 	teqne	r3, ip
3000dff8:	0a00003e 	beq	3000e0f8 <__aeabi_fmul+0x114>
3000dffc:	e0822003 	add	r2, r2, r3
3000e000:	e020c001 	eor	ip, r0, r1
3000e004:	e1b00480 	lsls	r0, r0, #9
3000e008:	11b01481 	lslsne	r1, r1, #9
3000e00c:	0a000010 	beq	3000e054 <__aeabi_fmul+0x70>
3000e010:	e3a03302 	mov	r3, #134217728	; 0x8000000
3000e014:	e18302a0 	orr	r0, r3, r0, lsr #5
3000e018:	e18312a1 	orr	r1, r3, r1, lsr #5
3000e01c:	e0813190 	umull	r3, r1, r0, r1
3000e020:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
3000e024:	e3510502 	cmp	r1, #8388608	; 0x800000
3000e028:	31a01081 	lslcc	r1, r1, #1
3000e02c:	31811fa3 	orrcc	r1, r1, r3, lsr #31
3000e030:	31a03083 	lslcc	r3, r3, #1
3000e034:	e1800001 	orr	r0, r0, r1
3000e038:	e2c2207f 	sbc	r2, r2, #127	; 0x7f
3000e03c:	e35200fd 	cmp	r2, #253	; 0xfd
3000e040:	8a00000f 	bhi	3000e084 <__aeabi_fmul+0xa0>
3000e044:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
3000e048:	e0a00b82 	adc	r0, r0, r2, lsl #23
3000e04c:	03c00001 	biceq	r0, r0, #1
3000e050:	e12fff1e 	bx	lr
3000e054:	e3300000 	teq	r0, #0
3000e058:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
3000e05c:	01a01481 	lsleq	r1, r1, #9
3000e060:	e18c04a0 	orr	r0, ip, r0, lsr #9
3000e064:	e18004a1 	orr	r0, r0, r1, lsr #9
3000e068:	e252207f 	subs	r2, r2, #127	; 0x7f
3000e06c:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
3000e070:	c1800b82 	orrgt	r0, r0, r2, lsl #23
3000e074:	c12fff1e 	bxgt	lr
3000e078:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000e07c:	e3a03000 	mov	r3, #0
3000e080:	e2522001 	subs	r2, r2, #1
3000e084:	ca000035 	bgt	3000e160 <__aeabi_fmul+0x17c>
3000e088:	e3720019 	cmn	r2, #25
3000e08c:	d2000102 	andle	r0, r0, #-2147483648	; 0x80000000
3000e090:	d12fff1e 	bxle	lr
3000e094:	e2622000 	rsb	r2, r2, #0
3000e098:	e1b01080 	lsls	r1, r0, #1
3000e09c:	e1a01231 	lsr	r1, r1, r2
3000e0a0:	e2622020 	rsb	r2, r2, #32
3000e0a4:	e1a0c210 	lsl	ip, r0, r2
3000e0a8:	e1b00061 	rrxs	r0, r1
3000e0ac:	e2a00000 	adc	r0, r0, #0
3000e0b0:	e193308c 	orrs	r3, r3, ip, lsl #1
3000e0b4:	01c00fac 	biceq	r0, r0, ip, lsr #31
3000e0b8:	e12fff1e 	bx	lr
3000e0bc:	e3320000 	teq	r2, #0
3000e0c0:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
3000e0c4:	01a00080 	lsleq	r0, r0, #1
3000e0c8:	03100502 	tsteq	r0, #8388608	; 0x800000
3000e0cc:	02422001 	subeq	r2, r2, #1
3000e0d0:	0afffffb 	beq	3000e0c4 <__aeabi_fmul+0xe0>
3000e0d4:	e180000c 	orr	r0, r0, ip
3000e0d8:	e3330000 	teq	r3, #0
3000e0dc:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
3000e0e0:	01a01081 	lsleq	r1, r1, #1
3000e0e4:	03110502 	tsteq	r1, #8388608	; 0x800000
3000e0e8:	02433001 	subeq	r3, r3, #1
3000e0ec:	0afffffb 	beq	3000e0e0 <__aeabi_fmul+0xfc>
3000e0f0:	e181100c 	orr	r1, r1, ip
3000e0f4:	eaffffc0 	b	3000dffc <__aeabi_fmul+0x18>
3000e0f8:	e00c3ba1 	and	r3, ip, r1, lsr #23
3000e0fc:	e132000c 	teq	r2, ip
3000e100:	1133000c 	teqne	r3, ip
3000e104:	0a000005 	beq	3000e120 <__aeabi_fmul+0x13c>
3000e108:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
3000e10c:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
3000e110:	1affffe9 	bne	3000e0bc <__aeabi_fmul+0xd8>
3000e114:	e0200001 	eor	r0, r0, r1
3000e118:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
3000e11c:	e12fff1e 	bx	lr
3000e120:	e3300000 	teq	r0, #0
3000e124:	13300102 	teqne	r0, #-2147483648	; 0x80000000
3000e128:	01a00001 	moveq	r0, r1
3000e12c:	13310000 	teqne	r1, #0
3000e130:	13310102 	teqne	r1, #-2147483648	; 0x80000000
3000e134:	0a00000d 	beq	3000e170 <__aeabi_fmul+0x18c>
3000e138:	e132000c 	teq	r2, ip
3000e13c:	1a000001 	bne	3000e148 <__aeabi_fmul+0x164>
3000e140:	e1b02480 	lsls	r2, r0, #9
3000e144:	1a000009 	bne	3000e170 <__aeabi_fmul+0x18c>
3000e148:	e133000c 	teq	r3, ip
3000e14c:	1a000002 	bne	3000e15c <__aeabi_fmul+0x178>
3000e150:	e1b03481 	lsls	r3, r1, #9
3000e154:	11a00001 	movne	r0, r1
3000e158:	1a000004 	bne	3000e170 <__aeabi_fmul+0x18c>
3000e15c:	e0200001 	eor	r0, r0, r1
3000e160:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
3000e164:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
3000e168:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000e16c:	e12fff1e 	bx	lr
3000e170:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
3000e174:	e3800503 	orr	r0, r0, #12582912	; 0xc00000
3000e178:	e12fff1e 	bx	lr

3000e17c <__aeabi_fdiv>:
3000e17c:	e3a0c0ff 	mov	ip, #255	; 0xff
3000e180:	e01c2ba0 	ands	r2, ip, r0, lsr #23
3000e184:	101c3ba1 	andsne	r3, ip, r1, lsr #23
3000e188:	1132000c 	teqne	r2, ip
3000e18c:	1133000c 	teqne	r3, ip
3000e190:	0a00003a 	beq	3000e280 <__aeabi_fdiv+0x104>
3000e194:	e0422003 	sub	r2, r2, r3
3000e198:	e020c001 	eor	ip, r0, r1
3000e19c:	e1b01481 	lsls	r1, r1, #9
3000e1a0:	e1a00480 	lsl	r0, r0, #9
3000e1a4:	0a00001c 	beq	3000e21c <__aeabi_fdiv+0xa0>
3000e1a8:	e3a03201 	mov	r3, #268435456	; 0x10000000
3000e1ac:	e1831221 	orr	r1, r3, r1, lsr #4
3000e1b0:	e1833220 	orr	r3, r3, r0, lsr #4
3000e1b4:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
3000e1b8:	e1530001 	cmp	r3, r1
3000e1bc:	31a03083 	lslcc	r3, r3, #1
3000e1c0:	e2a2207d 	adc	r2, r2, #125	; 0x7d
3000e1c4:	e3a0c502 	mov	ip, #8388608	; 0x800000
3000e1c8:	e1530001 	cmp	r3, r1
3000e1cc:	20433001 	subcs	r3, r3, r1
3000e1d0:	2180000c 	orrcs	r0, r0, ip
3000e1d4:	e15300a1 	cmp	r3, r1, lsr #1
3000e1d8:	204330a1 	subcs	r3, r3, r1, lsr #1
3000e1dc:	218000ac 	orrcs	r0, r0, ip, lsr #1
3000e1e0:	e1530121 	cmp	r3, r1, lsr #2
3000e1e4:	20433121 	subcs	r3, r3, r1, lsr #2
3000e1e8:	2180012c 	orrcs	r0, r0, ip, lsr #2
3000e1ec:	e15301a1 	cmp	r3, r1, lsr #3
3000e1f0:	204331a1 	subcs	r3, r3, r1, lsr #3
3000e1f4:	218001ac 	orrcs	r0, r0, ip, lsr #3
3000e1f8:	e1b03203 	lsls	r3, r3, #4
3000e1fc:	11b0c22c 	lsrsne	ip, ip, #4
3000e200:	1afffff0 	bne	3000e1c8 <__aeabi_fdiv+0x4c>
3000e204:	e35200fd 	cmp	r2, #253	; 0xfd
3000e208:	8affff9d 	bhi	3000e084 <__aeabi_fmul+0xa0>
3000e20c:	e1530001 	cmp	r3, r1
3000e210:	e0a00b82 	adc	r0, r0, r2, lsl #23
3000e214:	03c00001 	biceq	r0, r0, #1
3000e218:	e12fff1e 	bx	lr
3000e21c:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
3000e220:	e18c04a0 	orr	r0, ip, r0, lsr #9
3000e224:	e292207f 	adds	r2, r2, #127	; 0x7f
3000e228:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
3000e22c:	c1800b82 	orrgt	r0, r0, r2, lsl #23
3000e230:	c12fff1e 	bxgt	lr
3000e234:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000e238:	e3a03000 	mov	r3, #0
3000e23c:	e2522001 	subs	r2, r2, #1
3000e240:	eaffff8f 	b	3000e084 <__aeabi_fmul+0xa0>
3000e244:	e3320000 	teq	r2, #0
3000e248:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
3000e24c:	01a00080 	lsleq	r0, r0, #1
3000e250:	03100502 	tsteq	r0, #8388608	; 0x800000
3000e254:	02422001 	subeq	r2, r2, #1
3000e258:	0afffffb 	beq	3000e24c <__aeabi_fdiv+0xd0>
3000e25c:	e180000c 	orr	r0, r0, ip
3000e260:	e3330000 	teq	r3, #0
3000e264:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
3000e268:	01a01081 	lsleq	r1, r1, #1
3000e26c:	03110502 	tsteq	r1, #8388608	; 0x800000
3000e270:	02433001 	subeq	r3, r3, #1
3000e274:	0afffffb 	beq	3000e268 <__aeabi_fdiv+0xec>
3000e278:	e181100c 	orr	r1, r1, ip
3000e27c:	eaffffc4 	b	3000e194 <__aeabi_fdiv+0x18>
3000e280:	e00c3ba1 	and	r3, ip, r1, lsr #23
3000e284:	e132000c 	teq	r2, ip
3000e288:	1a000005 	bne	3000e2a4 <__aeabi_fdiv+0x128>
3000e28c:	e1b02480 	lsls	r2, r0, #9
3000e290:	1affffb6 	bne	3000e170 <__aeabi_fmul+0x18c>
3000e294:	e133000c 	teq	r3, ip
3000e298:	1affffaf 	bne	3000e15c <__aeabi_fmul+0x178>
3000e29c:	e1a00001 	mov	r0, r1
3000e2a0:	eaffffb2 	b	3000e170 <__aeabi_fmul+0x18c>
3000e2a4:	e133000c 	teq	r3, ip
3000e2a8:	1a000003 	bne	3000e2bc <__aeabi_fdiv+0x140>
3000e2ac:	e1b03481 	lsls	r3, r1, #9
3000e2b0:	0affff97 	beq	3000e114 <__aeabi_fmul+0x130>
3000e2b4:	e1a00001 	mov	r0, r1
3000e2b8:	eaffffac 	b	3000e170 <__aeabi_fmul+0x18c>
3000e2bc:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
3000e2c0:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
3000e2c4:	1affffde 	bne	3000e244 <__aeabi_fdiv+0xc8>
3000e2c8:	e3d02102 	bics	r2, r0, #-2147483648	; 0x80000000
3000e2cc:	1affffa2 	bne	3000e15c <__aeabi_fmul+0x178>
3000e2d0:	e3d13102 	bics	r3, r1, #-2147483648	; 0x80000000
3000e2d4:	1affff8e 	bne	3000e114 <__aeabi_fmul+0x130>
3000e2d8:	eaffffa4 	b	3000e170 <__aeabi_fmul+0x18c>

3000e2dc <__gesf2>:
3000e2dc:	e3e0c000 	mvn	ip, #0
3000e2e0:	ea000002 	b	3000e2f0 <__cmpsf2+0x4>

3000e2e4 <__lesf2>:
3000e2e4:	e3a0c001 	mov	ip, #1
3000e2e8:	ea000000 	b	3000e2f0 <__cmpsf2+0x4>

3000e2ec <__cmpsf2>:
3000e2ec:	e3a0c001 	mov	ip, #1
3000e2f0:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
3000e2f4:	e1a02080 	lsl	r2, r0, #1
3000e2f8:	e1a03081 	lsl	r3, r1, #1
3000e2fc:	e1f0cc42 	mvns	ip, r2, asr #24
3000e300:	11f0cc43 	mvnsne	ip, r3, asr #24
3000e304:	0a000007 	beq	3000e328 <__cmpsf2+0x3c>
3000e308:	e28dd004 	add	sp, sp, #4
3000e30c:	e192c0a3 	orrs	ip, r2, r3, lsr #1
3000e310:	11300001 	teqne	r0, r1
3000e314:	50520003 	subspl	r0, r2, r3
3000e318:	81a00fc1 	asrhi	r0, r1, #31
3000e31c:	31e00fc1 	mvncc	r0, r1, asr #31
3000e320:	13800001 	orrne	r0, r0, #1
3000e324:	e12fff1e 	bx	lr
3000e328:	e1f0cc42 	mvns	ip, r2, asr #24
3000e32c:	1a000001 	bne	3000e338 <__cmpsf2+0x4c>
3000e330:	e1b0c480 	lsls	ip, r0, #9
3000e334:	1a000003 	bne	3000e348 <__cmpsf2+0x5c>
3000e338:	e1f0cc43 	mvns	ip, r3, asr #24
3000e33c:	1afffff1 	bne	3000e308 <__cmpsf2+0x1c>
3000e340:	e1b0c481 	lsls	ip, r1, #9
3000e344:	0affffef 	beq	3000e308 <__cmpsf2+0x1c>
3000e348:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
3000e34c:	e12fff1e 	bx	lr

3000e350 <__aeabi_cfrcmple>:
3000e350:	e1a0c000 	mov	ip, r0
3000e354:	e1a00001 	mov	r0, r1
3000e358:	e1a0100c 	mov	r1, ip
3000e35c:	eaffffff 	b	3000e360 <__aeabi_cfcmpeq>

3000e360 <__aeabi_cfcmpeq>:
3000e360:	e92d400f 	push	{r0, r1, r2, r3, lr}
3000e364:	ebffffe0 	bl	3000e2ec <__cmpsf2>
3000e368:	e3500000 	cmp	r0, #0
3000e36c:	43700000 	cmnmi	r0, #0
3000e370:	e8bd400f 	pop	{r0, r1, r2, r3, lr}
3000e374:	e12fff1e 	bx	lr

3000e378 <__aeabi_fcmpeq>:
3000e378:	e52de008 	str	lr, [sp, #-8]!
3000e37c:	ebfffff7 	bl	3000e360 <__aeabi_cfcmpeq>
3000e380:	03a00001 	moveq	r0, #1
3000e384:	13a00000 	movne	r0, #0
3000e388:	e49de008 	ldr	lr, [sp], #8
3000e38c:	e12fff1e 	bx	lr

3000e390 <__aeabi_fcmplt>:
3000e390:	e52de008 	str	lr, [sp, #-8]!
3000e394:	ebfffff1 	bl	3000e360 <__aeabi_cfcmpeq>
3000e398:	33a00001 	movcc	r0, #1
3000e39c:	23a00000 	movcs	r0, #0
3000e3a0:	e49de008 	ldr	lr, [sp], #8
3000e3a4:	e12fff1e 	bx	lr

3000e3a8 <__aeabi_fcmple>:
3000e3a8:	e52de008 	str	lr, [sp, #-8]!
3000e3ac:	ebffffeb 	bl	3000e360 <__aeabi_cfcmpeq>
3000e3b0:	93a00001 	movls	r0, #1
3000e3b4:	83a00000 	movhi	r0, #0
3000e3b8:	e49de008 	ldr	lr, [sp], #8
3000e3bc:	e12fff1e 	bx	lr

3000e3c0 <__aeabi_fcmpge>:
3000e3c0:	e52de008 	str	lr, [sp, #-8]!
3000e3c4:	ebffffe1 	bl	3000e350 <__aeabi_cfrcmple>
3000e3c8:	93a00001 	movls	r0, #1
3000e3cc:	83a00000 	movhi	r0, #0
3000e3d0:	e49de008 	ldr	lr, [sp], #8
3000e3d4:	e12fff1e 	bx	lr

3000e3d8 <__aeabi_fcmpgt>:
3000e3d8:	e52de008 	str	lr, [sp, #-8]!
3000e3dc:	ebffffdb 	bl	3000e350 <__aeabi_cfrcmple>
3000e3e0:	33a00001 	movcc	r0, #1
3000e3e4:	23a00000 	movcs	r0, #0
3000e3e8:	e49de008 	ldr	lr, [sp], #8
3000e3ec:	e12fff1e 	bx	lr
3000e3f0:	72724544 	.word	0x72724544
3000e3f4:	0000000a 	.word	0x0000000a
3000e3f8:	69206e69 	.word	0x69206e69
3000e3fc:	2074696e 	.word	0x2074696e
3000e400:	00677073 	.word	0x00677073
3000e404:	6d656164 	.word	0x6d656164
3000e408:	00006e6f 	.word	0x00006e6f
3000e40c:	736e6f63 	.word	0x736e6f63
3000e410:	00656c6f 	.word	0x00656c6f
3000e414:	6c6c6568 	.word	0x6c6c6568
3000e418:	7073206f 	.word	0x7073206f
3000e41c:	00000067 	.word	0x00000067
3000e420:	656c6469 	.word	0x656c6469
3000e424:	00000000 	.word	0x00000000
3000e428:	69206e69 	.word	0x69206e69
3000e42c:	0074696e 	.word	0x0074696e
3000e430:	74696e69 	.word	0x74696e69
3000e434:	00000000 	.word	0x00000000
3000e438:	6f6c6c41 	.word	0x6f6c6c41
3000e43c:	68742063 	.word	0x68742063
3000e440:	64616572 	.word	0x64616572
3000e444:	2073253a 	.word	0x2073253a
3000e448:	6c696166 	.word	0x6c696166
3000e44c:	0000000a 	.word	0x0000000a
3000e450:	74206f4e 	.word	0x74206f4e
3000e454:	61657268 	.word	0x61657268
3000e458:	6f702064 	.word	0x6f702064
3000e45c:	7963696c 	.word	0x7963696c
3000e460:	70757320 	.word	0x70757320
3000e464:	74726f70 	.word	0x74726f70
3000e468:	0a64253a 	.word	0x0a64253a
3000e46c:	00000000 	.word	0x00000000
3000e470:	65657341 	.word	0x65657341
3000e474:	493a7472 	.word	0x493a7472
3000e478:	6573206e 	.word	0x6573206e
3000e47c:	7463656c 	.word	0x7463656c
3000e480:	72687420 	.word	0x72687420
3000e484:	00646165 	.word	0x00646165
3000e488:	6f6c6c41 	.word	0x6f6c6c41
3000e48c:	68742063 	.word	0x68742063
3000e490:	64616572 	.word	0x64616572
3000e494:	2073253a 	.word	0x2073253a
3000e498:	6c696166 	.word	0x6c696166
3000e49c:	0000000a 	.word	0x0000000a
3000e4a0:	74206f4e 	.word	0x74206f4e
3000e4a4:	61657268 	.word	0x61657268
3000e4a8:	74732064 	.word	0x74732064
3000e4ac:	3a6b6361 	.word	0x3a6b6361
3000e4b0:	000a7325 	.word	0x000a7325
3000e4b4:	6d6d6f63 	.word	0x6d6d6f63
3000e4b8:	00000000 	.word	0x00000000
3000e4bc:	20736552 	.word	0x20736552
3000e4c0:	656c6552 	.word	0x656c6552
3000e4c4:	0a657361 	.word	0x0a657361
3000e4c8:	00000000 	.word	0x00000000
3000e4cc:	20736552 	.word	0x20736552
3000e4d0:	656c6572 	.word	0x656c6572
3000e4d4:	20657361 	.word	0x20657361
3000e4d8:	0a727245 	.word	0x0a727245
3000e4dc:	00000000 	.word	0x00000000
3000e4e0:	20727245 	.word	0x20727245
3000e4e4:	0a736552 	.word	0x0a736552
3000e4e8:	00000000 	.word	0x00000000
3000e4ec:	000a7325 	.word	0x000a7325
3000e4f0:	20727245 	.word	0x20727245
3000e4f4:	27736572 	.word	0x27736572
3000e4f8:	64692073 	.word	0x64692073
3000e4fc:	0a78253a 	.word	0x0a78253a
3000e500:	00000000 	.word	0x00000000
3000e504:	65637845 	.word	0x65637845
3000e508:	6f697470 	.word	0x6f697470
3000e50c:	636f206e 	.word	0x636f206e
3000e510:	0a727563 	.word	0x0a727563
3000e514:	00000000 	.word	0x00000000
3000e518:	2a2a2a2a 	.word	0x2a2a2a2a
3000e51c:	2a2a2a2a 	.word	0x2a2a2a2a
3000e520:	2a2a2a2a 	.word	0x2a2a2a2a
3000e524:	2a2a2a2a 	.word	0x2a2a2a2a
3000e528:	000a2a2a 	.word	0x000a2a2a
3000e52c:	3a555043 	.word	0x3a555043
3000e530:	000a6425 	.word	0x000a6425
3000e534:	65726854 	.word	0x65726854
3000e538:	6e206461 	.word	0x6e206461
3000e53c:	3a656d61 	.word	0x3a656d61
3000e540:	000a7325 	.word	0x000a7325
3000e544:	65726854 	.word	0x65726854
3000e548:	70206461 	.word	0x70206461
3000e54c:	3a6f6972 	.word	0x3a6f6972
3000e550:	000a6425 	.word	0x000a6425
3000e554:	65726854 	.word	0x65726854
3000e558:	73206461 	.word	0x73206461
3000e55c:	6b636174 	.word	0x6b636174
3000e560:	7a69735f 	.word	0x7a69735f
3000e564:	64253a65 	.word	0x64253a65
3000e568:	0000000a 	.word	0x0000000a
3000e56c:	65726854 	.word	0x65726854
3000e570:	73206461 	.word	0x73206461
3000e574:	6b636174 	.word	0x6b636174
3000e578:	7475625f 	.word	0x7475625f
3000e57c:	3a6d6f74 	.word	0x3a6d6f74
3000e580:	78257830 	.word	0x78257830
3000e584:	0000000a 	.word	0x0000000a
3000e588:	65726854 	.word	0x65726854
3000e58c:	73206461 	.word	0x73206461
3000e590:	6b636174 	.word	0x6b636174
3000e594:	2578303a 	.word	0x2578303a
3000e598:	00000a78 	.word	0x00000a78
3000e59c:	303a6350 	.word	0x303a6350
3000e5a0:	0a782578 	.word	0x0a782578
3000e5a4:	00000000 	.word	0x00000000
3000e5a8:	63617453 	.word	0x63617453
3000e5ac:	78303a6b 	.word	0x78303a6b
3000e5b0:	000a7825 	.word	0x000a7825
3000e5b4:	74206e69 	.word	0x74206e69
3000e5b8:	20656d69 	.word	0x20656d69
3000e5bc:	6c616564 	.word	0x6c616564
3000e5c0:	00000000 	.word	0x00000000
3000e5c4:	74206e69 	.word	0x74206e69
3000e5c8:	20656d69 	.word	0x20656d69
3000e5cc:	6c616564 	.word	0x6c616564
3000e5d0:	726f6620 	.word	0x726f6620
3000e5d4:	00000000 	.word	0x00000000
3000e5d8:	74206e69 	.word	0x74206e69
3000e5dc:	6f656d69 	.word	0x6f656d69
3000e5e0:	64207475 	.word	0x64207475
3000e5e4:	006c6165 	.word	0x006c6165
3000e5e8:	6574756d 	.word	0x6574756d
3000e5ec:	554e2078 	.word	0x554e2078
3000e5f0:	000a4c4c 	.word	0x000a4c4c
3000e5f4:	6574756d 	.word	0x6574756d
3000e5f8:	72702078 	.word	0x72702078
3000e5fc:	65206f69 	.word	0x65206f69
3000e600:	000a7272 	.word	0x000a7272
3000e604:	6576654c 	.word	0x6576654c
3000e608:	0d64256c 	.word	0x0d64256c
3000e60c:	0000000a 	.word	0x0000000a
3000e610:	6d746962 	.word	0x6d746962
3000e614:	003a7061 	.word	0x003a7061
3000e618:	00207825 	.word	0x00207825
3000e61c:	00000a0d 	.word	0x00000a0d
3000e620:	65657246 	.word	0x65657246
3000e624:	6f6c4220 	.word	0x6f6c4220
3000e628:	68206b63 	.word	0x68206b63
3000e62c:	3a646165 	.word	0x3a646165
3000e630:	0a0d6425 	.word	0x0a0d6425
3000e634:	00000000 	.word	0x00000000
3000e638:	65657246 	.word	0x65657246
3000e63c:	6d654d20 	.word	0x6d654d20
3000e640:	6f6c4220 	.word	0x6f6c4220
3000e644:	4e206b63 	.word	0x4e206b63
3000e648:	65626d75 	.word	0x65626d75
3000e64c:	64253a72 	.word	0x64253a72
3000e650:	00000a0d 	.word	0x00000a0d
3000e654:	61766e49 	.word	0x61766e49
3000e658:	2064696c 	.word	0x2064696c
3000e65c:	65657246 	.word	0x65657246
3000e660:	64644120 	.word	0x64644120
3000e664:	73736572 	.word	0x73736572
3000e668:	2578303a 	.word	0x2578303a
3000e66c:	00000a78 	.word	0x00000a78
3000e670:	72646441 	.word	0x72646441
3000e674:	3a737365 	.word	0x3a737365
3000e678:	78257830 	.word	0x78257830
3000e67c:	76616820 	.word	0x76616820
3000e680:	65622065 	.word	0x65622065
3000e684:	66206e65 	.word	0x66206e65
3000e688:	64656572 	.word	0x64656572
3000e68c:	0000000a 	.word	0x0000000a
3000e690:	20727245 	.word	0x20727245
3000e694:	72646461 	.word	0x72646461
3000e698:	20737365 	.word	0x20737365
3000e69c:	30207369 	.word	0x30207369
3000e6a0:	2c782578 	.word	0x2c782578
3000e6a4:	657a6973 	.word	0x657a6973
3000e6a8:	6f687320 	.word	0x6f687320
3000e6ac:	20646c75 	.word	0x20646c75
3000e6b0:	20746f6e 	.word	0x20746f6e
3000e6b4:	30206562 	.word	0x30206562
3000e6b8:	00000000 	.word	0x00000000
3000e6bc:	61766e49 	.word	0x61766e49
3000e6c0:	6564696c 	.word	0x6564696c
3000e6c4:	65724620 	.word	0x65724620
3000e6c8:	64612065 	.word	0x64612065
3000e6cc:	73657264 	.word	0x73657264
3000e6d0:	78303a73 	.word	0x78303a73
3000e6d4:	000a7825 	.word	0x000a7825
3000e6d8:	72646441 	.word	0x72646441
3000e6dc:	3a737365 	.word	0x3a737365
3000e6e0:	78257830 	.word	0x78257830
3000e6e4:	76616820 	.word	0x76616820
3000e6e8:	65622065 	.word	0x65622065
3000e6ec:	66206e65 	.word	0x66206e65
3000e6f0:	64656572 	.word	0x64656572
3000e6f4:	0000000a 	.word	0x0000000a
3000e6f8:	20727265 	.word	0x20727265
3000e6fc:	72646461 	.word	0x72646461
3000e700:	20737365 	.word	0x20737365
3000e704:	30207369 	.word	0x30207369
3000e708:	2c782578 	.word	0x2c782578
3000e70c:	657a6973 	.word	0x657a6973
3000e710:	6f687320 	.word	0x6f687320
3000e714:	20646c75 	.word	0x20646c75
3000e718:	20746f6e 	.word	0x20746f6e
3000e71c:	30206562 	.word	0x30206562
3000e720:	00000000 	.word	0x00000000
3000e724:	206d654d 	.word	0x206d654d
3000e728:	74696e49 	.word	0x74696e49
3000e72c:	72724520 	.word	0x72724520
3000e730:	6f732c20 	.word	0x6f732c20
3000e734:	206f6e20 	.word	0x206f6e20
3000e738:	206d656d 	.word	0x206d656d
3000e73c:	63617073 	.word	0x63617073
3000e740:	6f742065 	.word	0x6f742065
3000e744:	6c616d20 	.word	0x6c616d20
3000e748:	0d636f6c 	.word	0x0d636f6c
3000e74c:	0000000a 	.word	0x0000000a
3000e750:	20727245 	.word	0x20727245
3000e754:	72646461 	.word	0x72646461
3000e758:	20737365 	.word	0x20737365
3000e75c:	30207369 	.word	0x30207369
3000e760:	2c782578 	.word	0x2c782578
3000e764:	657a6973 	.word	0x657a6973
3000e768:	6f687320 	.word	0x6f687320
3000e76c:	20646c75 	.word	0x20646c75
3000e770:	20746f6e 	.word	0x20746f6e
3000e774:	30206562 	.word	0x30206562
3000e778:	00000a0d 	.word	0x00000a0d
3000e77c:	20656854 	.word	0x20656854
3000e780:	72646461 	.word	0x72646461
3000e784:	20737365 	.word	0x20737365
3000e788:	30207369 	.word	0x30207369
3000e78c:	2c782578 	.word	0x2c782578
3000e790:	20656874 	.word	0x20656874
3000e794:	636f6c62 	.word	0x636f6c62
3000e798:	7369206b 	.word	0x7369206b
3000e79c:	65737520 	.word	0x65737520
3000e7a0:	6e612064 	.word	0x6e612064
3000e7a4:	74692064 	.word	0x74692064
3000e7a8:	73207327 	.word	0x73207327
3000e7ac:	20657a69 	.word	0x20657a69
3000e7b0:	25207369 	.word	0x25207369
3000e7b4:	000a0d64 	.word	0x000a0d64
3000e7b8:	20656854 	.word	0x20656854
3000e7bc:	72646461 	.word	0x72646461
3000e7c0:	20737365 	.word	0x20737365
3000e7c4:	30207369 	.word	0x30207369
3000e7c8:	2c782578 	.word	0x2c782578
3000e7cc:	20656874 	.word	0x20656874
3000e7d0:	636f6c62 	.word	0x636f6c62
3000e7d4:	7369206b 	.word	0x7369206b
3000e7d8:	756e7520 	.word	0x756e7520
3000e7dc:	20646573 	.word	0x20646573
3000e7e0:	20646e61 	.word	0x20646e61
3000e7e4:	73277469 	.word	0x73277469
3000e7e8:	7a697320 	.word	0x7a697320
3000e7ec:	73692065 	.word	0x73692065
3000e7f0:	0d642520 	.word	0x0d642520
3000e7f4:	0000000a 	.word	0x0000000a
3000e7f8:	20727245 	.word	0x20727245
3000e7fc:	206d6553 	.word	0x206d6553
3000e800:	74736f70 	.word	0x74736f70
3000e804:	0000000a 	.word	0x0000000a
3000e808:	2064690a 	.word	0x2064690a
3000e80c:	6425203d 	.word	0x6425203d
3000e810:	00000000 	.word	0x00000000
3000e814:	6177200a 	.word	0x6177200a
3000e818:	74207469 	.word	0x74207469
3000e81c:	61657268 	.word	0x61657268
3000e820:	6d207364 	.word	0x6d207364
3000e824:	3d206d75 	.word	0x3d206d75
3000e828:	00642520 	.word	0x00642520
3000e82c:	6c206f4e 	.word	0x6c206f4e
3000e830:	6c657665 	.word	0x6c657665
3000e834:	656d2032 	.word	0x656d2032
3000e838:	7073206d 	.word	0x7073206d
3000e83c:	20656361 	.word	0x20656361
3000e840:	20726f66 	.word	0x20726f66
3000e844:	76697270 	.word	0x76697270
3000e848:	5f657461 	.word	0x5f657461
3000e84c:	61746164 	.word	0x61746164
3000e850:	0a73253a 	.word	0x0a73253a
3000e854:	00000000 	.word	0x00000000
3000e858:	74204d52 	.word	0x74204d52
3000e85c:	61657268 	.word	0x61657268
3000e860:	73252064 	.word	0x73252064
3000e864:	72724520 	.word	0x72724520
3000e868:	6972502c 	.word	0x6972502c
3000e86c:	7369206f 	.word	0x7369206f
3000e870:	746f6e20 	.word	0x746f6e20
3000e874:	6f6e6520 	.word	0x6f6e6520
3000e878:	0a686775 	.word	0x0a686775
3000e87c:	00000000 	.word	0x00000000
3000e880:	63736944 	.word	0x63736944
3000e884:	20647261 	.word	0x20647261
3000e888:	65726874 	.word	0x65726874
3000e88c:	25206461 	.word	0x25206461
3000e890:	00000a73 	.word	0x00000a73
3000e894:	00006d72 	.word	0x00006d72
3000e898:	6c206f4e 	.word	0x6c206f4e
3000e89c:	6c657665 	.word	0x6c657665
3000e8a0:	656d2032 	.word	0x656d2032
3000e8a4:	7073206d 	.word	0x7073206d
3000e8a8:	20656361 	.word	0x20656361
3000e8ac:	20726f66 	.word	0x20726f66
3000e8b0:	76697270 	.word	0x76697270
3000e8b4:	5f657461 	.word	0x5f657461
3000e8b8:	61746164 	.word	0x61746164
3000e8bc:	0a73253a 	.word	0x0a73253a
3000e8c0:	00000000 	.word	0x00000000
3000e8c4:	74206f4e 	.word	0x74206f4e
3000e8c8:	61657268 	.word	0x61657268
3000e8cc:	74732064 	.word	0x74732064
3000e8d0:	3a6b6361 	.word	0x3a6b6361
3000e8d4:	000a7325 	.word	0x000a7325
3000e8d8:	70206e69 	.word	0x70206e69
3000e8dc:	6f697265 	.word	0x6f697265
3000e8e0:	68742064 	.word	0x68742064
3000e8e4:	64616572 	.word	0x64616572
3000e8e8:	61656420 	.word	0x61656420
3000e8ec:	0000006c 	.word	0x0000006c
3000e8f0:	70206e69 	.word	0x70206e69
3000e8f4:	6f697265 	.word	0x6f697265
3000e8f8:	68742064 	.word	0x68742064
3000e8fc:	64616572 	.word	0x64616572
3000e900:	61656420 	.word	0x61656420
3000e904:	0000206c 	.word	0x0000206c
3000e908:	69726570 	.word	0x69726570
3000e90c:	0000646f 	.word	0x0000646f
3000e910:	6c206f4e 	.word	0x6c206f4e
3000e914:	6c657665 	.word	0x6c657665
3000e918:	656d2032 	.word	0x656d2032
3000e91c:	7073206d 	.word	0x7073206d
3000e920:	20656361 	.word	0x20656361
3000e924:	20726f66 	.word	0x20726f66
3000e928:	76697270 	.word	0x76697270
3000e92c:	5f657461 	.word	0x5f657461
3000e930:	61746164 	.word	0x61746164
3000e934:	0a73253a 	.word	0x0a73253a
3000e938:	00000000 	.word	0x00000000
3000e93c:	74206f4e 	.word	0x74206f4e
3000e940:	61657268 	.word	0x61657268
3000e944:	74732064 	.word	0x74732064
3000e948:	3a6b6361 	.word	0x3a6b6361
3000e94c:	000a7325 	.word	0x000a7325
3000e950:	63696c73 	.word	0x63696c73
3000e954:	00000065 	.word	0x00000065
3000e958:	6f6c6c41 	.word	0x6f6c6c41
3000e95c:	6f502063 	.word	0x6f502063
3000e960:	20786973 	.word	0x20786973
3000e964:	65726874 	.word	0x65726874
3000e968:	66206461 	.word	0x66206461
3000e96c:	0a6c6961 	.word	0x0a6c6961
3000e970:	00000000 	.word	0x00000000
3000e974:	6d206f4e 	.word	0x6d206f4e
3000e978:	73206d65 	.word	0x73206d65
3000e97c:	65636170 	.word	0x65636170
3000e980:	726f6620 	.word	0x726f6620
3000e984:	736f7020 	.word	0x736f7020
3000e988:	70207869 	.word	0x70207869
3000e98c:	61766972 	.word	0x61766972
3000e990:	645f6574 	.word	0x645f6574
3000e994:	3a617461 	.word	0x3a617461
3000e998:	000a7325 	.word	0x000a7325
3000e99c:	74206f4e 	.word	0x74206f4e
3000e9a0:	61657268 	.word	0x61657268
3000e9a4:	74732064 	.word	0x74732064
3000e9a8:	3a6b6361 	.word	0x3a6b6361
3000e9ac:	000a7325 	.word	0x000a7325
3000e9b0:	69736f70 	.word	0x69736f70
3000e9b4:	00000078 	.word	0x00000078
3000e9b8:	74666f73 	.word	0x74666f73
3000e9bc:	616c6564 	.word	0x616c6564
3000e9c0:	00000079 	.word	0x00000079

3000e9c4 <small_digits>:
3000e9c4:	33323130 37363534 62613938 66656463     0123456789abcdef
3000e9d4:	6a696867 6e6d6c6b 7271706f 76757473     ghijklmnopqrstuv
3000e9e4:	7a797877 00000000                       wxyz....

3000e9ec <large_digits>:
3000e9ec:	33323130 37363534 42413938 46454443     0123456789ABCDEF
3000e9fc:	4a494847 4e4d4c4b 5251504f 56555453     GHIJKLMNOPQRSTUV
3000ea0c:	5a595857 00000000 4c554e3c 00003e4c     WXYZ....<NULL>..
3000ea1c:	736e6f63 00656c6f 6c756f43 6f6e2064     console.Could no
3000ea2c:	6f662074 20646e75 27732527 6d6f6320     t found '%s' com
3000ea3c:	646e616d 00000a0d 20756f79 206e6163     mand....you can 
3000ea4c:	65707974 65682720 0d27706c 0000000a     type 'help'.....
3000ea5c:	6c656873 0000006c 20656854 65726874     shell...The thre
3000ea6c:	68206461 20657661 43206f6e 6f736e6f     ad have no Conso
3000ea7c:	000a656c 00000a0d 726f4361 3e3a6c61     le......aCoral:>
3000ea8c:	00000000 736d656d 006e6163 77656956     ....memscan.View
3000ea9c:	65687420 72696620 4c207473 6c657665      the first Level
3000eaac:	6d654d20 2079726f 616e614d 6e656d67      Memory Managmen
3000eabc:	6e492074 00006f66 736d656d 326e6163     t Info..memscan2
3000eacc:	00000000 77656956 65687420 63657320     ....View the sec
3000eadc:	65646e6f 76654c20 4d206c65 726f6d65     onde Level Memor
3000eaec:	614d2079 6d67616e 20746e65 6f666e49     y Managment Info
3000eafc:	00000000 20207325 000a7325 706c6568     ....%s  %s..help
3000eb0c:	00000000 77656956 6c6c6120 65685320     ....View all She
3000eb1c:	43206c6c 616d6d6f 6920646e 006f666e     ll Command info.
3000eb2c:	74697865 00000000 74697845 65685320     exit....Exit She
3000eb3c:	00006c6c 47475053 474f474f 2121214f     ll..SPGGOGOGO!!!
3000eb4c:	00000000 00677073 74736145 65207265     ....spg.Easter e
3000eb5c:	00006767 79530909 6d657473 72685420     gg....System Thr
3000eb6c:	20646165 6f666e49 74616d72 0d6e6f69     ead Information.
3000eb7c:	0000000a 2d2d2d2d 2d2d2d2d 2d2d2d2d     ....------------
3000eb8c:	2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d     ----------------
3000eb9c:	2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d     ----------------
3000ebac:	2d2d2d2d 2d2d2d2d 0a0d2d2d 00000000     ----------......
3000ebbc:	656d614e 79540909 09096570 736e6f43     Name..Type..Cons
3000ebcc:	09656c6f 61745309 0a0d6574 00000000     ole..State......
3000ebdc:	09097325 00000000 6d6d6f43 09096e6f     %s......Common..
3000ebec:	00000000 63696c53 00090965 69726550     ....Slice...Peri
3000ebfc:	0909646f 00000000 09094d52 00000000     od......RM......
3000ec0c:	69736f50 00090978 09096425 00000000     Posix...%d......
3000ec1c:	6e6e7552 09676e69 00000009 64616552     Running.....Read
3000ec2c:	00090979 616c6544 00090979 65656c53     y...Delay...Slee
3000ec3c:	00090970 65657246 0909657a 00000000     p...Freeze......
3000ec4c:	6f727245 00090972 00000a0d 00007464     Error.......dt..
3000ec5c:	77656956 6c6c6120 72687420 20646165     View all thread 
3000ec6c:	6f666e69 00000000 736e6f63 00656c6f     info....console.
