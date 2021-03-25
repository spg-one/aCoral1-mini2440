
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
30000054:	3000eadc 	.word	0x3000eadc

30000058 <_bss_end>:
30000058:	30010424 	.word	0x30010424

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
30000284:	30001a8c 	.word	0x30001a8c
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
30000434:	eb000eee 	bl	30003ff4 <acoral_intr_entry>
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
3000047c:	eb002b84 	bl	3000b294 <acoral_prints>
    acoral_intr_entry(vector);
30000480:	e59d0004 	ldr	r0, [sp, #4]
30000484:	eb000eda 	bl	30003ff4 <acoral_intr_entry>
}
30000488:	e28dd014 	add	sp, sp, #20
3000048c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30000490:	e12fff1e 	bx	lr
30000494:	3000e1d4 	.word	0x3000e1d4

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
3000080c:	eb000e85 	bl	30004228 <acoral_set_intr_enter>
		acoral_set_intr_exit(i,NULL);
30000810:	e59d0004 	ldr	r0, [sp, #4]
30000814:	e3a01000 	mov	r1, #0
30000818:	eb000e95 	bl	30004274 <acoral_set_intr_exit>
		acoral_set_intr_mask(i,hal_intr_mask);
3000081c:	e59d0004 	ldr	r0, [sp, #4]
30000820:	e59f1034 	ldr	r1, [pc, #52]	; 3000085c <hal_intr_init+0xf4>
30000824:	eb000ea5 	bl	300042c0 <acoral_set_intr_mask>
		acoral_set_intr_unmask(i,hal_intr_unmask);
30000828:	e59d0004 	ldr	r0, [sp, #4]
3000082c:	e59f102c 	ldr	r1, [pc, #44]	; 30000860 <hal_intr_init+0xf8>
30000830:	eb000eb5 	bl	3000430c <acoral_set_intr_unmask>
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
300016bc:	eb000b37 	bl	300043a0 <acoral_fault_entry>
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
3000175c:	300103f4 	.word	0x300103f4

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
30001770:	300103f4 	.word	0x300103f4

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
300017b4:	300103f4 	.word	0x300103f4

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
300017d0:	300103f4 	.word	0x300103f4

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
300017e8:	eb000322 	bl	30002478 <acoral_real_sched>
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
30001814:	eb000342 	bl	30002524 <acoral_real_intr_sched>
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
30001914:	eb0021bc 	bl	3000a00c <acoral_list_del>
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
30001940:	eb000371 	bl	3000270c <acoral_release_thread>
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
30001970:	eb002192 	bl	30009fc0 <acoral_list_add2_tail>
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
3000198c:	eb000388 	bl	300027b4 <acoral_suspend_self>
	}
30001990:	eaffffd1 	b	300018dc <daem+0x14>
30001994:	3000fad0 	.word	0x3000fad0

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
	acoral_comm_policy_data_t data;
	acoral_ticks_init();
300019a4:	eb000add 	bl	30004520 <acoral_ticks_init>
	/*ticks中断初始化函数*/
	acoral_start_sched=true;
300019a8:	e59f30c4 	ldr	r3, [pc, #196]	; 30001a74 <init+0xdc>
300019ac:	e3a02001 	mov	r2, #1
300019b0:	e5832000 	str	r2, [r3]
	/*软件延时初始化函数*/
#ifdef CFG_SOFT_DELAY
	soft_delay_init();
300019b4:	eb002008 	bl	300099dc <soft_delay_init>
#ifdef CFG_STAT
	/*内核统计相关数据初始化*/
	stat_init();
#endif
	/*创建后台服务进程*/
  	acoral_init_list(&acoral_res_release_queue.head);
300019b8:	e59f30b8 	ldr	r3, [pc, #184]	; 30001a78 <init+0xe0>
300019bc:	e59f20b4 	ldr	r2, [pc, #180]	; 30001a78 <init+0xe0>
300019c0:	e5832000 	str	r2, [r3]
300019c4:	e59f30ac 	ldr	r3, [pc, #172]	; 30001a78 <init+0xe0>
300019c8:	e59f20a8 	ldr	r2, [pc, #168]	; 30001a78 <init+0xe0>
300019cc:	e5832004 	str	r2, [r3, #4]
  	acoral_spin_init(&acoral_res_release_queue.head.lock);
	data.cpu=acoral_current_cpu;
300019d0:	e3a03000 	mov	r3, #0
300019d4:	e5cd301c 	strb	r3, [sp, #28]
	data.prio=ACORAL_DAEMON_PRIO;
300019d8:	e3a03043 	mov	r3, #67	; 0x43
300019dc:	e5cd301d 	strb	r3, [sp, #29]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
300019e0:	e3a03004 	mov	r3, #4
300019e4:	e5cd301e 	strb	r3, [sp, #30]
	daemon_id=acoral_create_thread_ext(daem,DAEM_STACK_SIZE,NULL,"daemon",NULL,ACORAL_SCHED_POLICY_COMM,&data);
300019e8:	e3a03000 	mov	r3, #0
300019ec:	e58d3000 	str	r3, [sp]
300019f0:	e3a03015 	mov	r3, #21
300019f4:	e58d3004 	str	r3, [sp, #4]
300019f8:	e28d301c 	add	r3, sp, #28
300019fc:	e58d3008 	str	r3, [sp, #8]
30001a00:	e59f0074 	ldr	r0, [pc, #116]	; 30001a7c <init+0xe4>
30001a04:	e3a01c01 	mov	r1, #256	; 0x100
30001a08:	e3a02000 	mov	r2, #0
30001a0c:	e59f306c 	ldr	r3, [pc, #108]	; 30001a80 <init+0xe8>
30001a10:	eb000087 	bl	30001c34 <create_thread_ext>
30001a14:	e1a02000 	mov	r2, r0
30001a18:	e59f3064 	ldr	r3, [pc, #100]	; 30001a84 <init+0xec>
30001a1c:	e5832000 	str	r2, [r3]
	thread=(acoral_thread_t *)acoral_get_res_by_id(daemon_id);
30001a20:	e59f305c 	ldr	r3, [pc, #92]	; 30001a84 <init+0xec>
30001a24:	e5933000 	ldr	r3, [r3]
30001a28:	e1a00003 	mov	r0, r3
30001a2c:	eb000789 	bl	30003858 <acoral_get_res_by_id>
30001a30:	e1a03000 	mov	r3, r0
30001a34:	e1a02003 	mov	r2, r3
30001a38:	e59f3048 	ldr	r3, [pc, #72]	; 30001a88 <init+0xf0>
30001a3c:	e5832000 	str	r2, [r3]
	if(daemon_id==-1)
30001a40:	e59f303c 	ldr	r3, [pc, #60]	; 30001a84 <init+0xec>
30001a44:	e5933000 	ldr	r3, [r3]
30001a48:	e3730001 	cmn	r3, #1
30001a4c:	1a000000 	bne	30001a54 <init+0xbc>
		while(1);
30001a50:	eafffffe 	b	30001a50 <init+0xb8>
	/*应用级相关服务初始化,应用级不要使用延时函数，没有效果的*/
#ifdef CFG_SHELL
	acoral_shell_init();
30001a54:	eb002cb2 	bl	3000cd24 <acoral_shell_init>
#endif
	plugin_init();
30001a58:	eb002b21 	bl	3000c6e4 <plugin_init>
	app_enter_policy_init();
30001a5c:	eb000147 	bl	30001f80 <app_enter_policy_init>
	user_main();
30001a60:	eb002b2b 	bl	3000c714 <user_main>
#ifdef CFG_TEST
	test_init();
#endif
	app_exit_policy_init();
30001a64:	eb000149 	bl	30001f90 <app_exit_policy_init>
}
30001a68:	e28dd024 	add	sp, sp, #36	; 0x24
30001a6c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001a70:	e12fff1e 	bx	lr
30001a74:	3000eadc 	.word	0x3000eadc
30001a78:	3000fad0 	.word	0x3000fad0
30001a7c:	300018c8 	.word	0x300018c8
30001a80:	3000e1dc 	.word	0x3000e1dc
30001a84:	3000fabc 	.word	0x3000fabc
30001a88:	3000fa30 	.word	0x3000fa30

30001a8c <acoral_start>:
acoral_thread_t orig_thread;
/*================================
 * Entry c function of start.S 
 *       c语言初始化入口函数
 *================================*/
void acoral_start(){
30001a8c:	e92d4008 	push	{r3, lr}
		acoral_follow_cpu_start();
	}
	core_cpu=0;
	HAL_CORE_CPU_INIT();
#endif
	orig_thread.console_id=ACORAL_DEV_ERR_ID;
30001a90:	e59f3030 	ldr	r3, [pc, #48]	; 30001ac8 <acoral_start+0x3c>
30001a94:	e3e02000 	mvn	r2, #0
30001a98:	e583204c 	str	r2, [r3, #76]	; 0x4c
	acoral_set_orig_thread(&orig_thread);
30001a9c:	e59f0024 	ldr	r0, [pc, #36]	; 30001ac8 <acoral_start+0x3c>
30001aa0:	eb00015a 	bl	30002010 <acoral_set_orig_thread>
	/*板子初始化*/
	HAL_BOARD_INIT();

	/*内核模块初始化*/
	acoral_module_init();
30001aa4:	eb000058 	bl	30001c0c <acoral_module_init>

	/*串口终端应该初始化好了，将根线程的终端id设置为串口终端*/
#ifdef CFG_DRIVER
	orig_thread.console_id=acoral_dev_open("console");;
30001aa8:	e59f001c 	ldr	r0, [pc, #28]	; 30001acc <acoral_start+0x40>
30001aac:	eb002e4c 	bl	3000d3e4 <acoral_dev_open>
30001ab0:	e1a02000 	mov	r2, r0
30001ab4:	e59f300c 	ldr	r3, [pc, #12]	; 30001ac8 <acoral_start+0x3c>
30001ab8:	e583204c 	str	r2, [r3, #76]	; 0x4c
	/*cmp初始化*/
    	acoral_cmp_init();
#endif

	/*主cpu开始函数*/
	acoral_core_cpu_start();
30001abc:	eb000003 	bl	30001ad0 <acoral_core_cpu_start>
}
30001ac0:	e8bd4008 	pop	{r3, lr}
30001ac4:	e12fff1e 	bx	lr
30001ac8:	3000fa34 	.word	0x3000fa34
30001acc:	3000e1e4 	.word	0x3000e1e4

30001ad0 <acoral_core_cpu_start>:
/*================================
 *  the primary cpu core start function 
 *      主cpu core的开始函数
 *================================*/
#define IDLE_STACK_SIZE 128
void acoral_core_cpu_start(){
30001ad0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001ad4:	e24dd01c 	sub	sp, sp, #28
	acoral_comm_policy_data_t data;
	/*创建空闲线程*/
	acoral_start_sched=false;
30001ad8:	e59f30cc 	ldr	r3, [pc, #204]	; 30001bac <acoral_core_cpu_start+0xdc>
30001adc:	e3a02000 	mov	r2, #0
30001ae0:	e5832000 	str	r2, [r3]
	data.cpu=acoral_current_cpu;
30001ae4:	e3a03000 	mov	r3, #0
30001ae8:	e5cd3014 	strb	r3, [sp, #20]
	data.prio=ACORAL_IDLE_PRIO;
30001aec:	e3a03046 	mov	r3, #70	; 0x46
30001af0:	e5cd3015 	strb	r3, [sp, #21]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
30001af4:	e3a03004 	mov	r3, #4
30001af8:	e5cd3016 	strb	r3, [sp, #22]
	idle_id=acoral_create_thread_ext(idle,IDLE_STACK_SIZE,NULL,"idle",NULL,ACORAL_SCHED_POLICY_COMM,&data);
30001afc:	e3a03000 	mov	r3, #0
30001b00:	e58d3000 	str	r3, [sp]
30001b04:	e3a03015 	mov	r3, #21
30001b08:	e58d3004 	str	r3, [sp, #4]
30001b0c:	e28d3014 	add	r3, sp, #20
30001b10:	e58d3008 	str	r3, [sp, #8]
30001b14:	e59f0094 	ldr	r0, [pc, #148]	; 30001bb0 <acoral_core_cpu_start+0xe0>
30001b18:	e3a01080 	mov	r1, #128	; 0x80
30001b1c:	e3a02000 	mov	r2, #0
30001b20:	e59f308c 	ldr	r3, [pc, #140]	; 30001bb4 <acoral_core_cpu_start+0xe4>
30001b24:	eb000042 	bl	30001c34 <create_thread_ext>
30001b28:	e1a02000 	mov	r2, r0
30001b2c:	e59f3084 	ldr	r3, [pc, #132]	; 30001bb8 <acoral_core_cpu_start+0xe8>
30001b30:	e5832000 	str	r2, [r3]
	if(idle_id==-1)
30001b34:	e59f307c 	ldr	r3, [pc, #124]	; 30001bb8 <acoral_core_cpu_start+0xe8>
30001b38:	e5933000 	ldr	r3, [r3]
30001b3c:	e3730001 	cmn	r3, #1
30001b40:	1a000000 	bne	30001b48 <acoral_core_cpu_start+0x78>
		while(1);
30001b44:	eafffffe 	b	30001b44 <acoral_core_cpu_start+0x74>
	/*创建初始化线程,这个调用层次比较多，需要多谢堆栈*/
	data.prio=ACORAL_INIT_PRIO;
30001b48:	e3a03000 	mov	r3, #0
30001b4c:	e5cd3015 	strb	r3, [sp, #21]
	/*动态堆栈*/
	init_id=acoral_create_thread_ext(init,ACORAL_TEST_STACK_SIZE,"in init","init",NULL,ACORAL_SCHED_POLICY_COMM,&data);
30001b50:	e3a03000 	mov	r3, #0
30001b54:	e58d3000 	str	r3, [sp]
30001b58:	e3a03015 	mov	r3, #21
30001b5c:	e58d3004 	str	r3, [sp, #4]
30001b60:	e28d3014 	add	r3, sp, #20
30001b64:	e58d3008 	str	r3, [sp, #8]
30001b68:	e59f004c 	ldr	r0, [pc, #76]	; 30001bbc <acoral_core_cpu_start+0xec>
30001b6c:	e3a01c02 	mov	r1, #512	; 0x200
30001b70:	e59f2048 	ldr	r2, [pc, #72]	; 30001bc0 <acoral_core_cpu_start+0xf0>
30001b74:	e59f3048 	ldr	r3, [pc, #72]	; 30001bc4 <acoral_core_cpu_start+0xf4>
30001b78:	eb00002d 	bl	30001c34 <create_thread_ext>
30001b7c:	e1a02000 	mov	r2, r0
30001b80:	e59f3040 	ldr	r3, [pc, #64]	; 30001bc8 <acoral_core_cpu_start+0xf8>
30001b84:	e5832000 	str	r2, [r3]
	if(init_id==-1)
30001b88:	e59f3038 	ldr	r3, [pc, #56]	; 30001bc8 <acoral_core_cpu_start+0xf8>
30001b8c:	e5933000 	ldr	r3, [r3]
30001b90:	e3730001 	cmn	r3, #1
30001b94:	1a000000 	bne	30001b9c <acoral_core_cpu_start+0xcc>
		while(1);
30001b98:	eafffffe 	b	30001b98 <acoral_core_cpu_start+0xc8>
	acoral_start_os();
30001b9c:	eb00000a 	bl	30001bcc <acoral_start_os>
}
30001ba0:	e28dd01c 	add	sp, sp, #28
30001ba4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001ba8:	e12fff1e 	bx	lr
30001bac:	3000eadc 	.word	0x3000eadc
30001bb0:	300018bc 	.word	0x300018bc
30001bb4:	3000e1ec 	.word	0x3000e1ec
30001bb8:	30010334 	.word	0x30010334
30001bbc:	30001998 	.word	0x30001998
30001bc0:	3000e1f4 	.word	0x3000e1f4
30001bc4:	3000e1fc 	.word	0x3000e1fc
30001bc8:	30010364 	.word	0x30010364

30001bcc <acoral_start_os>:

void acoral_start_os(){
30001bcc:	e92d4008 	push	{r3, lr}
	acoral_sched_init();
30001bd0:	eb0000f2 	bl	30001fa0 <acoral_sched_init>
	acoral_select_thread();
30001bd4:	eb00027d 	bl	300025d0 <acoral_select_thread>
	acoral_set_running_thread(acoral_ready_thread);
30001bd8:	e59f3024 	ldr	r3, [pc, #36]	; 30001c04 <acoral_start_os+0x38>
30001bdc:	e5933000 	ldr	r3, [r3]
30001be0:	e1a00003 	mov	r0, r3
30001be4:	eb000111 	bl	30002030 <acoral_set_running_thread>
	HAL_START_OS(&acoral_cur_thread->stack);
30001be8:	e59f3018 	ldr	r3, [pc, #24]	; 30001c08 <acoral_start_os+0x3c>
30001bec:	e5933000 	ldr	r3, [r3]
30001bf0:	e2833034 	add	r3, r3, #52	; 0x34
30001bf4:	e1a00003 	mov	r0, r3
30001bf8:	ebfffe63 	bl	3000158c <HAL_SWITCH_TO>
}
30001bfc:	e8bd4008 	pop	{r3, lr}
30001c00:	e12fff1e 	bx	lr
30001c04:	300103f0 	.word	0x300103f0
30001c08:	300103f8 	.word	0x300103f8

30001c0c <acoral_module_init>:

/*================================
 *  the subsystem init of the kernel
 *     内核各模块初始化
 *================================*/
void acoral_module_init(){
30001c0c:	e92d4008 	push	{r3, lr}
	/*中断系统初始化*/
	acoral_intr_sys_init();
30001c10:	eb000823 	bl	30003ca4 <acoral_intr_sys_init>
	/*内存管理系统初始化*/
	acoral_mem_sys_init();
30001c14:	eb000b91 	bl	30004a60 <acoral_mem_sys_init>
	/*资源管理系统初始化*/
	acoral_res_sys_init();
30001c18:	eb0007fd 	bl	30003c14 <acoral_res_sys_init>
	/*驱动管理系统初始化*/
	/*线程管理系统初始化*/
	acoral_thread_sys_init();
30001c1c:	eb0004cf 	bl	30002f60 <acoral_thread_sys_init>
	/*时钟管理系统初始化*/
	acoral_time_sys_init();
30001c20:	eb000a22 	bl	300044b0 <acoral_time_sys_init>
	/*事件管理系统初始化,这个必须要，因为内存管理系统用到了*/
	acoral_evt_sys_init();
30001c24:	eb000bca 	bl	30004b54 <acoral_evt_sys_init>
	/*消息管理系统初始化*/
#ifdef CFG_DRIVER
	acoral_drv_sys_init();
30001c28:	eb002ebc 	bl	3000d720 <acoral_drv_sys_init>
#endif
}
30001c2c:	e8bd4008 	pop	{r3, lr}
30001c30:	e12fff1e 	bx	lr

30001c34 <create_thread_ext>:
#include<queue.h>
#include<thread.h>
#include<print.h>
#include<policy.h>
acoral_queue_t policy_list;
acoral_id create_thread_ext(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,void *stack,acoral_u32 sched_policy,void *data){
30001c34:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001c38:	e24dd024 	sub	sp, sp, #36	; 0x24
30001c3c:	e58d0014 	str	r0, [sp, #20]
30001c40:	e58d1010 	str	r1, [sp, #16]
30001c44:	e58d200c 	str	r2, [sp, #12]
30001c48:	e58d3008 	str	r3, [sp, #8]
	acoral_thread_t *thread;
        /*分配tcb数据块*/
	thread=acoral_alloc_thread();
30001c4c:	eb0003fb 	bl	30002c40 <acoral_alloc_thread>
30001c50:	e1a03000 	mov	r3, r0
30001c54:	e58d301c 	str	r3, [sp, #28]
	if(NULL==thread){
30001c58:	e59d301c 	ldr	r3, [sp, #28]
30001c5c:	e3530000 	cmp	r3, #0
30001c60:	1a000004 	bne	30001c78 <create_thread_ext+0x44>
		acoral_printerr("Alloc thread:%s fail\n",name);
30001c64:	e59f0098 	ldr	r0, [pc, #152]	; 30001d04 <create_thread_ext+0xd0>
30001c68:	e59d1008 	ldr	r1, [sp, #8]
30001c6c:	eb002565 	bl	3000b208 <acoral_print>
		acoral_printk("No Mem Space or Beyond the max thread\n");
		return -1;
30001c70:	e3e03000 	mvn	r3, #0
30001c74:	ea00001e 	b	30001cf4 <create_thread_ext+0xc0>
	}
	thread->name=name;
30001c78:	e59d301c 	ldr	r3, [sp, #28]
30001c7c:	e59d2008 	ldr	r2, [sp, #8]
30001c80:	e5832048 	str	r2, [r3, #72]	; 0x48
	stack_size=stack_size&(~3);
30001c84:	e59d3010 	ldr	r3, [sp, #16]
30001c88:	e3c33003 	bic	r3, r3, #3
30001c8c:	e58d3010 	str	r3, [sp, #16]
	thread->stack_size=stack_size;
30001c90:	e59d301c 	ldr	r3, [sp, #28]
30001c94:	e59d2010 	ldr	r2, [sp, #16]
30001c98:	e583203c 	str	r2, [r3, #60]	; 0x3c
	if(stack!=NULL)
30001c9c:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30001ca0:	e3530000 	cmp	r3, #0
30001ca4:	0a000003 	beq	30001cb8 <create_thread_ext+0x84>
		thread->stack_buttom=(acoral_u32 *)stack;
30001ca8:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30001cac:	e59d301c 	ldr	r3, [sp, #28]
30001cb0:	e5832038 	str	r2, [r3, #56]	; 0x38
30001cb4:	ea000002 	b	30001cc4 <create_thread_ext+0x90>
	else
		thread->stack_buttom=NULL;
30001cb8:	e59d301c 	ldr	r3, [sp, #28]
30001cbc:	e3a02000 	mov	r2, #0
30001cc0:	e5832038 	str	r2, [r3, #56]	; 0x38
	thread->policy=sched_policy;
30001cc4:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30001cc8:	e20320ff 	and	r2, r3, #255	; 0xff
30001ccc:	e59d301c 	ldr	r3, [sp, #28]
30001cd0:	e5c3200c 	strb	r2, [r3, #12]
	return acoral_policy_thread_init(sched_policy,thread,route,args,data);
30001cd4:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
30001cd8:	e58d3000 	str	r3, [sp]
30001cdc:	e59d002c 	ldr	r0, [sp, #44]	; 0x2c
30001ce0:	e59d101c 	ldr	r1, [sp, #28]
30001ce4:	e59d2014 	ldr	r2, [sp, #20]
30001ce8:	e59d300c 	ldr	r3, [sp, #12]
30001cec:	eb000025 	bl	30001d88 <acoral_policy_thread_init>
30001cf0:	e1a03000 	mov	r3, r0
}
30001cf4:	e1a00003 	mov	r0, r3
30001cf8:	e28dd024 	add	sp, sp, #36	; 0x24
30001cfc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001d00:	e12fff1e 	bx	lr
30001d04:	3000e204 	.word	0x3000e204

30001d08 <acoral_get_policy_ctrl>:

acoral_sched_policy_t *acoral_get_policy_ctrl(acoral_u8 type){
30001d08:	e24dd018 	sub	sp, sp, #24
30001d0c:	e1a03000 	mov	r3, r0
30001d10:	e5cd3007 	strb	r3, [sp, #7]
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
30001d14:	e59f3068 	ldr	r3, [pc, #104]	; 30001d84 <acoral_get_policy_ctrl+0x7c>
30001d18:	e58d3010 	str	r3, [sp, #16]
	tmp=head;
30001d1c:	e59d3010 	ldr	r3, [sp, #16]
30001d20:	e58d300c 	str	r3, [sp, #12]
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001d24:	e59d3010 	ldr	r3, [sp, #16]
30001d28:	e5933000 	ldr	r3, [r3]
30001d2c:	e58d300c 	str	r3, [sp, #12]
30001d30:	ea00000b 	b	30001d64 <acoral_get_policy_ctrl+0x5c>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
30001d34:	e59d300c 	ldr	r3, [sp, #12]
30001d38:	e58d3014 	str	r3, [sp, #20]
		if(policy_ctrl->type==type)
30001d3c:	e59d3014 	ldr	r3, [sp, #20]
30001d40:	e5d33008 	ldrb	r3, [r3, #8]
30001d44:	e5dd2007 	ldrb	r2, [sp, #7]
30001d48:	e1520003 	cmp	r2, r3
30001d4c:	1a000001 	bne	30001d58 <acoral_get_policy_ctrl+0x50>
			return policy_ctrl;
30001d50:	e59d3014 	ldr	r3, [sp, #20]
30001d54:	ea000007 	b	30001d78 <acoral_get_policy_ctrl+0x70>
acoral_sched_policy_t *acoral_get_policy_ctrl(acoral_u8 type){
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
	tmp=head;
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001d58:	e59d300c 	ldr	r3, [sp, #12]
30001d5c:	e5933000 	ldr	r3, [r3]
30001d60:	e58d300c 	str	r3, [sp, #12]
30001d64:	e59d200c 	ldr	r2, [sp, #12]
30001d68:	e59d3010 	ldr	r3, [sp, #16]
30001d6c:	e1520003 	cmp	r2, r3
30001d70:	1affffef 	bne	30001d34 <acoral_get_policy_ctrl+0x2c>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
		if(policy_ctrl->type==type)
			return policy_ctrl;
	}
	return NULL;
30001d74:	e3a03000 	mov	r3, #0
}
30001d78:	e1a00003 	mov	r0, r3
30001d7c:	e28dd018 	add	sp, sp, #24
30001d80:	e12fff1e 	bx	lr
30001d84:	30010338 	.word	0x30010338

30001d88 <acoral_policy_thread_init>:

acoral_id acoral_policy_thread_init(acoral_u32 policy,acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30001d88:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001d8c:	e24dd01c 	sub	sp, sp, #28
30001d90:	e58d000c 	str	r0, [sp, #12]
30001d94:	e58d1008 	str	r1, [sp, #8]
30001d98:	e58d2004 	str	r2, [sp, #4]
30001d9c:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_sched_policy_t   *policy_ctrl;
	policy_ctrl=acoral_get_policy_ctrl(policy);	
30001da0:	e59d300c 	ldr	r3, [sp, #12]
30001da4:	e20330ff 	and	r3, r3, #255	; 0xff
30001da8:	e1a00003 	mov	r0, r3
30001dac:	ebffffd5 	bl	30001d08 <acoral_get_policy_ctrl>
30001db0:	e1a03000 	mov	r3, r0
30001db4:	e58d3014 	str	r3, [sp, #20]
	if(policy_ctrl==NULL||policy_ctrl->policy_thread_init==NULL){
30001db8:	e59d3014 	ldr	r3, [sp, #20]
30001dbc:	e3530000 	cmp	r3, #0
30001dc0:	0a000003 	beq	30001dd4 <acoral_policy_thread_init+0x4c>
30001dc4:	e59d3014 	ldr	r3, [sp, #20]
30001dc8:	e593300c 	ldr	r3, [r3, #12]
30001dcc:	e3530000 	cmp	r3, #0
30001dd0:	1a00000e 	bne	30001e10 <acoral_policy_thread_init+0x88>
		HAL_ENTER_CRITICAL();
30001dd4:	ebfffe46 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30001dd8:	e1a03000 	mov	r3, r0
30001ddc:	e58d3010 	str	r3, [sp, #16]
		acoral_release_res((acoral_res_t *)thread);
30001de0:	e59d3008 	ldr	r3, [sp, #8]
30001de4:	e1a00003 	mov	r0, r3
30001de8:	eb000606 	bl	30003608 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30001dec:	e59d0010 	ldr	r0, [sp, #16]
30001df0:	ebfffe3d 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_printerr("No thread policy support:%d\n",thread->policy);
30001df4:	e59d3008 	ldr	r3, [sp, #8]
30001df8:	e5d3300c 	ldrb	r3, [r3, #12]
30001dfc:	e59f0040 	ldr	r0, [pc, #64]	; 30001e44 <acoral_policy_thread_init+0xbc>
30001e00:	e1a01003 	mov	r1, r3
30001e04:	eb0024ff 	bl	3000b208 <acoral_print>
		return -1;
30001e08:	e3e03000 	mvn	r3, #0
30001e0c:	ea000008 	b	30001e34 <acoral_policy_thread_init+0xac>
	}
	return policy_ctrl->policy_thread_init(thread,route,args,data);
30001e10:	e59d3014 	ldr	r3, [sp, #20]
30001e14:	e593c00c 	ldr	ip, [r3, #12]
30001e18:	e59d0008 	ldr	r0, [sp, #8]
30001e1c:	e59d1004 	ldr	r1, [sp, #4]
30001e20:	e59d2000 	ldr	r2, [sp]
30001e24:	e59d3020 	ldr	r3, [sp, #32]
30001e28:	e1a0e00f 	mov	lr, pc
30001e2c:	e12fff1c 	bx	ip
30001e30:	e1a03000 	mov	r3, r0
}
30001e34:	e1a00003 	mov	r0, r3
30001e38:	e28dd01c 	add	sp, sp, #28
30001e3c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001e40:	e12fff1e 	bx	lr
30001e44:	3000e21c 	.word	0x3000e21c

30001e48 <acoral_register_sched_policy>:

void acoral_register_sched_policy(acoral_sched_policy_t *policy){
30001e48:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001e4c:	e24dd00c 	sub	sp, sp, #12
30001e50:	e58d0004 	str	r0, [sp, #4]
	acoral_list_add2_tail(&policy->list,&policy_list.head);
30001e54:	e59d3004 	ldr	r3, [sp, #4]
30001e58:	e1a00003 	mov	r0, r3
30001e5c:	e59f100c 	ldr	r1, [pc, #12]	; 30001e70 <acoral_register_sched_policy+0x28>
30001e60:	eb002056 	bl	30009fc0 <acoral_list_add2_tail>
}
30001e64:	e28dd00c 	add	sp, sp, #12
30001e68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001e6c:	e12fff1e 	bx	lr
30001e70:	30010338 	.word	0x30010338

30001e74 <acoral_policy_delay_deal>:

void acoral_policy_delay_deal(){
30001e74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001e78:	e24dd014 	sub	sp, sp, #20
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
30001e7c:	e59f3068 	ldr	r3, [pc, #104]	; 30001eec <acoral_policy_delay_deal+0x78>
30001e80:	e58d3008 	str	r3, [sp, #8]
	tmp=head;
30001e84:	e59d3008 	ldr	r3, [sp, #8]
30001e88:	e58d3004 	str	r3, [sp, #4]
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001e8c:	e59d3008 	ldr	r3, [sp, #8]
30001e90:	e5933000 	ldr	r3, [r3]
30001e94:	e58d3004 	str	r3, [sp, #4]
30001e98:	ea00000c 	b	30001ed0 <acoral_policy_delay_deal+0x5c>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
30001e9c:	e59d3004 	ldr	r3, [sp, #4]
30001ea0:	e58d300c 	str	r3, [sp, #12]
		if(policy_ctrl->delay_deal!=NULL)
30001ea4:	e59d300c 	ldr	r3, [sp, #12]
30001ea8:	e5933014 	ldr	r3, [r3, #20]
30001eac:	e3530000 	cmp	r3, #0
30001eb0:	0a000003 	beq	30001ec4 <acoral_policy_delay_deal+0x50>
			policy_ctrl->delay_deal();
30001eb4:	e59d300c 	ldr	r3, [sp, #12]
30001eb8:	e5933014 	ldr	r3, [r3, #20]
30001ebc:	e1a0e00f 	mov	lr, pc
30001ec0:	e12fff13 	bx	r3
void acoral_policy_delay_deal(){
	acoral_list_t   *tmp,*head;
	acoral_sched_policy_t  *policy_ctrl;
	head=&policy_list.head;
	tmp=head;
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30001ec4:	e59d3004 	ldr	r3, [sp, #4]
30001ec8:	e5933000 	ldr	r3, [r3]
30001ecc:	e58d3004 	str	r3, [sp, #4]
30001ed0:	e59d2004 	ldr	r2, [sp, #4]
30001ed4:	e59d3008 	ldr	r3, [sp, #8]
30001ed8:	e1520003 	cmp	r2, r3
30001edc:	1affffee 	bne	30001e9c <acoral_policy_delay_deal+0x28>
		policy_ctrl=list_entry(tmp,acoral_sched_policy_t,list);
		if(policy_ctrl->delay_deal!=NULL)
			policy_ctrl->delay_deal();
	}
}
30001ee0:	e28dd014 	add	sp, sp, #20
30001ee4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001ee8:	e12fff1e 	bx	lr
30001eec:	30010338 	.word	0x30010338

30001ef0 <acoral_policy_thread_release>:

void acoral_policy_thread_release(acoral_thread_t *thread){
30001ef0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30001ef4:	e24dd014 	sub	sp, sp, #20
30001ef8:	e58d0004 	str	r0, [sp, #4]
	acoral_sched_policy_t   *policy_ctrl;
	policy_ctrl=acoral_get_policy_ctrl(thread->policy);
30001efc:	e59d3004 	ldr	r3, [sp, #4]
30001f00:	e5d3300c 	ldrb	r3, [r3, #12]
30001f04:	e1a00003 	mov	r0, r3
30001f08:	ebffff7e 	bl	30001d08 <acoral_get_policy_ctrl>
30001f0c:	e1a03000 	mov	r3, r0
30001f10:	e58d300c 	str	r3, [sp, #12]
	if(policy_ctrl->policy_thread_release!=NULL)
30001f14:	e59d300c 	ldr	r3, [sp, #12]
30001f18:	e5933010 	ldr	r3, [r3, #16]
30001f1c:	e3530000 	cmp	r3, #0
30001f20:	0a000004 	beq	30001f38 <acoral_policy_thread_release+0x48>
		policy_ctrl->policy_thread_release(thread);
30001f24:	e59d300c 	ldr	r3, [sp, #12]
30001f28:	e5933010 	ldr	r3, [r3, #16]
30001f2c:	e59d0004 	ldr	r0, [sp, #4]
30001f30:	e1a0e00f 	mov	lr, pc
30001f34:	e12fff13 	bx	r3
}
30001f38:	e28dd014 	add	sp, sp, #20
30001f3c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30001f40:	e12fff1e 	bx	lr

30001f44 <acoral_sched_policy_init>:


void acoral_sched_policy_init(){
30001f44:	e92d4008 	push	{r3, lr}
	acoral_list_init(&policy_list.head);
30001f48:	e59f302c 	ldr	r3, [pc, #44]	; 30001f7c <acoral_sched_policy_init+0x38>
30001f4c:	e59f2028 	ldr	r2, [pc, #40]	; 30001f7c <acoral_sched_policy_init+0x38>
30001f50:	e5832000 	str	r2, [r3]
30001f54:	e59f3020 	ldr	r3, [pc, #32]	; 30001f7c <acoral_sched_policy_init+0x38>
30001f58:	e59f201c 	ldr	r2, [pc, #28]	; 30001f7c <acoral_sched_policy_init+0x38>
30001f5c:	e5832004 	str	r2, [r3, #4]
	comm_policy_init();
30001f60:	eb000477 	bl	30003144 <comm_policy_init>
#ifdef CFG_THRD_SLICE
	slice_policy_init();
30001f64:	eb001d01 	bl	30009370 <slice_policy_init>
#endif
#ifdef CFG_THRD_PERIOD
	period_policy_init();
30001f68:	eb001c43 	bl	3000907c <period_policy_init>
#endif
#ifdef CFG_THRD_RM
	rm_policy_init();
30001f6c:	eb001aba 	bl	30008a5c <rm_policy_init>
#endif
#ifdef CFG_THRD_POSIX
	posix_policy_init();
30001f70:	eb001e4b 	bl	300098a4 <posix_policy_init>
#endif
}
30001f74:	e8bd4008 	pop	{r3, lr}
30001f78:	e12fff1e 	bx	lr
30001f7c:	30010338 	.word	0x30010338

30001f80 <app_enter_policy_init>:

void app_enter_policy_init(){
30001f80:	e92d4008 	push	{r3, lr}
#ifdef CFG_THRD_RM
	rm_init();
30001f84:	eb001a8f 	bl	300089c8 <rm_init>
#endif
}
30001f88:	e8bd4008 	pop	{r3, lr}
30001f8c:	e12fff1e 	bx	lr

30001f90 <app_exit_policy_init>:

void app_exit_policy_init(){
30001f90:	e92d4008 	push	{r3, lr}
#ifdef CFG_THRD_RM
	rm_end();
30001f94:	eb001ac9 	bl	30008ac0 <rm_end>
#endif
}
30001f98:	e8bd4008 	pop	{r3, lr}
30001f9c:	e12fff1e 	bx	lr

30001fa0 <acoral_sched_init>:
#include<lsched.h>
acoral_u8 need_sched[HAL_MAX_CPU];
acoral_u8 sched_lock[HAL_MAX_CPU];
acoral_thread_t *running_thread[HAL_MAX_CPU],*ready_thread[HAL_MAX_CPU];
static acoral_rdy_queue_t acoral_ready_queues[HAL_MAX_CPU];
void acoral_sched_init(){
30001fa0:	e24dd008 	sub	sp, sp, #8
	acoral_u8 i;
	for(i=0;i<HAL_MAX_CPU;i++){
30001fa4:	e3a03000 	mov	r3, #0
30001fa8:	e5cd3007 	strb	r3, [sp, #7]
30001fac:	ea000008 	b	30001fd4 <acoral_sched_init+0x34>
		sched_lock[acoral_current_cpu]=0;
30001fb0:	e59f3030 	ldr	r3, [pc, #48]	; 30001fe8 <acoral_sched_init+0x48>
30001fb4:	e3a02000 	mov	r2, #0
30001fb8:	e5c32000 	strb	r2, [r3]
		need_sched[acoral_current_cpu]=0;
30001fbc:	e59f3028 	ldr	r3, [pc, #40]	; 30001fec <acoral_sched_init+0x4c>
30001fc0:	e3a02000 	mov	r2, #0
30001fc4:	e5c32000 	strb	r2, [r3]
acoral_u8 sched_lock[HAL_MAX_CPU];
acoral_thread_t *running_thread[HAL_MAX_CPU],*ready_thread[HAL_MAX_CPU];
static acoral_rdy_queue_t acoral_ready_queues[HAL_MAX_CPU];
void acoral_sched_init(){
	acoral_u8 i;
	for(i=0;i<HAL_MAX_CPU;i++){
30001fc8:	e5dd3007 	ldrb	r3, [sp, #7]
30001fcc:	e2833001 	add	r3, r3, #1
30001fd0:	e5cd3007 	strb	r3, [sp, #7]
30001fd4:	e5dd3007 	ldrb	r3, [sp, #7]
30001fd8:	e3530000 	cmp	r3, #0
30001fdc:	0afffff3 	beq	30001fb0 <acoral_sched_init+0x10>
		sched_lock[acoral_current_cpu]=0;
		need_sched[acoral_current_cpu]=0;
	}
}
30001fe0:	e28dd008 	add	sp, sp, #8
30001fe4:	e12fff1e 	bx	lr
30001fe8:	3000f3e4 	.word	0x3000f3e4
30001fec:	300103fc 	.word	0x300103fc

30001ff0 <acoral_sched_unlock>:

void acoral_sched_unlock(){
30001ff0:	e92d4008 	push	{r3, lr}
	sched_lock[acoral_current_cpu]=0;	
30001ff4:	e59f3010 	ldr	r3, [pc, #16]	; 3000200c <acoral_sched_unlock+0x1c>
30001ff8:	e3a02000 	mov	r2, #0
30001ffc:	e5c32000 	strb	r2, [r3]
	acoral_sched();
30002000:	eb0000fc 	bl	300023f8 <acoral_sched>
}
30002004:	e8bd4008 	pop	{r3, lr}
30002008:	e12fff1e 	bx	lr
3000200c:	3000f3e4 	.word	0x3000f3e4

30002010 <acoral_set_orig_thread>:

void acoral_set_orig_thread(acoral_thread_t *thread){
30002010:	e24dd008 	sub	sp, sp, #8
30002014:	e58d0004 	str	r0, [sp, #4]
  	running_thread[acoral_current_cpu]=thread;
30002018:	e59f300c 	ldr	r3, [pc, #12]	; 3000202c <acoral_set_orig_thread+0x1c>
3000201c:	e59d2004 	ldr	r2, [sp, #4]
30002020:	e5832000 	str	r2, [r3]
}
30002024:	e28dd008 	add	sp, sp, #8
30002028:	e12fff1e 	bx	lr
3000202c:	300103f8 	.word	0x300103f8

30002030 <acoral_set_running_thread>:

void acoral_set_running_thread(acoral_thread_t *thread){
30002030:	e24dd008 	sub	sp, sp, #8
30002034:	e58d0004 	str	r0, [sp, #4]
  	running_thread[acoral_current_cpu]->state&=~ACORAL_THREAD_STATE_RUNNING;
30002038:	e59f3040 	ldr	r3, [pc, #64]	; 30002080 <acoral_set_running_thread+0x50>
3000203c:	e5932000 	ldr	r2, [r3]
30002040:	e59f3038 	ldr	r3, [pc, #56]	; 30002080 <acoral_set_running_thread+0x50>
30002044:	e5933000 	ldr	r3, [r3]
30002048:	e5d33004 	ldrb	r3, [r3, #4]
3000204c:	e20330fb 	and	r3, r3, #251	; 0xfb
30002050:	e5c23004 	strb	r3, [r2, #4]
	thread->state|=ACORAL_THREAD_STATE_RUNNING;
30002054:	e59d3004 	ldr	r3, [sp, #4]
30002058:	e5d33004 	ldrb	r3, [r3, #4]
3000205c:	e3833004 	orr	r3, r3, #4
30002060:	e20320ff 	and	r2, r3, #255	; 0xff
30002064:	e59d3004 	ldr	r3, [sp, #4]
30002068:	e5c32004 	strb	r2, [r3, #4]
  	running_thread[acoral_current_cpu]=thread;
3000206c:	e59f300c 	ldr	r3, [pc, #12]	; 30002080 <acoral_set_running_thread+0x50>
30002070:	e59d2004 	ldr	r2, [sp, #4]
30002074:	e5832000 	str	r2, [r3]
}
30002078:	e28dd008 	add	sp, sp, #8
3000207c:	e12fff1e 	bx	lr
30002080:	300103f8 	.word	0x300103f8

30002084 <acoral_thread_runqueue_init>:

/*================================
 * func: init acoral_ready_queues 
 *    初始化各个核上的就绪队列 
 *================================*/
void acoral_thread_runqueue_init(){
30002084:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002088:	e24dd014 	sub	sp, sp, #20
	acoral_prio_array_t *array;
	acoral_rdy_queue_t *rdy_queue;
	acoral_u8 cpu;
	/*初始化每个核上的优先级队列*/
	for(cpu=0;cpu<HAL_MAX_CPU;cpu++){
3000208c:	e3a03000 	mov	r3, #0
30002090:	e5cd300f 	strb	r3, [sp, #15]
30002094:	ea000011 	b	300020e0 <acoral_thread_runqueue_init+0x5c>
		rdy_queue=acoral_ready_queues+cpu;
30002098:	e5dd200f 	ldrb	r2, [sp, #15]
3000209c:	e1a03002 	mov	r3, r2
300020a0:	e1a03183 	lsl	r3, r3, #3
300020a4:	e0623003 	rsb	r3, r2, r3
300020a8:	e1a02283 	lsl	r2, r3, #5
300020ac:	e0632002 	rsb	r2, r3, r2
300020b0:	e1a03102 	lsl	r3, r2, #2
300020b4:	e1a02003 	mov	r2, r3
300020b8:	e59f3038 	ldr	r3, [pc, #56]	; 300020f8 <acoral_thread_runqueue_init+0x74>
300020bc:	e0823003 	add	r3, r2, r3
300020c0:	e58d3008 	str	r3, [sp, #8]
		array=&rdy_queue->array;
300020c4:	e59d3008 	ldr	r3, [sp, #8]
300020c8:	e58d3004 	str	r3, [sp, #4]
		acoral_prio_queue_init(array);
300020cc:	e59d0004 	ldr	r0, [sp, #4]
300020d0:	eb001f75 	bl	30009eac <acoral_prio_queue_init>
void acoral_thread_runqueue_init(){
	acoral_prio_array_t *array;
	acoral_rdy_queue_t *rdy_queue;
	acoral_u8 cpu;
	/*初始化每个核上的优先级队列*/
	for(cpu=0;cpu<HAL_MAX_CPU;cpu++){
300020d4:	e5dd300f 	ldrb	r3, [sp, #15]
300020d8:	e2833001 	add	r3, r3, #1
300020dc:	e5cd300f 	strb	r3, [sp, #15]
300020e0:	e5dd300f 	ldrb	r3, [sp, #15]
300020e4:	e3530000 	cmp	r3, #0
300020e8:	0affffea 	beq	30002098 <acoral_thread_runqueue_init+0x14>
		rdy_queue=acoral_ready_queues+cpu;
		array=&rdy_queue->array;
		acoral_prio_queue_init(array);
	}

}
300020ec:	e28dd014 	add	sp, sp, #20
300020f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300020f4:	e12fff1e 	bx	lr
300020f8:	3000eae0 	.word	0x3000eae0

300020fc <acoral_get_idlest_cpu>:

/*================================
 *      Get the idlest core 
 *     获取最空闲的cpu核 
 *================================*/
acoral_u32 acoral_get_idlest_cpu(){
300020fc:	e24dd010 	sub	sp, sp, #16
  	acoral_u32 cpu,i,count=-1;
30002100:	e3e03000 	mvn	r3, #0
30002104:	e58d3008 	str	r3, [sp, #8]
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0;i<HAL_MAX_CPU;i++){
30002108:	e3a03000 	mov	r3, #0
3000210c:	e58d3004 	str	r3, [sp, #4]
30002110:	ea000017 	b	30002174 <acoral_get_idlest_cpu+0x78>
	    rdy_queue=acoral_ready_queues+i;
30002114:	e59d2004 	ldr	r2, [sp, #4]
30002118:	e1a03002 	mov	r3, r2
3000211c:	e1a03183 	lsl	r3, r3, #3
30002120:	e0623003 	rsb	r3, r2, r3
30002124:	e1a02283 	lsl	r2, r3, #5
30002128:	e0632002 	rsb	r2, r3, r2
3000212c:	e1a03102 	lsl	r3, r2, #2
30002130:	e1a02003 	mov	r2, r3
30002134:	e59f3054 	ldr	r3, [pc, #84]	; 30002190 <acoral_get_idlest_cpu+0x94>
30002138:	e0823003 	add	r3, r2, r3
3000213c:	e58d300c 	str	r3, [sp, #12]
	    if(count>rdy_queue->array.num){
30002140:	e59d300c 	ldr	r3, [sp, #12]
30002144:	e5932000 	ldr	r2, [r3]
30002148:	e59d3008 	ldr	r3, [sp, #8]
3000214c:	e1520003 	cmp	r2, r3
30002150:	2a000004 	bcs	30002168 <acoral_get_idlest_cpu+0x6c>
	      	count=rdy_queue->array.num;
30002154:	e59d300c 	ldr	r3, [sp, #12]
30002158:	e5933000 	ldr	r3, [r3]
3000215c:	e58d3008 	str	r3, [sp, #8]
		cpu=i;
30002160:	e59d3004 	ldr	r3, [sp, #4]
30002164:	e58d3000 	str	r3, [sp]
 *     获取最空闲的cpu核 
 *================================*/
acoral_u32 acoral_get_idlest_cpu(){
  	acoral_u32 cpu,i,count=-1;
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0;i<HAL_MAX_CPU;i++){
30002168:	e59d3004 	ldr	r3, [sp, #4]
3000216c:	e2833001 	add	r3, r3, #1
30002170:	e58d3004 	str	r3, [sp, #4]
30002174:	e59d3004 	ldr	r3, [sp, #4]
30002178:	e3530000 	cmp	r3, #0
3000217c:	0affffe4 	beq	30002114 <acoral_get_idlest_cpu+0x18>
	    if(count>rdy_queue->array.num){
	      	count=rdy_queue->array.num;
		cpu=i;
	    }
	}
	return cpu;
30002180:	e59d3000 	ldr	r3, [sp]
}
30002184:	e1a00003 	mov	r0, r3
30002188:	e28dd010 	add	sp, sp, #16
3000218c:	e12fff1e 	bx	lr
30002190:	3000eae0 	.word	0x3000eae0

30002194 <acoral_get_idle_maskcpu>:

acoral_u32 acoral_get_idle_maskcpu(acoral_u32 cpu_mask){
30002194:	e24dd018 	sub	sp, sp, #24
30002198:	e58d0004 	str	r0, [sp, #4]
  	acoral_u32 cpu,i,count=-1;
3000219c:	e3e03000 	mvn	r3, #0
300021a0:	e58d3010 	str	r3, [sp, #16]
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0,cpu=0;i<HAL_MAX_CPU;i++){
300021a4:	e3a03000 	mov	r3, #0
300021a8:	e58d300c 	str	r3, [sp, #12]
300021ac:	e3a03000 	mov	r3, #0
300021b0:	e58d3008 	str	r3, [sp, #8]
300021b4:	ea00001f 	b	30002238 <acoral_get_idle_maskcpu+0xa4>
	    rdy_queue=acoral_ready_queues+i;
300021b8:	e59d200c 	ldr	r2, [sp, #12]
300021bc:	e1a03002 	mov	r3, r2
300021c0:	e1a03183 	lsl	r3, r3, #3
300021c4:	e0623003 	rsb	r3, r2, r3
300021c8:	e1a02283 	lsl	r2, r3, #5
300021cc:	e0632002 	rsb	r2, r3, r2
300021d0:	e1a03102 	lsl	r3, r2, #2
300021d4:	e1a02003 	mov	r2, r3
300021d8:	e59f3074 	ldr	r3, [pc, #116]	; 30002254 <acoral_get_idle_maskcpu+0xc0>
300021dc:	e0823003 	add	r3, r2, r3
300021e0:	e58d3014 	str	r3, [sp, #20]
	    if(count>rdy_queue->array.num&&(1<<i&cpu_mask)){
300021e4:	e59d3014 	ldr	r3, [sp, #20]
300021e8:	e5932000 	ldr	r2, [r3]
300021ec:	e59d3010 	ldr	r3, [sp, #16]
300021f0:	e1520003 	cmp	r2, r3
300021f4:	2a00000c 	bcs	3000222c <acoral_get_idle_maskcpu+0x98>
300021f8:	e59d300c 	ldr	r3, [sp, #12]
300021fc:	e3a02001 	mov	r2, #1
30002200:	e1a03312 	lsl	r3, r2, r3
30002204:	e1a02003 	mov	r2, r3
30002208:	e59d3004 	ldr	r3, [sp, #4]
3000220c:	e0023003 	and	r3, r2, r3
30002210:	e3530000 	cmp	r3, #0
30002214:	0a000004 	beq	3000222c <acoral_get_idle_maskcpu+0x98>
	      	count=rdy_queue->array.num;
30002218:	e59d3014 	ldr	r3, [sp, #20]
3000221c:	e5933000 	ldr	r3, [r3]
30002220:	e58d3010 	str	r3, [sp, #16]
		cpu=i;
30002224:	e59d300c 	ldr	r3, [sp, #12]
30002228:	e58d3008 	str	r3, [sp, #8]
}

acoral_u32 acoral_get_idle_maskcpu(acoral_u32 cpu_mask){
  	acoral_u32 cpu,i,count=-1;
	acoral_rdy_queue_t *rdy_queue;
  	for(i=0,cpu=0;i<HAL_MAX_CPU;i++){
3000222c:	e59d300c 	ldr	r3, [sp, #12]
30002230:	e2833001 	add	r3, r3, #1
30002234:	e58d300c 	str	r3, [sp, #12]
30002238:	e59d300c 	ldr	r3, [sp, #12]
3000223c:	e3530000 	cmp	r3, #0
30002240:	0affffdc 	beq	300021b8 <acoral_get_idle_maskcpu+0x24>
	    if(count>rdy_queue->array.num&&(1<<i&cpu_mask)){
	      	count=rdy_queue->array.num;
		cpu=i;
	    }
	}
	return cpu;
30002244:	e59d3008 	ldr	r3, [sp, #8]
}
30002248:	e1a00003 	mov	r0, r3
3000224c:	e28dd018 	add	sp, sp, #24
30002250:	e12fff1e 	bx	lr
30002254:	3000eae0 	.word	0x3000eae0

30002258 <acoral_rdyqueue_add>:

/*================================
 * func: add thread to acoral_ready_queues
 *    将线程挂到就绪队列上
 *================================*/
void acoral_rdyqueue_add(acoral_thread_t *thread){
30002258:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000225c:	e24dd014 	sub	sp, sp, #20
30002260:	e58d0004 	str	r0, [sp, #4]
	acoral_rdy_queue_t *rdy_queue;
	acoral_u8 cpu;
	cpu=thread->cpu;
30002264:	e59d3004 	ldr	r3, [sp, #4]
30002268:	e5d33006 	ldrb	r3, [r3, #6]
3000226c:	e5cd300f 	strb	r3, [sp, #15]
	rdy_queue=acoral_ready_queues+cpu;
30002270:	e5dd200f 	ldrb	r2, [sp, #15]
30002274:	e1a03002 	mov	r3, r2
30002278:	e1a03183 	lsl	r3, r3, #3
3000227c:	e0623003 	rsb	r3, r2, r3
30002280:	e1a02283 	lsl	r2, r3, #5
30002284:	e0632002 	rsb	r2, r3, r2
30002288:	e1a03102 	lsl	r3, r2, #2
3000228c:	e1a02003 	mov	r2, r3
30002290:	e59f308c 	ldr	r3, [pc, #140]	; 30002324 <acoral_rdyqueue_add+0xcc>
30002294:	e0823003 	add	r3, r2, r3
30002298:	e58d3008 	str	r3, [sp, #8]
	acoral_prio_queue_add(&rdy_queue->array,thread->prio,&thread->ready);
3000229c:	e59d1008 	ldr	r1, [sp, #8]
300022a0:	e59d3004 	ldr	r3, [sp, #4]
300022a4:	e5d33005 	ldrb	r3, [r3, #5]
300022a8:	e1a02003 	mov	r2, r3
300022ac:	e59d3004 	ldr	r3, [sp, #4]
300022b0:	e2833010 	add	r3, r3, #16
300022b4:	e1a00001 	mov	r0, r1
300022b8:	e1a01002 	mov	r1, r2
300022bc:	e1a02003 	mov	r2, r3
300022c0:	eb001ea4 	bl	30009d58 <acoral_prio_queue_add>
	thread->state&=~ACORAL_THREAD_STATE_SUSPEND;
300022c4:	e59d3004 	ldr	r3, [sp, #4]
300022c8:	e5d33004 	ldrb	r3, [r3, #4]
300022cc:	e20330fd 	and	r3, r3, #253	; 0xfd
300022d0:	e59d2004 	ldr	r2, [sp, #4]
300022d4:	e5c23004 	strb	r3, [r2, #4]
	thread->state|=ACORAL_THREAD_STATE_READY;
300022d8:	e59d3004 	ldr	r3, [sp, #4]
300022dc:	e5d33004 	ldrb	r3, [r3, #4]
300022e0:	e3833001 	orr	r3, r3, #1
300022e4:	e20320ff 	and	r2, r3, #255	; 0xff
300022e8:	e59d3004 	ldr	r3, [sp, #4]
300022ec:	e5c32004 	strb	r2, [r3, #4]
	thread->res.id=thread->res.id|cpu<<ACORAL_RES_CPU_BIT;
300022f0:	e59d3004 	ldr	r3, [sp, #4]
300022f4:	e5932000 	ldr	r2, [r3]
300022f8:	e5dd300f 	ldrb	r3, [sp, #15]
300022fc:	e1a03c03 	lsl	r3, r3, #24
30002300:	e1822003 	orr	r2, r2, r3
30002304:	e59d3004 	ldr	r3, [sp, #4]
30002308:	e5832000 	str	r2, [r3]
	acoral_set_need_sched(true);
3000230c:	e59f3014 	ldr	r3, [pc, #20]	; 30002328 <acoral_rdyqueue_add+0xd0>
30002310:	e3a02001 	mov	r2, #1
30002314:	e5c32000 	strb	r2, [r3]
}
30002318:	e28dd014 	add	sp, sp, #20
3000231c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002320:	e12fff1e 	bx	lr
30002324:	3000eae0 	.word	0x3000eae0
30002328:	300103fc 	.word	0x300103fc

3000232c <acoral_rdyqueue_del>:

/*================================
 * func: remove thread from acoral_ready_queues 
 *    将线程从就绪队列上取下
 *================================*/
void acoral_rdyqueue_del(acoral_thread_t *thread){
3000232c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002330:	e24dd014 	sub	sp, sp, #20
30002334:	e58d0004 	str	r0, [sp, #4]
	acoral_8 cpu;
	acoral_rdy_queue_t *rdy_queue;
	cpu=thread->cpu;
30002338:	e59d3004 	ldr	r3, [sp, #4]
3000233c:	e5d33006 	ldrb	r3, [r3, #6]
30002340:	e5cd300b 	strb	r3, [sp, #11]
	rdy_queue=acoral_ready_queues+cpu;
30002344:	e1dd20db 	ldrsb	r2, [sp, #11]
30002348:	e1a03002 	mov	r3, r2
3000234c:	e1a03183 	lsl	r3, r3, #3
30002350:	e0623003 	rsb	r3, r2, r3
30002354:	e1a02283 	lsl	r2, r3, #5
30002358:	e0632002 	rsb	r2, r3, r2
3000235c:	e1a03102 	lsl	r3, r2, #2
30002360:	e1a02003 	mov	r2, r3
30002364:	e59f3084 	ldr	r3, [pc, #132]	; 300023f0 <acoral_rdyqueue_del+0xc4>
30002368:	e0823003 	add	r3, r2, r3
3000236c:	e58d300c 	str	r3, [sp, #12]
        acoral_prio_queue_del(&rdy_queue->array,thread->prio,&thread->ready);
30002370:	e59d100c 	ldr	r1, [sp, #12]
30002374:	e59d3004 	ldr	r3, [sp, #4]
30002378:	e5d33005 	ldrb	r3, [r3, #5]
3000237c:	e1a02003 	mov	r2, r3
30002380:	e59d3004 	ldr	r3, [sp, #4]
30002384:	e2833010 	add	r3, r3, #16
30002388:	e1a00001 	mov	r0, r1
3000238c:	e1a01002 	mov	r1, r2
30002390:	e1a02003 	mov	r2, r3
30002394:	eb001e91 	bl	30009de0 <acoral_prio_queue_del>
	thread->state&=~ACORAL_THREAD_STATE_READY;
30002398:	e59d3004 	ldr	r3, [sp, #4]
3000239c:	e5d33004 	ldrb	r3, [r3, #4]
300023a0:	e20330fe 	and	r3, r3, #254	; 0xfe
300023a4:	e59d2004 	ldr	r2, [sp, #4]
300023a8:	e5c23004 	strb	r3, [r2, #4]
	thread->state&=~ACORAL_THREAD_STATE_RUNNING;
300023ac:	e59d3004 	ldr	r3, [sp, #4]
300023b0:	e5d33004 	ldrb	r3, [r3, #4]
300023b4:	e20330fb 	and	r3, r3, #251	; 0xfb
300023b8:	e59d2004 	ldr	r2, [sp, #4]
300023bc:	e5c23004 	strb	r3, [r2, #4]
	thread->state|=ACORAL_THREAD_STATE_SUSPEND;
300023c0:	e59d3004 	ldr	r3, [sp, #4]
300023c4:	e5d33004 	ldrb	r3, [r3, #4]
300023c8:	e3833002 	orr	r3, r3, #2
300023cc:	e20320ff 	and	r2, r3, #255	; 0xff
300023d0:	e59d3004 	ldr	r3, [sp, #4]
300023d4:	e5c32004 	strb	r2, [r3, #4]
	/*设置线程所在的核可调度*/
	acoral_set_need_sched(true);
300023d8:	e59f3014 	ldr	r3, [pc, #20]	; 300023f4 <acoral_rdyqueue_del+0xc8>
300023dc:	e3a02001 	mov	r2, #1
300023e0:	e5c32000 	strb	r2, [r3]
}
300023e4:	e28dd014 	add	sp, sp, #20
300023e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300023ec:	e12fff1e 	bx	lr
300023f0:	3000eae0 	.word	0x3000eae0
300023f4:	300103fc 	.word	0x300103fc

300023f8 <acoral_sched>:

/*================================
 * func: sched thread in acoral
 *         调度线程
 *================================*/
void acoral_sched(){
300023f8:	e92d4008 	push	{r3, lr}
	/*如果不需要调度，则返回*/
	if(!acoral_need_sched)
300023fc:	e59f3068 	ldr	r3, [pc, #104]	; 3000246c <acoral_sched+0x74>
30002400:	e5d33000 	ldrb	r3, [r3]
30002404:	e3530000 	cmp	r3, #0
30002408:	0a00000e 	beq	30002448 <acoral_sched+0x50>
		return;

	if(acoral_intr_nesting)
3000240c:	ebfffcd3 	bl	30001760 <hal_get_intr_nesting_comm>
30002410:	e1a03000 	mov	r3, r0
30002414:	e3530000 	cmp	r3, #0
30002418:	1a00000c 	bne	30002450 <acoral_sched+0x58>
		return;

	if(acoral_sched_is_lock)
3000241c:	e59f304c 	ldr	r3, [pc, #76]	; 30002470 <acoral_sched+0x78>
30002420:	e5d33000 	ldrb	r3, [r3]
30002424:	e3530000 	cmp	r3, #0
30002428:	1a00000a 	bne	30002458 <acoral_sched+0x60>
		return;
	/*如果还没有开始调度，则返回*/
	if(!acoral_start_sched)
3000242c:	e59f3040 	ldr	r3, [pc, #64]	; 30002474 <acoral_sched+0x7c>
30002430:	e5933000 	ldr	r3, [r3]
30002434:	e3530000 	cmp	r3, #0
30002438:	0a000008 	beq	30002460 <acoral_sched+0x68>
	  	return;
	/*这个函数进行简单处理后会直接或间接调用acoral_real_sched,或者acoral_real_intr_sched*/
	HAL_SCHED_BRIDGE(); 
3000243c:	ebfffce4 	bl	300017d4 <hal_sched_bridge_comm>
	return;
30002440:	e1a00000 	nop			; (mov r0, r0)
30002444:	ea000006 	b	30002464 <acoral_sched+0x6c>
 *         调度线程
 *================================*/
void acoral_sched(){
	/*如果不需要调度，则返回*/
	if(!acoral_need_sched)
		return;
30002448:	e1a00000 	nop			; (mov r0, r0)
3000244c:	ea000004 	b	30002464 <acoral_sched+0x6c>

	if(acoral_intr_nesting)
		return;
30002450:	e1a00000 	nop			; (mov r0, r0)
30002454:	ea000002 	b	30002464 <acoral_sched+0x6c>

	if(acoral_sched_is_lock)
		return;
30002458:	e1a00000 	nop			; (mov r0, r0)
3000245c:	ea000000 	b	30002464 <acoral_sched+0x6c>
	/*如果还没有开始调度，则返回*/
	if(!acoral_start_sched)
	  	return;
30002460:	e1a00000 	nop			; (mov r0, r0)
	/*这个函数进行简单处理后会直接或间接调用acoral_real_sched,或者acoral_real_intr_sched*/
	HAL_SCHED_BRIDGE(); 
	return;
}
30002464:	e8bd4008 	pop	{r3, lr}
30002468:	e12fff1e 	bx	lr
3000246c:	300103fc 	.word	0x300103fc
30002470:	3000f3e4 	.word	0x3000f3e4
30002474:	3000eadc 	.word	0x3000eadc

30002478 <acoral_real_sched>:
/*================================
 * func: sched thread in acoral
 *        进程上下文调度实现
 *        这个函数必须是原子操作
 *================================*/
void acoral_real_sched(){
30002478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000247c:	e24dd00c 	sub	sp, sp, #12
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
30002480:	e59f3090 	ldr	r3, [pc, #144]	; 30002518 <acoral_real_sched+0xa0>
30002484:	e3a02000 	mov	r2, #0
30002488:	e5c32000 	strb	r2, [r3]
	prev=acoral_cur_thread;
3000248c:	e59f3088 	ldr	r3, [pc, #136]	; 3000251c <acoral_real_sched+0xa4>
30002490:	e5933000 	ldr	r3, [r3]
30002494:	e58d3000 	str	r3, [sp]
	/*选择最高优先级线程*/
	acoral_select_thread();
30002498:	eb00004c 	bl	300025d0 <acoral_select_thread>
	next=acoral_ready_thread;
3000249c:	e59f307c 	ldr	r3, [pc, #124]	; 30002520 <acoral_real_sched+0xa8>
300024a0:	e5933000 	ldr	r3, [r3]
300024a4:	e58d3004 	str	r3, [sp, #4]
	if(prev!=next){
300024a8:	e59d2000 	ldr	r2, [sp]
300024ac:	e59d3004 	ldr	r3, [sp, #4]
300024b0:	e1520003 	cmp	r2, r3
300024b4:	0a000014 	beq	3000250c <acoral_real_sched+0x94>
	    acoral_set_running_thread(next);
300024b8:	e59d0004 	ldr	r0, [sp, #4]
300024bc:	ebfffedb 	bl	30002030 <acoral_set_running_thread>
	    if(prev->state==ACORAL_THREAD_STATE_EXIT){
300024c0:	e59d3000 	ldr	r3, [sp]
300024c4:	e5d33004 	ldrb	r3, [r3, #4]
300024c8:	e3530008 	cmp	r3, #8
300024cc:	1a000007 	bne	300024f0 <acoral_real_sched+0x78>
		  prev->state=ACORAL_THREAD_STATE_RELEASE;
300024d0:	e59d3000 	ldr	r3, [sp]
300024d4:	e3a02010 	mov	r2, #16
300024d8:	e5c32004 	strb	r2, [r3, #4]
  		  HAL_SWITCH_TO(&next->stack);
300024dc:	e59d3004 	ldr	r3, [sp, #4]
300024e0:	e2833034 	add	r3, r3, #52	; 0x34
300024e4:	e1a00003 	mov	r0, r3
300024e8:	ebfffc27 	bl	3000158c <HAL_SWITCH_TO>
		  return;
300024ec:	ea000006 	b	3000250c <acoral_real_sched+0x94>
  		  HAL_MOVE_SWITCH_TO(&prev->move_lock,0,&next->stack);
		  return;
	    }
#endif
	    /*线程切换*/
	    HAL_CONTEXT_SWITCH(&prev->stack,&next->stack);
300024f0:	e59d3000 	ldr	r3, [sp]
300024f4:	e2832034 	add	r2, r3, #52	; 0x34
300024f8:	e59d3004 	ldr	r3, [sp, #4]
300024fc:	e2833034 	add	r3, r3, #52	; 0x34
30002500:	e1a00002 	mov	r0, r2
30002504:	e1a01003 	mov	r1, r3
30002508:	ebfffc4d 	bl	30001644 <HAL_CONTEXT_SWITCH>
	}
}
3000250c:	e28dd00c 	add	sp, sp, #12
30002510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002514:	e12fff1e 	bx	lr
30002518:	300103fc 	.word	0x300103fc
3000251c:	300103f8 	.word	0x300103f8
30002520:	300103f0 	.word	0x300103f0

30002524 <acoral_real_intr_sched>:
/*================================
 * func: sched thread in acoral
 *        中断上下文调度实现
 *        这个函数必须是原子操作
 *================================*/
void acoral_real_intr_sched(){
30002524:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002528:	e24dd00c 	sub	sp, sp, #12
	acoral_thread_t *prev;
	acoral_thread_t *next;
	acoral_set_need_sched(false);
3000252c:	e59f3090 	ldr	r3, [pc, #144]	; 300025c4 <acoral_real_intr_sched+0xa0>
30002530:	e3a02000 	mov	r2, #0
30002534:	e5c32000 	strb	r2, [r3]
	prev=acoral_cur_thread;
30002538:	e59f3088 	ldr	r3, [pc, #136]	; 300025c8 <acoral_real_intr_sched+0xa4>
3000253c:	e5933000 	ldr	r3, [r3]
30002540:	e58d3000 	str	r3, [sp]
	/*选择最高优先级线程*/
	acoral_select_thread();
30002544:	eb000021 	bl	300025d0 <acoral_select_thread>
	next=acoral_ready_thread;
30002548:	e59f307c 	ldr	r3, [pc, #124]	; 300025cc <acoral_real_intr_sched+0xa8>
3000254c:	e5933000 	ldr	r3, [r3]
30002550:	e58d3004 	str	r3, [sp, #4]
	if(prev!=next){
30002554:	e59d2000 	ldr	r2, [sp]
30002558:	e59d3004 	ldr	r3, [sp, #4]
3000255c:	e1520003 	cmp	r2, r3
30002560:	0a000014 	beq	300025b8 <acoral_real_intr_sched+0x94>
	    acoral_set_running_thread(next);
30002564:	e59d0004 	ldr	r0, [sp, #4]
30002568:	ebfffeb0 	bl	30002030 <acoral_set_running_thread>
	    if(prev->state==ACORAL_THREAD_STATE_EXIT){
3000256c:	e59d3000 	ldr	r3, [sp]
30002570:	e5d33004 	ldrb	r3, [r3, #4]
30002574:	e3530008 	cmp	r3, #8
30002578:	1a000007 	bne	3000259c <acoral_real_intr_sched+0x78>
		  prev->state=ACORAL_THREAD_STATE_RELEASE;
3000257c:	e59d3000 	ldr	r3, [sp]
30002580:	e3a02010 	mov	r2, #16
30002584:	e5c32004 	strb	r2, [r3, #4]
  		  HAL_INTR_SWITCH_TO(&next->stack);
30002588:	e59d3004 	ldr	r3, [sp, #4]
3000258c:	e2833034 	add	r3, r3, #52	; 0x34
30002590:	e1a00003 	mov	r0, r3
30002594:	ebfffc00 	bl	3000159c <HAL_INTR_SWITCH_TO>
		  return;
30002598:	ea000006 	b	300025b8 <acoral_real_intr_sched+0x94>
  		  HAL_MOVE_SWITCH_TO(&prev->move_lock,0,&next->stack);
		  return;
	    }
#endif
	    /*线程切换*/
	    HAL_INTR_CTX_SWITCH(&prev->stack,&next->stack);
3000259c:	e59d3000 	ldr	r3, [sp]
300025a0:	e2832034 	add	r2, r3, #52	; 0x34
300025a4:	e59d3004 	ldr	r3, [sp, #4]
300025a8:	e2833034 	add	r3, r3, #52	; 0x34
300025ac:	e1a00002 	mov	r0, r2
300025b0:	e1a01003 	mov	r1, r3
300025b4:	ebfffc08 	bl	300015dc <HAL_INTR_CTX_SWITCH>
	}
}
300025b8:	e28dd00c 	add	sp, sp, #12
300025bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300025c0:	e12fff1e 	bx	lr
300025c4:	300103fc 	.word	0x300103fc
300025c8:	300103f8 	.word	0x300103f8
300025cc:	300103f0 	.word	0x300103f0

300025d0 <acoral_select_thread>:

/*================================
 * func: sched thread in acoral
 *     选择优先级最高的线程
 *================================*/
void acoral_select_thread(){
300025d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300025d4:	e24dd024 	sub	sp, sp, #36	; 0x24
	acoral_rdy_queue_t *rdy_queue;
	acoral_prio_array_t *array;
	acoral_list_t *head;
	acoral_thread_t *thread;
	acoral_queue_t *queue;
	cpu=acoral_current_cpu;
300025d8:	e3a03000 	mov	r3, #0
300025dc:	e5cd3007 	strb	r3, [sp, #7]
	rdy_queue=acoral_ready_queues+cpu;
300025e0:	e5dd2007 	ldrb	r2, [sp, #7]
300025e4:	e1a03002 	mov	r3, r2
300025e8:	e1a03183 	lsl	r3, r3, #3
300025ec:	e0623003 	rsb	r3, r2, r3
300025f0:	e1a02283 	lsl	r2, r3, #5
300025f4:	e0632002 	rsb	r2, r3, r2
300025f8:	e1a03102 	lsl	r3, r2, #2
300025fc:	e1a02003 	mov	r2, r3
30002600:	e59f3084 	ldr	r3, [pc, #132]	; 3000268c <acoral_select_thread+0xbc>
30002604:	e0823003 	add	r3, r2, r3
30002608:	e58d300c 	str	r3, [sp, #12]
	array=&rdy_queue->array;
3000260c:	e59d300c 	ldr	r3, [sp, #12]
30002610:	e58d3010 	str	r3, [sp, #16]
	/*找出就绪队列中优先级最高的线程的优先级*/
	index = acoral_get_highprio(array);
30002614:	e59d0010 	ldr	r0, [sp, #16]
30002618:	eb001e16 	bl	30009e78 <acoral_get_highprio>
3000261c:	e1a03000 	mov	r3, r0
30002620:	e58d3008 	str	r3, [sp, #8]
	queue = array->queue + index;
30002624:	e59d3010 	ldr	r3, [sp, #16]
30002628:	e2831010 	add	r1, r3, #16
3000262c:	e59d2008 	ldr	r2, [sp, #8]
30002630:	e1a03002 	mov	r3, r2
30002634:	e1a03083 	lsl	r3, r3, #1
30002638:	e0833002 	add	r3, r3, r2
3000263c:	e1a03103 	lsl	r3, r3, #2
30002640:	e0813003 	add	r3, r1, r3
30002644:	e58d301c 	str	r3, [sp, #28]
	head=&queue->head;
30002648:	e59d301c 	ldr	r3, [sp, #28]
3000264c:	e58d3014 	str	r3, [sp, #20]
	thread=list_entry(head->next, acoral_thread_t, ready);
30002650:	e59d3014 	ldr	r3, [sp, #20]
30002654:	e5933000 	ldr	r3, [r3]
30002658:	e2433010 	sub	r3, r3, #16
3000265c:	e58d3018 	str	r3, [sp, #24]
	ACORAL_ASSERT(thread,"Aseert:In select thread");
30002660:	e59d2018 	ldr	r2, [sp, #24]
30002664:	e59f3024 	ldr	r3, [pc, #36]	; 30002690 <acoral_select_thread+0xc0>
30002668:	e1a00002 	mov	r0, r2
3000266c:	e1a01003 	mov	r1, r3
30002670:	eb00056b 	bl	30003c24 <acoral_assert_res>
	acoral_set_ready_thread(thread);
30002674:	e59f3018 	ldr	r3, [pc, #24]	; 30002694 <acoral_select_thread+0xc4>
30002678:	e59d2018 	ldr	r2, [sp, #24]
3000267c:	e5832000 	str	r2, [r3]
}
30002680:	e28dd024 	add	sp, sp, #36	; 0x24
30002684:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002688:	e12fff1e 	bx	lr
3000268c:	3000eae0 	.word	0x3000eae0
30002690:	3000e23c 	.word	0x3000e23c
30002694:	300103f0 	.word	0x300103f0

30002698 <acoral_release_thread1>:
 * func: release thread in acoral
 *	
 *   thread     
 *    
 *================================*/
void acoral_release_thread1(acoral_thread_t *thread){
30002698:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000269c:	e24dd01c 	sub	sp, sp, #28
300026a0:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t *head,*tmp;
	acoral_thread_t *daem;
	thread->state=ACORAL_THREAD_STATE_EXIT;
300026a4:	e59d3004 	ldr	r3, [sp, #4]
300026a8:	e3a02008 	mov	r2, #8
300026ac:	e5c32004 	strb	r2, [r3, #4]
	head=&acoral_res_release_queue.head;
300026b0:	e59f304c 	ldr	r3, [pc, #76]	; 30002704 <acoral_release_thread1+0x6c>
300026b4:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&head->lock);
	tmp=head->prev;
300026b8:	e59d300c 	ldr	r3, [sp, #12]
300026bc:	e5933004 	ldr	r3, [r3, #4]
300026c0:	e58d3010 	str	r3, [sp, #16]
	if(tmp!=head)
		acoral_spin_lock(&tmp->lock);
	acoral_list_add2_tail(&thread->waiting,head);
300026c4:	e59d3004 	ldr	r3, [sp, #4]
300026c8:	e2833020 	add	r3, r3, #32
300026cc:	e1a00003 	mov	r0, r3
300026d0:	e59d100c 	ldr	r1, [sp, #12]
300026d4:	eb001e39 	bl	30009fc0 <acoral_list_add2_tail>
	if(tmp!=head)
		acoral_spin_unlock(&tmp->lock);
	acoral_spin_unlock(&head->lock);
	daem=(acoral_thread_t *)acoral_get_res_by_id(daemon_id);
300026d8:	e59f3028 	ldr	r3, [pc, #40]	; 30002708 <acoral_release_thread1+0x70>
300026dc:	e5933000 	ldr	r3, [r3]
300026e0:	e1a00003 	mov	r0, r3
300026e4:	eb00045b 	bl	30003858 <acoral_get_res_by_id>
300026e8:	e1a03000 	mov	r3, r0
300026ec:	e58d3014 	str	r3, [sp, #20]
	acoral_rdy_thread(daem);
300026f0:	e59d0014 	ldr	r0, [sp, #20]
300026f4:	eb000117 	bl	30002b58 <acoral_rdy_thread>
}
300026f8:	e28dd01c 	add	sp, sp, #28
300026fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002700:	e12fff1e 	bx	lr
30002704:	3000fad0 	.word	0x3000fad0
30002708:	3000fabc 	.word	0x3000fabc

3000270c <acoral_release_thread>:
/*================================
 * func: release thread in acoral
 *	
 *   thread     
 *================================*/
void acoral_release_thread(acoral_res_t *res){
3000270c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002710:	e24dd014 	sub	sp, sp, #20
30002714:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread;
	thread=(acoral_thread_t *)res;
30002718:	e59d3004 	ldr	r3, [sp, #4]
3000271c:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	acoral_list_del(&thread->global_list);
30002720:	e59d300c 	ldr	r3, [sp, #12]
30002724:	e2833028 	add	r3, r3, #40	; 0x28
30002728:	e1a00003 	mov	r0, r3
3000272c:	eb001e36 	bl	3000a00c <acoral_list_del>
	acoral_spin_unlock(&acoral_threads_queue.head.lock);
#ifdef CFG_TEST
	acoral_print("Release %s thread\n",thread->name);
#endif
	acoral_policy_thread_release(thread);
30002730:	e59d000c 	ldr	r0, [sp, #12]
30002734:	ebfffded 	bl	30001ef0 <acoral_policy_thread_release>
  	acoral_free((void *)thread->stack_buttom);
30002738:	e59d300c 	ldr	r3, [sp, #12]
3000273c:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30002740:	e1a00003 	mov	r0, r3
30002744:	eb000f4b 	bl	30006478 <buddy_free>
	acoral_release_res((acoral_res_t *)thread);
30002748:	e59d300c 	ldr	r3, [sp, #12]
3000274c:	e1a00003 	mov	r0, r3
30002750:	eb0003ac 	bl	30003608 <acoral_release_res>
}
30002754:	e28dd014 	add	sp, sp, #20
30002758:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000275c:	e12fff1e 	bx	lr

30002760 <acoral_suspend_thread>:
 * func: suspend thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/

void acoral_suspend_thread(acoral_thread_t *thread){
30002760:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002764:	e24dd014 	sub	sp, sp, #20
30002768:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
3000276c:	e59d3004 	ldr	r3, [sp, #4]
30002770:	e5d33004 	ldrb	r3, [r3, #4]
30002774:	e2033001 	and	r3, r3, #1
30002778:	e3530000 	cmp	r3, #0
3000277c:	0a000008 	beq	300027a4 <acoral_suspend_thread+0x44>
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_SUSPEND,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002780:	ebfffbdb 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002784:	e1a03000 	mov	r3, r0
30002788:	e58d3008 	str	r3, [sp, #8]
	/**/
	acoral_rdyqueue_del(thread);
3000278c:	e59d0004 	ldr	r0, [sp, #4]
30002790:	ebfffee5 	bl	3000232c <acoral_rdyqueue_del>
	HAL_EXIT_CRITICAL();
30002794:	e59d0008 	ldr	r0, [sp, #8]
30002798:	ebfffbd3 	bl	300016ec <HAL_INTR_RESTORE>
	/**/
	acoral_sched();
3000279c:	ebffff15 	bl	300023f8 <acoral_sched>
300027a0:	ea000000 	b	300027a8 <acoral_suspend_thread+0x48>

void acoral_suspend_thread(acoral_thread_t *thread){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
		return;
300027a4:	e1a00000 	nop			; (mov r0, r0)
	/**/
	acoral_rdyqueue_del(thread);
	HAL_EXIT_CRITICAL();
	/**/
	acoral_sched();
}
300027a8:	e28dd014 	add	sp, sp, #20
300027ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300027b0:	e12fff1e 	bx	lr

300027b4 <acoral_suspend_self>:

/*================================
 * func: suspend thread in acoral
 *      	
 *================================*/
void acoral_suspend_self(){
300027b4:	e92d4008 	push	{r3, lr}
	acoral_suspend_thread(acoral_cur_thread);
300027b8:	e59f3010 	ldr	r3, [pc, #16]	; 300027d0 <acoral_suspend_self+0x1c>
300027bc:	e5933000 	ldr	r3, [r3]
300027c0:	e1a00003 	mov	r0, r3
300027c4:	ebffffe5 	bl	30002760 <acoral_suspend_thread>
}
300027c8:	e8bd4008 	pop	{r3, lr}
300027cc:	e12fff1e 	bx	lr
300027d0:	300103f8 	.word	0x300103f8

300027d4 <acoral_suspend_thread_by_id>:
 * func: suspend thread in acoral
 *      ID	
 *      thread_idID
 *================================*/

void acoral_suspend_thread_by_id(acoral_u32 thread_id){
300027d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300027d8:	e24dd014 	sub	sp, sp, #20
300027dc:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
300027e0:	e59d3004 	ldr	r3, [sp, #4]
300027e4:	e1a00003 	mov	r0, r3
300027e8:	eb00041a 	bl	30003858 <acoral_get_res_by_id>
300027ec:	e1a03000 	mov	r3, r0
300027f0:	e58d300c 	str	r3, [sp, #12]
	acoral_suspend_thread(thread);
300027f4:	e59d000c 	ldr	r0, [sp, #12]
300027f8:	ebffffd8 	bl	30002760 <acoral_suspend_thread>
}
300027fc:	e28dd014 	add	sp, sp, #20
30002800:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002804:	e12fff1e 	bx	lr

30002808 <acoral_resume_thread_by_id>:
 * func: resume thread in acoral
 *         	
 *   thread_idID
 *================================*/

void acoral_resume_thread_by_id(acoral_u32 thread_id){
30002808:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000280c:	e24dd014 	sub	sp, sp, #20
30002810:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
30002814:	e59d3004 	ldr	r3, [sp, #4]
30002818:	e1a00003 	mov	r0, r3
3000281c:	eb00040d 	bl	30003858 <acoral_get_res_by_id>
30002820:	e1a03000 	mov	r3, r0
30002824:	e58d300c 	str	r3, [sp, #12]
	acoral_resume_thread(thread);
30002828:	e59d000c 	ldr	r0, [sp, #12]
3000282c:	eb000002 	bl	3000283c <acoral_resume_thread>
}
30002830:	e28dd014 	add	sp, sp, #20
30002834:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002838:	e12fff1e 	bx	lr

3000283c <acoral_resume_thread>:
/*================================
 * func: resume thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/
void acoral_resume_thread(acoral_thread_t *thread){
3000283c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002840:	e24dd014 	sub	sp, sp, #20
30002844:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(thread->state&ACORAL_THREAD_STATE_SUSPEND))
30002848:	e59d3004 	ldr	r3, [sp, #4]
3000284c:	e5d33004 	ldrb	r3, [r3, #4]
30002850:	e2033002 	and	r3, r3, #2
30002854:	e3530000 	cmp	r3, #0
30002858:	0a000008 	beq	30002880 <acoral_resume_thread+0x44>
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_RESUME,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
3000285c:	ebfffba4 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002860:	e1a03000 	mov	r3, r0
30002864:	e58d3008 	str	r3, [sp, #8]
	/**/
	acoral_rdyqueue_add(thread);
30002868:	e59d0004 	ldr	r0, [sp, #4]
3000286c:	ebfffe79 	bl	30002258 <acoral_rdyqueue_add>
	HAL_EXIT_CRITICAL();
30002870:	e59d0008 	ldr	r0, [sp, #8]
30002874:	ebfffb9c 	bl	300016ec <HAL_INTR_RESTORE>
	/**/
	acoral_sched();
30002878:	ebfffede 	bl	300023f8 <acoral_sched>
3000287c:	ea000000 	b	30002884 <acoral_resume_thread+0x48>
 *================================*/
void acoral_resume_thread(acoral_thread_t *thread){
	acoral_sr cpu_sr;
	acoral_8 cpu;
	if(!(thread->state&ACORAL_THREAD_STATE_SUSPEND))
		return;
30002880:	e1a00000 	nop			; (mov r0, r0)
	/**/
	acoral_rdyqueue_add(thread);
	HAL_EXIT_CRITICAL();
	/**/
	acoral_sched();
}
30002884:	e28dd014 	add	sp, sp, #20
30002888:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000288c:	e12fff1e 	bx	lr

30002890 <acoral_delay_thread>:
 *         	
 * thread(TCB) 	
 * timems	
 *      
 *================================*/
static void acoral_delay_thread(acoral_thread_t* thread,acoral_time time){
30002890:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002894:	e24dd014 	sub	sp, sp, #20
30002898:	e58d0004 	str	r0, [sp, #4]
3000289c:	e58d1000 	str	r1, [sp]
	acoral_u32 real_ticks;
	if(!acoral_list_empty(&thread->waiting)){
300028a0:	e59d3004 	ldr	r3, [sp, #4]
300028a4:	e5932020 	ldr	r2, [r3, #32]
300028a8:	e59d3004 	ldr	r3, [sp, #4]
300028ac:	e2833020 	add	r3, r3, #32
300028b0:	e1520003 	cmp	r2, r3
300028b4:	1a000012 	bne	30002904 <acoral_delay_thread+0x74>
		return;
	}
#endif
	/*timeticks*/
	/*real_ticks=time*ACORAL_TICKS_PER_SEC/1000;*/
	real_ticks = TIME_TO_TICKS(time);
300028b8:	e59d2000 	ldr	r2, [sp]
300028bc:	e1a03002 	mov	r3, r2
300028c0:	e1a03103 	lsl	r3, r3, #2
300028c4:	e0833002 	add	r3, r3, r2
300028c8:	e1a02103 	lsl	r2, r3, #2
300028cc:	e0833002 	add	r3, r3, r2
300028d0:	e1a03103 	lsl	r3, r3, #2
300028d4:	e1a02003 	mov	r2, r3
300028d8:	e59f3034 	ldr	r3, [pc, #52]	; 30002914 <acoral_delay_thread+0x84>
300028dc:	e0831392 	umull	r1, r3, r2, r3
300028e0:	e1a03323 	lsr	r3, r3, #6
300028e4:	e58d300c 	str	r3, [sp, #12]
	thread->delay=real_ticks;
300028e8:	e59d200c 	ldr	r2, [sp, #12]
300028ec:	e59d3004 	ldr	r3, [sp, #4]
300028f0:	e5832040 	str	r2, [r3, #64]	; 0x40
	/**/
	acoral_delayqueue_add(&time_delay_queue,thread);
300028f4:	e59f001c 	ldr	r0, [pc, #28]	; 30002918 <acoral_delay_thread+0x88>
300028f8:	e59d1004 	ldr	r1, [sp, #4]
300028fc:	eb000729 	bl	300045a8 <acoral_delayqueue_add>
30002900:	ea000000 	b	30002908 <acoral_delay_thread+0x78>
 *      
 *================================*/
static void acoral_delay_thread(acoral_thread_t* thread,acoral_time time){
	acoral_u32 real_ticks;
	if(!acoral_list_empty(&thread->waiting)){
		return;	
30002904:	e1a00000 	nop			; (mov r0, r0)
	/*real_ticks=time*ACORAL_TICKS_PER_SEC/1000;*/
	real_ticks = TIME_TO_TICKS(time);
	thread->delay=real_ticks;
	/**/
	acoral_delayqueue_add(&time_delay_queue,thread);
}
30002908:	e28dd014 	add	sp, sp, #20
3000290c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002910:	e12fff1e 	bx	lr
30002914:	10624dd3 	.word	0x10624dd3
30002918:	30010368 	.word	0x30010368

3000291c <acoral_delay_thread_by_id>:
 *         	
 * thread_idID 	
 * timems	
 *      
 *================================*/
static void acoral_delay_thread_by_id(acoral_time time,acoral_id thread_id){
3000291c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002920:	e24dd014 	sub	sp, sp, #20
30002924:	e58d0004 	str	r0, [sp, #4]
30002928:	e58d1000 	str	r1, [sp]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
3000292c:	e59d0000 	ldr	r0, [sp]
30002930:	eb0003c8 	bl	30003858 <acoral_get_res_by_id>
30002934:	e1a03000 	mov	r3, r0
30002938:	e58d300c 	str	r3, [sp, #12]
	acoral_delay_thread(thread,time);
3000293c:	e59d000c 	ldr	r0, [sp, #12]
30002940:	e59d1004 	ldr	r1, [sp, #4]
30002944:	ebffffd1 	bl	30002890 <acoral_delay_thread>
}
30002948:	e28dd014 	add	sp, sp, #20
3000294c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002950:	e12fff1e 	bx	lr

30002954 <acoral_delay_self>:
/*================================
 * func: delay current thread in acoral
 *         	
 * timems	
 *================================*/
void acoral_delay_self(acoral_time time){
30002954:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002958:	e24dd00c 	sub	sp, sp, #12
3000295c:	e58d0004 	str	r0, [sp, #4]
	acoral_delay_thread(acoral_cur_thread,time);
30002960:	e59f3018 	ldr	r3, [pc, #24]	; 30002980 <acoral_delay_self+0x2c>
30002964:	e5933000 	ldr	r3, [r3]
30002968:	e1a00003 	mov	r0, r3
3000296c:	e59d1004 	ldr	r1, [sp, #4]
30002970:	ebffffc6 	bl	30002890 <acoral_delay_thread>
}
30002974:	e28dd00c 	add	sp, sp, #12
30002978:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000297c:	e12fff1e 	bx	lr
30002980:	300103f8 	.word	0x300103f8

30002984 <acoral_kill_thread>:
/*================================
 * func: kill thread in acoral
 *         	
 * thread(TCB) 	
 *================================*/
void acoral_kill_thread(acoral_thread_t *thread){
30002984:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002988:	e24dd01c 	sub	sp, sp, #28
3000298c:	e58d0004 	str	r0, [sp, #4]
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_KILL,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002990:	ebfffb57 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002994:	e1a03000 	mov	r3, r0
30002998:	e58d300c 	str	r3, [sp, #12]
        /*	*/
        /*	*/
	if(thread->state&ACORAL_THREAD_STATE_SUSPEND){
3000299c:	e59d3004 	ldr	r3, [sp, #4]
300029a0:	e5d33004 	ldrb	r3, [r3, #4]
300029a4:	e2033002 	and	r3, r3, #2
300029a8:	e3530000 	cmp	r3, #0
300029ac:	0a000011 	beq	300029f8 <acoral_kill_thread+0x74>
		evt=thread->evt;
300029b0:	e59d3004 	ldr	r3, [sp, #4]
300029b4:	e5933030 	ldr	r3, [r3, #48]	; 0x30
300029b8:	e58d3014 	str	r3, [sp, #20]
		/**/
		if(thread->state&ACORAL_THREAD_STATE_DELAY){
300029bc:	e59d3004 	ldr	r3, [sp, #4]
300029c0:	e5d33004 	ldrb	r3, [r3, #4]
300029c4:	e2033020 	and	r3, r3, #32
300029c8:	e3530000 	cmp	r3, #0
300029cc:	0a000004 	beq	300029e4 <acoral_kill_thread+0x60>
			acoral_spin_lock(&thread->waiting.prev->lock);
			acoral_spin_lock(&thread->waiting.lock);
			acoral_list_del(&thread->waiting);
300029d0:	e59d3004 	ldr	r3, [sp, #4]
300029d4:	e2833020 	add	r3, r3, #32
300029d8:	e1a00003 	mov	r0, r3
300029dc:	eb001d8a 	bl	3000a00c <acoral_list_del>
300029e0:	ea000004 	b	300029f8 <acoral_kill_thread+0x74>
			acoral_spin_unlock(&thread->waiting.lock);
			acoral_spin_unlock(&thread->waiting.prev->lock);
		}else
		{
			/**/
			if(evt!=NULL){
300029e4:	e59d3014 	ldr	r3, [sp, #20]
300029e8:	e3530000 	cmp	r3, #0
300029ec:	0a000001 	beq	300029f8 <acoral_kill_thread+0x74>
				acoral_spin_lock(&evt->spin_lock);
				acoral_evt_queue_del(thread);
300029f0:	e59d0004 	ldr	r0, [sp, #4]
300029f4:	eb0008d7 	bl	30004d58 <acoral_evt_queue_del>
				acoral_spin_unlock(&evt->spin_lock);
			}
		}
	}
	acoral_unrdy_thread(thread);
300029f8:	e59d0004 	ldr	r0, [sp, #4]
300029fc:	eb000064 	bl	30002b94 <acoral_unrdy_thread>
	acoral_release_thread1(thread);
30002a00:	e59d0004 	ldr	r0, [sp, #4]
30002a04:	ebffff23 	bl	30002698 <acoral_release_thread1>
      	HAL_EXIT_CRITICAL();
30002a08:	e59d000c 	ldr	r0, [sp, #12]
30002a0c:	ebfffb36 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30002a10:	ebfffe78 	bl	300023f8 <acoral_sched>
}
30002a14:	e28dd01c 	add	sp, sp, #28
30002a18:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002a1c:	e12fff1e 	bx	lr

30002a20 <acoral_kill_thread_by_id>:
/*================================
 * func: kill thread in acoral
 *         	
 * thread_idID 	
 *================================*/
void acoral_kill_thread_by_id(acoral_id id){
30002a20:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002a24:	e24dd014 	sub	sp, sp, #20
30002a28:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread;
	thread=(acoral_thread_t *)acoral_get_res_by_id(id);
30002a2c:	e59d0004 	ldr	r0, [sp, #4]
30002a30:	eb000388 	bl	30003858 <acoral_get_res_by_id>
30002a34:	e1a03000 	mov	r3, r0
30002a38:	e58d300c 	str	r3, [sp, #12]
	acoral_kill_thread(thread);
30002a3c:	e59d000c 	ldr	r0, [sp, #12]
30002a40:	ebffffcf 	bl	30002984 <acoral_kill_thread>
}
30002a44:	e28dd014 	add	sp, sp, #20
30002a48:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002a4c:	e12fff1e 	bx	lr

30002a50 <acoral_thread_exit>:

/*================================
 * func: kill current thread in acoral
 *         	
 *================================*/
void acoral_thread_exit(){
30002a50:	e92d4008 	push	{r3, lr}
        acoral_kill_thread(acoral_cur_thread);
30002a54:	e59f3010 	ldr	r3, [pc, #16]	; 30002a6c <acoral_thread_exit+0x1c>
30002a58:	e5933000 	ldr	r3, [r3]
30002a5c:	e1a00003 	mov	r0, r3
30002a60:	ebffffc7 	bl	30002984 <acoral_kill_thread>
}
30002a64:	e8bd4008 	pop	{r3, lr}
30002a68:	e12fff1e 	bx	lr
30002a6c:	300103f8 	.word	0x300103f8

30002a70 <acoral_thread_change_prio>:

/*===========================
 *    change thread's prio
 *    
 *===========================*/
void acoral_thread_change_prio(acoral_thread_t* thread, acoral_u32 prio){
30002a70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002a74:	e24dd014 	sub	sp, sp, #20
30002a78:	e58d0004 	str	r0, [sp, #4]
30002a7c:	e58d1000 	str	r1, [sp]
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_CHG_PRIO,thread->res.id,(void *)prio);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002a80:	ebfffb1b 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002a84:	e1a03000 	mov	r3, r0
30002a88:	e58d3008 	str	r3, [sp, #8]
	if(thread->state&ACORAL_THREAD_STATE_READY){
30002a8c:	e59d3004 	ldr	r3, [sp, #4]
30002a90:	e5d33004 	ldrb	r3, [r3, #4]
30002a94:	e2033001 	and	r3, r3, #1
30002a98:	e20330ff 	and	r3, r3, #255	; 0xff
30002a9c:	e3530000 	cmp	r3, #0
30002aa0:	0a000008 	beq	30002ac8 <acoral_thread_change_prio+0x58>
		acoral_rdyqueue_del(thread);
30002aa4:	e59d0004 	ldr	r0, [sp, #4]
30002aa8:	ebfffe1f 	bl	3000232c <acoral_rdyqueue_del>
		thread->prio = prio;
30002aac:	e59d3000 	ldr	r3, [sp]
30002ab0:	e20320ff 	and	r2, r3, #255	; 0xff
30002ab4:	e59d3004 	ldr	r3, [sp, #4]
30002ab8:	e5c32005 	strb	r2, [r3, #5]
		acoral_rdyqueue_add(thread);
30002abc:	e59d0004 	ldr	r0, [sp, #4]
30002ac0:	ebfffde4 	bl	30002258 <acoral_rdyqueue_add>
30002ac4:	ea000003 	b	30002ad8 <acoral_thread_change_prio+0x68>
	}else
		thread->prio = prio;
30002ac8:	e59d3000 	ldr	r3, [sp]
30002acc:	e20320ff 	and	r2, r3, #255	; 0xff
30002ad0:	e59d3004 	ldr	r3, [sp, #4]
30002ad4:	e5c32005 	strb	r2, [r3, #5]
	HAL_EXIT_CRITICAL();
30002ad8:	e59d0008 	ldr	r0, [sp, #8]
30002adc:	ebfffb02 	bl	300016ec <HAL_INTR_RESTORE>
}
30002ae0:	e28dd014 	add	sp, sp, #20
30002ae4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002ae8:	e12fff1e 	bx	lr

30002aec <acoral_change_prio_self>:

/*===========================
 *    change current thread's prio
 *    
 *===========================*/
void acoral_change_prio_self(acoral_u32 prio){
30002aec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002af0:	e24dd00c 	sub	sp, sp, #12
30002af4:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_change_prio(acoral_cur_thread, prio);
30002af8:	e59f3018 	ldr	r3, [pc, #24]	; 30002b18 <acoral_change_prio_self+0x2c>
30002afc:	e5933000 	ldr	r3, [r3]
30002b00:	e1a00003 	mov	r0, r3
30002b04:	e59d1004 	ldr	r1, [sp, #4]
30002b08:	ebffffd8 	bl	30002a70 <acoral_thread_change_prio>
}
30002b0c:	e28dd00c 	add	sp, sp, #12
30002b10:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002b14:	e12fff1e 	bx	lr
30002b18:	300103f8 	.word	0x300103f8

30002b1c <acoral_thread_change_prio_by_id>:

/*===========================
 *    change thread's prio
 *    ID
 *===========================*/
void acoral_thread_change_prio_by_id(acoral_u32 thread_id, acoral_u32 prio){
30002b1c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002b20:	e24dd014 	sub	sp, sp, #20
30002b24:	e58d0004 	str	r0, [sp, #4]
30002b28:	e58d1000 	str	r1, [sp]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
30002b2c:	e59d3004 	ldr	r3, [sp, #4]
30002b30:	e1a00003 	mov	r0, r3
30002b34:	eb000347 	bl	30003858 <acoral_get_res_by_id>
30002b38:	e1a03000 	mov	r3, r0
30002b3c:	e58d300c 	str	r3, [sp, #12]
	acoral_thread_change_prio(thread, prio);
30002b40:	e59d000c 	ldr	r0, [sp, #12]
30002b44:	e59d1000 	ldr	r1, [sp]
30002b48:	ebffffc8 	bl	30002a70 <acoral_thread_change_prio>
}
30002b4c:	e28dd014 	add	sp, sp, #20
30002b50:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002b54:	e12fff1e 	bx	lr

30002b58 <acoral_rdy_thread>:
 * func: ready thread in acoral
 *  ,
 * thread(TCB) 	
 *================================*/

void acoral_rdy_thread(acoral_thread_t *thread){
30002b58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002b5c:	e24dd014 	sub	sp, sp, #20
30002b60:	e58d0004 	str	r0, [sp, #4]
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_SUSPEND&thread->state))
30002b64:	e59d3004 	ldr	r3, [sp, #4]
30002b68:	e5d33004 	ldrb	r3, [r3, #4]
30002b6c:	e2033002 	and	r3, r3, #2
30002b70:	e3530000 	cmp	r3, #0
30002b74:	0a000002 	beq	30002b84 <acoral_rdy_thread+0x2c>
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_RESUME,thread->res.id,NULL);
		return;
	}
#endif
	/**/
	acoral_rdyqueue_add(thread);
30002b78:	e59d0004 	ldr	r0, [sp, #4]
30002b7c:	ebfffdb5 	bl	30002258 <acoral_rdyqueue_add>
30002b80:	ea000000 	b	30002b88 <acoral_rdy_thread+0x30>
 *================================*/

void acoral_rdy_thread(acoral_thread_t *thread){
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_SUSPEND&thread->state))
		return;
30002b84:	e1a00000 	nop			; (mov r0, r0)
		return;
	}
#endif
	/**/
	acoral_rdyqueue_add(thread);
}
30002b88:	e28dd014 	add	sp, sp, #20
30002b8c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002b90:	e12fff1e 	bx	lr

30002b94 <acoral_unrdy_thread>:
 *     ,
 * thread(TCB) 	
 *
 *================================*/

void acoral_unrdy_thread(acoral_thread_t *thread){
30002b94:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002b98:	e24dd014 	sub	sp, sp, #20
30002b9c:	e58d0004 	str	r0, [sp, #4]
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
30002ba0:	e59d3004 	ldr	r3, [sp, #4]
30002ba4:	e5d33004 	ldrb	r3, [r3, #4]
30002ba8:	e2033001 	and	r3, r3, #1
30002bac:	e3530000 	cmp	r3, #0
30002bb0:	0a000002 	beq	30002bc0 <acoral_unrdy_thread+0x2c>
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_SUSPEND,thread->res.id,NULL);
		return;
	}
#endif
	/**/
	acoral_rdyqueue_del(thread);
30002bb4:	e59d0004 	ldr	r0, [sp, #4]
30002bb8:	ebfffddb 	bl	3000232c <acoral_rdyqueue_del>
30002bbc:	ea000000 	b	30002bc4 <acoral_unrdy_thread+0x30>
 *================================*/

void acoral_unrdy_thread(acoral_thread_t *thread){
	acoral_8 cpu;
	if(!(ACORAL_THREAD_STATE_READY&thread->state))
		return;
30002bc0:	e1a00000 	nop			; (mov r0, r0)
		return;
	}
#endif
	/**/
	acoral_rdyqueue_del(thread);
}
30002bc4:	e28dd014 	add	sp, sp, #20
30002bc8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002bcc:	e12fff1e 	bx	lr

30002bd0 <acoral_thread_move2_tail>:

void acoral_thread_move2_tail(acoral_thread_t *thread){
30002bd0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002bd4:	e24dd014 	sub	sp, sp, #20
30002bd8:	e58d0004 	str	r0, [sp, #4]
	if(cpu!=acoral_current_cpu){
	  	acoral_ipi_cmd_send(cpu,ACORAL_IPI_THREAD_MOVE2_TAIL,thread->res.id,NULL);
		return;
	}
#endif
	HAL_ENTER_CRITICAL();
30002bdc:	ebfffac4 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002be0:	e1a03000 	mov	r3, r0
30002be4:	e58d300c 	str	r3, [sp, #12]
	acoral_unrdy_thread(thread);
30002be8:	e59d0004 	ldr	r0, [sp, #4]
30002bec:	ebffffe8 	bl	30002b94 <acoral_unrdy_thread>
	acoral_rdy_thread(thread);
30002bf0:	e59d0004 	ldr	r0, [sp, #4]
30002bf4:	ebffffd7 	bl	30002b58 <acoral_rdy_thread>
	HAL_EXIT_CRITICAL();
30002bf8:	e59d000c 	ldr	r0, [sp, #12]
30002bfc:	ebfffaba 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30002c00:	ebfffdfc 	bl	300023f8 <acoral_sched>
}
30002c04:	e28dd014 	add	sp, sp, #20
30002c08:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002c0c:	e12fff1e 	bx	lr

30002c10 <acoral_thread_move2_tail_by_id>:

void acoral_thread_move2_tail_by_id(acoral_id thread_id){
30002c10:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002c14:	e24dd014 	sub	sp, sp, #20
30002c18:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t *thread=(acoral_thread_t *)acoral_get_res_by_id(thread_id);
30002c1c:	e59d0004 	ldr	r0, [sp, #4]
30002c20:	eb00030c 	bl	30003858 <acoral_get_res_by_id>
30002c24:	e1a03000 	mov	r3, r0
30002c28:	e58d300c 	str	r3, [sp, #12]
	acoral_thread_move2_tail(thread);
30002c2c:	e59d000c 	ldr	r0, [sp, #12]
30002c30:	ebffffe6 	bl	30002bd0 <acoral_thread_move2_tail>
}
30002c34:	e28dd014 	add	sp, sp, #20
30002c38:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002c3c:	e12fff1e 	bx	lr

30002c40 <acoral_alloc_thread>:

/*================================
 * func: alloc thread struct data in acoral
 *     TCB
 *================================*/
acoral_thread_t *acoral_alloc_thread(){
30002c40:	e92d4008 	push	{r3, lr}
  	return (acoral_thread_t *)acoral_get_res(&acoral_thread_pool_ctrl);
30002c44:	e59f0010 	ldr	r0, [pc, #16]	; 30002c5c <acoral_alloc_thread+0x1c>
30002c48:	eb000223 	bl	300034dc <acoral_get_res>
30002c4c:	e1a03000 	mov	r3, r0
}
30002c50:	e1a00003 	mov	r0, r3
30002c54:	e8bd4008 	pop	{r3, lr}
30002c58:	e12fff1e 	bx	lr
30002c5c:	3000f9b4 	.word	0x3000f9b4

30002c60 <acoral_thread_init>:
 * in:   (*exit)   (acoral_thread_exit)
 *       stack_size 
 *       args       
 *       name       
 *================================*/
acoral_err acoral_thread_init(acoral_thread_t *thread,void (*route)(void *args),void (*exit)(void),void *args){
30002c60:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002c64:	e24dd01c 	sub	sp, sp, #28
30002c68:	e58d000c 	str	r0, [sp, #12]
30002c6c:	e58d1008 	str	r1, [sp, #8]
30002c70:	e58d2004 	str	r2, [sp, #4]
30002c74:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 stack_size=thread->stack_size;
30002c78:	e59d300c 	ldr	r3, [sp, #12]
30002c7c:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
30002c80:	e58d3014 	str	r3, [sp, #20]
	if(thread->stack_buttom==NULL){
30002c84:	e59d300c 	ldr	r3, [sp, #12]
30002c88:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30002c8c:	e3530000 	cmp	r3, #0
30002c90:	1a000015 	bne	30002cec <acoral_thread_init+0x8c>
		if(stack_size<ACORAL_MIN_STACK_SIZE)
30002c94:	e59d2014 	ldr	r2, [sp, #20]
30002c98:	e3a03fff 	mov	r3, #1020	; 0x3fc
30002c9c:	e2833003 	add	r3, r3, #3
30002ca0:	e1520003 	cmp	r2, r3
30002ca4:	8a000001 	bhi	30002cb0 <acoral_thread_init+0x50>
			stack_size=ACORAL_MIN_STACK_SIZE;
30002ca8:	e3a03b01 	mov	r3, #1024	; 0x400
30002cac:	e58d3014 	str	r3, [sp, #20]
		thread->stack_buttom=(acoral_u32 *)acoral_malloc(stack_size);
30002cb0:	e59d0014 	ldr	r0, [sp, #20]
30002cb4:	eb000db7 	bl	30006398 <buddy_malloc>
30002cb8:	e1a03000 	mov	r3, r0
30002cbc:	e1a02003 	mov	r2, r3
30002cc0:	e59d300c 	ldr	r3, [sp, #12]
30002cc4:	e5832038 	str	r2, [r3, #56]	; 0x38
		if(thread->stack_buttom==NULL)
30002cc8:	e59d300c 	ldr	r3, [sp, #12]
30002ccc:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30002cd0:	e3530000 	cmp	r3, #0
30002cd4:	1a000001 	bne	30002ce0 <acoral_thread_init+0x80>
			return ACORAL_ERR_THREAD_NO_STACK;
30002cd8:	e3a03016 	mov	r3, #22
30002cdc:	ea000064 	b	30002e74 <acoral_thread_init+0x214>
		thread->stack_size=stack_size;
30002ce0:	e59d300c 	ldr	r3, [sp, #12]
30002ce4:	e59d2014 	ldr	r2, [sp, #20]
30002ce8:	e583203c 	str	r2, [r3, #60]	; 0x3c
	}
	thread->stack=(acoral_u32 *)((acoral_8 *)thread->stack_buttom+stack_size-4);
30002cec:	e59d300c 	ldr	r3, [sp, #12]
30002cf0:	e5932038 	ldr	r2, [r3, #56]	; 0x38
30002cf4:	e59d3014 	ldr	r3, [sp, #20]
30002cf8:	e2433004 	sub	r3, r3, #4
30002cfc:	e0822003 	add	r2, r2, r3
30002d00:	e59d300c 	ldr	r3, [sp, #12]
30002d04:	e5832034 	str	r2, [r3, #52]	; 0x34
	HAL_STACK_INIT(&thread->stack,route,exit,args);
30002d08:	e59d300c 	ldr	r3, [sp, #12]
30002d0c:	e2833034 	add	r3, r3, #52	; 0x34
30002d10:	e1a00003 	mov	r0, r3
30002d14:	e59d1008 	ldr	r1, [sp, #8]
30002d18:	e59d2004 	ldr	r2, [sp, #4]
30002d1c:	e59d3000 	ldr	r3, [sp]
30002d20:	ebfff566 	bl	300002c0 <hal_stack_init>
	/*cpu_mask*/
	if(thread->cpu_mask==-1)
30002d24:	e59d300c 	ldr	r3, [sp, #12]
30002d28:	e5933008 	ldr	r3, [r3, #8]
30002d2c:	e3730001 	cmn	r3, #1
30002d30:	1a000002 	bne	30002d40 <acoral_thread_init+0xe0>
		thread->cpu_mask=0xefffffff;
30002d34:	e59d300c 	ldr	r3, [sp, #12]
30002d38:	e3e02201 	mvn	r2, #268435456	; 0x10000000
30002d3c:	e5832008 	str	r2, [r3, #8]
	if(thread->cpu<0)
30002d40:	e59d300c 	ldr	r3, [sp, #12]
30002d44:	e5d33006 	ldrb	r3, [r3, #6]
30002d48:	e1a03c03 	lsl	r3, r3, #24
30002d4c:	e1a03c43 	asr	r3, r3, #24
30002d50:	e3530000 	cmp	r3, #0
30002d54:	aa000007 	bge	30002d78 <acoral_thread_init+0x118>
	      thread->cpu=acoral_get_idle_maskcpu(thread->cpu_mask);
30002d58:	e59d300c 	ldr	r3, [sp, #12]
30002d5c:	e5933008 	ldr	r3, [r3, #8]
30002d60:	e1a00003 	mov	r0, r3
30002d64:	ebfffd0a 	bl	30002194 <acoral_get_idle_maskcpu>
30002d68:	e1a03000 	mov	r3, r0
30002d6c:	e20320ff 	and	r2, r3, #255	; 0xff
30002d70:	e59d300c 	ldr	r3, [sp, #12]
30002d74:	e5c32006 	strb	r2, [r3, #6]
	if(thread->cpu>=HAL_MAX_CPU)
30002d78:	e59d300c 	ldr	r3, [sp, #12]
30002d7c:	e5d33006 	ldrb	r3, [r3, #6]
30002d80:	e1a03c03 	lsl	r3, r3, #24
30002d84:	e1a03c43 	asr	r3, r3, #24
30002d88:	e3530000 	cmp	r3, #0
30002d8c:	da000002 	ble	30002d9c <acoral_thread_init+0x13c>
		thread->cpu=HAL_MAX_CPU-1;
30002d90:	e59d300c 	ldr	r3, [sp, #12]
30002d94:	e3a02000 	mov	r2, #0
30002d98:	e5c32006 	strb	r2, [r3, #6]
	thread->data=NULL;
30002d9c:	e59d300c 	ldr	r3, [sp, #12]
30002da0:	e3a02000 	mov	r2, #0
30002da4:	e5832054 	str	r2, [r3, #84]	; 0x54
	thread->state=ACORAL_THREAD_STATE_SUSPEND;
30002da8:	e59d300c 	ldr	r3, [sp, #12]
30002dac:	e3a02002 	mov	r2, #2
30002db0:	e5c32004 	strb	r2, [r3, #4]
	/*继承父线程的console_id*/
	thread->console_id=acoral_cur_thread->console_id;
30002db4:	e59f30c8 	ldr	r3, [pc, #200]	; 30002e84 <acoral_thread_init+0x224>
30002db8:	e5933000 	ldr	r3, [r3]
30002dbc:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
30002dc0:	e59d300c 	ldr	r3, [sp, #12]
30002dc4:	e583204c 	str	r2, [r3, #76]	; 0x4c
	acoral_init_list(&thread->waiting);
30002dc8:	e59d300c 	ldr	r3, [sp, #12]
30002dcc:	e2832020 	add	r2, r3, #32
30002dd0:	e59d300c 	ldr	r3, [sp, #12]
30002dd4:	e5832020 	str	r2, [r3, #32]
30002dd8:	e59d300c 	ldr	r3, [sp, #12]
30002ddc:	e2832020 	add	r2, r3, #32
30002de0:	e59d300c 	ldr	r3, [sp, #12]
30002de4:	e5832024 	str	r2, [r3, #36]	; 0x24
	acoral_init_list(&thread->ready);
30002de8:	e59d300c 	ldr	r3, [sp, #12]
30002dec:	e2832010 	add	r2, r3, #16
30002df0:	e59d300c 	ldr	r3, [sp, #12]
30002df4:	e5832010 	str	r2, [r3, #16]
30002df8:	e59d300c 	ldr	r3, [sp, #12]
30002dfc:	e2832010 	add	r2, r3, #16
30002e00:	e59d300c 	ldr	r3, [sp, #12]
30002e04:	e5832014 	str	r2, [r3, #20]
	acoral_init_list(&thread->timeout);
30002e08:	e59d300c 	ldr	r3, [sp, #12]
30002e0c:	e2832018 	add	r2, r3, #24
30002e10:	e59d300c 	ldr	r3, [sp, #12]
30002e14:	e5832018 	str	r2, [r3, #24]
30002e18:	e59d300c 	ldr	r3, [sp, #12]
30002e1c:	e2832018 	add	r2, r3, #24
30002e20:	e59d300c 	ldr	r3, [sp, #12]
30002e24:	e583201c 	str	r2, [r3, #28]
	acoral_init_list(&thread->global_list);
30002e28:	e59d300c 	ldr	r3, [sp, #12]
30002e2c:	e2832028 	add	r2, r3, #40	; 0x28
30002e30:	e59d300c 	ldr	r3, [sp, #12]
30002e34:	e5832028 	str	r2, [r3, #40]	; 0x28
30002e38:	e59d300c 	ldr	r3, [sp, #12]
30002e3c:	e2832028 	add	r2, r3, #40	; 0x28
30002e40:	e59d300c 	ldr	r3, [sp, #12]
30002e44:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_spin_init(&thread->timeout.lock);
	acoral_spin_init(&thread->waiting.lock);
	acoral_spin_init(&thread->ready.lock);
	acoral_spin_init(&thread->move_lock);
	HAL_ENTER_CRITICAL();
30002e48:	ebfffa29 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30002e4c:	e1a03000 	mov	r3, r0
30002e50:	e58d3010 	str	r3, [sp, #16]
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	acoral_list_add2_tail(&thread->global_list,&acoral_threads_queue.head);
30002e54:	e59d300c 	ldr	r3, [sp, #12]
30002e58:	e2833028 	add	r3, r3, #40	; 0x28
30002e5c:	e1a00003 	mov	r0, r3
30002e60:	e59f1020 	ldr	r1, [pc, #32]	; 30002e88 <acoral_thread_init+0x228>
30002e64:	eb001c55 	bl	30009fc0 <acoral_list_add2_tail>
	acoral_spin_unlock(&acoral_threads_queue.head.lock);
	HAL_EXIT_CRITICAL();
30002e68:	e59d0010 	ldr	r0, [sp, #16]
30002e6c:	ebfffa1e 	bl	300016ec <HAL_INTR_RESTORE>
#ifdef CFG_TEST
	acoral_print("%s thread initial well\n",thread->name);
#endif
	return 0;
30002e70:	e3a03000 	mov	r3, #0
}
30002e74:	e1a00003 	mov	r0, r3
30002e78:	e28dd01c 	add	sp, sp, #28
30002e7c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30002e80:	e12fff1e 	bx	lr
30002e84:	300103f8 	.word	0x300103f8
30002e88:	3000fa24 	.word	0x3000fa24

30002e8c <acoral_thread_pool_init>:

/*================================
 *      init tcb pool
 *      
 *================================*/
void acoral_thread_pool_init(){
30002e8c:	e92d4008 	push	{r3, lr}
	thread_api.release_res=acoral_release_thread;
30002e90:	e59f3068 	ldr	r3, [pc, #104]	; 30002f00 <acoral_thread_pool_init+0x74>
30002e94:	e59f2068 	ldr	r2, [pc, #104]	; 30002f04 <acoral_thread_pool_init+0x78>
30002e98:	e5832000 	str	r2, [r3]
	acoral_thread_pool_ctrl.type=ACORAL_RES_THREAD;
30002e9c:	e59f3064 	ldr	r3, [pc, #100]	; 30002f08 <acoral_thread_pool_init+0x7c>
30002ea0:	e3a02001 	mov	r2, #1
30002ea4:	e5832000 	str	r2, [r3]
	acoral_thread_pool_ctrl.size=sizeof(acoral_thread_t);
30002ea8:	e59f3058 	ldr	r3, [pc, #88]	; 30002f08 <acoral_thread_pool_init+0x7c>
30002eac:	e3a02058 	mov	r2, #88	; 0x58
30002eb0:	e5832004 	str	r2, [r3, #4]
	if(CFG_MAX_THREAD>20)
		acoral_thread_pool_ctrl.num_per_pool=20;
30002eb4:	e59f304c 	ldr	r3, [pc, #76]	; 30002f08 <acoral_thread_pool_init+0x7c>
30002eb8:	e3a02014 	mov	r2, #20
30002ebc:	e5832008 	str	r2, [r3, #8]
	else
		acoral_thread_pool_ctrl.num_per_pool=CFG_MAX_THREAD;
	acoral_thread_pool_ctrl.max_pools=ACORAL_MAX_THREAD/acoral_thread_pool_ctrl.num_per_pool;
30002ec0:	e59f3040 	ldr	r3, [pc, #64]	; 30002f08 <acoral_thread_pool_init+0x7c>
30002ec4:	e5933008 	ldr	r3, [r3, #8]
30002ec8:	e3a00028 	mov	r0, #40	; 0x28
30002ecc:	e1a01003 	mov	r1, r3
30002ed0:	eb002acb 	bl	3000da04 <__aeabi_uidiv>
30002ed4:	e1a03000 	mov	r3, r0
30002ed8:	e1a02003 	mov	r2, r3
30002edc:	e59f3024 	ldr	r3, [pc, #36]	; 30002f08 <acoral_thread_pool_init+0x7c>
30002ee0:	e5832010 	str	r2, [r3, #16]
	acoral_thread_pool_ctrl.api=&thread_api;
30002ee4:	e59f301c 	ldr	r3, [pc, #28]	; 30002f08 <acoral_thread_pool_init+0x7c>
30002ee8:	e59f2010 	ldr	r2, [pc, #16]	; 30002f00 <acoral_thread_pool_init+0x74>
30002eec:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_pool_ctrl_init(&acoral_thread_pool_ctrl);
30002ef0:	e59f0010 	ldr	r0, [pc, #16]	; 30002f08 <acoral_thread_pool_init+0x7c>
30002ef4:	eb0002d7 	bl	30003a58 <acoral_pool_ctrl_init>
}
30002ef8:	e8bd4008 	pop	{r3, lr}
30002efc:	e12fff1e 	bx	lr
30002f00:	3000f97c 	.word	0x3000f97c
30002f04:	3000270c 	.word	0x3000270c
30002f08:	3000f9b4 	.word	0x3000f9b4

30002f0c <acoral_set_thread_console>:

void acoral_set_thread_console(acoral_id id){
30002f0c:	e24dd008 	sub	sp, sp, #8
30002f10:	e58d0004 	str	r0, [sp, #4]
	acoral_cur_thread->console_id=id;	
30002f14:	e59f3010 	ldr	r3, [pc, #16]	; 30002f2c <acoral_set_thread_console+0x20>
30002f18:	e5933000 	ldr	r3, [r3]
30002f1c:	e59d2004 	ldr	r2, [sp, #4]
30002f20:	e583204c 	str	r2, [r3, #76]	; 0x4c
}
30002f24:	e28dd008 	add	sp, sp, #8
30002f28:	e12fff1e 	bx	lr
30002f2c:	300103f8 	.word	0x300103f8

30002f30 <acoral_sched_mechanism_init>:

void acoral_sched_mechanism_init(){
30002f30:	e92d4008 	push	{r3, lr}
	acoral_thread_pool_init();
30002f34:	ebffffd4 	bl	30002e8c <acoral_thread_pool_init>
	acoral_thread_runqueue_init();
30002f38:	ebfffc51 	bl	30002084 <acoral_thread_runqueue_init>
	acoral_init_list(&acoral_threads_queue.head);
30002f3c:	e59f3018 	ldr	r3, [pc, #24]	; 30002f5c <acoral_sched_mechanism_init+0x2c>
30002f40:	e59f2014 	ldr	r2, [pc, #20]	; 30002f5c <acoral_sched_mechanism_init+0x2c>
30002f44:	e5832000 	str	r2, [r3]
30002f48:	e59f300c 	ldr	r3, [pc, #12]	; 30002f5c <acoral_sched_mechanism_init+0x2c>
30002f4c:	e59f2008 	ldr	r2, [pc, #8]	; 30002f5c <acoral_sched_mechanism_init+0x2c>
30002f50:	e5832004 	str	r2, [r3, #4]
	acoral_spin_init(&acoral_threads_queue.head.lock);
}
30002f54:	e8bd4008 	pop	{r3, lr}
30002f58:	e12fff1e 	bx	lr
30002f5c:	3000fa24 	.word	0x3000fa24

30002f60 <acoral_thread_sys_init>:

/*================================
 *      init thread system 
 *       
 *================================*/
void acoral_thread_sys_init(){
30002f60:	e92d4008 	push	{r3, lr}
	acoral_sched_mechanism_init();
30002f64:	ebfffff1 	bl	30002f30 <acoral_sched_mechanism_init>
	acoral_sched_policy_init();
30002f68:	ebfffbf5 	bl	30001f44 <acoral_sched_policy_init>
}
30002f6c:	e8bd4008 	pop	{r3, lr}
30002f70:	e12fff1e 	bx	lr

30002f74 <create_comm_thread>:
 *       args       传进线程的参数
 *       name       创建线程的名字
 *       prio       创建线程的优先级
 *       cpu        绑定进程到指定cpu运行,-1为由系统指定
 *================================*/
acoral_id create_comm_thread(void (*route)(void *args),acoral_u32 stack_size,void *args,acoral_char *name,acoral_u8 prio,acoral_8 cpu){
30002f74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30002f78:	e24dd01c 	sub	sp, sp, #28
30002f7c:	e58d000c 	str	r0, [sp, #12]
30002f80:	e58d1008 	str	r1, [sp, #8]
30002f84:	e58d2004 	str	r2, [sp, #4]
30002f88:	e58d3000 	str	r3, [sp]
	acoral_comm_policy_data_t policy_ctrl;
	acoral_thread_t *thread;
        /*分配tcb数据块*/
	thread=acoral_alloc_thread();
30002f8c:	ebffff2b 	bl	30002c40 <acoral_alloc_thread>
30002f90:	e1a03000 	mov	r3, r0
30002f94:	e58d3014 	str	r3, [sp, #20]
	if(NULL==thread){
30002f98:	e59d3014 	ldr	r3, [sp, #20]
30002f9c:	e3530000 	cmp	r3, #0
30002fa0:	1a000004 	bne	30002fb8 <create_comm_thread+0x44>
		acoral_printerr("Alloc thread:%s fail\n",name);
30002fa4:	e59f0094 	ldr	r0, [pc, #148]	; 30003040 <create_comm_thread+0xcc>
30002fa8:	e59d1000 	ldr	r1, [sp]
30002fac:	eb002095 	bl	3000b208 <acoral_print>
		acoral_printk("No Mem Space or Beyond the max thread\n");
		return -1;
30002fb0:	e3e03000 	mvn	r3, #0
30002fb4:	ea00001d 	b	30003030 <create_comm_thread+0xbc>
	}
	thread->name=name;
30002fb8:	e59d3014 	ldr	r3, [sp, #20]
30002fbc:	e59d2000 	ldr	r2, [sp]
30002fc0:	e5832048 	str	r2, [r3, #72]	; 0x48
	stack_size=stack_size&(~3);
30002fc4:	e59d3008 	ldr	r3, [sp, #8]
30002fc8:	e3c33003 	bic	r3, r3, #3
30002fcc:	e58d3008 	str	r3, [sp, #8]
	thread->stack_size=stack_size;
30002fd0:	e59d3014 	ldr	r3, [sp, #20]
30002fd4:	e59d2008 	ldr	r2, [sp, #8]
30002fd8:	e583203c 	str	r2, [r3, #60]	; 0x3c
	thread->stack_buttom=NULL;
30002fdc:	e59d3014 	ldr	r3, [sp, #20]
30002fe0:	e3a02000 	mov	r2, #0
30002fe4:	e5832038 	str	r2, [r3, #56]	; 0x38
        /*设置线程要运行的cpu核心*/
	policy_ctrl.cpu=cpu;
30002fe8:	e5dd3024 	ldrb	r3, [sp, #36]	; 0x24
30002fec:	e5cd3010 	strb	r3, [sp, #16]
        /*设置线程的优先级*/
	policy_ctrl.prio=prio;
30002ff0:	e5dd3020 	ldrb	r3, [sp, #32]
30002ff4:	e5cd3011 	strb	r3, [sp, #17]
	policy_ctrl.prio_type=ACORAL_BASE_PRIO;
30002ff8:	e3a03002 	mov	r3, #2
30002ffc:	e5cd3012 	strb	r3, [sp, #18]
	thread->policy=ACORAL_SCHED_POLICY_COMM;
30003000:	e59d3014 	ldr	r3, [sp, #20]
30003004:	e3a02015 	mov	r2, #21
30003008:	e5c3200c 	strb	r2, [r3, #12]
	thread->cpu_mask=-1;
3000300c:	e59d3014 	ldr	r3, [sp, #20]
30003010:	e3e02000 	mvn	r2, #0
30003014:	e5832008 	str	r2, [r3, #8]
	return comm_policy_thread_init(thread,route,args,&policy_ctrl);
30003018:	e28d3010 	add	r3, sp, #16
3000301c:	e59d0014 	ldr	r0, [sp, #20]
30003020:	e59d100c 	ldr	r1, [sp, #12]
30003024:	e59d2004 	ldr	r2, [sp, #4]
30003028:	eb000005 	bl	30003044 <comm_policy_thread_init>
3000302c:	e1a03000 	mov	r3, r0
}
30003030:	e1a00003 	mov	r0, r3
30003034:	e28dd01c 	add	sp, sp, #28
30003038:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000303c:	e12fff1e 	bx	lr
30003040:	3000e254 	.word	0x3000e254

30003044 <comm_policy_thread_init>:

acoral_id comm_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30003044:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003048:	e24dd024 	sub	sp, sp, #36	; 0x24
3000304c:	e58d000c 	str	r0, [sp, #12]
30003050:	e58d1008 	str	r1, [sp, #8]
30003054:	e58d2004 	str	r2, [sp, #4]
30003058:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 prio;
	acoral_comm_policy_data_t *policy_data;
	policy_data=(acoral_comm_policy_data_t *)data;
3000305c:	e59d3000 	ldr	r3, [sp]
30003060:	e58d301c 	str	r3, [sp, #28]
	thread->cpu=policy_data->cpu;
30003064:	e59d301c 	ldr	r3, [sp, #28]
30003068:	e5d32000 	ldrb	r2, [r3]
3000306c:	e59d300c 	ldr	r3, [sp, #12]
30003070:	e5c32006 	strb	r2, [r3, #6]
	prio=policy_data->prio;
30003074:	e59d301c 	ldr	r3, [sp, #28]
30003078:	e5d33001 	ldrb	r3, [r3, #1]
3000307c:	e58d3018 	str	r3, [sp, #24]
	if(policy_data->prio_type==ACORAL_BASE_PRIO){
30003080:	e59d301c 	ldr	r3, [sp, #28]
30003084:	e5d33002 	ldrb	r3, [r3, #2]
30003088:	e3530002 	cmp	r3, #2
3000308c:	1a000007 	bne	300030b0 <comm_policy_thread_init+0x6c>
		prio+=ACORAL_BASE_PRIO_MIN;
30003090:	e59d3018 	ldr	r3, [sp, #24]
30003094:	e2833002 	add	r3, r3, #2
30003098:	e58d3018 	str	r3, [sp, #24]
		if(prio>=ACORAL_BASE_PRIO_MAX)
3000309c:	e59d3018 	ldr	r3, [sp, #24]
300030a0:	e3530026 	cmp	r3, #38	; 0x26
300030a4:	9a000001 	bls	300030b0 <comm_policy_thread_init+0x6c>
			prio=ACORAL_BASE_PRIO_MAX-1;
300030a8:	e3a03026 	mov	r3, #38	; 0x26
300030ac:	e58d3018 	str	r3, [sp, #24]
	}
	thread->prio=prio;
300030b0:	e59d3018 	ldr	r3, [sp, #24]
300030b4:	e20320ff 	and	r2, r3, #255	; 0xff
300030b8:	e59d300c 	ldr	r3, [sp, #12]
300030bc:	e5c32005 	strb	r2, [r3, #5]
	if(acoral_thread_init(thread,route,acoral_thread_exit,args)!=0){
300030c0:	e59d000c 	ldr	r0, [sp, #12]
300030c4:	e59d1008 	ldr	r1, [sp, #8]
300030c8:	e59f206c 	ldr	r2, [pc, #108]	; 3000313c <comm_policy_thread_init+0xf8>
300030cc:	e59d3004 	ldr	r3, [sp, #4]
300030d0:	ebfffee2 	bl	30002c60 <acoral_thread_init>
300030d4:	e1a03000 	mov	r3, r0
300030d8:	e3530000 	cmp	r3, #0
300030dc:	0a00000e 	beq	3000311c <comm_policy_thread_init+0xd8>
		acoral_printerr("No thread stack:%s\n",thread->name);
300030e0:	e59d300c 	ldr	r3, [sp, #12]
300030e4:	e5933048 	ldr	r3, [r3, #72]	; 0x48
300030e8:	e59f0050 	ldr	r0, [pc, #80]	; 30003140 <comm_policy_thread_init+0xfc>
300030ec:	e1a01003 	mov	r1, r3
300030f0:	eb002044 	bl	3000b208 <acoral_print>
		HAL_ENTER_CRITICAL();
300030f4:	ebfff97e 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300030f8:	e1a03000 	mov	r3, r0
300030fc:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
30003100:	e59d300c 	ldr	r3, [sp, #12]
30003104:	e1a00003 	mov	r0, r3
30003108:	eb00013e 	bl	30003608 <acoral_release_res>
		HAL_EXIT_CRITICAL();
3000310c:	e59d0014 	ldr	r0, [sp, #20]
30003110:	ebfff975 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
30003114:	e3e03000 	mvn	r3, #0
30003118:	ea000003 	b	3000312c <comm_policy_thread_init+0xe8>
	}
        /*将线程就绪，并重新调度*/
	acoral_resume_thread(thread);
3000311c:	e59d000c 	ldr	r0, [sp, #12]
30003120:	ebfffdc5 	bl	3000283c <acoral_resume_thread>
	return thread->res.id;
30003124:	e59d300c 	ldr	r3, [sp, #12]
30003128:	e5933000 	ldr	r3, [r3]
}
3000312c:	e1a00003 	mov	r0, r3
30003130:	e28dd024 	add	sp, sp, #36	; 0x24
30003134:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003138:	e12fff1e 	bx	lr
3000313c:	30002a50 	.word	0x30002a50
30003140:	3000e26c 	.word	0x3000e26c

30003144 <comm_policy_init>:

void comm_policy_init(){
30003144:	e92d4008 	push	{r3, lr}
	comm_policy.type=ACORAL_SCHED_POLICY_COMM;	
30003148:	e59f3044 	ldr	r3, [pc, #68]	; 30003194 <comm_policy_init+0x50>
3000314c:	e3a02015 	mov	r2, #21
30003150:	e5c32008 	strb	r2, [r3, #8]
	comm_policy.policy_thread_init=comm_policy_thread_init;	
30003154:	e59f3038 	ldr	r3, [pc, #56]	; 30003194 <comm_policy_init+0x50>
30003158:	e59f2038 	ldr	r2, [pc, #56]	; 30003198 <comm_policy_init+0x54>
3000315c:	e583200c 	str	r2, [r3, #12]
	comm_policy.policy_thread_release=NULL;	
30003160:	e59f302c 	ldr	r3, [pc, #44]	; 30003194 <comm_policy_init+0x50>
30003164:	e3a02000 	mov	r2, #0
30003168:	e5832010 	str	r2, [r3, #16]
	comm_policy.delay_deal=NULL;	
3000316c:	e59f3020 	ldr	r3, [pc, #32]	; 30003194 <comm_policy_init+0x50>
30003170:	e3a02000 	mov	r2, #0
30003174:	e5832014 	str	r2, [r3, #20]
	comm_policy.name="comm";	
30003178:	e59f3014 	ldr	r3, [pc, #20]	; 30003194 <comm_policy_init+0x50>
3000317c:	e59f2018 	ldr	r2, [pc, #24]	; 3000319c <comm_policy_init+0x58>
30003180:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&comm_policy);
30003184:	e59f0008 	ldr	r0, [pc, #8]	; 30003194 <comm_policy_init+0x50>
30003188:	ebfffb2e 	bl	30001e48 <acoral_register_sched_policy>
}
3000318c:	e8bd4008 	pop	{r3, lr}
30003190:	e12fff1e 	bx	lr
30003194:	3000f3a8 	.word	0x3000f3a8
30003198:	30003044 	.word	0x30003044
3000319c:	3000e280 	.word	0x3000e280

300031a0 <acoral_create_pool>:
/*================================
 *    create a kind of resource pool
 *       创建某一资源内存池
 *       pool_ctrl---资源内存池管理块
 *================================*/
acoral_err acoral_create_pool(acoral_pool_ctrl_t *pool_ctrl){
300031a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300031a4:	e24dd014 	sub	sp, sp, #20
300031a8:	e58d0004 	str	r0, [sp, #4]
  	acoral_pool_t *pool;
	if(pool_ctrl->num>=pool_ctrl->max_pools)
300031ac:	e59d3004 	ldr	r3, [sp, #4]
300031b0:	e593200c 	ldr	r2, [r3, #12]
300031b4:	e59d3004 	ldr	r3, [sp, #4]
300031b8:	e5933010 	ldr	r3, [r3, #16]
300031bc:	e1520003 	cmp	r2, r3
300031c0:	3a000001 	bcc	300031cc <acoral_create_pool+0x2c>
	    return ACORAL_RES_MAX_POOL;
300031c4:	e3a030f3 	mov	r3, #243	; 0xf3
300031c8:	ea000049 	b	300032f4 <acoral_create_pool+0x154>
  	pool=acoral_get_free_pool();
300031cc:	eb000188 	bl	300037f4 <acoral_get_free_pool>
300031d0:	e1a03000 	mov	r3, r0
300031d4:	e58d300c 	str	r3, [sp, #12]
	if(pool==NULL)
300031d8:	e59d300c 	ldr	r3, [sp, #12]
300031dc:	e3530000 	cmp	r3, #0
300031e0:	1a000001 	bne	300031ec <acoral_create_pool+0x4c>
		return ACORAL_RES_NO_POOL;
300031e4:	e3a030f1 	mov	r3, #241	; 0xf1
300031e8:	ea000041 	b	300032f4 <acoral_create_pool+0x154>
	pool->id=pool_ctrl->type<<ACORAL_RES_TYPE_BIT|pool->id;
300031ec:	e59d3004 	ldr	r3, [sp, #4]
300031f0:	e5933000 	ldr	r3, [r3]
300031f4:	e1a02503 	lsl	r2, r3, #10
300031f8:	e59d300c 	ldr	r3, [sp, #12]
300031fc:	e5933008 	ldr	r3, [r3, #8]
30003200:	e1823003 	orr	r3, r2, r3
30003204:	e1a02003 	mov	r2, r3
30003208:	e59d300c 	ldr	r3, [sp, #12]
3000320c:	e5832008 	str	r2, [r3, #8]
	pool->size=pool_ctrl->size;
30003210:	e59d3004 	ldr	r3, [sp, #4]
30003214:	e5932004 	ldr	r2, [r3, #4]
30003218:	e59d300c 	ldr	r3, [sp, #12]
3000321c:	e583200c 	str	r2, [r3, #12]
	pool->num=pool_ctrl->num_per_pool;
30003220:	e59d3004 	ldr	r3, [sp, #4]
30003224:	e5932008 	ldr	r2, [r3, #8]
30003228:	e59d300c 	ldr	r3, [sp, #12]
3000322c:	e5832010 	str	r2, [r3, #16]
	pool->base_adr=(void *)acoral_malloc(pool->size*pool->num);
30003230:	e59d300c 	ldr	r3, [sp, #12]
30003234:	e593300c 	ldr	r3, [r3, #12]
30003238:	e59d200c 	ldr	r2, [sp, #12]
3000323c:	e5922010 	ldr	r2, [r2, #16]
30003240:	e0030392 	mul	r3, r2, r3
30003244:	e1a00003 	mov	r0, r3
30003248:	eb000c52 	bl	30006398 <buddy_malloc>
3000324c:	e1a02000 	mov	r2, r0
30003250:	e59d300c 	ldr	r3, [sp, #12]
30003254:	e5832000 	str	r2, [r3]
	if(pool->base_adr==NULL)
30003258:	e59d300c 	ldr	r3, [sp, #12]
3000325c:	e5933000 	ldr	r3, [r3]
30003260:	e3530000 	cmp	r3, #0
30003264:	1a000001 	bne	30003270 <acoral_create_pool+0xd0>
		return ACORAL_RES_NO_MEM;
30003268:	e3a030f2 	mov	r3, #242	; 0xf2
3000326c:	ea000020 	b	300032f4 <acoral_create_pool+0x154>
	pool->res_free=pool->base_adr;
30003270:	e59d300c 	ldr	r3, [sp, #12]
30003274:	e5932000 	ldr	r2, [r3]
30003278:	e59d300c 	ldr	r3, [sp, #12]
3000327c:	e5832004 	str	r2, [r3, #4]
	pool->free_num=pool->num;
30003280:	e59d300c 	ldr	r3, [sp, #12]
30003284:	e5932010 	ldr	r2, [r3, #16]
30003288:	e59d300c 	ldr	r3, [sp, #12]
3000328c:	e5832018 	str	r2, [r3, #24]
	pool->ctrl=pool_ctrl;
30003290:	e59d300c 	ldr	r3, [sp, #12]
30003294:	e59d2004 	ldr	r2, [sp, #4]
30003298:	e583201c 	str	r2, [r3, #28]
	acoral_pool_res_init(pool);
3000329c:	e59d000c 	ldr	r0, [sp, #12]
300032a0:	eb00018a 	bl	300038d0 <acoral_pool_res_init>
        acoral_list_add2_tail(&pool->ctrl_list,pool_ctrl->pools);
300032a4:	e59d300c 	ldr	r3, [sp, #12]
300032a8:	e2832020 	add	r2, r3, #32
300032ac:	e59d3004 	ldr	r3, [sp, #4]
300032b0:	e5933018 	ldr	r3, [r3, #24]
300032b4:	e1a00002 	mov	r0, r2
300032b8:	e1a01003 	mov	r1, r3
300032bc:	eb001b3f 	bl	30009fc0 <acoral_list_add2_tail>
	acoral_list_add2_tail(&pool->free_list,pool_ctrl->free_pools);
300032c0:	e59d300c 	ldr	r3, [sp, #12]
300032c4:	e2832028 	add	r2, r3, #40	; 0x28
300032c8:	e59d3004 	ldr	r3, [sp, #4]
300032cc:	e5933014 	ldr	r3, [r3, #20]
300032d0:	e1a00002 	mov	r0, r2
300032d4:	e1a01003 	mov	r1, r3
300032d8:	eb001b38 	bl	30009fc0 <acoral_list_add2_tail>
	pool_ctrl->num++;
300032dc:	e59d3004 	ldr	r3, [sp, #4]
300032e0:	e593300c 	ldr	r3, [r3, #12]
300032e4:	e2832001 	add	r2, r3, #1
300032e8:	e59d3004 	ldr	r3, [sp, #4]
300032ec:	e583200c 	str	r2, [r3, #12]
	return 0;
300032f0:	e3a03000 	mov	r3, #0
}
300032f4:	e1a00003 	mov	r0, r3
300032f8:	e28dd014 	add	sp, sp, #20
300032fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003300:	e12fff1e 	bx	lr

30003304 <acoral_release_pool>:
/*================================
 *      release a kind of resource pool
 *       释放某一资源内存池所有资源
 *       pool_ctrl--资源内存池管理块
 *================================*/
void acoral_release_pool(acoral_pool_ctrl_t *pool_ctrl){
30003304:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003308:	e24dd01c 	sub	sp, sp, #28
3000330c:	e58d0004 	str	r0, [sp, #4]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->pools;
30003310:	e59d3004 	ldr	r3, [sp, #4]
30003314:	e5933018 	ldr	r3, [r3, #24]
30003318:	e58d3014 	str	r3, [sp, #20]
	if(acoral_list_empty(head))
3000331c:	e59d3014 	ldr	r3, [sp, #20]
30003320:	e5932000 	ldr	r2, [r3]
30003324:	e59d3014 	ldr	r3, [sp, #20]
30003328:	e1520003 	cmp	r2, r3
3000332c:	0a000027 	beq	300033d0 <acoral_release_pool+0xcc>
	  	return;
   for(list=head->next;list!=head;list=list->next){
30003330:	e59d3014 	ldr	r3, [sp, #20]
30003334:	e5933000 	ldr	r3, [r3]
30003338:	e58d3010 	str	r3, [sp, #16]
3000333c:	ea00001e 	b	300033bc <acoral_release_pool+0xb8>
			pool=list_entry(list,acoral_pool_t,free_list);
30003340:	e59d3010 	ldr	r3, [sp, #16]
30003344:	e2433028 	sub	r3, r3, #40	; 0x28
30003348:	e58d300c 	str	r3, [sp, #12]
		    acoral_list_del(&pool->ctrl_list);
3000334c:	e59d300c 	ldr	r3, [sp, #12]
30003350:	e2833020 	add	r3, r3, #32
30003354:	e1a00003 	mov	r0, r3
30003358:	eb001b2b 	bl	3000a00c <acoral_list_del>
			acoral_list_del(&pool->free_list);
3000335c:	e59d300c 	ldr	r3, [sp, #12]
30003360:	e2833028 	add	r3, r3, #40	; 0x28
30003364:	e1a00003 	mov	r0, r3
30003368:	eb001b27 	bl	3000a00c <acoral_list_del>
			acoral_free(pool->base_adr);
3000336c:	e59d300c 	ldr	r3, [sp, #12]
30003370:	e5933000 	ldr	r3, [r3]
30003374:	e1a00003 	mov	r0, r3
30003378:	eb000c3e 	bl	30006478 <buddy_free>
			pool->base_adr=(void *)acoral_free_res_pool;
3000337c:	e59f305c 	ldr	r3, [pc, #92]	; 300033e0 <acoral_release_pool+0xdc>
30003380:	e5932000 	ldr	r2, [r3]
30003384:	e59d300c 	ldr	r3, [sp, #12]
30003388:	e5832000 	str	r2, [r3]
			pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
3000338c:	e59d300c 	ldr	r3, [sp, #12]
30003390:	e5933008 	ldr	r3, [r3, #8]
30003394:	e1a03b03 	lsl	r3, r3, #22
30003398:	e1a03b23 	lsr	r3, r3, #22
3000339c:	e59d200c 	ldr	r2, [sp, #12]
300033a0:	e5823008 	str	r3, [r2, #8]
			acoral_free_res_pool=pool;
300033a4:	e59f3034 	ldr	r3, [pc, #52]	; 300033e0 <acoral_release_pool+0xdc>
300033a8:	e59d200c 	ldr	r2, [sp, #12]
300033ac:	e5832000 	str	r2, [r3]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->pools;
	if(acoral_list_empty(head))
	  	return;
   for(list=head->next;list!=head;list=list->next){
300033b0:	e59d3010 	ldr	r3, [sp, #16]
300033b4:	e5933000 	ldr	r3, [r3]
300033b8:	e58d3010 	str	r3, [sp, #16]
300033bc:	e59d2010 	ldr	r2, [sp, #16]
300033c0:	e59d3014 	ldr	r3, [sp, #20]
300033c4:	e1520003 	cmp	r2, r3
300033c8:	1affffdc 	bne	30003340 <acoral_release_pool+0x3c>
300033cc:	ea000000 	b	300033d4 <acoral_release_pool+0xd0>
void acoral_release_pool(acoral_pool_ctrl_t *pool_ctrl){
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->pools;
	if(acoral_list_empty(head))
	  	return;
300033d0:	e1a00000 	nop			; (mov r0, r0)
			acoral_free(pool->base_adr);
			pool->base_adr=(void *)acoral_free_res_pool;
			pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
			acoral_free_res_pool=pool;
	}
}
300033d4:	e28dd01c 	add	sp, sp, #28
300033d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300033dc:	e12fff1e 	bx	lr
300033e0:	3000f3c4 	.word	0x3000f3c4

300033e4 <acoral_collect_pool>:
/*================================
 *    collect a kind of resource pool
 *       回收某一资源内存池空闲的内存池
 *       pool_ctrl--资源内存池管理块
 *================================*/
void acoral_collect_pool(acoral_pool_ctrl_t *pool_ctrl){
300033e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300033e8:	e24dd01c 	sub	sp, sp, #28
300033ec:	e58d0004 	str	r0, [sp, #4]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->free_pools;
300033f0:	e59d3004 	ldr	r3, [sp, #4]
300033f4:	e5933014 	ldr	r3, [r3, #20]
300033f8:	e58d3014 	str	r3, [sp, #20]
	if(acoral_list_empty(head))
300033fc:	e59d3014 	ldr	r3, [sp, #20]
30003400:	e5932000 	ldr	r2, [r3]
30003404:	e59d3014 	ldr	r3, [sp, #20]
30003408:	e1520003 	cmp	r2, r3
3000340c:	0a00002d 	beq	300034c8 <acoral_collect_pool+0xe4>
	  	return;
        for(list=head->next;list!=head;list=list->next){
30003410:	e59d3014 	ldr	r3, [sp, #20]
30003414:	e5933000 	ldr	r3, [r3]
30003418:	e58d3010 	str	r3, [sp, #16]
3000341c:	ea000024 	b	300034b4 <acoral_collect_pool+0xd0>
			pool=list_entry(list,acoral_pool_t,free_list);
30003420:	e59d3010 	ldr	r3, [sp, #16]
30003424:	e2433028 	sub	r3, r3, #40	; 0x28
30003428:	e58d300c 	str	r3, [sp, #12]
	       	if(pool->free_num==pool->num){
3000342c:	e59d300c 	ldr	r3, [sp, #12]
30003430:	e5932018 	ldr	r2, [r3, #24]
30003434:	e59d300c 	ldr	r3, [sp, #12]
30003438:	e5933010 	ldr	r3, [r3, #16]
3000343c:	e1520003 	cmp	r2, r3
30003440:	1a000018 	bne	300034a8 <acoral_collect_pool+0xc4>
		      	acoral_list_del(&pool->ctrl_list);
30003444:	e59d300c 	ldr	r3, [sp, #12]
30003448:	e2833020 	add	r3, r3, #32
3000344c:	e1a00003 	mov	r0, r3
30003450:	eb001aed 	bl	3000a00c <acoral_list_del>
				acoral_list_del(&pool->free_list);
30003454:	e59d300c 	ldr	r3, [sp, #12]
30003458:	e2833028 	add	r3, r3, #40	; 0x28
3000345c:	e1a00003 	mov	r0, r3
30003460:	eb001ae9 	bl	3000a00c <acoral_list_del>
				acoral_free(pool->base_adr);
30003464:	e59d300c 	ldr	r3, [sp, #12]
30003468:	e5933000 	ldr	r3, [r3]
3000346c:	e1a00003 	mov	r0, r3
30003470:	eb000c00 	bl	30006478 <buddy_free>
				pool->base_adr=(void *)acoral_free_res_pool;
30003474:	e59f305c 	ldr	r3, [pc, #92]	; 300034d8 <acoral_collect_pool+0xf4>
30003478:	e5932000 	ldr	r2, [r3]
3000347c:	e59d300c 	ldr	r3, [sp, #12]
30003480:	e5832000 	str	r2, [r3]
				pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
30003484:	e59d300c 	ldr	r3, [sp, #12]
30003488:	e5933008 	ldr	r3, [r3, #8]
3000348c:	e1a03b03 	lsl	r3, r3, #22
30003490:	e1a03b23 	lsr	r3, r3, #22
30003494:	e59d200c 	ldr	r2, [sp, #12]
30003498:	e5823008 	str	r3, [r2, #8]
				acoral_free_res_pool=pool;
3000349c:	e59f3034 	ldr	r3, [pc, #52]	; 300034d8 <acoral_collect_pool+0xf4>
300034a0:	e59d200c 	ldr	r2, [sp, #12]
300034a4:	e5832000 	str	r2, [r3]
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->free_pools;
	if(acoral_list_empty(head))
	  	return;
        for(list=head->next;list!=head;list=list->next){
300034a8:	e59d3010 	ldr	r3, [sp, #16]
300034ac:	e5933000 	ldr	r3, [r3]
300034b0:	e58d3010 	str	r3, [sp, #16]
300034b4:	e59d2010 	ldr	r2, [sp, #16]
300034b8:	e59d3014 	ldr	r3, [sp, #20]
300034bc:	e1520003 	cmp	r2, r3
300034c0:	1affffd6 	bne	30003420 <acoral_collect_pool+0x3c>
300034c4:	ea000000 	b	300034cc <acoral_collect_pool+0xe8>
void acoral_collect_pool(acoral_pool_ctrl_t *pool_ctrl){
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->free_pools;
	if(acoral_list_empty(head))
	  	return;
300034c8:	e1a00000 	nop			; (mov r0, r0)
				pool->base_adr=(void *)acoral_free_res_pool;
				pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
				acoral_free_res_pool=pool;
			}
	}
}
300034cc:	e28dd01c 	add	sp, sp, #28
300034d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300034d4:	e12fff1e 	bx	lr
300034d8:	3000f3c4 	.word	0x3000f3c4

300034dc <acoral_get_res>:
/*================================
 *    get a kind of resource 
 *       获取某一资源
 *       pool_ctrl--资源池管理块
 *================================*/
acoral_res_t *acoral_get_res(acoral_pool_ctrl_t *pool_ctrl){
300034dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300034e0:	e24dd01c 	sub	sp, sp, #28
300034e4:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
  	acoral_list_t *first;
	acoral_res_t *res;
	acoral_pool_t *pool;
	HAL_ENTER_CRITICAL();
300034e8:	ebfff881 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300034ec:	e1a03000 	mov	r3, r0
300034f0:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&pool_ctrl->lock);
	first=pool_ctrl->free_pools->next;
300034f4:	e59d3004 	ldr	r3, [sp, #4]
300034f8:	e5933014 	ldr	r3, [r3, #20]
300034fc:	e5933000 	ldr	r3, [r3]
30003500:	e58d300c 	str	r3, [sp, #12]
	if(acoral_list_empty(first)){
30003504:	e59d300c 	ldr	r3, [sp, #12]
30003508:	e5932000 	ldr	r2, [r3]
3000350c:	e59d300c 	ldr	r3, [sp, #12]
30003510:	e1520003 	cmp	r2, r3
30003514:	1a00000c 	bne	3000354c <acoral_get_res+0x70>
	  	if(acoral_create_pool(pool_ctrl)){
30003518:	e59d0004 	ldr	r0, [sp, #4]
3000351c:	ebffff1f 	bl	300031a0 <acoral_create_pool>
30003520:	e1a03000 	mov	r3, r0
30003524:	e3530000 	cmp	r3, #0
30003528:	0a000003 	beq	3000353c <acoral_get_res+0x60>
			acoral_spin_unlock(&pool_ctrl->lock);
			HAL_EXIT_CRITICAL();
3000352c:	e59d0008 	ldr	r0, [sp, #8]
30003530:	ebfff86d 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL;
30003534:	e3a03000 	mov	r3, #0
30003538:	ea00002e 	b	300035f8 <acoral_get_res+0x11c>
		}
		else{
			first=pool_ctrl->free_pools->next;
3000353c:	e59d3004 	ldr	r3, [sp, #4]
30003540:	e5933014 	ldr	r3, [r3, #20]
30003544:	e5933000 	ldr	r3, [r3]
30003548:	e58d300c 	str	r3, [sp, #12]
		}
	}
	pool=list_entry(first,acoral_pool_t,free_list);
3000354c:	e59d300c 	ldr	r3, [sp, #12]
30003550:	e2433028 	sub	r3, r3, #40	; 0x28
30003554:	e58d3014 	str	r3, [sp, #20]
	res=(acoral_res_t *)pool->res_free;
30003558:	e59d3014 	ldr	r3, [sp, #20]
3000355c:	e5933004 	ldr	r3, [r3, #4]
30003560:	e58d3010 	str	r3, [sp, #16]
	pool->res_free=(void *)((acoral_u8 *)pool->base_adr+res->next_id*pool->size);
30003564:	e59d3014 	ldr	r3, [sp, #20]
30003568:	e5932000 	ldr	r2, [r3]
3000356c:	e59d3010 	ldr	r3, [sp, #16]
30003570:	e1d330b0 	ldrh	r3, [r3]
30003574:	e59d1014 	ldr	r1, [sp, #20]
30003578:	e591100c 	ldr	r1, [r1, #12]
3000357c:	e0030391 	mul	r3, r1, r3
30003580:	e0822003 	add	r2, r2, r3
30003584:	e59d3014 	ldr	r3, [sp, #20]
30003588:	e5832004 	str	r2, [r3, #4]
	res->id=(res->id>>(ACORAL_RES_INDEX_INIT_BIT-ACORAL_RES_INDEX_BIT))&ACORAL_RES_INDEX_MASK|pool->id;
3000358c:	e59d3010 	ldr	r3, [sp, #16]
30003590:	e5933000 	ldr	r3, [r3]
30003594:	e1a03143 	asr	r3, r3, #2
30003598:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
3000359c:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
300035a0:	e3c3303f 	bic	r3, r3, #63	; 0x3f
300035a4:	e59d2014 	ldr	r2, [sp, #20]
300035a8:	e5922008 	ldr	r2, [r2, #8]
300035ac:	e1832002 	orr	r2, r3, r2
300035b0:	e59d3010 	ldr	r3, [sp, #16]
300035b4:	e5832000 	str	r2, [r3]
        pool->free_num--;
300035b8:	e59d3014 	ldr	r3, [sp, #20]
300035bc:	e5933018 	ldr	r3, [r3, #24]
300035c0:	e2432001 	sub	r2, r3, #1
300035c4:	e59d3014 	ldr	r3, [sp, #20]
300035c8:	e5832018 	str	r2, [r3, #24]
#ifdef CFG_TEST
	acoral_print("Alloc res 0x%x\n",res);
#endif
	if(!pool->free_num){
300035cc:	e59d3014 	ldr	r3, [sp, #20]
300035d0:	e5933018 	ldr	r3, [r3, #24]
300035d4:	e3530000 	cmp	r3, #0
300035d8:	1a000003 	bne	300035ec <acoral_get_res+0x110>
	  	acoral_list_del(&pool->free_list);
300035dc:	e59d3014 	ldr	r3, [sp, #20]
300035e0:	e2833028 	add	r3, r3, #40	; 0x28
300035e4:	e1a00003 	mov	r0, r3
300035e8:	eb001a87 	bl	3000a00c <acoral_list_del>
	}
	acoral_spin_unlock(&pool_ctrl->lock);
	HAL_EXIT_CRITICAL();
300035ec:	e59d0008 	ldr	r0, [sp, #8]
300035f0:	ebfff83d 	bl	300016ec <HAL_INTR_RESTORE>
	return res;
300035f4:	e59d3010 	ldr	r3, [sp, #16]
}
300035f8:	e1a00003 	mov	r0, r3
300035fc:	e28dd01c 	add	sp, sp, #28
30003600:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003604:	e12fff1e 	bx	lr

30003608 <acoral_release_res>:
/*================================
 *    release a kind of resource 
 *       释放某一资源
 *      res--资源数据块
 *================================*/
void acoral_release_res(acoral_res_t *res){
30003608:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000360c:	e24dd01c 	sub	sp, sp, #28
30003610:	e58d0004 	str	r0, [sp, #4]
  	acoral_pool_t *pool;
	acoral_u32 index;
  	void *tmp;
       	acoral_pool_ctrl_t *pool_ctrl;
	if(!ACORAL_ASSERT(res,"Res Release\n"))
30003614:	e59f3168 	ldr	r3, [pc, #360]	; 30003784 <acoral_release_res+0x17c>
30003618:	e59d0004 	ldr	r0, [sp, #4]
3000361c:	e1a01003 	mov	r1, r3
30003620:	eb00017f 	bl	30003c24 <acoral_assert_res>
30003624:	e1a03000 	mov	r3, r0
30003628:	e3530000 	cmp	r3, #0
3000362c:	0a00004e 	beq	3000376c <acoral_release_res+0x164>
		return;
	pool=acoral_get_pool_by_id(res->id);
30003630:	e59d3004 	ldr	r3, [sp, #4]
30003634:	e5933000 	ldr	r3, [r3]
30003638:	e1a00003 	mov	r0, r3
3000363c:	eb000053 	bl	30003790 <acoral_get_pool_by_id>
30003640:	e1a03000 	mov	r3, r0
30003644:	e58d3008 	str	r3, [sp, #8]
	if(pool==NULL){
30003648:	e59d3008 	ldr	r3, [sp, #8]
3000364c:	e3530000 	cmp	r3, #0
30003650:	1a000002 	bne	30003660 <acoral_release_res+0x58>
		acoral_printerr("Res release Err\n");
30003654:	e59f012c 	ldr	r0, [pc, #300]	; 30003788 <acoral_release_res+0x180>
30003658:	eb001eea 	bl	3000b208 <acoral_print>
		return;
3000365c:	ea000045 	b	30003778 <acoral_release_res+0x170>
	}
 	pool_ctrl=pool->ctrl;
30003660:	e59d3008 	ldr	r3, [sp, #8]
30003664:	e593301c 	ldr	r3, [r3, #28]
30003668:	e58d3014 	str	r3, [sp, #20]
	acoral_spin_lock(&pool_ctrl->lock);
	if((void *)res<pool->base_adr){
3000366c:	e59d3008 	ldr	r3, [sp, #8]
30003670:	e5932000 	ldr	r2, [r3]
30003674:	e59d3004 	ldr	r3, [sp, #4]
30003678:	e1520003 	cmp	r2, r3
3000367c:	9a000002 	bls	3000368c <acoral_release_res+0x84>
		acoral_printerr("Err Res\n");
30003680:	e59f0104 	ldr	r0, [pc, #260]	; 3000378c <acoral_release_res+0x184>
30003684:	eb001edf 	bl	3000b208 <acoral_print>
		return;
30003688:	ea00003a 	b	30003778 <acoral_release_res+0x170>
	}
	index=(((acoral_u32)res-(acoral_u32)pool->base_adr)/pool->size);
3000368c:	e59d2004 	ldr	r2, [sp, #4]
30003690:	e59d3008 	ldr	r3, [sp, #8]
30003694:	e5933000 	ldr	r3, [r3]
30003698:	e0632002 	rsb	r2, r3, r2
3000369c:	e59d3008 	ldr	r3, [sp, #8]
300036a0:	e593300c 	ldr	r3, [r3, #12]
300036a4:	e1a00002 	mov	r0, r2
300036a8:	e1a01003 	mov	r1, r3
300036ac:	eb0028d4 	bl	3000da04 <__aeabi_uidiv>
300036b0:	e1a03000 	mov	r3, r0
300036b4:	e58d300c 	str	r3, [sp, #12]
	if(index>=pool->num){
300036b8:	e59d3008 	ldr	r3, [sp, #8]
300036bc:	e5932010 	ldr	r2, [r3, #16]
300036c0:	e59d300c 	ldr	r3, [sp, #12]
300036c4:	e1520003 	cmp	r2, r3
300036c8:	8a000002 	bhi	300036d8 <acoral_release_res+0xd0>
		acoral_printerr("Err Res\n");
300036cc:	e59f00b8 	ldr	r0, [pc, #184]	; 3000378c <acoral_release_res+0x184>
300036d0:	eb001ecc 	bl	3000b208 <acoral_print>
		return;
300036d4:	ea000027 	b	30003778 <acoral_release_res+0x170>
	}
#ifdef CFG_TEST
	acoral_print("Free res 0x%x\n",res);
#endif
	tmp=pool->res_free;
300036d8:	e59d3008 	ldr	r3, [sp, #8]
300036dc:	e5933004 	ldr	r3, [r3, #4]
300036e0:	e58d3010 	str	r3, [sp, #16]
	pool->res_free=(void *)res;
300036e4:	e59d3008 	ldr	r3, [sp, #8]
300036e8:	e59d2004 	ldr	r2, [sp, #4]
300036ec:	e5832004 	str	r2, [r3, #4]
	res->id=index<<ACORAL_RES_INDEX_INIT_BIT;
300036f0:	e59d300c 	ldr	r3, [sp, #12]
300036f4:	e1a03803 	lsl	r3, r3, #16
300036f8:	e1a02003 	mov	r2, r3
300036fc:	e59d3004 	ldr	r3, [sp, #4]
30003700:	e5832000 	str	r2, [r3]
	res->next_id=((acoral_res_t *)tmp)->id>>ACORAL_RES_INDEX_INIT_BIT;
30003704:	e59d3010 	ldr	r3, [sp, #16]
30003708:	e5933000 	ldr	r3, [r3]
3000370c:	e1a03843 	asr	r3, r3, #16
30003710:	e1a03803 	lsl	r3, r3, #16
30003714:	e1a02823 	lsr	r2, r3, #16
30003718:	e59d3004 	ldr	r3, [sp, #4]
3000371c:	e1c320b0 	strh	r2, [r3]
	pool->free_num++;
30003720:	e59d3008 	ldr	r3, [sp, #8]
30003724:	e5933018 	ldr	r3, [r3, #24]
30003728:	e2832001 	add	r2, r3, #1
3000372c:	e59d3008 	ldr	r3, [sp, #8]
30003730:	e5832018 	str	r2, [r3, #24]
	if(acoral_list_empty(&pool->free_list))
30003734:	e59d3008 	ldr	r3, [sp, #8]
30003738:	e5932028 	ldr	r2, [r3, #40]	; 0x28
3000373c:	e59d3008 	ldr	r3, [sp, #8]
30003740:	e2833028 	add	r3, r3, #40	; 0x28
30003744:	e1520003 	cmp	r2, r3
30003748:	1a000009 	bne	30003774 <acoral_release_res+0x16c>
	  	acoral_list_add(&pool->free_list,pool_ctrl->free_pools);
3000374c:	e59d3008 	ldr	r3, [sp, #8]
30003750:	e2832028 	add	r2, r3, #40	; 0x28
30003754:	e59d3014 	ldr	r3, [sp, #20]
30003758:	e5933014 	ldr	r3, [r3, #20]
3000375c:	e1a00002 	mov	r0, r2
30003760:	e1a01003 	mov	r1, r3
30003764:	eb001a02 	bl	30009f74 <acoral_list_add>
	acoral_spin_unlock(&pool_ctrl->lock);
	return;
30003768:	ea000002 	b	30003778 <acoral_release_res+0x170>
  	acoral_pool_t *pool;
	acoral_u32 index;
  	void *tmp;
       	acoral_pool_ctrl_t *pool_ctrl;
	if(!ACORAL_ASSERT(res,"Res Release\n"))
		return;
3000376c:	e1a00000 	nop			; (mov r0, r0)
30003770:	ea000000 	b	30003778 <acoral_release_res+0x170>
	res->next_id=((acoral_res_t *)tmp)->id>>ACORAL_RES_INDEX_INIT_BIT;
	pool->free_num++;
	if(acoral_list_empty(&pool->free_list))
	  	acoral_list_add(&pool->free_list,pool_ctrl->free_pools);
	acoral_spin_unlock(&pool_ctrl->lock);
	return;
30003774:	e1a00000 	nop			; (mov r0, r0)
}
30003778:	e28dd01c 	add	sp, sp, #28
3000377c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003780:	e12fff1e 	bx	lr
30003784:	3000e288 	.word	0x3000e288
30003788:	3000e298 	.word	0x3000e298
3000378c:	3000e2ac 	.word	0x3000e2ac

30003790 <acoral_get_pool_by_id>:
/*================================
 *    get a kind of resource by res_id
 *  根据资源ID获取某一资源对应的资源池
 *      res_id--资源ID
 *================================*/
acoral_pool_t *acoral_get_pool_by_id(acoral_id res_id){
30003790:	e24dd010 	sub	sp, sp, #16
30003794:	e58d0004 	str	r0, [sp, #4]
  	acoral_u32 index;
	index=(res_id&ACORAL_POOL_INDEX_MASK)>>ACORAL_POOL_INDEX_BIT;
30003798:	e59d3004 	ldr	r3, [sp, #4]
3000379c:	e1a03b03 	lsl	r3, r3, #22
300037a0:	e1a03b23 	lsr	r3, r3, #22
300037a4:	e58d300c 	str	r3, [sp, #12]
	if(index<ACORAL_MAX_POOLS)
300037a8:	e59d300c 	ldr	r3, [sp, #12]
300037ac:	e3530027 	cmp	r3, #39	; 0x27
300037b0:	8a00000a 	bhi	300037e0 <acoral_get_pool_by_id+0x50>
	  	return acoral_pools+index;
300037b4:	e59d200c 	ldr	r2, [sp, #12]
300037b8:	e1a03002 	mov	r3, r2
300037bc:	e1a03083 	lsl	r3, r3, #1
300037c0:	e0833002 	add	r3, r3, r2
300037c4:	e1a03103 	lsl	r3, r3, #2
300037c8:	e0833002 	add	r3, r3, r2
300037cc:	e1a03103 	lsl	r3, r3, #2
300037d0:	e1a02003 	mov	r2, r3
300037d4:	e59f3014 	ldr	r3, [pc, #20]	; 300037f0 <acoral_get_pool_by_id+0x60>
300037d8:	e0823003 	add	r3, r2, r3
300037dc:	ea000000 	b	300037e4 <acoral_get_pool_by_id+0x54>
	return NULL;
300037e0:	e3a03000 	mov	r3, #0
}
300037e4:	e1a00003 	mov	r0, r3
300037e8:	e28dd010 	add	sp, sp, #16
300037ec:	e12fff1e 	bx	lr
300037f0:	3000fadc 	.word	0x3000fadc

300037f4 <acoral_get_free_pool>:

/*================================
 *    get a free pool
 *     获取空闲资源池
 *================================*/
acoral_pool_t *acoral_get_free_pool(){
300037f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300037f8:	e24dd00c 	sub	sp, sp, #12
	acoral_sr cpu_sr;
  	acoral_pool_t *tmp;
	HAL_ENTER_CRITICAL();
300037fc:	ebfff7bc 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30003800:	e1a03000 	mov	r3, r0
30003804:	e58d3000 	str	r3, [sp]
	tmp=acoral_free_res_pool;
30003808:	e59f3044 	ldr	r3, [pc, #68]	; 30003854 <acoral_get_free_pool+0x60>
3000380c:	e5933000 	ldr	r3, [r3]
30003810:	e58d3004 	str	r3, [sp, #4]
	if(NULL!=tmp){
30003814:	e59d3004 	ldr	r3, [sp, #4]
30003818:	e3530000 	cmp	r3, #0
3000381c:	0a000005 	beq	30003838 <acoral_get_free_pool+0x44>
		acoral_spin_lock(&tmp->lock);
		acoral_free_res_pool=*(void **)tmp->base_adr;
30003820:	e59d3004 	ldr	r3, [sp, #4]
30003824:	e5933000 	ldr	r3, [r3]
30003828:	e5933000 	ldr	r3, [r3]
3000382c:	e1a02003 	mov	r2, r3
30003830:	e59f301c 	ldr	r3, [pc, #28]	; 30003854 <acoral_get_free_pool+0x60>
30003834:	e5832000 	str	r2, [r3]
		acoral_spin_unlock(&tmp->lock);
	}
	HAL_EXIT_CRITICAL();
30003838:	e59d0000 	ldr	r0, [sp]
3000383c:	ebfff7aa 	bl	300016ec <HAL_INTR_RESTORE>
	return tmp;
30003840:	e59d3004 	ldr	r3, [sp, #4]
}
30003844:	e1a00003 	mov	r0, r3
30003848:	e28dd00c 	add	sp, sp, #12
3000384c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003850:	e12fff1e 	bx	lr
30003854:	3000f3c4 	.word	0x3000f3c4

30003858 <acoral_get_res_by_id>:

acoral_res_t * acoral_get_res_by_id(acoral_id id){
30003858:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000385c:	e24dd014 	sub	sp, sp, #20
30003860:	e58d0004 	str	r0, [sp, #4]
  	acoral_pool_t *pool;
	acoral_u32 index;
	pool=acoral_get_pool_by_id(id);
30003864:	e59d0004 	ldr	r0, [sp, #4]
30003868:	ebffffc8 	bl	30003790 <acoral_get_pool_by_id>
3000386c:	e1a03000 	mov	r3, r0
30003870:	e58d3008 	str	r3, [sp, #8]
	if(pool==NULL)
30003874:	e59d3008 	ldr	r3, [sp, #8]
30003878:	e3530000 	cmp	r3, #0
3000387c:	1a000001 	bne	30003888 <acoral_get_res_by_id+0x30>
		return NULL;
30003880:	e3a03000 	mov	r3, #0
30003884:	ea00000d 	b	300038c0 <acoral_get_res_by_id+0x68>
	index=(id&ACORAL_RES_INDEX_MASK)>>ACORAL_RES_INDEX_BIT;
30003888:	e59d3004 	ldr	r3, [sp, #4]
3000388c:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
30003890:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
30003894:	e3c3303f 	bic	r3, r3, #63	; 0x3f
30003898:	e1a03743 	asr	r3, r3, #14
3000389c:	e58d300c 	str	r3, [sp, #12]
     	return (acoral_res_t *)((acoral_u8 *)pool->base_adr+index*pool->size);
300038a0:	e59d3008 	ldr	r3, [sp, #8]
300038a4:	e5933000 	ldr	r3, [r3]
300038a8:	e1a02003 	mov	r2, r3
300038ac:	e59d3008 	ldr	r3, [sp, #8]
300038b0:	e593300c 	ldr	r3, [r3, #12]
300038b4:	e59d100c 	ldr	r1, [sp, #12]
300038b8:	e0030391 	mul	r3, r1, r3
300038bc:	e0823003 	add	r3, r2, r3
}
300038c0:	e1a00003 	mov	r0, r3
300038c4:	e28dd014 	add	sp, sp, #20
300038c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300038cc:	e12fff1e 	bx	lr

300038d0 <acoral_pool_res_init>:

/*================================
 *       a kind of resource initial 
 *        资源初始化
 *================================*/
void acoral_pool_res_init(acoral_pool_t * pool){
300038d0:	e24dd018 	sub	sp, sp, #24
300038d4:	e58d0004 	str	r0, [sp, #4]
	acoral_res_t *res;
	acoral_u32 i;
	acoral_u8 *pblk;
	acoral_u32 blks;
	blks=pool->num;
300038d8:	e59d3004 	ldr	r3, [sp, #4]
300038dc:	e5933010 	ldr	r3, [r3, #16]
300038e0:	e58d3014 	str	r3, [sp, #20]
	res=(acoral_res_t *)pool->base_adr;
300038e4:	e59d3004 	ldr	r3, [sp, #4]
300038e8:	e5933000 	ldr	r3, [r3]
300038ec:	e58d3008 	str	r3, [sp, #8]
     	pblk=(acoral_u8 *)pool->base_adr + pool->size;
300038f0:	e59d3004 	ldr	r3, [sp, #4]
300038f4:	e5933000 	ldr	r3, [r3]
300038f8:	e1a02003 	mov	r2, r3
300038fc:	e59d3004 	ldr	r3, [sp, #4]
30003900:	e593300c 	ldr	r3, [r3, #12]
30003904:	e0823003 	add	r3, r2, r3
30003908:	e58d3010 	str	r3, [sp, #16]
	for (i = 0; i < (blks - 1); i++) {
3000390c:	e3a03000 	mov	r3, #0
30003910:	e58d300c 	str	r3, [sp, #12]
30003914:	ea000016 	b	30003974 <acoral_pool_res_init+0xa4>
	    res->id=i<<ACORAL_RES_INDEX_INIT_BIT;
30003918:	e59d300c 	ldr	r3, [sp, #12]
3000391c:	e1a03803 	lsl	r3, r3, #16
30003920:	e1a02003 	mov	r2, r3
30003924:	e59d3008 	ldr	r3, [sp, #8]
30003928:	e5832000 	str	r2, [r3]
	    res->next_id=i+1;
3000392c:	e59d300c 	ldr	r3, [sp, #12]
30003930:	e1a03803 	lsl	r3, r3, #16
30003934:	e1a03823 	lsr	r3, r3, #16
30003938:	e2833001 	add	r3, r3, #1
3000393c:	e1a03803 	lsl	r3, r3, #16
30003940:	e1a02823 	lsr	r2, r3, #16
30003944:	e59d3008 	ldr	r3, [sp, #8]
30003948:	e1c320b0 	strh	r2, [r3]
	    res=(acoral_res_t *)pblk;
3000394c:	e59d3010 	ldr	r3, [sp, #16]
30003950:	e58d3008 	str	r3, [sp, #8]
	    pblk+=pool->size;
30003954:	e59d3004 	ldr	r3, [sp, #4]
30003958:	e593300c 	ldr	r3, [r3, #12]
3000395c:	e59d2010 	ldr	r2, [sp, #16]
30003960:	e0823003 	add	r3, r2, r3
30003964:	e58d3010 	str	r3, [sp, #16]
	acoral_u8 *pblk;
	acoral_u32 blks;
	blks=pool->num;
	res=(acoral_res_t *)pool->base_adr;
     	pblk=(acoral_u8 *)pool->base_adr + pool->size;
	for (i = 0; i < (blks - 1); i++) {
30003968:	e59d300c 	ldr	r3, [sp, #12]
3000396c:	e2833001 	add	r3, r3, #1
30003970:	e58d300c 	str	r3, [sp, #12]
30003974:	e59d3014 	ldr	r3, [sp, #20]
30003978:	e2432001 	sub	r2, r3, #1
3000397c:	e59d300c 	ldr	r3, [sp, #12]
30003980:	e1520003 	cmp	r2, r3
30003984:	8affffe3 	bhi	30003918 <acoral_pool_res_init+0x48>
	    res->id=i<<ACORAL_RES_INDEX_INIT_BIT;
	    res->next_id=i+1;
	    res=(acoral_res_t *)pblk;
	    pblk+=pool->size;
	}
	res->id=blks-1<<ACORAL_RES_INDEX_INIT_BIT;
30003988:	e59d3014 	ldr	r3, [sp, #20]
3000398c:	e2433001 	sub	r3, r3, #1
30003990:	e1a03803 	lsl	r3, r3, #16
30003994:	e1a02003 	mov	r2, r3
30003998:	e59d3008 	ldr	r3, [sp, #8]
3000399c:	e5832000 	str	r2, [r3]
	res->next_id=0;
300039a0:	e59d3008 	ldr	r3, [sp, #8]
300039a4:	e3a02000 	mov	r2, #0
300039a8:	e1c320b0 	strh	r2, [r3]
}
300039ac:	e28dd018 	add	sp, sp, #24
300039b0:	e12fff1e 	bx	lr

300039b4 <acoral_pools_init>:
/*================================
 *        resource pool initial 
 *              资源池初始化
 *================================*/
void  acoral_pools_init(void)
{
300039b4:	e24dd008 	sub	sp, sp, #8
    acoral_pool_t  *pool;
    acoral_u32 i;
    pool = &acoral_pools[0];
300039b8:	e59f3090 	ldr	r3, [pc, #144]	; 30003a50 <acoral_pools_init+0x9c>
300039bc:	e58d3000 	str	r3, [sp]
    for (i = 0; i < (ACORAL_MAX_POOLS - 1); i++) {
300039c0:	e3a03000 	mov	r3, #0
300039c4:	e58d3004 	str	r3, [sp, #4]
300039c8:	ea000015 	b	30003a24 <acoral_pools_init+0x70>
        pool->base_adr= (void *)&acoral_pools[i+1];
300039cc:	e59d3004 	ldr	r3, [sp, #4]
300039d0:	e2832001 	add	r2, r3, #1
300039d4:	e1a03002 	mov	r3, r2
300039d8:	e1a03083 	lsl	r3, r3, #1
300039dc:	e0833002 	add	r3, r3, r2
300039e0:	e1a03103 	lsl	r3, r3, #2
300039e4:	e0833002 	add	r3, r3, r2
300039e8:	e1a03103 	lsl	r3, r3, #2
300039ec:	e1a02003 	mov	r2, r3
300039f0:	e59f3058 	ldr	r3, [pc, #88]	; 30003a50 <acoral_pools_init+0x9c>
300039f4:	e0822003 	add	r2, r2, r3
300039f8:	e59d3000 	ldr	r3, [sp]
300039fc:	e5832000 	str	r2, [r3]
		pool->id=i;
30003a00:	e59d2004 	ldr	r2, [sp, #4]
30003a04:	e59d3000 	ldr	r3, [sp]
30003a08:	e5832008 	str	r2, [r3, #8]
        pool++;
30003a0c:	e59d3000 	ldr	r3, [sp]
30003a10:	e2833034 	add	r3, r3, #52	; 0x34
30003a14:	e58d3000 	str	r3, [sp]
void  acoral_pools_init(void)
{
    acoral_pool_t  *pool;
    acoral_u32 i;
    pool = &acoral_pools[0];
    for (i = 0; i < (ACORAL_MAX_POOLS - 1); i++) {
30003a18:	e59d3004 	ldr	r3, [sp, #4]
30003a1c:	e2833001 	add	r3, r3, #1
30003a20:	e58d3004 	str	r3, [sp, #4]
30003a24:	e59d3004 	ldr	r3, [sp, #4]
30003a28:	e3530026 	cmp	r3, #38	; 0x26
30003a2c:	9affffe6 	bls	300039cc <acoral_pools_init+0x18>
        pool->base_adr= (void *)&acoral_pools[i+1];
		pool->id=i;
        pool++;
		acoral_spin_init(&pool->lock);
    }
    pool->base_adr= (void *)0;
30003a30:	e59d3000 	ldr	r3, [sp]
30003a34:	e3a02000 	mov	r2, #0
30003a38:	e5832000 	str	r2, [r3]
    acoral_free_res_pool = &acoral_pools[0];
30003a3c:	e59f3010 	ldr	r3, [pc, #16]	; 30003a54 <acoral_pools_init+0xa0>
30003a40:	e59f2008 	ldr	r2, [pc, #8]	; 30003a50 <acoral_pools_init+0x9c>
30003a44:	e5832000 	str	r2, [r3]
	acoral_spin_init(&acoral_free_res_pool->lock);
}
30003a48:	e28dd008 	add	sp, sp, #8
30003a4c:	e12fff1e 	bx	lr
30003a50:	3000fadc 	.word	0x3000fadc
30003a54:	3000f3c4 	.word	0x3000f3c4

30003a58 <acoral_pool_ctrl_init>:
/*================================
 *        resource pool control initial 
 *              资源池控制块初始化
 *================================*/
void acoral_pool_ctrl_init(acoral_pool_ctrl_t *pool_ctrl)
{
30003a58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003a5c:	e24dd014 	sub	sp, sp, #20
30003a60:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 size;
	pool_ctrl->free_pools=&pool_ctrl->list[0];
30003a64:	e59d3004 	ldr	r3, [sp, #4]
30003a68:	e283201c 	add	r2, r3, #28
30003a6c:	e59d3004 	ldr	r3, [sp, #4]
30003a70:	e5832014 	str	r2, [r3, #20]
	pool_ctrl->pools=&pool_ctrl->list[1];
30003a74:	e59d3004 	ldr	r3, [sp, #4]
30003a78:	e2832024 	add	r2, r3, #36	; 0x24
30003a7c:	e59d3004 	ldr	r3, [sp, #4]
30003a80:	e5832018 	str	r2, [r3, #24]
	pool_ctrl->num=0;
30003a84:	e59d3004 	ldr	r3, [sp, #4]
30003a88:	e3a02000 	mov	r2, #0
30003a8c:	e583200c 	str	r2, [r3, #12]
	acoral_init_list(pool_ctrl->pools);
30003a90:	e59d3004 	ldr	r3, [sp, #4]
30003a94:	e5933018 	ldr	r3, [r3, #24]
30003a98:	e59d2004 	ldr	r2, [sp, #4]
30003a9c:	e5922018 	ldr	r2, [r2, #24]
30003aa0:	e5832000 	str	r2, [r3]
30003aa4:	e59d3004 	ldr	r3, [sp, #4]
30003aa8:	e5933018 	ldr	r3, [r3, #24]
30003aac:	e59d2004 	ldr	r2, [sp, #4]
30003ab0:	e5922018 	ldr	r2, [r2, #24]
30003ab4:	e5832004 	str	r2, [r3, #4]
    acoral_init_list(pool_ctrl->free_pools);
30003ab8:	e59d3004 	ldr	r3, [sp, #4]
30003abc:	e5933014 	ldr	r3, [r3, #20]
30003ac0:	e59d2004 	ldr	r2, [sp, #4]
30003ac4:	e5922014 	ldr	r2, [r2, #20]
30003ac8:	e5832000 	str	r2, [r3]
30003acc:	e59d3004 	ldr	r3, [sp, #4]
30003ad0:	e5933014 	ldr	r3, [r3, #20]
30003ad4:	e59d2004 	ldr	r2, [sp, #4]
30003ad8:	e5922014 	ldr	r2, [r2, #20]
30003adc:	e5832004 	str	r2, [r3, #4]
    acoral_spin_init(&pool_ctrl->lock);
	/*调整pool的对象个数以最大化利用分配了的内存*/
	size=acoral_malloc_size(pool_ctrl->size*pool_ctrl->num_per_pool);
30003ae0:	e59d3004 	ldr	r3, [sp, #4]
30003ae4:	e5933004 	ldr	r3, [r3, #4]
30003ae8:	e59d2004 	ldr	r2, [sp, #4]
30003aec:	e5922008 	ldr	r2, [r2, #8]
30003af0:	e0030392 	mul	r3, r2, r3
30003af4:	e1a00003 	mov	r0, r3
30003af8:	eb0009fd 	bl	300062f4 <buddy_malloc_size>
30003afc:	e1a03000 	mov	r3, r0
30003b00:	e58d300c 	str	r3, [sp, #12]
	if(size<pool_ctrl->size){
30003b04:	e59d3004 	ldr	r3, [sp, #4]
30003b08:	e5932004 	ldr	r2, [r3, #4]
30003b0c:	e59d300c 	ldr	r3, [sp, #12]
30003b10:	e1520003 	cmp	r2, r3
30003b14:	9a000003 	bls	30003b28 <acoral_pool_ctrl_init+0xd0>
		pool_ctrl->num_per_pool=0;
30003b18:	e59d3004 	ldr	r3, [sp, #4]
30003b1c:	e3a02000 	mov	r2, #0
30003b20:	e5832008 	str	r2, [r3, #8]
30003b24:	ea00000a 	b	30003b54 <acoral_pool_ctrl_init+0xfc>
	}
	else{
		pool_ctrl->num_per_pool=size/pool_ctrl->size;
30003b28:	e59d3004 	ldr	r3, [sp, #4]
30003b2c:	e5933004 	ldr	r3, [r3, #4]
30003b30:	e59d000c 	ldr	r0, [sp, #12]
30003b34:	e1a01003 	mov	r1, r3
30003b38:	eb0027b1 	bl	3000da04 <__aeabi_uidiv>
30003b3c:	e1a03000 	mov	r3, r0
30003b40:	e1a02003 	mov	r2, r3
30003b44:	e59d3004 	ldr	r3, [sp, #4]
30003b48:	e5832008 	str	r2, [r3, #8]
		acoral_create_pool(pool_ctrl);
30003b4c:	e59d0004 	ldr	r0, [sp, #4]
30003b50:	ebfffd92 	bl	300031a0 <acoral_create_pool>
	}
}
30003b54:	e28dd014 	add	sp, sp, #20
30003b58:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003b5c:	e12fff1e 	bx	lr

30003b60 <acoral_obj_pool_init>:
 *        user resource api
 *         用户资源相关接口
 *================================*/

void acoral_obj_pool_init(acoral_pool_ctrl_t *pool_ctrl)
{
30003b60:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003b64:	e24dd00c 	sub	sp, sp, #12
30003b68:	e58d0004 	str	r0, [sp, #4]
	pool_ctrl->type=ACORAL_RES_USER;
30003b6c:	e59d3004 	ldr	r3, [sp, #4]
30003b70:	e3a02006 	mov	r2, #6
30003b74:	e5832000 	str	r2, [r3]
	pool_ctrl->size+=sizeof(acoral_res_t);
30003b78:	e59d3004 	ldr	r3, [sp, #4]
30003b7c:	e5933004 	ldr	r3, [r3, #4]
30003b80:	e2832004 	add	r2, r3, #4
30003b84:	e59d3004 	ldr	r3, [sp, #4]
30003b88:	e5832004 	str	r2, [r3, #4]
	acoral_pool_ctrl_init(pool_ctrl);
30003b8c:	e59d0004 	ldr	r0, [sp, #4]
30003b90:	ebffffb0 	bl	30003a58 <acoral_pool_ctrl_init>
}
30003b94:	e28dd00c 	add	sp, sp, #12
30003b98:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003b9c:	e12fff1e 	bx	lr

30003ba0 <acoral_obj_pool_release>:

void acoral_obj_pool_release(acoral_pool_ctrl_t *pool_ctrl){
30003ba0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003ba4:	e24dd00c 	sub	sp, sp, #12
30003ba8:	e58d0004 	str	r0, [sp, #4]
	 acoral_release_pool(pool_ctrl);
30003bac:	e59d0004 	ldr	r0, [sp, #4]
30003bb0:	ebfffdd3 	bl	30003304 <acoral_release_pool>
}
30003bb4:	e28dd00c 	add	sp, sp, #12
30003bb8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003bbc:	e12fff1e 	bx	lr

30003bc0 <acoral_get_obj>:

void *acoral_get_obj(acoral_pool_ctrl_t *pool_ctrl){
30003bc0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003bc4:	e24dd00c 	sub	sp, sp, #12
30003bc8:	e58d0004 	str	r0, [sp, #4]
	return (void *)((acoral_char *)acoral_get_res(pool_ctrl)+sizeof(acoral_res_t));
30003bcc:	e59d0004 	ldr	r0, [sp, #4]
30003bd0:	ebfffe41 	bl	300034dc <acoral_get_res>
30003bd4:	e1a03000 	mov	r3, r0
30003bd8:	e2833004 	add	r3, r3, #4
}
30003bdc:	e1a00003 	mov	r0, r3
30003be0:	e28dd00c 	add	sp, sp, #12
30003be4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003be8:	e12fff1e 	bx	lr

30003bec <acoral_free_obj>:

void acoral_free_obj(void *obj){
30003bec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003bf0:	e24dd00c 	sub	sp, sp, #12
30003bf4:	e58d0004 	str	r0, [sp, #4]
	acoral_release_res((acoral_char *)obj-sizeof(acoral_res_t));
30003bf8:	e59d3004 	ldr	r3, [sp, #4]
30003bfc:	e2433004 	sub	r3, r3, #4
30003c00:	e1a00003 	mov	r0, r3
30003c04:	ebfffe7f 	bl	30003608 <acoral_release_res>
}
30003c08:	e28dd00c 	add	sp, sp, #12
30003c0c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003c10:	e12fff1e 	bx	lr

30003c14 <acoral_res_sys_init>:

/*================================
 *        resource  system initial 
 *          资源系统初始化
 *================================*/
void acoral_res_sys_init(){
30003c14:	e92d4008 	push	{r3, lr}
	acoral_pools_init();
30003c18:	ebffff65 	bl	300039b4 <acoral_pools_init>
}
30003c1c:	e8bd4008 	pop	{r3, lr}
30003c20:	e12fff1e 	bx	lr

30003c24 <acoral_assert_res>:

acoral_char acoral_assert_res(acoral_res_t *res,acoral_8 *assert){
30003c24:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003c28:	e24dd00c 	sub	sp, sp, #12
30003c2c:	e58d0004 	str	r0, [sp, #4]
30003c30:	e58d1000 	str	r1, [sp]
	if(res==NULL||acoral_get_res_by_id(res->id)!=res){
30003c34:	e59d3004 	ldr	r3, [sp, #4]
30003c38:	e3530000 	cmp	r3, #0
30003c3c:	0a000007 	beq	30003c60 <acoral_assert_res+0x3c>
30003c40:	e59d3004 	ldr	r3, [sp, #4]
30003c44:	e5933000 	ldr	r3, [r3]
30003c48:	e1a00003 	mov	r0, r3
30003c4c:	ebffff01 	bl	30003858 <acoral_get_res_by_id>
30003c50:	e1a02000 	mov	r2, r0
30003c54:	e59d3004 	ldr	r3, [sp, #4]
30003c58:	e1520003 	cmp	r2, r3
30003c5c:	0a000009 	beq	30003c88 <acoral_assert_res+0x64>
		acoral_printerr("%s\n",assert);
30003c60:	e59f0034 	ldr	r0, [pc, #52]	; 30003c9c <acoral_assert_res+0x78>
30003c64:	e59d1000 	ldr	r1, [sp]
30003c68:	eb001d66 	bl	3000b208 <acoral_print>
		acoral_printerr("Err res's id:%x\n",res->id);
30003c6c:	e59d3004 	ldr	r3, [sp, #4]
30003c70:	e5933000 	ldr	r3, [r3]
30003c74:	e59f0024 	ldr	r0, [pc, #36]	; 30003ca0 <acoral_assert_res+0x7c>
30003c78:	e1a01003 	mov	r1, r3
30003c7c:	eb001d61 	bl	3000b208 <acoral_print>
		return false;
30003c80:	e3a03000 	mov	r3, #0
30003c84:	ea000000 	b	30003c8c <acoral_assert_res+0x68>
	}
	return true;
30003c88:	e3a03001 	mov	r3, #1
}
30003c8c:	e1a00003 	mov	r0, r3
30003c90:	e28dd00c 	add	sp, sp, #12
30003c94:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003c98:	e12fff1e 	bx	lr
30003c9c:	3000e2b8 	.word	0x3000e2b8
30003ca0:	3000e2bc 	.word	0x3000e2bc

30003ca4 <acoral_intr_sys_init>:

/*===========================                                                                                                                 
*Initialize the interrupt      
*中断初始化函数
*===========================*/
void acoral_intr_sys_init(){
30003ca4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003ca8:	e24dd00c 	sub	sp, sp, #12
	acoral_u32 i;
	acoral_vector index;
      
    /*关中断*/
	acoral_intr_disable();
30003cac:	ebfff689 	bl	300016d8 <HAL_INTR_DISABLE>

    /*中断嵌套标志初始化*/
    HAL_INTR_NESTING_INIT();
30003cb0:	ebfff699 	bl	3000171c <hal_intr_nesting_init_comm>

    /*中断底层初始化函数*/
	HAL_INTR_INIT();
30003cb4:	ebfff2ab 	bl	30000768 <hal_intr_init>


    /*对于每个中断，设置默认的服务处理程序，然后屏蔽该中断*/
	for(i=HAL_INTR_MIN;i<=HAL_INTR_MAX;i++){
30003cb8:	e3a03000 	mov	r3, #0
30003cbc:	e58d3000 	str	r3, [sp]
30003cc0:	ea00001b 	b	30003d34 <acoral_intr_sys_init+0x90>
		HAL_TRANSLATE_VECTOR(i,index);
30003cc4:	e59d3000 	ldr	r3, [sp]
30003cc8:	e58d3004 	str	r3, [sp, #4]
		intr_table[index].isr=acoral_default_isr;
30003ccc:	e59d2004 	ldr	r2, [sp, #4]
30003cd0:	e59f0074 	ldr	r0, [pc, #116]	; 30003d4c <acoral_intr_sys_init+0xa8>
30003cd4:	e3a01008 	mov	r1, #8
30003cd8:	e1a03002 	mov	r3, r2
30003cdc:	e1a03183 	lsl	r3, r3, #3
30003ce0:	e0623003 	rsb	r3, r2, r3
30003ce4:	e1a03103 	lsl	r3, r3, #2
30003ce8:	e0833000 	add	r3, r3, r0
30003cec:	e0833001 	add	r3, r3, r1
30003cf0:	e59f2058 	ldr	r2, [pc, #88]	; 30003d50 <acoral_intr_sys_init+0xac>
30003cf4:	e5832000 	str	r2, [r3]
		intr_table[index].type=ACORAL_COMM_INTR;
30003cf8:	e59d2004 	ldr	r2, [sp, #4]
30003cfc:	e59f1048 	ldr	r1, [pc, #72]	; 30003d4c <acoral_intr_sys_init+0xa8>
30003d00:	e1a03002 	mov	r3, r2
30003d04:	e1a03183 	lsl	r3, r3, #3
30003d08:	e0623003 	rsb	r3, r2, r3
30003d0c:	e1a03103 	lsl	r3, r3, #2
30003d10:	e0833001 	add	r3, r3, r1
30003d14:	e3a02001 	mov	r2, #1
30003d18:	e5c32005 	strb	r2, [r3, #5]
		acoral_intr_mask(i);
30003d1c:	e59d3000 	ldr	r3, [sp]
30003d20:	e1a00003 	mov	r0, r3
30003d24:	eb000078 	bl	30003f0c <acoral_intr_mask>
    /*中断底层初始化函数*/
	HAL_INTR_INIT();


    /*对于每个中断，设置默认的服务处理程序，然后屏蔽该中断*/
	for(i=HAL_INTR_MIN;i<=HAL_INTR_MAX;i++){
30003d28:	e59d3000 	ldr	r3, [sp]
30003d2c:	e2833001 	add	r3, r3, #1
30003d30:	e58d3000 	str	r3, [sp]
30003d34:	e59d3000 	ldr	r3, [sp]
30003d38:	e3530031 	cmp	r3, #49	; 0x31
30003d3c:	9affffe0 	bls	30003cc4 <acoral_intr_sys_init+0x20>
		HAL_TRANSLATE_VECTOR(i,index);
		intr_table[index].isr=acoral_default_isr;
		intr_table[index].type=ACORAL_COMM_INTR;
		acoral_intr_mask(i);
	}
}
30003d40:	e28dd00c 	add	sp, sp, #12
30003d44:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003d48:	e12fff1e 	bx	lr
30003d4c:	3000f3e8 	.word	0x3000f3e8
30003d50:	3000419c 	.word	0x3000419c

30003d54 <acoral_intr_attach>:

/*===========================                                                                                                                 
*Binding the isr t0 the Vector      
*将服务函数isr绑定到中断向量Vector
*===========================*/
acoral_32 acoral_intr_attach(acoral_vector vector,void (*isr)(acoral_vector)){
30003d54:	e24dd010 	sub	sp, sp, #16
30003d58:	e58d0004 	str	r0, [sp, #4]
30003d5c:	e58d1000 	str	r1, [sp]
  	acoral_vector index;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003d60:	e59d3004 	ldr	r3, [sp, #4]
30003d64:	e58d300c 	str	r3, [sp, #12]
	if(intr_table[index].type!=ACORAL_RT_INTR)
30003d68:	e59d200c 	ldr	r2, [sp, #12]
30003d6c:	e59f1058 	ldr	r1, [pc, #88]	; 30003dcc <acoral_intr_attach+0x78>
30003d70:	e1a03002 	mov	r3, r2
30003d74:	e1a03183 	lsl	r3, r3, #3
30003d78:	e0623003 	rsb	r3, r2, r3
30003d7c:	e1a03103 	lsl	r3, r3, #2
30003d80:	e0833001 	add	r3, r3, r1
30003d84:	e5d33005 	ldrb	r3, [r3, #5]
30003d88:	e3530003 	cmp	r3, #3
30003d8c:	0a00000a 	beq	30003dbc <acoral_intr_attach+0x68>
		intr_table[index].isr =isr;
30003d90:	e59d200c 	ldr	r2, [sp, #12]
30003d94:	e59f0030 	ldr	r0, [pc, #48]	; 30003dcc <acoral_intr_attach+0x78>
30003d98:	e3a01008 	mov	r1, #8
30003d9c:	e1a03002 	mov	r3, r2
30003da0:	e1a03183 	lsl	r3, r3, #3
30003da4:	e0623003 	rsb	r3, r2, r3
30003da8:	e1a03103 	lsl	r3, r3, #2
30003dac:	e0833000 	add	r3, r3, r0
30003db0:	e0833001 	add	r3, r3, r1
30003db4:	e59d2000 	ldr	r2, [sp]
30003db8:	e5832000 	str	r2, [r3]
	else
		HAL_INTR_ATTACH(vector,isr);
	return 0;
30003dbc:	e3a03000 	mov	r3, #0
}
30003dc0:	e1a00003 	mov	r0, r3
30003dc4:	e28dd010 	add	sp, sp, #16
30003dc8:	e12fff1e 	bx	lr
30003dcc:	3000f3e8 	.word	0x3000f3e8

30003dd0 <acoral_intr_detach>:

/*===========================                                                                                                                 
*Detach the  isr from the Vector      
*将中断的服务函数设为默认的
*===========================*/
acoral_32 acoral_intr_detach(acoral_vector vector){
30003dd0:	e24dd010 	sub	sp, sp, #16
30003dd4:	e58d0004 	str	r0, [sp, #4]
  	acoral_vector index;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003dd8:	e59d3004 	ldr	r3, [sp, #4]
30003ddc:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].isr =acoral_default_isr;
30003de0:	e59d200c 	ldr	r2, [sp, #12]
30003de4:	e59f0030 	ldr	r0, [pc, #48]	; 30003e1c <acoral_intr_detach+0x4c>
30003de8:	e3a01008 	mov	r1, #8
30003dec:	e1a03002 	mov	r3, r2
30003df0:	e1a03183 	lsl	r3, r3, #3
30003df4:	e0623003 	rsb	r3, r2, r3
30003df8:	e1a03103 	lsl	r3, r3, #2
30003dfc:	e0833000 	add	r3, r3, r0
30003e00:	e0833001 	add	r3, r3, r1
30003e04:	e59f2014 	ldr	r2, [pc, #20]	; 30003e20 <acoral_intr_detach+0x50>
30003e08:	e5832000 	str	r2, [r3]
	return 0;
30003e0c:	e3a03000 	mov	r3, #0
}
30003e10:	e1a00003 	mov	r0, r3
30003e14:	e28dd010 	add	sp, sp, #16
30003e18:	e12fff1e 	bx	lr
30003e1c:	3000f3e8 	.word	0x3000f3e8
30003e20:	3000419c 	.word	0x3000419c

30003e24 <acoral_intr_unmask>:

/*===========================                                                                                                                 
*Enable the interrupt      
*使能中断
*===========================*/
void acoral_intr_unmask(acoral_vector vector){
30003e24:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003e28:	e24dd014 	sub	sp, sp, #20
30003e2c:	e58d0004 	str	r0, [sp, #4]
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
30003e30:	e59d3004 	ldr	r3, [sp, #4]
30003e34:	e3530031 	cmp	r3, #49	; 0x31
30003e38:	ca00002e 	bgt	30003ef8 <acoral_intr_unmask+0xd4>
		return;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003e3c:	e59d3004 	ldr	r3, [sp, #4]
30003e40:	e58d300c 	str	r3, [sp, #12]

        /*如果中断的使能函数不为空，就调用该使能函数*/
	if(intr_table[index].unmask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
30003e44:	e59d200c 	ldr	r2, [sp, #12]
30003e48:	e59f00b8 	ldr	r0, [pc, #184]	; 30003f08 <acoral_intr_unmask+0xe4>
30003e4c:	e3a01018 	mov	r1, #24
30003e50:	e1a03002 	mov	r3, r2
30003e54:	e1a03183 	lsl	r3, r3, #3
30003e58:	e0623003 	rsb	r3, r2, r3
30003e5c:	e1a03103 	lsl	r3, r3, #2
30003e60:	e0833000 	add	r3, r3, r0
30003e64:	e0833001 	add	r3, r3, r1
30003e68:	e5933000 	ldr	r3, [r3]
30003e6c:	e3530000 	cmp	r3, #0
30003e70:	0a000021 	beq	30003efc <acoral_intr_unmask+0xd8>
30003e74:	e59d200c 	ldr	r2, [sp, #12]
30003e78:	e59f1088 	ldr	r1, [pc, #136]	; 30003f08 <acoral_intr_unmask+0xe4>
30003e7c:	e1a03002 	mov	r3, r2
30003e80:	e1a03183 	lsl	r3, r3, #3
30003e84:	e0623003 	rsb	r3, r2, r3
30003e88:	e1a03103 	lsl	r3, r3, #2
30003e8c:	e0833001 	add	r3, r3, r1
30003e90:	e5d33005 	ldrb	r3, [r3, #5]
30003e94:	e3530001 	cmp	r3, #1
30003e98:	1a000017 	bne	30003efc <acoral_intr_unmask+0xd8>
		intr_table[index].unmask(vector);
30003e9c:	e59d200c 	ldr	r2, [sp, #12]
30003ea0:	e59f0060 	ldr	r0, [pc, #96]	; 30003f08 <acoral_intr_unmask+0xe4>
30003ea4:	e3a01018 	mov	r1, #24
30003ea8:	e1a03002 	mov	r3, r2
30003eac:	e1a03183 	lsl	r3, r3, #3
30003eb0:	e0623003 	rsb	r3, r2, r3
30003eb4:	e1a03103 	lsl	r3, r3, #2
30003eb8:	e0833000 	add	r3, r3, r0
30003ebc:	e0833001 	add	r3, r3, r1
30003ec0:	e5933000 	ldr	r3, [r3]
30003ec4:	e59d0004 	ldr	r0, [sp, #4]
30003ec8:	e1a0e00f 	mov	lr, pc
30003ecc:	e12fff13 	bx	r3
		/*将中断状态设为真*/
		intr_table[index].state=true;
30003ed0:	e59d200c 	ldr	r2, [sp, #12]
30003ed4:	e59f102c 	ldr	r1, [pc, #44]	; 30003f08 <acoral_intr_unmask+0xe4>
30003ed8:	e1a03002 	mov	r3, r2
30003edc:	e1a03183 	lsl	r3, r3, #3
30003ee0:	e0623003 	rsb	r3, r2, r3
30003ee4:	e1a03103 	lsl	r3, r3, #2
30003ee8:	e0833001 	add	r3, r3, r1
30003eec:	e3a02001 	mov	r2, #1
30003ef0:	e5c32004 	strb	r2, [r3, #4]
30003ef4:	ea000000 	b	30003efc <acoral_intr_unmask+0xd8>
*使能中断
*===========================*/
void acoral_intr_unmask(acoral_vector vector){
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
		return;
30003ef8:	e1a00000 	nop			; (mov r0, r0)
	if(intr_table[index].unmask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
		intr_table[index].unmask(vector);
		/*将中断状态设为真*/
		intr_table[index].state=true;
	}
}
30003efc:	e28dd014 	add	sp, sp, #20
30003f00:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003f04:	e12fff1e 	bx	lr
30003f08:	3000f3e8 	.word	0x3000f3e8

30003f0c <acoral_intr_mask>:

/*===========================                                                                                                                 
*Disable the interrupt       
*除能中断
*===========================*/
void acoral_intr_mask(acoral_vector vector){
30003f0c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003f10:	e24dd014 	sub	sp, sp, #20
30003f14:	e58d0004 	str	r0, [sp, #4]
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
30003f18:	e59d3004 	ldr	r3, [sp, #4]
30003f1c:	e3530031 	cmp	r3, #49	; 0x31
30003f20:	ca00002e 	bgt	30003fe0 <acoral_intr_mask+0xd4>
		return;
   	HAL_TRANSLATE_VECTOR(vector,index);
30003f24:	e59d3004 	ldr	r3, [sp, #4]
30003f28:	e58d300c 	str	r3, [sp, #12]

        /*如果中断的除能函数不为空，就调用该除能函数 */
	if(intr_table[index].mask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
30003f2c:	e59d200c 	ldr	r2, [sp, #12]
30003f30:	e59f00b8 	ldr	r0, [pc, #184]	; 30003ff0 <acoral_intr_mask+0xe4>
30003f34:	e3a01014 	mov	r1, #20
30003f38:	e1a03002 	mov	r3, r2
30003f3c:	e1a03183 	lsl	r3, r3, #3
30003f40:	e0623003 	rsb	r3, r2, r3
30003f44:	e1a03103 	lsl	r3, r3, #2
30003f48:	e0833000 	add	r3, r3, r0
30003f4c:	e0833001 	add	r3, r3, r1
30003f50:	e5933000 	ldr	r3, [r3]
30003f54:	e3530000 	cmp	r3, #0
30003f58:	0a000021 	beq	30003fe4 <acoral_intr_mask+0xd8>
30003f5c:	e59d200c 	ldr	r2, [sp, #12]
30003f60:	e59f1088 	ldr	r1, [pc, #136]	; 30003ff0 <acoral_intr_mask+0xe4>
30003f64:	e1a03002 	mov	r3, r2
30003f68:	e1a03183 	lsl	r3, r3, #3
30003f6c:	e0623003 	rsb	r3, r2, r3
30003f70:	e1a03103 	lsl	r3, r3, #2
30003f74:	e0833001 	add	r3, r3, r1
30003f78:	e5d33005 	ldrb	r3, [r3, #5]
30003f7c:	e3530001 	cmp	r3, #1
30003f80:	1a000017 	bne	30003fe4 <acoral_intr_mask+0xd8>
		intr_table[index].mask(vector);
30003f84:	e59d200c 	ldr	r2, [sp, #12]
30003f88:	e59f0060 	ldr	r0, [pc, #96]	; 30003ff0 <acoral_intr_mask+0xe4>
30003f8c:	e3a01014 	mov	r1, #20
30003f90:	e1a03002 	mov	r3, r2
30003f94:	e1a03183 	lsl	r3, r3, #3
30003f98:	e0623003 	rsb	r3, r2, r3
30003f9c:	e1a03103 	lsl	r3, r3, #2
30003fa0:	e0833000 	add	r3, r3, r0
30003fa4:	e0833001 	add	r3, r3, r1
30003fa8:	e5933000 	ldr	r3, [r3]
30003fac:	e59d0004 	ldr	r0, [sp, #4]
30003fb0:	e1a0e00f 	mov	lr, pc
30003fb4:	e12fff13 	bx	r3
		/*将中断状态设为假    */
		intr_table[index].state=false;
30003fb8:	e59d200c 	ldr	r2, [sp, #12]
30003fbc:	e59f102c 	ldr	r1, [pc, #44]	; 30003ff0 <acoral_intr_mask+0xe4>
30003fc0:	e1a03002 	mov	r3, r2
30003fc4:	e1a03183 	lsl	r3, r3, #3
30003fc8:	e0623003 	rsb	r3, r2, r3
30003fcc:	e1a03103 	lsl	r3, r3, #2
30003fd0:	e0833001 	add	r3, r3, r1
30003fd4:	e3a02000 	mov	r2, #0
30003fd8:	e5c32004 	strb	r2, [r3, #4]
30003fdc:	ea000000 	b	30003fe4 <acoral_intr_mask+0xd8>
*除能中断
*===========================*/
void acoral_intr_mask(acoral_vector vector){
  	acoral_vector index;
	if(vector>HAL_INTR_MAX)
		return;
30003fe0:	e1a00000 	nop			; (mov r0, r0)
	if(intr_table[index].mask!=NULL&&intr_table[index].type==ACORAL_COMM_INTR){
		intr_table[index].mask(vector);
		/*将中断状态设为假    */
		intr_table[index].state=false;
	}
}
30003fe4:	e28dd014 	add	sp, sp, #20
30003fe8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30003fec:	e12fff1e 	bx	lr
30003ff0:	3000f3e8 	.word	0x3000f3e8

30003ff4 <acoral_intr_entry>:

/*===========================                                                                                                                 
*the commen isr of vector      
*中断公共服务入口函数
*===========================*/
void acoral_intr_entry(acoral_vector vector){
30003ff4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30003ff8:	e24dd014 	sub	sp, sp, #20
30003ffc:	e58d0004 	str	r0, [sp, #4]
	acoral_vector index;
#ifdef CFG_DEBUG
  	acoral_print("isr in cpu:%d\n",acoral_current_cpu);
#endif
   	HAL_TRANSLATE_VECTOR(vector,index);
30004000:	e59d3004 	ldr	r3, [sp, #4]
30004004:	e58d300c 	str	r3, [sp, #12]
	acoral_intr_nesting_inc();
30004008:	ebfff5ea 	bl	300017b8 <hal_intr_nesting_inc_comm>
	if(intr_table[index].type==ACORAL_EXPERT_INTR){
3000400c:	e59d200c 	ldr	r2, [sp, #12]
30004010:	e59f1180 	ldr	r1, [pc, #384]	; 30004198 <acoral_intr_entry+0x1a4>
30004014:	e1a03002 	mov	r3, r2
30004018:	e1a03183 	lsl	r3, r3, #3
3000401c:	e0623003 	rsb	r3, r2, r3
30004020:	e1a03103 	lsl	r3, r3, #2
30004024:	e0833001 	add	r3, r3, r1
30004028:	e5d33005 	ldrb	r3, [r3, #5]
3000402c:	e3530002 	cmp	r3, #2
30004030:	1a00000e 	bne	30004070 <acoral_intr_entry+0x7c>
		intr_table[index].isr(vector);
30004034:	e59d200c 	ldr	r2, [sp, #12]
30004038:	e59f0158 	ldr	r0, [pc, #344]	; 30004198 <acoral_intr_entry+0x1a4>
3000403c:	e3a01008 	mov	r1, #8
30004040:	e1a03002 	mov	r3, r2
30004044:	e1a03183 	lsl	r3, r3, #3
30004048:	e0623003 	rsb	r3, r2, r3
3000404c:	e1a03103 	lsl	r3, r3, #2
30004050:	e0833000 	add	r3, r3, r0
30004054:	e0833001 	add	r3, r3, r1
30004058:	e5933000 	ldr	r3, [r3]
3000405c:	e59d0004 	ldr	r0, [sp, #4]
30004060:	e1a0e00f 	mov	lr, pc
30004064:	e12fff13 	bx	r3
		acoral_intr_disable();
30004068:	ebfff59a 	bl	300016d8 <HAL_INTR_DISABLE>
3000406c:	ea000044 	b	30004184 <acoral_intr_entry+0x190>
	}else{
		/*这个之前都要是关中断的，调用中断进入函数*/
		if(intr_table[index].enter!=NULL)
30004070:	e59d200c 	ldr	r2, [sp, #12]
30004074:	e59f011c 	ldr	r0, [pc, #284]	; 30004198 <acoral_intr_entry+0x1a4>
30004078:	e3a0100c 	mov	r1, #12
3000407c:	e1a03002 	mov	r3, r2
30004080:	e1a03183 	lsl	r3, r3, #3
30004084:	e0623003 	rsb	r3, r2, r3
30004088:	e1a03103 	lsl	r3, r3, #2
3000408c:	e0833000 	add	r3, r3, r0
30004090:	e0833001 	add	r3, r3, r1
30004094:	e5933000 	ldr	r3, [r3]
30004098:	e3530000 	cmp	r3, #0
3000409c:	0a00000c 	beq	300040d4 <acoral_intr_entry+0xe0>
			intr_table[index].enter(vector);
300040a0:	e59d200c 	ldr	r2, [sp, #12]
300040a4:	e59f00ec 	ldr	r0, [pc, #236]	; 30004198 <acoral_intr_entry+0x1a4>
300040a8:	e3a0100c 	mov	r1, #12
300040ac:	e1a03002 	mov	r3, r2
300040b0:	e1a03183 	lsl	r3, r3, #3
300040b4:	e0623003 	rsb	r3, r2, r3
300040b8:	e1a03103 	lsl	r3, r3, #2
300040bc:	e0833000 	add	r3, r3, r0
300040c0:	e0833001 	add	r3, r3, r1
300040c4:	e5933000 	ldr	r3, [r3]
300040c8:	e59d0004 	ldr	r0, [sp, #4]
300040cc:	e1a0e00f 	mov	lr, pc
300040d0:	e12fff13 	bx	r3
	
		acoral_intr_mask(vector);	
300040d4:	e59d0004 	ldr	r0, [sp, #4]
300040d8:	ebffff8b 	bl	30003f0c <acoral_intr_mask>
		/*开中断*/
		acoral_intr_enable();
300040dc:	ebfff579 	bl	300016c8 <HAL_INTR_ENABLE>

		/*调用该中断的服务处理函数*/
		intr_table[index].isr(vector);
300040e0:	e59d200c 	ldr	r2, [sp, #12]
300040e4:	e59f00ac 	ldr	r0, [pc, #172]	; 30004198 <acoral_intr_entry+0x1a4>
300040e8:	e3a01008 	mov	r1, #8
300040ec:	e1a03002 	mov	r3, r2
300040f0:	e1a03183 	lsl	r3, r3, #3
300040f4:	e0623003 	rsb	r3, r2, r3
300040f8:	e1a03103 	lsl	r3, r3, #2
300040fc:	e0833000 	add	r3, r3, r0
30004100:	e0833001 	add	r3, r3, r1
30004104:	e5933000 	ldr	r3, [r3]
30004108:	e59d0004 	ldr	r0, [sp, #4]
3000410c:	e1a0e00f 	mov	lr, pc
30004110:	e12fff13 	bx	r3
	
		/*关中断*/
		acoral_intr_disable();
30004114:	ebfff56f 	bl	300016d8 <HAL_INTR_DISABLE>
	
		acoral_intr_unmask(vector);	
30004118:	e59d0004 	ldr	r0, [sp, #4]
3000411c:	ebffff40 	bl	30003e24 <acoral_intr_unmask>
		/*调用中断退出函数*/
		if(intr_table[index].exit!=NULL)
30004120:	e59d200c 	ldr	r2, [sp, #12]
30004124:	e59f006c 	ldr	r0, [pc, #108]	; 30004198 <acoral_intr_entry+0x1a4>
30004128:	e3a01010 	mov	r1, #16
3000412c:	e1a03002 	mov	r3, r2
30004130:	e1a03183 	lsl	r3, r3, #3
30004134:	e0623003 	rsb	r3, r2, r3
30004138:	e1a03103 	lsl	r3, r3, #2
3000413c:	e0833000 	add	r3, r3, r0
30004140:	e0833001 	add	r3, r3, r1
30004144:	e5933000 	ldr	r3, [r3]
30004148:	e3530000 	cmp	r3, #0
3000414c:	0a00000c 	beq	30004184 <acoral_intr_entry+0x190>
			intr_table[index].exit(vector);
30004150:	e59d200c 	ldr	r2, [sp, #12]
30004154:	e59f003c 	ldr	r0, [pc, #60]	; 30004198 <acoral_intr_entry+0x1a4>
30004158:	e3a01010 	mov	r1, #16
3000415c:	e1a03002 	mov	r3, r2
30004160:	e1a03183 	lsl	r3, r3, #3
30004164:	e0623003 	rsb	r3, r2, r3
30004168:	e1a03103 	lsl	r3, r3, #2
3000416c:	e0833000 	add	r3, r3, r0
30004170:	e0833001 	add	r3, r3, r1
30004174:	e5933000 	ldr	r3, [r3]
30004178:	e59d0004 	ldr	r0, [sp, #4]
3000417c:	e1a0e00f 	mov	lr, pc
30004180:	e12fff13 	bx	r3
	}
	acoral_intr_nesting_dec();
30004184:	ebfff57a 	bl	30001774 <hal_intr_nesting_dec_comm>
	acoral_intr_exit();
30004188:	eb000007 	bl	300041ac <acoral_intr_exit>
}
3000418c:	e28dd014 	add	sp, sp, #20
30004190:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004194:	e12fff1e 	bx	lr
30004198:	3000f3e8 	.word	0x3000f3e8

3000419c <acoral_default_isr>:

/*===========================                                                                                                                 
*The default isr      
*默认中断处理程序
*===========================*/
void acoral_default_isr(acoral_vector vector){
3000419c:	e24dd008 	sub	sp, sp, #8
300041a0:	e58d0004 	str	r0, [sp, #4]
  	acoral_printdbg("in Default interrupt route\n");
}
300041a4:	e28dd008 	add	sp, sp, #8
300041a8:	e12fff1e 	bx	lr

300041ac <acoral_intr_exit>:

/*===========================                                                                                                                 
*The exit function of the vector      
*中断退出函数
*===========================*/
void acoral_intr_exit(){
300041ac:	e92d4008 	push	{r3, lr}
      	if(!acoral_need_sched)
300041b0:	e59f3064 	ldr	r3, [pc, #100]	; 3000421c <acoral_intr_exit+0x70>
300041b4:	e5d33000 	ldrb	r3, [r3]
300041b8:	e3530000 	cmp	r3, #0
300041bc:	0a00000d 	beq	300041f8 <acoral_intr_exit+0x4c>
	    return;

	if(acoral_intr_nesting)
300041c0:	ebfff566 	bl	30001760 <hal_get_intr_nesting_comm>
300041c4:	e1a03000 	mov	r3, r0
300041c8:	e3530000 	cmp	r3, #0
300041cc:	1a00000b 	bne	30004200 <acoral_intr_exit+0x54>
	    return;

	if(acoral_sched_is_lock)
300041d0:	e59f3048 	ldr	r3, [pc, #72]	; 30004220 <acoral_intr_exit+0x74>
300041d4:	e5d33000 	ldrb	r3, [r3]
300041d8:	e3530000 	cmp	r3, #0
300041dc:	1a000009 	bne	30004208 <acoral_intr_exit+0x5c>
	    return;

	if (!acoral_start_sched)
300041e0:	e59f303c 	ldr	r3, [pc, #60]	; 30004224 <acoral_intr_exit+0x78>
300041e4:	e5933000 	ldr	r3, [r3]
300041e8:	e3530000 	cmp	r3, #0
300041ec:	0a000007 	beq	30004210 <acoral_intr_exit+0x64>
	    return;
      
      /*如果需要调度，则调用此函数*/
	HAL_INTR_EXIT_BRIDGE();
300041f0:	ebfff582 	bl	30001800 <hal_intr_exit_bridge_comm>
300041f4:	ea000006 	b	30004214 <acoral_intr_exit+0x68>
*The exit function of the vector      
*中断退出函数
*===========================*/
void acoral_intr_exit(){
      	if(!acoral_need_sched)
	    return;
300041f8:	e1a00000 	nop			; (mov r0, r0)
300041fc:	ea000004 	b	30004214 <acoral_intr_exit+0x68>

	if(acoral_intr_nesting)
	    return;
30004200:	e1a00000 	nop			; (mov r0, r0)
30004204:	ea000002 	b	30004214 <acoral_intr_exit+0x68>

	if(acoral_sched_is_lock)
	    return;
30004208:	e1a00000 	nop			; (mov r0, r0)
3000420c:	ea000000 	b	30004214 <acoral_intr_exit+0x68>

	if (!acoral_start_sched)
	    return;
30004210:	e1a00000 	nop			; (mov r0, r0)
      
      /*如果需要调度，则调用此函数*/
	HAL_INTR_EXIT_BRIDGE();
}
30004214:	e8bd4008 	pop	{r3, lr}
30004218:	e12fff1e 	bx	lr
3000421c:	300103fc 	.word	0x300103fc
30004220:	3000f3e4 	.word	0x3000f3e4
30004224:	3000eadc 	.word	0x3000eadc

30004228 <acoral_set_intr_enter>:

/*===========================                                                                                                                 
*Set the enter function of the vector      
*设置中断进入函数为isr
*===========================*/
void acoral_set_intr_enter(acoral_vector vector,void (*enter)(acoral_vector)){
30004228:	e24dd010 	sub	sp, sp, #16
3000422c:	e58d0004 	str	r0, [sp, #4]
30004230:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
30004234:	e59d3004 	ldr	r3, [sp, #4]
30004238:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].enter=enter;
3000423c:	e59d200c 	ldr	r2, [sp, #12]
30004240:	e59f0028 	ldr	r0, [pc, #40]	; 30004270 <acoral_set_intr_enter+0x48>
30004244:	e3a0100c 	mov	r1, #12
30004248:	e1a03002 	mov	r3, r2
3000424c:	e1a03183 	lsl	r3, r3, #3
30004250:	e0623003 	rsb	r3, r2, r3
30004254:	e1a03103 	lsl	r3, r3, #2
30004258:	e0833000 	add	r3, r3, r0
3000425c:	e0833001 	add	r3, r3, r1
30004260:	e59d2000 	ldr	r2, [sp]
30004264:	e5832000 	str	r2, [r3]
}
30004268:	e28dd010 	add	sp, sp, #16
3000426c:	e12fff1e 	bx	lr
30004270:	3000f3e8 	.word	0x3000f3e8

30004274 <acoral_set_intr_exit>:

/*===========================                                                                                                                 
*Set the exit  function of the vector 
*设置中断退出函数为isr
*===========================*/
void acoral_set_intr_exit(acoral_vector vector,void (*exit)(acoral_vector)){
30004274:	e24dd010 	sub	sp, sp, #16
30004278:	e58d0004 	str	r0, [sp, #4]
3000427c:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
30004280:	e59d3004 	ldr	r3, [sp, #4]
30004284:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].exit=exit;
30004288:	e59d200c 	ldr	r2, [sp, #12]
3000428c:	e59f0028 	ldr	r0, [pc, #40]	; 300042bc <acoral_set_intr_exit+0x48>
30004290:	e3a01010 	mov	r1, #16
30004294:	e1a03002 	mov	r3, r2
30004298:	e1a03183 	lsl	r3, r3, #3
3000429c:	e0623003 	rsb	r3, r2, r3
300042a0:	e1a03103 	lsl	r3, r3, #2
300042a4:	e0833000 	add	r3, r3, r0
300042a8:	e0833001 	add	r3, r3, r1
300042ac:	e59d2000 	ldr	r2, [sp]
300042b0:	e5832000 	str	r2, [r3]
}
300042b4:	e28dd010 	add	sp, sp, #16
300042b8:	e12fff1e 	bx	lr
300042bc:	3000f3e8 	.word	0x3000f3e8

300042c0 <acoral_set_intr_mask>:

/*===========================                                                                                                                 
*Set the mask  function of the vector 
*设置中断屏蔽函数为isr
*===========================*/
void acoral_set_intr_mask(acoral_vector vector,void (*mask)(acoral_vector)){
300042c0:	e24dd010 	sub	sp, sp, #16
300042c4:	e58d0004 	str	r0, [sp, #4]
300042c8:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
300042cc:	e59d3004 	ldr	r3, [sp, #4]
300042d0:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].mask=mask;
300042d4:	e59d200c 	ldr	r2, [sp, #12]
300042d8:	e59f0028 	ldr	r0, [pc, #40]	; 30004308 <acoral_set_intr_mask+0x48>
300042dc:	e3a01014 	mov	r1, #20
300042e0:	e1a03002 	mov	r3, r2
300042e4:	e1a03183 	lsl	r3, r3, #3
300042e8:	e0623003 	rsb	r3, r2, r3
300042ec:	e1a03103 	lsl	r3, r3, #2
300042f0:	e0833000 	add	r3, r3, r0
300042f4:	e0833001 	add	r3, r3, r1
300042f8:	e59d2000 	ldr	r2, [sp]
300042fc:	e5832000 	str	r2, [r3]
}
30004300:	e28dd010 	add	sp, sp, #16
30004304:	e12fff1e 	bx	lr
30004308:	3000f3e8 	.word	0x3000f3e8

3000430c <acoral_set_intr_unmask>:

/*===========================                                                                                                                 
*Set the unmask function of the vector 
*设置中断使能函数为isr
*===========================*/
void acoral_set_intr_unmask(acoral_vector vector,void (*unmask)(acoral_vector)){
3000430c:	e24dd010 	sub	sp, sp, #16
30004310:	e58d0004 	str	r0, [sp, #4]
30004314:	e58d1000 	str	r1, [sp]
	acoral_vector index;
	HAL_TRANSLATE_VECTOR(vector,index);
30004318:	e59d3004 	ldr	r3, [sp, #4]
3000431c:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].unmask=unmask;
30004320:	e59d200c 	ldr	r2, [sp, #12]
30004324:	e59f0028 	ldr	r0, [pc, #40]	; 30004354 <acoral_set_intr_unmask+0x48>
30004328:	e3a01018 	mov	r1, #24
3000432c:	e1a03002 	mov	r3, r2
30004330:	e1a03183 	lsl	r3, r3, #3
30004334:	e0623003 	rsb	r3, r2, r3
30004338:	e1a03103 	lsl	r3, r3, #2
3000433c:	e0833000 	add	r3, r3, r0
30004340:	e0833001 	add	r3, r3, r1
30004344:	e59d2000 	ldr	r2, [sp]
30004348:	e5832000 	str	r2, [r3]
}
3000434c:	e28dd010 	add	sp, sp, #16
30004350:	e12fff1e 	bx	lr
30004354:	3000f3e8 	.word	0x3000f3e8

30004358 <acoral_intr_set_type>:

/*===========================                                                                                                                 
*Set interrupt type
*设置中断类型
*===========================*/
void acoral_intr_set_type(acoral_vector vector,acoral_u8 type){
30004358:	e24dd010 	sub	sp, sp, #16
3000435c:	e58d0004 	str	r0, [sp, #4]
30004360:	e1a03001 	mov	r3, r1
30004364:	e5cd3003 	strb	r3, [sp, #3]
  	acoral_vector index;
   	HAL_TRANSLATE_VECTOR(vector,index);
30004368:	e59d3004 	ldr	r3, [sp, #4]
3000436c:	e58d300c 	str	r3, [sp, #12]
	intr_table[index].type =type;
30004370:	e59d200c 	ldr	r2, [sp, #12]
30004374:	e59f1020 	ldr	r1, [pc, #32]	; 3000439c <acoral_intr_set_type+0x44>
30004378:	e1a03002 	mov	r3, r2
3000437c:	e1a03183 	lsl	r3, r3, #3
30004380:	e0623003 	rsb	r3, r2, r3
30004384:	e1a03103 	lsl	r3, r3, #2
30004388:	e0833001 	add	r3, r3, r1
3000438c:	e5dd2003 	ldrb	r2, [sp, #3]
30004390:	e5c32005 	strb	r2, [r3, #5]
}
30004394:	e28dd010 	add	sp, sp, #16
30004398:	e12fff1e 	bx	lr
3000439c:	3000f3e8 	.word	0x3000f3e8

300043a0 <acoral_fault_entry>:
/*===========================                                                                                                                 
*     exception err output
*        异常错误输出
*===========================*/

void acoral_fault_entry(acoral_u32 lr,acoral_u32 *stack){
300043a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300043a4:	e24dd00c 	sub	sp, sp, #12
300043a8:	e58d0004 	str	r0, [sp, #4]
300043ac:	e58d1000 	str	r1, [sp]
	acoral_intr_disable();
300043b0:	ebfff4c8 	bl	300016d8 <HAL_INTR_DISABLE>
	if(!acoral_start_sched)
300043b4:	e59f30c4 	ldr	r3, [pc, #196]	; 30004480 <acoral_fault_entry+0xe0>
300043b8:	e5933000 	ldr	r3, [r3]
300043bc:	e3530000 	cmp	r3, #0
300043c0:	1a000000 	bne	300043c8 <acoral_fault_entry+0x28>
		while(1);	
300043c4:	eafffffe 	b	300043c4 <acoral_fault_entry+0x24>
	acoral_printerr("Exception occur\n");
300043c8:	e59f00b4 	ldr	r0, [pc, #180]	; 30004484 <acoral_fault_entry+0xe4>
300043cc:	eb001b8d 	bl	3000b208 <acoral_print>
	acoral_printerr("******************\n");
300043d0:	e59f00b0 	ldr	r0, [pc, #176]	; 30004488 <acoral_fault_entry+0xe8>
300043d4:	eb001b8b 	bl	3000b208 <acoral_print>
	acoral_printerr("CPU:%d\n",acoral_current_cpu);;
300043d8:	e59f00ac 	ldr	r0, [pc, #172]	; 3000448c <acoral_fault_entry+0xec>
300043dc:	e3a01000 	mov	r1, #0
300043e0:	eb001b88 	bl	3000b208 <acoral_print>
	acoral_printerr("Thread name:%s\n",acoral_cur_thread->name);;
300043e4:	e59f30a4 	ldr	r3, [pc, #164]	; 30004490 <acoral_fault_entry+0xf0>
300043e8:	e5933000 	ldr	r3, [r3]
300043ec:	e5933048 	ldr	r3, [r3, #72]	; 0x48
300043f0:	e59f009c 	ldr	r0, [pc, #156]	; 30004494 <acoral_fault_entry+0xf4>
300043f4:	e1a01003 	mov	r1, r3
300043f8:	eb001b82 	bl	3000b208 <acoral_print>
	acoral_printerr("Thread prio:%d\n",acoral_cur_thread->prio);;
300043fc:	e59f308c 	ldr	r3, [pc, #140]	; 30004490 <acoral_fault_entry+0xf0>
30004400:	e5933000 	ldr	r3, [r3]
30004404:	e5d33005 	ldrb	r3, [r3, #5]
30004408:	e59f0088 	ldr	r0, [pc, #136]	; 30004498 <acoral_fault_entry+0xf8>
3000440c:	e1a01003 	mov	r1, r3
30004410:	eb001b7c 	bl	3000b208 <acoral_print>
	acoral_printerr("Thread stack_size:%d\n",acoral_cur_thread->stack_size);;
30004414:	e59f3074 	ldr	r3, [pc, #116]	; 30004490 <acoral_fault_entry+0xf0>
30004418:	e5933000 	ldr	r3, [r3]
3000441c:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
30004420:	e59f0074 	ldr	r0, [pc, #116]	; 3000449c <acoral_fault_entry+0xfc>
30004424:	e1a01003 	mov	r1, r3
30004428:	eb001b76 	bl	3000b208 <acoral_print>
	acoral_printerr("Thread stack_buttom:0x%x\n",acoral_cur_thread->stack_buttom);;
3000442c:	e59f305c 	ldr	r3, [pc, #92]	; 30004490 <acoral_fault_entry+0xf0>
30004430:	e5933000 	ldr	r3, [r3]
30004434:	e5933038 	ldr	r3, [r3, #56]	; 0x38
30004438:	e59f0060 	ldr	r0, [pc, #96]	; 300044a0 <acoral_fault_entry+0x100>
3000443c:	e1a01003 	mov	r1, r3
30004440:	eb001b70 	bl	3000b208 <acoral_print>
	acoral_printerr("Thread stack:0x%x\n",acoral_cur_thread->stack);;
30004444:	e59f3044 	ldr	r3, [pc, #68]	; 30004490 <acoral_fault_entry+0xf0>
30004448:	e5933000 	ldr	r3, [r3]
3000444c:	e5933034 	ldr	r3, [r3, #52]	; 0x34
30004450:	e59f004c 	ldr	r0, [pc, #76]	; 300044a4 <acoral_fault_entry+0x104>
30004454:	e1a01003 	mov	r1, r3
30004458:	eb001b6a 	bl	3000b208 <acoral_print>
	acoral_printerr("Pc:0x%x\n",lr);
3000445c:	e59f0044 	ldr	r0, [pc, #68]	; 300044a8 <acoral_fault_entry+0x108>
30004460:	e59d1004 	ldr	r1, [sp, #4]
30004464:	eb001b67 	bl	3000b208 <acoral_print>
	acoral_printerr("Stack:0x%x\n",stack);
30004468:	e59f003c 	ldr	r0, [pc, #60]	; 300044ac <acoral_fault_entry+0x10c>
3000446c:	e59d1000 	ldr	r1, [sp]
30004470:	eb001b64 	bl	3000b208 <acoral_print>
	acoral_printerr("******************\n");
30004474:	e59f000c 	ldr	r0, [pc, #12]	; 30004488 <acoral_fault_entry+0xe8>
30004478:	eb001b62 	bl	3000b208 <acoral_print>
	while(1);
3000447c:	eafffffe 	b	3000447c <acoral_fault_entry+0xdc>
30004480:	3000eadc 	.word	0x3000eadc
30004484:	3000e2d0 	.word	0x3000e2d0
30004488:	3000e2e4 	.word	0x3000e2e4
3000448c:	3000e2f8 	.word	0x3000e2f8
30004490:	300103f8 	.word	0x300103f8
30004494:	3000e300 	.word	0x3000e300
30004498:	3000e310 	.word	0x3000e310
3000449c:	3000e320 	.word	0x3000e320
300044a0:	3000e338 	.word	0x3000e338
300044a4:	3000e354 	.word	0x3000e354
300044a8:	3000e368 	.word	0x3000e368
300044ac:	3000e374 	.word	0x3000e374

300044b0 <acoral_time_sys_init>:
/*  pegasus   0719*/
/*----------------*/
acoral_queue_t timeout_queue;
static acoral_u32 ticks;
void acoral_time_sys_init(){
  	acoral_init_list(&time_delay_queue.head);
300044b0:	e59f302c 	ldr	r3, [pc, #44]	; 300044e4 <acoral_time_sys_init+0x34>
300044b4:	e59f2028 	ldr	r2, [pc, #40]	; 300044e4 <acoral_time_sys_init+0x34>
300044b8:	e5832000 	str	r2, [r3]
300044bc:	e59f3020 	ldr	r3, [pc, #32]	; 300044e4 <acoral_time_sys_init+0x34>
300044c0:	e59f201c 	ldr	r2, [pc, #28]	; 300044e4 <acoral_time_sys_init+0x34>
300044c4:	e5832004 	str	r2, [r3, #4]

	/*---------------*/
	/*  新增延时初始化 timeout_queue*/
	/*  pegasus   0719*/
	/*---------------*/
	acoral_init_list(&timeout_queue.head);
300044c8:	e59f3018 	ldr	r3, [pc, #24]	; 300044e8 <acoral_time_sys_init+0x38>
300044cc:	e59f2014 	ldr	r2, [pc, #20]	; 300044e8 <acoral_time_sys_init+0x38>
300044d0:	e5832000 	str	r2, [r3]
300044d4:	e59f300c 	ldr	r3, [pc, #12]	; 300044e8 <acoral_time_sys_init+0x38>
300044d8:	e59f2008 	ldr	r2, [pc, #8]	; 300044e8 <acoral_time_sys_init+0x38>
300044dc:	e5832004 	str	r2, [r3, #4]
	acoral_spin_init(&timeout_queue.head.lock);
}
300044e0:	e12fff1e 	bx	lr
300044e4:	30010368 	.word	0x30010368
300044e8:	300103e4 	.word	0x300103e4

300044ec <acoral_get_ticks>:


acoral_time acoral_get_ticks(){
	return ticks;
300044ec:	e59f3008 	ldr	r3, [pc, #8]	; 300044fc <acoral_get_ticks+0x10>
300044f0:	e5933000 	ldr	r3, [r3]
}
300044f4:	e1a00003 	mov	r0, r3
300044f8:	e12fff1e 	bx	lr
300044fc:	3000ee44 	.word	0x3000ee44

30004500 <acoral_set_ticks>:

void acoral_set_ticks(acoral_time time){
30004500:	e24dd008 	sub	sp, sp, #8
30004504:	e58d0004 	str	r0, [sp, #4]
  	ticks=time;
30004508:	e59f300c 	ldr	r3, [pc, #12]	; 3000451c <acoral_set_ticks+0x1c>
3000450c:	e59d2004 	ldr	r2, [sp, #4]
30004510:	e5832000 	str	r2, [r3]
}
30004514:	e28dd008 	add	sp, sp, #8
30004518:	e12fff1e 	bx	lr
3000451c:	3000ee44 	.word	0x3000ee44

30004520 <acoral_ticks_init>:

void acoral_ticks_init(){
30004520:	e92d4008 	push	{r3, lr}
  	ticks=0;                                      /*初始化滴答时钟计数器*/
30004524:	e59f3024 	ldr	r3, [pc, #36]	; 30004550 <acoral_ticks_init+0x30>
30004528:	e3a02000 	mov	r2, #0
3000452c:	e5832000 	str	r2, [r3]
	acoral_intr_attach(HAL_TICKS_INTR,acoral_ticks_entry);/*这个用于注册ticks的处理函数*/
30004530:	e3a0001c 	mov	r0, #28
30004534:	e59f1018 	ldr	r1, [pc, #24]	; 30004554 <acoral_ticks_init+0x34>
30004538:	ebfffe05 	bl	30003d54 <acoral_intr_attach>
	HAL_TICKS_INIT();                            /*这个主要用于将用于ticks的时钟初始化*/
3000453c:	ebfff0c8 	bl	30000864 <hal_ticks_init>
	acoral_intr_unmask(HAL_TICKS_INTR);
30004540:	e3a0001c 	mov	r0, #28
30004544:	ebfffe36 	bl	30003e24 <acoral_intr_unmask>
	return;
}
30004548:	e8bd4008 	pop	{r3, lr}
3000454c:	e12fff1e 	bx	lr
30004550:	3000ee44 	.word	0x3000ee44
30004554:	30004558 	.word	0x30004558

30004558 <acoral_ticks_entry>:

void acoral_ticks_entry(acoral_vector vector){
30004558:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000455c:	e24dd00c 	sub	sp, sp, #12
30004560:	e58d0004 	str	r0, [sp, #4]
#ifdef CFG_HOOK_TICKS
	acoral_ticks_hook();
#endif
        ticks++;
30004564:	e59f3034 	ldr	r3, [pc, #52]	; 300045a0 <acoral_ticks_entry+0x48>
30004568:	e5933000 	ldr	r3, [r3]
3000456c:	e2832001 	add	r2, r3, #1
30004570:	e59f3028 	ldr	r3, [pc, #40]	; 300045a0 <acoral_ticks_entry+0x48>
30004574:	e5832000 	str	r2, [r3]
	acoral_printdbg("In ticks isr\n");
	if(acoral_start_sched==true){
30004578:	e59f3024 	ldr	r3, [pc, #36]	; 300045a4 <acoral_ticks_entry+0x4c>
3000457c:	e5933000 	ldr	r3, [r3]
30004580:	e3530001 	cmp	r3, #1
30004584:	1a000002 	bne	30004594 <acoral_ticks_entry+0x3c>
		time_delay_deal();
30004588:	eb000051 	bl	300046d4 <time_delay_deal>
		acoral_policy_delay_deal();
3000458c:	ebfff638 	bl	30001e74 <acoral_policy_delay_deal>
		/*--------------------*/
		/* 超时链表处理函数*/
		/* pegasus  0719*/
		/*--------------------*/
		timeout_delay_deal();
30004590:	eb0000ef 	bl	30004954 <timeout_delay_deal>
	}
}
30004594:	e28dd00c 	add	sp, sp, #12
30004598:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000459c:	e12fff1e 	bx	lr
300045a0:	3000ee44 	.word	0x3000ee44
300045a4:	3000eadc 	.word	0x3000eadc

300045a8 <acoral_delayqueue_add>:

/*================================
 * func: add thread to  time_delay_queue 
 *    将线程挂到延时队列上
 *================================*/
void acoral_delayqueue_add(acoral_queue_t *queue, acoral_thread_t *new){
300045a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300045ac:	e24dd02c 	sub	sp, sp, #44	; 0x2c
300045b0:	e58d0004 	str	r0, [sp, #4]
300045b4:	e58d1000 	str	r1, [sp]
	acoral_sr cpu_sr;
	acoral_list_t   *tmp, *tmp1,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
300045b8:	e59d3000 	ldr	r3, [sp]
300045bc:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300045c0:	e58d3024 	str	r3, [sp, #36]	; 0x24
	if(new->state&ACORAL_THREAD_STATE_DELAY){
		acoral_printerr("Still in delay but be waked,why?\n");
		return;
	}
#endif
	head=&queue->head;
300045c4:	e59d3004 	ldr	r3, [sp, #4]
300045c8:	e58d3018 	str	r3, [sp, #24]
	HAL_ENTER_CRITICAL();
300045cc:	ebfff448 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300045d0:	e1a03000 	mov	r3, r0
300045d4:	e58d300c 	str	r3, [sp, #12]
		/*获取下一个成员锁*/
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	new->state|=ACORAL_THREAD_STATE_DELAY;
300045d8:	e59d3000 	ldr	r3, [sp]
300045dc:	e5d33004 	ldrb	r3, [r3, #4]
300045e0:	e3833020 	orr	r3, r3, #32
300045e4:	e20320ff 	and	r2, r3, #255	; 0xff
300045e8:	e59d3000 	ldr	r3, [sp]
300045ec:	e5c32004 	strb	r2, [r3, #4]
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
300045f0:	e59d3018 	ldr	r3, [sp, #24]
300045f4:	e5933000 	ldr	r3, [r3]
300045f8:	e58d3010 	str	r3, [sp, #16]
300045fc:	ea00000d 	b	30004638 <acoral_delayqueue_add+0x90>
		thread = list_entry (tmp, acoral_thread_t, waiting);
30004600:	e59d3010 	ldr	r3, [sp, #16]
30004604:	e2433020 	sub	r3, r3, #32
30004608:	e58d301c 	str	r3, [sp, #28]
		delay  = delay-thread->delay;
3000460c:	e59d301c 	ldr	r3, [sp, #28]
30004610:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004614:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
30004618:	e0633002 	rsb	r3, r3, r2
3000461c:	e58d3024 	str	r3, [sp, #36]	; 0x24
		if (delay < 0)
30004620:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30004624:	e3530000 	cmp	r3, #0
30004628:	ba000009 	blt	30004654 <acoral_delayqueue_add+0xac>
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	new->state|=ACORAL_THREAD_STATE_DELAY;
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
3000462c:	e59d3010 	ldr	r3, [sp, #16]
30004630:	e5933000 	ldr	r3, [r3]
30004634:	e58d3010 	str	r3, [sp, #16]
30004638:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000463c:	e58d3020 	str	r3, [sp, #32]
30004640:	e59d2010 	ldr	r2, [sp, #16]
30004644:	e59d3018 	ldr	r3, [sp, #24]
30004648:	e1520003 	cmp	r2, r3
3000464c:	1affffeb 	bne	30004600 <acoral_delayqueue_add+0x58>
30004650:	ea000000 	b	30004658 <acoral_delayqueue_add+0xb0>
		thread = list_entry (tmp, acoral_thread_t, waiting);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
30004654:	e1a00000 	nop			; (mov r0, r0)
	}
	new->delay = delay2;
30004658:	e59d3000 	ldr	r3, [sp]
3000465c:	e59d2020 	ldr	r2, [sp, #32]
30004660:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_list_add(&new->waiting,tmp->prev);
30004664:	e59d3000 	ldr	r3, [sp]
30004668:	e2832020 	add	r2, r3, #32
3000466c:	e59d3010 	ldr	r3, [sp, #16]
30004670:	e5933004 	ldr	r3, [r3, #4]
30004674:	e1a00002 	mov	r0, r2
30004678:	e1a01003 	mov	r1, r3
3000467c:	eb00163c 	bl	30009f74 <acoral_list_add>
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
30004680:	e59d2010 	ldr	r2, [sp, #16]
30004684:	e59d3018 	ldr	r3, [sp, #24]
30004688:	e1520003 	cmp	r2, r3
3000468c:	0a000008 	beq	300046b4 <acoral_delayqueue_add+0x10c>
		thread = list_entry(tmp, acoral_thread_t, waiting);
30004690:	e59d3010 	ldr	r3, [sp, #16]
30004694:	e2433020 	sub	r3, r3, #32
30004698:	e58d301c 	str	r3, [sp, #28]
		thread->delay-=delay2;
3000469c:	e59d301c 	ldr	r3, [sp, #28]
300046a0:	e5932040 	ldr	r2, [r3, #64]	; 0x40
300046a4:	e59d3020 	ldr	r3, [sp, #32]
300046a8:	e0632002 	rsb	r2, r3, r2
300046ac:	e59d301c 	ldr	r3, [sp, #28]
300046b0:	e5832040 	str	r2, [r3, #64]	; 0x40
	}
	acoral_unrdy_thread(new);
300046b4:	e59d0000 	ldr	r0, [sp]
300046b8:	ebfff935 	bl	30002b94 <acoral_unrdy_thread>
#endif
	HAL_EXIT_CRITICAL();
300046bc:	e59d000c 	ldr	r0, [sp, #12]
300046c0:	ebfff409 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
300046c4:	ebfff74b 	bl	300023f8 <acoral_sched>
	return;
}
300046c8:	e28dd02c 	add	sp, sp, #44	; 0x2c
300046cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300046d0:	e12fff1e 	bx	lr

300046d4 <time_delay_deal>:

void time_delay_deal(){
300046d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300046d8:	e24dd014 	sub	sp, sp, #20
	acoral_list_t   *tmp,*tmp1,*head;
	acoral_thread_t *thread;
	head = &time_delay_queue.head;
300046dc:	e59f30f8 	ldr	r3, [pc, #248]	; 300047dc <time_delay_deal+0x108>
300046e0:	e58d3008 	str	r3, [sp, #8]
	if(acoral_list_empty(head))
300046e4:	e59d3008 	ldr	r3, [sp, #8]
300046e8:	e5932000 	ldr	r2, [r3]
300046ec:	e59d3008 	ldr	r3, [sp, #8]
300046f0:	e1520003 	cmp	r2, r3
300046f4:	0a000032 	beq	300047c4 <time_delay_deal+0xf0>
	  	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
300046f8:	e59d3008 	ldr	r3, [sp, #8]
300046fc:	e5933000 	ldr	r3, [r3]
30004700:	e2433020 	sub	r3, r3, #32
30004704:	e58d300c 	str	r3, [sp, #12]
	ACORAL_ASSERT(thread,"in time deal");
30004708:	e59d200c 	ldr	r2, [sp, #12]
3000470c:	e59f30cc 	ldr	r3, [pc, #204]	; 300047e0 <time_delay_deal+0x10c>
30004710:	e1a00002 	mov	r0, r2
30004714:	e1a01003 	mov	r1, r3
30004718:	ebfffd41 	bl	30003c24 <acoral_assert_res>
	thread->delay--;
3000471c:	e59d300c 	ldr	r3, [sp, #12]
30004720:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004724:	e2432001 	sub	r2, r3, #1
30004728:	e59d300c 	ldr	r3, [sp, #12]
3000472c:	e5832040 	str	r2, [r3, #64]	; 0x40
	for(tmp=head->next;tmp!=head;){
30004730:	e59d3008 	ldr	r3, [sp, #8]
30004734:	e5933000 	ldr	r3, [r3]
30004738:	e58d3000 	str	r3, [sp]
3000473c:	ea00001b 	b	300047b0 <time_delay_deal+0xdc>
		thread=list_entry(tmp,acoral_thread_t,waiting);
30004740:	e59d3000 	ldr	r3, [sp]
30004744:	e2433020 	sub	r3, r3, #32
30004748:	e58d300c 	str	r3, [sp, #12]
		ACORAL_ASSERT(thread,"in time deal for");
3000474c:	e59d200c 	ldr	r2, [sp, #12]
30004750:	e59f308c 	ldr	r3, [pc, #140]	; 300047e4 <time_delay_deal+0x110>
30004754:	e1a00002 	mov	r0, r2
30004758:	e1a01003 	mov	r1, r3
3000475c:	ebfffd30 	bl	30003c24 <acoral_assert_res>
		if(thread->delay>0)
30004760:	e59d300c 	ldr	r3, [sp, #12]
30004764:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004768:	e3530000 	cmp	r3, #0
3000476c:	ca000016 	bgt	300047cc <time_delay_deal+0xf8>
		/*防止add判断delay时取下thread*/
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_lock(&head->lock);
		acoral_spin_lock(&tmp->lock);
#endif
		tmp1=tmp->next;
30004770:	e59d3000 	ldr	r3, [sp]
30004774:	e5933000 	ldr	r3, [r3]
30004778:	e58d3004 	str	r3, [sp, #4]
		acoral_list_del(&thread->waiting);
3000477c:	e59d300c 	ldr	r3, [sp, #12]
30004780:	e2833020 	add	r3, r3, #32
30004784:	e1a00003 	mov	r0, r3
30004788:	eb00161f 	bl	3000a00c <acoral_list_del>
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_unlock(&tmp->lock);
		acoral_spin_unlock(&head->lock);
#endif
		tmp=tmp1;
3000478c:	e59d3004 	ldr	r3, [sp, #4]
30004790:	e58d3000 	str	r3, [sp]
		thread->state&=~ACORAL_THREAD_STATE_DELAY;
30004794:	e59d300c 	ldr	r3, [sp, #12]
30004798:	e5d33004 	ldrb	r3, [r3, #4]
3000479c:	e20330df 	and	r3, r3, #223	; 0xdf
300047a0:	e59d200c 	ldr	r2, [sp, #12]
300047a4:	e5c23004 	strb	r3, [r2, #4]
		acoral_rdy_thread(thread);
300047a8:	e59d000c 	ldr	r0, [sp, #12]
300047ac:	ebfff8e9 	bl	30002b58 <acoral_rdy_thread>
	if(acoral_list_empty(head))
	  	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
	ACORAL_ASSERT(thread,"in time deal");
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
300047b0:	e59d2000 	ldr	r2, [sp]
300047b4:	e59d3008 	ldr	r3, [sp, #8]
300047b8:	e1520003 	cmp	r2, r3
300047bc:	1affffdf 	bne	30004740 <time_delay_deal+0x6c>
300047c0:	ea000002 	b	300047d0 <time_delay_deal+0xfc>
void time_delay_deal(){
	acoral_list_t   *tmp,*tmp1,*head;
	acoral_thread_t *thread;
	head = &time_delay_queue.head;
	if(acoral_list_empty(head))
	  	return;
300047c4:	e1a00000 	nop			; (mov r0, r0)
300047c8:	ea000000 	b	300047d0 <time_delay_deal+0xfc>
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
		thread=list_entry(tmp,acoral_thread_t,waiting);
		ACORAL_ASSERT(thread,"in time deal for");
		if(thread->delay>0)
		    break;
300047cc:	e1a00000 	nop			; (mov r0, r0)
#endif
		tmp=tmp1;
		thread->state&=~ACORAL_THREAD_STATE_DELAY;
		acoral_rdy_thread(thread);
	}
}
300047d0:	e28dd014 	add	sp, sp, #20
300047d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300047d8:	e12fff1e 	bx	lr
300047dc:	30010368 	.word	0x30010368
300047e0:	3000e380 	.word	0x3000e380
300047e4:	3000e390 	.word	0x3000e390

300047e8 <timeout_queue_add>:
/*================================
 *  
 *    将线程挂到超时队列上
 *================================*/
void timeout_queue_add(acoral_thread_t *new)
{
300047e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300047ec:	e24dd02c 	sub	sp, sp, #44	; 0x2c
300047f0:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;
	acoral_list_t   *tmp, *tmp1,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
300047f4:	e59d3004 	ldr	r3, [sp, #4]
300047f8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300047fc:	e58d3024 	str	r3, [sp, #36]	; 0x24
	head=&timeout_queue.head;
30004800:	e59f30e4 	ldr	r3, [pc, #228]	; 300048ec <timeout_queue_add+0x104>
30004804:	e58d3018 	str	r3, [sp, #24]
	HAL_ENTER_CRITICAL();
30004808:	ebfff3b9 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000480c:	e1a03000 	mov	r3, r0
30004810:	e58d300c 	str	r3, [sp, #12]
		/*获取下一个成员锁*/
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30004814:	e59d3018 	ldr	r3, [sp, #24]
30004818:	e5933000 	ldr	r3, [r3]
3000481c:	e58d3010 	str	r3, [sp, #16]
30004820:	ea00000d 	b	3000485c <timeout_queue_add+0x74>
		thread = list_entry (tmp, acoral_thread_t, timeout);
30004824:	e59d3010 	ldr	r3, [sp, #16]
30004828:	e2433018 	sub	r3, r3, #24
3000482c:	e58d301c 	str	r3, [sp, #28]
		delay  = delay-thread->delay;
30004830:	e59d301c 	ldr	r3, [sp, #28]
30004834:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30004838:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
3000483c:	e0633002 	rsb	r3, r3, r2
30004840:	e58d3024 	str	r3, [sp, #36]	; 0x24
		if (delay < 0)
30004844:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30004848:	e3530000 	cmp	r3, #0
3000484c:	ba000009 	blt	30004878 <timeout_queue_add+0x90>
		/*获取下一个成员锁*/
		acoral_spin_lock(&tmp1->lock);
		acoral_spin_unlock(&tmp->lock);
	}
#else
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30004850:	e59d3010 	ldr	r3, [sp, #16]
30004854:	e5933000 	ldr	r3, [r3]
30004858:	e58d3010 	str	r3, [sp, #16]
3000485c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30004860:	e58d3020 	str	r3, [sp, #32]
30004864:	e59d2010 	ldr	r2, [sp, #16]
30004868:	e59d3018 	ldr	r3, [sp, #24]
3000486c:	e1520003 	cmp	r2, r3
30004870:	1affffeb 	bne	30004824 <timeout_queue_add+0x3c>
30004874:	ea000000 	b	3000487c <timeout_queue_add+0x94>
		thread = list_entry (tmp, acoral_thread_t, timeout);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
30004878:	e1a00000 	nop			; (mov r0, r0)
	}
	new->delay = delay2;
3000487c:	e59d3004 	ldr	r3, [sp, #4]
30004880:	e59d2020 	ldr	r2, [sp, #32]
30004884:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_list_add(&new->timeout,tmp->prev);
30004888:	e59d3004 	ldr	r3, [sp, #4]
3000488c:	e2832018 	add	r2, r3, #24
30004890:	e59d3010 	ldr	r3, [sp, #16]
30004894:	e5933004 	ldr	r3, [r3, #4]
30004898:	e1a00002 	mov	r0, r2
3000489c:	e1a01003 	mov	r1, r3
300048a0:	eb0015b3 	bl	30009f74 <acoral_list_add>
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
300048a4:	e59d2010 	ldr	r2, [sp, #16]
300048a8:	e59d3018 	ldr	r3, [sp, #24]
300048ac:	e1520003 	cmp	r2, r3
300048b0:	0a000008 	beq	300048d8 <timeout_queue_add+0xf0>
		thread = list_entry(tmp, acoral_thread_t, timeout);
300048b4:	e59d3010 	ldr	r3, [sp, #16]
300048b8:	e2433018 	sub	r3, r3, #24
300048bc:	e58d301c 	str	r3, [sp, #28]
		thread->delay-=delay2;
300048c0:	e59d301c 	ldr	r3, [sp, #28]
300048c4:	e5932040 	ldr	r2, [r3, #64]	; 0x40
300048c8:	e59d3020 	ldr	r3, [sp, #32]
300048cc:	e0632002 	rsb	r2, r3, r2
300048d0:	e59d301c 	ldr	r3, [sp, #28]
300048d4:	e5832040 	str	r2, [r3, #64]	; 0x40
	}
#endif

	HAL_EXIT_CRITICAL();
300048d8:	e59d000c 	ldr	r0, [sp, #12]
300048dc:	ebfff382 	bl	300016ec <HAL_INTR_RESTORE>
	return;
}
300048e0:	e28dd02c 	add	sp, sp, #44	; 0x2c
300048e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300048e8:	e12fff1e 	bx	lr
300048ec:	300103e4 	.word	0x300103e4

300048f0 <timeout_queue_del>:
/*================================
 *  
 *    将线程超时队列删除
 *================================*/
void timeout_queue_del(acoral_thread_t *new)
{
300048f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300048f4:	e24dd014 	sub	sp, sp, #20
300048f8:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t  *p, *q;
	
	if (acoral_list_empty(&new->timeout))
300048fc:	e59d3004 	ldr	r3, [sp, #4]
30004900:	e5932018 	ldr	r2, [r3, #24]
30004904:	e59d3004 	ldr	r3, [sp, #4]
30004908:	e2833018 	add	r3, r3, #24
3000490c:	e1520003 	cmp	r2, r3
30004910:	0a00000b 	beq	30004944 <timeout_queue_del+0x54>
		return;

	p = new->timeout.prev;
30004914:	e59d3004 	ldr	r3, [sp, #4]
30004918:	e593301c 	ldr	r3, [r3, #28]
3000491c:	e58d3008 	str	r3, [sp, #8]
	q = &new->timeout;
30004920:	e59d3004 	ldr	r3, [sp, #4]
30004924:	e2833018 	add	r3, r3, #24
30004928:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&p->lock);
	acoral_spin_lock(&q->lock);
	acoral_list_del(&new->timeout);
3000492c:	e59d3004 	ldr	r3, [sp, #4]
30004930:	e2833018 	add	r3, r3, #24
30004934:	e1a00003 	mov	r0, r3
30004938:	eb0015b3 	bl	3000a00c <acoral_list_del>
	acoral_spin_unlock(&q->lock);
	acoral_spin_unlock(&p->lock);
	return;
3000493c:	e1a00000 	nop			; (mov r0, r0)
30004940:	ea000000 	b	30004948 <timeout_queue_del+0x58>
void timeout_queue_del(acoral_thread_t *new)
{
	acoral_list_t  *p, *q;
	
	if (acoral_list_empty(&new->timeout))
		return;
30004944:	e1a00000 	nop			; (mov r0, r0)
	acoral_spin_lock(&q->lock);
	acoral_list_del(&new->timeout);
	acoral_spin_unlock(&q->lock);
	acoral_spin_unlock(&p->lock);
	return;
}
30004948:	e28dd014 	add	sp, sp, #20
3000494c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004950:	e12fff1e 	bx	lr

30004954 <timeout_delay_deal>:
/*---------------------*/
/*  超时链表处理函数*/
/*   pegasus  0719*/
/*---------------------*/
void timeout_delay_deal()
{
30004954:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004958:	e24dd014 	sub	sp, sp, #20
	acoral_list_t *tmp, *tmp1, *head;
	acoral_thread_t  *thread;

	head = &timeout_queue.head;
3000495c:	e59f30f4 	ldr	r3, [pc, #244]	; 30004a58 <timeout_delay_deal+0x104>
30004960:	e58d3008 	str	r3, [sp, #8]
	if(acoral_list_empty(head))
30004964:	e59d3008 	ldr	r3, [sp, #8]
30004968:	e5932000 	ldr	r2, [r3]
3000496c:	e59d3008 	ldr	r3, [sp, #8]
30004970:	e1520003 	cmp	r2, r3
30004974:	0a000031 	beq	30004a40 <timeout_delay_deal+0xec>
	{
	  	return;
	}

	thread=list_entry(head->next,acoral_thread_t,timeout);
30004978:	e59d3008 	ldr	r3, [sp, #8]
3000497c:	e5933000 	ldr	r3, [r3]
30004980:	e2433018 	sub	r3, r3, #24
30004984:	e58d300c 	str	r3, [sp, #12]
	ACORAL_ASSERT(thread,"in timeout deal");
30004988:	e59d200c 	ldr	r2, [sp, #12]
3000498c:	e59f30c8 	ldr	r3, [pc, #200]	; 30004a5c <timeout_delay_deal+0x108>
30004990:	e1a00002 	mov	r0, r2
30004994:	e1a01003 	mov	r1, r3
30004998:	ebfffca1 	bl	30003c24 <acoral_assert_res>
	if (thread->delay>0)
3000499c:	e59d300c 	ldr	r3, [sp, #12]
300049a0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300049a4:	e3530000 	cmp	r3, #0
300049a8:	da000004 	ble	300049c0 <timeout_delay_deal+0x6c>
		thread->delay--;
300049ac:	e59d300c 	ldr	r3, [sp, #12]
300049b0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300049b4:	e2432001 	sub	r2, r3, #1
300049b8:	e59d300c 	ldr	r3, [sp, #12]
300049bc:	e5832040 	str	r2, [r3, #64]	; 0x40
	for(tmp=head->next;tmp!=head;)
300049c0:	e59d3008 	ldr	r3, [sp, #8]
300049c4:	e5933000 	ldr	r3, [r3]
300049c8:	e58d3000 	str	r3, [sp]
300049cc:	ea000016 	b	30004a2c <timeout_delay_deal+0xd8>
	{
		thread=list_entry(tmp,acoral_thread_t,timeout);
300049d0:	e59d3000 	ldr	r3, [sp]
300049d4:	e2433018 	sub	r3, r3, #24
300049d8:	e58d300c 	str	r3, [sp, #12]
		ACORAL_ASSERT(thread,"in timeout deal");
300049dc:	e59d200c 	ldr	r2, [sp, #12]
300049e0:	e59f3074 	ldr	r3, [pc, #116]	; 30004a5c <timeout_delay_deal+0x108>
300049e4:	e1a00002 	mov	r0, r2
300049e8:	e1a01003 	mov	r1, r3
300049ec:	ebfffc8c 	bl	30003c24 <acoral_assert_res>
		if(thread->delay>0)
300049f0:	e59d300c 	ldr	r3, [sp, #12]
300049f4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300049f8:	e3530000 	cmp	r3, #0
300049fc:	ca000011 	bgt	30004a48 <timeout_delay_deal+0xf4>
		    break;
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_lock(&head->lock);
		acoral_spin_lock(&tmp->lock);
#endif
		tmp1=tmp->next;
30004a00:	e59d3000 	ldr	r3, [sp]
30004a04:	e5933000 	ldr	r3, [r3]
30004a08:	e58d3004 	str	r3, [sp, #4]
		acoral_list_del(&thread->timeout);
30004a0c:	e59d300c 	ldr	r3, [sp, #12]
30004a10:	e2833018 	add	r3, r3, #24
30004a14:	e1a00003 	mov	r0, r3
30004a18:	eb00157b 	bl	3000a00c <acoral_list_del>
#ifndef CFG_TICKS_PRIVATE
		acoral_spin_unlock(&tmp->lock);
		acoral_spin_unlock(&head->lock);
#endif
		tmp=tmp1;
30004a1c:	e59d3004 	ldr	r3, [sp, #4]
30004a20:	e58d3000 	str	r3, [sp]
		/*thread->state*/
		acoral_rdy_thread(thread);
30004a24:	e59d000c 	ldr	r0, [sp, #12]
30004a28:	ebfff84a 	bl	30002b58 <acoral_rdy_thread>

	thread=list_entry(head->next,acoral_thread_t,timeout);
	ACORAL_ASSERT(thread,"in timeout deal");
	if (thread->delay>0)
		thread->delay--;
	for(tmp=head->next;tmp!=head;)
30004a2c:	e59d2000 	ldr	r2, [sp]
30004a30:	e59d3008 	ldr	r3, [sp, #8]
30004a34:	e1520003 	cmp	r2, r3
30004a38:	1affffe4 	bne	300049d0 <timeout_delay_deal+0x7c>
30004a3c:	ea000002 	b	30004a4c <timeout_delay_deal+0xf8>
	acoral_thread_t  *thread;

	head = &timeout_queue.head;
	if(acoral_list_empty(head))
	{
	  	return;
30004a40:	e1a00000 	nop			; (mov r0, r0)
30004a44:	ea000000 	b	30004a4c <timeout_delay_deal+0xf8>
	for(tmp=head->next;tmp!=head;)
	{
		thread=list_entry(tmp,acoral_thread_t,timeout);
		ACORAL_ASSERT(thread,"in timeout deal");
		if(thread->delay>0)
		    break;
30004a48:	e1a00000 	nop			; (mov r0, r0)
#endif
		tmp=tmp1;
		/*thread->state*/
		acoral_rdy_thread(thread);
	}
}
30004a4c:	e28dd014 	add	sp, sp, #20
30004a50:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004a54:	e12fff1e 	bx	lr
30004a58:	300103e4 	.word	0x300103e4
30004a5c:	3000e3a4 	.word	0x3000e3a4

30004a60 <acoral_mem_sys_init>:
#include<mem.h>
/*================================
 *   memory system initialize
 *	内存管理系统初始化
 *================================*/
void acoral_mem_sys_init(){
30004a60:	e92d4008 	push	{r3, lr}
	/*硬件相关的内存初始化，比如内存控制器等*/
  	HAL_MEM_INIT();
30004a64:	ebffefc2 	bl	30000974 <hal_mem_init>
	/*堆初始化,这个可以选择不同管理系统，比如buddy内存管理等*/
  	acoral_mem_init((acoral_u32)HAL_HEAP_START,(acoral_u32)HAL_HEAP_END);
30004a68:	e59f2018 	ldr	r2, [pc, #24]	; 30004a88 <acoral_mem_sys_init+0x28>
30004a6c:	e59f3018 	ldr	r3, [pc, #24]	; 30004a8c <acoral_mem_sys_init+0x2c>
30004a70:	e1a00002 	mov	r0, r2
30004a74:	e1a01003 	mov	r1, r3
30004a78:	eb0002b3 	bl	3000554c <buddy_init>
#ifdef CFG_MEM2
  	acoral_mem_init2();
30004a7c:	eb000916 	bl	30006edc <v_mem_init>
#endif
}
30004a80:	e8bd4008 	pop	{r3, lr}
30004a84:	e12fff1e 	bx	lr
30004a88:	30010424 	.word	0x30010424
30004a8c:	33eff000 	.word	0x33eff000

30004a90 <spin_lock_intr_save>:
#include <hal.h>
#include <spinlock.h>
#include <lsched.h>
acoral_sr spin_lock_intr_save(acoral_spinlock_t *v){
30004a90:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004a94:	e24dd014 	sub	sp, sp, #20
30004a98:	e58d0004 	str	r0, [sp, #4]
	acoral_sr sr;
	sr=HAL_INTR_DISABLE_SAVE();
30004a9c:	ebfff314 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30004aa0:	e1a03000 	mov	r3, r0
30004aa4:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(v);
	return sr;
30004aa8:	e59d300c 	ldr	r3, [sp, #12]
}
30004aac:	e1a00003 	mov	r0, r3
30004ab0:	e28dd014 	add	sp, sp, #20
30004ab4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004ab8:	e12fff1e 	bx	lr

30004abc <spin_unlock_intr_restore>:

void spin_unlock_intr_restore(acoral_sr sr,acoral_spinlock_t *v){
30004abc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004ac0:	e24dd00c 	sub	sp, sp, #12
30004ac4:	e58d0004 	str	r0, [sp, #4]
30004ac8:	e58d1000 	str	r1, [sp]
	acoral_spin_unlock(v);
	HAL_INTR_RESTORE(sr);
30004acc:	e59d0004 	ldr	r0, [sp, #4]
30004ad0:	ebfff305 	bl	300016ec <HAL_INTR_RESTORE>
}
30004ad4:	e28dd00c 	add	sp, sp, #12
30004ad8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004adc:	e12fff1e 	bx	lr

30004ae0 <spin_lock_intr>:

void spin_lock_intr(acoral_spinlock_t *v){
30004ae0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004ae4:	e24dd00c 	sub	sp, sp, #12
30004ae8:	e58d0004 	str	r0, [sp, #4]
	HAL_INTR_DISABLE();
30004aec:	ebfff2f9 	bl	300016d8 <HAL_INTR_DISABLE>
	acoral_spin_lock(v);
}
30004af0:	e28dd00c 	add	sp, sp, #12
30004af4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004af8:	e12fff1e 	bx	lr

30004afc <spin_unlock_intr>:

void spin_unlock_intr(acoral_spinlock_t *v){
30004afc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004b00:	e24dd00c 	sub	sp, sp, #12
30004b04:	e58d0004 	str	r0, [sp, #4]
	acoral_spin_unlock(v);
	HAL_INTR_ENABLE();
30004b08:	ebfff2ee 	bl	300016c8 <HAL_INTR_ENABLE>
}
30004b0c:	e28dd00c 	add	sp, sp, #12
30004b10:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004b14:	e12fff1e 	bx	lr

30004b18 <spin_lock_stamp>:

void spin_lock_stamp(acoral_spinlock_t *v){
30004b18:	e24dd008 	sub	sp, sp, #8
30004b1c:	e58d0004 	str	r0, [sp, #4]
	acoral_sched_lock();
30004b20:	e59f300c 	ldr	r3, [pc, #12]	; 30004b34 <spin_lock_stamp+0x1c>
30004b24:	e3a02001 	mov	r2, #1
30004b28:	e5c32000 	strb	r2, [r3]
	acoral_spin_lock(v);
}
30004b2c:	e28dd008 	add	sp, sp, #8
30004b30:	e12fff1e 	bx	lr
30004b34:	3000f3e4 	.word	0x3000f3e4

30004b38 <spin_unlock_stamp>:

void spin_unlock_stamp(acoral_spinlock_t *v){
30004b38:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004b3c:	e24dd00c 	sub	sp, sp, #12
30004b40:	e58d0004 	str	r0, [sp, #4]
	acoral_spin_unlock(v);
	acoral_sched_unlock();
30004b44:	ebfff529 	bl	30001ff0 <acoral_sched_unlock>
}
30004b48:	e28dd00c 	add	sp, sp, #12
30004b4c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004b50:	e12fff1e 	bx	lr

30004b54 <acoral_evt_sys_init>:
#include "acoral.h"
#include "event.h"
acoral_pool_ctrl_t acoral_evt_pool_ctrl;
void acoral_evt_sys_init(){
30004b54:	e92d4008 	push	{r3, lr}
	acoral_evt_pool_init();
30004b58:	eb000001 	bl	30004b64 <acoral_evt_pool_init>
}
30004b5c:	e8bd4008 	pop	{r3, lr}
30004b60:	e12fff1e 	bx	lr

30004b64 <acoral_evt_pool_init>:

void acoral_evt_pool_init(){
30004b64:	e92d4008 	push	{r3, lr}
	acoral_evt_pool_ctrl.type=ACORAL_RES_EVENT;
30004b68:	e59f3048 	ldr	r3, [pc, #72]	; 30004bb8 <acoral_evt_pool_init+0x54>
30004b6c:	e3a02002 	mov	r2, #2
30004b70:	e5832000 	str	r2, [r3]
	acoral_evt_pool_ctrl.size=sizeof(acoral_evt_t);
30004b74:	e59f303c 	ldr	r3, [pc, #60]	; 30004bb8 <acoral_evt_pool_init+0x54>
30004b78:	e3a02024 	mov	r2, #36	; 0x24
30004b7c:	e5832004 	str	r2, [r3, #4]
	acoral_evt_pool_ctrl.num_per_pool=8;
30004b80:	e59f3030 	ldr	r3, [pc, #48]	; 30004bb8 <acoral_evt_pool_init+0x54>
30004b84:	e3a02008 	mov	r2, #8
30004b88:	e5832008 	str	r2, [r3, #8]
	acoral_evt_pool_ctrl.num=0;
30004b8c:	e59f3024 	ldr	r3, [pc, #36]	; 30004bb8 <acoral_evt_pool_init+0x54>
30004b90:	e3a02000 	mov	r2, #0
30004b94:	e583200c 	str	r2, [r3, #12]
	acoral_evt_pool_ctrl.max_pools=4;
30004b98:	e59f3018 	ldr	r3, [pc, #24]	; 30004bb8 <acoral_evt_pool_init+0x54>
30004b9c:	e3a02004 	mov	r2, #4
30004ba0:	e5832010 	str	r2, [r3, #16]
	acoral_pool_ctrl_init(&acoral_evt_pool_ctrl);
30004ba4:	e59f000c 	ldr	r0, [pc, #12]	; 30004bb8 <acoral_evt_pool_init+0x54>
30004ba8:	ebfffbaa 	bl	30003a58 <acoral_pool_ctrl_init>
#ifdef CFG_MSG
	acoral_msg_sys_init();
30004bac:	eb000b7a 	bl	3000799c <acoral_msg_sys_init>
#endif
}
30004bb0:	e8bd4008 	pop	{r3, lr}
30004bb4:	e12fff1e 	bx	lr
30004bb8:	30010374 	.word	0x30010374

30004bbc <acoral_alloc_evt>:

acoral_evt_t *acoral_alloc_evt(){
30004bbc:	e92d4008 	push	{r3, lr}
  	return (acoral_evt_t *)acoral_get_res(&acoral_evt_pool_ctrl);
30004bc0:	e59f0010 	ldr	r0, [pc, #16]	; 30004bd8 <acoral_alloc_evt+0x1c>
30004bc4:	ebfffa44 	bl	300034dc <acoral_get_res>
30004bc8:	e1a03000 	mov	r3, r0
}
30004bcc:	e1a00003 	mov	r0, r3
30004bd0:	e8bd4008 	pop	{r3, lr}
30004bd4:	e12fff1e 	bx	lr
30004bd8:	30010374 	.word	0x30010374

30004bdc <acoral_evt_init>:

void acoral_evt_init(acoral_evt_t *evt){
30004bdc:	e24dd008 	sub	sp, sp, #8
30004be0:	e58d0004 	str	r0, [sp, #4]
	acoral_spin_init(&evt->spin_lock);
	acoral_list_init(&evt->wait_queue.head);
30004be4:	e59d3004 	ldr	r3, [sp, #4]
30004be8:	e2832010 	add	r2, r3, #16
30004bec:	e59d3004 	ldr	r3, [sp, #4]
30004bf0:	e5832010 	str	r2, [r3, #16]
30004bf4:	e59d3004 	ldr	r3, [sp, #4]
30004bf8:	e2832010 	add	r2, r3, #16
30004bfc:	e59d3004 	ldr	r3, [sp, #4]
30004c00:	e5832014 	str	r2, [r3, #20]
}
30004c04:	e28dd008 	add	sp, sp, #8
30004c08:	e12fff1e 	bx	lr

30004c0c <acoral_evt_queue_empty>:

bool acoral_evt_queue_empty(acoral_evt_t *evt){
30004c0c:	e24dd008 	sub	sp, sp, #8
30004c10:	e58d0004 	str	r0, [sp, #4]
	return acoral_list_empty(&evt->wait_queue.head);
30004c14:	e59d3004 	ldr	r3, [sp, #4]
30004c18:	e5932010 	ldr	r2, [r3, #16]
30004c1c:	e59d3004 	ldr	r3, [sp, #4]
30004c20:	e2833010 	add	r3, r3, #16
30004c24:	e1520003 	cmp	r2, r3
30004c28:	13a03000 	movne	r3, #0
30004c2c:	03a03001 	moveq	r3, #1
30004c30:	e1a03c03 	lsl	r3, r3, #24
30004c34:	e1a03c43 	asr	r3, r3, #24
}
30004c38:	e1a00003 	mov	r0, r3
30004c3c:	e28dd008 	add	sp, sp, #8
30004c40:	e12fff1e 	bx	lr

30004c44 <acoral_evt_high_thread>:

acoral_thread_t *acoral_evt_high_thread(acoral_evt_t *evt){
30004c44:	e24dd010 	sub	sp, sp, #16
30004c48:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t *head;
	acoral_thread_t *thread;
	head=&evt->wait_queue.head;
30004c4c:	e59d3004 	ldr	r3, [sp, #4]
30004c50:	e2833010 	add	r3, r3, #16
30004c54:	e58d3008 	str	r3, [sp, #8]
	if(acoral_list_empty(head))
30004c58:	e59d3008 	ldr	r3, [sp, #8]
30004c5c:	e5932000 	ldr	r2, [r3]
30004c60:	e59d3008 	ldr	r3, [sp, #8]
30004c64:	e1520003 	cmp	r2, r3
30004c68:	1a000001 	bne	30004c74 <acoral_evt_high_thread+0x30>
		return NULL;
30004c6c:	e3a03000 	mov	r3, #0
30004c70:	ea000004 	b	30004c88 <acoral_evt_high_thread+0x44>
	thread=list_entry(head->next,acoral_thread_t,waiting);
30004c74:	e59d3008 	ldr	r3, [sp, #8]
30004c78:	e5933000 	ldr	r3, [r3]
30004c7c:	e2433020 	sub	r3, r3, #32
30004c80:	e58d300c 	str	r3, [sp, #12]
	return thread;	
30004c84:	e59d300c 	ldr	r3, [sp, #12]
}
30004c88:	e1a00003 	mov	r0, r3
30004c8c:	e28dd010 	add	sp, sp, #16
30004c90:	e12fff1e 	bx	lr

30004c94 <acoral_evt_queue_add>:

void acoral_evt_queue_add(acoral_evt_t *evt,acoral_thread_t *new){
30004c94:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004c98:	e24dd01c 	sub	sp, sp, #28
30004c9c:	e58d0004 	str	r0, [sp, #4]
30004ca0:	e58d1000 	str	r1, [sp]
	acoral_list_t *head,*tmp;
	acoral_thread_t *thread;
  	new->evt=evt;
30004ca4:	e59d3000 	ldr	r3, [sp]
30004ca8:	e59d2004 	ldr	r2, [sp, #4]
30004cac:	e5832030 	str	r2, [r3, #48]	; 0x30
	head=&evt->wait_queue.head;
30004cb0:	e59d3004 	ldr	r3, [sp, #4]
30004cb4:	e2833010 	add	r3, r3, #16
30004cb8:	e58d300c 	str	r3, [sp, #12]
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30004cbc:	e59d300c 	ldr	r3, [sp, #12]
30004cc0:	e5933000 	ldr	r3, [r3]
30004cc4:	e58d3010 	str	r3, [sp, #16]
30004cc8:	ea000010 	b	30004d10 <acoral_evt_queue_add+0x7c>
		thread=list_entry(tmp,acoral_thread_t,waiting);
30004ccc:	e59d3010 	ldr	r3, [sp, #16]
30004cd0:	e2433020 	sub	r3, r3, #32
30004cd4:	e58d3014 	str	r3, [sp, #20]
		/*如果线程资源已经不在使用，即release状态则释放*/
		if(thread->prio>new->prio)
30004cd8:	e59d3014 	ldr	r3, [sp, #20]
30004cdc:	e5d32005 	ldrb	r2, [r3, #5]
30004ce0:	e59d3000 	ldr	r3, [sp]
30004ce4:	e5d33005 	ldrb	r3, [r3, #5]
30004ce8:	e1520003 	cmp	r2, r3
30004cec:	8a00000c 	bhi	30004d24 <acoral_evt_queue_add+0x90>
			break;


		if(tmp == tmp->next)
30004cf0:	e59d3010 	ldr	r3, [sp, #16]
30004cf4:	e5932000 	ldr	r2, [r3]
30004cf8:	e59d3010 	ldr	r3, [sp, #16]
30004cfc:	e1520003 	cmp	r2, r3
30004d00:	0a000009 	beq	30004d2c <acoral_evt_queue_add+0x98>
void acoral_evt_queue_add(acoral_evt_t *evt,acoral_thread_t *new){
	acoral_list_t *head,*tmp;
	acoral_thread_t *thread;
  	new->evt=evt;
	head=&evt->wait_queue.head;
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
30004d04:	e59d3010 	ldr	r3, [sp, #16]
30004d08:	e5933000 	ldr	r3, [r3]
30004d0c:	e58d3010 	str	r3, [sp, #16]
30004d10:	e59d2010 	ldr	r2, [sp, #16]
30004d14:	e59d300c 	ldr	r3, [sp, #12]
30004d18:	e1520003 	cmp	r2, r3
30004d1c:	1affffea 	bne	30004ccc <acoral_evt_queue_add+0x38>
30004d20:	ea000002 	b	30004d30 <acoral_evt_queue_add+0x9c>
		thread=list_entry(tmp,acoral_thread_t,waiting);
		/*如果线程资源已经不在使用，即release状态则释放*/
		if(thread->prio>new->prio)
			break;
30004d24:	e1a00000 	nop			; (mov r0, r0)
30004d28:	ea000000 	b	30004d30 <acoral_evt_queue_add+0x9c>


		if(tmp == tmp->next)
			break;
30004d2c:	e1a00000 	nop			; (mov r0, r0)

	}
	acoral_list_add(&new->waiting,tmp->prev);
30004d30:	e59d3000 	ldr	r3, [sp]
30004d34:	e2832020 	add	r2, r3, #32
30004d38:	e59d3010 	ldr	r3, [sp, #16]
30004d3c:	e5933004 	ldr	r3, [r3, #4]
30004d40:	e1a00002 	mov	r0, r2
30004d44:	e1a01003 	mov	r1, r3
30004d48:	eb001489 	bl	30009f74 <acoral_list_add>
}
30004d4c:	e28dd01c 	add	sp, sp, #28
30004d50:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004d54:	e12fff1e 	bx	lr

30004d58 <acoral_evt_queue_del>:

void acoral_evt_queue_del(acoral_thread_t *thread){
30004d58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004d5c:	e24dd00c 	sub	sp, sp, #12
30004d60:	e58d0004 	str	r0, [sp, #4]
	acoral_list_del(&thread->waiting);
30004d64:	e59d3004 	ldr	r3, [sp, #4]
30004d68:	e2833020 	add	r3, r3, #32
30004d6c:	e1a00003 	mov	r0, r3
30004d70:	eb0014a5 	bl	3000a00c <acoral_list_del>
	thread->evt=NULL;
30004d74:	e59d3004 	ldr	r3, [sp, #4]
30004d78:	e3a02000 	mov	r2, #0
30004d7c:	e5832030 	str	r2, [r3, #48]	; 0x30
}
30004d80:	e28dd00c 	add	sp, sp, #12
30004d84:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004d88:	e12fff1e 	bx	lr

30004d8c <acoral_mutex_init>:
/*==============================
 *  The initialize of the mutex
 *       信号量初始化函数
 *==============================*/
acoral_u32 acoral_mutex_init(acoral_evt_t *evt, acoral_u8 prio)
{
30004d8c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004d90:	e24dd00c 	sub	sp, sp, #12
30004d94:	e58d0004 	str	r0, [sp, #4]
30004d98:	e1a03001 	mov	r3, r1
30004d9c:	e5cd3003 	strb	r3, [sp, #3]
	if ((acoral_evt_t*)0 == evt)
30004da0:	e59d3004 	ldr	r3, [sp, #4]
30004da4:	e3530000 	cmp	r3, #0
30004da8:	1a000001 	bne	30004db4 <acoral_mutex_init+0x28>
	{
		return MUTEX_ERR_NULL;
30004dac:	e3a03002 	mov	r3, #2
30004db0:	ea00000d 	b	30004dec <acoral_mutex_init+0x60>
	}
	evt->count  = (prio << 8) | MUTEX_AVAI;
30004db4:	e5dd3003 	ldrb	r3, [sp, #3]
30004db8:	e1a03403 	lsl	r3, r3, #8
30004dbc:	e38320ff 	orr	r2, r3, #255	; 0xff
30004dc0:	e59d3004 	ldr	r3, [sp, #4]
30004dc4:	e583200c 	str	r2, [r3, #12]
	evt->type = ACORAL_EVENT_MUTEX;
30004dc8:	e59d3004 	ldr	r3, [sp, #4]
30004dcc:	e3a02001 	mov	r2, #1
30004dd0:	e5c32004 	strb	r2, [r3, #4]
	evt->data = NULL;
30004dd4:	e59d3004 	ldr	r3, [sp, #4]
30004dd8:	e3a02000 	mov	r2, #0
30004ddc:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
30004de0:	e59d0004 	ldr	r0, [sp, #4]
30004de4:	ebffff7c 	bl	30004bdc <acoral_evt_init>
	return MUTEX_SUCCED;
30004de8:	e3a03000 	mov	r3, #0
}
30004dec:	e1a00003 	mov	r0, r3
30004df0:	e28dd00c 	add	sp, sp, #12
30004df4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004df8:	e12fff1e 	bx	lr

30004dfc <acoral_mutex_create>:
/*==============================
 *  The creation of the mutex
 *       信号量创建函数
 *==============================*/
acoral_evt_t *acoral_mutex_create(acoral_u8 prio, acoral_u32 *err)
{
30004dfc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004e00:	e24dd014 	sub	sp, sp, #20
30004e04:	e1a03000 	mov	r3, r0
30004e08:	e58d1000 	str	r1, [sp]
30004e0c:	e5cd3007 	strb	r3, [sp, #7]
	acoral_evt_t *evt;

	/* 是否大于最小优先线，和是否该优先级已占用*/
	evt = acoral_alloc_evt();      /* alloc a RAM for the event*/
30004e10:	ebffff69 	bl	30004bbc <acoral_alloc_evt>
30004e14:	e1a03000 	mov	r3, r0
30004e18:	e58d300c 	str	r3, [sp, #12]
	if (NULL == evt)
30004e1c:	e59d300c 	ldr	r3, [sp, #12]
30004e20:	e3530000 	cmp	r3, #0
30004e24:	1a000004 	bne	30004e3c <acoral_mutex_create+0x40>
	{
		*err = MUTEX_ERR_NULL;
30004e28:	e59d3000 	ldr	r3, [sp]
30004e2c:	e3a02002 	mov	r2, #2
30004e30:	e5832000 	str	r2, [r3]
		return NULL;
30004e34:	e3a03000 	mov	r3, #0
30004e38:	ea00000d 	b	30004e74 <acoral_mutex_create+0x78>
	}
	evt->count  = (prio << 8) | MUTEX_AVAI;
30004e3c:	e5dd3007 	ldrb	r3, [sp, #7]
30004e40:	e1a03403 	lsl	r3, r3, #8
30004e44:	e38320ff 	orr	r2, r3, #255	; 0xff
30004e48:	e59d300c 	ldr	r3, [sp, #12]
30004e4c:	e583200c 	str	r2, [r3, #12]
	evt->type = ACORAL_EVENT_MUTEX;
30004e50:	e59d300c 	ldr	r3, [sp, #12]
30004e54:	e3a02001 	mov	r2, #1
30004e58:	e5c32004 	strb	r2, [r3, #4]
	evt->data = NULL;
30004e5c:	e59d300c 	ldr	r3, [sp, #12]
30004e60:	e3a02000 	mov	r2, #0
30004e64:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
30004e68:	e59d000c 	ldr	r0, [sp, #12]
30004e6c:	ebffff5a 	bl	30004bdc <acoral_evt_init>
	return evt;
30004e70:	e59d300c 	ldr	r3, [sp, #12]
}
30004e74:	e1a00003 	mov	r0, r3
30004e78:	e28dd014 	add	sp, sp, #20
30004e7c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004e80:	e12fff1e 	bx	lr

30004e84 <acoral_mutex_del>:
/*=============================
 *  The deletion of the mutex
 *      信号号删除函数
 *============================= */
acoral_u32 acoral_mutex_del(acoral_evt_t *evt, acoral_u32 opt)
{
30004e84:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004e88:	e24dd014 	sub	sp, sp, #20
30004e8c:	e58d0004 	str	r0, [sp, #4]
30004e90:	e58d1000 	str	r1, [sp]
	acoral_sr            cpu_sr;

	/* 参数检测 */
	if (NULL == evt)
30004e94:	e59d3004 	ldr	r3, [sp, #4]
30004e98:	e3530000 	cmp	r3, #0
30004e9c:	1a000001 	bne	30004ea8 <acoral_mutex_del+0x24>
	{
		return MUTEX_ERR_NULL; /*error*/
30004ea0:	e3a03002 	mov	r3, #2
30004ea4:	ea000015 	b	30004f00 <acoral_mutex_del+0x7c>
	}

	if ( ACORAL_EVENT_MUTEX != evt->type )
30004ea8:	e59d3004 	ldr	r3, [sp, #4]
30004eac:	e5d33004 	ldrb	r3, [r3, #4]
30004eb0:	e3530001 	cmp	r3, #1
30004eb4:	0a000001 	beq	30004ec0 <acoral_mutex_del+0x3c>
	{
		return MUTEX_ERR_TYPE; /*error*/
30004eb8:	e3a03003 	mov	r3, #3
30004ebc:	ea00000f 	b	30004f00 <acoral_mutex_del+0x7c>
	}

	/* 是否有任务等待*/
	HAL_ENTER_CRITICAL();
30004ec0:	ebfff20b 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30004ec4:	e1a03000 	mov	r3, r0
30004ec8:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if (acoral_evt_queue_empty(evt))
30004ecc:	e59d0004 	ldr	r0, [sp, #4]
30004ed0:	ebffff4d 	bl	30004c0c <acoral_evt_queue_empty>
30004ed4:	e1a03000 	mov	r3, r0
30004ed8:	e20330ff 	and	r3, r3, #255	; 0xff
30004edc:	e3530000 	cmp	r3, #0
30004ee0:	0a000003 	beq	30004ef4 <acoral_mutex_del+0x70>
	{
		/*无等待任务删除*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004ee4:	e59d000c 	ldr	r0, [sp, #12]
30004ee8:	ebfff1ff 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_SUCCED;
30004eec:	e3a03000 	mov	r3, #0
30004ef0:	ea000002 	b	30004f00 <acoral_mutex_del+0x7c>
	}
	else
	{
		/*有等待任务*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004ef4:	e59d000c 	ldr	r0, [sp, #12]
30004ef8:	ebfff1fb 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_TASK_EXIST;
30004efc:	e3a03004 	mov	r3, #4
	}
}
30004f00:	e1a00003 	mov	r0, r3
30004f04:	e28dd014 	add	sp, sp, #20
30004f08:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004f0c:	e12fff1e 	bx	lr

30004f10 <acoral_mutex_trypend>:
 *  the appliation for mutex
 *      信号号申请操作
 *  优先级继承的优先级反转解决
 *=============================*/
acoral_u32 acoral_mutex_trypend(acoral_evt_t *evt)
{
30004f10:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004f14:	e24dd014 	sub	sp, sp, #20
30004f18:	e58d0004 	str	r0, [sp, #4]
	acoral_sr        cpu_sr;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
30004f1c:	ebfff20f 	bl	30001760 <hal_get_intr_nesting_comm>
30004f20:	e1a03000 	mov	r3, r0
30004f24:	e3530000 	cmp	r3, #0
30004f28:	da000001 	ble	30004f34 <acoral_mutex_trypend+0x24>
		return MUTEX_ERR_INTR;
30004f2c:	e3a03005 	mov	r3, #5
30004f30:	ea000027 	b	30004fd4 <acoral_mutex_trypend+0xc4>
	
	cur=acoral_cur_thread;
30004f34:	e59f30a8 	ldr	r3, [pc, #168]	; 30004fe4 <acoral_mutex_trypend+0xd4>
30004f38:	e5933000 	ldr	r3, [r3]
30004f3c:	e58d300c 	str	r3, [sp, #12]
	
	HAL_ENTER_CRITICAL();
30004f40:	ebfff1eb 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30004f44:	e1a03000 	mov	r3, r0
30004f48:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if (NULL== evt)
30004f4c:	e59d3004 	ldr	r3, [sp, #4]
30004f50:	e3530000 	cmp	r3, #0
30004f54:	1a000003 	bne	30004f68 <acoral_mutex_trypend+0x58>
	{
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004f58:	e59d0008 	ldr	r0, [sp, #8]
30004f5c:	ebfff1e2 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_NULL;
30004f60:	e3a03002 	mov	r3, #2
30004f64:	ea00001a 	b	30004fd4 <acoral_mutex_trypend+0xc4>
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
30004f68:	e59d3004 	ldr	r3, [sp, #4]
30004f6c:	e593300c 	ldr	r3, [r3, #12]
30004f70:	e20330ff 	and	r3, r3, #255	; 0xff
30004f74:	e35300ff 	cmp	r3, #255	; 0xff
30004f78:	1a000012 	bne	30004fc8 <acoral_mutex_trypend+0xb8>
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
30004f7c:	e59d3004 	ldr	r3, [sp, #4]
30004f80:	e593300c 	ldr	r3, [r3, #12]
30004f84:	e2032cff 	and	r2, r3, #65280	; 0xff00
30004f88:	e59d3004 	ldr	r3, [sp, #4]
30004f8c:	e583200c 	str	r2, [r3, #12]
		evt->count |= cur->prio;
30004f90:	e59d3004 	ldr	r3, [sp, #4]
30004f94:	e593200c 	ldr	r2, [r3, #12]
30004f98:	e59d300c 	ldr	r3, [sp, #12]
30004f9c:	e5d33005 	ldrb	r3, [r3, #5]
30004fa0:	e1822003 	orr	r2, r2, r3
30004fa4:	e59d3004 	ldr	r3, [sp, #4]
30004fa8:	e583200c 	str	r2, [r3, #12]
		evt->data = (void*)cur;
30004fac:	e59d3004 	ldr	r3, [sp, #4]
30004fb0:	e59d200c 	ldr	r2, [sp, #12]
30004fb4:	e5832020 	str	r2, [r3, #32]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30004fb8:	e59d0008 	ldr	r0, [sp, #8]
30004fbc:	ebfff1ca 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_SUCCED;
30004fc0:	e3a03000 	mov	r3, #0
30004fc4:	ea000002 	b	30004fd4 <acoral_mutex_trypend+0xc4>
	}

	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30004fc8:	e59d0008 	ldr	r0, [sp, #8]
30004fcc:	ebfff1c6 	bl	300016ec <HAL_INTR_RESTORE>
	return MUTEX_ERR_TIMEOUT;
30004fd0:	e3a03007 	mov	r3, #7
}
30004fd4:	e1a00003 	mov	r0, r3
30004fd8:	e28dd014 	add	sp, sp, #20
30004fdc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30004fe0:	e12fff1e 	bx	lr
30004fe4:	300103f8 	.word	0x300103f8

30004fe8 <acoral_mutex_pend>:
 *  the appliation for mutex
 *      信号号申请操作
 *  优先级继承的优先级反转解决
 *=============================*/
acoral_u32 acoral_mutex_pend(acoral_evt_t *evt, acoral_time timeout)
{
30004fe8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30004fec:	e24dd01c 	sub	sp, sp, #28
30004ff0:	e58d0004 	str	r0, [sp, #4]
30004ff4:	e58d1000 	str	r1, [sp]
	acoral_u8        highPrio;
	acoral_u8        ownerPrio;
	acoral_thread_t *thread;
	acoral_thread_t *cur;

	if(acoral_intr_nesting>0)
30004ff8:	ebfff1d8 	bl	30001760 <hal_get_intr_nesting_comm>
30004ffc:	e1a03000 	mov	r3, r0
30005000:	e3530000 	cmp	r3, #0
30005004:	da000001 	ble	30005010 <acoral_mutex_pend+0x28>
		return MUTEX_ERR_INTR;
30005008:	e3a03005 	mov	r3, #5
3000500c:	ea000080 	b	30005214 <acoral_mutex_pend+0x22c>
	
	cur=acoral_cur_thread;
30005010:	e59f320c 	ldr	r3, [pc, #524]	; 30005224 <acoral_mutex_pend+0x23c>
30005014:	e5933000 	ldr	r3, [r3]
30005018:	e58d3014 	str	r3, [sp, #20]
	
	HAL_ENTER_CRITICAL();
3000501c:	ebfff1b4 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30005020:	e1a03000 	mov	r3, r0
30005024:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if (NULL== evt)
30005028:	e59d3004 	ldr	r3, [sp, #4]
3000502c:	e3530000 	cmp	r3, #0
30005030:	1a000003 	bne	30005044 <acoral_mutex_pend+0x5c>
	{
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005034:	e59d0008 	ldr	r0, [sp, #8]
30005038:	ebfff1ab 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_NULL;
3000503c:	e3a03002 	mov	r3, #2
30005040:	ea000073 	b	30005214 <acoral_mutex_pend+0x22c>
	}
	
	if ((acoral_u8)(evt->count & MUTEX_L_MASK) == MUTEX_AVAI)
30005044:	e59d3004 	ldr	r3, [sp, #4]
30005048:	e593300c 	ldr	r3, [r3, #12]
3000504c:	e20330ff 	and	r3, r3, #255	; 0xff
30005050:	e35300ff 	cmp	r3, #255	; 0xff
30005054:	1a000012 	bne	300050a4 <acoral_mutex_pend+0xbc>
	{
		/* 申请成功*/
		evt->count &= MUTEX_U_MASK;
30005058:	e59d3004 	ldr	r3, [sp, #4]
3000505c:	e593300c 	ldr	r3, [r3, #12]
30005060:	e2032cff 	and	r2, r3, #65280	; 0xff00
30005064:	e59d3004 	ldr	r3, [sp, #4]
30005068:	e583200c 	str	r2, [r3, #12]
		evt->count |= cur->prio;
3000506c:	e59d3004 	ldr	r3, [sp, #4]
30005070:	e593200c 	ldr	r2, [r3, #12]
30005074:	e59d3014 	ldr	r3, [sp, #20]
30005078:	e5d33005 	ldrb	r3, [r3, #5]
3000507c:	e1822003 	orr	r2, r2, r3
30005080:	e59d3004 	ldr	r3, [sp, #4]
30005084:	e583200c 	str	r2, [r3, #12]
		evt->data = (void*)cur;
30005088:	e59d3004 	ldr	r3, [sp, #4]
3000508c:	e59d2014 	ldr	r2, [sp, #20]
30005090:	e5832020 	str	r2, [r3, #32]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005094:	e59d0008 	ldr	r0, [sp, #8]
30005098:	ebfff193 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_SUCCED;
3000509c:	e3a03000 	mov	r3, #0
300050a0:	ea00005b 	b	30005214 <acoral_mutex_pend+0x22c>
	}
	
	/* 互斥量已被占有*/
	/* 这里要看进程是否一个核上的*/
	/* 是一个核上的任务才有可能发生优先级反转*/
	highPrio = (acoral_u8)(evt->count >> 8);
300050a4:	e59d3004 	ldr	r3, [sp, #4]
300050a8:	e593300c 	ldr	r3, [r3, #12]
300050ac:	e1a03443 	asr	r3, r3, #8
300050b0:	e5cd300e 	strb	r3, [sp, #14]
	ownerPrio = (acoral_u8)(evt->count & MUTEX_L_MASK);
300050b4:	e59d3004 	ldr	r3, [sp, #4]
300050b8:	e593300c 	ldr	r3, [r3, #12]
300050bc:	e5cd300f 	strb	r3, [sp, #15]
	thread = (acoral_thread_t*)evt->data;
300050c0:	e59d3004 	ldr	r3, [sp, #4]
300050c4:	e5933020 	ldr	r3, [r3, #32]
300050c8:	e58d3010 	str	r3, [sp, #16]

	if (thread->prio != highPrio&&ownerPrio>cur->prio)
300050cc:	e59d3010 	ldr	r3, [sp, #16]
300050d0:	e5d33005 	ldrb	r3, [r3, #5]
300050d4:	e5dd200e 	ldrb	r2, [sp, #14]
300050d8:	e1520003 	cmp	r2, r3
300050dc:	0a00000e 	beq	3000511c <acoral_mutex_pend+0x134>
300050e0:	e59d3014 	ldr	r3, [sp, #20]
300050e4:	e5d33005 	ldrb	r3, [r3, #5]
300050e8:	e5dd200f 	ldrb	r2, [sp, #15]
300050ec:	e1520003 	cmp	r2, r3
300050f0:	9a000009 	bls	3000511c <acoral_mutex_pend+0x134>
	{
		/*有可能优先级反转，提升拥有者优先级*/
		if(highPrio==0)
300050f4:	e5dd300e 	ldrb	r3, [sp, #14]
300050f8:	e3530000 	cmp	r3, #0
300050fc:	1a000002 	bne	3000510c <acoral_mutex_pend+0x124>
			highPrio=cur->prio;
30005100:	e59d3014 	ldr	r3, [sp, #20]
30005104:	e5d33005 	ldrb	r3, [r3, #5]
30005108:	e5cd300e 	strb	r3, [sp, #14]
		acoral_thread_change_prio(thread,highPrio);
3000510c:	e5dd300e 	ldrb	r3, [sp, #14]
30005110:	e59d0010 	ldr	r0, [sp, #16]
30005114:	e1a01003 	mov	r1, r3
30005118:	ebfff654 	bl	30002a70 <acoral_thread_change_prio>
	}
	/*不需要或不能提高优先级*/
	acoral_unrdy_thread(cur);
3000511c:	e59d0014 	ldr	r0, [sp, #20]
30005120:	ebfff69b 	bl	30002b94 <acoral_unrdy_thread>
	acoral_evt_queue_add(evt,cur);
30005124:	e59d0004 	ldr	r0, [sp, #4]
30005128:	e59d1014 	ldr	r1, [sp, #20]
3000512c:	ebfffed8 	bl	30004c94 <acoral_evt_queue_add>
	if (timeout > 0)
30005130:	e59d3000 	ldr	r3, [sp]
30005134:	e3530000 	cmp	r3, #0
30005138:	0a00000f 	beq	3000517c <acoral_mutex_pend+0x194>
	{
		/*加载到超时队列*/
		cur->delay = TIME_TO_TICKS(timeout);
3000513c:	e59d2000 	ldr	r2, [sp]
30005140:	e1a03002 	mov	r3, r2
30005144:	e1a03103 	lsl	r3, r3, #2
30005148:	e0833002 	add	r3, r3, r2
3000514c:	e1a02103 	lsl	r2, r3, #2
30005150:	e0833002 	add	r3, r3, r2
30005154:	e1a03103 	lsl	r3, r3, #2
30005158:	e1a02003 	mov	r2, r3
3000515c:	e59f30c4 	ldr	r3, [pc, #196]	; 30005228 <acoral_mutex_pend+0x240>
30005160:	e0831392 	umull	r1, r3, r2, r3
30005164:	e1a03323 	lsr	r3, r3, #6
30005168:	e1a02003 	mov	r2, r3
3000516c:	e59d3014 	ldr	r3, [sp, #20]
30005170:	e5832040 	str	r2, [r3, #64]	; 0x40
		timeout_queue_add(cur);
30005174:	e59d0014 	ldr	r0, [sp, #20]
30005178:	ebfffd9a 	bl	300047e8 <timeout_queue_add>
	}
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
3000517c:	e59d0008 	ldr	r0, [sp, #8]
30005180:	ebfff159 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30005184:	ebfff49b 	bl	300023f8 <acoral_sched>
	HAL_ENTER_CRITICAL();
30005188:	ebfff159 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000518c:	e1a03000 	mov	r3, r0
30005190:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	if(evt->data!=cur&&timeout>0&&cur->delay<=0){
30005194:	e59d3004 	ldr	r3, [sp, #4]
30005198:	e5932020 	ldr	r2, [r3, #32]
3000519c:	e59d3014 	ldr	r3, [sp, #20]
300051a0:	e1520003 	cmp	r2, r3
300051a4:	0a00000c 	beq	300051dc <acoral_mutex_pend+0x1f4>
300051a8:	e59d3000 	ldr	r3, [sp]
300051ac:	e3530000 	cmp	r3, #0
300051b0:	0a000009 	beq	300051dc <acoral_mutex_pend+0x1f4>
300051b4:	e59d3014 	ldr	r3, [sp, #20]
300051b8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300051bc:	e3530000 	cmp	r3, #0
300051c0:	ca000005 	bgt	300051dc <acoral_mutex_pend+0x1f4>
		acoral_printk("Time Out Return\n");
		acoral_evt_queue_del(cur);
300051c4:	e59d0014 	ldr	r0, [sp, #20]
300051c8:	ebfffee2 	bl	30004d58 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300051cc:	e59d0008 	ldr	r0, [sp, #8]
300051d0:	ebfff145 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_TIMEOUT;
300051d4:	e3a03007 	mov	r3, #7
300051d8:	ea00000d 	b	30005214 <acoral_mutex_pend+0x22c>
	}

	//---------------
	// modify by pegasus 0804: timeout_queue_del [+]
	timeout_queue_del(cur);
300051dc:	e59d0014 	ldr	r0, [sp, #20]
300051e0:	ebfffdc2 	bl	300048f0 <timeout_queue_del>

	if(evt->data!=cur){
300051e4:	e59d3004 	ldr	r3, [sp, #4]
300051e8:	e5932020 	ldr	r2, [r3, #32]
300051ec:	e59d3014 	ldr	r3, [sp, #20]
300051f0:	e1520003 	cmp	r2, r3
300051f4:	0a000005 	beq	30005210 <acoral_mutex_pend+0x228>
		acoral_printk("Err Ready Return\n");
		acoral_evt_queue_del(cur);
300051f8:	e59d0014 	ldr	r0, [sp, #20]
300051fc:	ebfffed5 	bl	30004d58 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005200:	e59d0008 	ldr	r0, [sp, #8]
30005204:	ebfff138 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_RDY;
30005208:	e3a03008 	mov	r3, #8
3000520c:	ea000000 	b	30005214 <acoral_mutex_pend+0x22c>
	}
	
	return MUTEX_SUCCED;
30005210:	e3a03000 	mov	r3, #0
}
30005214:	e1a00003 	mov	r0, r3
30005218:	e28dd01c 	add	sp, sp, #28
3000521c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30005220:	e12fff1e 	bx	lr
30005224:	300103f8 	.word	0x300103f8
30005228:	10624dd3 	.word	0x10624dd3

3000522c <acoral_mutex_post>:
/*============================
 *  post a mutex to thread
 *     信号量的释放
 *===========================*/
acoral_u32 acoral_mutex_post(acoral_evt_t *evt)
{
3000522c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30005230:	e24dd01c 	sub	sp, sp, #28
30005234:	e58d0004 	str	r0, [sp, #4]
	acoral_u8             ownerPrio;
	acoral_u8             highPrio;
	acoral_thread_t      *thread;
	acoral_thread_t      *cur;

	HAL_ENTER_CRITICAL();
30005238:	ebfff12d 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000523c:	e1a03000 	mov	r3, r0
30005240:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);

	if ( NULL == evt )
30005244:	e59d3004 	ldr	r3, [sp, #4]
30005248:	e3530000 	cmp	r3, #0
3000524c:	1a000005 	bne	30005268 <acoral_mutex_post+0x3c>
	{
		acoral_printerr("mutex NULL\n");
30005250:	e59f0170 	ldr	r0, [pc, #368]	; 300053c8 <acoral_mutex_post+0x19c>
30005254:	eb0017eb 	bl	3000b208 <acoral_print>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30005258:	e59d0008 	ldr	r0, [sp, #8]
3000525c:	ebfff122 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_NULL;   /*error*/
30005260:	e3a03002 	mov	r3, #2
30005264:	ea000053 	b	300053b8 <acoral_mutex_post+0x18c>
	}
	
	highPrio  = (acoral_u8)(evt->count >> 8);
30005268:	e59d3004 	ldr	r3, [sp, #4]
3000526c:	e593300c 	ldr	r3, [r3, #12]
30005270:	e1a03443 	asr	r3, r3, #8
30005274:	e5cd300f 	strb	r3, [sp, #15]
	ownerPrio = (acoral_u8)(evt->count & MUTEX_L_MASK);
30005278:	e59d3004 	ldr	r3, [sp, #4]
3000527c:	e593300c 	ldr	r3, [r3, #12]
30005280:	e5cd300e 	strb	r3, [sp, #14]
	cur=acoral_cur_thread;
30005284:	e59f3140 	ldr	r3, [pc, #320]	; 300053cc <acoral_mutex_post+0x1a0>
30005288:	e5933000 	ldr	r3, [r3]
3000528c:	e58d3014 	str	r3, [sp, #20]
	if (highPrio!=0&&cur->prio != highPrio && cur->prio != ownerPrio )
30005290:	e5dd300f 	ldrb	r3, [sp, #15]
30005294:	e3530000 	cmp	r3, #0
30005298:	0a00000f 	beq	300052dc <acoral_mutex_post+0xb0>
3000529c:	e59d3014 	ldr	r3, [sp, #20]
300052a0:	e5d33005 	ldrb	r3, [r3, #5]
300052a4:	e5dd200f 	ldrb	r2, [sp, #15]
300052a8:	e1520003 	cmp	r2, r3
300052ac:	0a00000a 	beq	300052dc <acoral_mutex_post+0xb0>
300052b0:	e59d3014 	ldr	r3, [sp, #20]
300052b4:	e5d33005 	ldrb	r3, [r3, #5]
300052b8:	e5dd200e 	ldrb	r2, [sp, #14]
300052bc:	e1520003 	cmp	r2, r3
300052c0:	0a000005 	beq	300052dc <acoral_mutex_post+0xb0>
	{
		acoral_printerr("mutex prio err\n");
300052c4:	e59f0104 	ldr	r0, [pc, #260]	; 300053d0 <acoral_mutex_post+0x1a4>
300052c8:	eb0017ce 	bl	3000b208 <acoral_print>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300052cc:	e59d0008 	ldr	r0, [sp, #8]
300052d0:	ebfff105 	bl	300016ec <HAL_INTR_RESTORE>
		return MUTEX_ERR_UNDEF;
300052d4:	e3a03006 	mov	r3, #6
300052d8:	ea000036 	b	300053b8 <acoral_mutex_post+0x18c>
	}
	cur->evt=NULL;	
300052dc:	e59d3014 	ldr	r3, [sp, #20]
300052e0:	e3a02000 	mov	r2, #0
300052e4:	e5832030 	str	r2, [r3, #48]	; 0x30
	if (cur->prio != ownerPrio)
300052e8:	e59d3014 	ldr	r3, [sp, #20]
300052ec:	e5d33005 	ldrb	r3, [r3, #5]
300052f0:	e5dd200e 	ldrb	r2, [sp, #14]
300052f4:	e1520003 	cmp	r2, r3
300052f8:	0a000002 	beq	30005308 <acoral_mutex_post+0xdc>
	{
		/* 提升过优先级，进行优先级复原*/
		acoral_change_prio_self(ownerPrio);
300052fc:	e5dd300e 	ldrb	r3, [sp, #14]
30005300:	e1a00003 	mov	r0, r3
30005304:	ebfff5f8 	bl	30002aec <acoral_change_prio_self>
	}
    
	thread =acoral_evt_high_thread(evt);
30005308:	e59d0004 	ldr	r0, [sp, #4]
3000530c:	ebfffe4c 	bl	30004c44 <acoral_evt_high_thread>
30005310:	e1a03000 	mov	r3, r0
30005314:	e58d3010 	str	r3, [sp, #16]
	if (thread==NULL){
30005318:	e59d3010 	ldr	r3, [sp, #16]
3000531c:	e3530000 	cmp	r3, #0
30005320:	1a00000b 	bne	30005354 <acoral_mutex_post+0x128>
			evt->count |= MUTEX_AVAI;
30005324:	e59d3004 	ldr	r3, [sp, #4]
30005328:	e593300c 	ldr	r3, [r3, #12]
3000532c:	e38320ff 	orr	r2, r3, #255	; 0xff
30005330:	e59d3004 	ldr	r3, [sp, #4]
30005334:	e583200c 	str	r2, [r3, #12]
			evt->data = NULL;
30005338:	e59d3004 	ldr	r3, [sp, #4]
3000533c:	e3a02000 	mov	r2, #0
30005340:	e5832020 	str	r2, [r3, #32]
			acoral_spin_unlock(&evt->spin_lock);
			HAL_EXIT_CRITICAL();
30005344:	e59d0008 	ldr	r0, [sp, #8]
30005348:	ebfff0e7 	bl	300016ec <HAL_INTR_RESTORE>
			return MUTEX_SUCCED;
3000534c:	e3a03000 	mov	r3, #0
30005350:	ea000018 	b	300053b8 <acoral_mutex_post+0x18c>
	}
	timeout_queue_del(thread);
30005354:	e59d0010 	ldr	r0, [sp, #16]
30005358:	ebfffd64 	bl	300048f0 <timeout_queue_del>
	acoral_evt_queue_del(thread);
3000535c:	e59d0010 	ldr	r0, [sp, #16]
30005360:	ebfffe7c 	bl	30004d58 <acoral_evt_queue_del>
#ifdef CFG_TEST
	acoral_print("%d post %d\n",cur->prio,thread->prio);
#endif
	evt->count &= MUTEX_U_MASK;
30005364:	e59d3004 	ldr	r3, [sp, #4]
30005368:	e593300c 	ldr	r3, [r3, #12]
3000536c:	e2032cff 	and	r2, r3, #65280	; 0xff00
30005370:	e59d3004 	ldr	r3, [sp, #4]
30005374:	e583200c 	str	r2, [r3, #12]
	evt->count |= thread->prio;
30005378:	e59d3004 	ldr	r3, [sp, #4]
3000537c:	e593200c 	ldr	r2, [r3, #12]
30005380:	e59d3010 	ldr	r3, [sp, #16]
30005384:	e5d33005 	ldrb	r3, [r3, #5]
30005388:	e1822003 	orr	r2, r2, r3
3000538c:	e59d3004 	ldr	r3, [sp, #4]
30005390:	e583200c 	str	r2, [r3, #12]
	evt->data = thread;
30005394:	e59d3004 	ldr	r3, [sp, #4]
30005398:	e59d2010 	ldr	r2, [sp, #16]
3000539c:	e5832020 	str	r2, [r3, #32]
	acoral_rdy_thread(thread);
300053a0:	e59d0010 	ldr	r0, [sp, #16]
300053a4:	ebfff5eb 	bl	30002b58 <acoral_rdy_thread>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
300053a8:	e59d0008 	ldr	r0, [sp, #8]
300053ac:	ebfff0ce 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
300053b0:	ebfff410 	bl	300023f8 <acoral_sched>
	return MUTEX_SUCCED;
300053b4:	e3a03000 	mov	r3, #0
}
300053b8:	e1a00003 	mov	r0, r3
300053bc:	e28dd01c 	add	sp, sp, #28
300053c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300053c4:	e12fff1e 	bx	lr
300053c8:	3000e3b4 	.word	0x3000e3b4
300053cc:	300103f8 	.word	0x300103f8
300053d0:	3000e3c0 	.word	0x3000e3c0

300053d4 <buddy_scan>:
}acoral_block_ctr_t;

acoral_block_ctr_t *acoral_mem_ctrl;
acoral_block_t *acoral_mem_blocks;

void buddy_scan(){
300053d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300053d8:	e24dd01c 	sub	sp, sp, #28
	acoral_u32 i,k,num,n;	
	acoral_u32 max_level=acoral_mem_ctrl->level;
300053dc:	e59f314c 	ldr	r3, [pc, #332]	; 30005530 <buddy_scan+0x15c>
300053e0:	e5933000 	ldr	r3, [r3]
300053e4:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
300053e8:	e1a03c03 	lsl	r3, r3, #24
300053ec:	e1a03c43 	asr	r3, r3, #24
300053f0:	e58d3014 	str	r3, [sp, #20]
	for(i=0;i<max_level;i++){
300053f4:	e3a03000 	mov	r3, #0
300053f8:	e58d3004 	str	r3, [sp, #4]
300053fc:	ea00003c 	b	300054f4 <buddy_scan+0x120>
		acoral_print("Level%d\r\n",i); 	
30005400:	e59f012c 	ldr	r0, [pc, #300]	; 30005534 <buddy_scan+0x160>
30005404:	e59d1004 	ldr	r1, [sp, #4]
30005408:	eb00177e 	bl	3000b208 <acoral_print>
		acoral_prints("bitmap:"); 	
3000540c:	e59f0124 	ldr	r0, [pc, #292]	; 30005538 <buddy_scan+0x164>
30005410:	eb00179f 	bl	3000b294 <acoral_prints>
		num=acoral_mem_ctrl->num[i];
30005414:	e59f3114 	ldr	r3, [pc, #276]	; 30005530 <buddy_scan+0x15c>
30005418:	e5933000 	ldr	r3, [r3]
3000541c:	e59d2004 	ldr	r2, [sp, #4]
30005420:	e282202a 	add	r2, r2, #42	; 0x2a
30005424:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005428:	e58d300c 	str	r3, [sp, #12]
		for(k=0;k<num;){
3000542c:	e3a03000 	mov	r3, #0
30005430:	e58d3008 	str	r3, [sp, #8]
30005434:	ea00001d 	b	300054b0 <buddy_scan+0xdc>
			for(n=0;n<8&&k<num;n++,k++){
30005438:	e3a03000 	mov	r3, #0
3000543c:	e58d3010 	str	r3, [sp, #16]
30005440:	ea000011 	b	3000548c <buddy_scan+0xb8>
				acoral_print("%x ",acoral_mem_ctrl->bitmap[i][k]); 
30005444:	e59f30e4 	ldr	r3, [pc, #228]	; 30005530 <buddy_scan+0x15c>
30005448:	e5933000 	ldr	r3, [r3]
3000544c:	e59d2004 	ldr	r2, [sp, #4]
30005450:	e282200e 	add	r2, r2, #14
30005454:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005458:	e59d3008 	ldr	r3, [sp, #8]
3000545c:	e1a03103 	lsl	r3, r3, #2
30005460:	e0823003 	add	r3, r2, r3
30005464:	e5933000 	ldr	r3, [r3]
30005468:	e59f00cc 	ldr	r0, [pc, #204]	; 3000553c <buddy_scan+0x168>
3000546c:	e1a01003 	mov	r1, r3
30005470:	eb001764 	bl	3000b208 <acoral_print>
	for(i=0;i<max_level;i++){
		acoral_print("Level%d\r\n",i); 	
		acoral_prints("bitmap:"); 	
		num=acoral_mem_ctrl->num[i];
		for(k=0;k<num;){
			for(n=0;n<8&&k<num;n++,k++){
30005474:	e59d3010 	ldr	r3, [sp, #16]
30005478:	e2833001 	add	r3, r3, #1
3000547c:	e58d3010 	str	r3, [sp, #16]
30005480:	e59d3008 	ldr	r3, [sp, #8]
30005484:	e2833001 	add	r3, r3, #1
30005488:	e58d3008 	str	r3, [sp, #8]
3000548c:	e59d3010 	ldr	r3, [sp, #16]
30005490:	e3530007 	cmp	r3, #7
30005494:	8a000003 	bhi	300054a8 <buddy_scan+0xd4>
30005498:	e59d2008 	ldr	r2, [sp, #8]
3000549c:	e59d300c 	ldr	r3, [sp, #12]
300054a0:	e1520003 	cmp	r2, r3
300054a4:	3affffe6 	bcc	30005444 <buddy_scan+0x70>
				acoral_print("%x ",acoral_mem_ctrl->bitmap[i][k]); 
			}	
			acoral_prints("\r\n"); 	
300054a8:	e59f0090 	ldr	r0, [pc, #144]	; 30005540 <buddy_scan+0x16c>
300054ac:	eb001778 	bl	3000b294 <acoral_prints>
	acoral_u32 max_level=acoral_mem_ctrl->level;
	for(i=0;i<max_level;i++){
		acoral_print("Level%d\r\n",i); 	
		acoral_prints("bitmap:"); 	
		num=acoral_mem_ctrl->num[i];
		for(k=0;k<num;){
300054b0:	e59d2008 	ldr	r2, [sp, #8]
300054b4:	e59d300c 	ldr	r3, [sp, #12]
300054b8:	e1520003 	cmp	r2, r3
300054bc:	3affffdd 	bcc	30005438 <buddy_scan+0x64>
			for(n=0;n<8&&k<num;n++,k++){
				acoral_print("%x ",acoral_mem_ctrl->bitmap[i][k]); 
			}	
			acoral_prints("\r\n"); 	
		}
		acoral_print("Free Block head:%d\r\n",acoral_mem_ctrl->free_cur[i]); 	
300054c0:	e59f3068 	ldr	r3, [pc, #104]	; 30005530 <buddy_scan+0x15c>
300054c4:	e5933000 	ldr	r3, [r3]
300054c8:	e59d2004 	ldr	r2, [sp, #4]
300054cc:	e282201c 	add	r2, r2, #28
300054d0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300054d4:	e59f0068 	ldr	r0, [pc, #104]	; 30005544 <buddy_scan+0x170>
300054d8:	e1a01003 	mov	r1, r3
300054dc:	eb001749 	bl	3000b208 <acoral_print>
		acoral_prints("\r\n"); 	
300054e0:	e59f0058 	ldr	r0, [pc, #88]	; 30005540 <buddy_scan+0x16c>
300054e4:	eb00176a 	bl	3000b294 <acoral_prints>
acoral_block_t *acoral_mem_blocks;

void buddy_scan(){
	acoral_u32 i,k,num,n;	
	acoral_u32 max_level=acoral_mem_ctrl->level;
	for(i=0;i<max_level;i++){
300054e8:	e59d3004 	ldr	r3, [sp, #4]
300054ec:	e2833001 	add	r3, r3, #1
300054f0:	e58d3004 	str	r3, [sp, #4]
300054f4:	e59d2004 	ldr	r2, [sp, #4]
300054f8:	e59d3014 	ldr	r3, [sp, #20]
300054fc:	e1520003 	cmp	r2, r3
30005500:	3affffbe 	bcc	30005400 <buddy_scan+0x2c>
			acoral_prints("\r\n"); 	
		}
		acoral_print("Free Block head:%d\r\n",acoral_mem_ctrl->free_cur[i]); 	
		acoral_prints("\r\n"); 	
	}
	acoral_print("Free Mem Block Number:%d\r\n",acoral_mem_ctrl->free_num); 	
30005504:	e59f3024 	ldr	r3, [pc, #36]	; 30005530 <buddy_scan+0x15c>
30005508:	e5933000 	ldr	r3, [r3]
3000550c:	e59330f0 	ldr	r3, [r3, #240]	; 0xf0
30005510:	e59f0030 	ldr	r0, [pc, #48]	; 30005548 <buddy_scan+0x174>
30005514:	e1a01003 	mov	r1, r3
30005518:	eb00173a 	bl	3000b208 <acoral_print>
	acoral_print("\r\n"); 	
3000551c:	e59f001c 	ldr	r0, [pc, #28]	; 30005540 <buddy_scan+0x16c>
30005520:	eb001738 	bl	3000b208 <acoral_print>
}
30005524:	e28dd01c 	add	sp, sp, #28
30005528:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000552c:	e12fff1e 	bx	lr
30005530:	30010344 	.word	0x30010344
30005534:	3000e3d0 	.word	0x3000e3d0
30005538:	3000e3dc 	.word	0x3000e3dc
3000553c:	3000e3e4 	.word	0x3000e3e4
30005540:	3000e3e8 	.word	0x3000e3e8
30005544:	3000e3ec 	.word	0x3000e3ec
30005548:	3000e404 	.word	0x3000e404

3000554c <buddy_init>:

acoral_err buddy_init(acoral_u32 start_adr,acoral_u32 end_adr){
3000554c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30005550:	e24dd03c 	sub	sp, sp, #60	; 0x3c
30005554:	e58d0004 	str	r0, [sp, #4]
30005558:	e58d1000 	str	r1, [sp]
	acoral_32 i,k;
	acoral_u32 resize_size;
	acoral_u32 save_adr;
	acoral_u32 index;
	acoral_u32 num=1;
3000555c:	e3a03001 	mov	r3, #1
30005560:	e58d3020 	str	r3, [sp, #32]
	acoral_u32 adjust_level=1;
30005564:	e3a03001 	mov	r3, #1
30005568:	e58d3024 	str	r3, [sp, #36]	; 0x24
	acoral_32 level=0;
3000556c:	e3a03000 	mov	r3, #0
30005570:	e58d3028 	str	r3, [sp, #40]	; 0x28
	acoral_u32 max_num,o_num;
	acoral_u32 cur;
	start_adr+=3;
30005574:	e59d3004 	ldr	r3, [sp, #4]
30005578:	e2833003 	add	r3, r3, #3
3000557c:	e58d3004 	str	r3, [sp, #4]
	start_adr&=~(4-1);		
30005580:	e59d3004 	ldr	r3, [sp, #4]
30005584:	e3c33003 	bic	r3, r3, #3
30005588:	e58d3004 	str	r3, [sp, #4]
	end_adr&=~(4-1);		
3000558c:	e59d3000 	ldr	r3, [sp]
30005590:	e3c33003 	bic	r3, r3, #3
30005594:	e58d3000 	str	r3, [sp]
	resize_size=BLOCK_SIZE;
30005598:	e3a03080 	mov	r3, #128	; 0x80
3000559c:	e58d3014 	str	r3, [sp, #20]
	end_adr=end_adr - sizeof(acoral_block_ctr_t);
300055a0:	e59d3000 	ldr	r3, [sp]
300055a4:	e24330fc 	sub	r3, r3, #252	; 0xfc
300055a8:	e58d3000 	str	r3, [sp]
	end_adr&=~(4-1);
300055ac:	e59d3000 	ldr	r3, [sp]
300055b0:	e3c33003 	bic	r3, r3, #3
300055b4:	e58d3000 	str	r3, [sp]
	acoral_mem_ctrl=(acoral_block_ctr_t *)end_adr;
300055b8:	e59d2000 	ldr	r2, [sp]
300055bc:	e59f3720 	ldr	r3, [pc, #1824]	; 30005ce4 <buddy_init+0x798>
300055c0:	e5832000 	str	r2, [r3]
	/*如果内存这么少，不适合分配*/
	if(start_adr>end_adr||end_adr-start_adr<BLOCK_SIZE){
300055c4:	e59d2004 	ldr	r2, [sp, #4]
300055c8:	e59d3000 	ldr	r3, [sp]
300055cc:	e1520003 	cmp	r2, r3
300055d0:	8a000004 	bhi	300055e8 <buddy_init+0x9c>
300055d4:	e59d2000 	ldr	r2, [sp]
300055d8:	e59d3004 	ldr	r3, [sp, #4]
300055dc:	e0633002 	rsb	r3, r3, r2
300055e0:	e353007f 	cmp	r3, #127	; 0x7f
300055e4:	8a000005 	bhi	30005600 <buddy_init+0xb4>
		acoral_mem_ctrl->state=MEM_NO_ALLOC;
300055e8:	e59f36f4 	ldr	r3, [pc, #1780]	; 30005ce4 <buddy_init+0x798>
300055ec:	e5933000 	ldr	r3, [r3]
300055f0:	e3a02000 	mov	r2, #0
300055f4:	e5c320e1 	strb	r2, [r3, #225]	; 0xe1
		return -1;
300055f8:	e3e03000 	mvn	r3, #0
300055fc:	ea0001b4 	b	30005cd4 <buddy_init+0x788>
	}
	acoral_mem_ctrl->state=MEM_OK;
30005600:	e59f36dc 	ldr	r3, [pc, #1756]	; 30005ce4 <buddy_init+0x798>
30005604:	e5933000 	ldr	r3, [r3]
30005608:	e3a02001 	mov	r2, #1
3000560c:	e5c320e1 	strb	r2, [r3, #225]	; 0xe1
	while(1){
		if(end_adr<=start_adr+resize_size)
30005610:	e59d2004 	ldr	r2, [sp, #4]
30005614:	e59d3014 	ldr	r3, [sp, #20]
30005618:	e0822003 	add	r2, r2, r3
3000561c:	e59d3000 	ldr	r3, [sp]
30005620:	e1520003 	cmp	r2, r3
30005624:	3a00000e 	bcc	30005664 <buddy_init+0x118>
			break;
		resize_size=resize_size<<1;
		num=num<<1;
		adjust_level++;
	}
	acoral_mem_blocks=(acoral_block_t *)end_adr-num;
30005628:	e59d2000 	ldr	r2, [sp]
3000562c:	e59d3020 	ldr	r3, [sp, #32]
30005630:	e0633002 	rsb	r3, r3, r2
30005634:	e1a02003 	mov	r2, r3
30005638:	e59f36a8 	ldr	r3, [pc, #1704]	; 30005ce8 <buddy_init+0x79c>
3000563c:	e5832000 	str	r2, [r3]
	save_adr=(acoral_u32)acoral_mem_blocks;
30005640:	e59f36a0 	ldr	r3, [pc, #1696]	; 30005ce8 <buddy_init+0x79c>
30005644:	e5933000 	ldr	r3, [r3]
30005648:	e58d3018 	str	r3, [sp, #24]
	level=adjust_level;
3000564c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30005650:	e58d3028 	str	r3, [sp, #40]	; 0x28
	if(adjust_level>LEVEL)
30005654:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30005658:	e353000e 	cmp	r3, #14
3000565c:	8a00000a 	bhi	3000568c <buddy_init+0x140>
30005660:	ea00000b 	b	30005694 <buddy_init+0x148>
	}
	acoral_mem_ctrl->state=MEM_OK;
	while(1){
		if(end_adr<=start_adr+resize_size)
			break;
		resize_size=resize_size<<1;
30005664:	e59d3014 	ldr	r3, [sp, #20]
30005668:	e1a03083 	lsl	r3, r3, #1
3000566c:	e58d3014 	str	r3, [sp, #20]
		num=num<<1;
30005670:	e59d3020 	ldr	r3, [sp, #32]
30005674:	e1a03083 	lsl	r3, r3, #1
30005678:	e58d3020 	str	r3, [sp, #32]
		adjust_level++;
3000567c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30005680:	e2833001 	add	r3, r3, #1
30005684:	e58d3024 	str	r3, [sp, #36]	; 0x24
	}
30005688:	eaffffe0 	b	30005610 <buddy_init+0xc4>
	acoral_mem_blocks=(acoral_block_t *)end_adr-num;
	save_adr=(acoral_u32)acoral_mem_blocks;
	level=adjust_level;
	if(adjust_level>LEVEL)
		level=LEVEL;
3000568c:	e3a0300e 	mov	r3, #14
30005690:	e58d3028 	str	r3, [sp, #40]	; 0x28
	num=num/32; 
30005694:	e59d3020 	ldr	r3, [sp, #32]
30005698:	e1a032a3 	lsr	r3, r3, #5
3000569c:	e58d3020 	str	r3, [sp, #32]
	for(i=0;i<level-1;i++){
300056a0:	e3a03000 	mov	r3, #0
300056a4:	e58d300c 	str	r3, [sp, #12]
300056a8:	ea00004e 	b	300057e8 <buddy_init+0x29c>
		num=num>>1;
300056ac:	e59d3020 	ldr	r3, [sp, #32]
300056b0:	e1a030a3 	lsr	r3, r3, #1
300056b4:	e58d3020 	str	r3, [sp, #32]
		if(num==0)
300056b8:	e59d3020 	ldr	r3, [sp, #32]
300056bc:	e3530000 	cmp	r3, #0
300056c0:	1a000001 	bne	300056cc <buddy_init+0x180>
			num=1;
300056c4:	e3a03001 	mov	r3, #1
300056c8:	e58d3020 	str	r3, [sp, #32]
		save_adr-=num*4;
300056cc:	e59d3020 	ldr	r3, [sp, #32]
300056d0:	e1a03103 	lsl	r3, r3, #2
300056d4:	e59d2018 	ldr	r2, [sp, #24]
300056d8:	e0633002 	rsb	r3, r3, r2
300056dc:	e58d3018 	str	r3, [sp, #24]
		save_adr&=~(4-1);
300056e0:	e59d3018 	ldr	r3, [sp, #24]
300056e4:	e3c33003 	bic	r3, r3, #3
300056e8:	e58d3018 	str	r3, [sp, #24]
		acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
300056ec:	e59f35f0 	ldr	r3, [pc, #1520]	; 30005ce4 <buddy_init+0x798>
300056f0:	e5933000 	ldr	r3, [r3]
300056f4:	e59d200c 	ldr	r2, [sp, #12]
300056f8:	e59d1018 	ldr	r1, [sp, #24]
300056fc:	e282200e 	add	r2, r2, #14
30005700:	e7831102 	str	r1, [r3, r2, lsl #2]
		acoral_mem_ctrl->num[i]=num;
30005704:	e59f35d8 	ldr	r3, [pc, #1496]	; 30005ce4 <buddy_init+0x798>
30005708:	e5933000 	ldr	r3, [r3]
3000570c:	e59d200c 	ldr	r2, [sp, #12]
30005710:	e282202a 	add	r2, r2, #42	; 0x2a
30005714:	e59d1020 	ldr	r1, [sp, #32]
30005718:	e7831102 	str	r1, [r3, r2, lsl #2]
		save_adr-=num*4;
3000571c:	e59d3020 	ldr	r3, [sp, #32]
30005720:	e1a03103 	lsl	r3, r3, #2
30005724:	e59d2018 	ldr	r2, [sp, #24]
30005728:	e0633002 	rsb	r3, r3, r2
3000572c:	e58d3018 	str	r3, [sp, #24]
		save_adr&=~(4-1);
30005730:	e59d3018 	ldr	r3, [sp, #24]
30005734:	e3c33003 	bic	r3, r3, #3
30005738:	e58d3018 	str	r3, [sp, #24]
		acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
3000573c:	e59f35a0 	ldr	r3, [pc, #1440]	; 30005ce4 <buddy_init+0x798>
30005740:	e5933000 	ldr	r3, [r3]
30005744:	e59d200c 	ldr	r2, [sp, #12]
30005748:	e59d1018 	ldr	r1, [sp, #24]
3000574c:	e7831102 	str	r1, [r3, r2, lsl #2]
		for(k=0;k<num;k++){
30005750:	e3a03000 	mov	r3, #0
30005754:	e58d3010 	str	r3, [sp, #16]
30005758:	ea000015 	b	300057b4 <buddy_init+0x268>
			acoral_mem_ctrl->bitmap[i][k]=0;;
3000575c:	e59f3580 	ldr	r3, [pc, #1408]	; 30005ce4 <buddy_init+0x798>
30005760:	e5933000 	ldr	r3, [r3]
30005764:	e59d200c 	ldr	r2, [sp, #12]
30005768:	e282200e 	add	r2, r2, #14
3000576c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005770:	e59d3010 	ldr	r3, [sp, #16]
30005774:	e1a03103 	lsl	r3, r3, #2
30005778:	e0823003 	add	r3, r2, r3
3000577c:	e3a02000 	mov	r2, #0
30005780:	e5832000 	str	r2, [r3]
			acoral_mem_ctrl->free_list[i][k]=-1;
30005784:	e59f3558 	ldr	r3, [pc, #1368]	; 30005ce4 <buddy_init+0x798>
30005788:	e5933000 	ldr	r3, [r3]
3000578c:	e59d200c 	ldr	r2, [sp, #12]
30005790:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005794:	e59d3010 	ldr	r3, [sp, #16]
30005798:	e1a03103 	lsl	r3, r3, #2
3000579c:	e0823003 	add	r3, r2, r3
300057a0:	e3e02000 	mvn	r2, #0
300057a4:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
		acoral_mem_ctrl->num[i]=num;
		save_adr-=num*4;
		save_adr&=~(4-1);
		acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
		for(k=0;k<num;k++){
300057a8:	e59d3010 	ldr	r3, [sp, #16]
300057ac:	e2833001 	add	r3, r3, #1
300057b0:	e58d3010 	str	r3, [sp, #16]
300057b4:	e59d2010 	ldr	r2, [sp, #16]
300057b8:	e59d3020 	ldr	r3, [sp, #32]
300057bc:	e1520003 	cmp	r2, r3
300057c0:	3affffe5 	bcc	3000575c <buddy_init+0x210>
			acoral_mem_ctrl->bitmap[i][k]=0;;
			acoral_mem_ctrl->free_list[i][k]=-1;
		}
		acoral_mem_ctrl->free_cur[i]=-1;
300057c4:	e59f3518 	ldr	r3, [pc, #1304]	; 30005ce4 <buddy_init+0x798>
300057c8:	e5933000 	ldr	r3, [r3]
300057cc:	e59d200c 	ldr	r2, [sp, #12]
300057d0:	e282201c 	add	r2, r2, #28
300057d4:	e3e01000 	mvn	r1, #0
300057d8:	e7831102 	str	r1, [r3, r2, lsl #2]
	save_adr=(acoral_u32)acoral_mem_blocks;
	level=adjust_level;
	if(adjust_level>LEVEL)
		level=LEVEL;
	num=num/32; 
	for(i=0;i<level-1;i++){
300057dc:	e59d300c 	ldr	r3, [sp, #12]
300057e0:	e2833001 	add	r3, r3, #1
300057e4:	e58d300c 	str	r3, [sp, #12]
300057e8:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
300057ec:	e2432001 	sub	r2, r3, #1
300057f0:	e59d300c 	ldr	r3, [sp, #12]
300057f4:	e1520003 	cmp	r2, r3
300057f8:	caffffab 	bgt	300056ac <buddy_init+0x160>
			acoral_mem_ctrl->bitmap[i][k]=0;;
			acoral_mem_ctrl->free_list[i][k]=-1;
		}
		acoral_mem_ctrl->free_cur[i]=-1;
	}
	if(num==0)
300057fc:	e59d3020 	ldr	r3, [sp, #32]
30005800:	e3530000 	cmp	r3, #0
30005804:	1a000001 	bne	30005810 <buddy_init+0x2c4>
		num=1;
30005808:	e3a03001 	mov	r3, #1
3000580c:	e58d3020 	str	r3, [sp, #32]
	save_adr-=num*4;
30005810:	e59d3020 	ldr	r3, [sp, #32]
30005814:	e1a03103 	lsl	r3, r3, #2
30005818:	e59d2018 	ldr	r2, [sp, #24]
3000581c:	e0633002 	rsb	r3, r3, r2
30005820:	e58d3018 	str	r3, [sp, #24]
	save_adr&=~(4-1);
30005824:	e59d3018 	ldr	r3, [sp, #24]
30005828:	e3c33003 	bic	r3, r3, #3
3000582c:	e58d3018 	str	r3, [sp, #24]
	acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
30005830:	e59f34ac 	ldr	r3, [pc, #1196]	; 30005ce4 <buddy_init+0x798>
30005834:	e5933000 	ldr	r3, [r3]
30005838:	e59d200c 	ldr	r2, [sp, #12]
3000583c:	e59d1018 	ldr	r1, [sp, #24]
30005840:	e282200e 	add	r2, r2, #14
30005844:	e7831102 	str	r1, [r3, r2, lsl #2]
	acoral_mem_ctrl->num[i]=num;
30005848:	e59f3494 	ldr	r3, [pc, #1172]	; 30005ce4 <buddy_init+0x798>
3000584c:	e5933000 	ldr	r3, [r3]
30005850:	e59d200c 	ldr	r2, [sp, #12]
30005854:	e282202a 	add	r2, r2, #42	; 0x2a
30005858:	e59d1020 	ldr	r1, [sp, #32]
3000585c:	e7831102 	str	r1, [r3, r2, lsl #2]
	save_adr-=num*4;
30005860:	e59d3020 	ldr	r3, [sp, #32]
30005864:	e1a03103 	lsl	r3, r3, #2
30005868:	e59d2018 	ldr	r2, [sp, #24]
3000586c:	e0633002 	rsb	r3, r3, r2
30005870:	e58d3018 	str	r3, [sp, #24]
	save_adr&=~(4-1);
30005874:	e59d3018 	ldr	r3, [sp, #24]
30005878:	e3c33003 	bic	r3, r3, #3
3000587c:	e58d3018 	str	r3, [sp, #24]
	acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
30005880:	e59f345c 	ldr	r3, [pc, #1116]	; 30005ce4 <buddy_init+0x798>
30005884:	e5933000 	ldr	r3, [r3]
30005888:	e59d200c 	ldr	r2, [sp, #12]
3000588c:	e59d1018 	ldr	r1, [sp, #24]
30005890:	e7831102 	str	r1, [r3, r2, lsl #2]
	for(k=0;k<num;k++){
30005894:	e3a03000 	mov	r3, #0
30005898:	e58d3010 	str	r3, [sp, #16]
3000589c:	ea000015 	b	300058f8 <buddy_init+0x3ac>
		acoral_mem_ctrl->bitmap[i][k]=0;;
300058a0:	e59f343c 	ldr	r3, [pc, #1084]	; 30005ce4 <buddy_init+0x798>
300058a4:	e5933000 	ldr	r3, [r3]
300058a8:	e59d200c 	ldr	r2, [sp, #12]
300058ac:	e282200e 	add	r2, r2, #14
300058b0:	e7932102 	ldr	r2, [r3, r2, lsl #2]
300058b4:	e59d3010 	ldr	r3, [sp, #16]
300058b8:	e1a03103 	lsl	r3, r3, #2
300058bc:	e0823003 	add	r3, r2, r3
300058c0:	e3a02000 	mov	r2, #0
300058c4:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_list[i][k]=-1;
300058c8:	e59f3414 	ldr	r3, [pc, #1044]	; 30005ce4 <buddy_init+0x798>
300058cc:	e5933000 	ldr	r3, [r3]
300058d0:	e59d200c 	ldr	r2, [sp, #12]
300058d4:	e7932102 	ldr	r2, [r3, r2, lsl #2]
300058d8:	e59d3010 	ldr	r3, [sp, #16]
300058dc:	e1a03103 	lsl	r3, r3, #2
300058e0:	e0823003 	add	r3, r2, r3
300058e4:	e3e02000 	mvn	r2, #0
300058e8:	e5832000 	str	r2, [r3]
	acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
	acoral_mem_ctrl->num[i]=num;
	save_adr-=num*4;
	save_adr&=~(4-1);
	acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
	for(k=0;k<num;k++){
300058ec:	e59d3010 	ldr	r3, [sp, #16]
300058f0:	e2833001 	add	r3, r3, #1
300058f4:	e58d3010 	str	r3, [sp, #16]
300058f8:	e59d2010 	ldr	r2, [sp, #16]
300058fc:	e59d3020 	ldr	r3, [sp, #32]
30005900:	e1520003 	cmp	r2, r3
30005904:	3affffe5 	bcc	300058a0 <buddy_init+0x354>
		acoral_mem_ctrl->bitmap[i][k]=0;;
		acoral_mem_ctrl->free_list[i][k]=-1;
	}
	acoral_mem_ctrl->free_cur[i]=-1;
30005908:	e59f33d4 	ldr	r3, [pc, #980]	; 30005ce4 <buddy_init+0x798>
3000590c:	e5933000 	ldr	r3, [r3]
30005910:	e59d200c 	ldr	r2, [sp, #12]
30005914:	e282201c 	add	r2, r2, #28
30005918:	e3e01000 	mvn	r1, #0
3000591c:	e7831102 	str	r1, [r3, r2, lsl #2]

	/*如果减去刚才bitmap用的内存刚好是下一level*/
	if(save_adr<=(start_adr+(resize_size>>1)))
30005920:	e59d3014 	ldr	r3, [sp, #20]
30005924:	e1a020a3 	lsr	r2, r3, #1
30005928:	e59d3004 	ldr	r3, [sp, #4]
3000592c:	e0822003 	add	r2, r2, r3
30005930:	e59d3018 	ldr	r3, [sp, #24]
30005934:	e1520003 	cmp	r2, r3
30005938:	3a000002 	bcc	30005948 <buddy_init+0x3fc>
		adjust_level--;
3000593c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30005940:	e2433001 	sub	r3, r3, #1
30005944:	e58d3024 	str	r3, [sp, #36]	; 0x24
	if(adjust_level>LEVEL)
30005948:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000594c:	e353000e 	cmp	r3, #14
30005950:	9a000001 	bls	3000595c <buddy_init+0x410>
		level=LEVEL;
30005954:	e3a0300e 	mov	r3, #14
30005958:	e58d3028 	str	r3, [sp, #40]	; 0x28
	acoral_mem_ctrl->level=level;
3000595c:	e59f3380 	ldr	r3, [pc, #896]	; 30005ce4 <buddy_init+0x798>
30005960:	e5933000 	ldr	r3, [r3]
30005964:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005968:	e20220ff 	and	r2, r2, #255	; 0xff
3000596c:	e5c320e0 	strb	r2, [r3, #224]	; 0xe0
	acoral_mem_ctrl->start_adr=start_adr;
30005970:	e59f336c 	ldr	r3, [pc, #876]	; 30005ce4 <buddy_init+0x798>
30005974:	e5933000 	ldr	r3, [r3]
30005978:	e59d2004 	ldr	r2, [sp, #4]
3000597c:	e58320e4 	str	r2, [r3, #228]	; 0xe4
	num=(save_adr-start_adr)>>BLOCK_SHIFT;
30005980:	e59d2018 	ldr	r2, [sp, #24]
30005984:	e59d3004 	ldr	r3, [sp, #4]
30005988:	e0633002 	rsb	r3, r3, r2
3000598c:	e1a033a3 	lsr	r3, r3, #7
30005990:	e58d3020 	str	r3, [sp, #32]
	acoral_mem_ctrl->end_adr=start_adr+(num<<BLOCK_SHIFT);
30005994:	e59f3348 	ldr	r3, [pc, #840]	; 30005ce4 <buddy_init+0x798>
30005998:	e5933000 	ldr	r3, [r3]
3000599c:	e59d2020 	ldr	r2, [sp, #32]
300059a0:	e1a01382 	lsl	r1, r2, #7
300059a4:	e59d2004 	ldr	r2, [sp, #4]
300059a8:	e0812002 	add	r2, r1, r2
300059ac:	e58320e8 	str	r2, [r3, #232]	; 0xe8
	acoral_mem_ctrl->block_num=num;
300059b0:	e59f332c 	ldr	r3, [pc, #812]	; 30005ce4 <buddy_init+0x798>
300059b4:	e5933000 	ldr	r3, [r3]
300059b8:	e59d2020 	ldr	r2, [sp, #32]
300059bc:	e58320ec 	str	r2, [r3, #236]	; 0xec
	acoral_mem_ctrl->free_num=num;
300059c0:	e59f331c 	ldr	r3, [pc, #796]	; 30005ce4 <buddy_init+0x798>
300059c4:	e5933000 	ldr	r3, [r3]
300059c8:	e59d2020 	ldr	r2, [sp, #32]
300059cc:	e58320f0 	str	r2, [r3, #240]	; 0xf0
	acoral_mem_ctrl->block_size=BLOCK_SIZE;
300059d0:	e59f330c 	ldr	r3, [pc, #780]	; 30005ce4 <buddy_init+0x798>
300059d4:	e5933000 	ldr	r3, [r3]
300059d8:	e3a02080 	mov	r2, #128	; 0x80
300059dc:	e58320f4 	str	r2, [r3, #244]	; 0xf4

	i=0;
300059e0:	e3a03000 	mov	r3, #0
300059e4:	e58d300c 	str	r3, [sp, #12]
	max_num=1<<level-1;
300059e8:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
300059ec:	e2433001 	sub	r3, r3, #1
300059f0:	e3a02001 	mov	r2, #1
300059f4:	e1a03312 	lsl	r3, r2, r3
300059f8:	e58d302c 	str	r3, [sp, #44]	; 0x2c
	o_num=0;
300059fc:	e3a03000 	mov	r3, #0
30005a00:	e58d3030 	str	r3, [sp, #48]	; 0x30
	if(num>0)
30005a04:	e59d3020 	ldr	r3, [sp, #32]
30005a08:	e3530000 	cmp	r3, #0
30005a0c:	0a000007 	beq	30005a30 <buddy_init+0x4e4>
		acoral_mem_ctrl->free_cur[level-1]=0;
30005a10:	e59f32cc 	ldr	r3, [pc, #716]	; 30005ce4 <buddy_init+0x798>
30005a14:	e5933000 	ldr	r3, [r3]
30005a18:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005a1c:	e2422001 	sub	r2, r2, #1
30005a20:	e282201c 	add	r2, r2, #28
30005a24:	e3a01000 	mov	r1, #0
30005a28:	e7831102 	str	r1, [r3, r2, lsl #2]
	else
		acoral_mem_ctrl->free_cur[level-1]=-1;

	while(num>=max_num*32){
30005a2c:	ea00002a 	b	30005adc <buddy_init+0x590>
	max_num=1<<level-1;
	o_num=0;
	if(num>0)
		acoral_mem_ctrl->free_cur[level-1]=0;
	else
		acoral_mem_ctrl->free_cur[level-1]=-1;
30005a30:	e59f32ac 	ldr	r3, [pc, #684]	; 30005ce4 <buddy_init+0x798>
30005a34:	e5933000 	ldr	r3, [r3]
30005a38:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005a3c:	e2422001 	sub	r2, r2, #1
30005a40:	e282201c 	add	r2, r2, #28
30005a44:	e3e01000 	mvn	r1, #0
30005a48:	e7831102 	str	r1, [r3, r2, lsl #2]

	while(num>=max_num*32){
30005a4c:	ea000022 	b	30005adc <buddy_init+0x590>
		acoral_mem_ctrl->bitmap[level-1][i]=-1;;
30005a50:	e59f328c 	ldr	r3, [pc, #652]	; 30005ce4 <buddy_init+0x798>
30005a54:	e5933000 	ldr	r3, [r3]
30005a58:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005a5c:	e2422001 	sub	r2, r2, #1
30005a60:	e282200e 	add	r2, r2, #14
30005a64:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005a68:	e59d300c 	ldr	r3, [sp, #12]
30005a6c:	e1a03103 	lsl	r3, r3, #2
30005a70:	e0823003 	add	r3, r2, r3
30005a74:	e3e02000 	mvn	r2, #0
30005a78:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_list[level-1][i]=i+1;
30005a7c:	e59f3260 	ldr	r3, [pc, #608]	; 30005ce4 <buddy_init+0x798>
30005a80:	e5933000 	ldr	r3, [r3]
30005a84:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005a88:	e2422001 	sub	r2, r2, #1
30005a8c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005a90:	e59d300c 	ldr	r3, [sp, #12]
30005a94:	e1a03103 	lsl	r3, r3, #2
30005a98:	e0823003 	add	r3, r2, r3
30005a9c:	e59d200c 	ldr	r2, [sp, #12]
30005aa0:	e2822001 	add	r2, r2, #1
30005aa4:	e5832000 	str	r2, [r3]
		num-=max_num*32;
30005aa8:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005aac:	e1a03283 	lsl	r3, r3, #5
30005ab0:	e59d2020 	ldr	r2, [sp, #32]
30005ab4:	e0633002 	rsb	r3, r3, r2
30005ab8:	e58d3020 	str	r3, [sp, #32]
		o_num+=max_num*32;
30005abc:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005ac0:	e1a03283 	lsl	r3, r3, #5
30005ac4:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005ac8:	e0823003 	add	r3, r2, r3
30005acc:	e58d3030 	str	r3, [sp, #48]	; 0x30
		i++;
30005ad0:	e59d300c 	ldr	r3, [sp, #12]
30005ad4:	e2833001 	add	r3, r3, #1
30005ad8:	e58d300c 	str	r3, [sp, #12]
	if(num>0)
		acoral_mem_ctrl->free_cur[level-1]=0;
	else
		acoral_mem_ctrl->free_cur[level-1]=-1;

	while(num>=max_num*32){
30005adc:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005ae0:	e1a02283 	lsl	r2, r3, #5
30005ae4:	e59d3020 	ldr	r3, [sp, #32]
30005ae8:	e1520003 	cmp	r2, r3
30005aec:	9affffd7 	bls	30005a50 <buddy_init+0x504>
		acoral_mem_ctrl->free_list[level-1][i]=i+1;
		num-=max_num*32;
		o_num+=max_num*32;
		i++;
	}
	if(num==0)
30005af0:	e59d3020 	ldr	r3, [sp, #32]
30005af4:	e3530000 	cmp	r3, #0
30005af8:	1a000021 	bne	30005b84 <buddy_init+0x638>
		acoral_mem_ctrl->free_list[level-1][i-1]=-1;
30005afc:	e59f31e0 	ldr	r3, [pc, #480]	; 30005ce4 <buddy_init+0x798>
30005b00:	e5933000 	ldr	r3, [r3]
30005b04:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005b08:	e2422001 	sub	r2, r2, #1
30005b0c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005b10:	e59d300c 	ldr	r3, [sp, #12]
30005b14:	e2433001 	sub	r3, r3, #1
30005b18:	e1a03103 	lsl	r3, r3, #2
30005b1c:	e0823003 	add	r3, r2, r3
30005b20:	e3e02000 	mvn	r2, #0
30005b24:	e5832000 	str	r2, [r3]
	while(num>=max_num){
30005b28:	ea000015 	b	30005b84 <buddy_init+0x638>
		index=o_num>>level-1;
30005b2c:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005b30:	e2433001 	sub	r3, r3, #1
30005b34:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005b38:	e1a03332 	lsr	r3, r2, r3
30005b3c:	e58d301c 	str	r3, [sp, #28]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
30005b40:	e59f319c 	ldr	r3, [pc, #412]	; 30005ce4 <buddy_init+0x798>
30005b44:	e5933000 	ldr	r3, [r3]
30005b48:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005b4c:	e2422001 	sub	r2, r2, #1
30005b50:	e282200e 	add	r2, r2, #14
30005b54:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005b58:	e59d001c 	ldr	r0, [sp, #28]
30005b5c:	e1a01003 	mov	r1, r3
30005b60:	eb001034 	bl	30009c38 <acoral_set_bit>
		num-=max_num;
30005b64:	e59d2020 	ldr	r2, [sp, #32]
30005b68:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005b6c:	e0633002 	rsb	r3, r3, r2
30005b70:	e58d3020 	str	r3, [sp, #32]
		o_num+=max_num;
30005b74:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005b78:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005b7c:	e0823003 	add	r3, r2, r3
30005b80:	e58d3030 	str	r3, [sp, #48]	; 0x30
		o_num+=max_num*32;
		i++;
	}
	if(num==0)
		acoral_mem_ctrl->free_list[level-1][i-1]=-1;
	while(num>=max_num){
30005b84:	e59d2020 	ldr	r2, [sp, #32]
30005b88:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005b8c:	e1520003 	cmp	r2, r3
30005b90:	2affffe5 	bcs	30005b2c <buddy_init+0x5e0>
		index=o_num>>level-1;
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
		num-=max_num;
		o_num+=max_num;
	}
	acoral_mem_ctrl->free_list[level-1][i]=-1;
30005b94:	e59f3148 	ldr	r3, [pc, #328]	; 30005ce4 <buddy_init+0x798>
30005b98:	e5933000 	ldr	r3, [r3]
30005b9c:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005ba0:	e2422001 	sub	r2, r2, #1
30005ba4:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005ba8:	e59d300c 	ldr	r3, [sp, #12]
30005bac:	e1a03103 	lsl	r3, r3, #2
30005bb0:	e0823003 	add	r3, r2, r3
30005bb4:	e3e02000 	mvn	r2, #0
30005bb8:	e5832000 	str	r2, [r3]

	
	while(--level>0){
30005bbc:	ea00003b 	b	30005cb0 <buddy_init+0x764>
		index=o_num>>level;
30005bc0:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005bc4:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005bc8:	e1a03332 	lsr	r3, r2, r3
30005bcc:	e58d301c 	str	r3, [sp, #28]
		if(num==0)
30005bd0:	e59d3020 	ldr	r3, [sp, #32]
30005bd4:	e3530000 	cmp	r3, #0
30005bd8:	0a00003b 	beq	30005ccc <buddy_init+0x780>
			break;
		cur=index/32;
30005bdc:	e59d301c 	ldr	r3, [sp, #28]
30005be0:	e1a032a3 	lsr	r3, r3, #5
30005be4:	e58d3034 	str	r3, [sp, #52]	; 0x34
		max_num=1<<level-1;
30005be8:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005bec:	e2433001 	sub	r3, r3, #1
30005bf0:	e3a02001 	mov	r2, #1
30005bf4:	e1a03312 	lsl	r3, r2, r3
30005bf8:	e58d302c 	str	r3, [sp, #44]	; 0x2c
		if(num>=max_num){
30005bfc:	e59d2020 	ldr	r2, [sp, #32]
30005c00:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005c04:	e1520003 	cmp	r2, r3
30005c08:	3a000028 	bcc	30005cb0 <buddy_init+0x764>
			acoral_mem_blocks[BLOCK_INDEX(o_num)].level=-1;	
30005c0c:	e59f30d4 	ldr	r3, [pc, #212]	; 30005ce8 <buddy_init+0x79c>
30005c10:	e5932000 	ldr	r2, [r3]
30005c14:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
30005c18:	e1a030a3 	lsr	r3, r3, #1
30005c1c:	e0823003 	add	r3, r2, r3
30005c20:	e3e02000 	mvn	r2, #0
30005c24:	e5c32000 	strb	r2, [r3]
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
30005c28:	e59f30b4 	ldr	r3, [pc, #180]	; 30005ce4 <buddy_init+0x798>
30005c2c:	e5933000 	ldr	r3, [r3]
30005c30:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005c34:	e2422001 	sub	r2, r2, #1
30005c38:	e282200e 	add	r2, r2, #14
30005c3c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005c40:	e59d001c 	ldr	r0, [sp, #28]
30005c44:	e1a01003 	mov	r1, r3
30005c48:	eb000ffa 	bl	30009c38 <acoral_set_bit>
			acoral_mem_ctrl->free_list[level-1][cur]=-1;	
30005c4c:	e59f3090 	ldr	r3, [pc, #144]	; 30005ce4 <buddy_init+0x798>
30005c50:	e5933000 	ldr	r3, [r3]
30005c54:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005c58:	e2422001 	sub	r2, r2, #1
30005c5c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005c60:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
30005c64:	e1a03103 	lsl	r3, r3, #2
30005c68:	e0823003 	add	r3, r2, r3
30005c6c:	e3e02000 	mvn	r2, #0
30005c70:	e5832000 	str	r2, [r3]
			acoral_mem_ctrl->free_cur[level-1]=cur;	
30005c74:	e59f3068 	ldr	r3, [pc, #104]	; 30005ce4 <buddy_init+0x798>
30005c78:	e5933000 	ldr	r3, [r3]
30005c7c:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
30005c80:	e2422001 	sub	r2, r2, #1
30005c84:	e59d1034 	ldr	r1, [sp, #52]	; 0x34
30005c88:	e282201c 	add	r2, r2, #28
30005c8c:	e7831102 	str	r1, [r3, r2, lsl #2]
			o_num+=max_num;
30005c90:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
30005c94:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005c98:	e0823003 	add	r3, r2, r3
30005c9c:	e58d3030 	str	r3, [sp, #48]	; 0x30
			num-=max_num;
30005ca0:	e59d2020 	ldr	r2, [sp, #32]
30005ca4:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
30005ca8:	e0633002 	rsb	r3, r3, r2
30005cac:	e58d3020 	str	r3, [sp, #32]
		o_num+=max_num;
	}
	acoral_mem_ctrl->free_list[level-1][i]=-1;

	
	while(--level>0){
30005cb0:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005cb4:	e2433001 	sub	r3, r3, #1
30005cb8:	e58d3028 	str	r3, [sp, #40]	; 0x28
30005cbc:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
30005cc0:	e3530000 	cmp	r3, #0
30005cc4:	caffffbd 	bgt	30005bc0 <buddy_init+0x674>
30005cc8:	ea000000 	b	30005cd0 <buddy_init+0x784>
		index=o_num>>level;
		if(num==0)
			break;
30005ccc:	e1a00000 	nop			; (mov r0, r0)
			o_num+=max_num;
			num-=max_num;
		}
	}
	acoral_spin_init(&acoral_mem_ctrl->lock);
	return 0;
30005cd0:	e3a03000 	mov	r3, #0
}
30005cd4:	e1a00003 	mov	r0, r3
30005cd8:	e28dd03c 	add	sp, sp, #60	; 0x3c
30005cdc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30005ce0:	e12fff1e 	bx	lr
30005ce4:	30010344 	.word	0x30010344
30005ce8:	3000fa98 	.word	0x3000fa98

30005cec <recus_malloc>:

static acoral_32 recus_malloc(level){
30005cec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30005cf0:	e24dd01c 	sub	sp, sp, #28
30005cf4:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 index;
	acoral_32 cur;
	acoral_32 num;
	if(level>=acoral_mem_ctrl->level)
30005cf8:	e59f328c 	ldr	r3, [pc, #652]	; 30005f8c <recus_malloc+0x2a0>
30005cfc:	e5933000 	ldr	r3, [r3]
30005d00:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30005d04:	e1a03c03 	lsl	r3, r3, #24
30005d08:	e1a02c43 	asr	r2, r3, #24
30005d0c:	e59d3004 	ldr	r3, [sp, #4]
30005d10:	e1520003 	cmp	r2, r3
30005d14:	ca000001 	bgt	30005d20 <recus_malloc+0x34>
		return -1;
30005d18:	e3e03000 	mvn	r3, #0
30005d1c:	ea000096 	b	30005f7c <recus_malloc+0x290>
	cur=acoral_mem_ctrl->free_cur[level];
30005d20:	e59f3264 	ldr	r3, [pc, #612]	; 30005f8c <recus_malloc+0x2a0>
30005d24:	e5933000 	ldr	r3, [r3]
30005d28:	e59d2004 	ldr	r2, [sp, #4]
30005d2c:	e282201c 	add	r2, r2, #28
30005d30:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005d34:	e58d3010 	str	r3, [sp, #16]
	if(cur<0){
30005d38:	e59d3010 	ldr	r3, [sp, #16]
30005d3c:	e3530000 	cmp	r3, #0
30005d40:	aa00002b 	bge	30005df4 <recus_malloc+0x108>
		num=recus_malloc(level+1);
30005d44:	e59d3004 	ldr	r3, [sp, #4]
30005d48:	e2833001 	add	r3, r3, #1
30005d4c:	e1a00003 	mov	r0, r3
30005d50:	ebffffe5 	bl	30005cec <recus_malloc>
30005d54:	e1a03000 	mov	r3, r0
30005d58:	e58d3014 	str	r3, [sp, #20]
		if(num<0)
30005d5c:	e59d3014 	ldr	r3, [sp, #20]
30005d60:	e3530000 	cmp	r3, #0
30005d64:	aa000001 	bge	30005d70 <recus_malloc+0x84>
			return -1;
30005d68:	e3e03000 	mvn	r3, #0
30005d6c:	ea000082 	b	30005f7c <recus_malloc+0x290>
		index=num>>level+1;
30005d70:	e59d3004 	ldr	r3, [sp, #4]
30005d74:	e2833001 	add	r3, r3, #1
30005d78:	e59d2014 	ldr	r2, [sp, #20]
30005d7c:	e1a03352 	asr	r3, r2, r3
30005d80:	e58d300c 	str	r3, [sp, #12]
		cur=index/32;
30005d84:	e59d300c 	ldr	r3, [sp, #12]
30005d88:	e1a032a3 	lsr	r3, r3, #5
30005d8c:	e58d3010 	str	r3, [sp, #16]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
30005d90:	e59f31f4 	ldr	r3, [pc, #500]	; 30005f8c <recus_malloc+0x2a0>
30005d94:	e5933000 	ldr	r3, [r3]
30005d98:	e59d2004 	ldr	r2, [sp, #4]
30005d9c:	e282200e 	add	r2, r2, #14
30005da0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005da4:	e59d000c 	ldr	r0, [sp, #12]
30005da8:	e1a01003 	mov	r1, r3
30005dac:	eb000fa1 	bl	30009c38 <acoral_set_bit>
		acoral_mem_ctrl->free_list[level][cur]=-1;
30005db0:	e59f31d4 	ldr	r3, [pc, #468]	; 30005f8c <recus_malloc+0x2a0>
30005db4:	e5933000 	ldr	r3, [r3]
30005db8:	e59d2004 	ldr	r2, [sp, #4]
30005dbc:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005dc0:	e59d3010 	ldr	r3, [sp, #16]
30005dc4:	e1a03103 	lsl	r3, r3, #2
30005dc8:	e0823003 	add	r3, r2, r3
30005dcc:	e3e02000 	mvn	r2, #0
30005dd0:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_cur[level]=cur;
30005dd4:	e59f31b0 	ldr	r3, [pc, #432]	; 30005f8c <recus_malloc+0x2a0>
30005dd8:	e5933000 	ldr	r3, [r3]
30005ddc:	e59d2004 	ldr	r2, [sp, #4]
30005de0:	e282201c 	add	r2, r2, #28
30005de4:	e59d1010 	ldr	r1, [sp, #16]
30005de8:	e7831102 	str	r1, [r3, r2, lsl #2]
		return num;
30005dec:	e59d3014 	ldr	r3, [sp, #20]
30005df0:	ea000061 	b	30005f7c <recus_malloc+0x290>
	}
	index=acoral_ffs(acoral_mem_ctrl->bitmap[level][cur]);
30005df4:	e59f3190 	ldr	r3, [pc, #400]	; 30005f8c <recus_malloc+0x2a0>
30005df8:	e5933000 	ldr	r3, [r3]
30005dfc:	e59d2004 	ldr	r2, [sp, #4]
30005e00:	e282200e 	add	r2, r2, #14
30005e04:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005e08:	e59d3010 	ldr	r3, [sp, #16]
30005e0c:	e1a03103 	lsl	r3, r3, #2
30005e10:	e0823003 	add	r3, r2, r3
30005e14:	e5933000 	ldr	r3, [r3]
30005e18:	e1a00003 	mov	r0, r3
30005e1c:	eb000f2a 	bl	30009acc <acoral_ffs>
30005e20:	e1a03000 	mov	r3, r0
30005e24:	e58d300c 	str	r3, [sp, #12]
	index=cur*32+index;
30005e28:	e59d3010 	ldr	r3, [sp, #16]
30005e2c:	e1a03283 	lsl	r3, r3, #5
30005e30:	e59d200c 	ldr	r2, [sp, #12]
30005e34:	e0823003 	add	r3, r2, r3
30005e38:	e58d300c 	str	r3, [sp, #12]
	acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
30005e3c:	e59f3148 	ldr	r3, [pc, #328]	; 30005f8c <recus_malloc+0x2a0>
30005e40:	e5933000 	ldr	r3, [r3]
30005e44:	e59d2004 	ldr	r2, [sp, #4]
30005e48:	e282200e 	add	r2, r2, #14
30005e4c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005e50:	e59d000c 	ldr	r0, [sp, #12]
30005e54:	e1a01003 	mov	r1, r3
30005e58:	eb000f8e 	bl	30009c98 <acoral_clear_bit>
	if(acoral_mem_ctrl->bitmap[level][cur]==0)
30005e5c:	e59f3128 	ldr	r3, [pc, #296]	; 30005f8c <recus_malloc+0x2a0>
30005e60:	e5933000 	ldr	r3, [r3]
30005e64:	e59d2004 	ldr	r2, [sp, #4]
30005e68:	e282200e 	add	r2, r2, #14
30005e6c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30005e70:	e59d3010 	ldr	r3, [sp, #16]
30005e74:	e1a03103 	lsl	r3, r3, #2
30005e78:	e0823003 	add	r3, r2, r3
30005e7c:	e5933000 	ldr	r3, [r3]
30005e80:	e3530000 	cmp	r3, #0
30005e84:	1a00000c 	bne	30005ebc <recus_malloc+0x1d0>
		acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];
30005e88:	e59f30fc 	ldr	r3, [pc, #252]	; 30005f8c <recus_malloc+0x2a0>
30005e8c:	e5933000 	ldr	r3, [r3]
30005e90:	e59d2004 	ldr	r2, [sp, #4]
30005e94:	e59f10f0 	ldr	r1, [pc, #240]	; 30005f8c <recus_malloc+0x2a0>
30005e98:	e5911000 	ldr	r1, [r1]
30005e9c:	e59d0004 	ldr	r0, [sp, #4]
30005ea0:	e7910100 	ldr	r0, [r1, r0, lsl #2]
30005ea4:	e59d1010 	ldr	r1, [sp, #16]
30005ea8:	e1a01101 	lsl	r1, r1, #2
30005eac:	e0801001 	add	r1, r0, r1
30005eb0:	e5911000 	ldr	r1, [r1]
30005eb4:	e282201c 	add	r2, r2, #28
30005eb8:	e7831102 	str	r1, [r3, r2, lsl #2]
	num=index<<level+1;
30005ebc:	e59d3004 	ldr	r3, [sp, #4]
30005ec0:	e2833001 	add	r3, r3, #1
30005ec4:	e59d200c 	ldr	r2, [sp, #12]
30005ec8:	e1a03312 	lsl	r3, r2, r3
30005ecc:	e58d3014 	str	r3, [sp, #20]
	/*最高level情况*/
	if(level==acoral_mem_ctrl->level-1){
30005ed0:	e59f30b4 	ldr	r3, [pc, #180]	; 30005f8c <recus_malloc+0x2a0>
30005ed4:	e5933000 	ldr	r3, [r3]
30005ed8:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30005edc:	e1a03c03 	lsl	r3, r3, #24
30005ee0:	e1a03c43 	asr	r3, r3, #24
30005ee4:	e2432001 	sub	r2, r3, #1
30005ee8:	e59d3004 	ldr	r3, [sp, #4]
30005eec:	e1520003 	cmp	r2, r3
30005ef0:	1a000010 	bne	30005f38 <recus_malloc+0x24c>
		if((num>>1)+(1<<level)>acoral_mem_ctrl->block_num)
30005ef4:	e59d3014 	ldr	r3, [sp, #20]
30005ef8:	e1a020c3 	asr	r2, r3, #1
30005efc:	e3a01001 	mov	r1, #1
30005f00:	e59d3004 	ldr	r3, [sp, #4]
30005f04:	e1a03311 	lsl	r3, r1, r3
30005f08:	e0823003 	add	r3, r2, r3
30005f0c:	e1a02003 	mov	r2, r3
30005f10:	e59f3074 	ldr	r3, [pc, #116]	; 30005f8c <recus_malloc+0x2a0>
30005f14:	e5933000 	ldr	r3, [r3]
30005f18:	e59330ec 	ldr	r3, [r3, #236]	; 0xec
30005f1c:	e1520003 	cmp	r2, r3
30005f20:	9a000001 	bls	30005f2c <recus_malloc+0x240>
			return -1;
30005f24:	e3e03000 	mvn	r3, #0
30005f28:	ea000013 	b	30005f7c <recus_malloc+0x290>
		return num>>1;
30005f2c:	e59d3014 	ldr	r3, [sp, #20]
30005f30:	e1a030c3 	asr	r3, r3, #1
30005f34:	ea000010 	b	30005f7c <recus_malloc+0x290>
	}
	if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
30005f38:	e59f3050 	ldr	r3, [pc, #80]	; 30005f90 <recus_malloc+0x2a4>
30005f3c:	e5932000 	ldr	r2, [r3]
30005f40:	e59d3014 	ldr	r3, [sp, #20]
30005f44:	e1a030c3 	asr	r3, r3, #1
30005f48:	e0823003 	add	r3, r2, r3
30005f4c:	e5d33000 	ldrb	r3, [r3]
30005f50:	e1a03c03 	lsl	r3, r3, #24
30005f54:	e1a03c43 	asr	r3, r3, #24
30005f58:	e3530000 	cmp	r3, #0
30005f5c:	ba000005 	blt	30005f78 <recus_malloc+0x28c>
		return num+(1<<level);
30005f60:	e3a02001 	mov	r2, #1
30005f64:	e59d3004 	ldr	r3, [sp, #4]
30005f68:	e1a02312 	lsl	r2, r2, r3
30005f6c:	e59d3014 	ldr	r3, [sp, #20]
30005f70:	e0823003 	add	r3, r2, r3
30005f74:	ea000000 	b	30005f7c <recus_malloc+0x290>
	else
		return num;
30005f78:	e59d3014 	ldr	r3, [sp, #20]
}
30005f7c:	e1a00003 	mov	r0, r3
30005f80:	e28dd01c 	add	sp, sp, #28
30005f84:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30005f88:	e12fff1e 	bx	lr
30005f8c:	30010344 	.word	0x30010344
30005f90:	3000fa98 	.word	0x3000fa98

30005f94 <r_malloc>:

static void *r_malloc(acoral_u8 level){
30005f94:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30005f98:	e24dd01c 	sub	sp, sp, #28
30005f9c:	e1a03000 	mov	r3, r0
30005fa0:	e5cd3007 	strb	r3, [sp, #7]
	acoral_sr cpu_sr;
	acoral_u32 index;
	acoral_32 num,cur;
	HAL_ENTER_CRITICAL();
30005fa4:	ebffedd2 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30005fa8:	e1a03000 	mov	r3, r0
30005fac:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&acoral_mem_ctrl->lock);
	acoral_mem_ctrl->free_num-=1<<level;
30005fb0:	e59f3334 	ldr	r3, [pc, #820]	; 300062ec <r_malloc+0x358>
30005fb4:	e5933000 	ldr	r3, [r3]
30005fb8:	e59f232c 	ldr	r2, [pc, #812]	; 300062ec <r_malloc+0x358>
30005fbc:	e5922000 	ldr	r2, [r2]
30005fc0:	e59210f0 	ldr	r1, [r2, #240]	; 0xf0
30005fc4:	e5dd2007 	ldrb	r2, [sp, #7]
30005fc8:	e3a00001 	mov	r0, #1
30005fcc:	e1a02210 	lsl	r2, r0, r2
30005fd0:	e0622001 	rsb	r2, r2, r1
30005fd4:	e58320f0 	str	r2, [r3, #240]	; 0xf0
	cur=acoral_mem_ctrl->free_cur[level];
30005fd8:	e59f330c 	ldr	r3, [pc, #780]	; 300062ec <r_malloc+0x358>
30005fdc:	e5933000 	ldr	r3, [r3]
30005fe0:	e5dd2007 	ldrb	r2, [sp, #7]
30005fe4:	e282201c 	add	r2, r2, #28
30005fe8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30005fec:	e58d3014 	str	r3, [sp, #20]
	if(cur<0){
30005ff0:	e59d3014 	ldr	r3, [sp, #20]
30005ff4:	e3530000 	cmp	r3, #0
30005ff8:	aa00003f 	bge	300060fc <r_malloc+0x168>
		num=recus_malloc(level+1);
30005ffc:	e5dd3007 	ldrb	r3, [sp, #7]
30006000:	e2833001 	add	r3, r3, #1
30006004:	e1a00003 	mov	r0, r3
30006008:	ebffff37 	bl	30005cec <recus_malloc>
3000600c:	e1a03000 	mov	r3, r0
30006010:	e58d3010 	str	r3, [sp, #16]
		if(num<0){
30006014:	e59d3010 	ldr	r3, [sp, #16]
30006018:	e3530000 	cmp	r3, #0
3000601c:	aa000003 	bge	30006030 <r_malloc+0x9c>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
30006020:	e59d0008 	ldr	r0, [sp, #8]
30006024:	ebffedb0 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL;
30006028:	e3a03000 	mov	r3, #0
3000602c:	ea0000aa 	b	300062dc <r_malloc+0x348>
		}
		index=num>>level+1;
30006030:	e5dd3007 	ldrb	r3, [sp, #7]
30006034:	e2833001 	add	r3, r3, #1
30006038:	e59d2010 	ldr	r2, [sp, #16]
3000603c:	e1a03352 	asr	r3, r2, r3
30006040:	e58d300c 	str	r3, [sp, #12]
		cur=index/32;
30006044:	e59d300c 	ldr	r3, [sp, #12]
30006048:	e1a032a3 	lsr	r3, r3, #5
3000604c:	e58d3014 	str	r3, [sp, #20]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
30006050:	e59f3294 	ldr	r3, [pc, #660]	; 300062ec <r_malloc+0x358>
30006054:	e5933000 	ldr	r3, [r3]
30006058:	e5dd2007 	ldrb	r2, [sp, #7]
3000605c:	e282200e 	add	r2, r2, #14
30006060:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006064:	e59d000c 	ldr	r0, [sp, #12]
30006068:	e1a01003 	mov	r1, r3
3000606c:	eb000ef1 	bl	30009c38 <acoral_set_bit>
		acoral_mem_ctrl->free_list[level][cur]=-1;
30006070:	e59f3274 	ldr	r3, [pc, #628]	; 300062ec <r_malloc+0x358>
30006074:	e5933000 	ldr	r3, [r3]
30006078:	e5dd2007 	ldrb	r2, [sp, #7]
3000607c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006080:	e59d3014 	ldr	r3, [sp, #20]
30006084:	e1a03103 	lsl	r3, r3, #2
30006088:	e0823003 	add	r3, r2, r3
3000608c:	e3e02000 	mvn	r2, #0
30006090:	e5832000 	str	r2, [r3]
		acoral_mem_ctrl->free_cur[level]=cur;
30006094:	e59f3250 	ldr	r3, [pc, #592]	; 300062ec <r_malloc+0x358>
30006098:	e5933000 	ldr	r3, [r3]
3000609c:	e5dd2007 	ldrb	r2, [sp, #7]
300060a0:	e282201c 	add	r2, r2, #28
300060a4:	e59d1014 	ldr	r1, [sp, #20]
300060a8:	e7831102 	str	r1, [r3, r2, lsl #2]
		if((num&0x1)==0)
300060ac:	e59d3010 	ldr	r3, [sp, #16]
300060b0:	e2033001 	and	r3, r3, #1
300060b4:	e3530000 	cmp	r3, #0
300060b8:	1a000006 	bne	300060d8 <r_malloc+0x144>
			acoral_mem_blocks[BLOCK_INDEX(num)].level=level;
300060bc:	e59f322c 	ldr	r3, [pc, #556]	; 300062f0 <r_malloc+0x35c>
300060c0:	e5932000 	ldr	r2, [r3]
300060c4:	e59d3010 	ldr	r3, [sp, #16]
300060c8:	e1a030c3 	asr	r3, r3, #1
300060cc:	e0823003 	add	r3, r2, r3
300060d0:	e5dd2007 	ldrb	r2, [sp, #7]
300060d4:	e5c32000 	strb	r2, [r3]
#endif
#ifdef CFG_TEST_MEM
		buddy_scan();
#endif
		acoral_spin_unlock(&acoral_mem_ctrl->lock);
		HAL_EXIT_CRITICAL();
300060d8:	e59d0008 	ldr	r0, [sp, #8]
300060dc:	ebffed82 	bl	300016ec <HAL_INTR_RESTORE>
		return (void *)(acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT));
300060e0:	e59f3204 	ldr	r3, [pc, #516]	; 300062ec <r_malloc+0x358>
300060e4:	e5933000 	ldr	r3, [r3]
300060e8:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
300060ec:	e59d3010 	ldr	r3, [sp, #16]
300060f0:	e1a03383 	lsl	r3, r3, #7
300060f4:	e0823003 	add	r3, r2, r3
300060f8:	ea000077 	b	300062dc <r_malloc+0x348>
	}
	index=acoral_ffs(acoral_mem_ctrl->bitmap[level][cur]);
300060fc:	e59f31e8 	ldr	r3, [pc, #488]	; 300062ec <r_malloc+0x358>
30006100:	e5933000 	ldr	r3, [r3]
30006104:	e5dd2007 	ldrb	r2, [sp, #7]
30006108:	e282200e 	add	r2, r2, #14
3000610c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006110:	e59d3014 	ldr	r3, [sp, #20]
30006114:	e1a03103 	lsl	r3, r3, #2
30006118:	e0823003 	add	r3, r2, r3
3000611c:	e5933000 	ldr	r3, [r3]
30006120:	e1a00003 	mov	r0, r3
30006124:	eb000e68 	bl	30009acc <acoral_ffs>
30006128:	e1a03000 	mov	r3, r0
3000612c:	e58d300c 	str	r3, [sp, #12]
	index=index+cur*32;
30006130:	e59d3014 	ldr	r3, [sp, #20]
30006134:	e1a03283 	lsl	r3, r3, #5
30006138:	e59d200c 	ldr	r2, [sp, #12]
3000613c:	e0823003 	add	r3, r2, r3
30006140:	e58d300c 	str	r3, [sp, #12]
	acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
30006144:	e59f31a0 	ldr	r3, [pc, #416]	; 300062ec <r_malloc+0x358>
30006148:	e5933000 	ldr	r3, [r3]
3000614c:	e5dd2007 	ldrb	r2, [sp, #7]
30006150:	e282200e 	add	r2, r2, #14
30006154:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006158:	e59d000c 	ldr	r0, [sp, #12]
3000615c:	e1a01003 	mov	r1, r3
30006160:	eb000ecc 	bl	30009c98 <acoral_clear_bit>
	if(acoral_mem_ctrl->bitmap[level][cur]==0){
30006164:	e59f3180 	ldr	r3, [pc, #384]	; 300062ec <r_malloc+0x358>
30006168:	e5933000 	ldr	r3, [r3]
3000616c:	e5dd2007 	ldrb	r2, [sp, #7]
30006170:	e282200e 	add	r2, r2, #14
30006174:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006178:	e59d3014 	ldr	r3, [sp, #20]
3000617c:	e1a03103 	lsl	r3, r3, #2
30006180:	e0823003 	add	r3, r2, r3
30006184:	e5933000 	ldr	r3, [r3]
30006188:	e3530000 	cmp	r3, #0
3000618c:	1a00000c 	bne	300061c4 <r_malloc+0x230>
		acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];
30006190:	e59f3154 	ldr	r3, [pc, #340]	; 300062ec <r_malloc+0x358>
30006194:	e5933000 	ldr	r3, [r3]
30006198:	e5dd2007 	ldrb	r2, [sp, #7]
3000619c:	e59f1148 	ldr	r1, [pc, #328]	; 300062ec <r_malloc+0x358>
300061a0:	e5911000 	ldr	r1, [r1]
300061a4:	e5dd0007 	ldrb	r0, [sp, #7]
300061a8:	e7910100 	ldr	r0, [r1, r0, lsl #2]
300061ac:	e59d1014 	ldr	r1, [sp, #20]
300061b0:	e1a01101 	lsl	r1, r1, #2
300061b4:	e0801001 	add	r1, r0, r1
300061b8:	e5911000 	ldr	r1, [r1]
300061bc:	e282201c 	add	r2, r2, #28
300061c0:	e7831102 	str	r1, [r3, r2, lsl #2]
	}
	if(level==acoral_mem_ctrl->level-1){
300061c4:	e5dd2007 	ldrb	r2, [sp, #7]
300061c8:	e59f311c 	ldr	r3, [pc, #284]	; 300062ec <r_malloc+0x358>
300061cc:	e5933000 	ldr	r3, [r3]
300061d0:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
300061d4:	e1a03c03 	lsl	r3, r3, #24
300061d8:	e1a03c43 	asr	r3, r3, #24
300061dc:	e2433001 	sub	r3, r3, #1
300061e0:	e1520003 	cmp	r2, r3
300061e4:	1a000012 	bne	30006234 <r_malloc+0x2a0>
		num=index<<level;
300061e8:	e5dd3007 	ldrb	r3, [sp, #7]
300061ec:	e59d200c 	ldr	r2, [sp, #12]
300061f0:	e1a03312 	lsl	r3, r2, r3
300061f4:	e58d3010 	str	r3, [sp, #16]
		if(num+(1<<level)>acoral_mem_ctrl->block_num){
300061f8:	e5dd3007 	ldrb	r3, [sp, #7]
300061fc:	e3a02001 	mov	r2, #1
30006200:	e1a02312 	lsl	r2, r2, r3
30006204:	e59d3010 	ldr	r3, [sp, #16]
30006208:	e0823003 	add	r3, r2, r3
3000620c:	e1a02003 	mov	r2, r3
30006210:	e59f30d4 	ldr	r3, [pc, #212]	; 300062ec <r_malloc+0x358>
30006214:	e5933000 	ldr	r3, [r3]
30006218:	e59330ec 	ldr	r3, [r3, #236]	; 0xec
3000621c:	e1520003 	cmp	r2, r3
30006220:	9a000019 	bls	3000628c <r_malloc+0x2f8>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
30006224:	e59d0008 	ldr	r0, [sp, #8]
30006228:	ebffed2f 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL; 
3000622c:	e3a03000 	mov	r3, #0
30006230:	ea000029 	b	300062dc <r_malloc+0x348>
		}
	}
	else{
		num=index<<level+1;
30006234:	e5dd3007 	ldrb	r3, [sp, #7]
30006238:	e2833001 	add	r3, r3, #1
3000623c:	e59d200c 	ldr	r2, [sp, #12]
30006240:	e1a03312 	lsl	r3, r2, r3
30006244:	e58d3010 	str	r3, [sp, #16]
		if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
30006248:	e59f30a0 	ldr	r3, [pc, #160]	; 300062f0 <r_malloc+0x35c>
3000624c:	e5932000 	ldr	r2, [r3]
30006250:	e59d3010 	ldr	r3, [sp, #16]
30006254:	e1a030c3 	asr	r3, r3, #1
30006258:	e0823003 	add	r3, r2, r3
3000625c:	e5d33000 	ldrb	r3, [r3]
30006260:	e1a03c03 	lsl	r3, r3, #24
30006264:	e1a03c43 	asr	r3, r3, #24
30006268:	e3530000 	cmp	r3, #0
3000626c:	ba000007 	blt	30006290 <r_malloc+0x2fc>
			num+=(1<<level);
30006270:	e5dd3007 	ldrb	r3, [sp, #7]
30006274:	e3a02001 	mov	r2, #1
30006278:	e1a03312 	lsl	r3, r2, r3
3000627c:	e59d2010 	ldr	r2, [sp, #16]
30006280:	e0823003 	add	r3, r2, r3
30006284:	e58d3010 	str	r3, [sp, #16]
30006288:	ea000000 	b	30006290 <r_malloc+0x2fc>
	if(level==acoral_mem_ctrl->level-1){
		num=index<<level;
		if(num+(1<<level)>acoral_mem_ctrl->block_num){
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
			return NULL; 
3000628c:	e1a00000 	nop			; (mov r0, r0)
	else{
		num=index<<level+1;
		if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
			num+=(1<<level);
	}
	if((num&0x1)==0)
30006290:	e59d3010 	ldr	r3, [sp, #16]
30006294:	e2033001 	and	r3, r3, #1
30006298:	e3530000 	cmp	r3, #0
3000629c:	1a000006 	bne	300062bc <r_malloc+0x328>
		acoral_mem_blocks[BLOCK_INDEX(num)].level=level;
300062a0:	e59f3048 	ldr	r3, [pc, #72]	; 300062f0 <r_malloc+0x35c>
300062a4:	e5932000 	ldr	r2, [r3]
300062a8:	e59d3010 	ldr	r3, [sp, #16]
300062ac:	e1a030c3 	asr	r3, r3, #1
300062b0:	e0823003 	add	r3, r2, r3
300062b4:	e5dd2007 	ldrb	r2, [sp, #7]
300062b8:	e5c32000 	strb	r2, [r3]
#endif
#ifdef CFG_TEST_MEM
	buddy_scan();
#endif
	acoral_spin_unlock(&acoral_mem_ctrl->lock);
	HAL_EXIT_CRITICAL();
300062bc:	e59d0008 	ldr	r0, [sp, #8]
300062c0:	ebffed09 	bl	300016ec <HAL_INTR_RESTORE>
	return (void *)(acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT));
300062c4:	e59f3020 	ldr	r3, [pc, #32]	; 300062ec <r_malloc+0x358>
300062c8:	e5933000 	ldr	r3, [r3]
300062cc:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
300062d0:	e59d3010 	ldr	r3, [sp, #16]
300062d4:	e1a03383 	lsl	r3, r3, #7
300062d8:	e0823003 	add	r3, r2, r3
}
300062dc:	e1a00003 	mov	r0, r3
300062e0:	e28dd01c 	add	sp, sp, #28
300062e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300062e8:	e12fff1e 	bx	lr
300062ec:	30010344 	.word	0x30010344
300062f0:	3000fa98 	.word	0x3000fa98

300062f4 <buddy_malloc_size>:

acoral_u32 buddy_malloc_size(acoral_u32 size){
300062f4:	e24dd018 	sub	sp, sp, #24
300062f8:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 resize_size;	
	acoral_u8 level=0;	
300062fc:	e3a03000 	mov	r3, #0
30006300:	e5cd3013 	strb	r3, [sp, #19]
	acoral_u32 num=1;	
30006304:	e3a03001 	mov	r3, #1
30006308:	e58d3014 	str	r3, [sp, #20]
	resize_size=BLOCK_SIZE;
3000630c:	e3a03080 	mov	r3, #128	; 0x80
30006310:	e58d300c 	str	r3, [sp, #12]
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
30006314:	e59f3078 	ldr	r3, [pc, #120]	; 30006394 <buddy_malloc_size+0xa0>
30006318:	e5933000 	ldr	r3, [r3]
3000631c:	e5d330e1 	ldrb	r3, [r3, #225]	; 0xe1
30006320:	e3530000 	cmp	r3, #0
30006324:	1a00000a 	bne	30006354 <buddy_malloc_size+0x60>
		return 0;
30006328:	e3a03000 	mov	r3, #0
3000632c:	ea000015 	b	30006388 <buddy_malloc_size+0x94>
	while(resize_size<size&&level<acoral_mem_ctrl->level){
		num=num<<1;
30006330:	e59d3014 	ldr	r3, [sp, #20]
30006334:	e1a03083 	lsl	r3, r3, #1
30006338:	e58d3014 	str	r3, [sp, #20]
		level++;
3000633c:	e5dd3013 	ldrb	r3, [sp, #19]
30006340:	e2833001 	add	r3, r3, #1
30006344:	e5cd3013 	strb	r3, [sp, #19]
		resize_size=resize_size<<1;
30006348:	e59d300c 	ldr	r3, [sp, #12]
3000634c:	e1a03083 	lsl	r3, r3, #1
30006350:	e58d300c 	str	r3, [sp, #12]
	acoral_u8 level=0;	
	acoral_u32 num=1;	
	resize_size=BLOCK_SIZE;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return 0;
	while(resize_size<size&&level<acoral_mem_ctrl->level){
30006354:	e59d200c 	ldr	r2, [sp, #12]
30006358:	e59d3004 	ldr	r3, [sp, #4]
3000635c:	e1520003 	cmp	r2, r3
30006360:	2a000007 	bcs	30006384 <buddy_malloc_size+0x90>
30006364:	e5dd2013 	ldrb	r2, [sp, #19]
30006368:	e59f3024 	ldr	r3, [pc, #36]	; 30006394 <buddy_malloc_size+0xa0>
3000636c:	e5933000 	ldr	r3, [r3]
30006370:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
30006374:	e1a03c03 	lsl	r3, r3, #24
30006378:	e1a03c43 	asr	r3, r3, #24
3000637c:	e1520003 	cmp	r2, r3
30006380:	baffffea 	blt	30006330 <buddy_malloc_size+0x3c>
		num=num<<1;
		level++;
		resize_size=resize_size<<1;
	}
	return resize_size;
30006384:	e59d300c 	ldr	r3, [sp, #12]
}
30006388:	e1a00003 	mov	r0, r3
3000638c:	e28dd018 	add	sp, sp, #24
30006390:	e12fff1e 	bx	lr
30006394:	30010344 	.word	0x30010344

30006398 <buddy_malloc>:

void *buddy_malloc(acoral_u32 size){
30006398:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000639c:	e24dd01c 	sub	sp, sp, #28
300063a0:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 resize_size;	
	acoral_u8 level=0;	
300063a4:	e3a03000 	mov	r3, #0
300063a8:	e5cd3013 	strb	r3, [sp, #19]
	acoral_u32 num=1;	
300063ac:	e3a03001 	mov	r3, #1
300063b0:	e58d3014 	str	r3, [sp, #20]
	resize_size=BLOCK_SIZE;
300063b4:	e3a03080 	mov	r3, #128	; 0x80
300063b8:	e58d300c 	str	r3, [sp, #12]
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
300063bc:	e59f30b0 	ldr	r3, [pc, #176]	; 30006474 <buddy_malloc+0xdc>
300063c0:	e5933000 	ldr	r3, [r3]
300063c4:	e5d330e1 	ldrb	r3, [r3, #225]	; 0xe1
300063c8:	e3530000 	cmp	r3, #0
300063cc:	1a00000a 	bne	300063fc <buddy_malloc+0x64>
		return NULL;
300063d0:	e3a03000 	mov	r3, #0
300063d4:	ea000022 	b	30006464 <buddy_malloc+0xcc>
	while(resize_size<size){
		num=num<<1;
300063d8:	e59d3014 	ldr	r3, [sp, #20]
300063dc:	e1a03083 	lsl	r3, r3, #1
300063e0:	e58d3014 	str	r3, [sp, #20]
		level++;
300063e4:	e5dd3013 	ldrb	r3, [sp, #19]
300063e8:	e2833001 	add	r3, r3, #1
300063ec:	e5cd3013 	strb	r3, [sp, #19]
		resize_size=resize_size<<1;
300063f0:	e59d300c 	ldr	r3, [sp, #12]
300063f4:	e1a03083 	lsl	r3, r3, #1
300063f8:	e58d300c 	str	r3, [sp, #12]
	acoral_u8 level=0;	
	acoral_u32 num=1;	
	resize_size=BLOCK_SIZE;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return NULL;
	while(resize_size<size){
300063fc:	e59d200c 	ldr	r2, [sp, #12]
30006400:	e59d3004 	ldr	r3, [sp, #4]
30006404:	e1520003 	cmp	r2, r3
30006408:	3afffff2 	bcc	300063d8 <buddy_malloc+0x40>
		num=num<<1;
		level++;
		resize_size=resize_size<<1;
	}
	if(num>acoral_mem_ctrl->free_num)
3000640c:	e59f3060 	ldr	r3, [pc, #96]	; 30006474 <buddy_malloc+0xdc>
30006410:	e5933000 	ldr	r3, [r3]
30006414:	e59320f0 	ldr	r2, [r3, #240]	; 0xf0
30006418:	e59d3014 	ldr	r3, [sp, #20]
3000641c:	e1520003 	cmp	r2, r3
30006420:	2a000001 	bcs	3000642c <buddy_malloc+0x94>
		return NULL;
30006424:	e3a03000 	mov	r3, #0
30006428:	ea00000d 	b	30006464 <buddy_malloc+0xcc>
	if(level>=acoral_mem_ctrl->level)
3000642c:	e5dd2013 	ldrb	r2, [sp, #19]
30006430:	e59f303c 	ldr	r3, [pc, #60]	; 30006474 <buddy_malloc+0xdc>
30006434:	e5933000 	ldr	r3, [r3]
30006438:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
3000643c:	e1a03c03 	lsl	r3, r3, #24
30006440:	e1a03c43 	asr	r3, r3, #24
30006444:	e1520003 	cmp	r2, r3
30006448:	ba000001 	blt	30006454 <buddy_malloc+0xbc>
		return NULL;	
3000644c:	e3a03000 	mov	r3, #0
30006450:	ea000003 	b	30006464 <buddy_malloc+0xcc>
	return r_malloc(level);
30006454:	e5dd3013 	ldrb	r3, [sp, #19]
30006458:	e1a00003 	mov	r0, r3
3000645c:	ebfffecc 	bl	30005f94 <r_malloc>
30006460:	e1a03000 	mov	r3, r0
}
30006464:	e1a00003 	mov	r0, r3
30006468:	e28dd01c 	add	sp, sp, #28
3000646c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006470:	e12fff1e 	bx	lr
30006474:	30010344 	.word	0x30010344

30006478 <buddy_free>:

void buddy_free(void *ptr){
30006478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000647c:	e24dd02c 	sub	sp, sp, #44	; 0x2c
30006480:	e58d0004 	str	r0, [sp, #4]
	acoral_32 cur;
	acoral_u32 index;
	acoral_u32 num;
	acoral_u32 max_level;
	acoral_u32 adr;
	adr=(acoral_u32)ptr;
30006484:	e59d3004 	ldr	r3, [sp, #4]
30006488:	e58d3024 	str	r3, [sp, #36]	; 0x24
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
3000648c:	e59f348c 	ldr	r3, [pc, #1164]	; 30006920 <buddy_free+0x4a8>
30006490:	e5933000 	ldr	r3, [r3]
30006494:	e5d330e1 	ldrb	r3, [r3, #225]	; 0xe1
30006498:	e3530000 	cmp	r3, #0
3000649c:	0a00011b 	beq	30006910 <buddy_free+0x498>
		return;
	if(ptr==NULL||adr<acoral_mem_ctrl->start_adr||adr+BLOCK_SIZE>acoral_mem_ctrl->end_adr){
300064a0:	e59d3004 	ldr	r3, [sp, #4]
300064a4:	e3530000 	cmp	r3, #0
300064a8:	0a00000c 	beq	300064e0 <buddy_free+0x68>
300064ac:	e59f346c 	ldr	r3, [pc, #1132]	; 30006920 <buddy_free+0x4a8>
300064b0:	e5933000 	ldr	r3, [r3]
300064b4:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
300064b8:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300064bc:	e1520003 	cmp	r2, r3
300064c0:	8a000006 	bhi	300064e0 <buddy_free+0x68>
300064c4:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300064c8:	e2832080 	add	r2, r3, #128	; 0x80
300064cc:	e59f344c 	ldr	r3, [pc, #1100]	; 30006920 <buddy_free+0x4a8>
300064d0:	e5933000 	ldr	r3, [r3]
300064d4:	e59330e8 	ldr	r3, [r3, #232]	; 0xe8
300064d8:	e1520003 	cmp	r2, r3
300064dc:	9a000003 	bls	300064f0 <buddy_free+0x78>
		acoral_printerr("Invalid Free Address:0x%x\n",ptr);
300064e0:	e59f043c 	ldr	r0, [pc, #1084]	; 30006924 <buddy_free+0x4ac>
300064e4:	e59d1004 	ldr	r1, [sp, #4]
300064e8:	eb001346 	bl	3000b208 <acoral_print>
		return;
300064ec:	ea000108 	b	30006914 <buddy_free+0x49c>
	}
	max_level=acoral_mem_ctrl->level;
300064f0:	e59f3428 	ldr	r3, [pc, #1064]	; 30006920 <buddy_free+0x4a8>
300064f4:	e5933000 	ldr	r3, [r3]
300064f8:	e5d330e0 	ldrb	r3, [r3, #224]	; 0xe0
300064fc:	e1a03c03 	lsl	r3, r3, #24
30006500:	e1a03c43 	asr	r3, r3, #24
30006504:	e58d3020 	str	r3, [sp, #32]
	num=(adr-acoral_mem_ctrl->start_adr)>>BLOCK_SHIFT;
30006508:	e59f3410 	ldr	r3, [pc, #1040]	; 30006920 <buddy_free+0x4a8>
3000650c:	e5933000 	ldr	r3, [r3]
30006510:	e59330e4 	ldr	r3, [r3, #228]	; 0xe4
30006514:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
30006518:	e0633002 	rsb	r3, r3, r2
3000651c:	e1a033a3 	lsr	r3, r3, #7
30006520:	e58d301c 	str	r3, [sp, #28]
	/*如果不是block整数倍，肯定是非法地址*/
	if(adr!=acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT)){
30006524:	e59f33f4 	ldr	r3, [pc, #1012]	; 30006920 <buddy_free+0x4a8>
30006528:	e5933000 	ldr	r3, [r3]
3000652c:	e59320e4 	ldr	r2, [r3, #228]	; 0xe4
30006530:	e59d301c 	ldr	r3, [sp, #28]
30006534:	e1a03383 	lsl	r3, r3, #7
30006538:	e0822003 	add	r2, r2, r3
3000653c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30006540:	e1520003 	cmp	r2, r3
30006544:	0a000003 	beq	30006558 <buddy_free+0xe0>
		acoral_printerr("Invalid Free Address:0x%x\n",ptr);
30006548:	e59f03d4 	ldr	r0, [pc, #980]	; 30006924 <buddy_free+0x4ac>
3000654c:	e59d1004 	ldr	r1, [sp, #4]
30006550:	eb00132c 	bl	3000b208 <acoral_print>
		return;
30006554:	ea0000ee 	b	30006914 <buddy_free+0x49c>
	}
	HAL_ENTER_CRITICAL();
30006558:	ebffec65 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000655c:	e1a03000 	mov	r3, r0
30006560:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&acoral_mem_ctrl->lock);
	if(num&0x1){
30006564:	e59d301c 	ldr	r3, [sp, #28]
30006568:	e2033001 	and	r3, r3, #1
3000656c:	e20330ff 	and	r3, r3, #255	; 0xff
30006570:	e3530000 	cmp	r3, #0
30006574:	0a00003c 	beq	3000666c <buddy_free+0x1f4>
		level=0;
30006578:	e3a03000 	mov	r3, #0
3000657c:	e5cd3012 	strb	r3, [sp, #18]
		/*下面是地址检查*/
		index=num>>1;
30006580:	e59d301c 	ldr	r3, [sp, #28]
30006584:	e1a030a3 	lsr	r3, r3, #1
30006588:	e58d3018 	str	r3, [sp, #24]
		buddy_level=acoral_mem_blocks[BLOCK_INDEX(num)].level;
3000658c:	e59f3394 	ldr	r3, [pc, #916]	; 30006928 <buddy_free+0x4b0>
30006590:	e5932000 	ldr	r2, [r3]
30006594:	e59d301c 	ldr	r3, [sp, #28]
30006598:	e1a030a3 	lsr	r3, r3, #1
3000659c:	e0823003 	add	r3, r2, r3
300065a0:	e5d33000 	ldrb	r3, [r3]
300065a4:	e5cd3013 	strb	r3, [sp, #19]
		if(buddy_level>0){
300065a8:	e1dd31d3 	ldrsb	r3, [sp, #19]
300065ac:	e3530000 	cmp	r3, #0
300065b0:	da000005 	ble	300065cc <buddy_free+0x154>
			acoral_printerr("Invalid Free Address:0x%x\n",ptr);
300065b4:	e59f0368 	ldr	r0, [pc, #872]	; 30006924 <buddy_free+0x4ac>
300065b8:	e59d1004 	ldr	r1, [sp, #4]
300065bc:	eb001311 	bl	3000b208 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
300065c0:	e59d000c 	ldr	r0, [sp, #12]
300065c4:	ebffec48 	bl	300016ec <HAL_INTR_RESTORE>
			return;
300065c8:	ea0000d1 	b	30006914 <buddy_free+0x49c>
		}
		/*伙伴分配出去，如果对应的位为1,肯定是回收过一次了*/
		if(buddy_level==0&&acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
300065cc:	e1dd31d3 	ldrsb	r3, [sp, #19]
300065d0:	e3530000 	cmp	r3, #0
300065d4:	1a000010 	bne	3000661c <buddy_free+0x1a4>
300065d8:	e59f3340 	ldr	r3, [pc, #832]	; 30006920 <buddy_free+0x4a8>
300065dc:	e5933000 	ldr	r3, [r3]
300065e0:	e1dd21d2 	ldrsb	r2, [sp, #18]
300065e4:	e282200e 	add	r2, r2, #14
300065e8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300065ec:	e59d0018 	ldr	r0, [sp, #24]
300065f0:	e1a01003 	mov	r1, r3
300065f4:	eb000dc0 	bl	30009cfc <acoral_get_bit>
300065f8:	e1a03000 	mov	r3, r0
300065fc:	e3530000 	cmp	r3, #0
30006600:	0a000005 	beq	3000661c <buddy_free+0x1a4>
			acoral_printerr("Address:0x%x have been freed\n",ptr);
30006604:	e59f0320 	ldr	r0, [pc, #800]	; 3000692c <buddy_free+0x4b4>
30006608:	e59d1004 	ldr	r1, [sp, #4]
3000660c:	eb0012fd 	bl	3000b208 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
30006610:	e59d000c 	ldr	r0, [sp, #12]
30006614:	ebffec34 	bl	300016ec <HAL_INTR_RESTORE>
			return;
30006618:	ea0000bd 	b	30006914 <buddy_free+0x49c>
		}
		/*伙伴没有分配出去了，如果对应的位为0,肯定是回收过一次了*/
		if(buddy_level<0&&!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
3000661c:	e1dd31d3 	ldrsb	r3, [sp, #19]
30006620:	e3530000 	cmp	r3, #0
30006624:	aa000032 	bge	300066f4 <buddy_free+0x27c>
30006628:	e59f32f0 	ldr	r3, [pc, #752]	; 30006920 <buddy_free+0x4a8>
3000662c:	e5933000 	ldr	r3, [r3]
30006630:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006634:	e282200e 	add	r2, r2, #14
30006638:	e7933102 	ldr	r3, [r3, r2, lsl #2]
3000663c:	e59d0018 	ldr	r0, [sp, #24]
30006640:	e1a01003 	mov	r1, r3
30006644:	eb000dac 	bl	30009cfc <acoral_get_bit>
30006648:	e1a03000 	mov	r3, r0
3000664c:	e3530000 	cmp	r3, #0
30006650:	1a000029 	bne	300066fc <buddy_free+0x284>
			acoral_printerr("Address:0x%x have been freed\n",ptr);
30006654:	e59f02d0 	ldr	r0, [pc, #720]	; 3000692c <buddy_free+0x4b4>
30006658:	e59d1004 	ldr	r1, [sp, #4]
3000665c:	eb0012e9 	bl	3000b208 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
30006660:	e59d000c 	ldr	r0, [sp, #12]
30006664:	ebffec20 	bl	300016ec <HAL_INTR_RESTORE>
			return;
30006668:	ea0000a9 	b	30006914 <buddy_free+0x49c>
		}
	}else{
		level=acoral_mem_blocks[BLOCK_INDEX(num)].level;
3000666c:	e59f32b4 	ldr	r3, [pc, #692]	; 30006928 <buddy_free+0x4b0>
30006670:	e5932000 	ldr	r2, [r3]
30006674:	e59d301c 	ldr	r3, [sp, #28]
30006678:	e1a030a3 	lsr	r3, r3, #1
3000667c:	e0823003 	add	r3, r2, r3
30006680:	e5d33000 	ldrb	r3, [r3]
30006684:	e5cd3012 	strb	r3, [sp, #18]
		/*已经释放*/
		if(level<0){
30006688:	e1dd31d2 	ldrsb	r3, [sp, #18]
3000668c:	e3530000 	cmp	r3, #0
30006690:	aa000005 	bge	300066ac <buddy_free+0x234>
			acoral_printerr("Address:0x%x have been freed\n",ptr);
30006694:	e59f0290 	ldr	r0, [pc, #656]	; 3000692c <buddy_free+0x4b4>
30006698:	e59d1004 	ldr	r1, [sp, #4]
3000669c:	eb0012d9 	bl	3000b208 <acoral_print>
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
300066a0:	e59d000c 	ldr	r0, [sp, #12]
300066a4:	ebffec10 	bl	300016ec <HAL_INTR_RESTORE>
			return;
300066a8:	ea000099 	b	30006914 <buddy_free+0x49c>
		}	
		acoral_mem_ctrl->free_num+=1<<level;
300066ac:	e59f326c 	ldr	r3, [pc, #620]	; 30006920 <buddy_free+0x4a8>
300066b0:	e5933000 	ldr	r3, [r3]
300066b4:	e59f2264 	ldr	r2, [pc, #612]	; 30006920 <buddy_free+0x4a8>
300066b8:	e5922000 	ldr	r2, [r2]
300066bc:	e59210f0 	ldr	r1, [r2, #240]	; 0xf0
300066c0:	e1dd21d2 	ldrsb	r2, [sp, #18]
300066c4:	e3a00001 	mov	r0, #1
300066c8:	e1a02210 	lsl	r2, r0, r2
300066cc:	e0812002 	add	r2, r1, r2
300066d0:	e58320f0 	str	r2, [r3, #240]	; 0xf0
		acoral_mem_blocks[BLOCK_INDEX(num)].level=-1;
300066d4:	e59f324c 	ldr	r3, [pc, #588]	; 30006928 <buddy_free+0x4b0>
300066d8:	e5932000 	ldr	r2, [r3]
300066dc:	e59d301c 	ldr	r3, [sp, #28]
300066e0:	e1a030a3 	lsr	r3, r3, #1
300066e4:	e0823003 	add	r3, r2, r3
300066e8:	e3e02000 	mvn	r2, #0
300066ec:	e5c32000 	strb	r2, [r3]
300066f0:	ea000002 	b	30006700 <buddy_free+0x288>
		/*伙伴没有分配出去了，如果对应的位为0,肯定是回收过一次了*/
		if(buddy_level<0&&!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
			acoral_printerr("Address:0x%x have been freed\n",ptr);
			acoral_spin_unlock(&acoral_mem_ctrl->lock);
			HAL_EXIT_CRITICAL();
			return;
300066f4:	e1a00000 	nop			; (mov r0, r0)
300066f8:	ea000000 	b	30006700 <buddy_free+0x288>
300066fc:	e1a00000 	nop			; (mov r0, r0)
		acoral_mem_blocks[BLOCK_INDEX(num)].level=-1;
	}
#ifdef CFG_TEST
	acoral_print("Free-level:%d,num:%d\n",level,num);
#endif
	if(level==max_level-1){
30006700:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006704:	e59d3020 	ldr	r3, [sp, #32]
30006708:	e2433001 	sub	r3, r3, #1
3000670c:	e1520003 	cmp	r2, r3
30006710:	1a00000e 	bne	30006750 <buddy_free+0x2d8>
		index=num>>level;
30006714:	e1dd31d2 	ldrsb	r3, [sp, #18]
30006718:	e59d201c 	ldr	r2, [sp, #28]
3000671c:	e1a03332 	lsr	r3, r2, r3
30006720:	e58d3018 	str	r3, [sp, #24]
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
30006724:	e59f31f4 	ldr	r3, [pc, #500]	; 30006920 <buddy_free+0x4a8>
30006728:	e5933000 	ldr	r3, [r3]
3000672c:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006730:	e282200e 	add	r2, r2, #14
30006734:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006738:	e59d0018 	ldr	r0, [sp, #24]
3000673c:	e1a01003 	mov	r1, r3
30006740:	eb000d3c 	bl	30009c38 <acoral_set_bit>
		HAL_EXIT_CRITICAL();
30006744:	e59d000c 	ldr	r0, [sp, #12]
30006748:	ebffebe7 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_spin_unlock(&acoral_mem_ctrl->lock);
		return;
3000674c:	ea000070 	b	30006914 <buddy_free+0x49c>
	}
	index=num>>1+level;
30006750:	e1dd31d2 	ldrsb	r3, [sp, #18]
30006754:	e2833001 	add	r3, r3, #1
30006758:	e59d201c 	ldr	r2, [sp, #28]
3000675c:	e1a03332 	lsr	r3, r2, r3
30006760:	e58d3018 	str	r3, [sp, #24]
	while(level<max_level){
30006764:	ea000060 	b	300068ec <buddy_free+0x474>
		cur=index/32;
30006768:	e59d3018 	ldr	r3, [sp, #24]
3000676c:	e1a032a3 	lsr	r3, r3, #5
30006770:	e58d3014 	str	r3, [sp, #20]
		if(!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
30006774:	e59f31a4 	ldr	r3, [pc, #420]	; 30006920 <buddy_free+0x4a8>
30006778:	e5933000 	ldr	r3, [r3]
3000677c:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006780:	e282200e 	add	r2, r2, #14
30006784:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006788:	e59d0018 	ldr	r0, [sp, #24]
3000678c:	e1a01003 	mov	r1, r3
30006790:	eb000d59 	bl	30009cfc <acoral_get_bit>
30006794:	e1a03000 	mov	r3, r0
30006798:	e3530000 	cmp	r3, #0
3000679c:	1a00002a 	bne	3000684c <buddy_free+0x3d4>
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
300067a0:	e59f3178 	ldr	r3, [pc, #376]	; 30006920 <buddy_free+0x4a8>
300067a4:	e5933000 	ldr	r3, [r3]
300067a8:	e1dd21d2 	ldrsb	r2, [sp, #18]
300067ac:	e282200e 	add	r2, r2, #14
300067b0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300067b4:	e59d0018 	ldr	r0, [sp, #24]
300067b8:	e1a01003 	mov	r1, r3
300067bc:	eb000d1d 	bl	30009c38 <acoral_set_bit>
			if(acoral_mem_ctrl->free_cur[level]<0||cur<acoral_mem_ctrl->free_cur[level]){
300067c0:	e59f3158 	ldr	r3, [pc, #344]	; 30006920 <buddy_free+0x4a8>
300067c4:	e5933000 	ldr	r3, [r3]
300067c8:	e1dd21d2 	ldrsb	r2, [sp, #18]
300067cc:	e282201c 	add	r2, r2, #28
300067d0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
300067d4:	e3530000 	cmp	r3, #0
300067d8:	ba000007 	blt	300067fc <buddy_free+0x384>
300067dc:	e59f313c 	ldr	r3, [pc, #316]	; 30006920 <buddy_free+0x4a8>
300067e0:	e5933000 	ldr	r3, [r3]
300067e4:	e1dd21d2 	ldrsb	r2, [sp, #18]
300067e8:	e282201c 	add	r2, r2, #28
300067ec:	e7932102 	ldr	r2, [r3, r2, lsl #2]
300067f0:	e59d3014 	ldr	r3, [sp, #20]
300067f4:	e1520003 	cmp	r2, r3
300067f8:	da000040 	ble	30006900 <buddy_free+0x488>
				acoral_mem_ctrl->free_list[level][cur]=acoral_mem_ctrl->free_cur[level];	
300067fc:	e59f311c 	ldr	r3, [pc, #284]	; 30006920 <buddy_free+0x4a8>
30006800:	e5933000 	ldr	r3, [r3]
30006804:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006808:	e7932102 	ldr	r2, [r3, r2, lsl #2]
3000680c:	e59d3014 	ldr	r3, [sp, #20]
30006810:	e1a03103 	lsl	r3, r3, #2
30006814:	e0823003 	add	r3, r2, r3
30006818:	e59f2100 	ldr	r2, [pc, #256]	; 30006920 <buddy_free+0x4a8>
3000681c:	e5922000 	ldr	r2, [r2]
30006820:	e1dd11d2 	ldrsb	r1, [sp, #18]
30006824:	e281101c 	add	r1, r1, #28
30006828:	e7922101 	ldr	r2, [r2, r1, lsl #2]
3000682c:	e5832000 	str	r2, [r3]
				acoral_mem_ctrl->free_cur[level]=cur;	
30006830:	e59f30e8 	ldr	r3, [pc, #232]	; 30006920 <buddy_free+0x4a8>
30006834:	e5933000 	ldr	r3, [r3]
30006838:	e1dd21d2 	ldrsb	r2, [sp, #18]
3000683c:	e282201c 	add	r2, r2, #28
30006840:	e59d1014 	ldr	r1, [sp, #20]
30006844:	e7831102 	str	r1, [r3, r2, lsl #2]
			}
			break;
30006848:	ea00002d 	b	30006904 <buddy_free+0x48c>
		}
		/*有个伙伴是空闲的，向上级回收*/
		acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
3000684c:	e59f30cc 	ldr	r3, [pc, #204]	; 30006920 <buddy_free+0x4a8>
30006850:	e5933000 	ldr	r3, [r3]
30006854:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006858:	e282200e 	add	r2, r2, #14
3000685c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
30006860:	e59d0018 	ldr	r0, [sp, #24]
30006864:	e1a01003 	mov	r1, r3
30006868:	eb000d0a 	bl	30009c98 <acoral_clear_bit>
		if(cur==acoral_mem_ctrl->free_cur[level])
3000686c:	e59f30ac 	ldr	r3, [pc, #172]	; 30006920 <buddy_free+0x4a8>
30006870:	e5933000 	ldr	r3, [r3]
30006874:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006878:	e282201c 	add	r2, r2, #28
3000687c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
30006880:	e59d3014 	ldr	r3, [sp, #20]
30006884:	e1520003 	cmp	r2, r3
30006888:	1a00000c 	bne	300068c0 <buddy_free+0x448>
			acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];	
3000688c:	e59f308c 	ldr	r3, [pc, #140]	; 30006920 <buddy_free+0x4a8>
30006890:	e5933000 	ldr	r3, [r3]
30006894:	e1dd21d2 	ldrsb	r2, [sp, #18]
30006898:	e59f1080 	ldr	r1, [pc, #128]	; 30006920 <buddy_free+0x4a8>
3000689c:	e5911000 	ldr	r1, [r1]
300068a0:	e1dd01d2 	ldrsb	r0, [sp, #18]
300068a4:	e7910100 	ldr	r0, [r1, r0, lsl #2]
300068a8:	e59d1014 	ldr	r1, [sp, #20]
300068ac:	e1a01101 	lsl	r1, r1, #2
300068b0:	e0801001 	add	r1, r0, r1
300068b4:	e5911000 	ldr	r1, [r1]
300068b8:	e282201c 	add	r2, r2, #28
300068bc:	e7831102 	str	r1, [r3, r2, lsl #2]
		level++;
300068c0:	e5dd3012 	ldrb	r3, [sp, #18]
300068c4:	e2833001 	add	r3, r3, #1
300068c8:	e5cd3012 	strb	r3, [sp, #18]
		if(level<max_level-1)
300068cc:	e1dd21d2 	ldrsb	r2, [sp, #18]
300068d0:	e59d3020 	ldr	r3, [sp, #32]
300068d4:	e2433001 	sub	r3, r3, #1
300068d8:	e1520003 	cmp	r2, r3
300068dc:	2a000002 	bcs	300068ec <buddy_free+0x474>
			index=index>>1;
300068e0:	e59d3018 	ldr	r3, [sp, #24]
300068e4:	e1a030a3 	lsr	r3, r3, #1
300068e8:	e58d3018 	str	r3, [sp, #24]
		HAL_EXIT_CRITICAL();
		acoral_spin_unlock(&acoral_mem_ctrl->lock);
		return;
	}
	index=num>>1+level;
	while(level<max_level){
300068ec:	e1dd21d2 	ldrsb	r2, [sp, #18]
300068f0:	e59d3020 	ldr	r3, [sp, #32]
300068f4:	e1520003 	cmp	r2, r3
300068f8:	3affff9a 	bcc	30006768 <buddy_free+0x2f0>
300068fc:	ea000000 	b	30006904 <buddy_free+0x48c>
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
			if(acoral_mem_ctrl->free_cur[level]<0||cur<acoral_mem_ctrl->free_cur[level]){
				acoral_mem_ctrl->free_list[level][cur]=acoral_mem_ctrl->free_cur[level];	
				acoral_mem_ctrl->free_cur[level]=cur;	
			}
			break;
30006900:	e1a00000 	nop			; (mov r0, r0)
			acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];	
		level++;
		if(level<max_level-1)
			index=index>>1;
	}
	HAL_EXIT_CRITICAL();
30006904:	e59d000c 	ldr	r0, [sp, #12]
30006908:	ebffeb77 	bl	300016ec <HAL_INTR_RESTORE>
3000690c:	ea000000 	b	30006914 <buddy_free+0x49c>
	acoral_u32 num;
	acoral_u32 max_level;
	acoral_u32 adr;
	adr=(acoral_u32)ptr;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return;
30006910:	e1a00000 	nop			; (mov r0, r0)
	HAL_EXIT_CRITICAL();
	acoral_spin_unlock(&acoral_mem_ctrl->lock);
#ifdef CFG_TEST_MEM
	buddy_scan();
#endif
}
30006914:	e28dd02c 	add	sp, sp, #44	; 0x2c
30006918:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000691c:	e12fff1e 	bx	lr
30006920:	30010344 	.word	0x30010344
30006924:	3000e420 	.word	0x3000e420
30006928:	3000fa98 	.word	0x3000fa98
3000692c:	3000e43c 	.word	0x3000e43c

30006930 <r_malloc>:
	acoral_u32 alloc_size;
#endif
	acoral_u8 mem_state;
}mem_ctrl;

static void *r_malloc(acoral_32 size){
30006930:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006934:	e24dd01c 	sub	sp, sp, #28
30006938:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 * tp;
	acoral_8 * ctp;
	acoral_u32 b_size;
	size=size+4;
3000693c:	e59d3004 	ldr	r3, [sp, #4]
30006940:	e2833004 	add	r3, r3, #4
30006944:	e58d3004 	str	r3, [sp, #4]
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=MUTEX_SUCCED)
30006948:	ea000000 	b	30006950 <r_malloc+0x20>
		acoral_suspend_self();
3000694c:	ebffef98 	bl	300027b4 <acoral_suspend_self>
static void *r_malloc(acoral_32 size){
	acoral_u32 * tp;
	acoral_8 * ctp;
	acoral_u32 b_size;
	size=size+4;
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=MUTEX_SUCCED)
30006950:	e59f0284 	ldr	r0, [pc, #644]	; 30006bdc <r_malloc+0x2ac>
30006954:	e3a01000 	mov	r1, #0
30006958:	ebfff9a2 	bl	30004fe8 <acoral_mutex_pend>
3000695c:	e1a03000 	mov	r3, r0
30006960:	e3530000 	cmp	r3, #0
30006964:	1afffff8 	bne	3000694c <r_malloc+0x1c>
#ifdef CFG_TEST
	mem_ctrl.alloc_size+=size;
	mem_ctrl.alloc_num++;
	acoral_print("In malloc:%d\n",size);
#endif
	tp=mem_ctrl.freep_p;
30006968:	e59f326c 	ldr	r3, [pc, #620]	; 30006bdc <r_malloc+0x2ac>
3000696c:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
30006970:	e58d300c 	str	r3, [sp, #12]
	ctp=(acoral_8 *)tp;
30006974:	e59d300c 	ldr	r3, [sp, #12]
30006978:	e58d3010 	str	r3, [sp, #16]
	while(ctp<mem_ctrl.top_p){
3000697c:	ea00003f 	b	30006a80 <r_malloc+0x150>
             b_size=BLOCK_SIZE(*tp);
30006980:	e59d300c 	ldr	r3, [sp, #12]
30006984:	e5933000 	ldr	r3, [r3]
30006988:	e1a03423 	lsr	r3, r3, #8
3000698c:	e58d3014 	str	r3, [sp, #20]
	     if(b_size==0){
30006990:	e59d3014 	ldr	r3, [sp, #20]
30006994:	e3530000 	cmp	r3, #0
30006998:	1a000006 	bne	300069b8 <r_malloc+0x88>
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
3000699c:	e59f023c 	ldr	r0, [pc, #572]	; 30006be0 <r_malloc+0x2b0>
300069a0:	e59d100c 	ldr	r1, [sp, #12]
300069a4:	eb001217 	bl	3000b208 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
300069a8:	e59f022c 	ldr	r0, [pc, #556]	; 30006bdc <r_malloc+0x2ac>
300069ac:	ebfffa1e 	bl	3000522c <acoral_mutex_post>
			return NULL;
300069b0:	e3a03000 	mov	r3, #0
300069b4:	ea000084 	b	30006bcc <r_malloc+0x29c>
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
300069b8:	e59d300c 	ldr	r3, [sp, #12]
300069bc:	e5933000 	ldr	r3, [r3]
300069c0:	e2033001 	and	r3, r3, #1
300069c4:	e20330ff 	and	r3, r3, #255	; 0xff
300069c8:	e3530000 	cmp	r3, #0
300069cc:	1a000003 	bne	300069e0 <r_malloc+0xb0>
300069d0:	e59d2004 	ldr	r2, [sp, #4]
300069d4:	e59d3014 	ldr	r3, [sp, #20]
300069d8:	e1520003 	cmp	r2, r3
300069dc:	9a000006 	bls	300069fc <r_malloc+0xcc>
        	ctp=ctp+b_size;
300069e0:	e59d2010 	ldr	r2, [sp, #16]
300069e4:	e59d3014 	ldr	r3, [sp, #20]
300069e8:	e0823003 	add	r3, r2, r3
300069ec:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
300069f0:	e59d3010 	ldr	r3, [sp, #16]
300069f4:	e58d300c 	str	r3, [sp, #12]
	     if(b_size==0){
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
			acoral_mutex_post(&mem_ctrl.mutex);
			return NULL;
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
300069f8:	ea000020 	b	30006a80 <r_malloc+0x150>
        	ctp=ctp+b_size;
		tp=(acoral_u32 *)ctp;
	     }
	     else
	     {
		BLOCK_SET_USED(tp,size);
300069fc:	e59d3004 	ldr	r3, [sp, #4]
30006a00:	e1a03403 	lsl	r3, r3, #8
30006a04:	e38330cd 	orr	r3, r3, #205	; 0xcd
30006a08:	e1a02003 	mov	r2, r3
30006a0c:	e59d300c 	ldr	r3, [sp, #12]
30006a10:	e5832000 	str	r2, [r3]
		ctp=ctp+size;
30006a14:	e59d3004 	ldr	r3, [sp, #4]
30006a18:	e59d2010 	ldr	r2, [sp, #16]
30006a1c:	e0823003 	add	r3, r2, r3
30006a20:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
30006a24:	e59d3010 	ldr	r3, [sp, #16]
30006a28:	e58d300c 	str	r3, [sp, #12]
		if(b_size-size>0)
30006a2c:	e59d2004 	ldr	r2, [sp, #4]
30006a30:	e59d3014 	ldr	r3, [sp, #20]
30006a34:	e1520003 	cmp	r2, r3
30006a38:	0a000006 	beq	30006a58 <r_malloc+0x128>
			BLOCK_SET_FREE(tp,b_size-size);
30006a3c:	e59d3004 	ldr	r3, [sp, #4]
30006a40:	e59d2014 	ldr	r2, [sp, #20]
30006a44:	e0633002 	rsb	r3, r3, r2
30006a48:	e1a03403 	lsl	r3, r3, #8
30006a4c:	e38320cc 	orr	r2, r3, #204	; 0xcc
30006a50:	e59d300c 	ldr	r3, [sp, #12]
30006a54:	e5832000 	str	r2, [r3]
		mem_ctrl.freep_p=tp;
30006a58:	e59f317c 	ldr	r3, [pc, #380]	; 30006bdc <r_malloc+0x2ac>
30006a5c:	e59d200c 	ldr	r2, [sp, #12]
30006a60:	e583202c 	str	r2, [r3, #44]	; 0x2c
#ifdef CFG_TEST_MEM2
		acoral_print("After malloc\n");
		v_mem_scan();
		acoral_print("...................\n");
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
30006a64:	e59f0170 	ldr	r0, [pc, #368]	; 30006bdc <r_malloc+0x2ac>
30006a68:	ebfff9ef 	bl	3000522c <acoral_mutex_post>
	        return (void *)(ctp-size+4);	
30006a6c:	e59d3004 	ldr	r3, [sp, #4]
30006a70:	e2632004 	rsb	r2, r3, #4
30006a74:	e59d3010 	ldr	r3, [sp, #16]
30006a78:	e0823003 	add	r3, r2, r3
30006a7c:	ea000052 	b	30006bcc <r_malloc+0x29c>
	mem_ctrl.alloc_num++;
	acoral_print("In malloc:%d\n",size);
#endif
	tp=mem_ctrl.freep_p;
	ctp=(acoral_8 *)tp;
	while(ctp<mem_ctrl.top_p){
30006a80:	e59f3154 	ldr	r3, [pc, #340]	; 30006bdc <r_malloc+0x2ac>
30006a84:	e5932024 	ldr	r2, [r3, #36]	; 0x24
30006a88:	e59d3010 	ldr	r3, [sp, #16]
30006a8c:	e1520003 	cmp	r2, r3
30006a90:	8affffba 	bhi	30006980 <r_malloc+0x50>
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
	        return (void *)(ctp-size+4);	
	     }
	}
    	ctp=mem_ctrl.down_p;
30006a94:	e59f3140 	ldr	r3, [pc, #320]	; 30006bdc <r_malloc+0x2ac>
30006a98:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30006a9c:	e58d3010 	str	r3, [sp, #16]
	tp=(acoral_u32 *)ctp;
30006aa0:	e59d3010 	ldr	r3, [sp, #16]
30006aa4:	e58d300c 	str	r3, [sp, #12]
	while(tp<mem_ctrl.freep_p){
30006aa8:	ea00003f 	b	30006bac <r_malloc+0x27c>
	     b_size=BLOCK_SIZE(*tp);
30006aac:	e59d300c 	ldr	r3, [sp, #12]
30006ab0:	e5933000 	ldr	r3, [r3]
30006ab4:	e1a03423 	lsr	r3, r3, #8
30006ab8:	e58d3014 	str	r3, [sp, #20]
	     if(b_size==0){
30006abc:	e59d3014 	ldr	r3, [sp, #20]
30006ac0:	e3530000 	cmp	r3, #0
30006ac4:	1a000006 	bne	30006ae4 <r_malloc+0x1b4>
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
30006ac8:	e59f0110 	ldr	r0, [pc, #272]	; 30006be0 <r_malloc+0x2b0>
30006acc:	e59d100c 	ldr	r1, [sp, #12]
30006ad0:	eb0011cc 	bl	3000b208 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
30006ad4:	e59f0100 	ldr	r0, [pc, #256]	; 30006bdc <r_malloc+0x2ac>
30006ad8:	ebfff9d3 	bl	3000522c <acoral_mutex_post>
			return NULL;
30006adc:	e3a03000 	mov	r3, #0
30006ae0:	ea000039 	b	30006bcc <r_malloc+0x29c>
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
30006ae4:	e59d300c 	ldr	r3, [sp, #12]
30006ae8:	e5933000 	ldr	r3, [r3]
30006aec:	e2033001 	and	r3, r3, #1
30006af0:	e20330ff 	and	r3, r3, #255	; 0xff
30006af4:	e3530000 	cmp	r3, #0
30006af8:	1a000003 	bne	30006b0c <r_malloc+0x1dc>
30006afc:	e59d2004 	ldr	r2, [sp, #4]
30006b00:	e59d3014 	ldr	r3, [sp, #20]
30006b04:	e1520003 	cmp	r2, r3
30006b08:	9a000006 	bls	30006b28 <r_malloc+0x1f8>
        	ctp=ctp+b_size;
30006b0c:	e59d2010 	ldr	r2, [sp, #16]
30006b10:	e59d3014 	ldr	r3, [sp, #20]
30006b14:	e0823003 	add	r3, r2, r3
30006b18:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
30006b1c:	e59d3010 	ldr	r3, [sp, #16]
30006b20:	e58d300c 	str	r3, [sp, #12]
	     if(b_size==0){
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
			acoral_mutex_post(&mem_ctrl.mutex);
			return NULL;
	     }
	     if(BLOCK_USED(*tp)||b_size<size){
30006b24:	ea000020 	b	30006bac <r_malloc+0x27c>
        	ctp=ctp+b_size;
		tp=(acoral_u32 *)ctp;
	     }
	     else
	     {
		BLOCK_SET_USED(tp,size);
30006b28:	e59d3004 	ldr	r3, [sp, #4]
30006b2c:	e1a03403 	lsl	r3, r3, #8
30006b30:	e38330cd 	orr	r3, r3, #205	; 0xcd
30006b34:	e1a02003 	mov	r2, r3
30006b38:	e59d300c 	ldr	r3, [sp, #12]
30006b3c:	e5832000 	str	r2, [r3]
		ctp=ctp+size;
30006b40:	e59d3004 	ldr	r3, [sp, #4]
30006b44:	e59d2010 	ldr	r2, [sp, #16]
30006b48:	e0823003 	add	r3, r2, r3
30006b4c:	e58d3010 	str	r3, [sp, #16]
		tp=(acoral_u32 *)ctp;
30006b50:	e59d3010 	ldr	r3, [sp, #16]
30006b54:	e58d300c 	str	r3, [sp, #12]
		if(b_size-size>0)
30006b58:	e59d2004 	ldr	r2, [sp, #4]
30006b5c:	e59d3014 	ldr	r3, [sp, #20]
30006b60:	e1520003 	cmp	r2, r3
30006b64:	0a000006 	beq	30006b84 <r_malloc+0x254>
			BLOCK_SET_FREE(tp,b_size-size);
30006b68:	e59d3004 	ldr	r3, [sp, #4]
30006b6c:	e59d2014 	ldr	r2, [sp, #20]
30006b70:	e0633002 	rsb	r3, r3, r2
30006b74:	e1a03403 	lsl	r3, r3, #8
30006b78:	e38320cc 	orr	r2, r3, #204	; 0xcc
30006b7c:	e59d300c 	ldr	r3, [sp, #12]
30006b80:	e5832000 	str	r2, [r3]
		mem_ctrl.freep_p=tp;
30006b84:	e59f3050 	ldr	r3, [pc, #80]	; 30006bdc <r_malloc+0x2ac>
30006b88:	e59d200c 	ldr	r2, [sp, #12]
30006b8c:	e583202c 	str	r2, [r3, #44]	; 0x2c
#ifdef CFG_TEST_MEM2
		acoral_print("After malloc\n");
		v_mem_scan();
		acoral_print("...................\n");
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
30006b90:	e59f0044 	ldr	r0, [pc, #68]	; 30006bdc <r_malloc+0x2ac>
30006b94:	ebfff9a4 	bl	3000522c <acoral_mutex_post>
	        return (void *)(ctp-size+4);	
30006b98:	e59d3004 	ldr	r3, [sp, #4]
30006b9c:	e2632004 	rsb	r2, r3, #4
30006ba0:	e59d3010 	ldr	r3, [sp, #16]
30006ba4:	e0823003 	add	r3, r2, r3
30006ba8:	ea000007 	b	30006bcc <r_malloc+0x29c>
	        return (void *)(ctp-size+4);	
	     }
	}
    	ctp=mem_ctrl.down_p;
	tp=(acoral_u32 *)ctp;
	while(tp<mem_ctrl.freep_p){
30006bac:	e59f3028 	ldr	r3, [pc, #40]	; 30006bdc <r_malloc+0x2ac>
30006bb0:	e593202c 	ldr	r2, [r3, #44]	; 0x2c
30006bb4:	e59d300c 	ldr	r3, [sp, #12]
30006bb8:	e1520003 	cmp	r2, r3
30006bbc:	8affffba 	bhi	30006aac <r_malloc+0x17c>
	acoral_print("...................\n");
#endif
#ifdef CFG_TEST
	mem_ctrl.alloc_size-=size;
#endif
	acoral_mutex_post(&mem_ctrl.mutex);
30006bc0:	e59f0014 	ldr	r0, [pc, #20]	; 30006bdc <r_malloc+0x2ac>
30006bc4:	ebfff998 	bl	3000522c <acoral_mutex_post>
	return NULL;
30006bc8:	e3a03000 	mov	r3, #0
}
30006bcc:	e1a00003 	mov	r0, r3
30006bd0:	e28dd01c 	add	sp, sp, #28
30006bd4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006bd8:	e12fff1e 	bx	lr
30006bdc:	3000f980 	.word	0x3000f980
30006be0:	3000e45c 	.word	0x3000e45c

30006be4 <v_malloc>:

void * v_malloc(acoral_32 size){
30006be4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006be8:	e24dd00c 	sub	sp, sp, #12
30006bec:	e58d0004 	str	r0, [sp, #4]
	if(mem_ctrl.mem_state==0)
30006bf0:	e59f303c 	ldr	r3, [pc, #60]	; 30006c34 <v_malloc+0x50>
30006bf4:	e5d33030 	ldrb	r3, [r3, #48]	; 0x30
30006bf8:	e3530000 	cmp	r3, #0
30006bfc:	1a000001 	bne	30006c08 <v_malloc+0x24>
		return NULL;
30006c00:	e3a03000 	mov	r3, #0
30006c04:	ea000006 	b	30006c24 <v_malloc+0x40>
	size=(size+3)&~3;
30006c08:	e59d3004 	ldr	r3, [sp, #4]
30006c0c:	e2833003 	add	r3, r3, #3
30006c10:	e3c33003 	bic	r3, r3, #3
30006c14:	e58d3004 	str	r3, [sp, #4]
    return r_malloc(size);
30006c18:	e59d0004 	ldr	r0, [sp, #4]
30006c1c:	ebffff43 	bl	30006930 <r_malloc>
30006c20:	e1a03000 	mov	r3, r0
}
30006c24:	e1a00003 	mov	r0, r3
30006c28:	e28dd00c 	add	sp, sp, #12
30006c2c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006c30:	e12fff1e 	bx	lr
30006c34:	3000f980 	.word	0x3000f980

30006c38 <v_free>:

void v_free(void * p){
30006c38:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006c3c:	e24dd024 	sub	sp, sp, #36	; 0x24
30006c40:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 * tp,*prev_tp;
	acoral_8 * ctp;
	acoral_u32 b_size,size;
	if(mem_ctrl.mem_state==0)
30006c44:	e59f327c 	ldr	r3, [pc, #636]	; 30006ec8 <v_free+0x290>
30006c48:	e5d33030 	ldrb	r3, [r3, #48]	; 0x30
30006c4c:	e3530000 	cmp	r3, #0
30006c50:	0a000098 	beq	30006eb8 <v_free+0x280>
		return;
	p=(acoral_8 *)p-4;
30006c54:	e59d3004 	ldr	r3, [sp, #4]
30006c58:	e2433004 	sub	r3, r3, #4
30006c5c:	e58d3004 	str	r3, [sp, #4]
	tp=(acoral_u32 *)p;
30006c60:	e59d3004 	ldr	r3, [sp, #4]
30006c64:	e58d300c 	str	r3, [sp, #12]
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=0) //周期性任务
30006c68:	ea000000 	b	30006c70 <v_free+0x38>
		acoral_suspend_self();
30006c6c:	ebffeed0 	bl	300027b4 <acoral_suspend_self>
	acoral_u32 b_size,size;
	if(mem_ctrl.mem_state==0)
		return;
	p=(acoral_8 *)p-4;
	tp=(acoral_u32 *)p;
	while(acoral_mutex_pend(&mem_ctrl.mutex, 0)!=0) //周期性任务
30006c70:	e59f0250 	ldr	r0, [pc, #592]	; 30006ec8 <v_free+0x290>
30006c74:	e3a01000 	mov	r1, #0
30006c78:	ebfff8da 	bl	30004fe8 <acoral_mutex_pend>
30006c7c:	e1a03000 	mov	r3, r0
30006c80:	e3530000 	cmp	r3, #0
30006c84:	1afffff8 	bne	30006c6c <v_free+0x34>
		acoral_suspend_self();
	if(p==NULL||(acoral_8 *)p<mem_ctrl.down_p||(acoral_8 *)p>=mem_ctrl.top_p||!BLOCK_CHECK(*tp)){
30006c88:	e59d3004 	ldr	r3, [sp, #4]
30006c8c:	e3530000 	cmp	r3, #0
30006c90:	0a00000e 	beq	30006cd0 <v_free+0x98>
30006c94:	e59f322c 	ldr	r3, [pc, #556]	; 30006ec8 <v_free+0x290>
30006c98:	e5932028 	ldr	r2, [r3, #40]	; 0x28
30006c9c:	e59d3004 	ldr	r3, [sp, #4]
30006ca0:	e1520003 	cmp	r2, r3
30006ca4:	8a000009 	bhi	30006cd0 <v_free+0x98>
30006ca8:	e59f3218 	ldr	r3, [pc, #536]	; 30006ec8 <v_free+0x290>
30006cac:	e5932024 	ldr	r2, [r3, #36]	; 0x24
30006cb0:	e59d3004 	ldr	r3, [sp, #4]
30006cb4:	e1520003 	cmp	r2, r3
30006cb8:	9a000004 	bls	30006cd0 <v_free+0x98>
30006cbc:	e59d300c 	ldr	r3, [sp, #12]
30006cc0:	e5933000 	ldr	r3, [r3]
30006cc4:	e20330fe 	and	r3, r3, #254	; 0xfe
30006cc8:	e35300cc 	cmp	r3, #204	; 0xcc
30006ccc:	0a000003 	beq	30006ce0 <v_free+0xa8>
		acoral_printerr("Invalide Free address:0x%x\n",tp);
30006cd0:	e59f01f4 	ldr	r0, [pc, #500]	; 30006ecc <v_free+0x294>
30006cd4:	e59d100c 	ldr	r1, [sp, #12]
30006cd8:	eb00114a 	bl	3000b208 <acoral_print>
		return;
30006cdc:	ea000076 	b	30006ebc <v_free+0x284>
	}
	if(BLOCK_FREE(*tp)){
30006ce0:	e59d300c 	ldr	r3, [sp, #12]
30006ce4:	e5933000 	ldr	r3, [r3]
30006ce8:	e2033001 	and	r3, r3, #1
30006cec:	e3530000 	cmp	r3, #0
30006cf0:	1a000003 	bne	30006d04 <v_free+0xcc>
		acoral_printerr("Address:0x%x have been freed\n",tp);
30006cf4:	e59f01d4 	ldr	r0, [pc, #468]	; 30006ed0 <v_free+0x298>
30006cf8:	e59d100c 	ldr	r1, [sp, #12]
30006cfc:	eb001141 	bl	3000b208 <acoral_print>
		return;
30006d00:	ea00006d 	b	30006ebc <v_free+0x284>
	}
	prev_tp=tp;
30006d04:	e59d300c 	ldr	r3, [sp, #12]
30006d08:	e58d3010 	str	r3, [sp, #16]
	ctp=(acoral_8 *)tp;
30006d0c:	e59d300c 	ldr	r3, [sp, #12]
30006d10:	e58d3014 	str	r3, [sp, #20]
    b_size=BLOCK_SIZE(*tp);
30006d14:	e59d300c 	ldr	r3, [sp, #12]
30006d18:	e5933000 	ldr	r3, [r3]
30006d1c:	e1a03423 	lsr	r3, r3, #8
30006d20:	e58d3018 	str	r3, [sp, #24]
#ifdef CFG_TEST_MEM2
	acoral_print("...................\n");
	acoral_print("Before free\n");
	v_mem_scan();
#endif
   	ctp=ctp+b_size;
30006d24:	e59d2014 	ldr	r2, [sp, #20]
30006d28:	e59d3018 	ldr	r3, [sp, #24]
30006d2c:	e0823003 	add	r3, r2, r3
30006d30:	e58d3014 	str	r3, [sp, #20]
	tp=(acoral_u32 *)ctp;
30006d34:	e59d3014 	ldr	r3, [sp, #20]
30006d38:	e58d300c 	str	r3, [sp, #12]
	if(BLOCK_FREE(*tp)){
30006d3c:	e59d300c 	ldr	r3, [sp, #12]
30006d40:	e5933000 	ldr	r3, [r3]
30006d44:	e2033001 	and	r3, r3, #1
30006d48:	e3530000 	cmp	r3, #0
30006d4c:	1a000013 	bne	30006da0 <v_free+0x168>
		size=BLOCK_SIZE(*tp);
30006d50:	e59d300c 	ldr	r3, [sp, #12]
30006d54:	e5933000 	ldr	r3, [r3]
30006d58:	e1a03423 	lsr	r3, r3, #8
30006d5c:	e58d301c 	str	r3, [sp, #28]
		if(size==0){
30006d60:	e59d301c 	ldr	r3, [sp, #28]
30006d64:	e3530000 	cmp	r3, #0
30006d68:	1a000005 	bne	30006d84 <v_free+0x14c>
			acoral_printerr("Err address is 0x%x,size should not be 0",tp);
30006d6c:	e59f0160 	ldr	r0, [pc, #352]	; 30006ed4 <v_free+0x29c>
30006d70:	e59d100c 	ldr	r1, [sp, #12]
30006d74:	eb001123 	bl	3000b208 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
30006d78:	e59f0148 	ldr	r0, [pc, #328]	; 30006ec8 <v_free+0x290>
30006d7c:	ebfff92a 	bl	3000522c <acoral_mutex_post>
			return;
30006d80:	ea00004d 	b	30006ebc <v_free+0x284>
		}
		b_size+=size;
30006d84:	e59d2018 	ldr	r2, [sp, #24]
30006d88:	e59d301c 	ldr	r3, [sp, #28]
30006d8c:	e0823003 	add	r3, r2, r3
30006d90:	e58d3018 	str	r3, [sp, #24]
		BLOCK_CLEAR(tp);
30006d94:	e59d300c 	ldr	r3, [sp, #12]
30006d98:	e3a02000 	mov	r2, #0
30006d9c:	e5832000 	str	r2, [r3]
	}
	BLOCK_SET_FREE(prev_tp,b_size);
30006da0:	e59d3018 	ldr	r3, [sp, #24]
30006da4:	e1a03403 	lsl	r3, r3, #8
30006da8:	e38320cc 	orr	r2, r3, #204	; 0xcc
30006dac:	e59d3010 	ldr	r3, [sp, #16]
30006db0:	e5832000 	str	r2, [r3]
	mem_ctrl.freep_p=prev_tp;
30006db4:	e59f310c 	ldr	r3, [pc, #268]	; 30006ec8 <v_free+0x290>
30006db8:	e59d2010 	ldr	r2, [sp, #16]
30006dbc:	e583202c 	str	r2, [r3, #44]	; 0x2c
	if(p==mem_ctrl.down_p){
30006dc0:	e59f3100 	ldr	r3, [pc, #256]	; 30006ec8 <v_free+0x290>
30006dc4:	e5932028 	ldr	r2, [r3, #40]	; 0x28
30006dc8:	e59d3004 	ldr	r3, [sp, #4]
30006dcc:	e1520003 	cmp	r2, r3
30006dd0:	1a000002 	bne	30006de0 <v_free+0x1a8>
#ifdef CFG_TEST_MEM2
		acoral_print("After free\n");
		v_mem_scan();
		acoral_print("...................\n");
#endif
		acoral_mutex_post(&mem_ctrl.mutex);
30006dd4:	e59f00ec 	ldr	r0, [pc, #236]	; 30006ec8 <v_free+0x290>
30006dd8:	ebfff913 	bl	3000522c <acoral_mutex_post>
		return;
30006ddc:	ea000036 	b	30006ebc <v_free+0x284>
	}
	ctp=mem_ctrl.down_p;
30006de0:	e59f30e0 	ldr	r3, [pc, #224]	; 30006ec8 <v_free+0x290>
30006de4:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30006de8:	e58d3014 	str	r3, [sp, #20]
	tp=(acoral_u32 *)ctp;
30006dec:	e59d3014 	ldr	r3, [sp, #20]
30006df0:	e58d300c 	str	r3, [sp, #12]
	while(ctp<(acoral_8 *)p){
30006df4:	ea000014 	b	30006e4c <v_free+0x214>
	     size=BLOCK_SIZE(*tp);
30006df8:	e59d300c 	ldr	r3, [sp, #12]
30006dfc:	e5933000 	ldr	r3, [r3]
30006e00:	e1a03423 	lsr	r3, r3, #8
30006e04:	e58d301c 	str	r3, [sp, #28]
	     if(size==0){
30006e08:	e59d301c 	ldr	r3, [sp, #28]
30006e0c:	e3530000 	cmp	r3, #0
30006e10:	1a000005 	bne	30006e2c <v_free+0x1f4>
			acoral_printerr("err address is 0x%x,size should not be 0",tp);
30006e14:	e59f00bc 	ldr	r0, [pc, #188]	; 30006ed8 <v_free+0x2a0>
30006e18:	e59d100c 	ldr	r1, [sp, #12]
30006e1c:	eb0010f9 	bl	3000b208 <acoral_print>
			acoral_mutex_post(&mem_ctrl.mutex);
30006e20:	e59f00a0 	ldr	r0, [pc, #160]	; 30006ec8 <v_free+0x290>
30006e24:	ebfff900 	bl	3000522c <acoral_mutex_post>
			return;
30006e28:	ea000023 	b	30006ebc <v_free+0x284>
             }
	     ctp=ctp+size;
30006e2c:	e59d2014 	ldr	r2, [sp, #20]
30006e30:	e59d301c 	ldr	r3, [sp, #28]
30006e34:	e0823003 	add	r3, r2, r3
30006e38:	e58d3014 	str	r3, [sp, #20]
	     prev_tp=tp;
30006e3c:	e59d300c 	ldr	r3, [sp, #12]
30006e40:	e58d3010 	str	r3, [sp, #16]
	     tp=(acoral_u32 *)ctp;
30006e44:	e59d3014 	ldr	r3, [sp, #20]
30006e48:	e58d300c 	str	r3, [sp, #12]
		acoral_mutex_post(&mem_ctrl.mutex);
		return;
	}
	ctp=mem_ctrl.down_p;
	tp=(acoral_u32 *)ctp;
	while(ctp<(acoral_8 *)p){
30006e4c:	e59d3004 	ldr	r3, [sp, #4]
30006e50:	e59d2014 	ldr	r2, [sp, #20]
30006e54:	e1520003 	cmp	r2, r3
30006e58:	3affffe6 	bcc	30006df8 <v_free+0x1c0>
             }
	     ctp=ctp+size;
	     prev_tp=tp;
	     tp=(acoral_u32 *)ctp;
	}
	if(BLOCK_FREE(*prev_tp)){
30006e5c:	e59d3010 	ldr	r3, [sp, #16]
30006e60:	e5933000 	ldr	r3, [r3]
30006e64:	e2033001 	and	r3, r3, #1
30006e68:	e3530000 	cmp	r3, #0
30006e6c:	1a00000e 	bne	30006eac <v_free+0x274>
		tp=(acoral_u32*)p;
30006e70:	e59d3004 	ldr	r3, [sp, #4]
30006e74:	e58d300c 	str	r3, [sp, #12]
		BLOCK_CLEAR(tp);
30006e78:	e59d300c 	ldr	r3, [sp, #12]
30006e7c:	e3a02000 	mov	r2, #0
30006e80:	e5832000 	str	r2, [r3]
		BLOCK_SET_FREE(prev_tp,b_size+size);
30006e84:	e59d2018 	ldr	r2, [sp, #24]
30006e88:	e59d301c 	ldr	r3, [sp, #28]
30006e8c:	e0823003 	add	r3, r2, r3
30006e90:	e1a03403 	lsl	r3, r3, #8
30006e94:	e38320cc 	orr	r2, r3, #204	; 0xcc
30006e98:	e59d3010 	ldr	r3, [sp, #16]
30006e9c:	e5832000 	str	r2, [r3]
		mem_ctrl.freep_p=prev_tp;
30006ea0:	e59f3020 	ldr	r3, [pc, #32]	; 30006ec8 <v_free+0x290>
30006ea4:	e59d2010 	ldr	r2, [sp, #16]
30006ea8:	e583202c 	str	r2, [r3, #44]	; 0x2c
#ifdef CFG_TEST_MEM2
	acoral_print("After free\n");
	v_mem_scan();
	acoral_print("...................\n");
#endif
	acoral_mutex_post(&mem_ctrl.mutex);
30006eac:	e59f0014 	ldr	r0, [pc, #20]	; 30006ec8 <v_free+0x290>
30006eb0:	ebfff8dd 	bl	3000522c <acoral_mutex_post>
30006eb4:	ea000000 	b	30006ebc <v_free+0x284>
void v_free(void * p){
	acoral_u32 * tp,*prev_tp;
	acoral_8 * ctp;
	acoral_u32 b_size,size;
	if(mem_ctrl.mem_state==0)
		return;
30006eb8:	e1a00000 	nop			; (mov r0, r0)
	acoral_print("After free\n");
	v_mem_scan();
	acoral_print("...................\n");
#endif
	acoral_mutex_post(&mem_ctrl.mutex);
}
30006ebc:	e28dd024 	add	sp, sp, #36	; 0x24
30006ec0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006ec4:	e12fff1e 	bx	lr
30006ec8:	3000f980 	.word	0x3000f980
30006ecc:	3000e488 	.word	0x3000e488
30006ed0:	3000e4a4 	.word	0x3000e4a4
30006ed4:	3000e45c 	.word	0x3000e45c
30006ed8:	3000e4c4 	.word	0x3000e4c4

30006edc <v_mem_init>:

void v_mem_init(){
30006edc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006ee0:	e24dd00c 	sub	sp, sp, #12
	acoral_size size;
	size=acoral_malloc_size(MEM_SIZE);
30006ee4:	e3a00afa 	mov	r0, #1024000	; 0xfa000
30006ee8:	ebfffd01 	bl	300062f4 <buddy_malloc_size>
30006eec:	e1a03000 	mov	r3, r0
30006ef0:	e58d3004 	str	r3, [sp, #4]
	mem_ctrl.down_p=(acoral_8 *)acoral_malloc(size);
30006ef4:	e59d0004 	ldr	r0, [sp, #4]
30006ef8:	ebfffd26 	bl	30006398 <buddy_malloc>
30006efc:	e1a03000 	mov	r3, r0
30006f00:	e1a02003 	mov	r2, r3
30006f04:	e59f3088 	ldr	r3, [pc, #136]	; 30006f94 <v_mem_init+0xb8>
30006f08:	e5832028 	str	r2, [r3, #40]	; 0x28
	if(mem_ctrl.down_p==NULL){
30006f0c:	e59f3080 	ldr	r3, [pc, #128]	; 30006f94 <v_mem_init+0xb8>
30006f10:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30006f14:	e3530000 	cmp	r3, #0
30006f18:	1a000003 	bne	30006f2c <v_mem_init+0x50>
		mem_ctrl.mem_state=0;
30006f1c:	e59f3070 	ldr	r3, [pc, #112]	; 30006f94 <v_mem_init+0xb8>
30006f20:	e3a02000 	mov	r2, #0
30006f24:	e5c32030 	strb	r2, [r3, #48]	; 0x30
		return;
30006f28:	ea000016 	b	30006f88 <v_mem_init+0xac>
	}
	else{
		mem_ctrl.mem_state=1;
30006f2c:	e59f3060 	ldr	r3, [pc, #96]	; 30006f94 <v_mem_init+0xb8>
30006f30:	e3a02001 	mov	r2, #1
30006f34:	e5c32030 	strb	r2, [r3, #48]	; 0x30
	}
	acoral_mutex_init(&mem_ctrl.mutex,0);
30006f38:	e59f0054 	ldr	r0, [pc, #84]	; 30006f94 <v_mem_init+0xb8>
30006f3c:	e3a01000 	mov	r1, #0
30006f40:	ebfff791 	bl	30004d8c <acoral_mutex_init>
	mem_ctrl.top_p=mem_ctrl.down_p+size;
30006f44:	e59f3048 	ldr	r3, [pc, #72]	; 30006f94 <v_mem_init+0xb8>
30006f48:	e5932028 	ldr	r2, [r3, #40]	; 0x28
30006f4c:	e59d3004 	ldr	r3, [sp, #4]
30006f50:	e0822003 	add	r2, r2, r3
30006f54:	e59f3038 	ldr	r3, [pc, #56]	; 30006f94 <v_mem_init+0xb8>
30006f58:	e5832024 	str	r2, [r3, #36]	; 0x24
	mem_ctrl.freep_p=(acoral_u32 *)mem_ctrl.down_p;
30006f5c:	e59f3030 	ldr	r3, [pc, #48]	; 30006f94 <v_mem_init+0xb8>
30006f60:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30006f64:	e1a02003 	mov	r2, r3
30006f68:	e59f3024 	ldr	r3, [pc, #36]	; 30006f94 <v_mem_init+0xb8>
30006f6c:	e583202c 	str	r2, [r3, #44]	; 0x2c
	BLOCK_SET_FREE(mem_ctrl.freep_p,size);
30006f70:	e59f301c 	ldr	r3, [pc, #28]	; 30006f94 <v_mem_init+0xb8>
30006f74:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
30006f78:	e59d2004 	ldr	r2, [sp, #4]
30006f7c:	e1a02402 	lsl	r2, r2, #8
30006f80:	e38220cc 	orr	r2, r2, #204	; 0xcc
30006f84:	e5832000 	str	r2, [r3]
#ifdef CFG_TEST
	mem_ctrl.alloc_size=0;
	mem_ctrl.alloc_num=0;
	mem_ctrl.free_num=0;
#endif
}
30006f88:	e28dd00c 	add	sp, sp, #12
30006f8c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30006f90:	e12fff1e 	bx	lr
30006f94:	3000f980 	.word	0x3000f980

30006f98 <v_mem_scan>:

void v_mem_scan(void){
30006f98:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30006f9c:	e24dd014 	sub	sp, sp, #20
        acoral_8 * ctp;
	acoral_u32 * tp;
	acoral_u32 size;
	if(mem_ctrl.mem_state==0){
30006fa0:	e59f30c0 	ldr	r3, [pc, #192]	; 30007068 <v_mem_scan+0xd0>
30006fa4:	e5d33030 	ldrb	r3, [r3, #48]	; 0x30
30006fa8:	e3530000 	cmp	r3, #0
30006fac:	1a000002 	bne	30006fbc <v_mem_scan+0x24>
		acoral_print("Mem Init Err ,so no mem space to malloc\r\n");
30006fb0:	e59f00b4 	ldr	r0, [pc, #180]	; 3000706c <v_mem_scan+0xd4>
30006fb4:	eb001093 	bl	3000b208 <acoral_print>
		return;
30006fb8:	ea000027 	b	3000705c <v_mem_scan+0xc4>
	}
	ctp=mem_ctrl.down_p;
30006fbc:	e59f30a4 	ldr	r3, [pc, #164]	; 30007068 <v_mem_scan+0xd0>
30006fc0:	e5933028 	ldr	r3, [r3, #40]	; 0x28
30006fc4:	e58d3004 	str	r3, [sp, #4]
	do{
		tp=(acoral_u32 *)ctp;
30006fc8:	e59d3004 	ldr	r3, [sp, #4]
30006fcc:	e58d3008 	str	r3, [sp, #8]
		size=BLOCK_SIZE(*tp);
30006fd0:	e59d3008 	ldr	r3, [sp, #8]
30006fd4:	e5933000 	ldr	r3, [r3]
30006fd8:	e1a03423 	lsr	r3, r3, #8
30006fdc:	e58d300c 	str	r3, [sp, #12]
		if(size==0){
30006fe0:	e59d300c 	ldr	r3, [sp, #12]
30006fe4:	e3530000 	cmp	r3, #0
30006fe8:	1a000003 	bne	30006ffc <v_mem_scan+0x64>
			acoral_print("Err address is 0x%x,size should not be 0\r\n",tp);
30006fec:	e59f007c 	ldr	r0, [pc, #124]	; 30007070 <v_mem_scan+0xd8>
30006ff0:	e59d1008 	ldr	r1, [sp, #8]
30006ff4:	eb001083 	bl	3000b208 <acoral_print>
			break;
30006ff8:	ea000017 	b	3000705c <v_mem_scan+0xc4>
		}
		if(BLOCK_USED(*tp)){
30006ffc:	e59d3008 	ldr	r3, [sp, #8]
30007000:	e5933000 	ldr	r3, [r3]
30007004:	e2033001 	and	r3, r3, #1
30007008:	e20330ff 	and	r3, r3, #255	; 0xff
3000700c:	e3530000 	cmp	r3, #0
30007010:	0a000004 	beq	30007028 <v_mem_scan+0x90>
			acoral_print("The address is 0x%x,the block is used and it's size is %d\r\n",tp,size);
30007014:	e59f0058 	ldr	r0, [pc, #88]	; 30007074 <v_mem_scan+0xdc>
30007018:	e59d1008 	ldr	r1, [sp, #8]
3000701c:	e59d200c 	ldr	r2, [sp, #12]
30007020:	eb001078 	bl	3000b208 <acoral_print>
30007024:	ea000003 	b	30007038 <v_mem_scan+0xa0>
		}
		else{
			
			acoral_print("The address is 0x%x,the block is unused and it's size is %d\r\n",tp,size);
30007028:	e59f0048 	ldr	r0, [pc, #72]	; 30007078 <v_mem_scan+0xe0>
3000702c:	e59d1008 	ldr	r1, [sp, #8]
30007030:	e59d200c 	ldr	r2, [sp, #12]
30007034:	eb001073 	bl	3000b208 <acoral_print>
		}
		ctp=ctp+size;
30007038:	e59d2004 	ldr	r2, [sp, #4]
3000703c:	e59d300c 	ldr	r3, [sp, #12]
30007040:	e0823003 	add	r3, r2, r3
30007044:	e58d3004 	str	r3, [sp, #4]
	}while(ctp<mem_ctrl.top_p);
30007048:	e59f3018 	ldr	r3, [pc, #24]	; 30007068 <v_mem_scan+0xd0>
3000704c:	e5932024 	ldr	r2, [r3, #36]	; 0x24
30007050:	e59d3004 	ldr	r3, [sp, #4]
30007054:	e1520003 	cmp	r2, r3
30007058:	8affffda 	bhi	30006fc8 <v_mem_scan+0x30>
#ifdef CFG_TEST
	acoral_print("Alloc Size:%d  Free_num:%d  alloc_num:%d\r\n",mem_ctrl.alloc_size,mem_ctrl.free_num,mem_ctrl.alloc_num);
#endif
}
3000705c:	e28dd014 	add	sp, sp, #20
30007060:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007064:	e12fff1e 	bx	lr
30007068:	3000f980 	.word	0x3000f980
3000706c:	3000e4f0 	.word	0x3000e4f0
30007070:	3000e51c 	.word	0x3000e51c
30007074:	3000e548 	.word	0x3000e548
30007078:	3000e584 	.word	0x3000e584

3000707c <acoral_mbox_create>:
/*====================================
 *     create a mailbox
 *       创建一个邮箱
 *====================================*/
acoral_evt_t *acoral_mbox_create()
{
3000707c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007080:	e24dd00c 	sub	sp, sp, #12
  	acoral_evt_t * event;
	
	event=acoral_alloc_evt();
30007084:	ebfff6cc 	bl	30004bbc <acoral_alloc_evt>
30007088:	e1a03000 	mov	r3, r0
3000708c:	e58d3004 	str	r3, [sp, #4]
	if (NULL == event)
30007090:	e59d3004 	ldr	r3, [sp, #4]
30007094:	e3530000 	cmp	r3, #0
30007098:	1a000001 	bne	300070a4 <acoral_mbox_create+0x28>
		return NULL;
3000709c:	e3a03000 	mov	r3, #0
300070a0:	ea00000b 	b	300070d4 <acoral_mbox_create+0x58>

	event->type  = ACORAL_EVENT_MBOX;
300070a4:	e59d3004 	ldr	r3, [sp, #4]
300070a8:	e3a02003 	mov	r2, #3
300070ac:	e5c32004 	strb	r2, [r3, #4]
	event->count = 0x00000000;
300070b0:	e59d3004 	ldr	r3, [sp, #4]
300070b4:	e3a02000 	mov	r2, #0
300070b8:	e583200c 	str	r2, [r3, #12]
	event->data  = NULL;
300070bc:	e59d3004 	ldr	r3, [sp, #4]
300070c0:	e3a02000 	mov	r2, #0
300070c4:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(event);
300070c8:	e59d0004 	ldr	r0, [sp, #4]
300070cc:	ebfff6c2 	bl	30004bdc <acoral_evt_init>
	return event;
300070d0:	e59d3004 	ldr	r3, [sp, #4]
}
300070d4:	e1a00003 	mov	r0, r3
300070d8:	e28dd00c 	add	sp, sp, #12
300070dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300070e0:	e12fff1e 	bx	lr

300070e4 <acoral_mbox_del>:
/*=====================================
 *   delete a mailbox
 *     删除一个邮箱
 *=====================================*/
acoral_u32 acoral_mbox_del(acoral_evt_t* event)
{
300070e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300070e8:	e24dd00c 	sub	sp, sp, #12
300070ec:	e58d0004 	str	r0, [sp, #4]
	if (acoral_intr_nesting > 0)
300070f0:	ebffe99a 	bl	30001760 <hal_get_intr_nesting_comm>
300070f4:	e1a03000 	mov	r3, r0
300070f8:	e3530000 	cmp	r3, #0
300070fc:	da000001 	ble	30007108 <acoral_mbox_del+0x24>
		return MBOX_ERR_INTR;
30007100:	e3a03006 	mov	r3, #6
30007104:	ea00000e 	b	30007144 <acoral_mbox_del+0x60>
	
	if (NULL == event)
30007108:	e59d3004 	ldr	r3, [sp, #4]
3000710c:	e3530000 	cmp	r3, #0
30007110:	1a000001 	bne	3000711c <acoral_mbox_del+0x38>
		return MBOX_ERR_NULL;
30007114:	e3a03002 	mov	r3, #2
30007118:	ea000009 	b	30007144 <acoral_mbox_del+0x60>

	if(event->type != ACORAL_EVENT_MBOX)
3000711c:	e59d3004 	ldr	r3, [sp, #4]
30007120:	e5d33004 	ldrb	r3, [r3, #4]
30007124:	e3530003 	cmp	r3, #3
30007128:	0a000001 	beq	30007134 <acoral_mbox_del+0x50>
		return MBOX_ERR_TYPE;
3000712c:	e3a03004 	mov	r3, #4
30007130:	ea000003 	b	30007144 <acoral_mbox_del+0x60>

	acoral_release_thread((acoral_res_t *)event); 
30007134:	e59d3004 	ldr	r3, [sp, #4]
30007138:	e1a00003 	mov	r0, r3
3000713c:	ebffed72 	bl	3000270c <acoral_release_thread>
	return MBOX_SUCCED;
30007140:	e3a03000 	mov	r3, #0
}
30007144:	e1a00003 	mov	r0, r3
30007148:	e28dd00c 	add	sp, sp, #12
3000714c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007150:	e12fff1e 	bx	lr

30007154 <acoral_mbox_send>:
/*======================================
 *     send a mail to mailbox
 *       发送邮件至邮箱
 *======================================*/
acoral_u32 acoral_mbox_send(acoral_evt_t * event, void *msg)
{
30007154:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007158:	e24dd014 	sub	sp, sp, #20
3000715c:	e58d0004 	str	r0, [sp, #4]
30007160:	e58d1000 	str	r1, [sp]
	acoral_thread_t     *thread;

	/*if (acoral_intr_nesting > 0)
		return MBOX_ERR_INTR;
	*/
	if (NULL == event)
30007164:	e59d3004 	ldr	r3, [sp, #4]
30007168:	e3530000 	cmp	r3, #0
3000716c:	1a000001 	bne	30007178 <acoral_mbox_send+0x24>
		return MBOX_ERR_NULL;
30007170:	e3a03002 	mov	r3, #2
30007174:	ea000028 	b	3000721c <acoral_mbox_send+0xc8>

	if(event->type != ACORAL_EVENT_MBOX)
30007178:	e59d3004 	ldr	r3, [sp, #4]
3000717c:	e5d33004 	ldrb	r3, [r3, #4]
30007180:	e3530003 	cmp	r3, #3
30007184:	0a000001 	beq	30007190 <acoral_mbox_send+0x3c>
		return MBOX_ERR_TYPE;
30007188:	e3a03004 	mov	r3, #4
3000718c:	ea000022 	b	3000721c <acoral_mbox_send+0xc8>

	HAL_ENTER_CRITICAL();
30007190:	ebffe957 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007194:	e1a03000 	mov	r3, r0
30007198:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&event->spin_lock);
	if(event->data != NULL)
3000719c:	e59d3004 	ldr	r3, [sp, #4]
300071a0:	e5933020 	ldr	r3, [r3, #32]
300071a4:	e3530000 	cmp	r3, #0
300071a8:	0a000003 	beq	300071bc <acoral_mbox_send+0x68>
	{
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
300071ac:	e59d0008 	ldr	r0, [sp, #8]
300071b0:	ebffe94d 	bl	300016ec <HAL_INTR_RESTORE>
		return MBOX_ERR_MES_EXIST;
300071b4:	e3a03005 	mov	r3, #5
300071b8:	ea000017 	b	3000721c <acoral_mbox_send+0xc8>
	}
	event->data = msg;
300071bc:	e59d3004 	ldr	r3, [sp, #4]
300071c0:	e59d2000 	ldr	r2, [sp]
300071c4:	e5832020 	str	r2, [r3, #32]
	thread =acoral_evt_high_thread(event);
300071c8:	e59d0004 	ldr	r0, [sp, #4]
300071cc:	ebfff69c 	bl	30004c44 <acoral_evt_high_thread>
300071d0:	e1a03000 	mov	r3, r0
300071d4:	e58d300c 	str	r3, [sp, #12]
	/* 释放等待进程*/
	if (thread==NULL)
300071d8:	e59d300c 	ldr	r3, [sp, #12]
300071dc:	e3530000 	cmp	r3, #0
300071e0:	1a000003 	bne	300071f4 <acoral_mbox_send+0xa0>
	{
		/* 没有等待队列*/
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
300071e4:	e59d0008 	ldr	r0, [sp, #8]
300071e8:	ebffe93f 	bl	300016ec <HAL_INTR_RESTORE>
		return  MBOX_SUCCED;
300071ec:	e3a03000 	mov	r3, #0
300071f0:	ea000009 	b	3000721c <acoral_mbox_send+0xc8>
	}
	/*释放等待任务*/
	timeout_queue_del(thread);
300071f4:	e59d000c 	ldr	r0, [sp, #12]
300071f8:	ebfff5bc 	bl	300048f0 <timeout_queue_del>
	acoral_evt_queue_del(thread);
300071fc:	e59d000c 	ldr	r0, [sp, #12]
30007200:	ebfff6d4 	bl	30004d58 <acoral_evt_queue_del>
	acoral_rdy_thread(thread);
30007204:	e59d000c 	ldr	r0, [sp, #12]
30007208:	ebffee52 	bl	30002b58 <acoral_rdy_thread>
	acoral_spin_unlock(&event->spin_lock);
	HAL_EXIT_CRITICAL();
3000720c:	e59d0008 	ldr	r0, [sp, #8]
30007210:	ebffe935 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30007214:	ebffec77 	bl	300023f8 <acoral_sched>
	return MBOX_SUCCED;
30007218:	e3a03000 	mov	r3, #0
}
3000721c:	e1a00003 	mov	r0, r3
30007220:	e28dd014 	add	sp, sp, #20
30007224:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007228:	e12fff1e 	bx	lr

3000722c <acoral_mbox_recv>:
/*======================================
 *    receive  a mail to mailbox
 *       接收邮件从邮箱
 *======================================*/
void* acoral_mbox_recv(acoral_evt_t * event, acoral_time timeout)
{
3000722c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007230:	e24dd01c 	sub	sp, sp, #28
30007234:	e58d0004 	str	r0, [sp, #4]
30007238:	e58d1000 	str	r1, [sp]
	void            *msg;
	acoral_sr         cpu_sr;
	acoral_thread_t  *cur;
	
	if (acoral_intr_nesting > 0)
3000723c:	ebffe947 	bl	30001760 <hal_get_intr_nesting_comm>
30007240:	e1a03000 	mov	r3, r0
30007244:	e3530000 	cmp	r3, #0
30007248:	da000001 	ble	30007254 <acoral_mbox_recv+0x28>
		return NULL;
3000724c:	e3a03000 	mov	r3, #0
30007250:	ea00004d 	b	3000738c <acoral_mbox_recv+0x160>

	if(event->type!=ACORAL_EVENT_MBOX)
30007254:	e59d3004 	ldr	r3, [sp, #4]
30007258:	e5d33004 	ldrb	r3, [r3, #4]
3000725c:	e3530003 	cmp	r3, #3
30007260:	0a000001 	beq	3000726c <acoral_mbox_recv+0x40>
		return NULL;
30007264:	e3a03000 	mov	r3, #0
30007268:	ea000047 	b	3000738c <acoral_mbox_recv+0x160>
	
	HAL_ENTER_CRITICAL();
3000726c:	ebffe920 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007270:	e1a03000 	mov	r3, r0
30007274:	e58d3010 	str	r3, [sp, #16]
	acoral_spin_lock(&event->spin_lock);
	if( event->data == NULL)
30007278:	e59d3004 	ldr	r3, [sp, #4]
3000727c:	e5933020 	ldr	r3, [r3, #32]
30007280:	e3530000 	cmp	r3, #0
30007284:	1a000037 	bne	30007368 <acoral_mbox_recv+0x13c>
	{
		cur = acoral_cur_thread;
30007288:	e59f310c 	ldr	r3, [pc, #268]	; 3000739c <acoral_mbox_recv+0x170>
3000728c:	e5933000 	ldr	r3, [r3]
30007290:	e58d3014 	str	r3, [sp, #20]
		if (timeout > 0)
30007294:	e59d3000 	ldr	r3, [sp]
30007298:	e3530000 	cmp	r3, #0
3000729c:	0a00000f 	beq	300072e0 <acoral_mbox_recv+0xb4>
		{
			cur->delay = TIME_TO_TICKS(timeout);
300072a0:	e59d2000 	ldr	r2, [sp]
300072a4:	e1a03002 	mov	r3, r2
300072a8:	e1a03103 	lsl	r3, r3, #2
300072ac:	e0833002 	add	r3, r3, r2
300072b0:	e1a02103 	lsl	r2, r3, #2
300072b4:	e0833002 	add	r3, r3, r2
300072b8:	e1a03103 	lsl	r3, r3, #2
300072bc:	e1a02003 	mov	r2, r3
300072c0:	e59f30d8 	ldr	r3, [pc, #216]	; 300073a0 <acoral_mbox_recv+0x174>
300072c4:	e0831392 	umull	r1, r3, r2, r3
300072c8:	e1a03323 	lsr	r3, r3, #6
300072cc:	e1a02003 	mov	r2, r3
300072d0:	e59d3014 	ldr	r3, [sp, #20]
300072d4:	e5832040 	str	r2, [r3, #64]	; 0x40
			timeout_queue_add(cur);
300072d8:	e59d0014 	ldr	r0, [sp, #20]
300072dc:	ebfff541 	bl	300047e8 <timeout_queue_add>
		}
		acoral_unrdy_thread(cur);
300072e0:	e59d0014 	ldr	r0, [sp, #20]
300072e4:	ebffee2a 	bl	30002b94 <acoral_unrdy_thread>
		acoral_evt_queue_add(event, cur);
300072e8:	e59d0004 	ldr	r0, [sp, #4]
300072ec:	e59d1014 	ldr	r1, [sp, #20]
300072f0:	ebfff667 	bl	30004c94 <acoral_evt_queue_add>
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
300072f4:	e59d0010 	ldr	r0, [sp, #16]
300072f8:	ebffe8fb 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_sched();
300072fc:	ebffec3d 	bl	300023f8 <acoral_sched>
		HAL_ENTER_CRITICAL();
30007300:	ebffe8fb 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007304:	e1a03000 	mov	r3, r0
30007308:	e58d3010 	str	r3, [sp, #16]
		acoral_spin_lock(&event->spin_lock);

		if (timeout > 0 && cur->delay <= 0)
3000730c:	e59d3000 	ldr	r3, [sp]
30007310:	e3530000 	cmp	r3, #0
30007314:	0a000009 	beq	30007340 <acoral_mbox_recv+0x114>
30007318:	e59d3014 	ldr	r3, [sp, #20]
3000731c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30007320:	e3530000 	cmp	r3, #0
30007324:	ca000005 	bgt	30007340 <acoral_mbox_recv+0x114>
		{
			acoral_evt_queue_del(cur);
30007328:	e59d0014 	ldr	r0, [sp, #20]
3000732c:	ebfff689 	bl	30004d58 <acoral_evt_queue_del>
			acoral_spin_unlock(&event->spin_lock);
			HAL_EXIT_CRITICAL();
30007330:	e59d0010 	ldr	r0, [sp, #16]
30007334:	ebffe8ec 	bl	300016ec <HAL_INTR_RESTORE>
			return NULL;
30007338:	e3a03000 	mov	r3, #0
3000733c:	ea000012 	b	3000738c <acoral_mbox_recv+0x160>
		}

		msg        = event->data;
30007340:	e59d3004 	ldr	r3, [sp, #4]
30007344:	e5933020 	ldr	r3, [r3, #32]
30007348:	e58d300c 	str	r3, [sp, #12]
		event->data = NULL;
3000734c:	e59d3004 	ldr	r3, [sp, #4]
30007350:	e3a02000 	mov	r2, #0
30007354:	e5832020 	str	r2, [r3, #32]
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
30007358:	e59d0010 	ldr	r0, [sp, #16]
3000735c:	ebffe8e2 	bl	300016ec <HAL_INTR_RESTORE>
		return msg;
30007360:	e59d300c 	ldr	r3, [sp, #12]
30007364:	ea000008 	b	3000738c <acoral_mbox_recv+0x160>
	}
	
	msg         = event->data;
30007368:	e59d3004 	ldr	r3, [sp, #4]
3000736c:	e5933020 	ldr	r3, [r3, #32]
30007370:	e58d300c 	str	r3, [sp, #12]
	event->data = NULL;
30007374:	e59d3004 	ldr	r3, [sp, #4]
30007378:	e3a02000 	mov	r2, #0
3000737c:	e5832020 	str	r2, [r3, #32]
	acoral_spin_unlock(&event->spin_lock);
	HAL_EXIT_CRITICAL();
30007380:	e59d0010 	ldr	r0, [sp, #16]
30007384:	ebffe8d8 	bl	300016ec <HAL_INTR_RESTORE>

	return msg;
30007388:	e59d300c 	ldr	r3, [sp, #12]
}
3000738c:	e1a00003 	mov	r0, r3
30007390:	e28dd01c 	add	sp, sp, #28
30007394:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007398:	e12fff1e 	bx	lr
3000739c:	300103f8 	.word	0x300103f8
300073a0:	10624dd3 	.word	0x10624dd3

300073a4 <acoral_mbox_tryrecv>:
/*======================================
 *   try receive  a mail to mailbox
 *       接收邮件从邮箱
 *======================================*/
void* acoral_mbox_tryrecv(acoral_evt_t * event)
{
300073a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300073a8:	e24dd014 	sub	sp, sp, #20
300073ac:	e58d0004 	str	r0, [sp, #4]
	void            *msg;
	acoral_sr         cpu_sr;
	
	if (acoral_intr_nesting > 0)
300073b0:	ebffe8ea 	bl	30001760 <hal_get_intr_nesting_comm>
300073b4:	e1a03000 	mov	r3, r0
300073b8:	e3530000 	cmp	r3, #0
300073bc:	da000001 	ble	300073c8 <acoral_mbox_tryrecv+0x24>
		return NULL;
300073c0:	e3a03000 	mov	r3, #0
300073c4:	ea000019 	b	30007430 <acoral_mbox_tryrecv+0x8c>

	if(event->type!=ACORAL_EVENT_MBOX)
300073c8:	e59d3004 	ldr	r3, [sp, #4]
300073cc:	e5d33004 	ldrb	r3, [r3, #4]
300073d0:	e3530003 	cmp	r3, #3
300073d4:	0a000001 	beq	300073e0 <acoral_mbox_tryrecv+0x3c>
		return NULL;
300073d8:	e3a03000 	mov	r3, #0
300073dc:	ea000013 	b	30007430 <acoral_mbox_tryrecv+0x8c>
	
	HAL_ENTER_CRITICAL();
300073e0:	ebffe8c3 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300073e4:	e1a03000 	mov	r3, r0
300073e8:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&event->spin_lock);
	if( event->data == NULL)
300073ec:	e59d3004 	ldr	r3, [sp, #4]
300073f0:	e5933020 	ldr	r3, [r3, #32]
300073f4:	e3530000 	cmp	r3, #0
300073f8:	1a000003 	bne	3000740c <acoral_mbox_tryrecv+0x68>
	{
		acoral_spin_unlock(&event->spin_lock);
		HAL_EXIT_CRITICAL();
300073fc:	e59d000c 	ldr	r0, [sp, #12]
30007400:	ebffe8b9 	bl	300016ec <HAL_INTR_RESTORE>
		return NULL;
30007404:	e3a03000 	mov	r3, #0
30007408:	ea000008 	b	30007430 <acoral_mbox_tryrecv+0x8c>
	}
	
	msg         = event->data;
3000740c:	e59d3004 	ldr	r3, [sp, #4]
30007410:	e5933020 	ldr	r3, [r3, #32]
30007414:	e58d3008 	str	r3, [sp, #8]
	event->data = NULL;
30007418:	e59d3004 	ldr	r3, [sp, #4]
3000741c:	e3a02000 	mov	r2, #0
30007420:	e5832020 	str	r2, [r3, #32]
	acoral_spin_unlock(&event->spin_lock);
	HAL_EXIT_CRITICAL();
30007424:	e59d000c 	ldr	r0, [sp, #12]
30007428:	ebffe8af 	bl	300016ec <HAL_INTR_RESTORE>

	return msg;
3000742c:	e59d3008 	ldr	r3, [sp, #8]
}
30007430:	e1a00003 	mov	r0, r3
30007434:	e28dd014 	add	sp, sp, #20
30007438:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000743c:	e12fff1e 	bx	lr

30007440 <acoral_sem_init>:
#include <timer.h>
#include <print.h>
#include <sem.h>
acoral_thread_t *acoral_evt_high_thread(acoral_evt_t *evt);
acoral_u32 *acoral_sem_init(acoral_evt_t *evt,acoral_u32 semNum)
{
30007440:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007444:	e24dd00c 	sub	sp, sp, #12
30007448:	e58d0004 	str	r0, [sp, #4]
3000744c:	e58d1000 	str	r1, [sp]
	if (NULL == evt)
30007450:	e59d3004 	ldr	r3, [sp, #4]
30007454:	e3530000 	cmp	r3, #0
30007458:	1a000001 	bne	30007464 <acoral_sem_init+0x24>
	{
		return NULL;
3000745c:	e3a03000 	mov	r3, #0
30007460:	ea00000e 	b	300074a0 <acoral_sem_init+0x60>
	}
	semNum = 1 - semNum;  /* 拥有多个资源，0,一个  -1 两个， -2 三个 ....*/
30007464:	e59d3000 	ldr	r3, [sp]
30007468:	e2633001 	rsb	r3, r3, #1
3000746c:	e58d3000 	str	r3, [sp]
	evt->count = semNum;
30007470:	e59d2000 	ldr	r2, [sp]
30007474:	e59d3004 	ldr	r3, [sp, #4]
30007478:	e583200c 	str	r2, [r3, #12]
	evt->type  = ACORAL_EVENT_SEM;
3000747c:	e59d3004 	ldr	r3, [sp, #4]
30007480:	e3a02000 	mov	r2, #0
30007484:	e5c32004 	strb	r2, [r3, #4]
	evt->data  = NULL;
30007488:	e59d3004 	ldr	r3, [sp, #4]
3000748c:	e3a02000 	mov	r2, #0
30007490:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
30007494:	e59d0004 	ldr	r0, [sp, #4]
30007498:	ebfff5cf 	bl	30004bdc <acoral_evt_init>
	return SEM_SUCCED;
3000749c:	e3a03000 	mov	r3, #0
}
300074a0:	e1a00003 	mov	r0, r3
300074a4:	e28dd00c 	add	sp, sp, #12
300074a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300074ac:	e12fff1e 	bx	lr

300074b0 <acoral_sem_create>:
/*============================
 *   the creation of signal
 *   计算信号量的创建
 *============================*/
acoral_evt_t *acoral_sem_create(acoral_u32 semNum)
{
300074b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300074b4:	e24dd014 	sub	sp, sp, #20
300074b8:	e58d0004 	str	r0, [sp, #4]
	acoral_evt_t *evt;
	evt = acoral_alloc_evt();
300074bc:	ebfff5be 	bl	30004bbc <acoral_alloc_evt>
300074c0:	e1a03000 	mov	r3, r0
300074c4:	e58d300c 	str	r3, [sp, #12]
	if (NULL == evt)
300074c8:	e59d300c 	ldr	r3, [sp, #12]
300074cc:	e3530000 	cmp	r3, #0
300074d0:	1a000001 	bne	300074dc <acoral_sem_create+0x2c>
	{
		return NULL;
300074d4:	e3a03000 	mov	r3, #0
300074d8:	ea00000e 	b	30007518 <acoral_sem_create+0x68>
	}
	semNum = 1 - semNum;  /* 拥有多个资源，0,一个  -1 两个， -2 三个 ....*/
300074dc:	e59d3004 	ldr	r3, [sp, #4]
300074e0:	e2633001 	rsb	r3, r3, #1
300074e4:	e58d3004 	str	r3, [sp, #4]
	evt->count = semNum;
300074e8:	e59d2004 	ldr	r2, [sp, #4]
300074ec:	e59d300c 	ldr	r3, [sp, #12]
300074f0:	e583200c 	str	r2, [r3, #12]
	evt->type  = ACORAL_EVENT_SEM;
300074f4:	e59d300c 	ldr	r3, [sp, #12]
300074f8:	e3a02000 	mov	r2, #0
300074fc:	e5c32004 	strb	r2, [r3, #4]
	evt->data  = NULL;
30007500:	e59d300c 	ldr	r3, [sp, #12]
30007504:	e3a02000 	mov	r2, #0
30007508:	e5832020 	str	r2, [r3, #32]
	acoral_evt_init(evt);
3000750c:	e59d000c 	ldr	r0, [sp, #12]
30007510:	ebfff5b1 	bl	30004bdc <acoral_evt_init>
	return evt;
30007514:	e59d300c 	ldr	r3, [sp, #12]
}
30007518:	e1a00003 	mov	r0, r3
3000751c:	e28dd014 	add	sp, sp, #20
30007520:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007524:	e12fff1e 	bx	lr

30007528 <acoral_sem_del>:
/*============================
 *  the deletion of singal 
 *   计算信号量的删除
 *============================*/
acoral_u32 acoral_sem_del(acoral_evt_t *evt, acoral_u32 opt)
{
30007528:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000752c:	e24dd014 	sub	sp, sp, #20
30007530:	e58d0004 	str	r0, [sp, #4]
30007534:	e58d1000 	str	r1, [sp]
	acoral_sr            cpu_sr;
	acoral_thread_t     *thread;
	if (acoral_intr_nesting)
30007538:	ebffe888 	bl	30001760 <hal_get_intr_nesting_comm>
3000753c:	e1a03000 	mov	r3, r0
30007540:	e3530000 	cmp	r3, #0
30007544:	0a000001 	beq	30007550 <acoral_sem_del+0x28>
	{
		return SEM_ERR_INTR;
30007548:	e3a03006 	mov	r3, #6
3000754c:	ea00001d 	b	300075c8 <acoral_sem_del+0xa0>
	}
	/* 参数检测*/
	if (NULL == evt)
30007550:	e59d3004 	ldr	r3, [sp, #4]
30007554:	e3530000 	cmp	r3, #0
30007558:	1a000001 	bne	30007564 <acoral_sem_del+0x3c>
		return SEM_ERR_NULL; /* error*/
3000755c:	e3a03002 	mov	r3, #2
30007560:	ea000018 	b	300075c8 <acoral_sem_del+0xa0>
	if ( evt->type != ACORAL_EVENT_SEM )
30007564:	e59d3004 	ldr	r3, [sp, #4]
30007568:	e5d33004 	ldrb	r3, [r3, #4]
3000756c:	e3530000 	cmp	r3, #0
30007570:	0a000001 	beq	3000757c <acoral_sem_del+0x54>
		return SEM_ERR_TYPE; /* error*/
30007574:	e3a03004 	mov	r3, #4
30007578:	ea000012 	b	300075c8 <acoral_sem_del+0xa0>

	HAL_ENTER_CRITICAL();
3000757c:	ebffe85c 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007580:	e1a03000 	mov	r3, r0
30007584:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&evt->spin_lock);
	thread =acoral_evt_high_thread(evt);
30007588:	e59d0004 	ldr	r0, [sp, #4]
3000758c:	ebfff5ac 	bl	30004c44 <acoral_evt_high_thread>
30007590:	e1a03000 	mov	r3, r0
30007594:	e58d300c 	str	r3, [sp, #12]
	if (thread==NULL)
30007598:	e59d300c 	ldr	r3, [sp, #12]
3000759c:	e3530000 	cmp	r3, #0
300075a0:	1a000005 	bne	300075bc <acoral_sem_del+0x94>
	{
		/*队列上无等待任务*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300075a4:	e59d0008 	ldr	r0, [sp, #8]
300075a8:	ebffe84f 	bl	300016ec <HAL_INTR_RESTORE>
		evt = NULL;
300075ac:	e3a03000 	mov	r3, #0
300075b0:	e58d3004 	str	r3, [sp, #4]
		return SEM_ERR_UNDEF;
300075b4:	e3a03007 	mov	r3, #7
300075b8:	ea000002 	b	300075c8 <acoral_sem_del+0xa0>
	}
	else
	{
		/*有等待任务*/
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300075bc:	e59d0008 	ldr	r0, [sp, #8]
300075c0:	ebffe849 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_ERR_TASK_EXIST; /*error*/
300075c4:	e3a03005 	mov	r3, #5
	}
}
300075c8:	e1a00003 	mov	r0, r3
300075cc:	e28dd014 	add	sp, sp, #20
300075d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300075d4:	e12fff1e 	bx	lr

300075d8 <acoral_sem_trypend>:
 *  计算信号量的申请
 *  desp: count <= SEM_RES_AVAI  信号量有效 a++
 *        count >  SEM_RES_AVAI  信号量无效 a++ && thread suspend
 *============================*/
acoral_u32 acoral_sem_trypend(acoral_evt_t *evt)
{
300075d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300075dc:	e24dd014 	sub	sp, sp, #20
300075e0:	e58d0004 	str	r0, [sp, #4]
	acoral_sr cpu_sr;

	if (acoral_intr_nesting)
300075e4:	ebffe85d 	bl	30001760 <hal_get_intr_nesting_comm>
300075e8:	e1a03000 	mov	r3, r0
300075ec:	e3530000 	cmp	r3, #0
300075f0:	0a000001 	beq	300075fc <acoral_sem_trypend+0x24>
	{
		return SEM_ERR_INTR;
300075f4:	e3a03006 	mov	r3, #6
300075f8:	ea000020 	b	30007680 <acoral_sem_trypend+0xa8>
	}

	/* 参数检测 */
	if (NULL == evt)
300075fc:	e59d3004 	ldr	r3, [sp, #4]
30007600:	e3530000 	cmp	r3, #0
30007604:	1a000001 	bne	30007610 <acoral_sem_trypend+0x38>
	{
		return SEM_ERR_NULL; /*error*/
30007608:	e3a03002 	mov	r3, #2
3000760c:	ea00001b 	b	30007680 <acoral_sem_trypend+0xa8>
	}
	if (ACORAL_EVENT_SEM != evt->type)
30007610:	e59d3004 	ldr	r3, [sp, #4]
30007614:	e5d33004 	ldrb	r3, [r3, #4]
30007618:	e3530000 	cmp	r3, #0
3000761c:	0a000001 	beq	30007628 <acoral_sem_trypend+0x50>
	{
		return SEM_ERR_TYPE; /*error*/
30007620:	e3a03004 	mov	r3, #4
30007624:	ea000015 	b	30007680 <acoral_sem_trypend+0xa8>
	}

	/* 计算信号量处理*/
	HAL_ENTER_CRITICAL();
30007628:	ebffe831 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000762c:	e1a03000 	mov	r3, r0
30007630:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if ((acoral_8)evt->count <= SEM_RES_AVAI)
30007634:	e59d3004 	ldr	r3, [sp, #4]
30007638:	e593300c 	ldr	r3, [r3, #12]
3000763c:	e20330ff 	and	r3, r3, #255	; 0xff
30007640:	e1a03c03 	lsl	r3, r3, #24
30007644:	e1a03c43 	asr	r3, r3, #24
30007648:	e3530000 	cmp	r3, #0
3000764c:	ca000008 	bgt	30007674 <acoral_sem_trypend+0x9c>
	{   /* available*/
		evt->count++;
30007650:	e59d3004 	ldr	r3, [sp, #4]
30007654:	e593300c 	ldr	r3, [r3, #12]
30007658:	e2832001 	add	r2, r3, #1
3000765c:	e59d3004 	ldr	r3, [sp, #4]
30007660:	e583200c 	str	r2, [r3, #12]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30007664:	e59d000c 	ldr	r0, [sp, #12]
30007668:	ebffe81f 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_SUCCED;
3000766c:	e3a03000 	mov	r3, #0
30007670:	ea000002 	b	30007680 <acoral_sem_trypend+0xa8>
	}

	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007674:	e59d000c 	ldr	r0, [sp, #12]
30007678:	ebffe81b 	bl	300016ec <HAL_INTR_RESTORE>
	return SEM_ERR_TIMEOUT;
3000767c:	e3a03008 	mov	r3, #8
}
30007680:	e1a00003 	mov	r0, r3
30007684:	e28dd014 	add	sp, sp, #20
30007688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000768c:	e12fff1e 	bx	lr

30007690 <acoral_sem_pend>:
 *  计算信号量的申请
 *  desp: count <= SEM_RES_AVAI  信号量有效 a++
 *        count >  SEM_RES_AVAI  信号量无效 a++ && thread suspend
 *============================*/
acoral_u32 acoral_sem_pend(acoral_evt_t *evt, acoral_time timeout)
{
30007690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007694:	e24dd014 	sub	sp, sp, #20
30007698:	e58d0004 	str	r0, [sp, #4]
3000769c:	e58d1000 	str	r1, [sp]
	acoral_thread_t *cur = acoral_cur_thread;
300076a0:	e59f318c 	ldr	r3, [pc, #396]	; 30007834 <acoral_sem_pend+0x1a4>
300076a4:	e5933000 	ldr	r3, [r3]
300076a8:	e58d3008 	str	r3, [sp, #8]
	acoral_sr cpu_sr;

	if (acoral_intr_nesting)
300076ac:	ebffe82b 	bl	30001760 <hal_get_intr_nesting_comm>
300076b0:	e1a03000 	mov	r3, r0
300076b4:	e3530000 	cmp	r3, #0
300076b8:	0a000001 	beq	300076c4 <acoral_sem_pend+0x34>
	{
		return SEM_ERR_INTR;
300076bc:	e3a03006 	mov	r3, #6
300076c0:	ea000057 	b	30007824 <acoral_sem_pend+0x194>
	}

	/* 参数检测 */
	if (NULL == evt)
300076c4:	e59d3004 	ldr	r3, [sp, #4]
300076c8:	e3530000 	cmp	r3, #0
300076cc:	1a000001 	bne	300076d8 <acoral_sem_pend+0x48>
	{
		return SEM_ERR_NULL; /*error*/
300076d0:	e3a03002 	mov	r3, #2
300076d4:	ea000052 	b	30007824 <acoral_sem_pend+0x194>
	}
	if (ACORAL_EVENT_SEM != evt->type)
300076d8:	e59d3004 	ldr	r3, [sp, #4]
300076dc:	e5d33004 	ldrb	r3, [r3, #4]
300076e0:	e3530000 	cmp	r3, #0
300076e4:	0a000001 	beq	300076f0 <acoral_sem_pend+0x60>
	{
		return SEM_ERR_TYPE; /*error*/
300076e8:	e3a03004 	mov	r3, #4
300076ec:	ea00004c 	b	30007824 <acoral_sem_pend+0x194>
	}

	/* 计算信号量处理*/
	HAL_ENTER_CRITICAL();
300076f0:	ebffe7ff 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300076f4:	e1a03000 	mov	r3, r0
300076f8:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if ((acoral_8)evt->count <= SEM_RES_AVAI)
300076fc:	e59d3004 	ldr	r3, [sp, #4]
30007700:	e593300c 	ldr	r3, [r3, #12]
30007704:	e20330ff 	and	r3, r3, #255	; 0xff
30007708:	e1a03c03 	lsl	r3, r3, #24
3000770c:	e1a03c43 	asr	r3, r3, #24
30007710:	e3530000 	cmp	r3, #0
30007714:	ca000008 	bgt	3000773c <acoral_sem_pend+0xac>
	{   /* available*/
		evt->count++;
30007718:	e59d3004 	ldr	r3, [sp, #4]
3000771c:	e593300c 	ldr	r3, [r3, #12]
30007720:	e2832001 	add	r2, r3, #1
30007724:	e59d3004 	ldr	r3, [sp, #4]
30007728:	e583200c 	str	r2, [r3, #12]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
3000772c:	e59d000c 	ldr	r0, [sp, #12]
30007730:	ebffe7ed 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_SUCCED;
30007734:	e3a03000 	mov	r3, #0
30007738:	ea000039 	b	30007824 <acoral_sem_pend+0x194>
	}

	evt->count++;
3000773c:	e59d3004 	ldr	r3, [sp, #4]
30007740:	e593300c 	ldr	r3, [r3, #12]
30007744:	e2832001 	add	r2, r3, #1
30007748:	e59d3004 	ldr	r3, [sp, #4]
3000774c:	e583200c 	str	r2, [r3, #12]
	acoral_unrdy_thread(cur);
30007750:	e59d0008 	ldr	r0, [sp, #8]
30007754:	ebffed0e 	bl	30002b94 <acoral_unrdy_thread>
	if (timeout > 0)
30007758:	e59d3000 	ldr	r3, [sp]
3000775c:	e3530000 	cmp	r3, #0
30007760:	0a00000f 	beq	300077a4 <acoral_sem_pend+0x114>
	{
		cur->delay = TIME_TO_TICKS(timeout);
30007764:	e59d2000 	ldr	r2, [sp]
30007768:	e1a03002 	mov	r3, r2
3000776c:	e1a03103 	lsl	r3, r3, #2
30007770:	e0833002 	add	r3, r3, r2
30007774:	e1a02103 	lsl	r2, r3, #2
30007778:	e0833002 	add	r3, r3, r2
3000777c:	e1a03103 	lsl	r3, r3, #2
30007780:	e1a02003 	mov	r2, r3
30007784:	e59f30ac 	ldr	r3, [pc, #172]	; 30007838 <acoral_sem_pend+0x1a8>
30007788:	e0831392 	umull	r1, r3, r2, r3
3000778c:	e1a03323 	lsr	r3, r3, #6
30007790:	e1a02003 	mov	r2, r3
30007794:	e59d3008 	ldr	r3, [sp, #8]
30007798:	e5832040 	str	r2, [r3, #64]	; 0x40
		timeout_queue_add(cur);
3000779c:	e59d0008 	ldr	r0, [sp, #8]
300077a0:	ebfff410 	bl	300047e8 <timeout_queue_add>
	}
	acoral_evt_queue_add(evt,cur);
300077a4:	e59d0004 	ldr	r0, [sp, #4]
300077a8:	e59d1008 	ldr	r1, [sp, #8]
300077ac:	ebfff538 	bl	30004c94 <acoral_evt_queue_add>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
300077b0:	e59d000c 	ldr	r0, [sp, #12]
300077b4:	ebffe7cc 	bl	300016ec <HAL_INTR_RESTORE>
	
	acoral_sched();
300077b8:	ebffeb0e 	bl	300023f8 <acoral_sched>

	HAL_ENTER_CRITICAL();
300077bc:	ebffe7cc 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300077c0:	e1a03000 	mov	r3, r0
300077c4:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	if(timeout>0 && cur->delay<=0)
300077c8:	e59d3000 	ldr	r3, [sp]
300077cc:	e3530000 	cmp	r3, #0
300077d0:	0a00000e 	beq	30007810 <acoral_sem_pend+0x180>
300077d4:	e59d3008 	ldr	r3, [sp, #8]
300077d8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300077dc:	e3530000 	cmp	r3, #0
300077e0:	ca00000a 	bgt	30007810 <acoral_sem_pend+0x180>
	{
		//--------------
		// modify by pegasus 0804: count-- [+]
		evt->count--;
300077e4:	e59d3004 	ldr	r3, [sp, #4]
300077e8:	e593300c 	ldr	r3, [r3, #12]
300077ec:	e2432001 	sub	r2, r3, #1
300077f0:	e59d3004 	ldr	r3, [sp, #4]
300077f4:	e583200c 	str	r2, [r3, #12]
		acoral_evt_queue_del(cur);
300077f8:	e59d0008 	ldr	r0, [sp, #8]
300077fc:	ebfff555 	bl	30004d58 <acoral_evt_queue_del>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
30007800:	e59d000c 	ldr	r0, [sp, #12]
30007804:	ebffe7b8 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_ERR_TIMEOUT;
30007808:	e3a03008 	mov	r3, #8
3000780c:	ea000004 	b	30007824 <acoral_sem_pend+0x194>
	}

	//-------------------
	// modify by pegasus 0804: timeout_queue_del [+]
	timeout_queue_del(cur);
30007810:	e59d0008 	ldr	r0, [sp, #8]
30007814:	ebfff435 	bl	300048f0 <timeout_queue_del>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007818:	e59d000c 	ldr	r0, [sp, #12]
3000781c:	ebffe7b2 	bl	300016ec <HAL_INTR_RESTORE>
	return SEM_SUCCED;
30007820:	e3a03000 	mov	r3, #0
}
30007824:	e1a00003 	mov	r0, r3
30007828:	e28dd014 	add	sp, sp, #20
3000782c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007830:	e12fff1e 	bx	lr
30007834:	300103f8 	.word	0x300103f8
30007838:	10624dd3 	.word	0x10624dd3

3000783c <acoral_sem_post>:
 *  计算信号量的释放
 *  desp: count > SEM_RES_NOAVAI 有等待线程 a-- && resume waiting thread.
 *        count <= SEM_RES_NOAVAI 无等待线程 a--
 *===========================*/
acoral_u32 acoral_sem_post(acoral_evt_t *evt)
{
3000783c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007840:	e24dd014 	sub	sp, sp, #20
30007844:	e58d0004 	str	r0, [sp, #4]
	acoral_thread_t     *thread;
	acoral_sr            cpu_sr;

	/* 参数检测*/
	if ( NULL == evt)
30007848:	e59d3004 	ldr	r3, [sp, #4]
3000784c:	e3530000 	cmp	r3, #0
30007850:	1a000001 	bne	3000785c <acoral_sem_post+0x20>
	{
		return SEM_ERR_NULL; /* error*/
30007854:	e3a03002 	mov	r3, #2
30007858:	ea000034 	b	30007930 <acoral_sem_post+0xf4>
	}
	if (ACORAL_EVENT_SEM != evt->type)
3000785c:	e59d3004 	ldr	r3, [sp, #4]
30007860:	e5d33004 	ldrb	r3, [r3, #4]
30007864:	e3530000 	cmp	r3, #0
30007868:	0a000001 	beq	30007874 <acoral_sem_post+0x38>
	{
		return SEM_ERR_TYPE;
3000786c:	e3a03004 	mov	r3, #4
30007870:	ea00002e 	b	30007930 <acoral_sem_post+0xf4>
	}

	HAL_ENTER_CRITICAL();
30007874:	ebffe79e 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007878:	e1a03000 	mov	r3, r0
3000787c:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);

	/* 计算信号量的释放*/
	if ((acoral_8)evt->count <= SEM_RES_NOAVAI)
30007880:	e59d3004 	ldr	r3, [sp, #4]
30007884:	e593300c 	ldr	r3, [r3, #12]
30007888:	e20330ff 	and	r3, r3, #255	; 0xff
3000788c:	e1a03c03 	lsl	r3, r3, #24
30007890:	e1a03c43 	asr	r3, r3, #24
30007894:	e3530001 	cmp	r3, #1
30007898:	ca000008 	bgt	300078c0 <acoral_sem_post+0x84>
	{ /* no waiting thread*/
		evt->count--;
3000789c:	e59d3004 	ldr	r3, [sp, #4]
300078a0:	e593300c 	ldr	r3, [r3, #12]
300078a4:	e2432001 	sub	r2, r3, #1
300078a8:	e59d3004 	ldr	r3, [sp, #4]
300078ac:	e583200c 	str	r2, [r3, #12]
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300078b0:	e59d000c 	ldr	r0, [sp, #12]
300078b4:	ebffe78c 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_SUCCED;
300078b8:	e3a03000 	mov	r3, #0
300078bc:	ea00001b 	b	30007930 <acoral_sem_post+0xf4>
	}
	/* 有等待线程*/
	evt->count--;
300078c0:	e59d3004 	ldr	r3, [sp, #4]
300078c4:	e593300c 	ldr	r3, [r3, #12]
300078c8:	e2432001 	sub	r2, r3, #1
300078cc:	e59d3004 	ldr	r3, [sp, #4]
300078d0:	e583200c 	str	r2, [r3, #12]
	thread =acoral_evt_high_thread(evt);
300078d4:	e59d0004 	ldr	r0, [sp, #4]
300078d8:	ebfff4d9 	bl	30004c44 <acoral_evt_high_thread>
300078dc:	e1a03000 	mov	r3, r0
300078e0:	e58d3008 	str	r3, [sp, #8]
	if (thread==NULL)
300078e4:	e59d3008 	ldr	r3, [sp, #8]
300078e8:	e3530000 	cmp	r3, #0
300078ec:	1a000005 	bne	30007908 <acoral_sem_post+0xcc>
	{
		/*应该有等待线程却没有找到*/
		acoral_printerr("Err Sem post\n");
300078f0:	e59f0048 	ldr	r0, [pc, #72]	; 30007940 <acoral_sem_post+0x104>
300078f4:	eb000e43 	bl	3000b208 <acoral_print>
		acoral_spin_unlock(&evt->spin_lock);
		HAL_EXIT_CRITICAL();
300078f8:	e59d000c 	ldr	r0, [sp, #12]
300078fc:	ebffe77a 	bl	300016ec <HAL_INTR_RESTORE>
		return SEM_ERR_UNDEF;
30007900:	e3a03007 	mov	r3, #7
30007904:	ea000009 	b	30007930 <acoral_sem_post+0xf4>
	}
	timeout_queue_del(thread);
30007908:	e59d0008 	ldr	r0, [sp, #8]
3000790c:	ebfff3f7 	bl	300048f0 <timeout_queue_del>
	/*释放等待任务*/
	acoral_evt_queue_del(thread);
30007910:	e59d0008 	ldr	r0, [sp, #8]
30007914:	ebfff50f 	bl	30004d58 <acoral_evt_queue_del>
	acoral_rdy_thread(thread);
30007918:	e59d0008 	ldr	r0, [sp, #8]
3000791c:	ebffec8d 	bl	30002b58 <acoral_rdy_thread>
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007920:	e59d000c 	ldr	r0, [sp, #12]
30007924:	ebffe770 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30007928:	ebffeab2 	bl	300023f8 <acoral_sched>
	return SEM_SUCCED;
3000792c:	e3a03000 	mov	r3, #0
}
30007930:	e1a00003 	mov	r0, r3
30007934:	e28dd014 	add	sp, sp, #20
30007938:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000793c:	e12fff1e 	bx	lr
30007940:	3000e5c4 	.word	0x3000e5c4

30007944 <acoral_sem_getnum>:
/*===================================
 *   get singal's number now
 *     得到当前信号量数目
 *===================================*/
acoral_32 acoral_sem_getnum(acoral_evt_t* evt)
{
30007944:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007948:	e24dd014 	sub	sp, sp, #20
3000794c:	e58d0004 	str	r0, [sp, #4]
	acoral_32 t;
	acoral_sr cpu_sr;

	if (NULL == evt)
30007950:	e59d3004 	ldr	r3, [sp, #4]
30007954:	e3530000 	cmp	r3, #0
30007958:	1a000001 	bne	30007964 <acoral_sem_getnum+0x20>
		return SEM_ERR_NULL;
3000795c:	e3a03002 	mov	r3, #2
30007960:	ea000009 	b	3000798c <acoral_sem_getnum+0x48>

	HAL_ENTER_CRITICAL();
30007964:	ebffe762 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007968:	e1a03000 	mov	r3, r0
3000796c:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&evt->spin_lock);
	t = 1 - (acoral_32)evt->count;
30007970:	e59d3004 	ldr	r3, [sp, #4]
30007974:	e593300c 	ldr	r3, [r3, #12]
30007978:	e2633001 	rsb	r3, r3, #1
3000797c:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_unlock(&evt->spin_lock);
	HAL_EXIT_CRITICAL();
30007980:	e59d000c 	ldr	r0, [sp, #12]
30007984:	ebffe758 	bl	300016ec <HAL_INTR_RESTORE>
	return t;
30007988:	e59d3008 	ldr	r3, [sp, #8]
}
3000798c:	e1a00003 	mov	r0, r3
30007990:	e28dd014 	add	sp, sp, #20
30007994:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007998:	e12fff1e 	bx	lr

3000799c <acoral_msg_sys_init>:
/*=============================
 *
 *  mssage 机制缓冲池初始化
 *=============================*/
void acoral_msg_sys_init()
{
3000799c:	e92d4008 	push	{r3, lr}
	/*初始化全局事件列表头*/
	acoral_init_list (&(g_msgctr_header.head));
300079a0:	e59f3094 	ldr	r3, [pc, #148]	; 30007a3c <acoral_msg_sys_init+0xa0>
300079a4:	e59f2090 	ldr	r2, [pc, #144]	; 30007a3c <acoral_msg_sys_init+0xa0>
300079a8:	e5832000 	str	r2, [r3]
300079ac:	e59f3088 	ldr	r3, [pc, #136]	; 30007a3c <acoral_msg_sys_init+0xa0>
300079b0:	e59f2084 	ldr	r2, [pc, #132]	; 30007a3c <acoral_msg_sys_init+0xa0>
300079b4:	e5832004 	str	r2, [r3, #4]
	g_msgctr_header.data = NULL;
300079b8:	e59f307c 	ldr	r3, [pc, #124]	; 30007a3c <acoral_msg_sys_init+0xa0>
300079bc:	e3a02000 	mov	r2, #0
300079c0:	e5832008 	str	r2, [r3, #8]
	acoral_msgctr_pool_ctrl.type=ACORAL_RES_MST;
300079c4:	e59f3074 	ldr	r3, [pc, #116]	; 30007a40 <acoral_msg_sys_init+0xa4>
300079c8:	e3a02006 	mov	r2, #6
300079cc:	e5832000 	str	r2, [r3]
	acoral_msgctr_pool_ctrl.size=sizeof(acoral_msgctr_t);
300079d0:	e59f3068 	ldr	r3, [pc, #104]	; 30007a40 <acoral_msg_sys_init+0xa4>
300079d4:	e3a02030 	mov	r2, #48	; 0x30
300079d8:	e5832004 	str	r2, [r3, #4]
	acoral_msgctr_pool_ctrl.num_per_pool=10;
300079dc:	e59f305c 	ldr	r3, [pc, #92]	; 30007a40 <acoral_msg_sys_init+0xa4>
300079e0:	e3a0200a 	mov	r2, #10
300079e4:	e5832008 	str	r2, [r3, #8]
	acoral_msgctr_pool_ctrl.max_pools=4;
300079e8:	e59f3050 	ldr	r3, [pc, #80]	; 30007a40 <acoral_msg_sys_init+0xa4>
300079ec:	e3a02004 	mov	r2, #4
300079f0:	e5832010 	str	r2, [r3, #16]

	acoral_msg_pool_ctrl.type=ACORAL_RES_MSG;
300079f4:	e59f3048 	ldr	r3, [pc, #72]	; 30007a44 <acoral_msg_sys_init+0xa8>
300079f8:	e3a02005 	mov	r2, #5
300079fc:	e5832000 	str	r2, [r3]
	acoral_msg_pool_ctrl.size=sizeof(acoral_msg_t);
30007a00:	e59f303c 	ldr	r3, [pc, #60]	; 30007a44 <acoral_msg_sys_init+0xa8>
30007a04:	e3a0201c 	mov	r2, #28
30007a08:	e5832004 	str	r2, [r3, #4]
	acoral_msg_pool_ctrl.num_per_pool=10;
30007a0c:	e59f3030 	ldr	r3, [pc, #48]	; 30007a44 <acoral_msg_sys_init+0xa8>
30007a10:	e3a0200a 	mov	r2, #10
30007a14:	e5832008 	str	r2, [r3, #8]
	acoral_msg_pool_ctrl.max_pools=4;
30007a18:	e59f3024 	ldr	r3, [pc, #36]	; 30007a44 <acoral_msg_sys_init+0xa8>
30007a1c:	e3a02004 	mov	r2, #4
30007a20:	e5832010 	str	r2, [r3, #16]

	acoral_pool_ctrl_init(&acoral_msgctr_pool_ctrl);
30007a24:	e59f0014 	ldr	r0, [pc, #20]	; 30007a40 <acoral_msg_sys_init+0xa4>
30007a28:	ebfff00a 	bl	30003a58 <acoral_pool_ctrl_init>
	acoral_pool_ctrl_init(&acoral_msg_pool_ctrl);
30007a2c:	e59f0010 	ldr	r0, [pc, #16]	; 30007a44 <acoral_msg_sys_init+0xa8>
30007a30:	ebfff008 	bl	30003a58 <acoral_pool_ctrl_init>
}
30007a34:	e8bd4008 	pop	{r3, lr}
30007a38:	e12fff1e 	bx	lr
30007a3c:	3000f34c 	.word	0x3000f34c
30007a40:	300103ac 	.word	0x300103ac
30007a44:	300102fc 	.word	0x300102fc

30007a48 <acoral_msgctr_list_queueadd>:
 *  静态创建的acoral_msgctr_t调用
 *  message container 挂全局队列
 *  在中断中处理 ttl 时使用
 *==============================*/
void acoral_msgctr_list_queueadd(acoral_msgctr_t* msgctr)
{
30007a48:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007a4c:	e24dd00c 	sub	sp, sp, #12
30007a50:	e58d0004 	str	r0, [sp, #4]
  	acoral_list_add2_tail (&msgctr->msgctr_list, &(g_msgctr_header.head));
30007a54:	e59d3004 	ldr	r3, [sp, #4]
30007a58:	e283300c 	add	r3, r3, #12
30007a5c:	e1a00003 	mov	r0, r3
30007a60:	e59f100c 	ldr	r1, [pc, #12]	; 30007a74 <acoral_msgctr_list_queueadd+0x2c>
30007a64:	eb000955 	bl	30009fc0 <acoral_list_add2_tail>
}
30007a68:	e28dd00c 	add	sp, sp, #12
30007a6c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007a70:	e12fff1e 	bx	lr
30007a74:	3000f34c 	.word	0x3000f34c

30007a78 <acoral_alloc_msgctr>:
/*==============================
 *
 *  message 分配
 *==============================*/
acoral_msgctr_t* acoral_alloc_msgctr()
{
30007a78:	e92d4008 	push	{r3, lr}
	return (acoral_msgctr_t*)acoral_get_res (&acoral_msgctr_pool_ctrl);
30007a7c:	e59f0010 	ldr	r0, [pc, #16]	; 30007a94 <acoral_alloc_msgctr+0x1c>
30007a80:	ebffee95 	bl	300034dc <acoral_get_res>
30007a84:	e1a03000 	mov	r3, r0
}
30007a88:	e1a00003 	mov	r0, r3
30007a8c:	e8bd4008 	pop	{r3, lr}
30007a90:	e12fff1e 	bx	lr
30007a94:	300103ac 	.word	0x300103ac

30007a98 <acoral_alloc_msg>:

acoral_msg_t* acoral_alloc_msg()
{
30007a98:	e92d4008 	push	{r3, lr}
	return (acoral_msg_t*)acoral_get_res (&acoral_msg_pool_ctrl);
30007a9c:	e59f0010 	ldr	r0, [pc, #16]	; 30007ab4 <acoral_alloc_msg+0x1c>
30007aa0:	ebffee8d 	bl	300034dc <acoral_get_res>
30007aa4:	e1a03000 	mov	r3, r0
}
30007aa8:	e1a00003 	mov	r0, r3
30007aac:	e8bd4008 	pop	{r3, lr}
30007ab0:	e12fff1e 	bx	lr
30007ab4:	300102fc 	.word	0x300102fc

30007ab8 <acoral_msgctr_queue_add>:
 *
 *  message 等待队列增加
 *==============================*/
void acoral_msgctr_queue_add (acoral_msgctr_t* msgctr, 
		                            acoral_thread_t* thread)
{   /*需按优先级排序*/
30007ab8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007abc:	e24dd01c 	sub	sp, sp, #28
30007ac0:	e58d0004 	str	r0, [sp, #4]
30007ac4:	e58d1000 	str	r1, [sp]
	/*acoral_list_add2_tail (&thread->waiting, &msgctr->waiting);*/
	acoral_list_t *p, *q;
	acoral_thread_t*  ptd;
	
	p = &msgctr->waiting;
30007ac8:	e59d3004 	ldr	r3, [sp, #4]
30007acc:	e2833020 	add	r3, r3, #32
30007ad0:	e58d300c 	str	r3, [sp, #12]
	q = p->next;
30007ad4:	e59d300c 	ldr	r3, [sp, #12]
30007ad8:	e5933000 	ldr	r3, [r3]
30007adc:	e58d3010 	str	r3, [sp, #16]
	for( ; p != q; q=q->next)
30007ae0:	ea00000b 	b	30007b14 <acoral_msgctr_queue_add+0x5c>
	{
		ptd = list_entry( q, acoral_thread_t, waiting);
30007ae4:	e59d3010 	ldr	r3, [sp, #16]
30007ae8:	e2433020 	sub	r3, r3, #32
30007aec:	e58d3014 	str	r3, [sp, #20]
		if (ptd->prio > thread->prio)
30007af0:	e59d3014 	ldr	r3, [sp, #20]
30007af4:	e5d32005 	ldrb	r2, [r3, #5]
30007af8:	e59d3000 	ldr	r3, [sp]
30007afc:	e5d33005 	ldrb	r3, [r3, #5]
30007b00:	e1520003 	cmp	r2, r3
30007b04:	8a000007 	bhi	30007b28 <acoral_msgctr_queue_add+0x70>
	acoral_list_t *p, *q;
	acoral_thread_t*  ptd;
	
	p = &msgctr->waiting;
	q = p->next;
	for( ; p != q; q=q->next)
30007b08:	e59d3010 	ldr	r3, [sp, #16]
30007b0c:	e5933000 	ldr	r3, [r3]
30007b10:	e58d3010 	str	r3, [sp, #16]
30007b14:	e59d200c 	ldr	r2, [sp, #12]
30007b18:	e59d3010 	ldr	r3, [sp, #16]
30007b1c:	e1520003 	cmp	r2, r3
30007b20:	1affffef 	bne	30007ae4 <acoral_msgctr_queue_add+0x2c>
30007b24:	ea000000 	b	30007b2c <acoral_msgctr_queue_add+0x74>
	{
		ptd = list_entry( q, acoral_thread_t, waiting);
		if (ptd->prio > thread->prio)
			break;
30007b28:	e1a00000 	nop			; (mov r0, r0)
	}
	acoral_list_add( &thread->waiting, q->prev);
30007b2c:	e59d3000 	ldr	r3, [sp]
30007b30:	e2832020 	add	r2, r3, #32
30007b34:	e59d3010 	ldr	r3, [sp, #16]
30007b38:	e5933004 	ldr	r3, [r3, #4]
30007b3c:	e1a00002 	mov	r0, r2
30007b40:	e1a01003 	mov	r1, r3
30007b44:	eb00090a 	bl	30009f74 <acoral_list_add>
}
30007b48:	e28dd01c 	add	sp, sp, #28
30007b4c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007b50:	e12fff1e 	bx	lr

30007b54 <acoral_msg_queue_add>:

void acoral_msg_queue_add (acoral_msgctr_t* msgctr, 
		                          acoral_msg_t* msg)
{
30007b54:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007b58:	e24dd00c 	sub	sp, sp, #12
30007b5c:	e58d0004 	str	r0, [sp, #4]
30007b60:	e58d1000 	str	r1, [sp]
	acoral_list_add2_tail (&msg->msglist, &msgctr->msglist);
30007b64:	e59d3000 	ldr	r3, [sp]
30007b68:	e2832004 	add	r2, r3, #4
30007b6c:	e59d3004 	ldr	r3, [sp, #4]
30007b70:	e2833028 	add	r3, r3, #40	; 0x28
30007b74:	e1a00002 	mov	r0, r2
30007b78:	e1a01003 	mov	r1, r3
30007b7c:	eb00090f 	bl	30009fc0 <acoral_list_add2_tail>
}
30007b80:	e28dd00c 	add	sp, sp, #12
30007b84:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007b88:	e12fff1e 	bx	lr

30007b8c <acoral_msgctr_init>:
/*==============================
 * The initialize of the message
 *       消息容器初始化
 *==============================*/
acoral_u32  acoral_msgctr_init(acoral_msgctr_t *msgctr)
{
30007b8c:	e24dd008 	sub	sp, sp, #8
30007b90:	e58d0004 	str	r0, [sp, #4]
	if (msgctr == NULL)
30007b94:	e59d3004 	ldr	r3, [sp, #4]
30007b98:	e3530000 	cmp	r3, #0
30007b9c:	1a000001 	bne	30007ba8 <acoral_msgctr_init+0x1c>
		return MST_ERR_NULL;
30007ba0:	e3a03000 	mov	r3, #0
30007ba4:	ea000024 	b	30007c3c <acoral_msgctr_init+0xb0>

	msgctr->name  = NULL;
30007ba8:	e59d3004 	ldr	r3, [sp, #4]
30007bac:	e3a02000 	mov	r2, #0
30007bb0:	e5832004 	str	r2, [r3, #4]
	msgctr->type  = ACORAL_MSGCTR;
30007bb4:	e59d3004 	ldr	r3, [sp, #4]
30007bb8:	e3a02001 	mov	r2, #1
30007bbc:	e5c32008 	strb	r2, [r3, #8]
	msgctr->count = 0;
30007bc0:	e59d3004 	ldr	r3, [sp, #4]
30007bc4:	e3a02000 	mov	r2, #0
30007bc8:	e5832018 	str	r2, [r3, #24]
	msgctr->wait_thread_num = 0;
30007bcc:	e59d3004 	ldr	r3, [sp, #4]
30007bd0:	e3a02000 	mov	r2, #0
30007bd4:	e583201c 	str	r2, [r3, #28]

	acoral_init_list(&msgctr->msglist);
30007bd8:	e59d3004 	ldr	r3, [sp, #4]
30007bdc:	e2832028 	add	r2, r3, #40	; 0x28
30007be0:	e59d3004 	ldr	r3, [sp, #4]
30007be4:	e5832028 	str	r2, [r3, #40]	; 0x28
30007be8:	e59d3004 	ldr	r3, [sp, #4]
30007bec:	e2832028 	add	r2, r3, #40	; 0x28
30007bf0:	e59d3004 	ldr	r3, [sp, #4]
30007bf4:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_init_list(&msgctr->waiting);
30007bf8:	e59d3004 	ldr	r3, [sp, #4]
30007bfc:	e2832020 	add	r2, r3, #32
30007c00:	e59d3004 	ldr	r3, [sp, #4]
30007c04:	e5832020 	str	r2, [r3, #32]
30007c08:	e59d3004 	ldr	r3, [sp, #4]
30007c0c:	e2832020 	add	r2, r3, #32
30007c10:	e59d3004 	ldr	r3, [sp, #4]
30007c14:	e5832024 	str	r2, [r3, #36]	; 0x24
	acoral_init_list(&msgctr->msgctr_list);
30007c18:	e59d3004 	ldr	r3, [sp, #4]
30007c1c:	e283200c 	add	r2, r3, #12
30007c20:	e59d3004 	ldr	r3, [sp, #4]
30007c24:	e583200c 	str	r2, [r3, #12]
30007c28:	e59d3004 	ldr	r3, [sp, #4]
30007c2c:	e283200c 	add	r2, r3, #12
30007c30:	e59d3004 	ldr	r3, [sp, #4]
30007c34:	e5832010 	str	r2, [r3, #16]
	acoral_spin_init(&msgctr->spin_lock);
	return MSGCTR_SUCCED;
30007c38:	e3a03004 	mov	r3, #4
}
30007c3c:	e1a00003 	mov	r0, r3
30007c40:	e28dd008 	add	sp, sp, #8
30007c44:	e12fff1e 	bx	lr

30007c48 <acoral_msg_init>:

acoral_u32 acoral_msg_init(
		acoral_msg_t *msg, acoral_u32 id /*= 0*/, acoral_u32 n /*= 0*/, 
		acoral_u32  nTtl /*= 0*/, void* dat /*= NULL*/)
{
30007c48:	e24dd010 	sub	sp, sp, #16
30007c4c:	e58d000c 	str	r0, [sp, #12]
30007c50:	e58d1008 	str	r1, [sp, #8]
30007c54:	e58d2004 	str	r2, [sp, #4]
30007c58:	e58d3000 	str	r3, [sp]
	if (msg == NULL)
30007c5c:	e59d300c 	ldr	r3, [sp, #12]
30007c60:	e3530000 	cmp	r3, #0
30007c64:	1a000001 	bne	30007c70 <acoral_msg_init+0x28>
		return MSG_ERR_NULL;
30007c68:	e3a03007 	mov	r3, #7
30007c6c:	ea000014 	b	30007cc4 <acoral_msg_init+0x7c>

	msg->id   =  id;                /*消息标识*/
30007c70:	e59d300c 	ldr	r3, [sp, #12]
30007c74:	e59d2008 	ldr	r2, [sp, #8]
30007c78:	e583200c 	str	r2, [r3, #12]
	msg->n    =  n;                 /*消息被接收次数*/
30007c7c:	e59d300c 	ldr	r3, [sp, #12]
30007c80:	e59d2004 	ldr	r2, [sp, #4]
30007c84:	e5832010 	str	r2, [r3, #16]
	msg->ttl  =  nTtl;              /*消息生存周期*/
30007c88:	e59d300c 	ldr	r3, [sp, #12]
30007c8c:	e59d2000 	ldr	r2, [sp]
30007c90:	e5832014 	str	r2, [r3, #20]
	msg->data =  dat;               /*消息指针*/
30007c94:	e59d300c 	ldr	r3, [sp, #12]
30007c98:	e59d2010 	ldr	r2, [sp, #16]
30007c9c:	e5832018 	str	r2, [r3, #24]
	acoral_init_list(&msg->msglist);
30007ca0:	e59d300c 	ldr	r3, [sp, #12]
30007ca4:	e2832004 	add	r2, r3, #4
30007ca8:	e59d300c 	ldr	r3, [sp, #12]
30007cac:	e5832004 	str	r2, [r3, #4]
30007cb0:	e59d300c 	ldr	r3, [sp, #12]
30007cb4:	e2832004 	add	r2, r3, #4
30007cb8:	e59d300c 	ldr	r3, [sp, #12]
30007cbc:	e5832008 	str	r2, [r3, #8]
	acoral_spin_init(&(msg->msglist.lock));
	return 0;
30007cc0:	e3a03000 	mov	r3, #0
}
30007cc4:	e1a00003 	mov	r0, r3
30007cc8:	e28dd010 	add	sp, sp, #16
30007ccc:	e12fff1e 	bx	lr

30007cd0 <acoral_msg_assign>:

acoral_32 acoral_msg_assign(
		acoral_msg_t* msg, void* dat, acoral_u32 id,
		acoral_u32 nTtl, acoral_u32 n)
{
30007cd0:	e24dd010 	sub	sp, sp, #16
30007cd4:	e58d000c 	str	r0, [sp, #12]
30007cd8:	e58d1008 	str	r1, [sp, #8]
30007cdc:	e58d2004 	str	r2, [sp, #4]
30007ce0:	e58d3000 	str	r3, [sp]
	if (msg == NULL)
30007ce4:	e59d300c 	ldr	r3, [sp, #12]
30007ce8:	e3530000 	cmp	r3, #0
30007cec:	1a000001 	bne	30007cf8 <acoral_msg_assign+0x28>
		return MSG_ERR_NULL;
30007cf0:	e3a03007 	mov	r3, #7
30007cf4:	ea00000c 	b	30007d2c <acoral_msg_assign+0x5c>

	msg->id   =  id;                /*消息标识*/
30007cf8:	e59d300c 	ldr	r3, [sp, #12]
30007cfc:	e59d2004 	ldr	r2, [sp, #4]
30007d00:	e583200c 	str	r2, [r3, #12]
	msg->n    =  n;                 /*消息被接收次数*/
30007d04:	e59d300c 	ldr	r3, [sp, #12]
30007d08:	e59d2010 	ldr	r2, [sp, #16]
30007d0c:	e5832010 	str	r2, [r3, #16]
	msg->ttl  =  nTtl;              /*消息生存周期*/
30007d10:	e59d300c 	ldr	r3, [sp, #12]
30007d14:	e59d2000 	ldr	r2, [sp]
30007d18:	e5832014 	str	r2, [r3, #20]
	msg->data =  dat;               /*消息指针*/
30007d1c:	e59d300c 	ldr	r3, [sp, #12]
30007d20:	e59d2008 	ldr	r2, [sp, #8]
30007d24:	e5832018 	str	r2, [r3, #24]
	return 0;
30007d28:	e3a03000 	mov	r3, #0
}
30007d2c:	e1a00003 	mov	r0, r3
30007d30:	e28dd010 	add	sp, sp, #16
30007d34:	e12fff1e 	bx	lr

30007d38 <acoral_msgctr_create>:
/*==================================
 *
 *   消息创建
 *==================================*/
acoral_msgctr_t*  acoral_msgctr_create (acoral_u32 *err)
{
30007d38:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007d3c:	e24dd014 	sub	sp, sp, #20
30007d40:	e58d0004 	str	r0, [sp, #4]
	acoral_msgctr_t *msgctr;

	msgctr = acoral_alloc_msgctr();
30007d44:	ebffff4b 	bl	30007a78 <acoral_alloc_msgctr>
30007d48:	e1a03000 	mov	r3, r0
30007d4c:	e58d300c 	str	r3, [sp, #12]

	if (msgctr == NULL)
30007d50:	e59d300c 	ldr	r3, [sp, #12]
30007d54:	e3530000 	cmp	r3, #0
30007d58:	1a000001 	bne	30007d64 <acoral_msgctr_create+0x2c>
		return NULL;
30007d5c:	e3a03000 	mov	r3, #0
30007d60:	ea000029 	b	30007e0c <acoral_msgctr_create+0xd4>

	msgctr->name  = NULL;
30007d64:	e59d300c 	ldr	r3, [sp, #12]
30007d68:	e3a02000 	mov	r2, #0
30007d6c:	e5832004 	str	r2, [r3, #4]
	msgctr->type  = ACORAL_MSGCTR;
30007d70:	e59d300c 	ldr	r3, [sp, #12]
30007d74:	e3a02001 	mov	r2, #1
30007d78:	e5c32008 	strb	r2, [r3, #8]
	msgctr->count = 0;
30007d7c:	e59d300c 	ldr	r3, [sp, #12]
30007d80:	e3a02000 	mov	r2, #0
30007d84:	e5832018 	str	r2, [r3, #24]
	msgctr->wait_thread_num = 0;
30007d88:	e59d300c 	ldr	r3, [sp, #12]
30007d8c:	e3a02000 	mov	r2, #0
30007d90:	e583201c 	str	r2, [r3, #28]

	acoral_init_list(&msgctr->msgctr_list);
30007d94:	e59d300c 	ldr	r3, [sp, #12]
30007d98:	e283200c 	add	r2, r3, #12
30007d9c:	e59d300c 	ldr	r3, [sp, #12]
30007da0:	e583200c 	str	r2, [r3, #12]
30007da4:	e59d300c 	ldr	r3, [sp, #12]
30007da8:	e283200c 	add	r2, r3, #12
30007dac:	e59d300c 	ldr	r3, [sp, #12]
30007db0:	e5832010 	str	r2, [r3, #16]
	acoral_init_list(&msgctr->msglist);
30007db4:	e59d300c 	ldr	r3, [sp, #12]
30007db8:	e2832028 	add	r2, r3, #40	; 0x28
30007dbc:	e59d300c 	ldr	r3, [sp, #12]
30007dc0:	e5832028 	str	r2, [r3, #40]	; 0x28
30007dc4:	e59d300c 	ldr	r3, [sp, #12]
30007dc8:	e2832028 	add	r2, r3, #40	; 0x28
30007dcc:	e59d300c 	ldr	r3, [sp, #12]
30007dd0:	e583202c 	str	r2, [r3, #44]	; 0x2c
	acoral_init_list(&msgctr->waiting);
30007dd4:	e59d300c 	ldr	r3, [sp, #12]
30007dd8:	e2832020 	add	r2, r3, #32
30007ddc:	e59d300c 	ldr	r3, [sp, #12]
30007de0:	e5832020 	str	r2, [r3, #32]
30007de4:	e59d300c 	ldr	r3, [sp, #12]
30007de8:	e2832020 	add	r2, r3, #32
30007dec:	e59d300c 	ldr	r3, [sp, #12]
30007df0:	e5832024 	str	r2, [r3, #36]	; 0x24
	acoral_spin_init(&(msgctr->msgctr_list.lock));
	acoral_spin_init(&(msgctr->msglist.lock));
	acoral_spin_init(&(msgctr->waiting.lock));

	acoral_spin_init(&msgctr->spin_lock);
	acoral_list_add2_tail (&msgctr->msgctr_list, &(g_msgctr_header.head));
30007df4:	e59d300c 	ldr	r3, [sp, #12]
30007df8:	e283300c 	add	r3, r3, #12
30007dfc:	e1a00003 	mov	r0, r3
30007e00:	e59f1014 	ldr	r1, [pc, #20]	; 30007e1c <acoral_msgctr_create+0xe4>
30007e04:	eb00086d 	bl	30009fc0 <acoral_list_add2_tail>
	return msgctr;
30007e08:	e59d300c 	ldr	r3, [sp, #12]
}
30007e0c:	e1a00003 	mov	r0, r3
30007e10:	e28dd014 	add	sp, sp, #20
30007e14:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007e18:	e12fff1e 	bx	lr
30007e1c:	3000f34c 	.word	0x3000f34c

30007e20 <acoral_msg_create>:

acoral_msg_t* acoral_msg_create (
		acoral_u32 n, acoral_u32 *err, acoral_u32 id, 
		acoral_u32 nTtl/* = 0*/, void* dat /*= NULL*/)
{
30007e20:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007e24:	e24dd01c 	sub	sp, sp, #28
30007e28:	e58d000c 	str	r0, [sp, #12]
30007e2c:	e58d1008 	str	r1, [sp, #8]
30007e30:	e58d2004 	str	r2, [sp, #4]
30007e34:	e58d3000 	str	r3, [sp]
	acoral_msg_t *msg;

	msg = acoral_alloc_msg();
30007e38:	ebffff16 	bl	30007a98 <acoral_alloc_msg>
30007e3c:	e1a03000 	mov	r3, r0
30007e40:	e58d3014 	str	r3, [sp, #20]

	if (msg == NULL)
30007e44:	e59d3014 	ldr	r3, [sp, #20]
30007e48:	e3530000 	cmp	r3, #0
30007e4c:	1a000001 	bne	30007e58 <acoral_msg_create+0x38>
		return NULL;
30007e50:	e3a03000 	mov	r3, #0
30007e54:	ea000014 	b	30007eac <acoral_msg_create+0x8c>

	msg->id   =  id;                 /*消息标识*/
30007e58:	e59d3014 	ldr	r3, [sp, #20]
30007e5c:	e59d2004 	ldr	r2, [sp, #4]
30007e60:	e583200c 	str	r2, [r3, #12]
	msg->n    =  n;                  /*消息被接收次数*/
30007e64:	e59d3014 	ldr	r3, [sp, #20]
30007e68:	e59d200c 	ldr	r2, [sp, #12]
30007e6c:	e5832010 	str	r2, [r3, #16]
	msg->ttl  =  nTtl;               /*消息生存周期*/
30007e70:	e59d3014 	ldr	r3, [sp, #20]
30007e74:	e59d2000 	ldr	r2, [sp]
30007e78:	e5832014 	str	r2, [r3, #20]
	msg->data =  dat;                /*消息指针*/
30007e7c:	e59d3014 	ldr	r3, [sp, #20]
30007e80:	e59d2020 	ldr	r2, [sp, #32]
30007e84:	e5832018 	str	r2, [r3, #24]
	acoral_init_list(&msg->msglist);
30007e88:	e59d3014 	ldr	r3, [sp, #20]
30007e8c:	e2832004 	add	r2, r3, #4
30007e90:	e59d3014 	ldr	r3, [sp, #20]
30007e94:	e5832004 	str	r2, [r3, #4]
30007e98:	e59d3014 	ldr	r3, [sp, #20]
30007e9c:	e2832004 	add	r2, r3, #4
30007ea0:	e59d3014 	ldr	r3, [sp, #20]
30007ea4:	e5832008 	str	r2, [r3, #8]
	return msg;
30007ea8:	e59d3014 	ldr	r3, [sp, #20]
}
30007eac:	e1a00003 	mov	r0, r3
30007eb0:	e28dd01c 	add	sp, sp, #28
30007eb4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30007eb8:	e12fff1e 	bx	lr

30007ebc <acoral_msg_send>:
/*===================================
 * 
 *   消息发送
 *===================================*/
acoral_u32 acoral_msg_send(acoral_msgctr_t* msgctr, acoral_msg_t* msg)
{
30007ebc:	e92d4010 	push	{r4, lr}
30007ec0:	e24dd010 	sub	sp, sp, #16
30007ec4:	e58d0004 	str	r0, [sp, #4]
30007ec8:	e58d1000 	str	r1, [sp]
	acoral_sr     cpu_sr;
	
/*	if (acoral_intr_nesting > 0)
		return MST_ERR_INTR;
*/
	HAL_ENTER_CRITICAL();
30007ecc:	ebffe608 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30007ed0:	e1a03000 	mov	r3, r0
30007ed4:	e58d300c 	str	r3, [sp, #12]
	acoral_spin_lock(&msgctr->spin_lock);

	if (NULL == msgctr)
30007ed8:	e59d3004 	ldr	r3, [sp, #4]
30007edc:	e3530000 	cmp	r3, #0
30007ee0:	1a000003 	bne	30007ef4 <acoral_msg_send+0x38>
	{
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
30007ee4:	e59d000c 	ldr	r0, [sp, #12]
30007ee8:	ebffe5ff 	bl	300016ec <HAL_INTR_RESTORE>
		return MST_ERR_NULL;
30007eec:	e3a03000 	mov	r3, #0
30007ef0:	ea000032 	b	30007fc0 <acoral_msg_send+0x104>
	}

	if (NULL == msg)
30007ef4:	e59d3000 	ldr	r3, [sp]
30007ef8:	e3530000 	cmp	r3, #0
30007efc:	1a000003 	bne	30007f10 <acoral_msg_send+0x54>
	{
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
30007f00:	e59d000c 	ldr	r0, [sp, #12]
30007f04:	ebffe5f8 	bl	300016ec <HAL_INTR_RESTORE>
		return MSG_ERR_NULL;
30007f08:	e3a03007 	mov	r3, #7
30007f0c:	ea00002b 	b	30007fc0 <acoral_msg_send+0x104>
	}

	/*----------------*/
	/*   消息数限制*/
	/*----------------*/
	if (ACORAL_MESSAGE_MAX_COUNT <= msgctr->count)
30007f10:	e59d3004 	ldr	r3, [sp, #4]
30007f14:	e5933018 	ldr	r3, [r3, #24]
30007f18:	e3530009 	cmp	r3, #9
30007f1c:	9a000003 	bls	30007f30 <acoral_msg_send+0x74>
	{
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
30007f20:	e59d000c 	ldr	r0, [sp, #12]
30007f24:	ebffe5f0 	bl	300016ec <HAL_INTR_RESTORE>
		return MSG_ERR_COUNT;
30007f28:	e3a03003 	mov	r3, #3
30007f2c:	ea000023 	b	30007fc0 <acoral_msg_send+0x104>
	}

	/*----------------*/
	/*   增加消息*/
	/*----------------*/
	msgctr->count++;
30007f30:	e59d3004 	ldr	r3, [sp, #4]
30007f34:	e5933018 	ldr	r3, [r3, #24]
30007f38:	e2832001 	add	r2, r3, #1
30007f3c:	e59d3004 	ldr	r3, [sp, #4]
30007f40:	e5832018 	str	r2, [r3, #24]
	msg->ttl += acoral_get_ticks();
30007f44:	e59d3000 	ldr	r3, [sp]
30007f48:	e5934014 	ldr	r4, [r3, #20]
30007f4c:	ebfff166 	bl	300044ec <acoral_get_ticks>
30007f50:	e1a03000 	mov	r3, r0
30007f54:	e0842003 	add	r2, r4, r3
30007f58:	e59d3000 	ldr	r3, [sp]
30007f5c:	e5832014 	str	r2, [r3, #20]
	acoral_list_add2_tail(&msg->msglist, &msgctr->msglist);
30007f60:	e59d3000 	ldr	r3, [sp]
30007f64:	e2832004 	add	r2, r3, #4
30007f68:	e59d3004 	ldr	r3, [sp, #4]
30007f6c:	e2833028 	add	r3, r3, #40	; 0x28
30007f70:	e1a00002 	mov	r0, r2
30007f74:	e1a01003 	mov	r1, r3
30007f78:	eb000810 	bl	30009fc0 <acoral_list_add2_tail>

	/*----------------*/
	/*   唤醒等待*/
	/*----------------*/
	if (msgctr->wait_thread_num > 0)
30007f7c:	e59d3004 	ldr	r3, [sp, #4]
30007f80:	e593301c 	ldr	r3, [r3, #28]
30007f84:	e3530000 	cmp	r3, #0
30007f88:	0a000008 	beq	30007fb0 <acoral_msg_send+0xf4>
	{
		/* 此处将最高优先级唤醒*/
		wake_up_thread(&msgctr->waiting);
30007f8c:	e59d3004 	ldr	r3, [sp, #4]
30007f90:	e2833020 	add	r3, r3, #32
30007f94:	e1a00003 	mov	r0, r3
30007f98:	eb000103 	bl	300083ac <wake_up_thread>
		msgctr->wait_thread_num--;
30007f9c:	e59d3004 	ldr	r3, [sp, #4]
30007fa0:	e593301c 	ldr	r3, [r3, #28]
30007fa4:	e2432001 	sub	r2, r3, #1
30007fa8:	e59d3004 	ldr	r3, [sp, #4]
30007fac:	e583201c 	str	r2, [r3, #28]
	}
	acoral_spin_unlock(&msgctr->spin_lock);
	HAL_EXIT_CRITICAL();
30007fb0:	e59d000c 	ldr	r0, [sp, #12]
30007fb4:	ebffe5cc 	bl	300016ec <HAL_INTR_RESTORE>
	acoral_sched();
30007fb8:	ebffe90e 	bl	300023f8 <acoral_sched>
	return MSGCTR_SUCCED;
30007fbc:	e3a03004 	mov	r3, #4
}
30007fc0:	e1a00003 	mov	r0, r3
30007fc4:	e28dd010 	add	sp, sp, #16
30007fc8:	e8bd4010 	pop	{r4, lr}
30007fcc:	e12fff1e 	bx	lr

30007fd0 <acoral_msg_recv>:
 *===================================*/
void* acoral_msg_recv (acoral_msgctr_t* msgctr,
						acoral_u32  id,
						acoral_time  timeout,
						acoral_u32  *err)
{
30007fd0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30007fd4:	e24dd02c 	sub	sp, sp, #44	; 0x2c
30007fd8:	e58d000c 	str	r0, [sp, #12]
30007fdc:	e58d1008 	str	r1, [sp, #8]
30007fe0:	e58d2004 	str	r2, [sp, #4]
30007fe4:	e58d3000 	str	r3, [sp]
	acoral_sr        cpu_sr;
	acoral_list_t    *p, *q;
	acoral_msg_t     *pmsg;
	acoral_thread_t  *cur;

	if (acoral_intr_nesting > 0)
30007fe8:	ebffe5dc 	bl	30001760 <hal_get_intr_nesting_comm>
30007fec:	e1a03000 	mov	r3, r0
30007ff0:	e3530000 	cmp	r3, #0
30007ff4:	da000004 	ble	3000800c <acoral_msg_recv+0x3c>
	{
		*err = MST_ERR_INTR;
30007ff8:	e59d3000 	ldr	r3, [sp]
30007ffc:	e3a02001 	mov	r2, #1
30008000:	e5832000 	str	r2, [r3]
		return NULL;
30008004:	e3a03000 	mov	r3, #0
30008008:	ea000080 	b	30008210 <acoral_msg_recv+0x240>
	}
	if (NULL == msgctr)
3000800c:	e59d300c 	ldr	r3, [sp, #12]
30008010:	e3530000 	cmp	r3, #0
30008014:	1a000004 	bne	3000802c <acoral_msg_recv+0x5c>
	{
		*err = MST_ERR_NULL;
30008018:	e59d3000 	ldr	r3, [sp]
3000801c:	e3a02000 	mov	r2, #0
30008020:	e5832000 	str	r2, [r3]
		return NULL;
30008024:	e3a03000 	mov	r3, #0
30008028:	ea000078 	b	30008210 <acoral_msg_recv+0x240>
	}

	cur = acoral_cur_thread;
3000802c:	e59f31ec 	ldr	r3, [pc, #492]	; 30008220 <acoral_msg_recv+0x250>
30008030:	e5933000 	ldr	r3, [r3]
30008034:	e58d3024 	str	r3, [sp, #36]	; 0x24

	HAL_ENTER_CRITICAL();
30008038:	ebffe5ad 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000803c:	e1a03000 	mov	r3, r0
30008040:	e58d3014 	str	r3, [sp, #20]
	acoral_spin_lock(&msgctr->spin_lock);
	if(timeout>0){
30008044:	e59d3004 	ldr	r3, [sp, #4]
30008048:	e3530000 	cmp	r3, #0
3000804c:	0a000013 	beq	300080a0 <acoral_msg_recv+0xd0>
		cur->delay = TIME_TO_TICKS(timeout);
30008050:	e59d2004 	ldr	r2, [sp, #4]
30008054:	e1a03002 	mov	r3, r2
30008058:	e1a03103 	lsl	r3, r3, #2
3000805c:	e0833002 	add	r3, r3, r2
30008060:	e1a02103 	lsl	r2, r3, #2
30008064:	e0833002 	add	r3, r3, r2
30008068:	e1a03103 	lsl	r3, r3, #2
3000806c:	e1a02003 	mov	r2, r3
30008070:	e59f31ac 	ldr	r3, [pc, #428]	; 30008224 <acoral_msg_recv+0x254>
30008074:	e0831392 	umull	r1, r3, r2, r3
30008078:	e1a03323 	lsr	r3, r3, #6
3000807c:	e1a02003 	mov	r2, r3
30008080:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
30008084:	e5832040 	str	r2, [r3, #64]	; 0x40
		timeout_queue_add( cur);
30008088:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
3000808c:	ebfff1d5 	bl	300047e8 <timeout_queue_add>
30008090:	ea000002 	b	300080a0 <acoral_msg_recv+0xd0>
		acoral_spin_lock(&msgctr->spin_lock);
	
		if (timeout>0&&(acoral_32)cur->delay <=0 )
			break;

	}
30008094:	e1a00000 	nop			; (mov r0, r0)
30008098:	ea000000 	b	300080a0 <acoral_msg_recv+0xd0>
3000809c:	e1a00000 	nop			; (mov r0, r0)
		cur->delay = TIME_TO_TICKS(timeout);
		timeout_queue_add( cur);
	}
	while(1)
	{
		p = &msgctr->msglist;
300080a0:	e59d300c 	ldr	r3, [sp, #12]
300080a4:	e2833028 	add	r3, r3, #40	; 0x28
300080a8:	e58d3018 	str	r3, [sp, #24]
		q = p->next;
300080ac:	e59d3018 	ldr	r3, [sp, #24]
300080b0:	e5933000 	ldr	r3, [r3]
300080b4:	e58d301c 	str	r3, [sp, #28]
		for( ;p != q; q = q->next)
300080b8:	ea000026 	b	30008158 <acoral_msg_recv+0x188>
		{
			pmsg = list_entry( q, acoral_msg_t, msglist);
300080bc:	e59d301c 	ldr	r3, [sp, #28]
300080c0:	e2433004 	sub	r3, r3, #4
300080c4:	e58d3020 	str	r3, [sp, #32]
			if ( (pmsg->id == id) && (pmsg->n > 0))
300080c8:	e59d3020 	ldr	r3, [sp, #32]
300080cc:	e593200c 	ldr	r2, [r3, #12]
300080d0:	e59d3008 	ldr	r3, [sp, #8]
300080d4:	e1520003 	cmp	r2, r3
300080d8:	1a00001b 	bne	3000814c <acoral_msg_recv+0x17c>
300080dc:	e59d3020 	ldr	r3, [sp, #32]
300080e0:	e5933010 	ldr	r3, [r3, #16]
300080e4:	e3530000 	cmp	r3, #0
300080e8:	0a000017 	beq	3000814c <acoral_msg_recv+0x17c>
			{
				/*-----------------*/
				/* 有接收消息*/
				/*-----------------*/
				pmsg->n--;
300080ec:	e59d3020 	ldr	r3, [sp, #32]
300080f0:	e5933010 	ldr	r3, [r3, #16]
300080f4:	e2432001 	sub	r2, r3, #1
300080f8:	e59d3020 	ldr	r3, [sp, #32]
300080fc:	e5832010 	str	r2, [r3, #16]
				/*-----------------*/
				/* 延时列表删除*/
				/*-----------------*/
				timeout_queue_del(cur);
30008100:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
30008104:	ebfff1f9 	bl	300048f0 <timeout_queue_del>
				dat = pmsg->data;
30008108:	e59d3020 	ldr	r3, [sp, #32]
3000810c:	e5933018 	ldr	r3, [r3, #24]
30008110:	e58d3010 	str	r3, [sp, #16]
				acoral_list_del (q);
30008114:	e59d001c 	ldr	r0, [sp, #28]
30008118:	eb0007bb 	bl	3000a00c <acoral_list_del>
				acoral_release_res ((acoral_res_t *)pmsg);		
3000811c:	e59d3020 	ldr	r3, [sp, #32]
30008120:	e1a00003 	mov	r0, r3
30008124:	ebffed37 	bl	30003608 <acoral_release_res>
				msgctr->count--;
30008128:	e59d300c 	ldr	r3, [sp, #12]
3000812c:	e5933018 	ldr	r3, [r3, #24]
30008130:	e2432001 	sub	r2, r3, #1
30008134:	e59d300c 	ldr	r3, [sp, #12]
30008138:	e5832018 	str	r2, [r3, #24]
				acoral_spin_unlock(&msgctr->spin_lock);
				HAL_EXIT_CRITICAL();
3000813c:	e59d0014 	ldr	r0, [sp, #20]
30008140:	ebffe569 	bl	300016ec <HAL_INTR_RESTORE>
				return dat;
30008144:	e59d3010 	ldr	r3, [sp, #16]
30008148:	ea000030 	b	30008210 <acoral_msg_recv+0x240>
	}
	while(1)
	{
		p = &msgctr->msglist;
		q = p->next;
		for( ;p != q; q = q->next)
3000814c:	e59d301c 	ldr	r3, [sp, #28]
30008150:	e5933000 	ldr	r3, [r3]
30008154:	e58d301c 	str	r3, [sp, #28]
30008158:	e59d2018 	ldr	r2, [sp, #24]
3000815c:	e59d301c 	ldr	r3, [sp, #28]
30008160:	e1520003 	cmp	r2, r3
30008164:	1affffd4 	bne	300080bc <acoral_msg_recv+0xec>
		}
	
		/*-----------------*/
		/*  没有接收消息*/
		/*-----------------*/
		msgctr->wait_thread_num++;
30008168:	e59d300c 	ldr	r3, [sp, #12]
3000816c:	e593301c 	ldr	r3, [r3, #28]
30008170:	e2832001 	add	r2, r3, #1
30008174:	e59d300c 	ldr	r3, [sp, #12]
30008178:	e583201c 	str	r2, [r3, #28]
		acoral_msgctr_queue_add(msgctr, cur);
3000817c:	e59d000c 	ldr	r0, [sp, #12]
30008180:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
30008184:	ebfffe4b 	bl	30007ab8 <acoral_msgctr_queue_add>
		acoral_unrdy_thread(cur);
30008188:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
3000818c:	ebffea80 	bl	30002b94 <acoral_unrdy_thread>
		acoral_spin_unlock(&msgctr->spin_lock);
		HAL_EXIT_CRITICAL();
30008190:	e59d0014 	ldr	r0, [sp, #20]
30008194:	ebffe554 	bl	300016ec <HAL_INTR_RESTORE>
		acoral_sched();
30008198:	ebffe896 	bl	300023f8 <acoral_sched>
		/*-----------------*/
		/*  看有没有超时*/
		/*-----------------*/
		HAL_ENTER_CRITICAL();
3000819c:	ebffe554 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300081a0:	e1a03000 	mov	r3, r0
300081a4:	e58d3014 	str	r3, [sp, #20]
		acoral_spin_lock(&msgctr->spin_lock);
	
		if (timeout>0&&(acoral_32)cur->delay <=0 )
300081a8:	e59d3004 	ldr	r3, [sp, #4]
300081ac:	e3530000 	cmp	r3, #0
300081b0:	0affffb7 	beq	30008094 <acoral_msg_recv+0xc4>
300081b4:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300081b8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
300081bc:	e3530000 	cmp	r3, #0
300081c0:	caffffb5 	bgt	3000809c <acoral_msg_recv+0xcc>

	/*---------------*/
	/*  超时退出*/
	/*---------------*/
//	timeout_queue_del(cur);
	if(msgctr->wait_thread_num>0)
300081c4:	e59d300c 	ldr	r3, [sp, #12]
300081c8:	e593301c 	ldr	r3, [r3, #28]
300081cc:	e3530000 	cmp	r3, #0
300081d0:	0a000004 	beq	300081e8 <acoral_msg_recv+0x218>
		msgctr->wait_thread_num--;
300081d4:	e59d300c 	ldr	r3, [sp, #12]
300081d8:	e593301c 	ldr	r3, [r3, #28]
300081dc:	e2432001 	sub	r2, r3, #1
300081e0:	e59d300c 	ldr	r3, [sp, #12]
300081e4:	e583201c 	str	r2, [r3, #28]
	acoral_list_del(&cur->waiting);
300081e8:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
300081ec:	e2833020 	add	r3, r3, #32
300081f0:	e1a00003 	mov	r0, r3
300081f4:	eb000784 	bl	3000a00c <acoral_list_del>
	acoral_spin_unlock(&msgctr->spin_lock);
	HAL_EXIT_CRITICAL();
300081f8:	e59d0014 	ldr	r0, [sp, #20]
300081fc:	ebffe53a 	bl	300016ec <HAL_INTR_RESTORE>
	*err = MST_ERR_TIMEOUT;
30008200:	e59d3000 	ldr	r3, [sp]
30008204:	e3a02002 	mov	r2, #2
30008208:	e5832000 	str	r2, [r3]
	return NULL;
3000820c:	e3a03000 	mov	r3, #0

}
30008210:	e1a00003 	mov	r0, r3
30008214:	e28dd02c 	add	sp, sp, #44	; 0x2c
30008218:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000821c:	e12fff1e 	bx	lr
30008220:	300103f8 	.word	0x300103f8
30008224:	10624dd3 	.word	0x10624dd3

30008228 <acoral_msgctr_del>:
/*===================================
 *
 *  消息删除
 *===================================*/
acoral_u32 acoral_msgctr_del(acoral_msgctr_t* pmsgctr, acoral_u32 flag)
{
30008228:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000822c:	e24dd01c 	sub	sp, sp, #28
30008230:	e58d0004 	str	r0, [sp, #4]
30008234:	e58d1000 	str	r1, [sp]
	acoral_list_t    *p, *q;
	acoral_thread_t  *thread;
	acoral_msg_t     *pmsg;
	
	if(NULL == pmsgctr)
30008238:	e59d3004 	ldr	r3, [sp, #4]
3000823c:	e3530000 	cmp	r3, #0
30008240:	1a000001 	bne	3000824c <acoral_msgctr_del+0x24>
		return MST_ERR_NULL;
30008244:	e3a03000 	mov	r3, #0
30008248:	ea000045 	b	30008364 <acoral_msgctr_del+0x13c>
	if (flag == MST_DEL_UNFORCE)
3000824c:	e59d3000 	ldr	r3, [sp]
30008250:	e3530000 	cmp	r3, #0
30008254:	1a00000d 	bne	30008290 <acoral_msgctr_del+0x68>
	{
		if ((pmsgctr->count > 0) || (pmsgctr->wait_thread_num > 0))
30008258:	e59d3004 	ldr	r3, [sp, #4]
3000825c:	e5933018 	ldr	r3, [r3, #24]
30008260:	e3530000 	cmp	r3, #0
30008264:	1a000003 	bne	30008278 <acoral_msgctr_del+0x50>
30008268:	e59d3004 	ldr	r3, [sp, #4]
3000826c:	e593301c 	ldr	r3, [r3, #28]
30008270:	e3530000 	cmp	r3, #0
30008274:	0a000001 	beq	30008280 <acoral_msgctr_del+0x58>
			return MST_ERR_UNDEF;
30008278:	e3a03003 	mov	r3, #3
3000827c:	ea000038 	b	30008364 <acoral_msgctr_del+0x13c>
		else
			acoral_release_res((acoral_res_t *)pmsgctr);
30008280:	e59d3004 	ldr	r3, [sp, #4]
30008284:	e1a00003 	mov	r0, r3
30008288:	ebffecde 	bl	30003608 <acoral_release_res>
3000828c:	ea000033 	b	30008360 <acoral_msgctr_del+0x138>
	}
	else
	{
		// 释放等待进程
		if (pmsgctr->wait_thread_num > 0)
30008290:	e59d3004 	ldr	r3, [sp, #4]
30008294:	e593301c 	ldr	r3, [r3, #28]
30008298:	e3530000 	cmp	r3, #0
3000829c:	0a000012 	beq	300082ec <acoral_msgctr_del+0xc4>
		{
			p = &pmsgctr->waiting;
300082a0:	e59d3004 	ldr	r3, [sp, #4]
300082a4:	e2833020 	add	r3, r3, #32
300082a8:	e58d3008 	str	r3, [sp, #8]
			q = p->next;
300082ac:	e59d3008 	ldr	r3, [sp, #8]
300082b0:	e5933000 	ldr	r3, [r3]
300082b4:	e58d300c 	str	r3, [sp, #12]
			for(; q != p; q = q->next)
300082b8:	ea000007 	b	300082dc <acoral_msgctr_del+0xb4>
			{
				thread=list_entry( q, acoral_thread_t, waiting);
300082bc:	e59d300c 	ldr	r3, [sp, #12]
300082c0:	e2433020 	sub	r3, r3, #32
300082c4:	e58d3010 	str	r3, [sp, #16]
				//acoral_list_del  (&thread->waiting);
				acoral_rdy_thread(thread);
300082c8:	e59d0010 	ldr	r0, [sp, #16]
300082cc:	ebffea21 	bl	30002b58 <acoral_rdy_thread>
		// 释放等待进程
		if (pmsgctr->wait_thread_num > 0)
		{
			p = &pmsgctr->waiting;
			q = p->next;
			for(; q != p; q = q->next)
300082d0:	e59d300c 	ldr	r3, [sp, #12]
300082d4:	e5933000 	ldr	r3, [r3]
300082d8:	e58d300c 	str	r3, [sp, #12]
300082dc:	e59d200c 	ldr	r2, [sp, #12]
300082e0:	e59d3008 	ldr	r3, [sp, #8]
300082e4:	e1520003 	cmp	r2, r3
300082e8:	1afffff3 	bne	300082bc <acoral_msgctr_del+0x94>
				acoral_rdy_thread(thread);
			}
		}
		
		// 释放消息结构
		if (pmsgctr->count > 0)
300082ec:	e59d3004 	ldr	r3, [sp, #4]
300082f0:	e5933018 	ldr	r3, [r3, #24]
300082f4:	e3530000 	cmp	r3, #0
300082f8:	0a000015 	beq	30008354 <acoral_msgctr_del+0x12c>
		{
			p = &pmsgctr->msglist;
300082fc:	e59d3004 	ldr	r3, [sp, #4]
30008300:	e2833028 	add	r3, r3, #40	; 0x28
30008304:	e58d3008 	str	r3, [sp, #8]
			q = p->next;
30008308:	e59d3008 	ldr	r3, [sp, #8]
3000830c:	e5933000 	ldr	r3, [r3]
30008310:	e58d300c 	str	r3, [sp, #12]
			for( ;p != q; q = p->next)
30008314:	ea00000a 	b	30008344 <acoral_msgctr_del+0x11c>
			{
				pmsg = list_entry( q, acoral_msg_t, msglist);
30008318:	e59d300c 	ldr	r3, [sp, #12]
3000831c:	e2433004 	sub	r3, r3, #4
30008320:	e58d3014 	str	r3, [sp, #20]
				acoral_list_del (q);
30008324:	e59d000c 	ldr	r0, [sp, #12]
30008328:	eb000737 	bl	3000a00c <acoral_list_del>
				acoral_release_res ((acoral_res_t *)pmsg);		
3000832c:	e59d3014 	ldr	r3, [sp, #20]
30008330:	e1a00003 	mov	r0, r3
30008334:	ebffecb3 	bl	30003608 <acoral_release_res>
		// 释放消息结构
		if (pmsgctr->count > 0)
		{
			p = &pmsgctr->msglist;
			q = p->next;
			for( ;p != q; q = p->next)
30008338:	e59d3008 	ldr	r3, [sp, #8]
3000833c:	e5933000 	ldr	r3, [r3]
30008340:	e58d300c 	str	r3, [sp, #12]
30008344:	e59d2008 	ldr	r2, [sp, #8]
30008348:	e59d300c 	ldr	r3, [sp, #12]
3000834c:	e1520003 	cmp	r2, r3
30008350:	1afffff0 	bne	30008318 <acoral_msgctr_del+0xf0>
				acoral_release_res ((acoral_res_t *)pmsg);		
			}		
		}
		
		// 释放资源
		acoral_release_res((acoral_res_t *)pmsgctr);
30008354:	e59d3004 	ldr	r3, [sp, #4]
30008358:	e1a00003 	mov	r0, r3
3000835c:	ebffeca9 	bl	30003608 <acoral_release_res>
30008360:	eaffffff 	b	30008364 <acoral_msgctr_del+0x13c>
	}
}
30008364:	e1a00003 	mov	r0, r3
30008368:	e28dd01c 	add	sp, sp, #28
3000836c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008370:	e12fff1e 	bx	lr

30008374 <acoral_msg_del>:

acoral_u32 acoral_msg_del(acoral_msg_t* pmsg)
{
30008374:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008378:	e24dd00c 	sub	sp, sp, #12
3000837c:	e58d0004 	str	r0, [sp, #4]
	if (NULL != pmsg)
30008380:	e59d3004 	ldr	r3, [sp, #4]
30008384:	e3530000 	cmp	r3, #0
30008388:	0a000002 	beq	30008398 <acoral_msg_del+0x24>
		acoral_release_res ((acoral_res_t *)pmsg);
3000838c:	e59d3004 	ldr	r3, [sp, #4]
30008390:	e1a00003 	mov	r0, r3
30008394:	ebffec9b 	bl	30003608 <acoral_release_res>
	return 0;
30008398:	e3a03000 	mov	r3, #0
}
3000839c:	e1a00003 	mov	r0, r3
300083a0:	e28dd00c 	add	sp, sp, #12
300083a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300083a8:	e12fff1e 	bx	lr

300083ac <wake_up_thread>:
/*==========================
 *
 *  唤醒最高优先等待线程
 *==========================*/
void wake_up_thread(acoral_list_t  *head)
{
300083ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300083b0:	e24dd01c 	sub	sp, sp, #28
300083b4:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t    *p, *q;
	acoral_thread_t  *thread;

	p = head;
300083b8:	e59d3004 	ldr	r3, [sp, #4]
300083bc:	e58d300c 	str	r3, [sp, #12]
	q = p->next;
300083c0:	e59d300c 	ldr	r3, [sp, #12]
300083c4:	e5933000 	ldr	r3, [r3]
300083c8:	e58d3010 	str	r3, [sp, #16]
	thread=list_entry( q, acoral_thread_t, waiting);
300083cc:	e59d3010 	ldr	r3, [sp, #16]
300083d0:	e2433020 	sub	r3, r3, #32
300083d4:	e58d3014 	str	r3, [sp, #20]
	acoral_list_del  (&thread->waiting);
300083d8:	e59d3014 	ldr	r3, [sp, #20]
300083dc:	e2833020 	add	r3, r3, #32
300083e0:	e1a00003 	mov	r0, r3
300083e4:	eb000708 	bl	3000a00c <acoral_list_del>
	acoral_rdy_thread(thread);
300083e8:	e59d0014 	ldr	r0, [sp, #20]
300083ec:	ebffe9d9 	bl	30002b58 <acoral_rdy_thread>
}
300083f0:	e28dd01c 	add	sp, sp, #28
300083f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300083f8:	e12fff1e 	bx	lr

300083fc <acoral_print_all_msg>:
/*======================*/
/**/
/*  输出事件容器上全部消息*/
/*======================*/
void acoral_print_all_msg(acoral_msgctr_t* msgctr)
{
300083fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008400:	e24dd01c 	sub	sp, sp, #28
30008404:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t *p, *q;
	acoral_msg_t  *pmsg;

	acoral_doMsgTtl_checked = DO_CHECKED_TRUE;
30008408:	e59f3074 	ldr	r3, [pc, #116]	; 30008484 <acoral_print_all_msg+0x88>
3000840c:	e3a02000 	mov	r2, #0
30008410:	e5832000 	str	r2, [r3]

	p = &msgctr->msglist;
30008414:	e59d3004 	ldr	r3, [sp, #4]
30008418:	e2833028 	add	r3, r3, #40	; 0x28
3000841c:	e58d300c 	str	r3, [sp, #12]
	q = p->next;
30008420:	e59d300c 	ldr	r3, [sp, #12]
30008424:	e5933000 	ldr	r3, [r3]
30008428:	e58d3010 	str	r3, [sp, #16]
	for( ;p != q; q = q->next)
3000842c:	ea00000a 	b	3000845c <acoral_print_all_msg+0x60>
	{
		pmsg = list_entry( q, acoral_msg_t, msglist);
30008430:	e59d3010 	ldr	r3, [sp, #16]
30008434:	e2433004 	sub	r3, r3, #4
30008438:	e58d3014 	str	r3, [sp, #20]
		acoral_print ("\nid = %d", pmsg->id);
3000843c:	e59d3014 	ldr	r3, [sp, #20]
30008440:	e593300c 	ldr	r3, [r3, #12]
30008444:	e59f003c 	ldr	r0, [pc, #60]	; 30008488 <acoral_print_all_msg+0x8c>
30008448:	e1a01003 	mov	r1, r3
3000844c:	eb000b6d 	bl	3000b208 <acoral_print>

	acoral_doMsgTtl_checked = DO_CHECKED_TRUE;

	p = &msgctr->msglist;
	q = p->next;
	for( ;p != q; q = q->next)
30008450:	e59d3010 	ldr	r3, [sp, #16]
30008454:	e5933000 	ldr	r3, [r3]
30008458:	e58d3010 	str	r3, [sp, #16]
3000845c:	e59d200c 	ldr	r2, [sp, #12]
30008460:	e59d3010 	ldr	r3, [sp, #16]
30008464:	e1520003 	cmp	r2, r3
30008468:	1afffff0 	bne	30008430 <acoral_print_all_msg+0x34>
	{
		pmsg = list_entry( q, acoral_msg_t, msglist);
		acoral_print ("\nid = %d", pmsg->id);
	}

	acoral_doMsgTtl_checked = DO_CHECKED_FALSE;
3000846c:	e59f3010 	ldr	r3, [pc, #16]	; 30008484 <acoral_print_all_msg+0x88>
30008470:	e3a02001 	mov	r2, #1
30008474:	e5832000 	str	r2, [r3]

}
30008478:	e28dd01c 	add	sp, sp, #28
3000847c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008480:	e12fff1e 	bx	lr
30008484:	3000ea44 	.word	0x3000ea44
30008488:	3000e5d4 	.word	0x3000e5d4

3000848c <acoral_print_waitThreadsNum>:
/*======================*/
/**/
/*  输出等待任务数目*/
/*======================*/
void acoral_print_waitThreadsNum(acoral_msgctr_t* msgctr)
{
3000848c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008490:	e24dd00c 	sub	sp, sp, #12
30008494:	e58d0004 	str	r0, [sp, #4]
	acoral_print("\n wait threads mum = %d", msgctr->wait_thread_num);
30008498:	e59d3004 	ldr	r3, [sp, #4]
3000849c:	e593301c 	ldr	r3, [r3, #28]
300084a0:	e59f0010 	ldr	r0, [pc, #16]	; 300084b8 <acoral_print_waitThreadsNum+0x2c>
300084a4:	e1a01003 	mov	r1, r3
300084a8:	eb000b56 	bl	3000b208 <acoral_print>
}
300084ac:	e28dd00c 	add	sp, sp, #12
300084b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300084b4:	e12fff1e 	bx	lr
300084b8:	3000e5e0 	.word	0x3000e5e0

300084bc <rm_policy_thread_init>:
struct{
	acoral_u32 num;
	acoral_fl sum;
}left[HAL_MAX_CPU];

acoral_id rm_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
300084bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300084c0:	e24dd024 	sub	sp, sp, #36	; 0x24
300084c4:	e58d000c 	str	r0, [sp, #12]
300084c8:	e58d1008 	str	r1, [sp, #8]
300084cc:	e58d2004 	str	r2, [sp, #4]
300084d0:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_rm_policy_data_t *policy_data;
	rm_policy_data_t *private_data;
	policy_data=(acoral_rm_policy_data_t *)data;
300084d4:	e59d3000 	ldr	r3, [sp]
300084d8:	e58d3018 	str	r3, [sp, #24]
	private_data=(rm_policy_data_t *)acoral_malloc2(sizeof(rm_policy_data_t));
300084dc:	e3a0001c 	mov	r0, #28
300084e0:	ebfff9bf 	bl	30006be4 <v_malloc>
300084e4:	e1a03000 	mov	r3, r0
300084e8:	e58d301c 	str	r3, [sp, #28]
	if(private_data==NULL){
300084ec:	e59d301c 	ldr	r3, [sp, #28]
300084f0:	e3530000 	cmp	r3, #0
300084f4:	1a00000e 	bne	30008534 <rm_policy_thread_init+0x78>
		acoral_printerr("No level2 mem space for private_data:%s\n",thread->name);
300084f8:	e59d300c 	ldr	r3, [sp, #12]
300084fc:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008500:	e59f00f8 	ldr	r0, [pc, #248]	; 30008600 <rm_policy_thread_init+0x144>
30008504:	e1a01003 	mov	r1, r3
30008508:	eb000b3e 	bl	3000b208 <acoral_print>
		HAL_ENTER_CRITICAL();
3000850c:	ebffe478 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008510:	e1a03000 	mov	r3, r0
30008514:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
30008518:	e59d300c 	ldr	r3, [sp, #12]
3000851c:	e1a00003 	mov	r0, r3
30008520:	ebffec38 	bl	30003608 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30008524:	e59d0014 	ldr	r0, [sp, #20]
30008528:	ebffe46f 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
3000852c:	e3e03000 	mvn	r3, #0
30008530:	ea00002e 	b	300085f0 <rm_policy_thread_init+0x134>
	}
	private_data->t=100*policy_data->t;
30008534:	e59d3018 	ldr	r3, [sp, #24]
30008538:	e5932000 	ldr	r2, [r3]
3000853c:	e1a03002 	mov	r3, r2
30008540:	e1a03103 	lsl	r3, r3, #2
30008544:	e0833002 	add	r3, r3, r2
30008548:	e1a02103 	lsl	r2, r3, #2
3000854c:	e0833002 	add	r3, r3, r2
30008550:	e1a03103 	lsl	r3, r3, #2
30008554:	e1a02003 	mov	r2, r3
30008558:	e59d301c 	ldr	r3, [sp, #28]
3000855c:	e583200c 	str	r2, [r3, #12]
	private_data->lt=private_data->t;
30008560:	e59d301c 	ldr	r3, [sp, #28]
30008564:	e593200c 	ldr	r2, [r3, #12]
30008568:	e59d301c 	ldr	r3, [sp, #28]
3000856c:	e5832010 	str	r2, [r3, #16]
	private_data->e=100*policy_data->e;
30008570:	e59d3018 	ldr	r3, [sp, #24]
30008574:	e5932004 	ldr	r2, [r3, #4]
30008578:	e1a03002 	mov	r3, r2
3000857c:	e1a03103 	lsl	r3, r3, #2
30008580:	e0833002 	add	r3, r3, r2
30008584:	e1a02103 	lsl	r2, r3, #2
30008588:	e0833002 	add	r3, r3, r2
3000858c:	e1a03103 	lsl	r3, r3, #2
30008590:	e1a02003 	mov	r2, r3
30008594:	e59d301c 	ldr	r3, [sp, #28]
30008598:	e5832014 	str	r2, [r3, #20]
	private_data->le=private_data->e;
3000859c:	e59d301c 	ldr	r3, [sp, #28]
300085a0:	e5932014 	ldr	r2, [r3, #20]
300085a4:	e59d301c 	ldr	r3, [sp, #28]
300085a8:	e5832018 	str	r2, [r3, #24]
	private_data->period_data.args=args;
300085ac:	e59d301c 	ldr	r3, [sp, #28]
300085b0:	e59d2004 	ldr	r2, [sp, #4]
300085b4:	e5832008 	str	r2, [r3, #8]
	private_data->period_data.route=route;
300085b8:	e59d301c 	ldr	r3, [sp, #28]
300085bc:	e59d2008 	ldr	r2, [sp, #8]
300085c0:	e5832004 	str	r2, [r3, #4]
	private_data->period_data.time=private_data->t;
300085c4:	e59d301c 	ldr	r3, [sp, #28]
300085c8:	e593200c 	ldr	r2, [r3, #12]
300085cc:	e59d301c 	ldr	r3, [sp, #28]
300085d0:	e5832000 	str	r2, [r3]
	thread->private_data=private_data;
300085d4:	e59d300c 	ldr	r3, [sp, #12]
300085d8:	e59d201c 	ldr	r2, [sp, #28]
300085dc:	e5832050 	str	r2, [r3, #80]	; 0x50
	rm_queue_ascend_add(thread);
300085e0:	e59d000c 	ldr	r0, [sp, #12]
300085e4:	eb000021 	bl	30008670 <rm_queue_ascend_add>
	return thread->res.id;
300085e8:	e59d300c 	ldr	r3, [sp, #12]
300085ec:	e5933000 	ldr	r3, [r3]
}
300085f0:	e1a00003 	mov	r0, r3
300085f4:	e28dd024 	add	sp, sp, #36	; 0x24
300085f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300085fc:	e12fff1e 	bx	lr
30008600:	3000e5f8 	.word	0x3000e5f8

30008604 <rm_policy_thread_release>:

void rm_policy_thread_release(acoral_thread_t *thread){
30008604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008608:	e24dd00c 	sub	sp, sp, #12
3000860c:	e58d0004 	str	r0, [sp, #4]
	acoral_printk("Release Rm thread\n");
	acoral_free2(thread->private_data);	
30008610:	e59d3004 	ldr	r3, [sp, #4]
30008614:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008618:	e1a00003 	mov	r0, r3
3000861c:	ebfff985 	bl	30006c38 <v_free>
}
30008620:	e28dd00c 	add	sp, sp, #12
30008624:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008628:	e12fff1e 	bx	lr

3000862c <rm_discard_thread>:

void rm_discard_thread(acoral_thread_t *thread){
3000862c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008630:	e24dd00c 	sub	sp, sp, #12
30008634:	e58d0004 	str	r0, [sp, #4]
	acoral_list_del(&thread->ready);
30008638:	e59d3004 	ldr	r3, [sp, #4]
3000863c:	e2833010 	add	r3, r3, #16
30008640:	e1a00003 	mov	r0, r3
30008644:	eb000670 	bl	3000a00c <acoral_list_del>
	acoral_free2(thread->private_data);	
30008648:	e59d3004 	ldr	r3, [sp, #4]
3000864c:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008650:	e1a00003 	mov	r0, r3
30008654:	ebfff977 	bl	30006c38 <v_free>
	acoral_release_res((acoral_res_t *)thread);
30008658:	e59d3004 	ldr	r3, [sp, #4]
3000865c:	e1a00003 	mov	r0, r3
30008660:	ebffebe8 	bl	30003608 <acoral_release_res>
}
30008664:	e28dd00c 	add	sp, sp, #12
30008668:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000866c:	e12fff1e 	bx	lr

30008670 <rm_queue_ascend_add>:

void rm_queue_ascend_add(acoral_thread_t *new){
30008670:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008674:	e24dd024 	sub	sp, sp, #36	; 0x24
30008678:	e58d0004 	str	r0, [sp, #4]
      rm_policy_data_t *new_data;
      rm_policy_data_t *old_data;
      acoral_thread_t * thread;
      acoral_list_t *tmp,*head;
      head=&rm_queue->head;
3000867c:	e59f309c 	ldr	r3, [pc, #156]	; 30008720 <rm_queue_ascend_add+0xb0>
30008680:	e5933000 	ldr	r3, [r3]
30008684:	e58d301c 	str	r3, [sp, #28]
      new_data=new->private_data; 
30008688:	e59d3004 	ldr	r3, [sp, #4]
3000868c:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008690:	e58d300c 	str	r3, [sp, #12]
      for (tmp=head->next;tmp!=head; tmp=tmp->next){
30008694:	e59d301c 	ldr	r3, [sp, #28]
30008698:	e5933000 	ldr	r3, [r3]
3000869c:	e58d3018 	str	r3, [sp, #24]
300086a0:	ea00000e 	b	300086e0 <rm_queue_ascend_add+0x70>
		thread =list_entry(tmp, acoral_thread_t,ready);
300086a4:	e59d3018 	ldr	r3, [sp, #24]
300086a8:	e2433010 	sub	r3, r3, #16
300086ac:	e58d3014 	str	r3, [sp, #20]
		old_data=thread->private_data;
300086b0:	e59d3014 	ldr	r3, [sp, #20]
300086b4:	e5933050 	ldr	r3, [r3, #80]	; 0x50
300086b8:	e58d3010 	str	r3, [sp, #16]
      	        if(old_data->lt>new_data->lt)
300086bc:	e59d3010 	ldr	r3, [sp, #16]
300086c0:	e5932010 	ldr	r2, [r3, #16]
300086c4:	e59d300c 	ldr	r3, [sp, #12]
300086c8:	e5933010 	ldr	r3, [r3, #16]
300086cc:	e1520003 	cmp	r2, r3
300086d0:	8a000007 	bhi	300086f4 <rm_queue_ascend_add+0x84>
      rm_policy_data_t *old_data;
      acoral_thread_t * thread;
      acoral_list_t *tmp,*head;
      head=&rm_queue->head;
      new_data=new->private_data; 
      for (tmp=head->next;tmp!=head; tmp=tmp->next){
300086d4:	e59d3018 	ldr	r3, [sp, #24]
300086d8:	e5933000 	ldr	r3, [r3]
300086dc:	e58d3018 	str	r3, [sp, #24]
300086e0:	e59d2018 	ldr	r2, [sp, #24]
300086e4:	e59d301c 	ldr	r3, [sp, #28]
300086e8:	e1520003 	cmp	r2, r3
300086ec:	1affffec 	bne	300086a4 <rm_queue_ascend_add+0x34>
300086f0:	ea000000 	b	300086f8 <rm_queue_ascend_add+0x88>
		thread =list_entry(tmp, acoral_thread_t,ready);
		old_data=thread->private_data;
      	        if(old_data->lt>new_data->lt)
			break;		  
300086f4:	e1a00000 	nop			; (mov r0, r0)
     }
     acoral_list_add(&new->ready,tmp->prev);
300086f8:	e59d3004 	ldr	r3, [sp, #4]
300086fc:	e2832010 	add	r2, r3, #16
30008700:	e59d3018 	ldr	r3, [sp, #24]
30008704:	e5933004 	ldr	r3, [r3, #4]
30008708:	e1a00002 	mov	r0, r2
3000870c:	e1a01003 	mov	r1, r3
30008710:	eb000617 	bl	30009f74 <acoral_list_add>
}
30008714:	e28dd024 	add	sp, sp, #36	; 0x24
30008718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000871c:	e12fff1e 	bx	lr
30008720:	3000ea4c 	.word	0x3000ea4c

30008724 <rm_check>:

acoral_u8 rm_check(acoral_thread_t *thread,acoral_u32 cpu){
30008724:	e92d4010 	push	{r4, lr}
30008728:	e24dd010 	sub	sp, sp, #16
3000872c:	e58d0004 	str	r0, [sp, #4]
30008730:	e58d1000 	str	r1, [sp]
	rm_policy_data_t *data;
	acoral_fl tmp;
	data=thread->private_data;
30008734:	e59d3004 	ldr	r3, [sp, #4]
30008738:	e5933050 	ldr	r3, [r3, #80]	; 0x50
3000873c:	e58d3008 	str	r3, [sp, #8]
	tmp=(acoral_fl)data->e/(acoral_fl)data->t;		
30008740:	e59d3008 	ldr	r3, [sp, #8]
30008744:	e5933014 	ldr	r3, [r3, #20]
30008748:	e1a00003 	mov	r0, r3
3000874c:	eb001564 	bl	3000dce4 <__aeabi_ui2f>
30008750:	e1a04000 	mov	r4, r0
30008754:	e59d3008 	ldr	r3, [sp, #8]
30008758:	e593300c 	ldr	r3, [r3, #12]
3000875c:	e1a00003 	mov	r0, r3
30008760:	eb00155f 	bl	3000dce4 <__aeabi_ui2f>
30008764:	e1a03000 	mov	r3, r0
30008768:	e1a00004 	mov	r0, r4
3000876c:	e1a01003 	mov	r1, r3
30008770:	eb0015fa 	bl	3000df60 <__aeabi_fdiv>
30008774:	e1a03000 	mov	r3, r0
30008778:	e58d300c 	str	r3, [sp, #12]
	if(left[cpu].sum+tmp<right[left[cpu].num]){
3000877c:	e59d1000 	ldr	r1, [sp]
30008780:	e59f20ec 	ldr	r2, [pc, #236]	; 30008874 <rm_check+0x150>
30008784:	e3a03004 	mov	r3, #4
30008788:	e1a01181 	lsl	r1, r1, #3
3000878c:	e0812002 	add	r2, r1, r2
30008790:	e0823003 	add	r3, r2, r3
30008794:	e5933000 	ldr	r3, [r3]
30008798:	e1a00003 	mov	r0, r3
3000879c:	e59d100c 	ldr	r1, [sp, #12]
300087a0:	eb0014e0 	bl	3000db28 <__addsf3>
300087a4:	e1a03000 	mov	r3, r0
300087a8:	e1a02003 	mov	r2, r3
300087ac:	e59d1000 	ldr	r1, [sp]
300087b0:	e59f30bc 	ldr	r3, [pc, #188]	; 30008874 <rm_check+0x150>
300087b4:	e7931181 	ldr	r1, [r3, r1, lsl #3]
300087b8:	e59f30b8 	ldr	r3, [pc, #184]	; 30008878 <rm_check+0x154>
300087bc:	e7933101 	ldr	r3, [r3, r1, lsl #2]
300087c0:	e3a01000 	mov	r1, #0
300087c4:	e1a04001 	mov	r4, r1
300087c8:	e1a00002 	mov	r0, r2
300087cc:	e1a01003 	mov	r1, r3
300087d0:	eb001667 	bl	3000e174 <__aeabi_fcmplt>
300087d4:	e1a03000 	mov	r3, r0
300087d8:	e3530000 	cmp	r3, #0
300087dc:	0a000001 	beq	300087e8 <rm_check+0xc4>
300087e0:	e3a03001 	mov	r3, #1
300087e4:	e1a04003 	mov	r4, r3
300087e8:	e20430ff 	and	r3, r4, #255	; 0xff
300087ec:	e3530000 	cmp	r3, #0
300087f0:	0a00001a 	beq	30008860 <rm_check+0x13c>
		left[cpu].sum+=tmp;
300087f4:	e59d4000 	ldr	r4, [sp]
300087f8:	e59d1000 	ldr	r1, [sp]
300087fc:	e59f2070 	ldr	r2, [pc, #112]	; 30008874 <rm_check+0x150>
30008800:	e3a03004 	mov	r3, #4
30008804:	e1a01181 	lsl	r1, r1, #3
30008808:	e0812002 	add	r2, r1, r2
3000880c:	e0823003 	add	r3, r2, r3
30008810:	e5933000 	ldr	r3, [r3]
30008814:	e1a00003 	mov	r0, r3
30008818:	e59d100c 	ldr	r1, [sp, #12]
3000881c:	eb0014c1 	bl	3000db28 <__addsf3>
30008820:	e1a03000 	mov	r3, r0
30008824:	e1a02003 	mov	r2, r3
30008828:	e59f1044 	ldr	r1, [pc, #68]	; 30008874 <rm_check+0x150>
3000882c:	e3a03004 	mov	r3, #4
30008830:	e1a00184 	lsl	r0, r4, #3
30008834:	e0801001 	add	r1, r0, r1
30008838:	e0813003 	add	r3, r1, r3
3000883c:	e5832000 	str	r2, [r3]
		left[cpu].num++;
30008840:	e59d3000 	ldr	r3, [sp]
30008844:	e59f2028 	ldr	r2, [pc, #40]	; 30008874 <rm_check+0x150>
30008848:	e7922183 	ldr	r2, [r2, r3, lsl #3]
3000884c:	e2821001 	add	r1, r2, #1
30008850:	e59f201c 	ldr	r2, [pc, #28]	; 30008874 <rm_check+0x150>
30008854:	e7821183 	str	r1, [r2, r3, lsl #3]
		return 1;
30008858:	e3a03001 	mov	r3, #1
3000885c:	ea000000 	b	30008864 <rm_check+0x140>
	}
	return 0;
30008860:	e3a03000 	mov	r3, #0
}
30008864:	e1a00003 	mov	r0, r3
30008868:	e28dd010 	add	sp, sp, #16
3000886c:	e8bd4010 	pop	{r4, lr}
30008870:	e12fff1e 	bx	lr
30008874:	3000fab4 	.word	0x3000fab4
30008878:	3000ea50 	.word	0x3000ea50

3000887c <rm_thread_dispatch>:

void rm_thread_dispatch(){
3000887c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008880:	e24dd01c 	sub	sp, sp, #28
	acoral_sr cpu_sr;
	acoral_u32 i;
	acoral_thread_t * thread;
	acoral_list_t *tmp,*head;
	HAL_ENTER_CRITICAL();
30008884:	ebffe39a 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008888:	e1a03000 	mov	r3, r0
3000888c:	e58d3004 	str	r3, [sp, #4]
	head=&rm_queue->head;
30008890:	e59f3120 	ldr	r3, [pc, #288]	; 300089b8 <rm_thread_dispatch+0x13c>
30008894:	e5933000 	ldr	r3, [r3]
30008898:	e58d3014 	str	r3, [sp, #20]
	for (tmp=head->next;tmp!=head;){
3000889c:	e59d3014 	ldr	r3, [sp, #20]
300088a0:	e5933000 	ldr	r3, [r3]
300088a4:	e58d3010 	str	r3, [sp, #16]
300088a8:	ea000039 	b	30008994 <rm_thread_dispatch+0x118>
		thread =list_entry(tmp, acoral_thread_t,ready);
300088ac:	e59d3010 	ldr	r3, [sp, #16]
300088b0:	e2433010 	sub	r3, r3, #16
300088b4:	e58d300c 	str	r3, [sp, #12]
		tmp=tmp->next;
300088b8:	e59d3010 	ldr	r3, [sp, #16]
300088bc:	e5933000 	ldr	r3, [r3]
300088c0:	e58d3010 	str	r3, [sp, #16]
		if(prio>=ACORAL_HARD_RT_PRIO_MAX){
300088c4:	e59f30f0 	ldr	r3, [pc, #240]	; 300089bc <rm_thread_dispatch+0x140>
300088c8:	e5933000 	ldr	r3, [r3]
300088cc:	e3530001 	cmp	r3, #1
300088d0:	9a000007 	bls	300088f4 <rm_thread_dispatch+0x78>
				acoral_printerr("RM thread %s Err,Prio is not enough\n",thread->name);
300088d4:	e59d300c 	ldr	r3, [sp, #12]
300088d8:	e5933048 	ldr	r3, [r3, #72]	; 0x48
300088dc:	e59f00dc 	ldr	r0, [pc, #220]	; 300089c0 <rm_thread_dispatch+0x144>
300088e0:	e1a01003 	mov	r1, r3
300088e4:	eb000a47 	bl	3000b208 <acoral_print>
				/*这个线程还没初始化，包括它的stack,lock等,原来是用acoral_release_thread导致很多错误*/
				rm_discard_thread(thread);
300088e8:	e59d000c 	ldr	r0, [sp, #12]
300088ec:	ebffff4e 	bl	3000862c <rm_discard_thread>
300088f0:	ea000027 	b	30008994 <rm_thread_dispatch+0x118>
		}else{
			thread->prio=prio;
300088f4:	e59f30c0 	ldr	r3, [pc, #192]	; 300089bc <rm_thread_dispatch+0x140>
300088f8:	e5933000 	ldr	r3, [r3]
300088fc:	e20320ff 	and	r2, r3, #255	; 0xff
30008900:	e59d300c 	ldr	r3, [sp, #12]
30008904:	e5c32005 	strb	r2, [r3, #5]
			prio++;
30008908:	e59f30ac 	ldr	r3, [pc, #172]	; 300089bc <rm_thread_dispatch+0x140>
3000890c:	e5933000 	ldr	r3, [r3]
30008910:	e2832001 	add	r2, r3, #1
30008914:	e59f30a0 	ldr	r3, [pc, #160]	; 300089bc <rm_thread_dispatch+0x140>
30008918:	e5832000 	str	r2, [r3]
			for(i=0;i<HAL_MAX_CPU;i++){
3000891c:	e3a03000 	mov	r3, #0
30008920:	e58d3008 	str	r3, [sp, #8]
30008924:	ea00000d 	b	30008960 <rm_thread_dispatch+0xe4>
				if(rm_check(thread,i)){
30008928:	e59d000c 	ldr	r0, [sp, #12]
3000892c:	e59d1008 	ldr	r1, [sp, #8]
30008930:	ebffff7b 	bl	30008724 <rm_check>
30008934:	e1a03000 	mov	r3, r0
30008938:	e3530000 	cmp	r3, #0
3000893c:	0a000004 	beq	30008954 <rm_thread_dispatch+0xd8>
					thread->cpu=i;
30008940:	e59d3008 	ldr	r3, [sp, #8]
30008944:	e20320ff 	and	r2, r3, #255	; 0xff
30008948:	e59d300c 	ldr	r3, [sp, #12]
3000894c:	e5c32006 	strb	r2, [r3, #6]
					break;
30008950:	ea000005 	b	3000896c <rm_thread_dispatch+0xf0>
				/*这个线程还没初始化，包括它的stack,lock等,原来是用acoral_release_thread导致很多错误*/
				rm_discard_thread(thread);
		}else{
			thread->prio=prio;
			prio++;
			for(i=0;i<HAL_MAX_CPU;i++){
30008954:	e59d3008 	ldr	r3, [sp, #8]
30008958:	e2833001 	add	r3, r3, #1
3000895c:	e58d3008 	str	r3, [sp, #8]
30008960:	e59d3008 	ldr	r3, [sp, #8]
30008964:	e3530000 	cmp	r3, #0
30008968:	0affffee 	beq	30008928 <rm_thread_dispatch+0xac>
				if(rm_check(thread,i)){
					thread->cpu=i;
					break;
				}
			}
			if(i==HAL_MAX_CPU){
3000896c:	e59d3008 	ldr	r3, [sp, #8]
30008970:	e3530001 	cmp	r3, #1
30008974:	1a000006 	bne	30008994 <rm_thread_dispatch+0x118>
				acoral_printerr("Discard thread %s\n",thread->name);
30008978:	e59d300c 	ldr	r3, [sp, #12]
3000897c:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008980:	e59f003c 	ldr	r0, [pc, #60]	; 300089c4 <rm_thread_dispatch+0x148>
30008984:	e1a01003 	mov	r1, r3
30008988:	eb000a1e 	bl	3000b208 <acoral_print>
				/*这个线程还没初始化，包括它的stack,lock等*/
				rm_discard_thread(thread);
3000898c:	e59d000c 	ldr	r0, [sp, #12]
30008990:	ebffff25 	bl	3000862c <rm_discard_thread>
	acoral_u32 i;
	acoral_thread_t * thread;
	acoral_list_t *tmp,*head;
	HAL_ENTER_CRITICAL();
	head=&rm_queue->head;
	for (tmp=head->next;tmp!=head;){
30008994:	e59d2010 	ldr	r2, [sp, #16]
30008998:	e59d3014 	ldr	r3, [sp, #20]
3000899c:	e1520003 	cmp	r2, r3
300089a0:	1affffc1 	bne	300088ac <rm_thread_dispatch+0x30>
				/*这个线程还没初始化，包括它的stack,lock等*/
				rm_discard_thread(thread);
			}
		} 
	}
	HAL_EXIT_CRITICAL();
300089a4:	e59d0004 	ldr	r0, [sp, #4]
300089a8:	ebffe34f 	bl	300016ec <HAL_INTR_RESTORE>
	return;
}
300089ac:	e28dd01c 	add	sp, sp, #28
300089b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300089b4:	e12fff1e 	bx	lr
300089b8:	3000ea4c 	.word	0x3000ea4c
300089bc:	3000ea48 	.word	0x3000ea48
300089c0:	3000e624 	.word	0x3000e624
300089c4:	3000e64c 	.word	0x3000e64c

300089c8 <rm_init>:

void rm_init(){
300089c8:	e24dd008 	sub	sp, sp, #8
      acoral_u32 i;
      acoral_init_list(&rm_queue->head);
300089cc:	e59f307c 	ldr	r3, [pc, #124]	; 30008a50 <rm_init+0x88>
300089d0:	e5933000 	ldr	r3, [r3]
300089d4:	e59f2074 	ldr	r2, [pc, #116]	; 30008a50 <rm_init+0x88>
300089d8:	e5922000 	ldr	r2, [r2]
300089dc:	e5832000 	str	r2, [r3]
300089e0:	e59f3068 	ldr	r3, [pc, #104]	; 30008a50 <rm_init+0x88>
300089e4:	e5933000 	ldr	r3, [r3]
300089e8:	e59f2060 	ldr	r2, [pc, #96]	; 30008a50 <rm_init+0x88>
300089ec:	e5922000 	ldr	r2, [r2]
300089f0:	e5832004 	str	r2, [r3, #4]
      for(i=0;i<HAL_MAX_CPU;i++){
300089f4:	e3a03000 	mov	r3, #0
300089f8:	e58d3004 	str	r3, [sp, #4]
300089fc:	ea00000e 	b	30008a3c <rm_init+0x74>
		left[i].sum=0;
30008a00:	e59d1004 	ldr	r1, [sp, #4]
30008a04:	e59f2048 	ldr	r2, [pc, #72]	; 30008a54 <rm_init+0x8c>
30008a08:	e3a03004 	mov	r3, #4
30008a0c:	e1a01181 	lsl	r1, r1, #3
30008a10:	e0812002 	add	r2, r1, r2
30008a14:	e0823003 	add	r3, r2, r3
30008a18:	e59f2038 	ldr	r2, [pc, #56]	; 30008a58 <rm_init+0x90>
30008a1c:	e5832000 	str	r2, [r3]
		left[i].num=0;
30008a20:	e59d2004 	ldr	r2, [sp, #4]
30008a24:	e59f3028 	ldr	r3, [pc, #40]	; 30008a54 <rm_init+0x8c>
30008a28:	e3a01000 	mov	r1, #0
30008a2c:	e7831182 	str	r1, [r3, r2, lsl #3]
}

void rm_init(){
      acoral_u32 i;
      acoral_init_list(&rm_queue->head);
      for(i=0;i<HAL_MAX_CPU;i++){
30008a30:	e59d3004 	ldr	r3, [sp, #4]
30008a34:	e2833001 	add	r3, r3, #1
30008a38:	e58d3004 	str	r3, [sp, #4]
30008a3c:	e59d3004 	ldr	r3, [sp, #4]
30008a40:	e3530000 	cmp	r3, #0
30008a44:	0affffed 	beq	30008a00 <rm_init+0x38>
		left[i].sum=0;
		left[i].num=0;
      }
}
30008a48:	e28dd008 	add	sp, sp, #8
30008a4c:	e12fff1e 	bx	lr
30008a50:	3000ea4c 	.word	0x3000ea4c
30008a54:	3000fab4 	.word	0x3000fab4
30008a58:	00000000 	.word	0x00000000

30008a5c <rm_policy_init>:

acoral_sched_policy_t rm_policy;
void rm_policy_init(){
30008a5c:	e92d4008 	push	{r3, lr}
	rm_init();
30008a60:	ebffffd8 	bl	300089c8 <rm_init>
	rm_policy.type=ACORAL_SCHED_POLICY_RM;
30008a64:	e59f3044 	ldr	r3, [pc, #68]	; 30008ab0 <rm_policy_init+0x54>
30008a68:	e3a02017 	mov	r2, #23
30008a6c:	e5c32008 	strb	r2, [r3, #8]
	rm_policy.policy_thread_init=rm_policy_thread_init;
30008a70:	e59f3038 	ldr	r3, [pc, #56]	; 30008ab0 <rm_policy_init+0x54>
30008a74:	e59f2038 	ldr	r2, [pc, #56]	; 30008ab4 <rm_policy_init+0x58>
30008a78:	e583200c 	str	r2, [r3, #12]
	rm_policy.policy_thread_release=rm_policy_thread_release;
30008a7c:	e59f302c 	ldr	r3, [pc, #44]	; 30008ab0 <rm_policy_init+0x54>
30008a80:	e59f2030 	ldr	r2, [pc, #48]	; 30008ab8 <rm_policy_init+0x5c>
30008a84:	e5832010 	str	r2, [r3, #16]
	rm_policy.delay_deal=NULL;
30008a88:	e59f3020 	ldr	r3, [pc, #32]	; 30008ab0 <rm_policy_init+0x54>
30008a8c:	e3a02000 	mov	r2, #0
30008a90:	e5832014 	str	r2, [r3, #20]
	rm_policy.name="rm";
30008a94:	e59f3014 	ldr	r3, [pc, #20]	; 30008ab0 <rm_policy_init+0x54>
30008a98:	e59f201c 	ldr	r2, [pc, #28]	; 30008abc <rm_policy_init+0x60>
30008a9c:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&rm_policy);
30008aa0:	e59f0008 	ldr	r0, [pc, #8]	; 30008ab0 <rm_policy_init+0x54>
30008aa4:	ebffe4e7 	bl	30001e48 <acoral_register_sched_policy>
}
30008aa8:	e8bd4008 	pop	{r3, lr}
30008aac:	e12fff1e 	bx	lr
30008ab0:	30010348 	.word	0x30010348
30008ab4:	300084bc 	.word	0x300084bc
30008ab8:	30008604 	.word	0x30008604
30008abc:	3000e660 	.word	0x3000e660

30008ac0 <rm_end>:

void rm_end(){
30008ac0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008ac4:	e24dd024 	sub	sp, sp, #36	; 0x24
      acoral_sr cpu_sr;
      acoral_thread_t * thread;
      rm_policy_data_t *private_data;
      acoral_list_t *tmp,*head;
      rm_thread_dispatch();
30008ac8:	ebffff6b 	bl	3000887c <rm_thread_dispatch>
      HAL_ENTER_CRITICAL();
30008acc:	ebffe308 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008ad0:	e1a03000 	mov	r3, r0
30008ad4:	e58d300c 	str	r3, [sp, #12]
      head=&rm_queue->head;
30008ad8:	e59f3090 	ldr	r3, [pc, #144]	; 30008b70 <rm_end+0xb0>
30008adc:	e5933000 	ldr	r3, [r3]
30008ae0:	e58d301c 	str	r3, [sp, #28]
      for (tmp=head->next;tmp!=head;){
30008ae4:	e59d301c 	ldr	r3, [sp, #28]
30008ae8:	e5933000 	ldr	r3, [r3]
30008aec:	e58d3018 	str	r3, [sp, #24]
30008af0:	ea000015 	b	30008b4c <rm_end+0x8c>
	  thread =list_entry(tmp, acoral_thread_t,ready);
30008af4:	e59d3018 	ldr	r3, [sp, #24]
30008af8:	e2433010 	sub	r3, r3, #16
30008afc:	e58d3010 	str	r3, [sp, #16]
	  tmp=tmp->next;
30008b00:	e59d3018 	ldr	r3, [sp, #24]
30008b04:	e5933000 	ldr	r3, [r3]
30008b08:	e58d3018 	str	r3, [sp, #24]
	  acoral_list_del(&thread->ready); /*从队列上取下线程*/
30008b0c:	e59d3010 	ldr	r3, [sp, #16]
30008b10:	e2833010 	add	r3, r3, #16
30008b14:	e1a00003 	mov	r0, r3
30008b18:	eb00053b 	bl	3000a00c <acoral_list_del>
	  private_data=thread->private_data;
30008b1c:	e59d3010 	ldr	r3, [sp, #16]
30008b20:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008b24:	e58d3014 	str	r3, [sp, #20]
	  acoral_policy_thread_init(ACORAL_SCHED_POLICY_PERIOD,thread,private_data->period_data.route,private_data->period_data.args,NULL);
30008b28:	e59d3014 	ldr	r3, [sp, #20]
30008b2c:	e5932004 	ldr	r2, [r3, #4]
30008b30:	e59d3014 	ldr	r3, [sp, #20]
30008b34:	e5933008 	ldr	r3, [r3, #8]
30008b38:	e3a01000 	mov	r1, #0
30008b3c:	e58d1000 	str	r1, [sp]
30008b40:	e3a00016 	mov	r0, #22
30008b44:	e59d1010 	ldr	r1, [sp, #16]
30008b48:	ebffe48e 	bl	30001d88 <acoral_policy_thread_init>
      rm_policy_data_t *private_data;
      acoral_list_t *tmp,*head;
      rm_thread_dispatch();
      HAL_ENTER_CRITICAL();
      head=&rm_queue->head;
      for (tmp=head->next;tmp!=head;){
30008b4c:	e59d2018 	ldr	r2, [sp, #24]
30008b50:	e59d301c 	ldr	r3, [sp, #28]
30008b54:	e1520003 	cmp	r2, r3
30008b58:	1affffe5 	bne	30008af4 <rm_end+0x34>
	  tmp=tmp->next;
	  acoral_list_del(&thread->ready); /*从队列上取下线程*/
	  private_data=thread->private_data;
	  acoral_policy_thread_init(ACORAL_SCHED_POLICY_PERIOD,thread,private_data->period_data.route,private_data->period_data.args,NULL);
     }
     HAL_EXIT_CRITICAL();
30008b5c:	e59d000c 	ldr	r0, [sp, #12]
30008b60:	ebffe2e1 	bl	300016ec <HAL_INTR_RESTORE>
}
30008b64:	e28dd024 	add	sp, sp, #36	; 0x24
30008b68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008b6c:	e12fff1e 	bx	lr
30008b70:	3000ea4c 	.word	0x3000ea4c

30008b74 <period_policy_thread_init>:
#include<policy.h>
#include<mem.h>
#include<timer.h>
#include<period_thrd.h>
acoral_queue_t period_delay_queue;
acoral_id period_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30008b74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008b78:	e24dd024 	sub	sp, sp, #36	; 0x24
30008b7c:	e58d000c 	str	r0, [sp, #12]
30008b80:	e58d1008 	str	r1, [sp, #8]
30008b84:	e58d2004 	str	r2, [sp, #4]
30008b88:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 prio;
	acoral_period_policy_data_t *policy_data;
	period_policy_data_t *private_data;
	if(thread->policy==ACORAL_SCHED_POLICY_PERIOD){
30008b8c:	e59d300c 	ldr	r3, [sp, #12]
30008b90:	e5d3300c 	ldrb	r3, [r3, #12]
30008b94:	e3530016 	cmp	r3, #22
30008b98:	1a000040 	bne	30008ca0 <period_policy_thread_init+0x12c>
		policy_data=(acoral_period_policy_data_t *)data;
30008b9c:	e59d3000 	ldr	r3, [sp]
30008ba0:	e58d3018 	str	r3, [sp, #24]
		thread->cpu=policy_data->cpu;
30008ba4:	e59d3018 	ldr	r3, [sp, #24]
30008ba8:	e5d32000 	ldrb	r2, [r3]
30008bac:	e59d300c 	ldr	r3, [sp, #12]
30008bb0:	e5c32006 	strb	r2, [r3, #6]
		prio=policy_data->prio;
30008bb4:	e59d3018 	ldr	r3, [sp, #24]
30008bb8:	e5d33001 	ldrb	r3, [r3, #1]
30008bbc:	e58d3014 	str	r3, [sp, #20]
		if(policy_data->prio_type==ACORAL_BASE_PRIO){
30008bc0:	e59d3018 	ldr	r3, [sp, #24]
30008bc4:	e5d33002 	ldrb	r3, [r3, #2]
30008bc8:	e1a03c03 	lsl	r3, r3, #24
30008bcc:	e1a03c43 	asr	r3, r3, #24
30008bd0:	e3530002 	cmp	r3, #2
30008bd4:	1a000007 	bne	30008bf8 <period_policy_thread_init+0x84>
			prio+=ACORAL_BASE_PRIO_MIN;
30008bd8:	e59d3014 	ldr	r3, [sp, #20]
30008bdc:	e2833002 	add	r3, r3, #2
30008be0:	e58d3014 	str	r3, [sp, #20]
			if(prio>=ACORAL_BASE_PRIO_MAX)
30008be4:	e59d3014 	ldr	r3, [sp, #20]
30008be8:	e3530026 	cmp	r3, #38	; 0x26
30008bec:	9a000001 	bls	30008bf8 <period_policy_thread_init+0x84>
				prio=ACORAL_BASE_PRIO_MAX-1;
30008bf0:	e3a03026 	mov	r3, #38	; 0x26
30008bf4:	e58d3014 	str	r3, [sp, #20]
		}
		thread->prio=prio;
30008bf8:	e59d3014 	ldr	r3, [sp, #20]
30008bfc:	e20320ff 	and	r2, r3, #255	; 0xff
30008c00:	e59d300c 	ldr	r3, [sp, #12]
30008c04:	e5c32005 	strb	r2, [r3, #5]
		private_data=(period_policy_data_t *)acoral_malloc2(sizeof(period_policy_data_t));
30008c08:	e3a0000c 	mov	r0, #12
30008c0c:	ebfff7f4 	bl	30006be4 <v_malloc>
30008c10:	e1a03000 	mov	r3, r0
30008c14:	e58d301c 	str	r3, [sp, #28]
		if(private_data==NULL){
30008c18:	e59d301c 	ldr	r3, [sp, #28]
30008c1c:	e3530000 	cmp	r3, #0
30008c20:	1a00000e 	bne	30008c60 <period_policy_thread_init+0xec>
			acoral_printerr("No level2 mem space for private_data:%s\n",thread->name);
30008c24:	e59d300c 	ldr	r3, [sp, #12]
30008c28:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008c2c:	e59f0118 	ldr	r0, [pc, #280]	; 30008d4c <period_policy_thread_init+0x1d8>
30008c30:	e1a01003 	mov	r1, r3
30008c34:	eb000973 	bl	3000b208 <acoral_print>
			HAL_ENTER_CRITICAL();
30008c38:	ebffe2ad 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008c3c:	e1a03000 	mov	r3, r0
30008c40:	e58d3010 	str	r3, [sp, #16]
			acoral_release_res((acoral_res_t *)thread);
30008c44:	e59d300c 	ldr	r3, [sp, #12]
30008c48:	e1a00003 	mov	r0, r3
30008c4c:	ebffea6d 	bl	30003608 <acoral_release_res>
			HAL_EXIT_CRITICAL();
30008c50:	e59d0010 	ldr	r0, [sp, #16]
30008c54:	ebffe2a4 	bl	300016ec <HAL_INTR_RESTORE>
			return -1;
30008c58:	e3e03000 	mvn	r3, #0
30008c5c:	ea000036 	b	30008d3c <period_policy_thread_init+0x1c8>
		}
		private_data->time=policy_data->time;
30008c60:	e59d3018 	ldr	r3, [sp, #24]
30008c64:	e5932004 	ldr	r2, [r3, #4]
30008c68:	e59d301c 	ldr	r3, [sp, #28]
30008c6c:	e5832000 	str	r2, [r3]
		private_data->route=route;
30008c70:	e59d301c 	ldr	r3, [sp, #28]
30008c74:	e59d2008 	ldr	r2, [sp, #8]
30008c78:	e5832004 	str	r2, [r3, #4]
		private_data->args=args;
30008c7c:	e59d301c 	ldr	r3, [sp, #28]
30008c80:	e59d2004 	ldr	r2, [sp, #4]
30008c84:	e5832008 	str	r2, [r3, #8]
		thread->private_data=private_data;
30008c88:	e59d300c 	ldr	r3, [sp, #12]
30008c8c:	e59d201c 	ldr	r2, [sp, #28]
30008c90:	e5832050 	str	r2, [r3, #80]	; 0x50
		thread->cpu_mask=-1;
30008c94:	e59d300c 	ldr	r3, [sp, #12]
30008c98:	e3e02000 	mvn	r2, #0
30008c9c:	e5832008 	str	r2, [r3, #8]
	}
	if(acoral_thread_init(thread,route,period_thread_exit,args)!=0){
30008ca0:	e59f30a8 	ldr	r3, [pc, #168]	; 30008d50 <period_policy_thread_init+0x1dc>
30008ca4:	e59d000c 	ldr	r0, [sp, #12]
30008ca8:	e59d1008 	ldr	r1, [sp, #8]
30008cac:	e1a02003 	mov	r2, r3
30008cb0:	e59d3004 	ldr	r3, [sp, #4]
30008cb4:	ebffe7e9 	bl	30002c60 <acoral_thread_init>
30008cb8:	e1a03000 	mov	r3, r0
30008cbc:	e3530000 	cmp	r3, #0
30008cc0:	0a00000e 	beq	30008d00 <period_policy_thread_init+0x18c>
		acoral_printerr("No thread stack:%s\n",thread->name);
30008cc4:	e59d300c 	ldr	r3, [sp, #12]
30008cc8:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30008ccc:	e59f0080 	ldr	r0, [pc, #128]	; 30008d54 <period_policy_thread_init+0x1e0>
30008cd0:	e1a01003 	mov	r1, r3
30008cd4:	eb00094b 	bl	3000b208 <acoral_print>
		HAL_ENTER_CRITICAL();
30008cd8:	ebffe285 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008cdc:	e1a03000 	mov	r3, r0
30008ce0:	e58d3010 	str	r3, [sp, #16]
		acoral_release_res((acoral_res_t *)thread);
30008ce4:	e59d300c 	ldr	r3, [sp, #12]
30008ce8:	e1a00003 	mov	r0, r3
30008cec:	ebffea45 	bl	30003608 <acoral_release_res>
		HAL_EXIT_CRITICAL();
30008cf0:	e59d0010 	ldr	r0, [sp, #16]
30008cf4:	ebffe27c 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
30008cf8:	e3e03000 	mvn	r3, #0
30008cfc:	ea00000e 	b	30008d3c <period_policy_thread_init+0x1c8>
	}
        /*将线程就绪，并重新调度*/
	acoral_resume_thread(thread);
30008d00:	e59d000c 	ldr	r0, [sp, #12]
30008d04:	ebffe6cc 	bl	3000283c <acoral_resume_thread>
	HAL_ENTER_CRITICAL();
30008d08:	ebffe279 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30008d0c:	e1a03000 	mov	r3, r0
30008d10:	e58d3010 	str	r3, [sp, #16]
	period_thread_delay(thread,((period_policy_data_t *)thread->private_data)->time);
30008d14:	e59d300c 	ldr	r3, [sp, #12]
30008d18:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008d1c:	e5933000 	ldr	r3, [r3]
30008d20:	e59d000c 	ldr	r0, [sp, #12]
30008d24:	e1a01003 	mov	r1, r3
30008d28:	eb000057 	bl	30008e8c <period_thread_delay>
	HAL_EXIT_CRITICAL();
30008d2c:	e59d0010 	ldr	r0, [sp, #16]
30008d30:	ebffe26d 	bl	300016ec <HAL_INTR_RESTORE>
	return thread->res.id;
30008d34:	e59d300c 	ldr	r3, [sp, #12]
30008d38:	e5933000 	ldr	r3, [r3]
}
30008d3c:	e1a00003 	mov	r0, r3
30008d40:	e28dd024 	add	sp, sp, #36	; 0x24
30008d44:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008d48:	e12fff1e 	bx	lr
30008d4c:	3000e664 	.word	0x3000e664
30008d50:	3000906c 	.word	0x3000906c
30008d54:	3000e690 	.word	0x3000e690

30008d58 <period_policy_thread_release>:

void period_policy_thread_release(acoral_thread_t *thread){
30008d58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008d5c:	e24dd00c 	sub	sp, sp, #12
30008d60:	e58d0004 	str	r0, [sp, #4]
	acoral_free2(thread->private_data);	
30008d64:	e59d3004 	ldr	r3, [sp, #4]
30008d68:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008d6c:	e1a00003 	mov	r0, r3
30008d70:	ebfff7b0 	bl	30006c38 <v_free>
}
30008d74:	e28dd00c 	add	sp, sp, #12
30008d78:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008d7c:	e12fff1e 	bx	lr

30008d80 <acoral_periodqueue_add>:

void acoral_periodqueue_add(acoral_thread_t *new){
30008d80:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008d84:	e24dd024 	sub	sp, sp, #36	; 0x24
30008d88:	e58d0004 	str	r0, [sp, #4]
	acoral_list_t   *tmp,*head;
	acoral_thread_t *thread;
	acoral_32  delay2;
	acoral_32  delay= new->delay;
30008d8c:	e59d3004 	ldr	r3, [sp, #4]
30008d90:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30008d94:	e58d301c 	str	r3, [sp, #28]
	head=&period_delay_queue.head;
30008d98:	e59f30e8 	ldr	r3, [pc, #232]	; 30008e88 <acoral_periodqueue_add+0x108>
30008d9c:	e58d3010 	str	r3, [sp, #16]
	acoral_spin_lock(&head->lock);
	new->state|=ACORAL_THREAD_STATE_DELAY;
30008da0:	e59d3004 	ldr	r3, [sp, #4]
30008da4:	e5d33004 	ldrb	r3, [r3, #4]
30008da8:	e3833020 	orr	r3, r3, #32
30008dac:	e20320ff 	and	r2, r3, #255	; 0xff
30008db0:	e59d3004 	ldr	r3, [sp, #4]
30008db4:	e5c32004 	strb	r2, [r3, #4]
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30008db8:	e59d3010 	ldr	r3, [sp, #16]
30008dbc:	e5933000 	ldr	r3, [r3]
30008dc0:	e58d300c 	str	r3, [sp, #12]
30008dc4:	ea00000d 	b	30008e00 <acoral_periodqueue_add+0x80>
		thread = list_entry (tmp, acoral_thread_t, waiting);
30008dc8:	e59d300c 	ldr	r3, [sp, #12]
30008dcc:	e2433020 	sub	r3, r3, #32
30008dd0:	e58d3014 	str	r3, [sp, #20]
		delay  = delay-thread->delay;
30008dd4:	e59d3014 	ldr	r3, [sp, #20]
30008dd8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30008ddc:	e59d201c 	ldr	r2, [sp, #28]
30008de0:	e0633002 	rsb	r3, r3, r2
30008de4:	e58d301c 	str	r3, [sp, #28]
		if (delay < 0)
30008de8:	e59d301c 	ldr	r3, [sp, #28]
30008dec:	e3530000 	cmp	r3, #0
30008df0:	ba000009 	blt	30008e1c <acoral_periodqueue_add+0x9c>
	acoral_32  delay2;
	acoral_32  delay= new->delay;
	head=&period_delay_queue.head;
	acoral_spin_lock(&head->lock);
	new->state|=ACORAL_THREAD_STATE_DELAY;
	for (tmp=head->next;delay2=delay,tmp!=head; tmp=tmp->next){
30008df4:	e59d300c 	ldr	r3, [sp, #12]
30008df8:	e5933000 	ldr	r3, [r3]
30008dfc:	e58d300c 	str	r3, [sp, #12]
30008e00:	e59d301c 	ldr	r3, [sp, #28]
30008e04:	e58d3018 	str	r3, [sp, #24]
30008e08:	e59d200c 	ldr	r2, [sp, #12]
30008e0c:	e59d3010 	ldr	r3, [sp, #16]
30008e10:	e1520003 	cmp	r2, r3
30008e14:	1affffeb 	bne	30008dc8 <acoral_periodqueue_add+0x48>
30008e18:	ea000000 	b	30008e20 <acoral_periodqueue_add+0xa0>
		thread = list_entry (tmp, acoral_thread_t, waiting);
		delay  = delay-thread->delay;
		if (delay < 0)
			break;
30008e1c:	e1a00000 	nop			; (mov r0, r0)
	}
	new->delay = delay2;
30008e20:	e59d3004 	ldr	r3, [sp, #4]
30008e24:	e59d2018 	ldr	r2, [sp, #24]
30008e28:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_list_add(&new->waiting,tmp->prev);
30008e2c:	e59d3004 	ldr	r3, [sp, #4]
30008e30:	e2832020 	add	r2, r3, #32
30008e34:	e59d300c 	ldr	r3, [sp, #12]
30008e38:	e5933004 	ldr	r3, [r3, #4]
30008e3c:	e1a00002 	mov	r0, r2
30008e40:	e1a01003 	mov	r1, r3
30008e44:	eb00044a 	bl	30009f74 <acoral_list_add>
	/* 插入等待任务后，后继等待任务时间处理*/
	if(tmp != head){
30008e48:	e59d200c 	ldr	r2, [sp, #12]
30008e4c:	e59d3010 	ldr	r3, [sp, #16]
30008e50:	e1520003 	cmp	r2, r3
30008e54:	0a000008 	beq	30008e7c <acoral_periodqueue_add+0xfc>
		thread = list_entry(tmp, acoral_thread_t, waiting);
30008e58:	e59d300c 	ldr	r3, [sp, #12]
30008e5c:	e2433020 	sub	r3, r3, #32
30008e60:	e58d3014 	str	r3, [sp, #20]
		thread->delay-=delay2;
30008e64:	e59d3014 	ldr	r3, [sp, #20]
30008e68:	e5932040 	ldr	r2, [r3, #64]	; 0x40
30008e6c:	e59d3018 	ldr	r3, [sp, #24]
30008e70:	e0632002 	rsb	r2, r3, r2
30008e74:	e59d3014 	ldr	r3, [sp, #20]
30008e78:	e5832040 	str	r2, [r3, #64]	; 0x40
	}
	acoral_spin_unlock(&head->lock);
}
30008e7c:	e28dd024 	add	sp, sp, #36	; 0x24
30008e80:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008e84:	e12fff1e 	bx	lr
30008e88:	3000fac0 	.word	0x3000fac0

30008e8c <period_thread_delay>:

void period_thread_delay(acoral_thread_t* thread,acoral_time time){
30008e8c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008e90:	e24dd00c 	sub	sp, sp, #12
30008e94:	e58d0004 	str	r0, [sp, #4]
30008e98:	e58d1000 	str	r1, [sp]
	thread->delay=TIME_TO_TICKS(time);
30008e9c:	e59d2000 	ldr	r2, [sp]
30008ea0:	e1a03002 	mov	r3, r2
30008ea4:	e1a03103 	lsl	r3, r3, #2
30008ea8:	e0833002 	add	r3, r3, r2
30008eac:	e1a02103 	lsl	r2, r3, #2
30008eb0:	e0833002 	add	r3, r3, r2
30008eb4:	e1a03103 	lsl	r3, r3, #2
30008eb8:	e1a02003 	mov	r2, r3
30008ebc:	e59f3024 	ldr	r3, [pc, #36]	; 30008ee8 <period_thread_delay+0x5c>
30008ec0:	e0831392 	umull	r1, r3, r2, r3
30008ec4:	e1a03323 	lsr	r3, r3, #6
30008ec8:	e1a02003 	mov	r2, r3
30008ecc:	e59d3004 	ldr	r3, [sp, #4]
30008ed0:	e5832040 	str	r2, [r3, #64]	; 0x40
	acoral_periodqueue_add(thread);
30008ed4:	e59d0004 	ldr	r0, [sp, #4]
30008ed8:	ebffffa8 	bl	30008d80 <acoral_periodqueue_add>
}
30008edc:	e28dd00c 	add	sp, sp, #12
30008ee0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30008ee4:	e12fff1e 	bx	lr
30008ee8:	10624dd3 	.word	0x10624dd3

30008eec <period_delay_deal>:

void period_delay_deal(){
30008eec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30008ef0:	e24dd01c 	sub	sp, sp, #28
	acoral_list_t *tmp,*tmp1,*head;
	acoral_thread_t * thread;
	period_policy_data_t * private_data;
	head=&period_delay_queue.head;
30008ef4:	e59f3160 	ldr	r3, [pc, #352]	; 3000905c <period_delay_deal+0x170>
30008ef8:	e58d300c 	str	r3, [sp, #12]
	if(acoral_list_empty(head))
30008efc:	e59d300c 	ldr	r3, [sp, #12]
30008f00:	e5932000 	ldr	r2, [r3]
30008f04:	e59d300c 	ldr	r3, [sp, #12]
30008f08:	e1520003 	cmp	r2, r3
30008f0c:	0a00004c 	beq	30009044 <period_delay_deal+0x158>
	    	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
30008f10:	e59d300c 	ldr	r3, [sp, #12]
30008f14:	e5933000 	ldr	r3, [r3]
30008f18:	e2433020 	sub	r3, r3, #32
30008f1c:	e58d3010 	str	r3, [sp, #16]
	ACORAL_ASSERT(thread,"in period thread deal");
30008f20:	e59d2010 	ldr	r2, [sp, #16]
30008f24:	e59f3134 	ldr	r3, [pc, #308]	; 30009060 <period_delay_deal+0x174>
30008f28:	e1a00002 	mov	r0, r2
30008f2c:	e1a01003 	mov	r1, r3
30008f30:	ebffeb3b 	bl	30003c24 <acoral_assert_res>
	thread->delay--;
30008f34:	e59d3010 	ldr	r3, [sp, #16]
30008f38:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30008f3c:	e2432001 	sub	r2, r3, #1
30008f40:	e59d3010 	ldr	r3, [sp, #16]
30008f44:	e5832040 	str	r2, [r3, #64]	; 0x40
	for(tmp=head->next;tmp!=head;){
30008f48:	e59d300c 	ldr	r3, [sp, #12]
30008f4c:	e5933000 	ldr	r3, [r3]
30008f50:	e58d3004 	str	r3, [sp, #4]
30008f54:	ea000035 	b	30009030 <period_delay_deal+0x144>
		thread=list_entry(tmp,acoral_thread_t,waiting);
30008f58:	e59d3004 	ldr	r3, [sp, #4]
30008f5c:	e2433020 	sub	r3, r3, #32
30008f60:	e58d3010 	str	r3, [sp, #16]
		ACORAL_ASSERT(thread,"in period thread deal ");
30008f64:	e59d2010 	ldr	r2, [sp, #16]
30008f68:	e59f30f4 	ldr	r3, [pc, #244]	; 30009064 <period_delay_deal+0x178>
30008f6c:	e1a00002 	mov	r0, r2
30008f70:	e1a01003 	mov	r1, r3
30008f74:	ebffeb2a 	bl	30003c24 <acoral_assert_res>
		if(thread->delay>0)
30008f78:	e59d3010 	ldr	r3, [sp, #16]
30008f7c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
30008f80:	e3530000 	cmp	r3, #0
30008f84:	ca000030 	bgt	3000904c <period_delay_deal+0x160>
		    break;
		private_data=thread->private_data;
30008f88:	e59d3010 	ldr	r3, [sp, #16]
30008f8c:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30008f90:	e58d3014 	str	r3, [sp, #20]
		/*防止add判断delay时取下thread*/
		acoral_spin_lock(&head->lock);
		tmp1=tmp->next;
30008f94:	e59d3004 	ldr	r3, [sp, #4]
30008f98:	e5933000 	ldr	r3, [r3]
30008f9c:	e58d3008 	str	r3, [sp, #8]
		acoral_list_del(&thread->waiting);
30008fa0:	e59d3010 	ldr	r3, [sp, #16]
30008fa4:	e2833020 	add	r3, r3, #32
30008fa8:	e1a00003 	mov	r0, r3
30008fac:	eb000416 	bl	3000a00c <acoral_list_del>
		tmp=tmp1;
30008fb0:	e59d3008 	ldr	r3, [sp, #8]
30008fb4:	e58d3004 	str	r3, [sp, #4]
		acoral_spin_unlock(&head->lock);
		if(thread->state&ACORAL_THREAD_STATE_SUSPEND){
30008fb8:	e59d3010 	ldr	r3, [sp, #16]
30008fbc:	e5d33004 	ldrb	r3, [r3, #4]
30008fc0:	e2033002 	and	r3, r3, #2
30008fc4:	e3530000 	cmp	r3, #0
30008fc8:	0a000013 	beq	3000901c <period_delay_deal+0x130>
			thread->stack=(acoral_u32 *)((acoral_8 *)thread->stack_buttom+thread->stack_size-4);
30008fcc:	e59d3010 	ldr	r3, [sp, #16]
30008fd0:	e5932038 	ldr	r2, [r3, #56]	; 0x38
30008fd4:	e59d3010 	ldr	r3, [sp, #16]
30008fd8:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
30008fdc:	e2433004 	sub	r3, r3, #4
30008fe0:	e0822003 	add	r2, r2, r3
30008fe4:	e59d3010 	ldr	r3, [sp, #16]
30008fe8:	e5832034 	str	r2, [r3, #52]	; 0x34
			HAL_STACK_INIT(&thread->stack,private_data->route,period_thread_exit,private_data->args);
30008fec:	e59d3010 	ldr	r3, [sp, #16]
30008ff0:	e2831034 	add	r1, r3, #52	; 0x34
30008ff4:	e59d3014 	ldr	r3, [sp, #20]
30008ff8:	e5932004 	ldr	r2, [r3, #4]
30008ffc:	e59d3014 	ldr	r3, [sp, #20]
30009000:	e5933008 	ldr	r3, [r3, #8]
30009004:	e1a00001 	mov	r0, r1
30009008:	e1a01002 	mov	r1, r2
3000900c:	e59f2054 	ldr	r2, [pc, #84]	; 30009068 <period_delay_deal+0x17c>
30009010:	ebffdcaa 	bl	300002c0 <hal_stack_init>
			acoral_rdy_thread(thread);
30009014:	e59d0010 	ldr	r0, [sp, #16]
30009018:	ebffe6ce 	bl	30002b58 <acoral_rdy_thread>
		}
		period_thread_delay(thread,private_data->time);
3000901c:	e59d3014 	ldr	r3, [sp, #20]
30009020:	e5933000 	ldr	r3, [r3]
30009024:	e59d0010 	ldr	r0, [sp, #16]
30009028:	e1a01003 	mov	r1, r3
3000902c:	ebffff96 	bl	30008e8c <period_thread_delay>
	if(acoral_list_empty(head))
	    	return;
	thread=list_entry(head->next,acoral_thread_t,waiting);
	ACORAL_ASSERT(thread,"in period thread deal");
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
30009030:	e59d2004 	ldr	r2, [sp, #4]
30009034:	e59d300c 	ldr	r3, [sp, #12]
30009038:	e1520003 	cmp	r2, r3
3000903c:	1affffc5 	bne	30008f58 <period_delay_deal+0x6c>
30009040:	ea000002 	b	30009050 <period_delay_deal+0x164>
	acoral_list_t *tmp,*tmp1,*head;
	acoral_thread_t * thread;
	period_policy_data_t * private_data;
	head=&period_delay_queue.head;
	if(acoral_list_empty(head))
	    	return;
30009044:	e1a00000 	nop			; (mov r0, r0)
30009048:	ea000000 	b	30009050 <period_delay_deal+0x164>
	thread->delay--;
	for(tmp=head->next;tmp!=head;){
		thread=list_entry(tmp,acoral_thread_t,waiting);
		ACORAL_ASSERT(thread,"in period thread deal ");
		if(thread->delay>0)
		    break;
3000904c:	e1a00000 	nop			; (mov r0, r0)
			HAL_STACK_INIT(&thread->stack,private_data->route,period_thread_exit,private_data->args);
			acoral_rdy_thread(thread);
		}
		period_thread_delay(thread,private_data->time);
	}
}
30009050:	e28dd01c 	add	sp, sp, #28
30009054:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009058:	e12fff1e 	bx	lr
3000905c:	3000fac0 	.word	0x3000fac0
30009060:	3000e6a4 	.word	0x3000e6a4
30009064:	3000e6bc 	.word	0x3000e6bc
30009068:	3000906c 	.word	0x3000906c

3000906c <period_thread_exit>:

void period_thread_exit(){
3000906c:	e92d4008 	push	{r3, lr}
	acoral_suspend_self();
30009070:	ebffe5cf 	bl	300027b4 <acoral_suspend_self>
}
30009074:	e8bd4008 	pop	{r3, lr}
30009078:	e12fff1e 	bx	lr

3000907c <period_policy_init>:

acoral_sched_policy_t period_policy;
void period_policy_init(){
3000907c:	e92d4008 	push	{r3, lr}
	acoral_list_init(&period_delay_queue.head);
30009080:	e59f305c 	ldr	r3, [pc, #92]	; 300090e4 <period_policy_init+0x68>
30009084:	e59f2058 	ldr	r2, [pc, #88]	; 300090e4 <period_policy_init+0x68>
30009088:	e5832000 	str	r2, [r3]
3000908c:	e59f3050 	ldr	r3, [pc, #80]	; 300090e4 <period_policy_init+0x68>
30009090:	e59f204c 	ldr	r2, [pc, #76]	; 300090e4 <period_policy_init+0x68>
30009094:	e5832004 	str	r2, [r3, #4]
	acoral_spin_init(&period_delay_queue.head.lock);
	period_policy.type=ACORAL_SCHED_POLICY_PERIOD;
30009098:	e59f3048 	ldr	r3, [pc, #72]	; 300090e8 <period_policy_init+0x6c>
3000909c:	e3a02016 	mov	r2, #22
300090a0:	e5c32008 	strb	r2, [r3, #8]
	period_policy.policy_thread_init=period_policy_thread_init;
300090a4:	e59f303c 	ldr	r3, [pc, #60]	; 300090e8 <period_policy_init+0x6c>
300090a8:	e59f203c 	ldr	r2, [pc, #60]	; 300090ec <period_policy_init+0x70>
300090ac:	e583200c 	str	r2, [r3, #12]
	period_policy.policy_thread_release=period_policy_thread_release;
300090b0:	e59f3030 	ldr	r3, [pc, #48]	; 300090e8 <period_policy_init+0x6c>
300090b4:	e59f2034 	ldr	r2, [pc, #52]	; 300090f0 <period_policy_init+0x74>
300090b8:	e5832010 	str	r2, [r3, #16]
	period_policy.delay_deal=period_delay_deal;
300090bc:	e59f3024 	ldr	r3, [pc, #36]	; 300090e8 <period_policy_init+0x6c>
300090c0:	e59f202c 	ldr	r2, [pc, #44]	; 300090f4 <period_policy_init+0x78>
300090c4:	e5832014 	str	r2, [r3, #20]
	period_policy.name="period";
300090c8:	e59f3018 	ldr	r3, [pc, #24]	; 300090e8 <period_policy_init+0x6c>
300090cc:	e59f2024 	ldr	r2, [pc, #36]	; 300090f8 <period_policy_init+0x7c>
300090d0:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&period_policy);
300090d4:	e59f000c 	ldr	r0, [pc, #12]	; 300090e8 <period_policy_init+0x6c>
300090d8:	ebffe35a 	bl	30001e48 <acoral_register_sched_policy>
}
300090dc:	e8bd4008 	pop	{r3, lr}
300090e0:	e12fff1e 	bx	lr
300090e4:	3000fac0 	.word	0x3000fac0
300090e8:	30010400 	.word	0x30010400
300090ec:	30008b74 	.word	0x30008b74
300090f0:	30008d58 	.word	0x30008d58
300090f4:	30008eec 	.word	0x30008eec
300090f8:	3000e6d4 	.word	0x3000e6d4

300090fc <slice_policy_thread_init>:
#include<policy.h>
#include<timer.h>
#include<mem.h>
#include<slice_thrd.h>
acoral_sched_policy_t slice_policy;
acoral_id slice_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
300090fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009100:	e24dd024 	sub	sp, sp, #36	; 0x24
30009104:	e58d000c 	str	r0, [sp, #12]
30009108:	e58d1008 	str	r1, [sp, #8]
3000910c:	e58d2004 	str	r2, [sp, #4]
30009110:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_u32 prio;
	acoral_slice_policy_data_t *policy_data;
	slice_policy_data_t *private_data;
	if(thread->policy==ACORAL_SCHED_POLICY_SLICE){
30009114:	e59d300c 	ldr	r3, [sp, #12]
30009118:	e5d3300c 	ldrb	r3, [r3, #12]
3000911c:	e3530018 	cmp	r3, #24
30009120:	1a000046 	bne	30009240 <slice_policy_thread_init+0x144>
		policy_data=(acoral_slice_policy_data_t *)data;
30009124:	e59d3000 	ldr	r3, [sp]
30009128:	e58d3018 	str	r3, [sp, #24]
		thread->cpu=policy_data->cpu;
3000912c:	e59d3018 	ldr	r3, [sp, #24]
30009130:	e5d32000 	ldrb	r2, [r3]
30009134:	e59d300c 	ldr	r3, [sp, #12]
30009138:	e5c32006 	strb	r2, [r3, #6]
		prio=policy_data->prio;
3000913c:	e59d3018 	ldr	r3, [sp, #24]
30009140:	e5d33001 	ldrb	r3, [r3, #1]
30009144:	e58d3014 	str	r3, [sp, #20]
		if(policy_data->prio_type==ACORAL_BASE_PRIO){
30009148:	e59d3018 	ldr	r3, [sp, #24]
3000914c:	e5d33002 	ldrb	r3, [r3, #2]
30009150:	e3530002 	cmp	r3, #2
30009154:	1a000007 	bne	30009178 <slice_policy_thread_init+0x7c>
			prio+=ACORAL_BASE_PRIO_MIN;
30009158:	e59d3014 	ldr	r3, [sp, #20]
3000915c:	e2833002 	add	r3, r3, #2
30009160:	e58d3014 	str	r3, [sp, #20]
			if(prio>=ACORAL_BASE_PRIO_MAX)
30009164:	e59d3014 	ldr	r3, [sp, #20]
30009168:	e3530026 	cmp	r3, #38	; 0x26
3000916c:	9a000001 	bls	30009178 <slice_policy_thread_init+0x7c>
				prio=ACORAL_BASE_PRIO_MAX-1;
30009170:	e3a03026 	mov	r3, #38	; 0x26
30009174:	e58d3014 	str	r3, [sp, #20]
		}
		thread->prio=prio;
30009178:	e59d3014 	ldr	r3, [sp, #20]
3000917c:	e20320ff 	and	r2, r3, #255	; 0xff
30009180:	e59d300c 	ldr	r3, [sp, #12]
30009184:	e5c32005 	strb	r2, [r3, #5]
		private_data=(slice_policy_data_t *)acoral_malloc2(sizeof(slice_policy_data_t));
30009188:	e3a00004 	mov	r0, #4
3000918c:	ebfff694 	bl	30006be4 <v_malloc>
30009190:	e1a03000 	mov	r3, r0
30009194:	e58d301c 	str	r3, [sp, #28]
		if(private_data==NULL){
30009198:	e59d301c 	ldr	r3, [sp, #28]
3000919c:	e3530000 	cmp	r3, #0
300091a0:	1a00000e 	bne	300091e0 <slice_policy_thread_init+0xe4>
			acoral_printerr("No level2 mem space for private_data:%s\n",thread->name);
300091a4:	e59d300c 	ldr	r3, [sp, #12]
300091a8:	e5933048 	ldr	r3, [r3, #72]	; 0x48
300091ac:	e59f0108 	ldr	r0, [pc, #264]	; 300092bc <slice_policy_thread_init+0x1c0>
300091b0:	e1a01003 	mov	r1, r3
300091b4:	eb000813 	bl	3000b208 <acoral_print>
			HAL_ENTER_CRITICAL();
300091b8:	ebffe14d 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300091bc:	e1a03000 	mov	r3, r0
300091c0:	e58d3010 	str	r3, [sp, #16]
			acoral_release_res((acoral_res_t *)thread);
300091c4:	e59d300c 	ldr	r3, [sp, #12]
300091c8:	e1a00003 	mov	r0, r3
300091cc:	ebffe90d 	bl	30003608 <acoral_release_res>
			HAL_EXIT_CRITICAL();
300091d0:	e59d0010 	ldr	r0, [sp, #16]
300091d4:	ebffe144 	bl	300016ec <HAL_INTR_RESTORE>
			return -1;
300091d8:	e3e03000 	mvn	r3, #0
300091dc:	ea000032 	b	300092ac <slice_policy_thread_init+0x1b0>
		}
		private_data->slice_ld=TIME_TO_TICKS(policy_data->slice);
300091e0:	e59d3018 	ldr	r3, [sp, #24]
300091e4:	e5932004 	ldr	r2, [r3, #4]
300091e8:	e1a03002 	mov	r3, r2
300091ec:	e1a03103 	lsl	r3, r3, #2
300091f0:	e0833002 	add	r3, r3, r2
300091f4:	e1a02103 	lsl	r2, r3, #2
300091f8:	e0833002 	add	r3, r3, r2
300091fc:	e1a03103 	lsl	r3, r3, #2
30009200:	e1a02003 	mov	r2, r3
30009204:	e59f30b4 	ldr	r3, [pc, #180]	; 300092c0 <slice_policy_thread_init+0x1c4>
30009208:	e0831392 	umull	r1, r3, r2, r3
3000920c:	e1a02323 	lsr	r2, r3, #6
30009210:	e59d301c 	ldr	r3, [sp, #28]
30009214:	e5832000 	str	r2, [r3]
		thread->slice=private_data->slice_ld;
30009218:	e59d301c 	ldr	r3, [sp, #28]
3000921c:	e5932000 	ldr	r2, [r3]
30009220:	e59d300c 	ldr	r3, [sp, #12]
30009224:	e5832044 	str	r2, [r3, #68]	; 0x44
		thread->private_data=private_data;
30009228:	e59d300c 	ldr	r3, [sp, #12]
3000922c:	e59d201c 	ldr	r2, [sp, #28]
30009230:	e5832050 	str	r2, [r3, #80]	; 0x50
		thread->cpu_mask=-1;
30009234:	e59d300c 	ldr	r3, [sp, #12]
30009238:	e3e02000 	mvn	r2, #0
3000923c:	e5832008 	str	r2, [r3, #8]
	}
	if(acoral_thread_init(thread,route,acoral_thread_exit,args)!=0){
30009240:	e59d000c 	ldr	r0, [sp, #12]
30009244:	e59d1008 	ldr	r1, [sp, #8]
30009248:	e59f2074 	ldr	r2, [pc, #116]	; 300092c4 <slice_policy_thread_init+0x1c8>
3000924c:	e59d3004 	ldr	r3, [sp, #4]
30009250:	ebffe682 	bl	30002c60 <acoral_thread_init>
30009254:	e1a03000 	mov	r3, r0
30009258:	e3530000 	cmp	r3, #0
3000925c:	0a00000e 	beq	3000929c <slice_policy_thread_init+0x1a0>
		acoral_printerr("No thread stack:%s\n",thread->name);
30009260:	e59d300c 	ldr	r3, [sp, #12]
30009264:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30009268:	e59f0058 	ldr	r0, [pc, #88]	; 300092c8 <slice_policy_thread_init+0x1cc>
3000926c:	e1a01003 	mov	r1, r3
30009270:	eb0007e4 	bl	3000b208 <acoral_print>
		HAL_ENTER_CRITICAL();
30009274:	ebffe11e 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30009278:	e1a03000 	mov	r3, r0
3000927c:	e58d3010 	str	r3, [sp, #16]
		acoral_release_res((acoral_res_t *)thread);
30009280:	e59d300c 	ldr	r3, [sp, #12]
30009284:	e1a00003 	mov	r0, r3
30009288:	ebffe8de 	bl	30003608 <acoral_release_res>
		HAL_EXIT_CRITICAL();
3000928c:	e59d0010 	ldr	r0, [sp, #16]
30009290:	ebffe115 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
30009294:	e3e03000 	mvn	r3, #0
30009298:	ea000003 	b	300092ac <slice_policy_thread_init+0x1b0>
	}
        /*将线程就绪，并重新调度*/
	acoral_resume_thread(thread);
3000929c:	e59d000c 	ldr	r0, [sp, #12]
300092a0:	ebffe565 	bl	3000283c <acoral_resume_thread>
	return thread->res.id;
300092a4:	e59d300c 	ldr	r3, [sp, #12]
300092a8:	e5933000 	ldr	r3, [r3]
}
300092ac:	e1a00003 	mov	r0, r3
300092b0:	e28dd024 	add	sp, sp, #36	; 0x24
300092b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300092b8:	e12fff1e 	bx	lr
300092bc:	3000e6dc 	.word	0x3000e6dc
300092c0:	10624dd3 	.word	0x10624dd3
300092c4:	30002a50 	.word	0x30002a50
300092c8:	3000e708 	.word	0x3000e708

300092cc <slice_policy_thread_release>:

void slice_policy_thread_release(acoral_thread_t *thread){
300092cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300092d0:	e24dd00c 	sub	sp, sp, #12
300092d4:	e58d0004 	str	r0, [sp, #4]
	acoral_free2(thread->private_data);	
300092d8:	e59d3004 	ldr	r3, [sp, #4]
300092dc:	e5933050 	ldr	r3, [r3, #80]	; 0x50
300092e0:	e1a00003 	mov	r0, r3
300092e4:	ebfff653 	bl	30006c38 <v_free>
}
300092e8:	e28dd00c 	add	sp, sp, #12
300092ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300092f0:	e12fff1e 	bx	lr

300092f4 <slice_delay_deal>:

void slice_delay_deal(){
300092f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300092f8:	e24dd00c 	sub	sp, sp, #12
#ifndef CFG_TICKS_PRIVATE
	acoral_u32 i;
	for(i=0;i<HAL_MAX_CPU;i++){
		cur=acoral_get_running_thread(i);
#else
		cur=acoral_cur_thread;
300092fc:	e59f3068 	ldr	r3, [pc, #104]	; 3000936c <slice_delay_deal+0x78>
30009300:	e5933000 	ldr	r3, [r3]
30009304:	e58d3000 	str	r3, [sp]
#endif
		if(cur->policy==ACORAL_SCHED_POLICY_SLICE){
30009308:	e59d3000 	ldr	r3, [sp]
3000930c:	e5d3300c 	ldrb	r3, [r3, #12]
30009310:	e3530018 	cmp	r3, #24
30009314:	1a000011 	bne	30009360 <slice_delay_deal+0x6c>
			cur->slice--;
30009318:	e59d3000 	ldr	r3, [sp]
3000931c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
30009320:	e2432001 	sub	r2, r3, #1
30009324:	e59d3000 	ldr	r3, [sp]
30009328:	e5832044 	str	r2, [r3, #68]	; 0x44
			if(cur->slice<=0){
3000932c:	e59d3000 	ldr	r3, [sp]
30009330:	e5933044 	ldr	r3, [r3, #68]	; 0x44
30009334:	e3530000 	cmp	r3, #0
30009338:	1a000008 	bne	30009360 <slice_delay_deal+0x6c>
				data=(slice_policy_data_t *)cur->private_data;
3000933c:	e59d3000 	ldr	r3, [sp]
30009340:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30009344:	e58d3004 	str	r3, [sp, #4]
				cur->slice=data->slice_ld;
30009348:	e59d3004 	ldr	r3, [sp, #4]
3000934c:	e5932000 	ldr	r2, [r3]
30009350:	e59d3000 	ldr	r3, [sp]
30009354:	e5832044 	str	r2, [r3, #68]	; 0x44
				acoral_thread_move2_tail(cur);
30009358:	e59d0000 	ldr	r0, [sp]
3000935c:	ebffe61b 	bl	30002bd0 <acoral_thread_move2_tail>
			}
		}
#ifndef CFG_TICKS_PRIVATE
	}
#endif
}
30009360:	e28dd00c 	add	sp, sp, #12
30009364:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009368:	e12fff1e 	bx	lr
3000936c:	300103f8 	.word	0x300103f8

30009370 <slice_policy_init>:

void slice_policy_init(){
30009370:	e92d4008 	push	{r3, lr}
	slice_policy.type=ACORAL_SCHED_POLICY_SLICE;
30009374:	e59f3044 	ldr	r3, [pc, #68]	; 300093c0 <slice_policy_init+0x50>
30009378:	e3a02018 	mov	r2, #24
3000937c:	e5c32008 	strb	r2, [r3, #8]
	slice_policy.policy_thread_release=slice_policy_thread_release;
30009380:	e59f3038 	ldr	r3, [pc, #56]	; 300093c0 <slice_policy_init+0x50>
30009384:	e59f2038 	ldr	r2, [pc, #56]	; 300093c4 <slice_policy_init+0x54>
30009388:	e5832010 	str	r2, [r3, #16]
	slice_policy.policy_thread_init=slice_policy_thread_init;
3000938c:	e59f302c 	ldr	r3, [pc, #44]	; 300093c0 <slice_policy_init+0x50>
30009390:	e59f2030 	ldr	r2, [pc, #48]	; 300093c8 <slice_policy_init+0x58>
30009394:	e583200c 	str	r2, [r3, #12]
	slice_policy.delay_deal=slice_delay_deal;
30009398:	e59f3020 	ldr	r3, [pc, #32]	; 300093c0 <slice_policy_init+0x50>
3000939c:	e59f2028 	ldr	r2, [pc, #40]	; 300093cc <slice_policy_init+0x5c>
300093a0:	e5832014 	str	r2, [r3, #20]
	slice_policy.name="slice";
300093a4:	e59f3014 	ldr	r3, [pc, #20]	; 300093c0 <slice_policy_init+0x50>
300093a8:	e59f2020 	ldr	r2, [pc, #32]	; 300093d0 <slice_policy_init+0x60>
300093ac:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&slice_policy);
300093b0:	e59f0008 	ldr	r0, [pc, #8]	; 300093c0 <slice_policy_init+0x50>
300093b4:	ebffe2a3 	bl	30001e48 <acoral_register_sched_policy>
}
300093b8:	e8bd4008 	pop	{r3, lr}
300093bc:	e12fff1e 	bx	lr
300093c0:	3000f960 	.word	0x3000f960
300093c4:	300092cc 	.word	0x300092cc
300093c8:	300090fc 	.word	0x300090fc
300093cc:	300092f4 	.word	0x300092f4
300093d0:	3000e71c 	.word	0x3000e71c

300093d4 <posix_delay_deal>:
#include<policy.h>
#include<mem.h>
#include<timer.h>
#include<posix_thrd.h>
#define POSIX_SLICE_RATE 5
void posix_delay_deal(){
300093d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300093d8:	e24dd00c 	sub	sp, sp, #12
#ifndef CFG_TICKS_PRIVATE
	acoral_u32 i;
	for(i=0;i<HAL_MAX_CPU;i++){
		cur=acoral_get_running_thread(i);
#else
		cur=acoral_cur_thread;
300093dc:	e59f3178 	ldr	r3, [pc, #376]	; 3000955c <posix_delay_deal+0x188>
300093e0:	e5933000 	ldr	r3, [r3]
300093e4:	e58d3000 	str	r3, [sp]
#endif
		if(cur->policy==ACORAL_SCHED_POLICY_POSIX){
300093e8:	e59d3000 	ldr	r3, [sp]
300093ec:	e5d3300c 	ldrb	r3, [r3, #12]
300093f0:	e3530019 	cmp	r3, #25
300093f4:	1a000055 	bne	30009550 <posix_delay_deal+0x17c>
			cur->slice--;
300093f8:	e59d3000 	ldr	r3, [sp]
300093fc:	e5933044 	ldr	r3, [r3, #68]	; 0x44
30009400:	e2432001 	sub	r2, r3, #1
30009404:	e59d3000 	ldr	r3, [sp]
30009408:	e5832044 	str	r2, [r3, #68]	; 0x44
			if(cur->slice==0){
3000940c:	e59d3000 	ldr	r3, [sp]
30009410:	e5933044 	ldr	r3, [r3, #68]	; 0x44
30009414:	e3530000 	cmp	r3, #0
30009418:	1a00004c 	bne	30009550 <posix_delay_deal+0x17c>
				data=(posix_policy_data_t *)cur->private_data;
3000941c:	e59d3000 	ldr	r3, [sp]
30009420:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30009424:	e58d3004 	str	r3, [sp, #4]
				data->stair++;
30009428:	e59d3004 	ldr	r3, [sp, #4]
3000942c:	e5d33008 	ldrb	r3, [r3, #8]
30009430:	e2833001 	add	r3, r3, #1
30009434:	e20320ff 	and	r2, r3, #255	; 0xff
30009438:	e59d3004 	ldr	r3, [sp, #4]
3000943c:	e5c32008 	strb	r2, [r3, #8]
				if(data->stair>=ACORAL_POSIX_PRIO_MAX){
30009440:	e59d3004 	ldr	r3, [sp, #4]
30009444:	e5d33008 	ldrb	r3, [r3, #8]
30009448:	e3530044 	cmp	r3, #68	; 0x44
3000944c:	9a000029 	bls	300094f8 <posix_delay_deal+0x124>
					if(data->time<ACORAL_POSIX_STAIR_NUM){
30009450:	e59d3004 	ldr	r3, [sp, #4]
30009454:	e5d33009 	ldrb	r3, [r3, #9]
30009458:	e353001d 	cmp	r3, #29
3000945c:	8a00000c 	bhi	30009494 <posix_delay_deal+0xc0>
						data->stair=ACORAL_POSIX_PRIO_MIN+data->time;
30009460:	e59d3004 	ldr	r3, [sp, #4]
30009464:	e5d33009 	ldrb	r3, [r3, #9]
30009468:	e2833027 	add	r3, r3, #39	; 0x27
3000946c:	e20320ff 	and	r2, r3, #255	; 0xff
30009470:	e59d3004 	ldr	r3, [sp, #4]
30009474:	e5c32008 	strb	r2, [r3, #8]
						data->time++;
30009478:	e59d3004 	ldr	r3, [sp, #4]
3000947c:	e5d33009 	ldrb	r3, [r3, #9]
30009480:	e2833001 	add	r3, r3, #1
30009484:	e20320ff 	and	r2, r3, #255	; 0xff
30009488:	e59d3004 	ldr	r3, [sp, #4]
3000948c:	e5c32009 	strb	r2, [r3, #9]
30009490:	ea000018 	b	300094f8 <posix_delay_deal+0x124>
					}
					else{
						cur->policy=ACORAL_SCHED_POLICY_SLICE;
30009494:	e59d3000 	ldr	r3, [sp]
30009498:	e3a02018 	mov	r2, #24
3000949c:	e5c3200c 	strb	r2, [r3, #12]
						((slice_policy_data_t *)data)->slice_ld=TIME_TO_TICKS(data->time<<POSIX_SLICE_RATE);
300094a0:	e59d1004 	ldr	r1, [sp, #4]
300094a4:	e59d3004 	ldr	r3, [sp, #4]
300094a8:	e5d33009 	ldrb	r3, [r3, #9]
300094ac:	e1a02283 	lsl	r2, r3, #5
300094b0:	e1a03002 	mov	r3, r2
300094b4:	e1a03103 	lsl	r3, r3, #2
300094b8:	e0833002 	add	r3, r3, r2
300094bc:	e1a02103 	lsl	r2, r3, #2
300094c0:	e0833002 	add	r3, r3, r2
300094c4:	e1a03103 	lsl	r3, r3, #2
300094c8:	e59f2090 	ldr	r2, [pc, #144]	; 30009560 <posix_delay_deal+0x18c>
300094cc:	e0c20293 	smull	r0, r2, r3, r2
300094d0:	e1a02342 	asr	r2, r2, #6
300094d4:	e1a03fc3 	asr	r3, r3, #31
300094d8:	e0633002 	rsb	r3, r3, r2
300094dc:	e5813000 	str	r3, [r1]
						data->stair--;
300094e0:	e59d3004 	ldr	r3, [sp, #4]
300094e4:	e5d33008 	ldrb	r3, [r3, #8]
300094e8:	e2433001 	sub	r3, r3, #1
300094ec:	e20320ff 	and	r2, r3, #255	; 0xff
300094f0:	e59d3004 	ldr	r3, [sp, #4]
300094f4:	e5c32008 	strb	r2, [r3, #8]
					}
				}
				cur->slice=TIME_TO_TICKS(data->time<<POSIX_SLICE_RATE);
300094f8:	e59d3004 	ldr	r3, [sp, #4]
300094fc:	e5d33009 	ldrb	r3, [r3, #9]
30009500:	e1a02283 	lsl	r2, r3, #5
30009504:	e1a03002 	mov	r3, r2
30009508:	e1a03103 	lsl	r3, r3, #2
3000950c:	e0833002 	add	r3, r3, r2
30009510:	e1a02103 	lsl	r2, r3, #2
30009514:	e0833002 	add	r3, r3, r2
30009518:	e1a03103 	lsl	r3, r3, #2
3000951c:	e59f203c 	ldr	r2, [pc, #60]	; 30009560 <posix_delay_deal+0x18c>
30009520:	e0c21293 	smull	r1, r2, r3, r2
30009524:	e1a02342 	asr	r2, r2, #6
30009528:	e1a03fc3 	asr	r3, r3, #31
3000952c:	e0633002 	rsb	r3, r3, r2
30009530:	e1a02003 	mov	r2, r3
30009534:	e59d3000 	ldr	r3, [sp]
30009538:	e5832044 	str	r2, [r3, #68]	; 0x44
				acoral_thread_change_prio(cur,data->stair);
3000953c:	e59d3004 	ldr	r3, [sp, #4]
30009540:	e5d33008 	ldrb	r3, [r3, #8]
30009544:	e59d0000 	ldr	r0, [sp]
30009548:	e1a01003 	mov	r1, r3
3000954c:	ebffe547 	bl	30002a70 <acoral_thread_change_prio>
			}
		}
#ifndef CFG_TICKS_PRIVATE
	}
#endif
}
30009550:	e28dd00c 	add	sp, sp, #12
30009554:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009558:	e12fff1e 	bx	lr
3000955c:	300103f8 	.word	0x300103f8
30009560:	10624dd3 	.word	0x10624dd3

30009564 <acoral_posix_create>:

void acoral_posix_create(acoral_id* id,acoral_posix_policy_data_t *data,void (*route)(void *args),void *args){
30009564:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009568:	e24dd01c 	sub	sp, sp, #28
3000956c:	e58d000c 	str	r0, [sp, #12]
30009570:	e58d1008 	str	r1, [sp, #8]
30009574:	e58d2004 	str	r2, [sp, #4]
30009578:	e58d3000 	str	r3, [sp]
	acoral_thread_t *thread;
	thread=acoral_alloc_thread();
3000957c:	ebffe5af 	bl	30002c40 <acoral_alloc_thread>
30009580:	e1a03000 	mov	r3, r0
30009584:	e58d3014 	str	r3, [sp, #20]
	if(NULL==thread){
30009588:	e59d3014 	ldr	r3, [sp, #20]
3000958c:	e3530000 	cmp	r3, #0
30009590:	1a000002 	bne	300095a0 <acoral_posix_create+0x3c>
		acoral_printerr("Alloc Posix thread fail\n");
30009594:	e59f0084 	ldr	r0, [pc, #132]	; 30009620 <acoral_posix_create+0xbc>
30009598:	eb00071a 	bl	3000b208 <acoral_print>
		acoral_printk("No Mem Space or Beyond the max thread\n");
		return ;
3000959c:	ea00001c 	b	30009614 <acoral_posix_create+0xb0>
	}
	thread->stack_size=0;
300095a0:	e59d3014 	ldr	r3, [sp, #20]
300095a4:	e3a02000 	mov	r2, #0
300095a8:	e583203c 	str	r2, [r3, #60]	; 0x3c
	thread->stack_buttom=NULL;
300095ac:	e59d3014 	ldr	r3, [sp, #20]
300095b0:	e3a02000 	mov	r2, #0
300095b4:	e5832038 	str	r2, [r3, #56]	; 0x38
	thread->name=NULL;
300095b8:	e59d3014 	ldr	r3, [sp, #20]
300095bc:	e3a02000 	mov	r2, #0
300095c0:	e5832048 	str	r2, [r3, #72]	; 0x48
	thread->policy=ACORAL_SCHED_POLICY_POSIX;
300095c4:	e59d3014 	ldr	r3, [sp, #20]
300095c8:	e3a02019 	mov	r2, #25
300095cc:	e5c3200c 	strb	r2, [r3, #12]
	if(id!=NULL)
300095d0:	e59d300c 	ldr	r3, [sp, #12]
300095d4:	e3530000 	cmp	r3, #0
300095d8:	0a000008 	beq	30009600 <acoral_posix_create+0x9c>
		*id=posix_policy_thread_init(thread,route,args,data);
300095dc:	e59d0014 	ldr	r0, [sp, #20]
300095e0:	e59d1004 	ldr	r1, [sp, #4]
300095e4:	e59d2000 	ldr	r2, [sp]
300095e8:	e59d3008 	ldr	r3, [sp, #8]
300095ec:	eb00000c 	bl	30009624 <posix_policy_thread_init>
300095f0:	e1a02000 	mov	r2, r0
300095f4:	e59d300c 	ldr	r3, [sp, #12]
300095f8:	e5832000 	str	r2, [r3]
300095fc:	ea000004 	b	30009614 <acoral_posix_create+0xb0>
	else
		posix_policy_thread_init(thread,route,args,data);
30009600:	e59d0014 	ldr	r0, [sp, #20]
30009604:	e59d1004 	ldr	r1, [sp, #4]
30009608:	e59d2000 	ldr	r2, [sp]
3000960c:	e59d3008 	ldr	r3, [sp, #8]
30009610:	eb000003 	bl	30009624 <posix_policy_thread_init>
}
30009614:	e28dd01c 	add	sp, sp, #28
30009618:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000961c:	e12fff1e 	bx	lr
30009620:	3000e724 	.word	0x3000e724

30009624 <posix_policy_thread_init>:

acoral_id posix_policy_thread_init(acoral_thread_t *thread,void (*route)(void *args),void *args,void *data){
30009624:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009628:	e24dd024 	sub	sp, sp, #36	; 0x24
3000962c:	e58d000c 	str	r0, [sp, #12]
30009630:	e58d1008 	str	r1, [sp, #8]
30009634:	e58d2004 	str	r2, [sp, #4]
30009638:	e58d3000 	str	r3, [sp]
	acoral_sr cpu_sr;
	acoral_posix_policy_data_t *policy_data;
	posix_policy_data_t *private_data;
	policy_data=(acoral_posix_policy_data_t *)data;
3000963c:	e59d3000 	ldr	r3, [sp]
30009640:	e58d3018 	str	r3, [sp, #24]
	private_data=(posix_policy_data_t *)posix_malloc(sizeof(posix_policy_data_t));
30009644:	e3a0000c 	mov	r0, #12
30009648:	ebfff565 	bl	30006be4 <v_malloc>
3000964c:	e1a03000 	mov	r3, r0
30009650:	e58d301c 	str	r3, [sp, #28]
	if(private_data==NULL){
30009654:	e59d301c 	ldr	r3, [sp, #28]
30009658:	e3530000 	cmp	r3, #0
3000965c:	1a00000e 	bne	3000969c <posix_policy_thread_init+0x78>
		acoral_printerr("No mem space for posix private_data:%s\n",thread->name);
30009660:	e59d300c 	ldr	r3, [sp, #12]
30009664:	e5933048 	ldr	r3, [r3, #72]	; 0x48
30009668:	e59f01a4 	ldr	r0, [pc, #420]	; 30009814 <posix_policy_thread_init+0x1f0>
3000966c:	e1a01003 	mov	r1, r3
30009670:	eb0006e4 	bl	3000b208 <acoral_print>
		HAL_ENTER_CRITICAL();
30009674:	ebffe01e 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30009678:	e1a03000 	mov	r3, r0
3000967c:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
30009680:	e59d300c 	ldr	r3, [sp, #12]
30009684:	e1a00003 	mov	r0, r3
30009688:	ebffe7de 	bl	30003608 <acoral_release_res>
		HAL_EXIT_CRITICAL();
3000968c:	e59d0014 	ldr	r0, [sp, #20]
30009690:	ebffe015 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
30009694:	e3e03000 	mvn	r3, #0
30009698:	ea000059 	b	30009804 <posix_policy_thread_init+0x1e0>
	}
	posix_policy_data_init(private_data);
3000969c:	e59d001c 	ldr	r0, [sp, #28]
300096a0:	eb000069 	bl	3000984c <posix_policy_data_init>
	if(policy_data!=NULL){
300096a4:	e59d3018 	ldr	r3, [sp, #24]
300096a8:	e3530000 	cmp	r3, #0
300096ac:	0a000014 	beq	30009704 <posix_policy_thread_init+0xe0>
		private_data->attach_state=policy_data->attach_state;
300096b0:	e59d3018 	ldr	r3, [sp, #24]
300096b4:	e5d32004 	ldrb	r2, [r3, #4]
300096b8:	e59d301c 	ldr	r3, [sp, #28]
300096bc:	e5c32004 	strb	r2, [r3, #4]
		private_data->cpu_mask=policy_data->cpu_mask;
300096c0:	e59d3018 	ldr	r3, [sp, #24]
300096c4:	e5933008 	ldr	r3, [r3, #8]
300096c8:	e20320ff 	and	r2, r3, #255	; 0xff
300096cc:	e59d301c 	ldr	r3, [sp, #28]
300096d0:	e5c32007 	strb	r2, [r3, #7]
		private_data->cancel_type=policy_data->cancel_type;
300096d4:	e59d3018 	ldr	r3, [sp, #24]
300096d8:	e5d32005 	ldrb	r2, [r3, #5]
300096dc:	e59d301c 	ldr	r3, [sp, #28]
300096e0:	e5c32005 	strb	r2, [r3, #5]
		private_data->cancel_enable=policy_data->cancel_enable;
300096e4:	e59d3018 	ldr	r3, [sp, #24]
300096e8:	e5d32006 	ldrb	r2, [r3, #6]
300096ec:	e59d301c 	ldr	r3, [sp, #28]
300096f0:	e5c32006 	strb	r2, [r3, #6]
		thread->stack_size=policy_data->stack_size;
300096f4:	e59d3018 	ldr	r3, [sp, #24]
300096f8:	e593200c 	ldr	r2, [r3, #12]
300096fc:	e59d300c 	ldr	r3, [sp, #12]
30009700:	e583203c 	str	r2, [r3, #60]	; 0x3c
	}
	thread->private_data=private_data;
30009704:	e59d300c 	ldr	r3, [sp, #12]
30009708:	e59d201c 	ldr	r2, [sp, #28]
3000970c:	e5832050 	str	r2, [r3, #80]	; 0x50
	if(thread->stack_size==0)
30009710:	e59d300c 	ldr	r3, [sp, #12]
30009714:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
30009718:	e3530000 	cmp	r3, #0
3000971c:	1a000002 	bne	3000972c <posix_policy_thread_init+0x108>
		thread->stack_size=POSIX_DEFAULT_STACK_SIZE;
30009720:	e59d300c 	ldr	r3, [sp, #12]
30009724:	e3a02b05 	mov	r2, #5120	; 0x1400
30009728:	e583203c 	str	r2, [r3, #60]	; 0x3c
	thread->cpu=-1;
3000972c:	e59d300c 	ldr	r3, [sp, #12]
30009730:	e3e02000 	mvn	r2, #0
30009734:	e5c32006 	strb	r2, [r3, #6]
	thread->cpu_mask=-1;
30009738:	e59d300c 	ldr	r3, [sp, #12]
3000973c:	e3e02000 	mvn	r2, #0
30009740:	e5832008 	str	r2, [r3, #8]
	thread->prio=private_data->stair;
30009744:	e59d301c 	ldr	r3, [sp, #28]
30009748:	e5d32008 	ldrb	r2, [r3, #8]
3000974c:	e59d300c 	ldr	r3, [sp, #12]
30009750:	e5c32005 	strb	r2, [r3, #5]
	thread->slice=TIME_TO_TICKS(private_data->time<<POSIX_SLICE_RATE);
30009754:	e59d301c 	ldr	r3, [sp, #28]
30009758:	e5d33009 	ldrb	r3, [r3, #9]
3000975c:	e1a02283 	lsl	r2, r3, #5
30009760:	e1a03002 	mov	r3, r2
30009764:	e1a03103 	lsl	r3, r3, #2
30009768:	e0833002 	add	r3, r3, r2
3000976c:	e1a02103 	lsl	r2, r3, #2
30009770:	e0833002 	add	r3, r3, r2
30009774:	e1a03103 	lsl	r3, r3, #2
30009778:	e59f2098 	ldr	r2, [pc, #152]	; 30009818 <posix_policy_thread_init+0x1f4>
3000977c:	e0c21293 	smull	r1, r2, r3, r2
30009780:	e1a02342 	asr	r2, r2, #6
30009784:	e1a03fc3 	asr	r3, r3, #31
30009788:	e0633002 	rsb	r3, r3, r2
3000978c:	e1a02003 	mov	r2, r3
30009790:	e59d300c 	ldr	r3, [sp, #12]
30009794:	e5832044 	str	r2, [r3, #68]	; 0x44
	if(acoral_thread_init(thread,route,acoral_thread_exit,args)!=0){
30009798:	e59d000c 	ldr	r0, [sp, #12]
3000979c:	e59d1008 	ldr	r1, [sp, #8]
300097a0:	e59f2074 	ldr	r2, [pc, #116]	; 3000981c <posix_policy_thread_init+0x1f8>
300097a4:	e59d3004 	ldr	r3, [sp, #4]
300097a8:	ebffe52c 	bl	30002c60 <acoral_thread_init>
300097ac:	e1a03000 	mov	r3, r0
300097b0:	e3530000 	cmp	r3, #0
300097b4:	0a00000e 	beq	300097f4 <posix_policy_thread_init+0x1d0>
		acoral_printerr("No thread stack:%s\n",thread->name);
300097b8:	e59d300c 	ldr	r3, [sp, #12]
300097bc:	e5933048 	ldr	r3, [r3, #72]	; 0x48
300097c0:	e59f0058 	ldr	r0, [pc, #88]	; 30009820 <posix_policy_thread_init+0x1fc>
300097c4:	e1a01003 	mov	r1, r3
300097c8:	eb00068e 	bl	3000b208 <acoral_print>
		HAL_ENTER_CRITICAL();
300097cc:	ebffdfc8 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
300097d0:	e1a03000 	mov	r3, r0
300097d4:	e58d3014 	str	r3, [sp, #20]
		acoral_release_res((acoral_res_t *)thread);
300097d8:	e59d300c 	ldr	r3, [sp, #12]
300097dc:	e1a00003 	mov	r0, r3
300097e0:	ebffe788 	bl	30003608 <acoral_release_res>
		HAL_EXIT_CRITICAL();
300097e4:	e59d0014 	ldr	r0, [sp, #20]
300097e8:	ebffdfbf 	bl	300016ec <HAL_INTR_RESTORE>
		return -1;
300097ec:	e3e03000 	mvn	r3, #0
300097f0:	ea000003 	b	30009804 <posix_policy_thread_init+0x1e0>
	}
	acoral_resume_thread(thread);
300097f4:	e59d000c 	ldr	r0, [sp, #12]
300097f8:	ebffe40f 	bl	3000283c <acoral_resume_thread>
	return thread->res.id;
300097fc:	e59d300c 	ldr	r3, [sp, #12]
30009800:	e5933000 	ldr	r3, [r3]
}
30009804:	e1a00003 	mov	r0, r3
30009808:	e28dd024 	add	sp, sp, #36	; 0x24
3000980c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009810:	e12fff1e 	bx	lr
30009814:	3000e740 	.word	0x3000e740
30009818:	10624dd3 	.word	0x10624dd3
3000981c:	30002a50 	.word	0x30002a50
30009820:	3000e768 	.word	0x3000e768

30009824 <posix_policy_thread_release>:

void posix_policy_thread_release(acoral_thread_t *thread){
30009824:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009828:	e24dd00c 	sub	sp, sp, #12
3000982c:	e58d0004 	str	r0, [sp, #4]
	posix_free(thread->private_data);
30009830:	e59d3004 	ldr	r3, [sp, #4]
30009834:	e5933050 	ldr	r3, [r3, #80]	; 0x50
30009838:	e1a00003 	mov	r0, r3
3000983c:	ebfff4fd 	bl	30006c38 <v_free>
}
30009840:	e28dd00c 	add	sp, sp, #12
30009844:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009848:	e12fff1e 	bx	lr

3000984c <posix_policy_data_init>:

void posix_policy_data_init(posix_policy_data_t *private_data){
3000984c:	e24dd008 	sub	sp, sp, #8
30009850:	e58d0004 	str	r0, [sp, #4]
	private_data->attach_state=POSIX_JOINABLE;
30009854:	e59d3004 	ldr	r3, [sp, #4]
30009858:	e3a02001 	mov	r2, #1
3000985c:	e5c32004 	strb	r2, [r3, #4]
	private_data->cancel_type=POSIX_CANCEL_DEFER;
30009860:	e59d3004 	ldr	r3, [sp, #4]
30009864:	e3a02000 	mov	r2, #0
30009868:	e5c32005 	strb	r2, [r3, #5]
	private_data->cancel_enable=true;
3000986c:	e59d3004 	ldr	r3, [sp, #4]
30009870:	e3a02001 	mov	r2, #1
30009874:	e5c32006 	strb	r2, [r3, #6]
	private_data->cpu_mask=0xff;
30009878:	e59d3004 	ldr	r3, [sp, #4]
3000987c:	e3e02000 	mvn	r2, #0
30009880:	e5c32007 	strb	r2, [r3, #7]
	private_data->stair=ACORAL_POSIX_PRIO_MIN;
30009884:	e59d3004 	ldr	r3, [sp, #4]
30009888:	e3a02027 	mov	r2, #39	; 0x27
3000988c:	e5c32008 	strb	r2, [r3, #8]
	private_data->time=1;
30009890:	e59d3004 	ldr	r3, [sp, #4]
30009894:	e3a02001 	mov	r2, #1
30009898:	e5c32009 	strb	r2, [r3, #9]
}
3000989c:	e28dd008 	add	sp, sp, #8
300098a0:	e12fff1e 	bx	lr

300098a4 <posix_policy_init>:

acoral_sched_policy_t posix_policy;
void posix_policy_init(){
300098a4:	e92d4008 	push	{r3, lr}
	posix_policy.type=ACORAL_SCHED_POLICY_POSIX;
300098a8:	e59f3044 	ldr	r3, [pc, #68]	; 300098f4 <posix_policy_init+0x50>
300098ac:	e3a02019 	mov	r2, #25
300098b0:	e5c32008 	strb	r2, [r3, #8]
	posix_policy.policy_thread_init=posix_policy_thread_init;
300098b4:	e59f3038 	ldr	r3, [pc, #56]	; 300098f4 <posix_policy_init+0x50>
300098b8:	e59f2038 	ldr	r2, [pc, #56]	; 300098f8 <posix_policy_init+0x54>
300098bc:	e583200c 	str	r2, [r3, #12]
	posix_policy.policy_thread_release=posix_policy_thread_release;
300098c0:	e59f302c 	ldr	r3, [pc, #44]	; 300098f4 <posix_policy_init+0x50>
300098c4:	e59f2030 	ldr	r2, [pc, #48]	; 300098fc <posix_policy_init+0x58>
300098c8:	e5832010 	str	r2, [r3, #16]
	posix_policy.delay_deal=posix_delay_deal;
300098cc:	e59f3020 	ldr	r3, [pc, #32]	; 300098f4 <posix_policy_init+0x50>
300098d0:	e59f2028 	ldr	r2, [pc, #40]	; 30009900 <posix_policy_init+0x5c>
300098d4:	e5832014 	str	r2, [r3, #20]
	posix_policy.name="posix";
300098d8:	e59f3014 	ldr	r3, [pc, #20]	; 300098f4 <posix_policy_init+0x50>
300098dc:	e59f2020 	ldr	r2, [pc, #32]	; 30009904 <posix_policy_init+0x60>
300098e0:	e5832018 	str	r2, [r3, #24]
	acoral_register_sched_policy(&posix_policy);
300098e4:	e59f0008 	ldr	r0, [pc, #8]	; 300098f4 <posix_policy_init+0x50>
300098e8:	ebffe156 	bl	30001e48 <acoral_register_sched_policy>
}
300098ec:	e8bd4008 	pop	{r3, lr}
300098f0:	e12fff1e 	bx	lr
300098f4:	3000f3c8 	.word	0x3000f3c8
300098f8:	30009624 	.word	0x30009624
300098fc:	30009824 	.word	0x30009824
30009900:	300093d4 	.word	0x300093d4
30009904:	3000e77c 	.word	0x3000e77c

30009908 <delay>:
#include<hal.h>
#include<cpu.h>
#include<policy.h>
acoral_u32 sample_100ms;
volatile acoral_u32 sample;
void delay(){
30009908:	e24dd008 	sub	sp, sp, #8
	volatile acoral_32 tmp=0xfff;
3000990c:	e3a03eff 	mov	r3, #4080	; 0xff0
30009910:	e283300f 	add	r3, r3, #15
30009914:	e58d3004 	str	r3, [sp, #4]
	while(tmp-->0);
30009918:	e59d3004 	ldr	r3, [sp, #4]
3000991c:	e3530000 	cmp	r3, #0
30009920:	d3a02000 	movle	r2, #0
30009924:	c3a02001 	movgt	r2, #1
30009928:	e20220ff 	and	r2, r2, #255	; 0xff
3000992c:	e2433001 	sub	r3, r3, #1
30009930:	e58d3004 	str	r3, [sp, #4]
30009934:	e3520000 	cmp	r2, #0
30009938:	1afffff6 	bne	30009918 <delay+0x10>
	sample++;
3000993c:	e59f3014 	ldr	r3, [pc, #20]	; 30009958 <delay+0x50>
30009940:	e5933000 	ldr	r3, [r3]
30009944:	e2832001 	add	r2, r3, #1
30009948:	e59f3008 	ldr	r3, [pc, #8]	; 30009958 <delay+0x50>
3000994c:	e5832000 	str	r2, [r3]
}
30009950:	e28dd008 	add	sp, sp, #8
30009954:	e12fff1e 	bx	lr
30009958:	3001041c 	.word	0x3001041c

3000995c <delay_task>:

void delay_task(void *args){
3000995c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009960:	e24dd00c 	sub	sp, sp, #12
30009964:	e58d0004 	str	r0, [sp, #4]
	sample=0;
30009968:	e59f300c 	ldr	r3, [pc, #12]	; 3000997c <delay_task+0x20>
3000996c:	e3a02000 	mov	r2, #0
30009970:	e5832000 	str	r2, [r3]
	for(;;){
		delay();
30009974:	ebffffe3 	bl	30009908 <delay>
	}
30009978:	eafffffd 	b	30009974 <delay_task+0x18>
3000997c:	3001041c 	.word	0x3001041c

30009980 <acoral_soft_delay>:
}

void acoral_soft_delay(acoral_u32 n100ms){
30009980:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009984:	e24dd014 	sub	sp, sp, #20
30009988:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 i;
	acoral_u32 tmp=n100ms*sample_100ms;	
3000998c:	e59f3044 	ldr	r3, [pc, #68]	; 300099d8 <acoral_soft_delay+0x58>
30009990:	e5932000 	ldr	r2, [r3]
30009994:	e59d3004 	ldr	r3, [sp, #4]
30009998:	e0030392 	mul	r3, r2, r3
3000999c:	e58d300c 	str	r3, [sp, #12]
	for(i=0;i<tmp;i++)
300099a0:	e3a03000 	mov	r3, #0
300099a4:	e58d3008 	str	r3, [sp, #8]
300099a8:	ea000003 	b	300099bc <acoral_soft_delay+0x3c>
		delay();
300099ac:	ebffffd5 	bl	30009908 <delay>
}

void acoral_soft_delay(acoral_u32 n100ms){
	acoral_u32 i;
	acoral_u32 tmp=n100ms*sample_100ms;	
	for(i=0;i<tmp;i++)
300099b0:	e59d3008 	ldr	r3, [sp, #8]
300099b4:	e2833001 	add	r3, r3, #1
300099b8:	e58d3008 	str	r3, [sp, #8]
300099bc:	e59d2008 	ldr	r2, [sp, #8]
300099c0:	e59d300c 	ldr	r3, [sp, #12]
300099c4:	e1520003 	cmp	r2, r3
300099c8:	3afffff7 	bcc	300099ac <acoral_soft_delay+0x2c>
		delay();
}
300099cc:	e28dd014 	add	sp, sp, #20
300099d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
300099d4:	e12fff1e 	bx	lr
300099d8:	3000fa9c 	.word	0x3000fa9c

300099dc <soft_delay_init>:

void soft_delay_init(){
300099dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
300099e0:	e24dd024 	sub	sp, sp, #36	; 0x24
	acoral_sr cpu_sr;
	acoral_comm_policy_data_t data;
	acoral_thread_t *thread;
	acoral_id tmp_id;
	data.cpu=acoral_current_cpu;
300099e4:	e3a03000 	mov	r3, #0
300099e8:	e5cd3010 	strb	r3, [sp, #16]
	data.prio=ACORAL_TMP_PRIO;
300099ec:	e3a03045 	mov	r3, #69	; 0x45
300099f0:	e5cd3011 	strb	r3, [sp, #17]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
300099f4:	e3a03004 	mov	r3, #4
300099f8:	e5cd3012 	strb	r3, [sp, #18]
	tmp_id=acoral_create_thread_ext(delay_task,256,NULL,"softdelay",NULL,ACORAL_SCHED_POLICY_COMM,&data);
300099fc:	e3a03000 	mov	r3, #0
30009a00:	e58d3000 	str	r3, [sp]
30009a04:	e3a03015 	mov	r3, #21
30009a08:	e58d3004 	str	r3, [sp, #4]
30009a0c:	e28d3010 	add	r3, sp, #16
30009a10:	e58d3008 	str	r3, [sp, #8]
30009a14:	e59f0090 	ldr	r0, [pc, #144]	; 30009aac <soft_delay_init+0xd0>
30009a18:	e3a01c01 	mov	r1, #256	; 0x100
30009a1c:	e3a02000 	mov	r2, #0
30009a20:	e59f3088 	ldr	r3, [pc, #136]	; 30009ab0 <soft_delay_init+0xd4>
30009a24:	ebffe082 	bl	30001c34 <create_thread_ext>
30009a28:	e1a03000 	mov	r3, r0
30009a2c:	e58d301c 	str	r3, [sp, #28]
	if(tmp_id==-1)
30009a30:	e59d301c 	ldr	r3, [sp, #28]
30009a34:	e3730001 	cmn	r3, #1
30009a38:	0a000017 	beq	30009a9c <soft_delay_init+0xc0>
		return;
	acoral_delay_self(1000);
30009a3c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
30009a40:	ebffe3c3 	bl	30002954 <acoral_delay_self>
	sample_100ms=sample/10;
30009a44:	e59f3068 	ldr	r3, [pc, #104]	; 30009ab4 <soft_delay_init+0xd8>
30009a48:	e5932000 	ldr	r2, [r3]
30009a4c:	e59f3064 	ldr	r3, [pc, #100]	; 30009ab8 <soft_delay_init+0xdc>
30009a50:	e0831392 	umull	r1, r3, r2, r3
30009a54:	e1a021a3 	lsr	r2, r3, #3
30009a58:	e59f305c 	ldr	r3, [pc, #92]	; 30009abc <soft_delay_init+0xe0>
30009a5c:	e5832000 	str	r2, [r3]
	/*这里daemo回收进程还没启动，不能使用acoral_kill_thread*/
	thread=(acoral_thread_t *)acoral_get_res_by_id(tmp_id);
30009a60:	e59d001c 	ldr	r0, [sp, #28]
30009a64:	ebffe77b 	bl	30003858 <acoral_get_res_by_id>
30009a68:	e1a03000 	mov	r3, r0
30009a6c:	e58d3018 	str	r3, [sp, #24]
	HAL_ENTER_CRITICAL();
30009a70:	ebffdf1f 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
30009a74:	e1a03000 	mov	r3, r0
30009a78:	e58d3014 	str	r3, [sp, #20]
	acoral_unrdy_thread(thread);
30009a7c:	e59d0018 	ldr	r0, [sp, #24]
30009a80:	ebffe443 	bl	30002b94 <acoral_unrdy_thread>
	acoral_release_thread((acoral_res_t *)thread);
30009a84:	e59d3018 	ldr	r3, [sp, #24]
30009a88:	e1a00003 	mov	r0, r3
30009a8c:	ebffe31e 	bl	3000270c <acoral_release_thread>
	HAL_EXIT_CRITICAL();
30009a90:	e59d0014 	ldr	r0, [sp, #20]
30009a94:	ebffdf14 	bl	300016ec <HAL_INTR_RESTORE>
30009a98:	ea000000 	b	30009aa0 <soft_delay_init+0xc4>
	data.cpu=acoral_current_cpu;
	data.prio=ACORAL_TMP_PRIO;
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
	tmp_id=acoral_create_thread_ext(delay_task,256,NULL,"softdelay",NULL,ACORAL_SCHED_POLICY_COMM,&data);
	if(tmp_id==-1)
		return;
30009a9c:	e1a00000 	nop			; (mov r0, r0)
	thread=(acoral_thread_t *)acoral_get_res_by_id(tmp_id);
	HAL_ENTER_CRITICAL();
	acoral_unrdy_thread(thread);
	acoral_release_thread((acoral_res_t *)thread);
	HAL_EXIT_CRITICAL();
}
30009aa0:	e28dd024 	add	sp, sp, #36	; 0x24
30009aa4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009aa8:	e12fff1e 	bx	lr
30009aac:	3000995c 	.word	0x3000995c
30009ab0:	3000e784 	.word	0x3000e784
30009ab4:	3001041c 	.word	0x3001041c
30009ab8:	cccccccd 	.word	0xcccccccd
30009abc:	3000fa9c 	.word	0x3000fa9c

30009ac0 <dummy_print>:
#include<type.h>
acoral_32 dummy_print(const acoral_char *fmt, ...){
30009ac0:	e92d000f 	push	{r0, r1, r2, r3}
}
30009ac4:	e28dd010 	add	sp, sp, #16
30009ac8:	e12fff1e 	bx	lr

30009acc <acoral_ffs>:
#include<type.h>
#include<bitops.h>
acoral_u32 acoral_ffs(acoral_u32 word)
{
30009acc:	e24dd010 	sub	sp, sp, #16
30009ad0:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 k;
	k = 31;
30009ad4:	e3a0301f 	mov	r3, #31
30009ad8:	e58d300c 	str	r3, [sp, #12]
	if (word & 0x0000ffff) { k -= 16; word <<= 16; }
30009adc:	e59d3004 	ldr	r3, [sp, #4]
30009ae0:	e1a03803 	lsl	r3, r3, #16
30009ae4:	e1a03823 	lsr	r3, r3, #16
30009ae8:	e3530000 	cmp	r3, #0
30009aec:	0a000005 	beq	30009b08 <acoral_ffs+0x3c>
30009af0:	e59d300c 	ldr	r3, [sp, #12]
30009af4:	e2433010 	sub	r3, r3, #16
30009af8:	e58d300c 	str	r3, [sp, #12]
30009afc:	e59d3004 	ldr	r3, [sp, #4]
30009b00:	e1a03803 	lsl	r3, r3, #16
30009b04:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x00ff0000) { k -= 8;  word <<= 8;  }
30009b08:	e59d3004 	ldr	r3, [sp, #4]
30009b0c:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
30009b10:	e3530000 	cmp	r3, #0
30009b14:	0a000005 	beq	30009b30 <acoral_ffs+0x64>
30009b18:	e59d300c 	ldr	r3, [sp, #12]
30009b1c:	e2433008 	sub	r3, r3, #8
30009b20:	e58d300c 	str	r3, [sp, #12]
30009b24:	e59d3004 	ldr	r3, [sp, #4]
30009b28:	e1a03403 	lsl	r3, r3, #8
30009b2c:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x0f000000) { k -= 4;  word <<= 4;  }
30009b30:	e59d3004 	ldr	r3, [sp, #4]
30009b34:	e203340f 	and	r3, r3, #251658240	; 0xf000000
30009b38:	e3530000 	cmp	r3, #0
30009b3c:	0a000005 	beq	30009b58 <acoral_ffs+0x8c>
30009b40:	e59d300c 	ldr	r3, [sp, #12]
30009b44:	e2433004 	sub	r3, r3, #4
30009b48:	e58d300c 	str	r3, [sp, #12]
30009b4c:	e59d3004 	ldr	r3, [sp, #4]
30009b50:	e1a03203 	lsl	r3, r3, #4
30009b54:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x30000000) { k -= 2;  word <<= 2;  }
30009b58:	e59d3004 	ldr	r3, [sp, #4]
30009b5c:	e2033203 	and	r3, r3, #805306368	; 0x30000000
30009b60:	e3530000 	cmp	r3, #0
30009b64:	0a000005 	beq	30009b80 <acoral_ffs+0xb4>
30009b68:	e59d300c 	ldr	r3, [sp, #12]
30009b6c:	e2433002 	sub	r3, r3, #2
30009b70:	e58d300c 	str	r3, [sp, #12]
30009b74:	e59d3004 	ldr	r3, [sp, #4]
30009b78:	e1a03103 	lsl	r3, r3, #2
30009b7c:	e58d3004 	str	r3, [sp, #4]
	if (word & 0x40000000) { k -= 1; }
30009b80:	e59d3004 	ldr	r3, [sp, #4]
30009b84:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
30009b88:	e3530000 	cmp	r3, #0
30009b8c:	0a000002 	beq	30009b9c <acoral_ffs+0xd0>
30009b90:	e59d300c 	ldr	r3, [sp, #12]
30009b94:	e2433001 	sub	r3, r3, #1
30009b98:	e58d300c 	str	r3, [sp, #12]
        return k;
30009b9c:	e59d300c 	ldr	r3, [sp, #12]
}
30009ba0:	e1a00003 	mov	r0, r3
30009ba4:	e28dd010 	add	sp, sp, #16
30009ba8:	e12fff1e 	bx	lr

30009bac <acoral_find_first_bit>:

acoral_u32 acoral_find_first_bit(const acoral_u32 *b,acoral_u32 length)
{
30009bac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009bb0:	e24dd014 	sub	sp, sp, #20
30009bb4:	e58d0004 	str	r0, [sp, #4]
30009bb8:	e58d1000 	str	r1, [sp]
	acoral_u32 v;
	acoral_u32 off;

	for (off = 0; v = b[off], off < length; off++) {
30009bbc:	e3a03000 	mov	r3, #0
30009bc0:	e58d300c 	str	r3, [sp, #12]
30009bc4:	ea000005 	b	30009be0 <acoral_find_first_bit+0x34>
		if (v)
30009bc8:	e59d3008 	ldr	r3, [sp, #8]
30009bcc:	e3530000 	cmp	r3, #0
30009bd0:	1a00000d 	bne	30009c0c <acoral_find_first_bit+0x60>
acoral_u32 acoral_find_first_bit(const acoral_u32 *b,acoral_u32 length)
{
	acoral_u32 v;
	acoral_u32 off;

	for (off = 0; v = b[off], off < length; off++) {
30009bd4:	e59d300c 	ldr	r3, [sp, #12]
30009bd8:	e2833001 	add	r3, r3, #1
30009bdc:	e58d300c 	str	r3, [sp, #12]
30009be0:	e59d300c 	ldr	r3, [sp, #12]
30009be4:	e1a02103 	lsl	r2, r3, #2
30009be8:	e59d3004 	ldr	r3, [sp, #4]
30009bec:	e0823003 	add	r3, r2, r3
30009bf0:	e5933000 	ldr	r3, [r3]
30009bf4:	e58d3008 	str	r3, [sp, #8]
30009bf8:	e59d200c 	ldr	r2, [sp, #12]
30009bfc:	e59d3000 	ldr	r3, [sp]
30009c00:	e1520003 	cmp	r2, r3
30009c04:	3affffef 	bcc	30009bc8 <acoral_find_first_bit+0x1c>
30009c08:	ea000000 	b	30009c10 <acoral_find_first_bit+0x64>
		if (v)
			break;
30009c0c:	e1a00000 	nop			; (mov r0, r0)
	}
	return acoral_ffs(v) + off * 32;
30009c10:	e59d0008 	ldr	r0, [sp, #8]
30009c14:	ebffffac 	bl	30009acc <acoral_ffs>
30009c18:	e1a02000 	mov	r2, r0
30009c1c:	e59d300c 	ldr	r3, [sp, #12]
30009c20:	e1a03283 	lsl	r3, r3, #5
30009c24:	e0823003 	add	r3, r2, r3
}
30009c28:	e1a00003 	mov	r0, r3
30009c2c:	e28dd014 	add	sp, sp, #20
30009c30:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009c34:	e12fff1e 	bx	lr

30009c38 <acoral_set_bit>:

void acoral_set_bit(acoral_32 nr,acoral_u32 *bitmap)
{
30009c38:	e24dd018 	sub	sp, sp, #24
30009c3c:	e58d0004 	str	r0, [sp, #4]
30009c40:	e58d1000 	str	r1, [sp]
	acoral_u32 oldval, mask = 1UL << (nr & 31);
30009c44:	e59d3004 	ldr	r3, [sp, #4]
30009c48:	e203301f 	and	r3, r3, #31
30009c4c:	e3a02001 	mov	r2, #1
30009c50:	e1a03312 	lsl	r3, r2, r3
30009c54:	e58d3010 	str	r3, [sp, #16]
	acoral_u32 *p;
	p =bitmap+(nr>>5);
30009c58:	e59d3004 	ldr	r3, [sp, #4]
30009c5c:	e1a032c3 	asr	r3, r3, #5
30009c60:	e1a03103 	lsl	r3, r3, #2
30009c64:	e59d2000 	ldr	r2, [sp]
30009c68:	e0823003 	add	r3, r2, r3
30009c6c:	e58d3014 	str	r3, [sp, #20]
	oldval = *p;
30009c70:	e59d3014 	ldr	r3, [sp, #20]
30009c74:	e5933000 	ldr	r3, [r3]
30009c78:	e58d300c 	str	r3, [sp, #12]
	*p = oldval | mask;
30009c7c:	e59d200c 	ldr	r2, [sp, #12]
30009c80:	e59d3010 	ldr	r3, [sp, #16]
30009c84:	e1822003 	orr	r2, r2, r3
30009c88:	e59d3014 	ldr	r3, [sp, #20]
30009c8c:	e5832000 	str	r2, [r3]
}
30009c90:	e28dd018 	add	sp, sp, #24
30009c94:	e12fff1e 	bx	lr

30009c98 <acoral_clear_bit>:

void acoral_clear_bit(acoral_32 nr,acoral_u32 *bitmap)
{
30009c98:	e24dd018 	sub	sp, sp, #24
30009c9c:	e58d0004 	str	r0, [sp, #4]
30009ca0:	e58d1000 	str	r1, [sp]
	acoral_u32 oldval, mask = 1UL << (nr & 31);
30009ca4:	e59d3004 	ldr	r3, [sp, #4]
30009ca8:	e203301f 	and	r3, r3, #31
30009cac:	e3a02001 	mov	r2, #1
30009cb0:	e1a03312 	lsl	r3, r2, r3
30009cb4:	e58d3010 	str	r3, [sp, #16]
	acoral_u32 *p;
	p =bitmap+(nr >> 5);
30009cb8:	e59d3004 	ldr	r3, [sp, #4]
30009cbc:	e1a032c3 	asr	r3, r3, #5
30009cc0:	e1a03103 	lsl	r3, r3, #2
30009cc4:	e59d2000 	ldr	r2, [sp]
30009cc8:	e0823003 	add	r3, r2, r3
30009ccc:	e58d3014 	str	r3, [sp, #20]
	oldval = *p;
30009cd0:	e59d3014 	ldr	r3, [sp, #20]
30009cd4:	e5933000 	ldr	r3, [r3]
30009cd8:	e58d300c 	str	r3, [sp, #12]
	*p = oldval &(~mask);
30009cdc:	e59d3010 	ldr	r3, [sp, #16]
30009ce0:	e1e02003 	mvn	r2, r3
30009ce4:	e59d300c 	ldr	r3, [sp, #12]
30009ce8:	e0022003 	and	r2, r2, r3
30009cec:	e59d3014 	ldr	r3, [sp, #20]
30009cf0:	e5832000 	str	r2, [r3]
}
30009cf4:	e28dd018 	add	sp, sp, #24
30009cf8:	e12fff1e 	bx	lr

30009cfc <acoral_get_bit>:

acoral_u32 acoral_get_bit(acoral_32 nr,acoral_u32 *bitmap)
{
30009cfc:	e24dd018 	sub	sp, sp, #24
30009d00:	e58d0004 	str	r0, [sp, #4]
30009d04:	e58d1000 	str	r1, [sp]
	acoral_u32 oldval, mask = 1UL << (nr & 31);
30009d08:	e59d3004 	ldr	r3, [sp, #4]
30009d0c:	e203301f 	and	r3, r3, #31
30009d10:	e3a02001 	mov	r2, #1
30009d14:	e1a03312 	lsl	r3, r2, r3
30009d18:	e58d3010 	str	r3, [sp, #16]
	acoral_u32 *p;
	p =bitmap+(nr>>5);
30009d1c:	e59d3004 	ldr	r3, [sp, #4]
30009d20:	e1a032c3 	asr	r3, r3, #5
30009d24:	e1a03103 	lsl	r3, r3, #2
30009d28:	e59d2000 	ldr	r2, [sp]
30009d2c:	e0823003 	add	r3, r2, r3
30009d30:	e58d3014 	str	r3, [sp, #20]
	oldval = *p;
30009d34:	e59d3014 	ldr	r3, [sp, #20]
30009d38:	e5933000 	ldr	r3, [r3]
30009d3c:	e58d300c 	str	r3, [sp, #12]
	return oldval & mask;
30009d40:	e59d200c 	ldr	r2, [sp, #12]
30009d44:	e59d3010 	ldr	r3, [sp, #16]
30009d48:	e0023003 	and	r3, r2, r3
}
30009d4c:	e1a00003 	mov	r0, r3
30009d50:	e28dd018 	add	sp, sp, #24
30009d54:	e12fff1e 	bx	lr

30009d58 <acoral_prio_queue_add>:
#include<queue.h>
#include<list.h>
#include<bitops.h>
void acoral_prio_queue_add(acoral_prio_array_t *array,acoral_u8 prio,acoral_list_t *list){
30009d58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009d5c:	e24dd01c 	sub	sp, sp, #28
30009d60:	e58d000c 	str	r0, [sp, #12]
30009d64:	e1a03001 	mov	r3, r1
30009d68:	e58d2004 	str	r2, [sp, #4]
30009d6c:	e5cd300b 	strb	r3, [sp, #11]
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num++;
30009d70:	e59d300c 	ldr	r3, [sp, #12]
30009d74:	e5933000 	ldr	r3, [r3]
30009d78:	e2832001 	add	r2, r3, #1
30009d7c:	e59d300c 	ldr	r3, [sp, #12]
30009d80:	e5832000 	str	r2, [r3]
        queue=array->queue + prio;
30009d84:	e59d300c 	ldr	r3, [sp, #12]
30009d88:	e2831010 	add	r1, r3, #16
30009d8c:	e5dd200b 	ldrb	r2, [sp, #11]
30009d90:	e1a03002 	mov	r3, r2
30009d94:	e1a03083 	lsl	r3, r3, #1
30009d98:	e0833002 	add	r3, r3, r2
30009d9c:	e1a03103 	lsl	r3, r3, #2
30009da0:	e0813003 	add	r3, r1, r3
30009da4:	e58d3010 	str	r3, [sp, #16]
	head=&queue->head;
30009da8:	e59d3010 	ldr	r3, [sp, #16]
30009dac:	e58d3014 	str	r3, [sp, #20]
	acoral_list_add2_tail(list,head);
30009db0:	e59d0004 	ldr	r0, [sp, #4]
30009db4:	e59d1014 	ldr	r1, [sp, #20]
30009db8:	eb000080 	bl	30009fc0 <acoral_list_add2_tail>
	acoral_set_bit(prio,array->bitmap);
30009dbc:	e5dd200b 	ldrb	r2, [sp, #11]
30009dc0:	e59d300c 	ldr	r3, [sp, #12]
30009dc4:	e2833004 	add	r3, r3, #4
30009dc8:	e1a00002 	mov	r0, r2
30009dcc:	e1a01003 	mov	r1, r3
30009dd0:	ebffff98 	bl	30009c38 <acoral_set_bit>
}
30009dd4:	e28dd01c 	add	sp, sp, #28
30009dd8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009ddc:	e12fff1e 	bx	lr

30009de0 <acoral_prio_queue_del>:

void acoral_prio_queue_del(acoral_prio_array_t *array,acoral_u8 prio,acoral_list_t *list){
30009de0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009de4:	e24dd01c 	sub	sp, sp, #28
30009de8:	e58d000c 	str	r0, [sp, #12]
30009dec:	e1a03001 	mov	r3, r1
30009df0:	e58d2004 	str	r2, [sp, #4]
30009df4:	e5cd300b 	strb	r3, [sp, #11]
	acoral_queue_t *queue;
	acoral_list_t *head;
        queue= array->queue + prio;
30009df8:	e59d300c 	ldr	r3, [sp, #12]
30009dfc:	e2831010 	add	r1, r3, #16
30009e00:	e5dd200b 	ldrb	r2, [sp, #11]
30009e04:	e1a03002 	mov	r3, r2
30009e08:	e1a03083 	lsl	r3, r3, #1
30009e0c:	e0833002 	add	r3, r3, r2
30009e10:	e1a03103 	lsl	r3, r3, #2
30009e14:	e0813003 	add	r3, r1, r3
30009e18:	e58d3010 	str	r3, [sp, #16]
	head=&queue->head;
30009e1c:	e59d3010 	ldr	r3, [sp, #16]
30009e20:	e58d3014 	str	r3, [sp, #20]
	array->num--;
30009e24:	e59d300c 	ldr	r3, [sp, #12]
30009e28:	e5933000 	ldr	r3, [r3]
30009e2c:	e2432001 	sub	r2, r3, #1
30009e30:	e59d300c 	ldr	r3, [sp, #12]
30009e34:	e5832000 	str	r2, [r3]
	acoral_list_del(list);
30009e38:	e59d0004 	ldr	r0, [sp, #4]
30009e3c:	eb000072 	bl	3000a00c <acoral_list_del>
	if(acoral_list_empty(head))
30009e40:	e59d3014 	ldr	r3, [sp, #20]
30009e44:	e5932000 	ldr	r2, [r3]
30009e48:	e59d3014 	ldr	r3, [sp, #20]
30009e4c:	e1520003 	cmp	r2, r3
30009e50:	1a000005 	bne	30009e6c <acoral_prio_queue_del+0x8c>
		acoral_clear_bit(prio,array->bitmap);
30009e54:	e5dd200b 	ldrb	r2, [sp, #11]
30009e58:	e59d300c 	ldr	r3, [sp, #12]
30009e5c:	e2833004 	add	r3, r3, #4
30009e60:	e1a00002 	mov	r0, r2
30009e64:	e1a01003 	mov	r1, r3
30009e68:	ebffff8a 	bl	30009c98 <acoral_clear_bit>
}
30009e6c:	e28dd01c 	add	sp, sp, #28
30009e70:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009e74:	e12fff1e 	bx	lr

30009e78 <acoral_get_highprio>:

acoral_u32 acoral_get_highprio(acoral_prio_array_t *array){
30009e78:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
30009e7c:	e24dd00c 	sub	sp, sp, #12
30009e80:	e58d0004 	str	r0, [sp, #4]
	return acoral_find_first_bit(array->bitmap,PRIO_BITMAP_SIZE);
30009e84:	e59d3004 	ldr	r3, [sp, #4]
30009e88:	e2833004 	add	r3, r3, #4
30009e8c:	e1a00003 	mov	r0, r3
30009e90:	e3a01003 	mov	r1, #3
30009e94:	ebffff44 	bl	30009bac <acoral_find_first_bit>
30009e98:	e1a03000 	mov	r3, r0
}
30009e9c:	e1a00003 	mov	r0, r3
30009ea0:	e28dd00c 	add	sp, sp, #12
30009ea4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
30009ea8:	e12fff1e 	bx	lr

30009eac <acoral_prio_queue_init>:

void acoral_prio_queue_init(acoral_prio_array_t *array){
30009eac:	e24dd018 	sub	sp, sp, #24
30009eb0:	e58d0004 	str	r0, [sp, #4]
  	acoral_u8 i;
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num=0;
30009eb4:	e59d3004 	ldr	r3, [sp, #4]
30009eb8:	e3a02000 	mov	r2, #0
30009ebc:	e5832000 	str	r2, [r3]
	for(i=0;i<PRIO_BITMAP_SIZE;i++)
30009ec0:	e3a03000 	mov	r3, #0
30009ec4:	e5cd300f 	strb	r3, [sp, #15]
30009ec8:	ea00000a 	b	30009ef8 <acoral_prio_queue_init+0x4c>
	    array->bitmap[i]=0;
30009ecc:	e5dd100f 	ldrb	r1, [sp, #15]
30009ed0:	e59d2004 	ldr	r2, [sp, #4]
30009ed4:	e3a03004 	mov	r3, #4
30009ed8:	e1a01101 	lsl	r1, r1, #2
30009edc:	e0812002 	add	r2, r1, r2
30009ee0:	e0823003 	add	r3, r2, r3
30009ee4:	e3a02000 	mov	r2, #0
30009ee8:	e5832000 	str	r2, [r3]
void acoral_prio_queue_init(acoral_prio_array_t *array){
  	acoral_u8 i;
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num=0;
	for(i=0;i<PRIO_BITMAP_SIZE;i++)
30009eec:	e5dd300f 	ldrb	r3, [sp, #15]
30009ef0:	e2833001 	add	r3, r3, #1
30009ef4:	e5cd300f 	strb	r3, [sp, #15]
30009ef8:	e5dd300f 	ldrb	r3, [sp, #15]
30009efc:	e3530002 	cmp	r3, #2
30009f00:	9afffff1 	bls	30009ecc <acoral_prio_queue_init+0x20>
	    array->bitmap[i]=0;
  	for(i=0;i<ACORAL_MAX_PRIO_NUM;i++){
30009f04:	e3a03000 	mov	r3, #0
30009f08:	e5cd300f 	strb	r3, [sp, #15]
30009f0c:	ea000013 	b	30009f60 <acoral_prio_queue_init+0xb4>
	    queue= array->queue + i;
30009f10:	e59d3004 	ldr	r3, [sp, #4]
30009f14:	e2831010 	add	r1, r3, #16
30009f18:	e5dd200f 	ldrb	r2, [sp, #15]
30009f1c:	e1a03002 	mov	r3, r2
30009f20:	e1a03083 	lsl	r3, r3, #1
30009f24:	e0833002 	add	r3, r3, r2
30009f28:	e1a03103 	lsl	r3, r3, #2
30009f2c:	e0813003 	add	r3, r1, r3
30009f30:	e58d3010 	str	r3, [sp, #16]
	    head=&queue->head;
30009f34:	e59d3010 	ldr	r3, [sp, #16]
30009f38:	e58d3014 	str	r3, [sp, #20]
	    acoral_init_list(head);
30009f3c:	e59d3014 	ldr	r3, [sp, #20]
30009f40:	e59d2014 	ldr	r2, [sp, #20]
30009f44:	e5832000 	str	r2, [r3]
30009f48:	e59d3014 	ldr	r3, [sp, #20]
30009f4c:	e59d2014 	ldr	r2, [sp, #20]
30009f50:	e5832004 	str	r2, [r3, #4]
	acoral_queue_t *queue;
	acoral_list_t *head;
	array->num=0;
	for(i=0;i<PRIO_BITMAP_SIZE;i++)
	    array->bitmap[i]=0;
  	for(i=0;i<ACORAL_MAX_PRIO_NUM;i++){
30009f54:	e5dd300f 	ldrb	r3, [sp, #15]
30009f58:	e2833001 	add	r3, r3, #1
30009f5c:	e5cd300f 	strb	r3, [sp, #15]
30009f60:	e5dd300f 	ldrb	r3, [sp, #15]
30009f64:	e3530046 	cmp	r3, #70	; 0x46
30009f68:	9affffe8 	bls	30009f10 <acoral_prio_queue_init+0x64>
	    queue= array->queue + i;
	    head=&queue->head;
	    acoral_init_list(head);
	} 	
}
30009f6c:	e28dd018 	add	sp, sp, #24
30009f70:	e12fff1e 	bx	lr

30009f74 <acoral_list_add>:
#include<list.h>
void acoral_list_add(acoral_list_t *new, acoral_list_t *head)
{
30009f74:	e24dd008 	sub	sp, sp, #8
30009f78:	e58d0004 	str	r0, [sp, #4]
30009f7c:	e58d1000 	str	r1, [sp]
	new->prev=head;	
30009f80:	e59d3004 	ldr	r3, [sp, #4]
30009f84:	e59d2000 	ldr	r2, [sp]
30009f88:	e5832004 	str	r2, [r3, #4]
	new->next=head->next;	
30009f8c:	e59d3000 	ldr	r3, [sp]
30009f90:	e5932000 	ldr	r2, [r3]
30009f94:	e59d3004 	ldr	r3, [sp, #4]
30009f98:	e5832000 	str	r2, [r3]
	head->next->prev=new;	
30009f9c:	e59d3000 	ldr	r3, [sp]
30009fa0:	e5933000 	ldr	r3, [r3]
30009fa4:	e59d2004 	ldr	r2, [sp, #4]
30009fa8:	e5832004 	str	r2, [r3, #4]
	head->next=new;	
30009fac:	e59d3000 	ldr	r3, [sp]
30009fb0:	e59d2004 	ldr	r2, [sp, #4]
30009fb4:	e5832000 	str	r2, [r3]
}
30009fb8:	e28dd008 	add	sp, sp, #8
30009fbc:	e12fff1e 	bx	lr

30009fc0 <acoral_list_add2_tail>:

void acoral_list_add2_tail(acoral_list_t *new, acoral_list_t *head)
{
30009fc0:	e24dd008 	sub	sp, sp, #8
30009fc4:	e58d0004 	str	r0, [sp, #4]
30009fc8:	e58d1000 	str	r1, [sp]
	new->prev=head->prev;
30009fcc:	e59d3000 	ldr	r3, [sp]
30009fd0:	e5932004 	ldr	r2, [r3, #4]
30009fd4:	e59d3004 	ldr	r3, [sp, #4]
30009fd8:	e5832004 	str	r2, [r3, #4]
	new->next=head;
30009fdc:	e59d3004 	ldr	r3, [sp, #4]
30009fe0:	e59d2000 	ldr	r2, [sp]
30009fe4:	e5832000 	str	r2, [r3]
	head->prev->next=new;
30009fe8:	e59d3000 	ldr	r3, [sp]
30009fec:	e5933004 	ldr	r3, [r3, #4]
30009ff0:	e59d2004 	ldr	r2, [sp, #4]
30009ff4:	e5832000 	str	r2, [r3]
	head->prev=new;
30009ff8:	e59d3000 	ldr	r3, [sp]
30009ffc:	e59d2004 	ldr	r2, [sp, #4]
3000a000:	e5832004 	str	r2, [r3, #4]
}
3000a004:	e28dd008 	add	sp, sp, #8
3000a008:	e12fff1e 	bx	lr

3000a00c <acoral_list_del>:

void acoral_list_del(acoral_list_t *entry)
{
3000a00c:	e24dd008 	sub	sp, sp, #8
3000a010:	e58d0004 	str	r0, [sp, #4]
	entry->prev->next= entry->next;
3000a014:	e59d3004 	ldr	r3, [sp, #4]
3000a018:	e5933004 	ldr	r3, [r3, #4]
3000a01c:	e59d2004 	ldr	r2, [sp, #4]
3000a020:	e5922000 	ldr	r2, [r2]
3000a024:	e5832000 	str	r2, [r3]
	entry->next->prev=entry->prev;
3000a028:	e59d3004 	ldr	r3, [sp, #4]
3000a02c:	e5933000 	ldr	r3, [r3]
3000a030:	e59d2004 	ldr	r2, [sp, #4]
3000a034:	e5922004 	ldr	r2, [r2, #4]
3000a038:	e5832004 	str	r2, [r3, #4]
	entry->next = entry;
3000a03c:	e59d3004 	ldr	r3, [sp, #4]
3000a040:	e59d2004 	ldr	r2, [sp, #4]
3000a044:	e5832000 	str	r2, [r3]
	entry->prev = entry;
3000a048:	e59d3004 	ldr	r3, [sp, #4]
3000a04c:	e59d2004 	ldr	r2, [sp, #4]
3000a050:	e5832004 	str	r2, [r3, #4]
}
3000a054:	e28dd008 	add	sp, sp, #8
3000a058:	e12fff1e 	bx	lr

3000a05c <do_div>:
#define SPACE	8		/* space if plus */
#define LEFT	16		/* left justified */
#define SPECIAL	32		/* 0x */
#define LARGE	64		/* use 'ABCDEF' instead of 'abcdef' */
static acoral_32 do_div(acoral_64 *n,acoral_32 base)		
{								
3000a05c:	e92d4010 	push	{r4, lr}
3000a060:	e24dd010 	sub	sp, sp, #16
3000a064:	e58d0004 	str	r0, [sp, #4]
3000a068:	e58d1000 	str	r1, [sp]
	acoral_32 __res;				
	__res = ((acoral_u32)*n) % (acoral_u32)base;
3000a06c:	e59d3004 	ldr	r3, [sp, #4]
3000a070:	e8930018 	ldm	r3, {r3, r4}
3000a074:	e1a02003 	mov	r2, r3
3000a078:	e59d3000 	ldr	r3, [sp]
3000a07c:	e1a00002 	mov	r0, r2
3000a080:	e1a01003 	mov	r1, r3
3000a084:	eb000e9b 	bl	3000daf8 <__aeabi_uidivmod>
3000a088:	e1a03001 	mov	r3, r1
3000a08c:	e58d300c 	str	r3, [sp, #12]
	*n = ((acoral_u32)*n) / (acoral_u32)base;	
3000a090:	e59d3004 	ldr	r3, [sp, #4]
3000a094:	e8930018 	ldm	r3, {r3, r4}
3000a098:	e1a02003 	mov	r2, r3
3000a09c:	e59d3000 	ldr	r3, [sp]
3000a0a0:	e1a00002 	mov	r0, r2
3000a0a4:	e1a01003 	mov	r1, r3
3000a0a8:	eb000e55 	bl	3000da04 <__aeabi_uidiv>
3000a0ac:	e1a03000 	mov	r3, r0
3000a0b0:	e3a04000 	mov	r4, #0
3000a0b4:	e59d2004 	ldr	r2, [sp, #4]
3000a0b8:	e8820018 	stm	r2, {r3, r4}
	return __res;					
3000a0bc:	e59d300c 	ldr	r3, [sp, #12]
}
3000a0c0:	e1a00003 	mov	r0, r3
3000a0c4:	e28dd010 	add	sp, sp, #16
3000a0c8:	e8bd4010 	pop	{r4, lr}
3000a0cc:	e12fff1e 	bx	lr

3000a0d0 <skip_atoi>:


acoral_32 skip_atoi(const acoral_char **s)
    {/*change the string "s" to digit*/
3000a0d0:	e24dd010 	sub	sp, sp, #16
3000a0d4:	e58d0004 	str	r0, [sp, #4]
            acoral_32 i=0;
3000a0d8:	e3a03000 	mov	r3, #0
3000a0dc:	e58d300c 	str	r3, [sp, #12]
 
            while (IS_DIGIT(**s))
3000a0e0:	ea00000e 	b	3000a120 <skip_atoi+0x50>
                    i = i*10 + *((*s)++) - '0';
3000a0e4:	e59d200c 	ldr	r2, [sp, #12]
3000a0e8:	e1a03002 	mov	r3, r2
3000a0ec:	e1a03103 	lsl	r3, r3, #2
3000a0f0:	e0833002 	add	r3, r3, r2
3000a0f4:	e1a03083 	lsl	r3, r3, #1
3000a0f8:	e1a01003 	mov	r1, r3
3000a0fc:	e59d3004 	ldr	r3, [sp, #4]
3000a100:	e5933000 	ldr	r3, [r3]
3000a104:	e5d32000 	ldrb	r2, [r3]
3000a108:	e0812002 	add	r2, r1, r2
3000a10c:	e2422030 	sub	r2, r2, #48	; 0x30
3000a110:	e58d200c 	str	r2, [sp, #12]
3000a114:	e2832001 	add	r2, r3, #1
3000a118:	e59d3004 	ldr	r3, [sp, #4]
3000a11c:	e5832000 	str	r2, [r3]

acoral_32 skip_atoi(const acoral_char **s)
    {/*change the string "s" to digit*/
            acoral_32 i=0;
 
            while (IS_DIGIT(**s))
3000a120:	e59d3004 	ldr	r3, [sp, #4]
3000a124:	e5933000 	ldr	r3, [r3]
3000a128:	e5d33000 	ldrb	r3, [r3]
3000a12c:	e353002f 	cmp	r3, #47	; 0x2f
3000a130:	9a000004 	bls	3000a148 <skip_atoi+0x78>
3000a134:	e59d3004 	ldr	r3, [sp, #4]
3000a138:	e5933000 	ldr	r3, [r3]
3000a13c:	e5d33000 	ldrb	r3, [r3]
3000a140:	e3530038 	cmp	r3, #56	; 0x38
3000a144:	9affffe6 	bls	3000a0e4 <skip_atoi+0x14>
                    i = i*10 + *((*s)++) - '0';
            return i;
3000a148:	e59d300c 	ldr	r3, [sp, #12]
} 
3000a14c:	e1a00003 	mov	r0, r3
3000a150:	e28dd010 	add	sp, sp, #16
3000a154:	e12fff1e 	bx	lr

3000a158 <number>:

const acoral_char small_digits[] = "0123456789abcdefghijklmnopqrstuvwxyz";
const acoral_char large_digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
acoral_char * number(acoral_char * buf, acoral_char * end, acoral_64 num, acoral_32 base, acoral_32 size, acoral_32 precision, acoral_32 type)
{
3000a158:	e92d4010 	push	{r4, lr}
3000a15c:	e24dd060 	sub	sp, sp, #96	; 0x60
3000a160:	e58d000c 	str	r0, [sp, #12]
3000a164:	e58d1008 	str	r1, [sp, #8]
3000a168:	e88d000c 	stm	sp, {r2, r3}
	acoral_char c,sign,tmp[66];
	const acoral_char *digits;
	acoral_32 i;

	digits = (type & LARGE) ? large_digits : small_digits;
3000a16c:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a170:	e2033040 	and	r3, r3, #64	; 0x40
3000a174:	e3530000 	cmp	r3, #0
3000a178:	0a000001 	beq	3000a184 <number+0x2c>
3000a17c:	e59f34e4 	ldr	r3, [pc, #1252]	; 3000a668 <number+0x510>
3000a180:	ea000000 	b	3000a188 <number+0x30>
3000a184:	e59f34e0 	ldr	r3, [pc, #1248]	; 3000a66c <number+0x514>
3000a188:	e58d3058 	str	r3, [sp, #88]	; 0x58
	if (type & LEFT)
3000a18c:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a190:	e2033010 	and	r3, r3, #16
3000a194:	e3530000 	cmp	r3, #0
3000a198:	0a000002 	beq	3000a1a8 <number+0x50>
		type &= ~ZEROPAD;
3000a19c:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a1a0:	e3c33001 	bic	r3, r3, #1
3000a1a4:	e58d3074 	str	r3, [sp, #116]	; 0x74
	if (base < 2 || base > 36)
3000a1a8:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a1ac:	e3530001 	cmp	r3, #1
3000a1b0:	da000002 	ble	3000a1c0 <number+0x68>
3000a1b4:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a1b8:	e3530024 	cmp	r3, #36	; 0x24
3000a1bc:	da000001 	ble	3000a1c8 <number+0x70>
		return 0;
3000a1c0:	e3a03000 	mov	r3, #0
3000a1c4:	ea000123 	b	3000a658 <number+0x500>
	c = (type & ZEROPAD) ? '0' : ' ';
3000a1c8:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a1cc:	e2033001 	and	r3, r3, #1
3000a1d0:	e20330ff 	and	r3, r3, #255	; 0xff
3000a1d4:	e3530000 	cmp	r3, #0
3000a1d8:	0a000001 	beq	3000a1e4 <number+0x8c>
3000a1dc:	e3a03030 	mov	r3, #48	; 0x30
3000a1e0:	ea000000 	b	3000a1e8 <number+0x90>
3000a1e4:	e3a03020 	mov	r3, #32
3000a1e8:	e5cd3056 	strb	r3, [sp, #86]	; 0x56
	sign = 0;
3000a1ec:	e3a03000 	mov	r3, #0
3000a1f0:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
	if (type & SIGN) {
3000a1f4:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a1f8:	e2033002 	and	r3, r3, #2
3000a1fc:	e3530000 	cmp	r3, #0
3000a200:	0a000020 	beq	3000a288 <number+0x130>
		if (num < 0) {
3000a204:	e89d0018 	ldm	sp, {r3, r4}
3000a208:	e3530000 	cmp	r3, #0
3000a20c:	e2d40000 	sbcs	r0, r4, #0
3000a210:	aa000009 	bge	3000a23c <number+0xe4>
			sign = '-';
3000a214:	e3a0302d 	mov	r3, #45	; 0x2d
3000a218:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
			num = -num;
3000a21c:	e89d0018 	ldm	sp, {r3, r4}
3000a220:	e2733000 	rsbs	r3, r3, #0
3000a224:	e2e44000 	rsc	r4, r4, #0
3000a228:	e88d0018 	stm	sp, {r3, r4}
			size--;
3000a22c:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a230:	e2433001 	sub	r3, r3, #1
3000a234:	e58d306c 	str	r3, [sp, #108]	; 0x6c
3000a238:	ea000012 	b	3000a288 <number+0x130>
		} else if (type & PLUS) {
3000a23c:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a240:	e2033004 	and	r3, r3, #4
3000a244:	e3530000 	cmp	r3, #0
3000a248:	0a000005 	beq	3000a264 <number+0x10c>
			sign = '+';
3000a24c:	e3a0302b 	mov	r3, #43	; 0x2b
3000a250:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
			size--;
3000a254:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a258:	e2433001 	sub	r3, r3, #1
3000a25c:	e58d306c 	str	r3, [sp, #108]	; 0x6c
3000a260:	ea000008 	b	3000a288 <number+0x130>
		} else if (type & SPACE) {
3000a264:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a268:	e2033008 	and	r3, r3, #8
3000a26c:	e3530000 	cmp	r3, #0
3000a270:	0a000004 	beq	3000a288 <number+0x130>
			sign = ' ';
3000a274:	e3a03020 	mov	r3, #32
3000a278:	e5cd3057 	strb	r3, [sp, #87]	; 0x57
			size--;
3000a27c:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a280:	e2433001 	sub	r3, r3, #1
3000a284:	e58d306c 	str	r3, [sp, #108]	; 0x6c
		}
	}
	if (type & SPECIAL) {
3000a288:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a28c:	e2033020 	and	r3, r3, #32
3000a290:	e3530000 	cmp	r3, #0
3000a294:	0a00000c 	beq	3000a2cc <number+0x174>
		if (base == 16)
3000a298:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a29c:	e3530010 	cmp	r3, #16
3000a2a0:	1a000003 	bne	3000a2b4 <number+0x15c>
			size -= 2;
3000a2a4:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a2a8:	e2433002 	sub	r3, r3, #2
3000a2ac:	e58d306c 	str	r3, [sp, #108]	; 0x6c
3000a2b0:	ea000005 	b	3000a2cc <number+0x174>
		else if (base == 8)
3000a2b4:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a2b8:	e3530008 	cmp	r3, #8
3000a2bc:	1a000002 	bne	3000a2cc <number+0x174>
			size--;
3000a2c0:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a2c4:	e2433001 	sub	r3, r3, #1
3000a2c8:	e58d306c 	str	r3, [sp, #108]	; 0x6c
	}
	i = 0;
3000a2cc:	e3a03000 	mov	r3, #0
3000a2d0:	e58d305c 	str	r3, [sp, #92]	; 0x5c
	if (num == 0)
3000a2d4:	e89d0018 	ldm	sp, {r3, r4}
3000a2d8:	e1931004 	orrs	r1, r3, r4
3000a2dc:	1a00001d 	bne	3000a358 <number+0x200>
		tmp[i++]='0';
3000a2e0:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a2e4:	e3e0304b 	mvn	r3, #75	; 0x4b
3000a2e8:	e28d0060 	add	r0, sp, #96	; 0x60
3000a2ec:	e0802002 	add	r2, r0, r2
3000a2f0:	e0823003 	add	r3, r2, r3
3000a2f4:	e3a02030 	mov	r2, #48	; 0x30
3000a2f8:	e5c32000 	strb	r2, [r3]
3000a2fc:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a300:	e2833001 	add	r3, r3, #1
3000a304:	e58d305c 	str	r3, [sp, #92]	; 0x5c
3000a308:	ea000016 	b	3000a368 <number+0x210>
	else while (num != 0)
		tmp[i++] = digits[do_div(&num,base)];
3000a30c:	e59d405c 	ldr	r4, [sp, #92]	; 0x5c
3000a310:	e1a0300d 	mov	r3, sp
3000a314:	e1a00003 	mov	r0, r3
3000a318:	e59d1068 	ldr	r1, [sp, #104]	; 0x68
3000a31c:	ebffff4e 	bl	3000a05c <do_div>
3000a320:	e1a03000 	mov	r3, r0
3000a324:	e1a02003 	mov	r2, r3
3000a328:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000a32c:	e0823003 	add	r3, r2, r3
3000a330:	e5d32000 	ldrb	r2, [r3]
3000a334:	e3e0304b 	mvn	r3, #75	; 0x4b
3000a338:	e28d0060 	add	r0, sp, #96	; 0x60
3000a33c:	e0801004 	add	r1, r0, r4
3000a340:	e0813003 	add	r3, r1, r3
3000a344:	e5c32000 	strb	r2, [r3]
3000a348:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a34c:	e2833001 	add	r3, r3, #1
3000a350:	e58d305c 	str	r3, [sp, #92]	; 0x5c
3000a354:	ea000000 	b	3000a35c <number+0x204>
			size--;
	}
	i = 0;
	if (num == 0)
		tmp[i++]='0';
	else while (num != 0)
3000a358:	e1a00000 	nop			; (mov r0, r0)
3000a35c:	e89d0018 	ldm	sp, {r3, r4}
3000a360:	e1931004 	orrs	r1, r3, r4
3000a364:	1affffe8 	bne	3000a30c <number+0x1b4>
		tmp[i++] = digits[do_div(&num,base)];
	if (i > precision)
3000a368:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a36c:	e59d3070 	ldr	r3, [sp, #112]	; 0x70
3000a370:	e1520003 	cmp	r2, r3
3000a374:	da000001 	ble	3000a380 <number+0x228>
		precision = i;
3000a378:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a37c:	e58d3070 	str	r3, [sp, #112]	; 0x70
	size -= precision;
3000a380:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a384:	e59d3070 	ldr	r3, [sp, #112]	; 0x70
3000a388:	e0633002 	rsb	r3, r3, r2
3000a38c:	e58d306c 	str	r3, [sp, #108]	; 0x6c
	if (!(type&(ZEROPAD+LEFT))) {
3000a390:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a394:	e2033011 	and	r3, r3, #17
3000a398:	e3530000 	cmp	r3, #0
3000a39c:	1a000014 	bne	3000a3f4 <number+0x29c>
		while(size-->0) {
3000a3a0:	ea000009 	b	3000a3cc <number+0x274>
			if (buf <= end)
3000a3a4:	e59d200c 	ldr	r2, [sp, #12]
3000a3a8:	e59d3008 	ldr	r3, [sp, #8]
3000a3ac:	e1520003 	cmp	r2, r3
3000a3b0:	8a000002 	bhi	3000a3c0 <number+0x268>
				*buf = ' ';
3000a3b4:	e59d300c 	ldr	r3, [sp, #12]
3000a3b8:	e3a02020 	mov	r2, #32
3000a3bc:	e5c32000 	strb	r2, [r3]
			++buf;
3000a3c0:	e59d300c 	ldr	r3, [sp, #12]
3000a3c4:	e2833001 	add	r3, r3, #1
3000a3c8:	e58d300c 	str	r3, [sp, #12]
		tmp[i++] = digits[do_div(&num,base)];
	if (i > precision)
		precision = i;
	size -= precision;
	if (!(type&(ZEROPAD+LEFT))) {
		while(size-->0) {
3000a3cc:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a3d0:	e3530000 	cmp	r3, #0
3000a3d4:	d3a03000 	movle	r3, #0
3000a3d8:	c3a03001 	movgt	r3, #1
3000a3dc:	e20330ff 	and	r3, r3, #255	; 0xff
3000a3e0:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a3e4:	e2422001 	sub	r2, r2, #1
3000a3e8:	e58d206c 	str	r2, [sp, #108]	; 0x6c
3000a3ec:	e3530000 	cmp	r3, #0
3000a3f0:	1affffeb 	bne	3000a3a4 <number+0x24c>
			if (buf <= end)
				*buf = ' ';
			++buf;
		}
	}
	if (sign) {
3000a3f4:	e5dd3057 	ldrb	r3, [sp, #87]	; 0x57
3000a3f8:	e3530000 	cmp	r3, #0
3000a3fc:	0a000009 	beq	3000a428 <number+0x2d0>
		if (buf <= end)
3000a400:	e59d200c 	ldr	r2, [sp, #12]
3000a404:	e59d3008 	ldr	r3, [sp, #8]
3000a408:	e1520003 	cmp	r2, r3
3000a40c:	8a000002 	bhi	3000a41c <number+0x2c4>
			*buf = sign;
3000a410:	e59d300c 	ldr	r3, [sp, #12]
3000a414:	e5dd2057 	ldrb	r2, [sp, #87]	; 0x57
3000a418:	e5c32000 	strb	r2, [r3]
		++buf;
3000a41c:	e59d300c 	ldr	r3, [sp, #12]
3000a420:	e2833001 	add	r3, r3, #1
3000a424:	e58d300c 	str	r3, [sp, #12]
	}
	if (type & SPECIAL) {
3000a428:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a42c:	e2033020 	and	r3, r3, #32
3000a430:	e3530000 	cmp	r3, #0
3000a434:	0a000026 	beq	3000a4d4 <number+0x37c>
		if (base==8) {
3000a438:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a43c:	e3530008 	cmp	r3, #8
3000a440:	1a00000a 	bne	3000a470 <number+0x318>
			if (buf <= end)
3000a444:	e59d200c 	ldr	r2, [sp, #12]
3000a448:	e59d3008 	ldr	r3, [sp, #8]
3000a44c:	e1520003 	cmp	r2, r3
3000a450:	8a000002 	bhi	3000a460 <number+0x308>
				*buf = '0';
3000a454:	e59d300c 	ldr	r3, [sp, #12]
3000a458:	e3a02030 	mov	r2, #48	; 0x30
3000a45c:	e5c32000 	strb	r2, [r3]
			++buf;
3000a460:	e59d300c 	ldr	r3, [sp, #12]
3000a464:	e2833001 	add	r3, r3, #1
3000a468:	e58d300c 	str	r3, [sp, #12]
3000a46c:	ea000018 	b	3000a4d4 <number+0x37c>
		} else if (base==16) {
3000a470:	e59d3068 	ldr	r3, [sp, #104]	; 0x68
3000a474:	e3530010 	cmp	r3, #16
3000a478:	1a000015 	bne	3000a4d4 <number+0x37c>
			if (buf <= end)
3000a47c:	e59d200c 	ldr	r2, [sp, #12]
3000a480:	e59d3008 	ldr	r3, [sp, #8]
3000a484:	e1520003 	cmp	r2, r3
3000a488:	8a000002 	bhi	3000a498 <number+0x340>
				*buf = '0';
3000a48c:	e59d300c 	ldr	r3, [sp, #12]
3000a490:	e3a02030 	mov	r2, #48	; 0x30
3000a494:	e5c32000 	strb	r2, [r3]
			++buf;
3000a498:	e59d300c 	ldr	r3, [sp, #12]
3000a49c:	e2833001 	add	r3, r3, #1
3000a4a0:	e58d300c 	str	r3, [sp, #12]
			if (buf <= end)
3000a4a4:	e59d200c 	ldr	r2, [sp, #12]
3000a4a8:	e59d3008 	ldr	r3, [sp, #8]
3000a4ac:	e1520003 	cmp	r2, r3
3000a4b0:	8a000004 	bhi	3000a4c8 <number+0x370>
				*buf = digits[33];
3000a4b4:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000a4b8:	e2833021 	add	r3, r3, #33	; 0x21
3000a4bc:	e5d32000 	ldrb	r2, [r3]
3000a4c0:	e59d300c 	ldr	r3, [sp, #12]
3000a4c4:	e5c32000 	strb	r2, [r3]
			++buf;
3000a4c8:	e59d300c 	ldr	r3, [sp, #12]
3000a4cc:	e2833001 	add	r3, r3, #1
3000a4d0:	e58d300c 	str	r3, [sp, #12]
		}
	}
	if (!(type & LEFT)) {
3000a4d4:	e59d3074 	ldr	r3, [sp, #116]	; 0x74
3000a4d8:	e2033010 	and	r3, r3, #16
3000a4dc:	e3530000 	cmp	r3, #0
3000a4e0:	1a000020 	bne	3000a568 <number+0x410>
		while (size-- > 0) {
3000a4e4:	ea000009 	b	3000a510 <number+0x3b8>
			if (buf <= end)
3000a4e8:	e59d200c 	ldr	r2, [sp, #12]
3000a4ec:	e59d3008 	ldr	r3, [sp, #8]
3000a4f0:	e1520003 	cmp	r2, r3
3000a4f4:	8a000002 	bhi	3000a504 <number+0x3ac>
				*buf = c;
3000a4f8:	e59d300c 	ldr	r3, [sp, #12]
3000a4fc:	e5dd2056 	ldrb	r2, [sp, #86]	; 0x56
3000a500:	e5c32000 	strb	r2, [r3]
			++buf;
3000a504:	e59d300c 	ldr	r3, [sp, #12]
3000a508:	e2833001 	add	r3, r3, #1
3000a50c:	e58d300c 	str	r3, [sp, #12]
				*buf = digits[33];
			++buf;
		}
	}
	if (!(type & LEFT)) {
		while (size-- > 0) {
3000a510:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a514:	e3530000 	cmp	r3, #0
3000a518:	d3a03000 	movle	r3, #0
3000a51c:	c3a03001 	movgt	r3, #1
3000a520:	e20330ff 	and	r3, r3, #255	; 0xff
3000a524:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a528:	e2422001 	sub	r2, r2, #1
3000a52c:	e58d206c 	str	r2, [sp, #108]	; 0x6c
3000a530:	e3530000 	cmp	r3, #0
3000a534:	1affffeb 	bne	3000a4e8 <number+0x390>
			if (buf <= end)
				*buf = c;
			++buf;
		}
	}
	while (i < precision--) {
3000a538:	ea00000b 	b	3000a56c <number+0x414>
		if (buf <= end)
3000a53c:	e59d200c 	ldr	r2, [sp, #12]
3000a540:	e59d3008 	ldr	r3, [sp, #8]
3000a544:	e1520003 	cmp	r2, r3
3000a548:	8a000002 	bhi	3000a558 <number+0x400>
			*buf = '0';
3000a54c:	e59d300c 	ldr	r3, [sp, #12]
3000a550:	e3a02030 	mov	r2, #48	; 0x30
3000a554:	e5c32000 	strb	r2, [r3]
		++buf;
3000a558:	e59d300c 	ldr	r3, [sp, #12]
3000a55c:	e2833001 	add	r3, r3, #1
3000a560:	e58d300c 	str	r3, [sp, #12]
3000a564:	ea000000 	b	3000a56c <number+0x414>
			if (buf <= end)
				*buf = c;
			++buf;
		}
	}
	while (i < precision--) {
3000a568:	e1a00000 	nop			; (mov r0, r0)
3000a56c:	e59d2070 	ldr	r2, [sp, #112]	; 0x70
3000a570:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a574:	e1520003 	cmp	r2, r3
3000a578:	d3a03000 	movle	r3, #0
3000a57c:	c3a03001 	movgt	r3, #1
3000a580:	e20330ff 	and	r3, r3, #255	; 0xff
3000a584:	e59d2070 	ldr	r2, [sp, #112]	; 0x70
3000a588:	e2422001 	sub	r2, r2, #1
3000a58c:	e58d2070 	str	r2, [sp, #112]	; 0x70
3000a590:	e3530000 	cmp	r3, #0
3000a594:	1affffe8 	bne	3000a53c <number+0x3e4>
		if (buf <= end)
			*buf = '0';
		++buf;
	}
	while (i-- > 0) {
3000a598:	ea00000e 	b	3000a5d8 <number+0x480>
		if (buf <= end)
3000a59c:	e59d200c 	ldr	r2, [sp, #12]
3000a5a0:	e59d3008 	ldr	r3, [sp, #8]
3000a5a4:	e1520003 	cmp	r2, r3
3000a5a8:	8a000007 	bhi	3000a5cc <number+0x474>
			*buf = tmp[i];
3000a5ac:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a5b0:	e3e0304b 	mvn	r3, #75	; 0x4b
3000a5b4:	e28d0060 	add	r0, sp, #96	; 0x60
3000a5b8:	e0802002 	add	r2, r0, r2
3000a5bc:	e0823003 	add	r3, r2, r3
3000a5c0:	e5d32000 	ldrb	r2, [r3]
3000a5c4:	e59d300c 	ldr	r3, [sp, #12]
3000a5c8:	e5c32000 	strb	r2, [r3]
		++buf;
3000a5cc:	e59d300c 	ldr	r3, [sp, #12]
3000a5d0:	e2833001 	add	r3, r3, #1
3000a5d4:	e58d300c 	str	r3, [sp, #12]
	while (i < precision--) {
		if (buf <= end)
			*buf = '0';
		++buf;
	}
	while (i-- > 0) {
3000a5d8:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000a5dc:	e3530000 	cmp	r3, #0
3000a5e0:	d3a03000 	movle	r3, #0
3000a5e4:	c3a03001 	movgt	r3, #1
3000a5e8:	e20330ff 	and	r3, r3, #255	; 0xff
3000a5ec:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
3000a5f0:	e2422001 	sub	r2, r2, #1
3000a5f4:	e58d205c 	str	r2, [sp, #92]	; 0x5c
3000a5f8:	e3530000 	cmp	r3, #0
3000a5fc:	1affffe6 	bne	3000a59c <number+0x444>
		if (buf <= end)
			*buf = tmp[i];
		++buf;
	}
	while (size-- > 0) {
3000a600:	ea000009 	b	3000a62c <number+0x4d4>
		if (buf <= end)
3000a604:	e59d200c 	ldr	r2, [sp, #12]
3000a608:	e59d3008 	ldr	r3, [sp, #8]
3000a60c:	e1520003 	cmp	r2, r3
3000a610:	8a000002 	bhi	3000a620 <number+0x4c8>
			*buf = ' ';
3000a614:	e59d300c 	ldr	r3, [sp, #12]
3000a618:	e3a02020 	mov	r2, #32
3000a61c:	e5c32000 	strb	r2, [r3]
		++buf;
3000a620:	e59d300c 	ldr	r3, [sp, #12]
3000a624:	e2833001 	add	r3, r3, #1
3000a628:	e58d300c 	str	r3, [sp, #12]
	while (i-- > 0) {
		if (buf <= end)
			*buf = tmp[i];
		++buf;
	}
	while (size-- > 0) {
3000a62c:	e59d306c 	ldr	r3, [sp, #108]	; 0x6c
3000a630:	e3530000 	cmp	r3, #0
3000a634:	d3a03000 	movle	r3, #0
3000a638:	c3a03001 	movgt	r3, #1
3000a63c:	e20330ff 	and	r3, r3, #255	; 0xff
3000a640:	e59d206c 	ldr	r2, [sp, #108]	; 0x6c
3000a644:	e2422001 	sub	r2, r2, #1
3000a648:	e58d206c 	str	r2, [sp, #108]	; 0x6c
3000a64c:	e3530000 	cmp	r3, #0
3000a650:	1affffeb 	bne	3000a604 <number+0x4ac>
		if (buf <= end)
			*buf = ' ';
		++buf;
	}
	return buf;
3000a654:	e59d300c 	ldr	r3, [sp, #12]
}
3000a658:	e1a00003 	mov	r0, r3
3000a65c:	e28dd060 	add	sp, sp, #96	; 0x60
3000a660:	e8bd4010 	pop	{r4, lr}
3000a664:	e12fff1e 	bx	lr
3000a668:	3000e7b8 	.word	0x3000e7b8
3000a66c:	3000e790 	.word	0x3000e790

3000a670 <vsnprintf>:
				   number of acoral_chars for from string */
	acoral_32 qualifier;		/* 'h', 'l', or 'L' for acoral_32eger fields */
				/* 'z' support added 23/7/1999 S.H.    */
				/* 'z' changed to 'Z' --davidm 1/25/99 */

	str = buf;
3000a670:	e92d4010 	push	{r4, lr}
3000a674:	e24dd068 	sub	sp, sp, #104	; 0x68
3000a678:	e58d001c 	str	r0, [sp, #28]
3000a67c:	e58d1018 	str	r1, [sp, #24]
3000a680:	e58d2014 	str	r2, [sp, #20]
3000a684:	e58d3010 	str	r3, [sp, #16]
3000a688:	e59d301c 	ldr	r3, [sp, #28]
3000a68c:	e58d303c 	str	r3, [sp, #60]	; 0x3c
	end = buf + size - 1;
3000a690:	e59d3018 	ldr	r3, [sp, #24]
3000a694:	e2433001 	sub	r3, r3, #1
3000a698:	e59d201c 	ldr	r2, [sp, #28]
3000a69c:	e0823003 	add	r3, r2, r3
3000a6a0:	e58d3040 	str	r3, [sp, #64]	; 0x40

	if (end < buf - 1) {
3000a6a4:	e59d301c 	ldr	r3, [sp, #28]
3000a6a8:	e2432001 	sub	r2, r3, #1
3000a6ac:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000a6b0:	e1520003 	cmp	r2, r3
3000a6b4:	9a0002a0 	bls	3000b13c <vsnprintf+0xacc>
		end = ((void *) -1);
3000a6b8:	e3e03000 	mvn	r3, #0
3000a6bc:	e58d3040 	str	r3, [sp, #64]	; 0x40
		size = end - buf + 1;
3000a6c0:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
3000a6c4:	e59d301c 	ldr	r3, [sp, #28]
3000a6c8:	e0633002 	rsb	r3, r3, r2
3000a6cc:	e2833001 	add	r3, r3, #1
3000a6d0:	e58d3018 	str	r3, [sp, #24]
	}

	for (; *fmt ; ++fmt) {
3000a6d4:	ea000299 	b	3000b140 <vsnprintf+0xad0>
		if (*fmt != '%') {
3000a6d8:	e59d3014 	ldr	r3, [sp, #20]
3000a6dc:	e5d33000 	ldrb	r3, [r3]
3000a6e0:	e3530025 	cmp	r3, #37	; 0x25
3000a6e4:	0a00000b 	beq	3000a718 <vsnprintf+0xa8>
			if (str <= end)
3000a6e8:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000a6ec:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000a6f0:	e1520003 	cmp	r2, r3
3000a6f4:	8a000003 	bhi	3000a708 <vsnprintf+0x98>
				*str = *fmt;
3000a6f8:	e59d3014 	ldr	r3, [sp, #20]
3000a6fc:	e5d32000 	ldrb	r2, [r3]
3000a700:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000a704:	e5c32000 	strb	r2, [r3]
			++str;
3000a708:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000a70c:	e2833001 	add	r3, r3, #1
3000a710:	e58d303c 	str	r3, [sp, #60]	; 0x3c
			continue;
3000a714:	ea000284 	b	3000b12c <vsnprintf+0xabc>
		}

		/* process flags */
		flags = 0;
3000a718:	e3a03000 	mov	r3, #0
3000a71c:	e58d304c 	str	r3, [sp, #76]	; 0x4c
		repeat:
			++fmt;		/* this also skips first '%' */
3000a720:	e59d3014 	ldr	r3, [sp, #20]
3000a724:	e2833001 	add	r3, r3, #1
3000a728:	e58d3014 	str	r3, [sp, #20]
			switch (*fmt) {
3000a72c:	e59d3014 	ldr	r3, [sp, #20]
3000a730:	e5d33000 	ldrb	r3, [r3]
3000a734:	e2433020 	sub	r3, r3, #32
3000a738:	e3530010 	cmp	r3, #16
3000a73c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
3000a740:	ea000024 	b	3000a7d8 <vsnprintf+0x168>
3000a744:	3000a7a8 	.word	0x3000a7a8
3000a748:	3000a7d8 	.word	0x3000a7d8
3000a74c:	3000a7d8 	.word	0x3000a7d8
3000a750:	3000a7b8 	.word	0x3000a7b8
3000a754:	3000a7d8 	.word	0x3000a7d8
3000a758:	3000a7d8 	.word	0x3000a7d8
3000a75c:	3000a7d8 	.word	0x3000a7d8
3000a760:	3000a7d8 	.word	0x3000a7d8
3000a764:	3000a7d8 	.word	0x3000a7d8
3000a768:	3000a7d8 	.word	0x3000a7d8
3000a76c:	3000a7d8 	.word	0x3000a7d8
3000a770:	3000a798 	.word	0x3000a798
3000a774:	3000a7d8 	.word	0x3000a7d8
3000a778:	3000a788 	.word	0x3000a788
3000a77c:	3000a7d8 	.word	0x3000a7d8
3000a780:	3000a7d8 	.word	0x3000a7d8
3000a784:	3000a7c8 	.word	0x3000a7c8
				case '-': flags |= LEFT; goto repeat;
3000a788:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a78c:	e3833010 	orr	r3, r3, #16
3000a790:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a794:	eaffffe1 	b	3000a720 <vsnprintf+0xb0>
				case '+': flags |= PLUS; goto repeat;
3000a798:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a79c:	e3833004 	orr	r3, r3, #4
3000a7a0:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a7a4:	eaffffdd 	b	3000a720 <vsnprintf+0xb0>
				case ' ': flags |= SPACE; goto repeat;
3000a7a8:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a7ac:	e3833008 	orr	r3, r3, #8
3000a7b0:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a7b4:	eaffffd9 	b	3000a720 <vsnprintf+0xb0>
				case '#': flags |= SPECIAL; goto repeat;
3000a7b8:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a7bc:	e3833020 	orr	r3, r3, #32
3000a7c0:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a7c4:	eaffffd5 	b	3000a720 <vsnprintf+0xb0>
				case '0': flags |= ZEROPAD; goto repeat;
3000a7c8:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a7cc:	e3833001 	orr	r3, r3, #1
3000a7d0:	e58d304c 	str	r3, [sp, #76]	; 0x4c
3000a7d4:	eaffffd1 	b	3000a720 <vsnprintf+0xb0>
			}

		/* get field width */
		field_width = -1;
3000a7d8:	e3e03000 	mvn	r3, #0
3000a7dc:	e58d3050 	str	r3, [sp, #80]	; 0x50
		if (IS_DIGIT(*fmt))
3000a7e0:	e59d3014 	ldr	r3, [sp, #20]
3000a7e4:	e5d33000 	ldrb	r3, [r3]
3000a7e8:	e353002f 	cmp	r3, #47	; 0x2f
3000a7ec:	9a000009 	bls	3000a818 <vsnprintf+0x1a8>
3000a7f0:	e59d3014 	ldr	r3, [sp, #20]
3000a7f4:	e5d33000 	ldrb	r3, [r3]
3000a7f8:	e3530038 	cmp	r3, #56	; 0x38
3000a7fc:	8a000005 	bhi	3000a818 <vsnprintf+0x1a8>
			field_width = skip_atoi(&fmt);
3000a800:	e28d3014 	add	r3, sp, #20
3000a804:	e1a00003 	mov	r0, r3
3000a808:	ebfffe30 	bl	3000a0d0 <skip_atoi>
3000a80c:	e1a03000 	mov	r3, r0
3000a810:	e58d3050 	str	r3, [sp, #80]	; 0x50
				case '0': flags |= ZEROPAD; goto repeat;
			}

		/* get field width */
		field_width = -1;
		if (IS_DIGIT(*fmt))
3000a814:	ea000016 	b	3000a874 <vsnprintf+0x204>
			field_width = skip_atoi(&fmt);
		else if (*fmt == '*') {
3000a818:	e59d3014 	ldr	r3, [sp, #20]
3000a81c:	e5d33000 	ldrb	r3, [r3]
3000a820:	e353002a 	cmp	r3, #42	; 0x2a
3000a824:	1a000012 	bne	3000a874 <vsnprintf+0x204>
			++fmt;
3000a828:	e59d3014 	ldr	r3, [sp, #20]
3000a82c:	e2833001 	add	r3, r3, #1
3000a830:	e58d3014 	str	r3, [sp, #20]
			/* it's the next argument */
			field_width = va_arg(args, acoral_32);
3000a834:	e59d3010 	ldr	r3, [sp, #16]
3000a838:	e2833004 	add	r3, r3, #4
3000a83c:	e58d3010 	str	r3, [sp, #16]
3000a840:	e59d3010 	ldr	r3, [sp, #16]
3000a844:	e2433004 	sub	r3, r3, #4
3000a848:	e5933000 	ldr	r3, [r3]
3000a84c:	e58d3050 	str	r3, [sp, #80]	; 0x50
			if (field_width < 0) {
3000a850:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000a854:	e3530000 	cmp	r3, #0
3000a858:	aa000005 	bge	3000a874 <vsnprintf+0x204>
				field_width = -field_width;
3000a85c:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000a860:	e2633000 	rsb	r3, r3, #0
3000a864:	e58d3050 	str	r3, [sp, #80]	; 0x50
				flags |= LEFT;
3000a868:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000a86c:	e3833010 	orr	r3, r3, #16
3000a870:	e58d304c 	str	r3, [sp, #76]	; 0x4c
			}
		}

		/* get the precision */
		precision = -1;
3000a874:	e3e03000 	mvn	r3, #0
3000a878:	e58d3054 	str	r3, [sp, #84]	; 0x54
		if (*fmt == '.') {
3000a87c:	e59d3014 	ldr	r3, [sp, #20]
3000a880:	e5d33000 	ldrb	r3, [r3]
3000a884:	e353002e 	cmp	r3, #46	; 0x2e
3000a888:	1a000023 	bne	3000a91c <vsnprintf+0x2ac>
			++fmt;	
3000a88c:	e59d3014 	ldr	r3, [sp, #20]
3000a890:	e2833001 	add	r3, r3, #1
3000a894:	e58d3014 	str	r3, [sp, #20]
			if (IS_DIGIT(*fmt))
3000a898:	e59d3014 	ldr	r3, [sp, #20]
3000a89c:	e5d33000 	ldrb	r3, [r3]
3000a8a0:	e353002f 	cmp	r3, #47	; 0x2f
3000a8a4:	9a000009 	bls	3000a8d0 <vsnprintf+0x260>
3000a8a8:	e59d3014 	ldr	r3, [sp, #20]
3000a8ac:	e5d33000 	ldrb	r3, [r3]
3000a8b0:	e3530038 	cmp	r3, #56	; 0x38
3000a8b4:	8a000005 	bhi	3000a8d0 <vsnprintf+0x260>
				precision = skip_atoi(&fmt);
3000a8b8:	e28d3014 	add	r3, sp, #20
3000a8bc:	e1a00003 	mov	r0, r3
3000a8c0:	ebfffe02 	bl	3000a0d0 <skip_atoi>
3000a8c4:	e1a03000 	mov	r3, r0
3000a8c8:	e58d3054 	str	r3, [sp, #84]	; 0x54

		/* get the precision */
		precision = -1;
		if (*fmt == '.') {
			++fmt;	
			if (IS_DIGIT(*fmt))
3000a8cc:	ea00000d 	b	3000a908 <vsnprintf+0x298>
				precision = skip_atoi(&fmt);
			else if (*fmt == '*') {
3000a8d0:	e59d3014 	ldr	r3, [sp, #20]
3000a8d4:	e5d33000 	ldrb	r3, [r3]
3000a8d8:	e353002a 	cmp	r3, #42	; 0x2a
3000a8dc:	1a000009 	bne	3000a908 <vsnprintf+0x298>
				++fmt;
3000a8e0:	e59d3014 	ldr	r3, [sp, #20]
3000a8e4:	e2833001 	add	r3, r3, #1
3000a8e8:	e58d3014 	str	r3, [sp, #20]
				/* it's the next argument */
				precision = va_arg(args, acoral_32);
3000a8ec:	e59d3010 	ldr	r3, [sp, #16]
3000a8f0:	e2833004 	add	r3, r3, #4
3000a8f4:	e58d3010 	str	r3, [sp, #16]
3000a8f8:	e59d3010 	ldr	r3, [sp, #16]
3000a8fc:	e2433004 	sub	r3, r3, #4
3000a900:	e5933000 	ldr	r3, [r3]
3000a904:	e58d3054 	str	r3, [sp, #84]	; 0x54
			}
			if (precision < 0)
3000a908:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
3000a90c:	e3530000 	cmp	r3, #0
3000a910:	aa000001 	bge	3000a91c <vsnprintf+0x2ac>
				precision = 0;
3000a914:	e3a03000 	mov	r3, #0
3000a918:	e58d3054 	str	r3, [sp, #84]	; 0x54
		}

		/* get the conversion qualifier */
		qualifier = -1;
3000a91c:	e3e03000 	mvn	r3, #0
3000a920:	e58d3058 	str	r3, [sp, #88]	; 0x58
		if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L' || *fmt =='Z') {
3000a924:	e59d3014 	ldr	r3, [sp, #20]
3000a928:	e5d33000 	ldrb	r3, [r3]
3000a92c:	e3530068 	cmp	r3, #104	; 0x68
3000a930:	0a00000b 	beq	3000a964 <vsnprintf+0x2f4>
3000a934:	e59d3014 	ldr	r3, [sp, #20]
3000a938:	e5d33000 	ldrb	r3, [r3]
3000a93c:	e353006c 	cmp	r3, #108	; 0x6c
3000a940:	0a000007 	beq	3000a964 <vsnprintf+0x2f4>
3000a944:	e59d3014 	ldr	r3, [sp, #20]
3000a948:	e5d33000 	ldrb	r3, [r3]
3000a94c:	e353004c 	cmp	r3, #76	; 0x4c
3000a950:	0a000003 	beq	3000a964 <vsnprintf+0x2f4>
3000a954:	e59d3014 	ldr	r3, [sp, #20]
3000a958:	e5d33000 	ldrb	r3, [r3]
3000a95c:	e353005a 	cmp	r3, #90	; 0x5a
3000a960:	1a000011 	bne	3000a9ac <vsnprintf+0x33c>
			qualifier = *fmt;
3000a964:	e59d3014 	ldr	r3, [sp, #20]
3000a968:	e5d33000 	ldrb	r3, [r3]
3000a96c:	e58d3058 	str	r3, [sp, #88]	; 0x58
			++fmt;
3000a970:	e59d3014 	ldr	r3, [sp, #20]
3000a974:	e2833001 	add	r3, r3, #1
3000a978:	e58d3014 	str	r3, [sp, #20]
			if (qualifier == 'l' && *fmt == 'l') {
3000a97c:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000a980:	e353006c 	cmp	r3, #108	; 0x6c
3000a984:	1a000008 	bne	3000a9ac <vsnprintf+0x33c>
3000a988:	e59d3014 	ldr	r3, [sp, #20]
3000a98c:	e5d33000 	ldrb	r3, [r3]
3000a990:	e353006c 	cmp	r3, #108	; 0x6c
3000a994:	1a000004 	bne	3000a9ac <vsnprintf+0x33c>
				qualifier = 'L';
3000a998:	e3a0304c 	mov	r3, #76	; 0x4c
3000a99c:	e58d3058 	str	r3, [sp, #88]	; 0x58
				++fmt;
3000a9a0:	e59d3014 	ldr	r3, [sp, #20]
3000a9a4:	e2833001 	add	r3, r3, #1
3000a9a8:	e58d3014 	str	r3, [sp, #20]
			}
		}

		/* default base */
		base = 10;
3000a9ac:	e3a0300a 	mov	r3, #10
3000a9b0:	e58d3038 	str	r3, [sp, #56]	; 0x38

		switch (*fmt) {
3000a9b4:	e59d3014 	ldr	r3, [sp, #20]
3000a9b8:	e5d33000 	ldrb	r3, [r3]
3000a9bc:	e2433025 	sub	r3, r3, #37	; 0x25
3000a9c0:	e3530053 	cmp	r3, #83	; 0x53
3000a9c4:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
3000a9c8:	ea00014b 	b	3000aefc <vsnprintf+0x88c>
3000a9cc:	3000ae9c 	.word	0x3000ae9c
3000a9d0:	3000aefc 	.word	0x3000aefc
3000a9d4:	3000aefc 	.word	0x3000aefc
3000a9d8:	3000aefc 	.word	0x3000aefc
3000a9dc:	3000aefc 	.word	0x3000aefc
3000a9e0:	3000aefc 	.word	0x3000aefc
3000a9e4:	3000aefc 	.word	0x3000aefc
3000a9e8:	3000aefc 	.word	0x3000aefc
3000a9ec:	3000aefc 	.word	0x3000aefc
3000a9f0:	3000aefc 	.word	0x3000aefc
3000a9f4:	3000aefc 	.word	0x3000aefc
3000a9f8:	3000aefc 	.word	0x3000aefc
3000a9fc:	3000aefc 	.word	0x3000aefc
3000aa00:	3000aefc 	.word	0x3000aefc
3000aa04:	3000aefc 	.word	0x3000aefc
3000aa08:	3000aefc 	.word	0x3000aefc
3000aa0c:	3000aefc 	.word	0x3000aefc
3000aa10:	3000aefc 	.word	0x3000aefc
3000aa14:	3000aefc 	.word	0x3000aefc
3000aa18:	3000aefc 	.word	0x3000aefc
3000aa1c:	3000aefc 	.word	0x3000aefc
3000aa20:	3000aefc 	.word	0x3000aefc
3000aa24:	3000aefc 	.word	0x3000aefc
3000aa28:	3000aefc 	.word	0x3000aefc
3000aa2c:	3000aefc 	.word	0x3000aefc
3000aa30:	3000aefc 	.word	0x3000aefc
3000aa34:	3000aefc 	.word	0x3000aefc
3000aa38:	3000aefc 	.word	0x3000aefc
3000aa3c:	3000aefc 	.word	0x3000aefc
3000aa40:	3000aefc 	.word	0x3000aefc
3000aa44:	3000aefc 	.word	0x3000aefc
3000aa48:	3000aefc 	.word	0x3000aefc
3000aa4c:	3000aefc 	.word	0x3000aefc
3000aa50:	3000aefc 	.word	0x3000aefc
3000aa54:	3000aefc 	.word	0x3000aefc
3000aa58:	3000aefc 	.word	0x3000aefc
3000aa5c:	3000aefc 	.word	0x3000aefc
3000aa60:	3000aefc 	.word	0x3000aefc
3000aa64:	3000aefc 	.word	0x3000aefc
3000aa68:	3000aefc 	.word	0x3000aefc
3000aa6c:	3000aefc 	.word	0x3000aefc
3000aa70:	3000aefc 	.word	0x3000aefc
3000aa74:	3000aefc 	.word	0x3000aefc
3000aa78:	3000aefc 	.word	0x3000aefc
3000aa7c:	3000aefc 	.word	0x3000aefc
3000aa80:	3000aefc 	.word	0x3000aefc
3000aa84:	3000aefc 	.word	0x3000aefc
3000aa88:	3000aefc 	.word	0x3000aefc
3000aa8c:	3000aefc 	.word	0x3000aefc
3000aa90:	3000aefc 	.word	0x3000aefc
3000aa94:	3000aefc 	.word	0x3000aefc
3000aa98:	3000aed4 	.word	0x3000aed4
3000aa9c:	3000aefc 	.word	0x3000aefc
3000aaa0:	3000aefc 	.word	0x3000aefc
3000aaa4:	3000aefc 	.word	0x3000aefc
3000aaa8:	3000aefc 	.word	0x3000aefc
3000aaac:	3000aefc 	.word	0x3000aefc
3000aab0:	3000aefc 	.word	0x3000aefc
3000aab4:	3000aefc 	.word	0x3000aefc
3000aab8:	3000aefc 	.word	0x3000aefc
3000aabc:	3000aefc 	.word	0x3000aefc
3000aac0:	3000aefc 	.word	0x3000aefc
3000aac4:	3000ab1c 	.word	0x3000ab1c
3000aac8:	3000aeec 	.word	0x3000aeec
3000aacc:	3000aefc 	.word	0x3000aefc
3000aad0:	3000aefc 	.word	0x3000aefc
3000aad4:	3000aefc 	.word	0x3000aefc
3000aad8:	3000aefc 	.word	0x3000aefc
3000aadc:	3000aeec 	.word	0x3000aeec
3000aae0:	3000aefc 	.word	0x3000aefc
3000aae4:	3000aefc 	.word	0x3000aefc
3000aae8:	3000aefc 	.word	0x3000aefc
3000aaec:	3000aefc 	.word	0x3000aefc
3000aaf0:	3000ade4 	.word	0x3000ade4
3000aaf4:	3000aec8 	.word	0x3000aec8
3000aaf8:	3000ad68 	.word	0x3000ad68
3000aafc:	3000aefc 	.word	0x3000aefc
3000ab00:	3000aefc 	.word	0x3000aefc
3000ab04:	3000abfc 	.word	0x3000abfc
3000ab08:	3000aefc 	.word	0x3000aefc
3000ab0c:	3000af74 	.word	0x3000af74
3000ab10:	3000aefc 	.word	0x3000aefc
3000ab14:	3000aefc 	.word	0x3000aefc
3000ab18:	3000aee0 	.word	0x3000aee0
			case 'c':
				if (!(flags & LEFT)) {
3000ab1c:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000ab20:	e2033010 	and	r3, r3, #16
3000ab24:	e3530000 	cmp	r3, #0
3000ab28:	1a000010 	bne	3000ab70 <vsnprintf+0x500>
					while (--field_width > 0) {
3000ab2c:	ea000009 	b	3000ab58 <vsnprintf+0x4e8>
						if (str <= end)
3000ab30:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ab34:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000ab38:	e1520003 	cmp	r2, r3
3000ab3c:	8a000002 	bhi	3000ab4c <vsnprintf+0x4dc>
							*str = ' ';
3000ab40:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ab44:	e3a02020 	mov	r2, #32
3000ab48:	e5c32000 	strb	r2, [r3]
						++str;
3000ab4c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ab50:	e2833001 	add	r3, r3, #1
3000ab54:	e58d303c 	str	r3, [sp, #60]	; 0x3c
		base = 10;

		switch (*fmt) {
			case 'c':
				if (!(flags & LEFT)) {
					while (--field_width > 0) {
3000ab58:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000ab5c:	e2433001 	sub	r3, r3, #1
3000ab60:	e58d3050 	str	r3, [sp, #80]	; 0x50
3000ab64:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000ab68:	e3530000 	cmp	r3, #0
3000ab6c:	caffffef 	bgt	3000ab30 <vsnprintf+0x4c0>
						if (str <= end)
							*str = ' ';
						++str;
					}
				}
				c = (acoral_u8) va_arg(args, acoral_32);
3000ab70:	e59d3010 	ldr	r3, [sp, #16]
3000ab74:	e2833004 	add	r3, r3, #4
3000ab78:	e58d3010 	str	r3, [sp, #16]
3000ab7c:	e59d3010 	ldr	r3, [sp, #16]
3000ab80:	e2433004 	sub	r3, r3, #4
3000ab84:	e5933000 	ldr	r3, [r3]
3000ab88:	e5cd3047 	strb	r3, [sp, #71]	; 0x47
				if (str <= end)
3000ab8c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ab90:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000ab94:	e1520003 	cmp	r2, r3
3000ab98:	8a000002 	bhi	3000aba8 <vsnprintf+0x538>
					*str = c;
3000ab9c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000aba0:	e5dd2047 	ldrb	r2, [sp, #71]	; 0x47
3000aba4:	e5c32000 	strb	r2, [r3]
				++str;
3000aba8:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000abac:	e2833001 	add	r3, r3, #1
3000abb0:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				while (--field_width > 0) {
3000abb4:	ea000009 	b	3000abe0 <vsnprintf+0x570>
					if (str <= end)
3000abb8:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000abbc:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000abc0:	e1520003 	cmp	r2, r3
3000abc4:	8a000002 	bhi	3000abd4 <vsnprintf+0x564>
						*str = ' ';
3000abc8:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000abcc:	e3a02020 	mov	r2, #32
3000abd0:	e5c32000 	strb	r2, [r3]
					++str;
3000abd4:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000abd8:	e2833001 	add	r3, r3, #1
3000abdc:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				}
				c = (acoral_u8) va_arg(args, acoral_32);
				if (str <= end)
					*str = c;
				++str;
				while (--field_width > 0) {
3000abe0:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000abe4:	e2433001 	sub	r3, r3, #1
3000abe8:	e58d3050 	str	r3, [sp, #80]	; 0x50
3000abec:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000abf0:	e3530000 	cmp	r3, #0
3000abf4:	caffffef 	bgt	3000abb8 <vsnprintf+0x548>
					if (str <= end)
						*str = ' ';
					++str;
				}
				continue;
3000abf8:	ea00014b 	b	3000b12c <vsnprintf+0xabc>

			case 's':
				s = va_arg(args, acoral_char *);
3000abfc:	e59d3010 	ldr	r3, [sp, #16]
3000ac00:	e2833004 	add	r3, r3, #4
3000ac04:	e58d3010 	str	r3, [sp, #16]
3000ac08:	e59d3010 	ldr	r3, [sp, #16]
3000ac0c:	e2433004 	sub	r3, r3, #4
3000ac10:	e5933000 	ldr	r3, [r3]
3000ac14:	e58d3048 	str	r3, [sp, #72]	; 0x48
				if (!s)
3000ac18:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
3000ac1c:	e3530000 	cmp	r3, #0
3000ac20:	1a000001 	bne	3000ac2c <vsnprintf+0x5bc>
					s = "<NULL>";
3000ac24:	e59f3578 	ldr	r3, [pc, #1400]	; 3000b1a4 <vsnprintf+0xb34>
3000ac28:	e58d3048 	str	r3, [sp, #72]	; 0x48

				len = acoral_str_nlen(s, precision);
3000ac2c:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
3000ac30:	e59d0048 	ldr	r0, [sp, #72]	; 0x48
3000ac34:	e1a01003 	mov	r1, r3
3000ac38:	eb0004c5 	bl	3000bf54 <acoral_str_nlen>
3000ac3c:	e1a03000 	mov	r3, r0
3000ac40:	e58d3024 	str	r3, [sp, #36]	; 0x24

				if (!(flags & LEFT)) {
3000ac44:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000ac48:	e2033010 	and	r3, r3, #16
3000ac4c:	e3530000 	cmp	r3, #0
3000ac50:	1a000015 	bne	3000acac <vsnprintf+0x63c>
					while (len < field_width--) {
3000ac54:	ea000009 	b	3000ac80 <vsnprintf+0x610>
						if (str <= end)
3000ac58:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ac5c:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000ac60:	e1520003 	cmp	r2, r3
3000ac64:	8a000002 	bhi	3000ac74 <vsnprintf+0x604>
							*str = ' ';
3000ac68:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ac6c:	e3a02020 	mov	r2, #32
3000ac70:	e5c32000 	strb	r2, [r3]
						++str;
3000ac74:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ac78:	e2833001 	add	r3, r3, #1
3000ac7c:	e58d303c 	str	r3, [sp, #60]	; 0x3c
					s = "<NULL>";

				len = acoral_str_nlen(s, precision);

				if (!(flags & LEFT)) {
					while (len < field_width--) {
3000ac80:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000ac84:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000ac88:	e1520003 	cmp	r2, r3
3000ac8c:	d3a03000 	movle	r3, #0
3000ac90:	c3a03001 	movgt	r3, #1
3000ac94:	e20330ff 	and	r3, r3, #255	; 0xff
3000ac98:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000ac9c:	e2422001 	sub	r2, r2, #1
3000aca0:	e58d2050 	str	r2, [sp, #80]	; 0x50
3000aca4:	e3530000 	cmp	r3, #0
3000aca8:	1affffea 	bne	3000ac58 <vsnprintf+0x5e8>
						if (str <= end)
							*str = ' ';
						++str;
					}
				}
				for (i = 0; i < len; ++i) {
3000acac:	e3a03000 	mov	r3, #0
3000acb0:	e58d3034 	str	r3, [sp, #52]	; 0x34
3000acb4:	ea000010 	b	3000acfc <vsnprintf+0x68c>
					if (str <= end)
3000acb8:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000acbc:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000acc0:	e1520003 	cmp	r2, r3
3000acc4:	8a000003 	bhi	3000acd8 <vsnprintf+0x668>
						*str = *s;
3000acc8:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
3000accc:	e5d32000 	ldrb	r2, [r3]
3000acd0:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000acd4:	e5c32000 	strb	r2, [r3]
					++str; ++s;
3000acd8:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000acdc:	e2833001 	add	r3, r3, #1
3000ace0:	e58d303c 	str	r3, [sp, #60]	; 0x3c
3000ace4:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
3000ace8:	e2833001 	add	r3, r3, #1
3000acec:	e58d3048 	str	r3, [sp, #72]	; 0x48
						if (str <= end)
							*str = ' ';
						++str;
					}
				}
				for (i = 0; i < len; ++i) {
3000acf0:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
3000acf4:	e2833001 	add	r3, r3, #1
3000acf8:	e58d3034 	str	r3, [sp, #52]	; 0x34
3000acfc:	e59d2034 	ldr	r2, [sp, #52]	; 0x34
3000ad00:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000ad04:	e1520003 	cmp	r2, r3
3000ad08:	baffffea 	blt	3000acb8 <vsnprintf+0x648>
					if (str <= end)
						*str = *s;
					++str; ++s;
				}
				while (len < field_width--) {
3000ad0c:	ea000009 	b	3000ad38 <vsnprintf+0x6c8>
					if (str <= end)
3000ad10:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ad14:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000ad18:	e1520003 	cmp	r2, r3
3000ad1c:	8a000002 	bhi	3000ad2c <vsnprintf+0x6bc>
						*str = ' ';
3000ad20:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ad24:	e3a02020 	mov	r2, #32
3000ad28:	e5c32000 	strb	r2, [r3]
					++str;
3000ad2c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000ad30:	e2833001 	add	r3, r3, #1
3000ad34:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				for (i = 0; i < len; ++i) {
					if (str <= end)
						*str = *s;
					++str; ++s;
				}
				while (len < field_width--) {
3000ad38:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000ad3c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
3000ad40:	e1520003 	cmp	r2, r3
3000ad44:	d3a03000 	movle	r3, #0
3000ad48:	c3a03001 	movgt	r3, #1
3000ad4c:	e20330ff 	and	r3, r3, #255	; 0xff
3000ad50:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000ad54:	e2422001 	sub	r2, r2, #1
3000ad58:	e58d2050 	str	r2, [sp, #80]	; 0x50
3000ad5c:	e3530000 	cmp	r3, #0
3000ad60:	1affffea 	bne	3000ad10 <vsnprintf+0x6a0>
					if (str <= end)
						*str = ' ';
					++str;
				}
				continue;
3000ad64:	ea0000f0 	b	3000b12c <vsnprintf+0xabc>

			case 'p':
				if (field_width == -1) {
3000ad68:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
3000ad6c:	e3730001 	cmn	r3, #1
3000ad70:	1a000004 	bne	3000ad88 <vsnprintf+0x718>
					field_width = 2*sizeof(void *);
3000ad74:	e3a03008 	mov	r3, #8
3000ad78:	e58d3050 	str	r3, [sp, #80]	; 0x50
					flags |= ZEROPAD;
3000ad7c:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000ad80:	e3833001 	orr	r3, r3, #1
3000ad84:	e58d304c 	str	r3, [sp, #76]	; 0x4c
				}
				str = number(str, end,
3000ad88:	e59d3010 	ldr	r3, [sp, #16]
3000ad8c:	e2833004 	add	r3, r3, #4
3000ad90:	e58d3010 	str	r3, [sp, #16]
						(acoral_u32) va_arg(args, void *),
3000ad94:	e59d3010 	ldr	r3, [sp, #16]
3000ad98:	e2433004 	sub	r3, r3, #4
3000ad9c:	e5933000 	ldr	r3, [r3]
			case 'p':
				if (field_width == -1) {
					field_width = 2*sizeof(void *);
					flags |= ZEROPAD;
				}
				str = number(str, end,
3000ada0:	e3a04000 	mov	r4, #0
3000ada4:	e3a02010 	mov	r2, #16
3000ada8:	e58d2000 	str	r2, [sp]
3000adac:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000adb0:	e58d2004 	str	r2, [sp, #4]
3000adb4:	e59d2054 	ldr	r2, [sp, #84]	; 0x54
3000adb8:	e58d2008 	str	r2, [sp, #8]
3000adbc:	e59d204c 	ldr	r2, [sp, #76]	; 0x4c
3000adc0:	e58d200c 	str	r2, [sp, #12]
3000adc4:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
3000adc8:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
3000adcc:	e1a02003 	mov	r2, r3
3000add0:	e1a03004 	mov	r3, r4
3000add4:	ebfffcdf 	bl	3000a158 <number>
3000add8:	e1a03000 	mov	r3, r0
3000addc:	e58d303c 	str	r3, [sp, #60]	; 0x3c
						(acoral_u32) va_arg(args, void *),
						16, field_width, precision, flags);
				continue;
3000ade0:	ea0000d1 	b	3000b12c <vsnprintf+0xabc>


			case 'n':
				/* FIXME:
				* What does C99 say about the overflow case here? */
				if (qualifier == 'l') {
3000ade4:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000ade8:	e353006c 	cmp	r3, #108	; 0x6c
3000adec:	1a00000c 	bne	3000ae24 <vsnprintf+0x7b4>
					acoral_32 * ip = va_arg(args, acoral_32 *);
3000adf0:	e59d3010 	ldr	r3, [sp, #16]
3000adf4:	e2833004 	add	r3, r3, #4
3000adf8:	e58d3010 	str	r3, [sp, #16]
3000adfc:	e59d3010 	ldr	r3, [sp, #16]
3000ae00:	e2433004 	sub	r3, r3, #4
3000ae04:	e5933000 	ldr	r3, [r3]
3000ae08:	e58d305c 	str	r3, [sp, #92]	; 0x5c
					*ip = (str - buf);
3000ae0c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ae10:	e59d301c 	ldr	r3, [sp, #28]
3000ae14:	e0632002 	rsb	r2, r3, r2
3000ae18:	e59d305c 	ldr	r3, [sp, #92]	; 0x5c
3000ae1c:	e5832000 	str	r2, [r3]
					*ip = (str - buf);
				} else {
					acoral_32 * ip = va_arg(args, acoral_32 *);
					*ip = (str - buf);
				}
				continue;
3000ae20:	ea0000c1 	b	3000b12c <vsnprintf+0xabc>
				/* FIXME:
				* What does C99 say about the overflow case here? */
				if (qualifier == 'l') {
					acoral_32 * ip = va_arg(args, acoral_32 *);
					*ip = (str - buf);
				} else if (qualifier == 'Z') {
3000ae24:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000ae28:	e353005a 	cmp	r3, #90	; 0x5a
3000ae2c:	1a00000d 	bne	3000ae68 <vsnprintf+0x7f8>
					acoral_u32 * ip = va_arg(args, acoral_u32 *);
3000ae30:	e59d3010 	ldr	r3, [sp, #16]
3000ae34:	e2833004 	add	r3, r3, #4
3000ae38:	e58d3010 	str	r3, [sp, #16]
3000ae3c:	e59d3010 	ldr	r3, [sp, #16]
3000ae40:	e2433004 	sub	r3, r3, #4
3000ae44:	e5933000 	ldr	r3, [r3]
3000ae48:	e58d3060 	str	r3, [sp, #96]	; 0x60
					*ip = (str - buf);
3000ae4c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ae50:	e59d301c 	ldr	r3, [sp, #28]
3000ae54:	e0633002 	rsb	r3, r3, r2
3000ae58:	e1a02003 	mov	r2, r3
3000ae5c:	e59d3060 	ldr	r3, [sp, #96]	; 0x60
3000ae60:	e5832000 	str	r2, [r3]
				} else {
					acoral_32 * ip = va_arg(args, acoral_32 *);
					*ip = (str - buf);
				}
				continue;
3000ae64:	ea0000b0 	b	3000b12c <vsnprintf+0xabc>
					*ip = (str - buf);
				} else if (qualifier == 'Z') {
					acoral_u32 * ip = va_arg(args, acoral_u32 *);
					*ip = (str - buf);
				} else {
					acoral_32 * ip = va_arg(args, acoral_32 *);
3000ae68:	e59d3010 	ldr	r3, [sp, #16]
3000ae6c:	e2833004 	add	r3, r3, #4
3000ae70:	e58d3010 	str	r3, [sp, #16]
3000ae74:	e59d3010 	ldr	r3, [sp, #16]
3000ae78:	e2433004 	sub	r3, r3, #4
3000ae7c:	e5933000 	ldr	r3, [r3]
3000ae80:	e58d3064 	str	r3, [sp, #100]	; 0x64
					*ip = (str - buf);
3000ae84:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000ae88:	e59d301c 	ldr	r3, [sp, #28]
3000ae8c:	e0632002 	rsb	r2, r3, r2
3000ae90:	e59d3064 	ldr	r3, [sp, #100]	; 0x64
3000ae94:	e5832000 	str	r2, [r3]
				}
				continue;
3000ae98:	ea0000a3 	b	3000b12c <vsnprintf+0xabc>

			case '%':
				if (str <= end)
3000ae9c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000aea0:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000aea4:	e1520003 	cmp	r2, r3
3000aea8:	8a000002 	bhi	3000aeb8 <vsnprintf+0x848>
					*str = '%';
3000aeac:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000aeb0:	e3a02025 	mov	r2, #37	; 0x25
3000aeb4:	e5c32000 	strb	r2, [r3]
				++str;
3000aeb8:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000aebc:	e2833001 	add	r3, r3, #1
3000aec0:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				continue;
3000aec4:	ea000098 	b	3000b12c <vsnprintf+0xabc>

				/* acoral_32eger number formats - set up the flags and "break" */
			case 'o':
				base = 8;
3000aec8:	e3a03008 	mov	r3, #8
3000aecc:	e58d3038 	str	r3, [sp, #56]	; 0x38
				break;
3000aed0:	ea000028 	b	3000af78 <vsnprintf+0x908>

			case 'X':
				flags |= LARGE;
3000aed4:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000aed8:	e3833040 	orr	r3, r3, #64	; 0x40
3000aedc:	e58d304c 	str	r3, [sp, #76]	; 0x4c
			case 'x':
				base = 16;
3000aee0:	e3a03010 	mov	r3, #16
3000aee4:	e58d3038 	str	r3, [sp, #56]	; 0x38
				break;
3000aee8:	ea000022 	b	3000af78 <vsnprintf+0x908>

			case 'd':
			case 'i':
				flags |= SIGN;
3000aeec:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000aef0:	e3833002 	orr	r3, r3, #2
3000aef4:	e58d304c 	str	r3, [sp, #76]	; 0x4c
			case 'u':
				break;
3000aef8:	ea00001e 	b	3000af78 <vsnprintf+0x908>

			default:
				if (str <= end)
3000aefc:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000af00:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000af04:	e1520003 	cmp	r2, r3
3000af08:	8a000002 	bhi	3000af18 <vsnprintf+0x8a8>
					*str = '%';
3000af0c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000af10:	e3a02025 	mov	r2, #37	; 0x25
3000af14:	e5c32000 	strb	r2, [r3]
				++str;
3000af18:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000af1c:	e2833001 	add	r3, r3, #1
3000af20:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				if (*fmt) {
3000af24:	e59d3014 	ldr	r3, [sp, #20]
3000af28:	e5d33000 	ldrb	r3, [r3]
3000af2c:	e3530000 	cmp	r3, #0
3000af30:	0a00000b 	beq	3000af64 <vsnprintf+0x8f4>
					if (str <= end)
3000af34:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000af38:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000af3c:	e1520003 	cmp	r2, r3
3000af40:	8a000003 	bhi	3000af54 <vsnprintf+0x8e4>
						*str = *fmt;
3000af44:	e59d3014 	ldr	r3, [sp, #20]
3000af48:	e5d32000 	ldrb	r2, [r3]
3000af4c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000af50:	e5c32000 	strb	r2, [r3]
					++str;
3000af54:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000af58:	e2833001 	add	r3, r3, #1
3000af5c:	e58d303c 	str	r3, [sp, #60]	; 0x3c
				} else {
					--fmt;
				}
				continue;
3000af60:	ea000071 	b	3000b12c <vsnprintf+0xabc>
				if (*fmt) {
					if (str <= end)
						*str = *fmt;
					++str;
				} else {
					--fmt;
3000af64:	e59d3014 	ldr	r3, [sp, #20]
3000af68:	e2433001 	sub	r3, r3, #1
3000af6c:	e58d3014 	str	r3, [sp, #20]
				}
				continue;
3000af70:	ea00006d 	b	3000b12c <vsnprintf+0xabc>

			case 'd':
			case 'i':
				flags |= SIGN;
			case 'u':
				break;
3000af74:	e1a00000 	nop			; (mov r0, r0)
				} else {
					--fmt;
				}
				continue;
		}
		if (qualifier == 'L')
3000af78:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000af7c:	e353004c 	cmp	r3, #76	; 0x4c
3000af80:	1a000008 	bne	3000afa8 <vsnprintf+0x938>
			num = va_arg(args, acoral_64);
3000af84:	e59d3010 	ldr	r3, [sp, #16]
3000af88:	e2833008 	add	r3, r3, #8
3000af8c:	e58d3010 	str	r3, [sp, #16]
3000af90:	e59d3010 	ldr	r3, [sp, #16]
3000af94:	e2433008 	sub	r3, r3, #8
3000af98:	e8930018 	ldm	r3, {r3, r4}
3000af9c:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000afa0:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000afa4:	ea00004f 	b	3000b0e8 <vsnprintf+0xa78>
		else if (qualifier == 'l') {
3000afa8:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000afac:	e353006c 	cmp	r3, #108	; 0x6c
3000afb0:	1a000011 	bne	3000affc <vsnprintf+0x98c>
			num = va_arg(args, acoral_u32);
3000afb4:	e59d3010 	ldr	r3, [sp, #16]
3000afb8:	e2833004 	add	r3, r3, #4
3000afbc:	e58d3010 	str	r3, [sp, #16]
3000afc0:	e59d3010 	ldr	r3, [sp, #16]
3000afc4:	e2433004 	sub	r3, r3, #4
3000afc8:	e5933000 	ldr	r3, [r3]
3000afcc:	e3a04000 	mov	r4, #0
3000afd0:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000afd4:	e58d402c 	str	r4, [sp, #44]	; 0x2c
			if (flags & SIGN)
3000afd8:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000afdc:	e2033002 	and	r3, r3, #2
3000afe0:	e3530000 	cmp	r3, #0
3000afe4:	0a00003c 	beq	3000b0dc <vsnprintf+0xa6c>
				num = (acoral_32) num;
3000afe8:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
3000afec:	e1a04fc3 	asr	r4, r3, #31
3000aff0:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000aff4:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000aff8:	ea00003a 	b	3000b0e8 <vsnprintf+0xa78>
		} else if (qualifier == 'Z') {
3000affc:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b000:	e353005a 	cmp	r3, #90	; 0x5a
3000b004:	1a000009 	bne	3000b030 <vsnprintf+0x9c0>
			num = va_arg(args, acoral_u32);
3000b008:	e59d3010 	ldr	r3, [sp, #16]
3000b00c:	e2833004 	add	r3, r3, #4
3000b010:	e58d3010 	str	r3, [sp, #16]
3000b014:	e59d3010 	ldr	r3, [sp, #16]
3000b018:	e2433004 	sub	r3, r3, #4
3000b01c:	e5933000 	ldr	r3, [r3]
3000b020:	e3a04000 	mov	r4, #0
3000b024:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b028:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b02c:	ea00002d 	b	3000b0e8 <vsnprintf+0xa78>
		} else if (qualifier == 'h') {
3000b030:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
3000b034:	e3530068 	cmp	r3, #104	; 0x68
3000b038:	1a000015 	bne	3000b094 <vsnprintf+0xa24>
			num = (acoral_u16) va_arg(args, acoral_32);
3000b03c:	e59d3010 	ldr	r3, [sp, #16]
3000b040:	e2833004 	add	r3, r3, #4
3000b044:	e58d3010 	str	r3, [sp, #16]
3000b048:	e59d3010 	ldr	r3, [sp, #16]
3000b04c:	e2433004 	sub	r3, r3, #4
3000b050:	e5933000 	ldr	r3, [r3]
3000b054:	e1a03803 	lsl	r3, r3, #16
3000b058:	e1a03823 	lsr	r3, r3, #16
3000b05c:	e3a04000 	mov	r4, #0
3000b060:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b064:	e58d402c 	str	r4, [sp, #44]	; 0x2c
			if (flags & SIGN)
3000b068:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000b06c:	e2033002 	and	r3, r3, #2
3000b070:	e3530000 	cmp	r3, #0
3000b074:	0a00001a 	beq	3000b0e4 <vsnprintf+0xa74>
				num = (acoral_16) num;
3000b078:	e1dd32b8 	ldrh	r3, [sp, #40]	; 0x28
3000b07c:	e1a03803 	lsl	r3, r3, #16
3000b080:	e1a03843 	asr	r3, r3, #16
3000b084:	e1a04fc3 	asr	r4, r3, #31
3000b088:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b08c:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b090:	ea000014 	b	3000b0e8 <vsnprintf+0xa78>
		} else {
			num = va_arg(args, acoral_u32);
3000b094:	e59d3010 	ldr	r3, [sp, #16]
3000b098:	e2833004 	add	r3, r3, #4
3000b09c:	e58d3010 	str	r3, [sp, #16]
3000b0a0:	e59d3010 	ldr	r3, [sp, #16]
3000b0a4:	e2433004 	sub	r3, r3, #4
3000b0a8:	e5933000 	ldr	r3, [r3]
3000b0ac:	e3a04000 	mov	r4, #0
3000b0b0:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b0b4:	e58d402c 	str	r4, [sp, #44]	; 0x2c
			if (flags & SIGN)
3000b0b8:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
3000b0bc:	e2033002 	and	r3, r3, #2
3000b0c0:	e3530000 	cmp	r3, #0
3000b0c4:	0a000007 	beq	3000b0e8 <vsnprintf+0xa78>
				num = (acoral_32) num;
3000b0c8:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
3000b0cc:	e1a04fc3 	asr	r4, r3, #31
3000b0d0:	e58d3028 	str	r3, [sp, #40]	; 0x28
3000b0d4:	e58d402c 	str	r4, [sp, #44]	; 0x2c
3000b0d8:	ea000002 	b	3000b0e8 <vsnprintf+0xa78>
		if (qualifier == 'L')
			num = va_arg(args, acoral_64);
		else if (qualifier == 'l') {
			num = va_arg(args, acoral_u32);
			if (flags & SIGN)
				num = (acoral_32) num;
3000b0dc:	e1a00000 	nop			; (mov r0, r0)
3000b0e0:	ea000000 	b	3000b0e8 <vsnprintf+0xa78>
		} else if (qualifier == 'Z') {
			num = va_arg(args, acoral_u32);
		} else if (qualifier == 'h') {
			num = (acoral_u16) va_arg(args, acoral_32);
			if (flags & SIGN)
				num = (acoral_16) num;
3000b0e4:	e1a00000 	nop			; (mov r0, r0)
		} else {
			num = va_arg(args, acoral_u32);
			if (flags & SIGN)
				num = (acoral_32) num;
		}
		str = number(str, end, num, base,
3000b0e8:	e28d4028 	add	r4, sp, #40	; 0x28
3000b0ec:	e8940018 	ldm	r4, {r3, r4}
3000b0f0:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
3000b0f4:	e58d2000 	str	r2, [sp]
3000b0f8:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
3000b0fc:	e58d2004 	str	r2, [sp, #4]
3000b100:	e59d2054 	ldr	r2, [sp, #84]	; 0x54
3000b104:	e58d2008 	str	r2, [sp, #8]
3000b108:	e59d204c 	ldr	r2, [sp, #76]	; 0x4c
3000b10c:	e58d200c 	str	r2, [sp, #12]
3000b110:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
3000b114:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
3000b118:	e1a02003 	mov	r2, r3
3000b11c:	e1a03004 	mov	r3, r4
3000b120:	ebfffc0c 	bl	3000a158 <number>
3000b124:	e1a03000 	mov	r3, r0
3000b128:	e58d303c 	str	r3, [sp, #60]	; 0x3c
	if (end < buf - 1) {
		end = ((void *) -1);
		size = end - buf + 1;
	}

	for (; *fmt ; ++fmt) {
3000b12c:	e59d3014 	ldr	r3, [sp, #20]
3000b130:	e2833001 	add	r3, r3, #1
3000b134:	e58d3014 	str	r3, [sp, #20]
3000b138:	ea000000 	b	3000b140 <vsnprintf+0xad0>
3000b13c:	e1a00000 	nop			; (mov r0, r0)
3000b140:	e59d3014 	ldr	r3, [sp, #20]
3000b144:	e5d33000 	ldrb	r3, [r3]
3000b148:	e3530000 	cmp	r3, #0
3000b14c:	1afffd61 	bne	3000a6d8 <vsnprintf+0x68>
				num = (acoral_32) num;
		}
		str = number(str, end, num, base,
				field_width, precision, flags);
	}
	if (str <= end)
3000b150:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b154:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000b158:	e1520003 	cmp	r2, r3
3000b15c:	8a000003 	bhi	3000b170 <vsnprintf+0xb00>
		*str = '\0';
3000b160:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000b164:	e3a02000 	mov	r2, #0
3000b168:	e5c32000 	strb	r2, [r3]
3000b16c:	ea000005 	b	3000b188 <vsnprintf+0xb18>
	else if (size > 0)
3000b170:	e59d3018 	ldr	r3, [sp, #24]
3000b174:	e3530000 	cmp	r3, #0
3000b178:	0a000002 	beq	3000b188 <vsnprintf+0xb18>
		/* don't write out a null byte if the buf size is zero */
		*end = '\0';
3000b17c:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
3000b180:	e3a02000 	mov	r2, #0
3000b184:	e5c32000 	strb	r2, [r3]
	/* the trailing null byte doesn't count towards the total
	* ++str;
	*/
	return str-buf;
3000b188:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000b18c:	e59d301c 	ldr	r3, [sp, #28]
3000b190:	e0633002 	rsb	r3, r3, r2
}
3000b194:	e1a00003 	mov	r0, r3
3000b198:	e28dd068 	add	sp, sp, #104	; 0x68
3000b19c:	e8bd4010 	pop	{r4, lr}
3000b1a0:	e12fff1e 	bx	lr
3000b1a4:	3000e7e0 	.word	0x3000e7e0

3000b1a8 <acoral_sprint>:

acoral_32 acoral_sprint(acoral_char * buf, acoral_u32 size, const acoral_char *fmt, ...)
{
3000b1a8:	e92d000c 	push	{r2, r3}
3000b1ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b1b0:	e24dd014 	sub	sp, sp, #20
3000b1b4:	e58d0004 	str	r0, [sp, #4]
3000b1b8:	e58d1000 	str	r1, [sp]
	acoral_32 i;
	va_list args;
	va_start(args, fmt);
3000b1bc:	e28d3018 	add	r3, sp, #24
3000b1c0:	e2833004 	add	r3, r3, #4
3000b1c4:	e58d300c 	str	r3, [sp, #12]
	i=vsnprintf(buf,size,fmt,args);
3000b1c8:	e59d3018 	ldr	r3, [sp, #24]
3000b1cc:	e59d0004 	ldr	r0, [sp, #4]
3000b1d0:	e59d1000 	ldr	r1, [sp]
3000b1d4:	e1a02003 	mov	r2, r3
3000b1d8:	e59d300c 	ldr	r3, [sp, #12]
3000b1dc:	ebfffd23 	bl	3000a670 <vsnprintf>
3000b1e0:	e1a03000 	mov	r3, r0
3000b1e4:	e58d3008 	str	r3, [sp, #8]
	va_end(args);
3000b1e8:	e3a03000 	mov	r3, #0
3000b1ec:	e58d300c 	str	r3, [sp, #12]
	return i;
3000b1f0:	e59d3008 	ldr	r3, [sp, #8]
}
3000b1f4:	e1a00003 	mov	r0, r3
3000b1f8:	e28dd014 	add	sp, sp, #20
3000b1fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b200:	e28dd008 	add	sp, sp, #8
3000b204:	e12fff1e 	bx	lr

3000b208 <acoral_print>:

acoral_32 acoral_print(const acoral_char *fmt, ...)
{
3000b208:	e92d000f 	push	{r0, r1, r2, r3}
3000b20c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b210:	e24dd014 	sub	sp, sp, #20
	va_list args;
	acoral_32 printed_len;
	static acoral_char print_buf[256];
	va_start(args, fmt);
3000b214:	e28d3018 	add	r3, sp, #24
3000b218:	e2833004 	add	r3, r3, #4
3000b21c:	e58d3008 	str	r3, [sp, #8]
	printed_len =vsnprintf(print_buf, sizeof(print_buf), fmt, args);
3000b220:	e59d3018 	ldr	r3, [sp, #24]
3000b224:	e59f0060 	ldr	r0, [pc, #96]	; 3000b28c <acoral_print+0x84>
3000b228:	e3a01c01 	mov	r1, #256	; 0x100
3000b22c:	e1a02003 	mov	r2, r3
3000b230:	e59d3008 	ldr	r3, [sp, #8]
3000b234:	ebfffd0d 	bl	3000a670 <vsnprintf>
3000b238:	e1a03000 	mov	r3, r0
3000b23c:	e58d300c 	str	r3, [sp, #12]
	va_end(args);
3000b240:	e3a03000 	mov	r3, #0
3000b244:	e58d3008 	str	r3, [sp, #8]
	return acoral_dev_write(acoral_cur_thread->console_id,(void *)print_buf,printed_len,0,0);
3000b248:	e59f3040 	ldr	r3, [pc, #64]	; 3000b290 <acoral_print+0x88>
3000b24c:	e5933000 	ldr	r3, [r3]
3000b250:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b254:	e59d300c 	ldr	r3, [sp, #12]
3000b258:	e3a01000 	mov	r1, #0
3000b25c:	e58d1000 	str	r1, [sp]
3000b260:	e1a00002 	mov	r0, r2
3000b264:	e59f1020 	ldr	r1, [pc, #32]	; 3000b28c <acoral_print+0x84>
3000b268:	e1a02003 	mov	r2, r3
3000b26c:	e3a03000 	mov	r3, #0
3000b270:	eb000880 	bl	3000d478 <acoral_dev_write>
3000b274:	e1a03000 	mov	r3, r0
}
3000b278:	e1a00003 	mov	r0, r3
3000b27c:	e28dd014 	add	sp, sp, #20
3000b280:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b284:	e28dd010 	add	sp, sp, #16
3000b288:	e12fff1e 	bx	lr
3000b28c:	3000f248 	.word	0x3000f248
3000b290:	300103f8 	.word	0x300103f8

3000b294 <acoral_prints>:

acoral_32 acoral_prints(const acoral_char *str)
{
3000b294:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b298:	e24dd01c 	sub	sp, sp, #28
3000b29c:	e58d000c 	str	r0, [sp, #12]
	acoral_32 printed_len;
	printed_len=acoral_str_len(str);  
3000b2a0:	e59d000c 	ldr	r0, [sp, #12]
3000b2a4:	eb000115 	bl	3000b700 <acoral_str_len>
3000b2a8:	e1a03000 	mov	r3, r0
3000b2ac:	e58d3014 	str	r3, [sp, #20]
	return acoral_dev_write(acoral_cur_thread->console_id,(void *)str,printed_len,0,0);
3000b2b0:	e59f3038 	ldr	r3, [pc, #56]	; 3000b2f0 <acoral_prints+0x5c>
3000b2b4:	e5933000 	ldr	r3, [r3]
3000b2b8:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b2bc:	e59d3014 	ldr	r3, [sp, #20]
3000b2c0:	e3a01000 	mov	r1, #0
3000b2c4:	e58d1000 	str	r1, [sp]
3000b2c8:	e1a00002 	mov	r0, r2
3000b2cc:	e59d100c 	ldr	r1, [sp, #12]
3000b2d0:	e1a02003 	mov	r2, r3
3000b2d4:	e3a03000 	mov	r3, #0
3000b2d8:	eb000866 	bl	3000d478 <acoral_dev_write>
3000b2dc:	e1a03000 	mov	r3, r0
}
3000b2e0:	e1a00003 	mov	r0, r3
3000b2e4:	e28dd01c 	add	sp, sp, #28
3000b2e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b2ec:	e12fff1e 	bx	lr
3000b2f0:	300103f8 	.word	0x300103f8

3000b2f4 <acoral_getchar>:

acoral_char acoral_getchar(){
3000b2f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b2f8:	e24dd014 	sub	sp, sp, #20
	acoral_char c;
	acoral_dev_read(acoral_cur_thread->console_id,&c,1,0,0);
3000b2fc:	e59f3038 	ldr	r3, [pc, #56]	; 3000b33c <acoral_getchar+0x48>
3000b300:	e5933000 	ldr	r3, [r3]
3000b304:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b308:	e28d300f 	add	r3, sp, #15
3000b30c:	e3a01000 	mov	r1, #0
3000b310:	e58d1000 	str	r1, [sp]
3000b314:	e1a00002 	mov	r0, r2
3000b318:	e1a01003 	mov	r1, r3
3000b31c:	e3a02001 	mov	r2, #1
3000b320:	e3a03000 	mov	r3, #0
3000b324:	eb000879 	bl	3000d510 <acoral_dev_read>
	return c;
3000b328:	e5dd300f 	ldrb	r3, [sp, #15]
}
3000b32c:	e1a00003 	mov	r0, r3
3000b330:	e28dd014 	add	sp, sp, #20
3000b334:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b338:	e12fff1e 	bx	lr
3000b33c:	300103f8 	.word	0x300103f8

3000b340 <acoral_putchar>:

acoral_char acoral_putchar(acoral_char c){
3000b340:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b344:	e24dd014 	sub	sp, sp, #20
3000b348:	e1a03000 	mov	r3, r0
3000b34c:	e5cd300f 	strb	r3, [sp, #15]
	acoral_dev_write(acoral_cur_thread->console_id,&c,1,0,0);
3000b350:	e59f3038 	ldr	r3, [pc, #56]	; 3000b390 <acoral_putchar+0x50>
3000b354:	e5933000 	ldr	r3, [r3]
3000b358:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
3000b35c:	e28d300f 	add	r3, sp, #15
3000b360:	e3a01000 	mov	r1, #0
3000b364:	e58d1000 	str	r1, [sp]
3000b368:	e1a00002 	mov	r0, r2
3000b36c:	e1a01003 	mov	r1, r3
3000b370:	e3a02001 	mov	r2, #1
3000b374:	e3a03000 	mov	r3, #0
3000b378:	eb00083e 	bl	3000d478 <acoral_dev_write>
	return c;
3000b37c:	e5dd300f 	ldrb	r3, [sp, #15]
}
3000b380:	e1a00003 	mov	r0, r3
3000b384:	e28dd014 	add	sp, sp, #20
3000b388:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b38c:	e12fff1e 	bx	lr
3000b390:	300103f8 	.word	0x300103f8

3000b394 <acoral_debug>:

static acoral_id console_id=ACORAL_DEV_ERR_ID;
//======================
acoral_32 acoral_debug(const acoral_char *fmt, ...)
{
3000b394:	e92d000f 	push	{r0, r1, r2, r3}
3000b398:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b39c:	e24dd014 	sub	sp, sp, #20
	va_list args;
	acoral_32 printed_len;
	static acoral_char print_buf[1024];
	va_start(args, fmt);
3000b3a0:	e28d3018 	add	r3, sp, #24
3000b3a4:	e2833004 	add	r3, r3, #4
3000b3a8:	e58d3008 	str	r3, [sp, #8]
	printed_len =vsnprintf(print_buf, sizeof(print_buf), fmt, args);
3000b3ac:	e59d3018 	ldr	r3, [sp, #24]
3000b3b0:	e59f0094 	ldr	r0, [pc, #148]	; 3000b44c <acoral_debug+0xb8>
3000b3b4:	e3a01b01 	mov	r1, #1024	; 0x400
3000b3b8:	e1a02003 	mov	r2, r3
3000b3bc:	e59d3008 	ldr	r3, [sp, #8]
3000b3c0:	ebfffcaa 	bl	3000a670 <vsnprintf>
3000b3c4:	e1a03000 	mov	r3, r0
3000b3c8:	e58d300c 	str	r3, [sp, #12]
	va_end(args);
3000b3cc:	e3a03000 	mov	r3, #0
3000b3d0:	e58d3008 	str	r3, [sp, #8]
	if(console_id==ACORAL_DEV_ERR_ID){
3000b3d4:	e59f3074 	ldr	r3, [pc, #116]	; 3000b450 <acoral_debug+0xbc>
3000b3d8:	e5933000 	ldr	r3, [r3]
3000b3dc:	e3730001 	cmn	r3, #1
3000b3e0:	1a000009 	bne	3000b40c <acoral_debug+0x78>
		console_id=acoral_dev_open("console");
3000b3e4:	e59f0068 	ldr	r0, [pc, #104]	; 3000b454 <acoral_debug+0xc0>
3000b3e8:	eb0007fd 	bl	3000d3e4 <acoral_dev_open>
3000b3ec:	e1a02000 	mov	r2, r0
3000b3f0:	e59f3058 	ldr	r3, [pc, #88]	; 3000b450 <acoral_debug+0xbc>
3000b3f4:	e5832000 	str	r2, [r3]
		if(console_id==ACORAL_DEV_ERR_ID)
3000b3f8:	e59f3050 	ldr	r3, [pc, #80]	; 3000b450 <acoral_debug+0xbc>
3000b3fc:	e5933000 	ldr	r3, [r3]
3000b400:	e3730001 	cmn	r3, #1
3000b404:	1a000000 	bne	3000b40c <acoral_debug+0x78>
3000b408:	ea00000a 	b	3000b438 <acoral_debug+0xa4>
			return;
	}
	return acoral_dev_write(console_id,(void *)print_buf,printed_len,0,0);
3000b40c:	e59f303c 	ldr	r3, [pc, #60]	; 3000b450 <acoral_debug+0xbc>
3000b410:	e5932000 	ldr	r2, [r3]
3000b414:	e59d300c 	ldr	r3, [sp, #12]
3000b418:	e3a01000 	mov	r1, #0
3000b41c:	e58d1000 	str	r1, [sp]
3000b420:	e1a00002 	mov	r0, r2
3000b424:	e59f1020 	ldr	r1, [pc, #32]	; 3000b44c <acoral_debug+0xb8>
3000b428:	e1a02003 	mov	r2, r3
3000b42c:	e3a03000 	mov	r3, #0
3000b430:	eb000810 	bl	3000d478 <acoral_dev_write>
3000b434:	e1a03000 	mov	r3, r0
}
3000b438:	e1a00003 	mov	r0, r3
3000b43c:	e28dd014 	add	sp, sp, #20
3000b440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b444:	e28dd010 	add	sp, sp, #16
3000b448:	e12fff1e 	bx	lr
3000b44c:	3000ee48 	.word	0x3000ee48
3000b450:	3000ea78 	.word	0x3000ea78
3000b454:	3000e7e8 	.word	0x3000e7e8

3000b458 <acoral_debugs>:

acoral_32 acoral_debugs(const acoral_char *str)
{
3000b458:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b45c:	e24dd01c 	sub	sp, sp, #28
3000b460:	e58d000c 	str	r0, [sp, #12]
	acoral_32 printed_len;
	printed_len=acoral_str_len(str);  
3000b464:	e59d000c 	ldr	r0, [sp, #12]
3000b468:	eb0000a4 	bl	3000b700 <acoral_str_len>
3000b46c:	e1a03000 	mov	r3, r0
3000b470:	e58d3014 	str	r3, [sp, #20]
	if(console_id==ACORAL_DEV_ERR_ID){
3000b474:	e59f306c 	ldr	r3, [pc, #108]	; 3000b4e8 <acoral_debugs+0x90>
3000b478:	e5933000 	ldr	r3, [r3]
3000b47c:	e3730001 	cmn	r3, #1
3000b480:	1a000009 	bne	3000b4ac <acoral_debugs+0x54>
		console_id=acoral_dev_open("console");
3000b484:	e59f0060 	ldr	r0, [pc, #96]	; 3000b4ec <acoral_debugs+0x94>
3000b488:	eb0007d5 	bl	3000d3e4 <acoral_dev_open>
3000b48c:	e1a02000 	mov	r2, r0
3000b490:	e59f3050 	ldr	r3, [pc, #80]	; 3000b4e8 <acoral_debugs+0x90>
3000b494:	e5832000 	str	r2, [r3]
		if(console_id==ACORAL_DEV_ERR_ID)
3000b498:	e59f3048 	ldr	r3, [pc, #72]	; 3000b4e8 <acoral_debugs+0x90>
3000b49c:	e5933000 	ldr	r3, [r3]
3000b4a0:	e3730001 	cmn	r3, #1
3000b4a4:	1a000000 	bne	3000b4ac <acoral_debugs+0x54>
3000b4a8:	ea00000a 	b	3000b4d8 <acoral_debugs+0x80>
			return;
	}
	return acoral_dev_write(console_id,(void *)str,printed_len,0,0);
3000b4ac:	e59f3034 	ldr	r3, [pc, #52]	; 3000b4e8 <acoral_debugs+0x90>
3000b4b0:	e5932000 	ldr	r2, [r3]
3000b4b4:	e59d3014 	ldr	r3, [sp, #20]
3000b4b8:	e3a01000 	mov	r1, #0
3000b4bc:	e58d1000 	str	r1, [sp]
3000b4c0:	e1a00002 	mov	r0, r2
3000b4c4:	e59d100c 	ldr	r1, [sp, #12]
3000b4c8:	e1a02003 	mov	r2, r3
3000b4cc:	e3a03000 	mov	r3, #0
3000b4d0:	eb0007e8 	bl	3000d478 <acoral_dev_write>
3000b4d4:	e1a03000 	mov	r3, r0
}
3000b4d8:	e1a00003 	mov	r0, r3
3000b4dc:	e28dd01c 	add	sp, sp, #28
3000b4e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b4e4:	e12fff1e 	bx	lr
3000b4e8:	3000ea78 	.word	0x3000ea78
3000b4ec:	3000e7e8 	.word	0x3000e7e8

3000b4f0 <acoral_tolower>:
#include<string.h>

acoral_u8  acoral_tolower(acoral_u8 c){
3000b4f0:	e24dd008 	sub	sp, sp, #8
3000b4f4:	e1a03000 	mov	r3, r0
3000b4f8:	e5cd3007 	strb	r3, [sp, #7]
      if(IS_LOWER(c))
3000b4fc:	e5dd3007 	ldrb	r3, [sp, #7]
3000b500:	e3530060 	cmp	r3, #96	; 0x60
3000b504:	9a000004 	bls	3000b51c <acoral_tolower+0x2c>
3000b508:	e5dd3007 	ldrb	r3, [sp, #7]
3000b50c:	e353007a 	cmp	r3, #122	; 0x7a
3000b510:	8a000001 	bhi	3000b51c <acoral_tolower+0x2c>
        return c;
3000b514:	e5dd3007 	ldrb	r3, [sp, #7]
3000b518:	ea00000a 	b	3000b548 <acoral_tolower+0x58>
      else if(IS_UPPER(c))
3000b51c:	e5dd3007 	ldrb	r3, [sp, #7]
3000b520:	e3530040 	cmp	r3, #64	; 0x40
3000b524:	9a000006 	bls	3000b544 <acoral_tolower+0x54>
3000b528:	e5dd3007 	ldrb	r3, [sp, #7]
3000b52c:	e353005a 	cmp	r3, #90	; 0x5a
3000b530:	8a000003 	bhi	3000b544 <acoral_tolower+0x54>
        return (acoral_u8)(c+32);
3000b534:	e5dd3007 	ldrb	r3, [sp, #7]
3000b538:	e2833020 	add	r3, r3, #32
3000b53c:	e20330ff 	and	r3, r3, #255	; 0xff
3000b540:	ea000000 	b	3000b548 <acoral_tolower+0x58>
      else
        return FALSE; 
3000b544:	e3a03000 	mov	r3, #0
            
}
3000b548:	e1a00003 	mov	r0, r3
3000b54c:	e28dd008 	add	sp, sp, #8
3000b550:	e12fff1e 	bx	lr

3000b554 <acoral_toupper>:
acoral_u8  acoral_toupper(acoral_u8 c){
3000b554:	e24dd008 	sub	sp, sp, #8
3000b558:	e1a03000 	mov	r3, r0
3000b55c:	e5cd3007 	strb	r3, [sp, #7]
     if(IS_LOWER(c))
3000b560:	e5dd3007 	ldrb	r3, [sp, #7]
3000b564:	e3530060 	cmp	r3, #96	; 0x60
3000b568:	9a000006 	bls	3000b588 <acoral_toupper+0x34>
3000b56c:	e5dd3007 	ldrb	r3, [sp, #7]
3000b570:	e353007a 	cmp	r3, #122	; 0x7a
3000b574:	8a000003 	bhi	3000b588 <acoral_toupper+0x34>
        return (acoral_u8)(c-32);
3000b578:	e5dd3007 	ldrb	r3, [sp, #7]
3000b57c:	e2433020 	sub	r3, r3, #32
3000b580:	e20330ff 	and	r3, r3, #255	; 0xff
3000b584:	ea000008 	b	3000b5ac <acoral_toupper+0x58>
     else if(IS_UPPER(c))
3000b588:	e5dd3007 	ldrb	r3, [sp, #7]
3000b58c:	e3530040 	cmp	r3, #64	; 0x40
3000b590:	9a000004 	bls	3000b5a8 <acoral_toupper+0x54>
3000b594:	e5dd3007 	ldrb	r3, [sp, #7]
3000b598:	e353005a 	cmp	r3, #90	; 0x5a
3000b59c:	8a000001 	bhi	3000b5a8 <acoral_toupper+0x54>
        return c;
3000b5a0:	e5dd3007 	ldrb	r3, [sp, #7]
3000b5a4:	ea000000 	b	3000b5ac <acoral_toupper+0x58>
     else
        return FALSE; 
3000b5a8:	e3a03000 	mov	r3, #0
}
3000b5ac:	e1a00003 	mov	r0, r3
3000b5b0:	e28dd008 	add	sp, sp, #8
3000b5b4:	e12fff1e 	bx	lr

3000b5b8 <acoral_str_upr>:

acoral_char *acoral_str_upr(acoral_char *str){
3000b5b8:	e24dd010 	sub	sp, sp, #16
3000b5bc:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 i=0;
3000b5c0:	e3a03000 	mov	r3, #0
3000b5c4:	e58d3008 	str	r3, [sp, #8]
	acoral_char *s=str;
3000b5c8:	e59d3004 	ldr	r3, [sp, #4]
3000b5cc:	e58d300c 	str	r3, [sp, #12]
	while(s[i]!='\0'){
3000b5d0:	ea000018 	b	3000b638 <acoral_str_upr+0x80>
		if(s[i]>='a'&&s[i]<='z')
3000b5d4:	e59d200c 	ldr	r2, [sp, #12]
3000b5d8:	e59d3008 	ldr	r3, [sp, #8]
3000b5dc:	e0823003 	add	r3, r2, r3
3000b5e0:	e5d33000 	ldrb	r3, [r3]
3000b5e4:	e3530060 	cmp	r3, #96	; 0x60
3000b5e8:	9a00000f 	bls	3000b62c <acoral_str_upr+0x74>
3000b5ec:	e59d200c 	ldr	r2, [sp, #12]
3000b5f0:	e59d3008 	ldr	r3, [sp, #8]
3000b5f4:	e0823003 	add	r3, r2, r3
3000b5f8:	e5d33000 	ldrb	r3, [r3]
3000b5fc:	e353007a 	cmp	r3, #122	; 0x7a
3000b600:	8a000009 	bhi	3000b62c <acoral_str_upr+0x74>
			s[i]-=32;
3000b604:	e59d200c 	ldr	r2, [sp, #12]
3000b608:	e59d3008 	ldr	r3, [sp, #8]
3000b60c:	e0823003 	add	r3, r2, r3
3000b610:	e59d100c 	ldr	r1, [sp, #12]
3000b614:	e59d2008 	ldr	r2, [sp, #8]
3000b618:	e0812002 	add	r2, r1, r2
3000b61c:	e5d22000 	ldrb	r2, [r2]
3000b620:	e2422020 	sub	r2, r2, #32
3000b624:	e20220ff 	and	r2, r2, #255	; 0xff
3000b628:	e5c32000 	strb	r2, [r3]
		i++;
3000b62c:	e59d3008 	ldr	r3, [sp, #8]
3000b630:	e2833001 	add	r3, r3, #1
3000b634:	e58d3008 	str	r3, [sp, #8]
}

acoral_char *acoral_str_upr(acoral_char *str){
	acoral_u32 i=0;
	acoral_char *s=str;
	while(s[i]!='\0'){
3000b638:	e59d200c 	ldr	r2, [sp, #12]
3000b63c:	e59d3008 	ldr	r3, [sp, #8]
3000b640:	e0823003 	add	r3, r2, r3
3000b644:	e5d33000 	ldrb	r3, [r3]
3000b648:	e3530000 	cmp	r3, #0
3000b64c:	1affffe0 	bne	3000b5d4 <acoral_str_upr+0x1c>
		if(s[i]>='a'&&s[i]<='z')
			s[i]-=32;
		i++;
	} 
	return str;
3000b650:	e59d3004 	ldr	r3, [sp, #4]
}
3000b654:	e1a00003 	mov	r0, r3
3000b658:	e28dd010 	add	sp, sp, #16
3000b65c:	e12fff1e 	bx	lr

3000b660 <acoral_str_lwr>:

acoral_char *acoral_str_lwr(acoral_char *s){
3000b660:	e24dd010 	sub	sp, sp, #16
3000b664:	e58d0004 	str	r0, [sp, #4]
	acoral_u32 i=0;
3000b668:	e3a03000 	mov	r3, #0
3000b66c:	e58d300c 	str	r3, [sp, #12]
	while(s[i]!='\0'){
3000b670:	ea000018 	b	3000b6d8 <acoral_str_lwr+0x78>
		if(s[i]>='A'&&s[i]<='Z')
3000b674:	e59d2004 	ldr	r2, [sp, #4]
3000b678:	e59d300c 	ldr	r3, [sp, #12]
3000b67c:	e0823003 	add	r3, r2, r3
3000b680:	e5d33000 	ldrb	r3, [r3]
3000b684:	e3530040 	cmp	r3, #64	; 0x40
3000b688:	9a00000f 	bls	3000b6cc <acoral_str_lwr+0x6c>
3000b68c:	e59d2004 	ldr	r2, [sp, #4]
3000b690:	e59d300c 	ldr	r3, [sp, #12]
3000b694:	e0823003 	add	r3, r2, r3
3000b698:	e5d33000 	ldrb	r3, [r3]
3000b69c:	e353005a 	cmp	r3, #90	; 0x5a
3000b6a0:	8a000009 	bhi	3000b6cc <acoral_str_lwr+0x6c>
			s[i]+=32;
3000b6a4:	e59d2004 	ldr	r2, [sp, #4]
3000b6a8:	e59d300c 	ldr	r3, [sp, #12]
3000b6ac:	e0823003 	add	r3, r2, r3
3000b6b0:	e59d1004 	ldr	r1, [sp, #4]
3000b6b4:	e59d200c 	ldr	r2, [sp, #12]
3000b6b8:	e0812002 	add	r2, r1, r2
3000b6bc:	e5d22000 	ldrb	r2, [r2]
3000b6c0:	e2822020 	add	r2, r2, #32
3000b6c4:	e20220ff 	and	r2, r2, #255	; 0xff
3000b6c8:	e5c32000 	strb	r2, [r3]
		i++;
3000b6cc:	e59d300c 	ldr	r3, [sp, #12]
3000b6d0:	e2833001 	add	r3, r3, #1
3000b6d4:	e58d300c 	str	r3, [sp, #12]
	return str;
}

acoral_char *acoral_str_lwr(acoral_char *s){
	acoral_u32 i=0;
	while(s[i]!='\0'){
3000b6d8:	e59d2004 	ldr	r2, [sp, #4]
3000b6dc:	e59d300c 	ldr	r3, [sp, #12]
3000b6e0:	e0823003 	add	r3, r2, r3
3000b6e4:	e5d33000 	ldrb	r3, [r3]
3000b6e8:	e3530000 	cmp	r3, #0
3000b6ec:	1affffe0 	bne	3000b674 <acoral_str_lwr+0x14>
		if(s[i]>='A'&&s[i]<='Z')
			s[i]+=32;
		i++;
	} 
	return s;
3000b6f0:	e59d3004 	ldr	r3, [sp, #4]
}
3000b6f4:	e1a00003 	mov	r0, r3
3000b6f8:	e28dd010 	add	sp, sp, #16
3000b6fc:	e12fff1e 	bx	lr

3000b700 <acoral_str_len>:

acoral_u32 acoral_str_len(const acoral_char *str)  
{  
3000b700:	e24dd010 	sub	sp, sp, #16
3000b704:	e58d0004 	str	r0, [sp, #4]
  acoral_u32  i=0;  
3000b708:	e3a03000 	mov	r3, #0
3000b70c:	e58d3008 	str	r3, [sp, #8]
  const acoral_char *p=str;
3000b710:	e59d3004 	ldr	r3, [sp, #4]
3000b714:	e58d300c 	str	r3, [sp, #12]
  while(*p++)  
3000b718:	ea000002 	b	3000b728 <acoral_str_len+0x28>
      i++;  
3000b71c:	e59d3008 	ldr	r3, [sp, #8]
3000b720:	e2833001 	add	r3, r3, #1
3000b724:	e58d3008 	str	r3, [sp, #8]

acoral_u32 acoral_str_len(const acoral_char *str)  
{  
  acoral_u32  i=0;  
  const acoral_char *p=str;
  while(*p++)  
3000b728:	e59d300c 	ldr	r3, [sp, #12]
3000b72c:	e5d33000 	ldrb	r3, [r3]
3000b730:	e3530000 	cmp	r3, #0
3000b734:	03a03000 	moveq	r3, #0
3000b738:	13a03001 	movne	r3, #1
3000b73c:	e20330ff 	and	r3, r3, #255	; 0xff
3000b740:	e59d200c 	ldr	r2, [sp, #12]
3000b744:	e2822001 	add	r2, r2, #1
3000b748:	e58d200c 	str	r2, [sp, #12]
3000b74c:	e3530000 	cmp	r3, #0
3000b750:	1afffff1 	bne	3000b71c <acoral_str_len+0x1c>
      i++;  
  return  i;  
3000b754:	e59d3008 	ldr	r3, [sp, #8]
}
3000b758:	e1a00003 	mov	r0, r3
3000b75c:	e28dd010 	add	sp, sp, #16
3000b760:	e12fff1e 	bx	lr

3000b764 <acoral_str_cpy>:

acoral_char *acoral_str_cpy(acoral_char *to, const acoral_char *from)
{
3000b764:	e24dd010 	sub	sp, sp, #16
3000b768:	e58d0004 	str	r0, [sp, #4]
3000b76c:	e58d1000 	str	r1, [sp]
    acoral_char *rev = to;
3000b770:	e59d3004 	ldr	r3, [sp, #4]
3000b774:	e58d300c 	str	r3, [sp, #12]
    while(*to++ = *from++);
3000b778:	e59d3000 	ldr	r3, [sp]
3000b77c:	e5d32000 	ldrb	r2, [r3]
3000b780:	e59d3004 	ldr	r3, [sp, #4]
3000b784:	e5c32000 	strb	r2, [r3]
3000b788:	e59d3004 	ldr	r3, [sp, #4]
3000b78c:	e5d33000 	ldrb	r3, [r3]
3000b790:	e3530000 	cmp	r3, #0
3000b794:	03a03000 	moveq	r3, #0
3000b798:	13a03001 	movne	r3, #1
3000b79c:	e20330ff 	and	r3, r3, #255	; 0xff
3000b7a0:	e59d2004 	ldr	r2, [sp, #4]
3000b7a4:	e2822001 	add	r2, r2, #1
3000b7a8:	e58d2004 	str	r2, [sp, #4]
3000b7ac:	e59d2000 	ldr	r2, [sp]
3000b7b0:	e2822001 	add	r2, r2, #1
3000b7b4:	e58d2000 	str	r2, [sp]
3000b7b8:	e3530000 	cmp	r3, #0
3000b7bc:	1affffed 	bne	3000b778 <acoral_str_cpy+0x14>
    return rev;
3000b7c0:	e59d300c 	ldr	r3, [sp, #12]
}
3000b7c4:	e1a00003 	mov	r0, r3
3000b7c8:	e28dd010 	add	sp, sp, #16
3000b7cc:	e12fff1e 	bx	lr

3000b7d0 <acoral_str_cmp>:

acoral_u32 acoral_str_cmp(const acoral_char * des,const  acoral_char * src)
{
3000b7d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b7d4:	e24dd01c 	sub	sp, sp, #28
3000b7d8:	e58d0004 	str	r0, [sp, #4]
3000b7dc:	e58d1000 	str	r1, [sp]
    acoral_u32 c;
    acoral_u32 len1;
    acoral_u32 len2;
    if(des == NULL || src == NULL)
3000b7e0:	e59d3004 	ldr	r3, [sp, #4]
3000b7e4:	e3530000 	cmp	r3, #0
3000b7e8:	0a000002 	beq	3000b7f8 <acoral_str_cmp+0x28>
3000b7ec:	e59d3000 	ldr	r3, [sp]
3000b7f0:	e3530000 	cmp	r3, #0
3000b7f4:	1a000001 	bne	3000b800 <acoral_str_cmp+0x30>
      	return -1;	
3000b7f8:	e3e03000 	mvn	r3, #0
3000b7fc:	ea00002b 	b	3000b8b0 <acoral_str_cmp+0xe0>
    len1 = acoral_str_len(des);
3000b800:	e59d0004 	ldr	r0, [sp, #4]
3000b804:	ebffffbd 	bl	3000b700 <acoral_str_len>
3000b808:	e1a03000 	mov	r3, r0
3000b80c:	e58d3010 	str	r3, [sp, #16]
    len2 = acoral_str_len(src);
3000b810:	e59d0000 	ldr	r0, [sp]
3000b814:	ebffffb9 	bl	3000b700 <acoral_str_len>
3000b818:	e1a03000 	mov	r3, r0
3000b81c:	e58d3014 	str	r3, [sp, #20]
    if(len1 != len2)
3000b820:	e59d2010 	ldr	r2, [sp, #16]
3000b824:	e59d3014 	ldr	r3, [sp, #20]
3000b828:	e1520003 	cmp	r2, r3
3000b82c:	0a000019 	beq	3000b898 <acoral_str_cmp+0xc8>
    {
        return len1-len2;
3000b830:	e59d2010 	ldr	r2, [sp, #16]
3000b834:	e59d3014 	ldr	r3, [sp, #20]
3000b838:	e0633002 	rsb	r3, r3, r2
3000b83c:	ea00001b 	b	3000b8b0 <acoral_str_cmp+0xe0>
    }
    while(*des != '\0')
    {
        if((c=(*des++ - * src++)) != 0)
3000b840:	e59d3004 	ldr	r3, [sp, #4]
3000b844:	e5d33000 	ldrb	r3, [r3]
3000b848:	e1a02003 	mov	r2, r3
3000b84c:	e59d3000 	ldr	r3, [sp]
3000b850:	e5d33000 	ldrb	r3, [r3]
3000b854:	e0633002 	rsb	r3, r3, r2
3000b858:	e58d300c 	str	r3, [sp, #12]
3000b85c:	e59d300c 	ldr	r3, [sp, #12]
3000b860:	e3530000 	cmp	r3, #0
3000b864:	03a03000 	moveq	r3, #0
3000b868:	13a03001 	movne	r3, #1
3000b86c:	e20330ff 	and	r3, r3, #255	; 0xff
3000b870:	e59d2004 	ldr	r2, [sp, #4]
3000b874:	e2822001 	add	r2, r2, #1
3000b878:	e58d2004 	str	r2, [sp, #4]
3000b87c:	e59d2000 	ldr	r2, [sp]
3000b880:	e2822001 	add	r2, r2, #1
3000b884:	e58d2000 	str	r2, [sp]
3000b888:	e3530000 	cmp	r3, #0
3000b88c:	0a000002 	beq	3000b89c <acoral_str_cmp+0xcc>
        {
            return c;
3000b890:	e59d300c 	ldr	r3, [sp, #12]
3000b894:	ea000005 	b	3000b8b0 <acoral_str_cmp+0xe0>
    len2 = acoral_str_len(src);
    if(len1 != len2)
    {
        return len1-len2;
    }
    while(*des != '\0')
3000b898:	e1a00000 	nop			; (mov r0, r0)
3000b89c:	e59d3004 	ldr	r3, [sp, #4]
3000b8a0:	e5d33000 	ldrb	r3, [r3]
3000b8a4:	e3530000 	cmp	r3, #0
3000b8a8:	1affffe4 	bne	3000b840 <acoral_str_cmp+0x70>
        if((c=(*des++ - * src++)) != 0)
        {
            return c;
        }
    }
    return c;
3000b8ac:	e59d300c 	ldr	r3, [sp, #12]
}
3000b8b0:	e1a00003 	mov	r0, r3
3000b8b4:	e28dd01c 	add	sp, sp, #28
3000b8b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b8bc:	e12fff1e 	bx	lr

3000b8c0 <acoral_str_nicmp>:
 * @s1: One string
 * @s2: The other string
 * @len: the maximum number of characters to compare
 */
acoral_32 acoral_str_nicmp(const acoral_char *s1, const acoral_char *s2, acoral_u32 len)
{
3000b8c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000b8c4:	e24dd01c 	sub	sp, sp, #28
3000b8c8:	e58d000c 	str	r0, [sp, #12]
3000b8cc:	e58d1008 	str	r1, [sp, #8]
3000b8d0:	e58d2004 	str	r2, [sp, #4]
	/* Yes, Virginia, it had better be unsigned */
	acoral_u8 c1, c2;

	c1 = 0;	c2 = 0;
3000b8d4:	e3a03000 	mov	r3, #0
3000b8d8:	e5cd3016 	strb	r3, [sp, #22]
3000b8dc:	e3a03000 	mov	r3, #0
3000b8e0:	e5cd3017 	strb	r3, [sp, #23]
	if (len) {
3000b8e4:	e59d3004 	ldr	r3, [sp, #4]
3000b8e8:	e3530000 	cmp	r3, #0
3000b8ec:	0a000031 	beq	3000b9b8 <acoral_str_nicmp+0xf8>
		do {
			c1 = *s1; c2 = *s2;
3000b8f0:	e59d300c 	ldr	r3, [sp, #12]
3000b8f4:	e5d33000 	ldrb	r3, [r3]
3000b8f8:	e5cd3016 	strb	r3, [sp, #22]
3000b8fc:	e59d3008 	ldr	r3, [sp, #8]
3000b900:	e5d33000 	ldrb	r3, [r3]
3000b904:	e5cd3017 	strb	r3, [sp, #23]
			s1++; s2++;
3000b908:	e59d300c 	ldr	r3, [sp, #12]
3000b90c:	e2833001 	add	r3, r3, #1
3000b910:	e58d300c 	str	r3, [sp, #12]
3000b914:	e59d3008 	ldr	r3, [sp, #8]
3000b918:	e2833001 	add	r3, r3, #1
3000b91c:	e58d3008 	str	r3, [sp, #8]
			if (!c1)
3000b920:	e5dd3016 	ldrb	r3, [sp, #22]
3000b924:	e3530000 	cmp	r3, #0
3000b928:	0a00001d 	beq	3000b9a4 <acoral_str_nicmp+0xe4>
				break;
			if (!c2)
3000b92c:	e5dd3017 	ldrb	r3, [sp, #23]
3000b930:	e3530000 	cmp	r3, #0
3000b934:	0a00001c 	beq	3000b9ac <acoral_str_nicmp+0xec>
				break;
			if (c1 == c2)
3000b938:	e5dd2016 	ldrb	r2, [sp, #22]
3000b93c:	e5dd3017 	ldrb	r3, [sp, #23]
3000b940:	e1520003 	cmp	r2, r3
3000b944:	0a00000e 	beq	3000b984 <acoral_str_nicmp+0xc4>
				continue;
			c1 = acoral_tolower(c1);
3000b948:	e5dd3016 	ldrb	r3, [sp, #22]
3000b94c:	e1a00003 	mov	r0, r3
3000b950:	ebfffee6 	bl	3000b4f0 <acoral_tolower>
3000b954:	e1a03000 	mov	r3, r0
3000b958:	e5cd3016 	strb	r3, [sp, #22]
			c2 = acoral_tolower(c2);
3000b95c:	e5dd3017 	ldrb	r3, [sp, #23]
3000b960:	e1a00003 	mov	r0, r3
3000b964:	ebfffee1 	bl	3000b4f0 <acoral_tolower>
3000b968:	e1a03000 	mov	r3, r0
3000b96c:	e5cd3017 	strb	r3, [sp, #23]
			if (c1 != c2)
3000b970:	e5dd2016 	ldrb	r2, [sp, #22]
3000b974:	e5dd3017 	ldrb	r3, [sp, #23]
3000b978:	e1520003 	cmp	r2, r3
3000b97c:	1a00000c 	bne	3000b9b4 <acoral_str_nicmp+0xf4>
3000b980:	ea000000 	b	3000b988 <acoral_str_nicmp+0xc8>
			if (!c1)
				break;
			if (!c2)
				break;
			if (c1 == c2)
				continue;
3000b984:	e1a00000 	nop			; (mov r0, r0)
			c1 = acoral_tolower(c1);
			c2 = acoral_tolower(c2);
			if (c1 != c2)
				break;
		} while (--len);
3000b988:	e59d3004 	ldr	r3, [sp, #4]
3000b98c:	e2433001 	sub	r3, r3, #1
3000b990:	e58d3004 	str	r3, [sp, #4]
3000b994:	e59d3004 	ldr	r3, [sp, #4]
3000b998:	e3530000 	cmp	r3, #0
3000b99c:	1affffd3 	bne	3000b8f0 <acoral_str_nicmp+0x30>
3000b9a0:	ea000004 	b	3000b9b8 <acoral_str_nicmp+0xf8>
	if (len) {
		do {
			c1 = *s1; c2 = *s2;
			s1++; s2++;
			if (!c1)
				break;
3000b9a4:	e1a00000 	nop			; (mov r0, r0)
3000b9a8:	ea000002 	b	3000b9b8 <acoral_str_nicmp+0xf8>
			if (!c2)
				break;
3000b9ac:	e1a00000 	nop			; (mov r0, r0)
3000b9b0:	ea000000 	b	3000b9b8 <acoral_str_nicmp+0xf8>
			if (c1 == c2)
				continue;
			c1 = acoral_tolower(c1);
			c2 = acoral_tolower(c2);
			if (c1 != c2)
				break;
3000b9b4:	e1a00000 	nop			; (mov r0, r0)
		} while (--len);
	}
	return (acoral_32)c1 - (acoral_32)c2;
3000b9b8:	e5dd2016 	ldrb	r2, [sp, #22]
3000b9bc:	e5dd3017 	ldrb	r3, [sp, #23]
3000b9c0:	e0633002 	rsb	r3, r3, r2
}
3000b9c4:	e1a00003 	mov	r0, r3
3000b9c8:	e28dd01c 	add	sp, sp, #28
3000b9cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000b9d0:	e12fff1e 	bx	lr

3000b9d4 <acoral_str_ncpy>:
 *
 * The result is not %NUL-terminated if the source exceeds
 * @count bytes.
 */
acoral_char * acoral_str_ncpy(acoral_char * dest,const acoral_char *src,acoral_u32 count)
{
3000b9d4:	e24dd018 	sub	sp, sp, #24
3000b9d8:	e58d000c 	str	r0, [sp, #12]
3000b9dc:	e58d1008 	str	r1, [sp, #8]
3000b9e0:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp = dest;
3000b9e4:	e59d300c 	ldr	r3, [sp, #12]
3000b9e8:	e58d3014 	str	r3, [sp, #20]

	while (count) {
3000b9ec:	ea000012 	b	3000ba3c <acoral_str_ncpy+0x68>
		if ((*tmp = *src) == '\0')
3000b9f0:	e59d3008 	ldr	r3, [sp, #8]
3000b9f4:	e5d32000 	ldrb	r2, [r3]
3000b9f8:	e59d3014 	ldr	r3, [sp, #20]
3000b9fc:	e5c32000 	strb	r2, [r3]
3000ba00:	e59d3014 	ldr	r3, [sp, #20]
3000ba04:	e5d33000 	ldrb	r3, [r3]
3000ba08:	e3530000 	cmp	r3, #0
3000ba0c:	1a000001 	bne	3000ba18 <acoral_str_ncpy+0x44>
			return dest;
3000ba10:	e59d300c 	ldr	r3, [sp, #12]
3000ba14:	ea00000f 	b	3000ba58 <acoral_str_ncpy+0x84>
		src++;
3000ba18:	e59d3008 	ldr	r3, [sp, #8]
3000ba1c:	e2833001 	add	r3, r3, #1
3000ba20:	e58d3008 	str	r3, [sp, #8]
		tmp++;
3000ba24:	e59d3014 	ldr	r3, [sp, #20]
3000ba28:	e2833001 	add	r3, r3, #1
3000ba2c:	e58d3014 	str	r3, [sp, #20]
		count--;
3000ba30:	e59d3004 	ldr	r3, [sp, #4]
3000ba34:	e2433001 	sub	r3, r3, #1
3000ba38:	e58d3004 	str	r3, [sp, #4]
 */
acoral_char * acoral_str_ncpy(acoral_char * dest,const acoral_char *src,acoral_u32 count)
{
	acoral_char *tmp = dest;

	while (count) {
3000ba3c:	e59d3004 	ldr	r3, [sp, #4]
3000ba40:	e3530000 	cmp	r3, #0
3000ba44:	1affffe9 	bne	3000b9f0 <acoral_str_ncpy+0x1c>
			return dest;
		src++;
		tmp++;
		count--;
	}
	*tmp = '\0';
3000ba48:	e59d3014 	ldr	r3, [sp, #20]
3000ba4c:	e3a02000 	mov	r2, #0
3000ba50:	e5c32000 	strb	r2, [r3]
	return dest;
3000ba54:	e59d300c 	ldr	r3, [sp, #12]
}
3000ba58:	e1a00003 	mov	r0, r3
3000ba5c:	e28dd018 	add	sp, sp, #24
3000ba60:	e12fff1e 	bx	lr

3000ba64 <acoral_str_lcpy>:
 * NUL-terminated string that fits in the buffer (unless,
 * of course, the buffer size is zero). It does not pad
 * out the result like acoral_str_ncpy() does.
 */
acoral_u32 acoral_str_lcpy(acoral_char *dest, const acoral_char *src, acoral_u32 size)
{
3000ba64:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000ba68:	e24dd01c 	sub	sp, sp, #28
3000ba6c:	e58d000c 	str	r0, [sp, #12]
3000ba70:	e58d1008 	str	r1, [sp, #8]
3000ba74:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 ret = acoral_str_len(src);
3000ba78:	e59d0008 	ldr	r0, [sp, #8]
3000ba7c:	ebffff1f 	bl	3000b700 <acoral_str_len>
3000ba80:	e1a03000 	mov	r3, r0
3000ba84:	e58d3010 	str	r3, [sp, #16]

	if (size) {
3000ba88:	e59d3004 	ldr	r3, [sp, #4]
3000ba8c:	e3530000 	cmp	r3, #0
3000ba90:	0a000011 	beq	3000badc <acoral_str_lcpy+0x78>
		acoral_u32 len = (ret >= size) ? size-1 : ret;
3000ba94:	e59d2010 	ldr	r2, [sp, #16]
3000ba98:	e59d3004 	ldr	r3, [sp, #4]
3000ba9c:	e1520003 	cmp	r2, r3
3000baa0:	3a000002 	bcc	3000bab0 <acoral_str_lcpy+0x4c>
3000baa4:	e59d3004 	ldr	r3, [sp, #4]
3000baa8:	e2433001 	sub	r3, r3, #1
3000baac:	ea000000 	b	3000bab4 <acoral_str_lcpy+0x50>
3000bab0:	e59d3010 	ldr	r3, [sp, #16]
3000bab4:	e58d3014 	str	r3, [sp, #20]
		acoral_memcpy(dest, src, len);
3000bab8:	e59d000c 	ldr	r0, [sp, #12]
3000babc:	e59d1008 	ldr	r1, [sp, #8]
3000bac0:	e59d2014 	ldr	r2, [sp, #20]
3000bac4:	eb0001f6 	bl	3000c2a4 <acoral_memcpy>
		dest[len] = '\0';
3000bac8:	e59d200c 	ldr	r2, [sp, #12]
3000bacc:	e59d3014 	ldr	r3, [sp, #20]
3000bad0:	e0823003 	add	r3, r2, r3
3000bad4:	e3a02000 	mov	r2, #0
3000bad8:	e5c32000 	strb	r2, [r3]
	}
	return ret;
3000badc:	e59d3010 	ldr	r3, [sp, #16]
}
3000bae0:	e1a00003 	mov	r0, r3
3000bae4:	e28dd01c 	add	sp, sp, #28
3000bae8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000baec:	e12fff1e 	bx	lr

3000baf0 <acoral_str_cat>:
 * acoral_str_cat - Append one %NUL-terminated string to another
 * @dest: The string to be appended to
 * @src: The string to append to it
 */
acoral_char * acoral_str_cat(acoral_char * dest, const acoral_char * src)
{
3000baf0:	e24dd010 	sub	sp, sp, #16
3000baf4:	e58d0004 	str	r0, [sp, #4]
3000baf8:	e58d1000 	str	r1, [sp]
	acoral_char *tmp = dest;
3000bafc:	e59d3004 	ldr	r3, [sp, #4]
3000bb00:	e58d300c 	str	r3, [sp, #12]

	while (*dest)
3000bb04:	ea000002 	b	3000bb14 <acoral_str_cat+0x24>
		dest++;
3000bb08:	e59d3004 	ldr	r3, [sp, #4]
3000bb0c:	e2833001 	add	r3, r3, #1
3000bb10:	e58d3004 	str	r3, [sp, #4]
 */
acoral_char * acoral_str_cat(acoral_char * dest, const acoral_char * src)
{
	acoral_char *tmp = dest;

	while (*dest)
3000bb14:	e59d3004 	ldr	r3, [sp, #4]
3000bb18:	e5d33000 	ldrb	r3, [r3]
3000bb1c:	e3530000 	cmp	r3, #0
3000bb20:	1afffff8 	bne	3000bb08 <acoral_str_cat+0x18>
		dest++;
	while ((*dest++ = *src++) != '\0')
3000bb24:	e59d3000 	ldr	r3, [sp]
3000bb28:	e5d32000 	ldrb	r2, [r3]
3000bb2c:	e59d3004 	ldr	r3, [sp, #4]
3000bb30:	e5c32000 	strb	r2, [r3]
3000bb34:	e59d3004 	ldr	r3, [sp, #4]
3000bb38:	e5d33000 	ldrb	r3, [r3]
3000bb3c:	e3530000 	cmp	r3, #0
3000bb40:	03a03000 	moveq	r3, #0
3000bb44:	13a03001 	movne	r3, #1
3000bb48:	e20330ff 	and	r3, r3, #255	; 0xff
3000bb4c:	e59d2004 	ldr	r2, [sp, #4]
3000bb50:	e2822001 	add	r2, r2, #1
3000bb54:	e58d2004 	str	r2, [sp, #4]
3000bb58:	e59d2000 	ldr	r2, [sp]
3000bb5c:	e2822001 	add	r2, r2, #1
3000bb60:	e58d2000 	str	r2, [sp]
3000bb64:	e3530000 	cmp	r3, #0
3000bb68:	1affffed 	bne	3000bb24 <acoral_str_cat+0x34>
		;

	return tmp;
3000bb6c:	e59d300c 	ldr	r3, [sp, #12]
}
3000bb70:	e1a00003 	mov	r0, r3
3000bb74:	e28dd010 	add	sp, sp, #16
3000bb78:	e12fff1e 	bx	lr

3000bb7c <acoral_str_ncat>:
 *
 * Note that in contrast to acoral_str_ncpy, acoral_str_ncat ensures the result is
 * terminated.
 */
acoral_char * acoral_str_ncat(acoral_char *dest, const acoral_char *src, acoral_u32 count)
{
3000bb7c:	e24dd018 	sub	sp, sp, #24
3000bb80:	e58d000c 	str	r0, [sp, #12]
3000bb84:	e58d1008 	str	r1, [sp, #8]
3000bb88:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp = dest;
3000bb8c:	e59d300c 	ldr	r3, [sp, #12]
3000bb90:	e58d3014 	str	r3, [sp, #20]

	if (count) {
3000bb94:	e59d3004 	ldr	r3, [sp, #4]
3000bb98:	e3530000 	cmp	r3, #0
3000bb9c:	0a000024 	beq	3000bc34 <acoral_str_ncat+0xb8>
		while (*dest)
3000bba0:	ea000002 	b	3000bbb0 <acoral_str_ncat+0x34>
			dest++;
3000bba4:	e59d300c 	ldr	r3, [sp, #12]
3000bba8:	e2833001 	add	r3, r3, #1
3000bbac:	e58d300c 	str	r3, [sp, #12]
acoral_char * acoral_str_ncat(acoral_char *dest, const acoral_char *src, acoral_u32 count)
{
	acoral_char *tmp = dest;

	if (count) {
		while (*dest)
3000bbb0:	e59d300c 	ldr	r3, [sp, #12]
3000bbb4:	e5d33000 	ldrb	r3, [r3]
3000bbb8:	e3530000 	cmp	r3, #0
3000bbbc:	1afffff8 	bne	3000bba4 <acoral_str_ncat+0x28>
			dest++;
		while ((*dest++ = *src++) != 0) {
3000bbc0:	ea000009 	b	3000bbec <acoral_str_ncat+0x70>
			if (--count == 0) {
3000bbc4:	e59d3004 	ldr	r3, [sp, #4]
3000bbc8:	e2433001 	sub	r3, r3, #1
3000bbcc:	e58d3004 	str	r3, [sp, #4]
3000bbd0:	e59d3004 	ldr	r3, [sp, #4]
3000bbd4:	e3530000 	cmp	r3, #0
3000bbd8:	1a000003 	bne	3000bbec <acoral_str_ncat+0x70>
				*dest = '\0';
3000bbdc:	e59d300c 	ldr	r3, [sp, #12]
3000bbe0:	e3a02000 	mov	r2, #0
3000bbe4:	e5c32000 	strb	r2, [r3]
				break;
3000bbe8:	ea000011 	b	3000bc34 <acoral_str_ncat+0xb8>
	acoral_char *tmp = dest;

	if (count) {
		while (*dest)
			dest++;
		while ((*dest++ = *src++) != 0) {
3000bbec:	e59d3008 	ldr	r3, [sp, #8]
3000bbf0:	e5d32000 	ldrb	r2, [r3]
3000bbf4:	e59d300c 	ldr	r3, [sp, #12]
3000bbf8:	e5c32000 	strb	r2, [r3]
3000bbfc:	e59d300c 	ldr	r3, [sp, #12]
3000bc00:	e5d33000 	ldrb	r3, [r3]
3000bc04:	e3530000 	cmp	r3, #0
3000bc08:	03a03000 	moveq	r3, #0
3000bc0c:	13a03001 	movne	r3, #1
3000bc10:	e20330ff 	and	r3, r3, #255	; 0xff
3000bc14:	e59d200c 	ldr	r2, [sp, #12]
3000bc18:	e2822001 	add	r2, r2, #1
3000bc1c:	e58d200c 	str	r2, [sp, #12]
3000bc20:	e59d2008 	ldr	r2, [sp, #8]
3000bc24:	e2822001 	add	r2, r2, #1
3000bc28:	e58d2008 	str	r2, [sp, #8]
3000bc2c:	e3530000 	cmp	r3, #0
3000bc30:	1affffe3 	bne	3000bbc4 <acoral_str_ncat+0x48>
				break;
			}
		}
	}

	return tmp;
3000bc34:	e59d3014 	ldr	r3, [sp, #20]
}
3000bc38:	e1a00003 	mov	r0, r3
3000bc3c:	e28dd018 	add	sp, sp, #24
3000bc40:	e12fff1e 	bx	lr

3000bc44 <acoral_str_lcat>:
 * @dest: The string to be appended to
 * @src: The string to append to it
 * @count: The size of the destination buffer.
 */
acoral_u32 acoral_str_lcat(acoral_char *dest, const acoral_char *src, acoral_u32 count)
{
3000bc44:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000bc48:	e24dd024 	sub	sp, sp, #36	; 0x24
3000bc4c:	e58d000c 	str	r0, [sp, #12]
3000bc50:	e58d1008 	str	r1, [sp, #8]
3000bc54:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 dsize = acoral_str_len(dest);
3000bc58:	e59d000c 	ldr	r0, [sp, #12]
3000bc5c:	ebfffea7 	bl	3000b700 <acoral_str_len>
3000bc60:	e1a03000 	mov	r3, r0
3000bc64:	e58d3014 	str	r3, [sp, #20]
	acoral_u32 len = acoral_str_len(src);
3000bc68:	e59d0008 	ldr	r0, [sp, #8]
3000bc6c:	ebfffea3 	bl	3000b700 <acoral_str_len>
3000bc70:	e1a03000 	mov	r3, r0
3000bc74:	e58d3018 	str	r3, [sp, #24]
	acoral_u32 res = dsize + len;
3000bc78:	e59d2014 	ldr	r2, [sp, #20]
3000bc7c:	e59d3018 	ldr	r3, [sp, #24]
3000bc80:	e0823003 	add	r3, r2, r3
3000bc84:	e58d301c 	str	r3, [sp, #28]

	/* This would be a bug */
//	BUG_ON(dsize >= count);

	dest += dsize;
3000bc88:	e59d200c 	ldr	r2, [sp, #12]
3000bc8c:	e59d3014 	ldr	r3, [sp, #20]
3000bc90:	e0823003 	add	r3, r2, r3
3000bc94:	e58d300c 	str	r3, [sp, #12]
	count -= dsize;
3000bc98:	e59d2004 	ldr	r2, [sp, #4]
3000bc9c:	e59d3014 	ldr	r3, [sp, #20]
3000bca0:	e0633002 	rsb	r3, r3, r2
3000bca4:	e58d3004 	str	r3, [sp, #4]
	if (len >= count)
3000bca8:	e59d2018 	ldr	r2, [sp, #24]
3000bcac:	e59d3004 	ldr	r3, [sp, #4]
3000bcb0:	e1520003 	cmp	r2, r3
3000bcb4:	3a000002 	bcc	3000bcc4 <acoral_str_lcat+0x80>
		len = count-1;
3000bcb8:	e59d3004 	ldr	r3, [sp, #4]
3000bcbc:	e2433001 	sub	r3, r3, #1
3000bcc0:	e58d3018 	str	r3, [sp, #24]
	acoral_memcpy(dest, src, len);
3000bcc4:	e59d000c 	ldr	r0, [sp, #12]
3000bcc8:	e59d1008 	ldr	r1, [sp, #8]
3000bccc:	e59d2018 	ldr	r2, [sp, #24]
3000bcd0:	eb000173 	bl	3000c2a4 <acoral_memcpy>
	dest[len] = 0;
3000bcd4:	e59d200c 	ldr	r2, [sp, #12]
3000bcd8:	e59d3018 	ldr	r3, [sp, #24]
3000bcdc:	e0823003 	add	r3, r2, r3
3000bce0:	e3a02000 	mov	r2, #0
3000bce4:	e5c32000 	strb	r2, [r3]
	return res;
3000bce8:	e59d301c 	ldr	r3, [sp, #28]
}
3000bcec:	e1a00003 	mov	r0, r3
3000bcf0:	e28dd024 	add	sp, sp, #36	; 0x24
3000bcf4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000bcf8:	e12fff1e 	bx	lr

3000bcfc <acoral_str_ncmp>:
 * @cs: One string
 * @ct: Another string
 * @count: The maximum number of bytes to compare
 */
acoral_32 acoral_str_ncmp(const acoral_char * cs,const acoral_char * ct,acoral_u32 count)
{
3000bcfc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
3000bd00:	e24dd014 	sub	sp, sp, #20
3000bd04:	e58d000c 	str	r0, [sp, #12]
3000bd08:	e58d1008 	str	r1, [sp, #8]
3000bd0c:	e58d2004 	str	r2, [sp, #4]
	register acoral_8 __res = 0;
3000bd10:	e3a04000 	mov	r4, #0

	while (count) {
3000bd14:	ea00001f 	b	3000bd98 <acoral_str_ncmp+0x9c>
		if ((__res = *cs - *ct++) != 0 || !*cs++)
3000bd18:	e59d300c 	ldr	r3, [sp, #12]
3000bd1c:	e5d32000 	ldrb	r2, [r3]
3000bd20:	e59d3008 	ldr	r3, [sp, #8]
3000bd24:	e5d33000 	ldrb	r3, [r3]
3000bd28:	e0633002 	rsb	r3, r3, r2
3000bd2c:	e20330ff 	and	r3, r3, #255	; 0xff
3000bd30:	e1a04003 	mov	r4, r3
3000bd34:	e1a03c04 	lsl	r3, r4, #24
3000bd38:	e1a03c43 	asr	r3, r3, #24
3000bd3c:	e3530000 	cmp	r3, #0
3000bd40:	03a03000 	moveq	r3, #0
3000bd44:	13a03001 	movne	r3, #1
3000bd48:	e20330ff 	and	r3, r3, #255	; 0xff
3000bd4c:	e59d2008 	ldr	r2, [sp, #8]
3000bd50:	e2822001 	add	r2, r2, #1
3000bd54:	e58d2008 	str	r2, [sp, #8]
3000bd58:	e3530000 	cmp	r3, #0
3000bd5c:	1a000010 	bne	3000bda4 <acoral_str_ncmp+0xa8>
3000bd60:	e59d300c 	ldr	r3, [sp, #12]
3000bd64:	e5d33000 	ldrb	r3, [r3]
3000bd68:	e3530000 	cmp	r3, #0
3000bd6c:	13a03000 	movne	r3, #0
3000bd70:	03a03001 	moveq	r3, #1
3000bd74:	e20330ff 	and	r3, r3, #255	; 0xff
3000bd78:	e59d200c 	ldr	r2, [sp, #12]
3000bd7c:	e2822001 	add	r2, r2, #1
3000bd80:	e58d200c 	str	r2, [sp, #12]
3000bd84:	e3530000 	cmp	r3, #0
3000bd88:	1a000005 	bne	3000bda4 <acoral_str_ncmp+0xa8>
			break;
		count--;
3000bd8c:	e59d3004 	ldr	r3, [sp, #4]
3000bd90:	e2433001 	sub	r3, r3, #1
3000bd94:	e58d3004 	str	r3, [sp, #4]
 */
acoral_32 acoral_str_ncmp(const acoral_char * cs,const acoral_char * ct,acoral_u32 count)
{
	register acoral_8 __res = 0;

	while (count) {
3000bd98:	e59d3004 	ldr	r3, [sp, #4]
3000bd9c:	e3530000 	cmp	r3, #0
3000bda0:	1affffdc 	bne	3000bd18 <acoral_str_ncmp+0x1c>
		if ((__res = *cs - *ct++) != 0 || !*cs++)
			break;
		count--;
	}

	return __res;
3000bda4:	e1a03c04 	lsl	r3, r4, #24
3000bda8:	e1a03c43 	asr	r3, r3, #24
}
3000bdac:	e1a00003 	mov	r0, r3
3000bdb0:	e28dd014 	add	sp, sp, #20
3000bdb4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
3000bdb8:	e12fff1e 	bx	lr

3000bdbc <acoral_str_chr>:
 * acoral_str_chr - Find the first occurrence of a character in a string
 * @s: The string to be searched
 * @c: The character to search for
 */
acoral_32  acoral_str_chr(const acoral_char * s, acoral_32 c)
{
3000bdbc:	e24dd010 	sub	sp, sp, #16
3000bdc0:	e58d0004 	str	r0, [sp, #4]
3000bdc4:	e58d1000 	str	r1, [sp]
	acoral_u32 pos = 1;
3000bdc8:	e3a03001 	mov	r3, #1
3000bdcc:	e58d300c 	str	r3, [sp, #12]
	for(; *s != (acoral_char) c; ++s,++pos)
3000bdd0:	ea00000b 	b	3000be04 <acoral_str_chr+0x48>
		if (*s == '\0')
3000bdd4:	e59d3004 	ldr	r3, [sp, #4]
3000bdd8:	e5d33000 	ldrb	r3, [r3]
3000bddc:	e3530000 	cmp	r3, #0
3000bde0:	1a000001 	bne	3000bdec <acoral_str_chr+0x30>
			return 0;
3000bde4:	e3a03000 	mov	r3, #0
3000bde8:	ea00000c 	b	3000be20 <acoral_str_chr+0x64>
 * @c: The character to search for
 */
acoral_32  acoral_str_chr(const acoral_char * s, acoral_32 c)
{
	acoral_u32 pos = 1;
	for(; *s != (acoral_char) c; ++s,++pos)
3000bdec:	e59d3004 	ldr	r3, [sp, #4]
3000bdf0:	e2833001 	add	r3, r3, #1
3000bdf4:	e58d3004 	str	r3, [sp, #4]
3000bdf8:	e59d300c 	ldr	r3, [sp, #12]
3000bdfc:	e2833001 	add	r3, r3, #1
3000be00:	e58d300c 	str	r3, [sp, #12]
3000be04:	e59d3004 	ldr	r3, [sp, #4]
3000be08:	e5d32000 	ldrb	r2, [r3]
3000be0c:	e59d3000 	ldr	r3, [sp]
3000be10:	e20330ff 	and	r3, r3, #255	; 0xff
3000be14:	e1520003 	cmp	r2, r3
3000be18:	1affffed 	bne	3000bdd4 <acoral_str_chr+0x18>
		if (*s == '\0')
			return 0;
	return pos;
3000be1c:	e59d300c 	ldr	r3, [sp, #12]
}
3000be20:	e1a00003 	mov	r0, r3
3000be24:	e28dd010 	add	sp, sp, #16
3000be28:	e12fff1e 	bx	lr

3000be2c <acoral_str_rchr>:
 * acoral_str_rchr - Find the last occurrence of a character in a string
 * @s: The string to be searched
 * @c: The character to search for
 */
acoral_32  acoral_str_rchr(const acoral_char * s, acoral_32 c)
{
3000be2c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000be30:	e24dd014 	sub	sp, sp, #20
3000be34:	e58d0004 	str	r0, [sp, #4]
3000be38:	e58d1000 	str	r1, [sp]
	   acoral_u32 pos = acoral_str_len(s);
3000be3c:	e59d0004 	ldr	r0, [sp, #4]
3000be40:	ebfffe2e 	bl	3000b700 <acoral_str_len>
3000be44:	e1a03000 	mov	r3, r0
3000be48:	e58d3008 	str	r3, [sp, #8]
       const acoral_char *p = s + pos;
3000be4c:	e59d2004 	ldr	r2, [sp, #4]
3000be50:	e59d3008 	ldr	r3, [sp, #8]
3000be54:	e0823003 	add	r3, r2, r3
3000be58:	e58d300c 	str	r3, [sp, #12]
       do {
           if (*p == (acoral_char)c)
3000be5c:	e59d300c 	ldr	r3, [sp, #12]
3000be60:	e5d32000 	ldrb	r2, [r3]
3000be64:	e59d3000 	ldr	r3, [sp]
3000be68:	e20330ff 	and	r3, r3, #255	; 0xff
3000be6c:	e1520003 	cmp	r2, r3
3000be70:	1a000001 	bne	3000be7c <acoral_str_rchr+0x50>
               return pos;
3000be74:	e59d3008 	ldr	r3, [sp, #8]
3000be78:	ea00000a 	b	3000bea8 <acoral_str_rchr+0x7c>
           --pos;
3000be7c:	e59d3008 	ldr	r3, [sp, #8]
3000be80:	e2433001 	sub	r3, r3, #1
3000be84:	e58d3008 	str	r3, [sp, #8]
       } while (--p >= s);
3000be88:	e59d300c 	ldr	r3, [sp, #12]
3000be8c:	e2433001 	sub	r3, r3, #1
3000be90:	e58d300c 	str	r3, [sp, #12]
3000be94:	e59d200c 	ldr	r2, [sp, #12]
3000be98:	e59d3004 	ldr	r3, [sp, #4]
3000be9c:	e1520003 	cmp	r2, r3
3000bea0:	2affffed 	bcs	3000be5c <acoral_str_rchr+0x30>
       return 0;
3000bea4:	e3a03000 	mov	r3, #0
}
3000bea8:	e1a00003 	mov	r0, r3
3000beac:	e28dd014 	add	sp, sp, #20
3000beb0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000beb4:	e12fff1e 	bx	lr

3000beb8 <acoral_str_nchr>:
 * @s: The string to be searched
 * @count: The number of characters to be searched
 * @c: The character to search for
 */
acoral_32 acoral_str_nchr(const acoral_char *s, acoral_u32 count, acoral_32 c)
{
3000beb8:	e24dd018 	sub	sp, sp, #24
3000bebc:	e58d000c 	str	r0, [sp, #12]
3000bec0:	e58d1008 	str	r1, [sp, #8]
3000bec4:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 pos = 1;
3000bec8:	e3a03001 	mov	r3, #1
3000becc:	e58d3014 	str	r3, [sp, #20]
	for (; count-- && *s != '\0'; ++s,++pos)
3000bed0:	ea00000d 	b	3000bf0c <acoral_str_nchr+0x54>
		if (*s == (acoral_char) c)
3000bed4:	e59d300c 	ldr	r3, [sp, #12]
3000bed8:	e5d32000 	ldrb	r2, [r3]
3000bedc:	e59d3004 	ldr	r3, [sp, #4]
3000bee0:	e20330ff 	and	r3, r3, #255	; 0xff
3000bee4:	e1520003 	cmp	r2, r3
3000bee8:	1a000001 	bne	3000bef4 <acoral_str_nchr+0x3c>
			return pos;
3000beec:	e59d3014 	ldr	r3, [sp, #20]
3000bef0:	ea000014 	b	3000bf48 <acoral_str_nchr+0x90>
 * @c: The character to search for
 */
acoral_32 acoral_str_nchr(const acoral_char *s, acoral_u32 count, acoral_32 c)
{
	acoral_u32 pos = 1;
	for (; count-- && *s != '\0'; ++s,++pos)
3000bef4:	e59d300c 	ldr	r3, [sp, #12]
3000bef8:	e2833001 	add	r3, r3, #1
3000befc:	e58d300c 	str	r3, [sp, #12]
3000bf00:	e59d3014 	ldr	r3, [sp, #20]
3000bf04:	e2833001 	add	r3, r3, #1
3000bf08:	e58d3014 	str	r3, [sp, #20]
3000bf0c:	e59d3008 	ldr	r3, [sp, #8]
3000bf10:	e3530000 	cmp	r3, #0
3000bf14:	03a03000 	moveq	r3, #0
3000bf18:	13a03001 	movne	r3, #1
3000bf1c:	e20330ff 	and	r3, r3, #255	; 0xff
3000bf20:	e59d2008 	ldr	r2, [sp, #8]
3000bf24:	e2422001 	sub	r2, r2, #1
3000bf28:	e58d2008 	str	r2, [sp, #8]
3000bf2c:	e3530000 	cmp	r3, #0
3000bf30:	0a000003 	beq	3000bf44 <acoral_str_nchr+0x8c>
3000bf34:	e59d300c 	ldr	r3, [sp, #12]
3000bf38:	e5d33000 	ldrb	r3, [r3]
3000bf3c:	e3530000 	cmp	r3, #0
3000bf40:	1affffe3 	bne	3000bed4 <acoral_str_nchr+0x1c>
		if (*s == (acoral_char) c)
			return pos;
	return 0;
3000bf44:	e3a03000 	mov	r3, #0
}
3000bf48:	e1a00003 	mov	r0, r3
3000bf4c:	e28dd018 	add	sp, sp, #24
3000bf50:	e12fff1e 	bx	lr

3000bf54 <acoral_str_nlen>:
 * acoral_str_nlen - Find the length of a length-limited string
 * @s: The string to be sized
 * @count: The maximum number of bytes to search
 */
acoral_u32 acoral_str_nlen(const acoral_char * s, acoral_u32 count)
{
3000bf54:	e24dd010 	sub	sp, sp, #16
3000bf58:	e58d0004 	str	r0, [sp, #4]
3000bf5c:	e58d1000 	str	r1, [sp]
	const acoral_char *sc;

	for (sc = s; count-- && *sc != '\0'; ++sc)
3000bf60:	e59d3004 	ldr	r3, [sp, #4]
3000bf64:	e58d300c 	str	r3, [sp, #12]
3000bf68:	ea000002 	b	3000bf78 <acoral_str_nlen+0x24>
3000bf6c:	e59d300c 	ldr	r3, [sp, #12]
3000bf70:	e2833001 	add	r3, r3, #1
3000bf74:	e58d300c 	str	r3, [sp, #12]
3000bf78:	e59d3000 	ldr	r3, [sp]
3000bf7c:	e3530000 	cmp	r3, #0
3000bf80:	03a03000 	moveq	r3, #0
3000bf84:	13a03001 	movne	r3, #1
3000bf88:	e20330ff 	and	r3, r3, #255	; 0xff
3000bf8c:	e59d2000 	ldr	r2, [sp]
3000bf90:	e2422001 	sub	r2, r2, #1
3000bf94:	e58d2000 	str	r2, [sp]
3000bf98:	e3530000 	cmp	r3, #0
3000bf9c:	0a000003 	beq	3000bfb0 <acoral_str_nlen+0x5c>
3000bfa0:	e59d300c 	ldr	r3, [sp, #12]
3000bfa4:	e5d33000 	ldrb	r3, [r3]
3000bfa8:	e3530000 	cmp	r3, #0
3000bfac:	1affffee 	bne	3000bf6c <acoral_str_nlen+0x18>
		/* nothing */;
	return sc - s;
3000bfb0:	e59d200c 	ldr	r2, [sp, #12]
3000bfb4:	e59d3004 	ldr	r3, [sp, #4]
3000bfb8:	e0633002 	rsb	r3, r3, r2
}
3000bfbc:	e1a00003 	mov	r0, r3
3000bfc0:	e28dd010 	add	sp, sp, #16
3000bfc4:	e12fff1e 	bx	lr

3000bfc8 <acoral_str_spn>:
 * 	contain letters in @accept
 * @s: The string to be searched
 * @accept: The string to search for
 */
acoral_u32 acoral_str_spn(const acoral_char *s, const acoral_char *accept)
{
3000bfc8:	e24dd018 	sub	sp, sp, #24
3000bfcc:	e58d0004 	str	r0, [sp, #4]
3000bfd0:	e58d1000 	str	r1, [sp]
	const acoral_char *p;
	const acoral_char *a;
	acoral_u32 count = 0;
3000bfd4:	e3a03000 	mov	r3, #0
3000bfd8:	e58d3014 	str	r3, [sp, #20]

	for (p = s; *p != '\0'; ++p) {
3000bfdc:	e59d3004 	ldr	r3, [sp, #4]
3000bfe0:	e58d300c 	str	r3, [sp, #12]
3000bfe4:	ea00001d 	b	3000c060 <acoral_str_spn+0x98>
		for (a = accept; *a != '\0'; ++a) {
3000bfe8:	e59d3000 	ldr	r3, [sp]
3000bfec:	e58d3010 	str	r3, [sp, #16]
3000bff0:	ea000008 	b	3000c018 <acoral_str_spn+0x50>
			if (*p == *a)
3000bff4:	e59d300c 	ldr	r3, [sp, #12]
3000bff8:	e5d32000 	ldrb	r2, [r3]
3000bffc:	e59d3010 	ldr	r3, [sp, #16]
3000c000:	e5d33000 	ldrb	r3, [r3]
3000c004:	e1520003 	cmp	r2, r3
3000c008:	0a000007 	beq	3000c02c <acoral_str_spn+0x64>
	const acoral_char *p;
	const acoral_char *a;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
		for (a = accept; *a != '\0'; ++a) {
3000c00c:	e59d3010 	ldr	r3, [sp, #16]
3000c010:	e2833001 	add	r3, r3, #1
3000c014:	e58d3010 	str	r3, [sp, #16]
3000c018:	e59d3010 	ldr	r3, [sp, #16]
3000c01c:	e5d33000 	ldrb	r3, [r3]
3000c020:	e3530000 	cmp	r3, #0
3000c024:	1afffff2 	bne	3000bff4 <acoral_str_spn+0x2c>
3000c028:	ea000000 	b	3000c030 <acoral_str_spn+0x68>
			if (*p == *a)
				break;
3000c02c:	e1a00000 	nop			; (mov r0, r0)
		}
		if (*a == '\0')
3000c030:	e59d3010 	ldr	r3, [sp, #16]
3000c034:	e5d33000 	ldrb	r3, [r3]
3000c038:	e3530000 	cmp	r3, #0
3000c03c:	1a000001 	bne	3000c048 <acoral_str_spn+0x80>
			return count;
3000c040:	e59d3014 	ldr	r3, [sp, #20]
3000c044:	ea00000a 	b	3000c074 <acoral_str_spn+0xac>
		++count;
3000c048:	e59d3014 	ldr	r3, [sp, #20]
3000c04c:	e2833001 	add	r3, r3, #1
3000c050:	e58d3014 	str	r3, [sp, #20]
{
	const acoral_char *p;
	const acoral_char *a;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
3000c054:	e59d300c 	ldr	r3, [sp, #12]
3000c058:	e2833001 	add	r3, r3, #1
3000c05c:	e58d300c 	str	r3, [sp, #12]
3000c060:	e59d300c 	ldr	r3, [sp, #12]
3000c064:	e5d33000 	ldrb	r3, [r3]
3000c068:	e3530000 	cmp	r3, #0
3000c06c:	1affffdd 	bne	3000bfe8 <acoral_str_spn+0x20>
		if (*a == '\0')
			return count;
		++count;
	}

	return count;
3000c070:	e59d3014 	ldr	r3, [sp, #20]
}
3000c074:	e1a00003 	mov	r0, r3
3000c078:	e28dd018 	add	sp, sp, #24
3000c07c:	e12fff1e 	bx	lr

3000c080 <acoral_str_cspn>:
 * 	not contain letters in @reject
 * @s: The string to be searched
 * @reject: The string to avoid
 */
acoral_u32 acoral_str_cspn(const acoral_char *s, const acoral_char *reject)
{
3000c080:	e24dd018 	sub	sp, sp, #24
3000c084:	e58d0004 	str	r0, [sp, #4]
3000c088:	e58d1000 	str	r1, [sp]
	const acoral_char *p;
	const acoral_char *r;
	acoral_u32 count = 0;
3000c08c:	e3a03000 	mov	r3, #0
3000c090:	e58d3014 	str	r3, [sp, #20]

	for (p = s; *p != '\0'; ++p) {
3000c094:	e59d3004 	ldr	r3, [sp, #4]
3000c098:	e58d300c 	str	r3, [sp, #12]
3000c09c:	ea000017 	b	3000c100 <acoral_str_cspn+0x80>
		for (r = reject; *r != '\0'; ++r) {
3000c0a0:	e59d3000 	ldr	r3, [sp]
3000c0a4:	e58d3010 	str	r3, [sp, #16]
3000c0a8:	ea00000a 	b	3000c0d8 <acoral_str_cspn+0x58>
			if (*p == *r)
3000c0ac:	e59d300c 	ldr	r3, [sp, #12]
3000c0b0:	e5d32000 	ldrb	r2, [r3]
3000c0b4:	e59d3010 	ldr	r3, [sp, #16]
3000c0b8:	e5d33000 	ldrb	r3, [r3]
3000c0bc:	e1520003 	cmp	r2, r3
3000c0c0:	1a000001 	bne	3000c0cc <acoral_str_cspn+0x4c>
				return count;
3000c0c4:	e59d3014 	ldr	r3, [sp, #20]
3000c0c8:	ea000011 	b	3000c114 <acoral_str_cspn+0x94>
	const acoral_char *p;
	const acoral_char *r;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
		for (r = reject; *r != '\0'; ++r) {
3000c0cc:	e59d3010 	ldr	r3, [sp, #16]
3000c0d0:	e2833001 	add	r3, r3, #1
3000c0d4:	e58d3010 	str	r3, [sp, #16]
3000c0d8:	e59d3010 	ldr	r3, [sp, #16]
3000c0dc:	e5d33000 	ldrb	r3, [r3]
3000c0e0:	e3530000 	cmp	r3, #0
3000c0e4:	1afffff0 	bne	3000c0ac <acoral_str_cspn+0x2c>
			if (*p == *r)
				return count;
		}
		++count;
3000c0e8:	e59d3014 	ldr	r3, [sp, #20]
3000c0ec:	e2833001 	add	r3, r3, #1
3000c0f0:	e58d3014 	str	r3, [sp, #20]
{
	const acoral_char *p;
	const acoral_char *r;
	acoral_u32 count = 0;

	for (p = s; *p != '\0'; ++p) {
3000c0f4:	e59d300c 	ldr	r3, [sp, #12]
3000c0f8:	e2833001 	add	r3, r3, #1
3000c0fc:	e58d300c 	str	r3, [sp, #12]
3000c100:	e59d300c 	ldr	r3, [sp, #12]
3000c104:	e5d33000 	ldrb	r3, [r3]
3000c108:	e3530000 	cmp	r3, #0
3000c10c:	1affffe3 	bne	3000c0a0 <acoral_str_cspn+0x20>
				return count;
		}
		++count;
	}

	return count;
3000c110:	e59d3014 	ldr	r3, [sp, #20]
}	
3000c114:	e1a00003 	mov	r0, r3
3000c118:	e28dd018 	add	sp, sp, #24
3000c11c:	e12fff1e 	bx	lr

3000c120 <acoral_str_pbrk>:
 * acoral_str_pbrk - Find the first occurrence of a set of characters
 * @cs: The string to be searched
 * @ct: The characters to search for
 */
acoral_char * acoral_str_pbrk(const acoral_char * cs,const acoral_char * ct)
{
3000c120:	e24dd010 	sub	sp, sp, #16
3000c124:	e58d0004 	str	r0, [sp, #4]
3000c128:	e58d1000 	str	r1, [sp]
	const acoral_char *sc1,*sc2;

	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
3000c12c:	e59d3004 	ldr	r3, [sp, #4]
3000c130:	e58d3008 	str	r3, [sp, #8]
3000c134:	ea000014 	b	3000c18c <acoral_str_pbrk+0x6c>
		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
3000c138:	e59d3000 	ldr	r3, [sp]
3000c13c:	e58d300c 	str	r3, [sp, #12]
3000c140:	ea00000a 	b	3000c170 <acoral_str_pbrk+0x50>
			if (*sc1 == *sc2)
3000c144:	e59d3008 	ldr	r3, [sp, #8]
3000c148:	e5d32000 	ldrb	r2, [r3]
3000c14c:	e59d300c 	ldr	r3, [sp, #12]
3000c150:	e5d33000 	ldrb	r3, [r3]
3000c154:	e1520003 	cmp	r2, r3
3000c158:	1a000001 	bne	3000c164 <acoral_str_pbrk+0x44>
				return (acoral_char *) sc1;
3000c15c:	e59d3008 	ldr	r3, [sp, #8]
3000c160:	ea00000e 	b	3000c1a0 <acoral_str_pbrk+0x80>
acoral_char * acoral_str_pbrk(const acoral_char * cs,const acoral_char * ct)
{
	const acoral_char *sc1,*sc2;

	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
3000c164:	e59d300c 	ldr	r3, [sp, #12]
3000c168:	e2833001 	add	r3, r3, #1
3000c16c:	e58d300c 	str	r3, [sp, #12]
3000c170:	e59d300c 	ldr	r3, [sp, #12]
3000c174:	e5d33000 	ldrb	r3, [r3]
3000c178:	e3530000 	cmp	r3, #0
3000c17c:	1afffff0 	bne	3000c144 <acoral_str_pbrk+0x24>
 */
acoral_char * acoral_str_pbrk(const acoral_char * cs,const acoral_char * ct)
{
	const acoral_char *sc1,*sc2;

	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
3000c180:	e59d3008 	ldr	r3, [sp, #8]
3000c184:	e2833001 	add	r3, r3, #1
3000c188:	e58d3008 	str	r3, [sp, #8]
3000c18c:	e59d3008 	ldr	r3, [sp, #8]
3000c190:	e5d33000 	ldrb	r3, [r3]
3000c194:	e3530000 	cmp	r3, #0
3000c198:	1affffe6 	bne	3000c138 <acoral_str_pbrk+0x18>
		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
			if (*sc1 == *sc2)
				return (acoral_char *) sc1;
		}
	}
	return NULL;
3000c19c:	e3a03000 	mov	r3, #0
}
3000c1a0:	e1a00003 	mov	r0, r3
3000c1a4:	e28dd010 	add	sp, sp, #16
3000c1a8:	e12fff1e 	bx	lr

3000c1ac <acoral_str_sep>:
 * It returns empty tokens, too, behaving exactly like the libc function
 * of that name. In fact, it was stolen from glibc2 and de-fancy-fied.
 * Same semantics, slimmer shape. ;)
 */
acoral_char * acoral_str_sep(acoral_char **s, const acoral_char *ct)
{
3000c1ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c1b0:	e24dd014 	sub	sp, sp, #20
3000c1b4:	e58d0004 	str	r0, [sp, #4]
3000c1b8:	e58d1000 	str	r1, [sp]
	acoral_char *sbegin = *s, *end;
3000c1bc:	e59d3004 	ldr	r3, [sp, #4]
3000c1c0:	e5933000 	ldr	r3, [r3]
3000c1c4:	e58d3008 	str	r3, [sp, #8]

	if (sbegin == NULL)
3000c1c8:	e59d3008 	ldr	r3, [sp, #8]
3000c1cc:	e3530000 	cmp	r3, #0
3000c1d0:	1a000001 	bne	3000c1dc <acoral_str_sep+0x30>
		return NULL;
3000c1d4:	e3a03000 	mov	r3, #0
3000c1d8:	ea000011 	b	3000c224 <acoral_str_sep+0x78>

	end = acoral_str_pbrk(sbegin, ct);
3000c1dc:	e59d0008 	ldr	r0, [sp, #8]
3000c1e0:	e59d1000 	ldr	r1, [sp]
3000c1e4:	ebffffcd 	bl	3000c120 <acoral_str_pbrk>
3000c1e8:	e1a03000 	mov	r3, r0
3000c1ec:	e58d300c 	str	r3, [sp, #12]
	if (end)
3000c1f0:	e59d300c 	ldr	r3, [sp, #12]
3000c1f4:	e3530000 	cmp	r3, #0
3000c1f8:	0a000005 	beq	3000c214 <acoral_str_sep+0x68>
		*end++ = '\0';
3000c1fc:	e59d300c 	ldr	r3, [sp, #12]
3000c200:	e3a02000 	mov	r2, #0
3000c204:	e5c32000 	strb	r2, [r3]
3000c208:	e59d300c 	ldr	r3, [sp, #12]
3000c20c:	e2833001 	add	r3, r3, #1
3000c210:	e58d300c 	str	r3, [sp, #12]
	*s = end;
3000c214:	e59d3004 	ldr	r3, [sp, #4]
3000c218:	e59d200c 	ldr	r2, [sp, #12]
3000c21c:	e5832000 	str	r2, [r3]

	return sbegin;
3000c220:	e59d3008 	ldr	r3, [sp, #8]
}
3000c224:	e1a00003 	mov	r0, r3
3000c228:	e28dd014 	add	sp, sp, #20
3000c22c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000c230:	e12fff1e 	bx	lr

3000c234 <acoral_memset>:
 * @count: The size of the area.
 *
 * Do not use memset() to access IO space, use memset_io() instead.
 */
void * acoral_memset(void * s,acoral_32 c,acoral_u32 count)
{
3000c234:	e24dd018 	sub	sp, sp, #24
3000c238:	e58d000c 	str	r0, [sp, #12]
3000c23c:	e58d1008 	str	r1, [sp, #8]
3000c240:	e58d2004 	str	r2, [sp, #4]
	acoral_char *xs = (acoral_char *) s;
3000c244:	e59d300c 	ldr	r3, [sp, #12]
3000c248:	e58d3014 	str	r3, [sp, #20]

	while (count--)
3000c24c:	ea000006 	b	3000c26c <acoral_memset+0x38>
		*xs++ = c;
3000c250:	e59d3008 	ldr	r3, [sp, #8]
3000c254:	e20320ff 	and	r2, r3, #255	; 0xff
3000c258:	e59d3014 	ldr	r3, [sp, #20]
3000c25c:	e5c32000 	strb	r2, [r3]
3000c260:	e59d3014 	ldr	r3, [sp, #20]
3000c264:	e2833001 	add	r3, r3, #1
3000c268:	e58d3014 	str	r3, [sp, #20]
 */
void * acoral_memset(void * s,acoral_32 c,acoral_u32 count)
{
	acoral_char *xs = (acoral_char *) s;

	while (count--)
3000c26c:	e59d3004 	ldr	r3, [sp, #4]
3000c270:	e3530000 	cmp	r3, #0
3000c274:	03a03000 	moveq	r3, #0
3000c278:	13a03001 	movne	r3, #1
3000c27c:	e20330ff 	and	r3, r3, #255	; 0xff
3000c280:	e59d2004 	ldr	r2, [sp, #4]
3000c284:	e2422001 	sub	r2, r2, #1
3000c288:	e58d2004 	str	r2, [sp, #4]
3000c28c:	e3530000 	cmp	r3, #0
3000c290:	1affffee 	bne	3000c250 <acoral_memset+0x1c>
		*xs++ = c;

	return s;
3000c294:	e59d300c 	ldr	r3, [sp, #12]
}
3000c298:	e1a00003 	mov	r0, r3
3000c29c:	e28dd018 	add	sp, sp, #24
3000c2a0:	e12fff1e 	bx	lr

3000c2a4 <acoral_memcpy>:
 *
 * You should not use this function to access IO space, use memcpy_toio()
 * or memcpy_fromio() instead.
 */
void * acoral_memcpy(void * dest,const void *src,acoral_u32 count)
{
3000c2a4:	e24dd018 	sub	sp, sp, #24
3000c2a8:	e58d000c 	str	r0, [sp, #12]
3000c2ac:	e58d1008 	str	r1, [sp, #8]
3000c2b0:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp = (acoral_char *) dest, *s = (acoral_char *) src;
3000c2b4:	e59d300c 	ldr	r3, [sp, #12]
3000c2b8:	e58d3010 	str	r3, [sp, #16]
3000c2bc:	e59d3008 	ldr	r3, [sp, #8]
3000c2c0:	e58d3014 	str	r3, [sp, #20]

	while (count--)
3000c2c4:	ea000009 	b	3000c2f0 <acoral_memcpy+0x4c>
		*tmp++ = *s++;
3000c2c8:	e59d3014 	ldr	r3, [sp, #20]
3000c2cc:	e5d32000 	ldrb	r2, [r3]
3000c2d0:	e59d3010 	ldr	r3, [sp, #16]
3000c2d4:	e5c32000 	strb	r2, [r3]
3000c2d8:	e59d3010 	ldr	r3, [sp, #16]
3000c2dc:	e2833001 	add	r3, r3, #1
3000c2e0:	e58d3010 	str	r3, [sp, #16]
3000c2e4:	e59d3014 	ldr	r3, [sp, #20]
3000c2e8:	e2833001 	add	r3, r3, #1
3000c2ec:	e58d3014 	str	r3, [sp, #20]
 */
void * acoral_memcpy(void * dest,const void *src,acoral_u32 count)
{
	acoral_char *tmp = (acoral_char *) dest, *s = (acoral_char *) src;

	while (count--)
3000c2f0:	e59d3004 	ldr	r3, [sp, #4]
3000c2f4:	e3530000 	cmp	r3, #0
3000c2f8:	03a03000 	moveq	r3, #0
3000c2fc:	13a03001 	movne	r3, #1
3000c300:	e20330ff 	and	r3, r3, #255	; 0xff
3000c304:	e59d2004 	ldr	r2, [sp, #4]
3000c308:	e2422001 	sub	r2, r2, #1
3000c30c:	e58d2004 	str	r2, [sp, #4]
3000c310:	e3530000 	cmp	r3, #0
3000c314:	1affffeb 	bne	3000c2c8 <acoral_memcpy+0x24>
		*tmp++ = *s++;

	return dest;
3000c318:	e59d300c 	ldr	r3, [sp, #12]
}
3000c31c:	e1a00003 	mov	r0, r3
3000c320:	e28dd018 	add	sp, sp, #24
3000c324:	e12fff1e 	bx	lr

3000c328 <acoral_memmove>:
 * @count: The size of the area.
 *
 * Unlike memcpy(), memmove() copes with overlapping areas.
 */
void * acoral_memmove(void * dest,const void *src,acoral_u32 count)
{
3000c328:	e24dd018 	sub	sp, sp, #24
3000c32c:	e58d000c 	str	r0, [sp, #12]
3000c330:	e58d1008 	str	r1, [sp, #8]
3000c334:	e58d2004 	str	r2, [sp, #4]
	acoral_char *tmp, *s;

	if (dest <= src) {
3000c338:	e59d200c 	ldr	r2, [sp, #12]
3000c33c:	e59d3008 	ldr	r3, [sp, #8]
3000c340:	e1520003 	cmp	r2, r3
3000c344:	8a000019 	bhi	3000c3b0 <acoral_memmove+0x88>
		tmp = (acoral_char *) dest;
3000c348:	e59d300c 	ldr	r3, [sp, #12]
3000c34c:	e58d3010 	str	r3, [sp, #16]
		s = (acoral_char *) src;
3000c350:	e59d3008 	ldr	r3, [sp, #8]
3000c354:	e58d3014 	str	r3, [sp, #20]
		while (count--)
3000c358:	ea000009 	b	3000c384 <acoral_memmove+0x5c>
			*tmp++ = *s++;
3000c35c:	e59d3014 	ldr	r3, [sp, #20]
3000c360:	e5d32000 	ldrb	r2, [r3]
3000c364:	e59d3010 	ldr	r3, [sp, #16]
3000c368:	e5c32000 	strb	r2, [r3]
3000c36c:	e59d3010 	ldr	r3, [sp, #16]
3000c370:	e2833001 	add	r3, r3, #1
3000c374:	e58d3010 	str	r3, [sp, #16]
3000c378:	e59d3014 	ldr	r3, [sp, #20]
3000c37c:	e2833001 	add	r3, r3, #1
3000c380:	e58d3014 	str	r3, [sp, #20]
	acoral_char *tmp, *s;

	if (dest <= src) {
		tmp = (acoral_char *) dest;
		s = (acoral_char *) src;
		while (count--)
3000c384:	e59d3004 	ldr	r3, [sp, #4]
3000c388:	e3530000 	cmp	r3, #0
3000c38c:	03a03000 	moveq	r3, #0
3000c390:	13a03001 	movne	r3, #1
3000c394:	e20330ff 	and	r3, r3, #255	; 0xff
3000c398:	e59d2004 	ldr	r2, [sp, #4]
3000c39c:	e2422001 	sub	r2, r2, #1
3000c3a0:	e58d2004 	str	r2, [sp, #4]
3000c3a4:	e3530000 	cmp	r3, #0
3000c3a8:	1affffeb 	bne	3000c35c <acoral_memmove+0x34>
3000c3ac:	ea00001c 	b	3000c424 <acoral_memmove+0xfc>
			*tmp++ = *s++;
		}
	else {
		tmp = (acoral_char *) dest + count;
3000c3b0:	e59d200c 	ldr	r2, [sp, #12]
3000c3b4:	e59d3004 	ldr	r3, [sp, #4]
3000c3b8:	e0823003 	add	r3, r2, r3
3000c3bc:	e58d3010 	str	r3, [sp, #16]
		s = (acoral_char *) src + count;
3000c3c0:	e59d2008 	ldr	r2, [sp, #8]
3000c3c4:	e59d3004 	ldr	r3, [sp, #4]
3000c3c8:	e0823003 	add	r3, r2, r3
3000c3cc:	e58d3014 	str	r3, [sp, #20]
		while (count--)
3000c3d0:	ea000009 	b	3000c3fc <acoral_memmove+0xd4>
			*--tmp = *--s;
3000c3d4:	e59d3010 	ldr	r3, [sp, #16]
3000c3d8:	e2433001 	sub	r3, r3, #1
3000c3dc:	e58d3010 	str	r3, [sp, #16]
3000c3e0:	e59d3014 	ldr	r3, [sp, #20]
3000c3e4:	e2433001 	sub	r3, r3, #1
3000c3e8:	e58d3014 	str	r3, [sp, #20]
3000c3ec:	e59d3014 	ldr	r3, [sp, #20]
3000c3f0:	e5d32000 	ldrb	r2, [r3]
3000c3f4:	e59d3010 	ldr	r3, [sp, #16]
3000c3f8:	e5c32000 	strb	r2, [r3]
			*tmp++ = *s++;
		}
	else {
		tmp = (acoral_char *) dest + count;
		s = (acoral_char *) src + count;
		while (count--)
3000c3fc:	e59d3004 	ldr	r3, [sp, #4]
3000c400:	e3530000 	cmp	r3, #0
3000c404:	03a03000 	moveq	r3, #0
3000c408:	13a03001 	movne	r3, #1
3000c40c:	e20330ff 	and	r3, r3, #255	; 0xff
3000c410:	e59d2004 	ldr	r2, [sp, #4]
3000c414:	e2422001 	sub	r2, r2, #1
3000c418:	e58d2004 	str	r2, [sp, #4]
3000c41c:	e3530000 	cmp	r3, #0
3000c420:	1affffeb 	bne	3000c3d4 <acoral_memmove+0xac>
			*--tmp = *--s;
		}

	return dest;
3000c424:	e59d300c 	ldr	r3, [sp, #12]
}
3000c428:	e1a00003 	mov	r0, r3
3000c42c:	e28dd018 	add	sp, sp, #24
3000c430:	e12fff1e 	bx	lr

3000c434 <acoral_memcmp>:
 * @cs: One area of memory
 * @ct: Another area of memory
 * @count: The size of the area.
 */
acoral_32 acoral_memcmp(const void * cs,const void * ct,acoral_u32 count)
{
3000c434:	e24dd020 	sub	sp, sp, #32
3000c438:	e58d000c 	str	r0, [sp, #12]
3000c43c:	e58d1008 	str	r1, [sp, #8]
3000c440:	e58d2004 	str	r2, [sp, #4]
	const acoral_u8 *su1, *su2;
	acoral_32 res = 0;
3000c444:	e3a03000 	mov	r3, #0
3000c448:	e58d301c 	str	r3, [sp, #28]

	for( su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
3000c44c:	e59d300c 	ldr	r3, [sp, #12]
3000c450:	e58d3014 	str	r3, [sp, #20]
3000c454:	e59d3008 	ldr	r3, [sp, #8]
3000c458:	e58d3018 	str	r3, [sp, #24]
3000c45c:	ea000012 	b	3000c4ac <acoral_memcmp+0x78>
		if ((res = *su1 - *su2) != 0)
3000c460:	e59d3014 	ldr	r3, [sp, #20]
3000c464:	e5d33000 	ldrb	r3, [r3]
3000c468:	e1a02003 	mov	r2, r3
3000c46c:	e59d3018 	ldr	r3, [sp, #24]
3000c470:	e5d33000 	ldrb	r3, [r3]
3000c474:	e0633002 	rsb	r3, r3, r2
3000c478:	e58d301c 	str	r3, [sp, #28]
3000c47c:	e59d301c 	ldr	r3, [sp, #28]
3000c480:	e3530000 	cmp	r3, #0
3000c484:	1a00000c 	bne	3000c4bc <acoral_memcmp+0x88>
acoral_32 acoral_memcmp(const void * cs,const void * ct,acoral_u32 count)
{
	const acoral_u8 *su1, *su2;
	acoral_32 res = 0;

	for( su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
3000c488:	e59d3014 	ldr	r3, [sp, #20]
3000c48c:	e2833001 	add	r3, r3, #1
3000c490:	e58d3014 	str	r3, [sp, #20]
3000c494:	e59d3018 	ldr	r3, [sp, #24]
3000c498:	e2833001 	add	r3, r3, #1
3000c49c:	e58d3018 	str	r3, [sp, #24]
3000c4a0:	e59d3004 	ldr	r3, [sp, #4]
3000c4a4:	e2433001 	sub	r3, r3, #1
3000c4a8:	e58d3004 	str	r3, [sp, #4]
3000c4ac:	e59d3004 	ldr	r3, [sp, #4]
3000c4b0:	e3530000 	cmp	r3, #0
3000c4b4:	1affffe9 	bne	3000c460 <acoral_memcmp+0x2c>
3000c4b8:	ea000000 	b	3000c4c0 <acoral_memcmp+0x8c>
		if ((res = *su1 - *su2) != 0)
			break;
3000c4bc:	e1a00000 	nop			; (mov r0, r0)
	return res;
3000c4c0:	e59d301c 	ldr	r3, [sp, #28]
}
3000c4c4:	e1a00003 	mov	r0, r3
3000c4c8:	e28dd020 	add	sp, sp, #32
3000c4cc:	e12fff1e 	bx	lr

3000c4d0 <acoral_memscan>:
 *
 * returns the address of the first occurrence of @c, or 1 byte past
 * the area if @c is not found
 */
void * acoral_memscan(void * addr, acoral_32 c, acoral_u32 size)
{
3000c4d0:	e24dd018 	sub	sp, sp, #24
3000c4d4:	e58d000c 	str	r0, [sp, #12]
3000c4d8:	e58d1008 	str	r1, [sp, #8]
3000c4dc:	e58d2004 	str	r2, [sp, #4]
	acoral_u8 * p = (acoral_u8 *) addr;
3000c4e0:	e59d300c 	ldr	r3, [sp, #12]
3000c4e4:	e58d3014 	str	r3, [sp, #20]

	while (size) {
3000c4e8:	ea00000d 	b	3000c524 <acoral_memscan+0x54>
		if (*p == c)
3000c4ec:	e59d3014 	ldr	r3, [sp, #20]
3000c4f0:	e5d33000 	ldrb	r3, [r3]
3000c4f4:	e1a02003 	mov	r2, r3
3000c4f8:	e59d3008 	ldr	r3, [sp, #8]
3000c4fc:	e1520003 	cmp	r2, r3
3000c500:	1a000001 	bne	3000c50c <acoral_memscan+0x3c>
			return (void *) p;
3000c504:	e59d3014 	ldr	r3, [sp, #20]
3000c508:	ea000009 	b	3000c534 <acoral_memscan+0x64>
		p++;
3000c50c:	e59d3014 	ldr	r3, [sp, #20]
3000c510:	e2833001 	add	r3, r3, #1
3000c514:	e58d3014 	str	r3, [sp, #20]
		size--;
3000c518:	e59d3004 	ldr	r3, [sp, #4]
3000c51c:	e2433001 	sub	r3, r3, #1
3000c520:	e58d3004 	str	r3, [sp, #4]
 */
void * acoral_memscan(void * addr, acoral_32 c, acoral_u32 size)
{
	acoral_u8 * p = (acoral_u8 *) addr;

	while (size) {
3000c524:	e59d3004 	ldr	r3, [sp, #4]
3000c528:	e3530000 	cmp	r3, #0
3000c52c:	1affffee 	bne	3000c4ec <acoral_memscan+0x1c>
		if (*p == c)
			return (void *) p;
		p++;
		size--;
	}
  	return (void *) p;
3000c530:	e59d3014 	ldr	r3, [sp, #20]
}
3000c534:	e1a00003 	mov	r0, r3
3000c538:	e28dd018 	add	sp, sp, #24
3000c53c:	e12fff1e 	bx	lr

3000c540 <acoral_strstr>:
 * acoral_strstr - Find the first substring in a %NUL terminated string
 * @s1: The string to be searched
 * @s2: The string to search for
 */
acoral_char * acoral_strstr(const acoral_char * s1,const acoral_char * s2)
{
3000c540:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c544:	e24dd014 	sub	sp, sp, #20
3000c548:	e58d0004 	str	r0, [sp, #4]
3000c54c:	e58d1000 	str	r1, [sp]
	acoral_32 l1, l2;

	l2 = acoral_str_len(s2);
3000c550:	e59d0000 	ldr	r0, [sp]
3000c554:	ebfffc69 	bl	3000b700 <acoral_str_len>
3000c558:	e1a03000 	mov	r3, r0
3000c55c:	e58d300c 	str	r3, [sp, #12]
	if (!l2)
3000c560:	e59d300c 	ldr	r3, [sp, #12]
3000c564:	e3530000 	cmp	r3, #0
3000c568:	1a000001 	bne	3000c574 <acoral_strstr+0x34>
		return (acoral_char *) s1;
3000c56c:	e59d3004 	ldr	r3, [sp, #4]
3000c570:	ea000019 	b	3000c5dc <acoral_strstr+0x9c>
	l1 = acoral_str_len(s1);
3000c574:	e59d0004 	ldr	r0, [sp, #4]
3000c578:	ebfffc60 	bl	3000b700 <acoral_str_len>
3000c57c:	e1a03000 	mov	r3, r0
3000c580:	e58d3008 	str	r3, [sp, #8]
	while (l1 >= l2) {
3000c584:	ea00000f 	b	3000c5c8 <acoral_strstr+0x88>
		l1--;
3000c588:	e59d3008 	ldr	r3, [sp, #8]
3000c58c:	e2433001 	sub	r3, r3, #1
3000c590:	e58d3008 	str	r3, [sp, #8]
		if (!acoral_memcmp(s1,s2,l2))
3000c594:	e59d300c 	ldr	r3, [sp, #12]
3000c598:	e59d0004 	ldr	r0, [sp, #4]
3000c59c:	e59d1000 	ldr	r1, [sp]
3000c5a0:	e1a02003 	mov	r2, r3
3000c5a4:	ebffffa2 	bl	3000c434 <acoral_memcmp>
3000c5a8:	e1a03000 	mov	r3, r0
3000c5ac:	e3530000 	cmp	r3, #0
3000c5b0:	1a000001 	bne	3000c5bc <acoral_strstr+0x7c>
			return (acoral_char *) s1;
3000c5b4:	e59d3004 	ldr	r3, [sp, #4]
3000c5b8:	ea000007 	b	3000c5dc <acoral_strstr+0x9c>
		s1++;
3000c5bc:	e59d3004 	ldr	r3, [sp, #4]
3000c5c0:	e2833001 	add	r3, r3, #1
3000c5c4:	e58d3004 	str	r3, [sp, #4]

	l2 = acoral_str_len(s2);
	if (!l2)
		return (acoral_char *) s1;
	l1 = acoral_str_len(s1);
	while (l1 >= l2) {
3000c5c8:	e59d2008 	ldr	r2, [sp, #8]
3000c5cc:	e59d300c 	ldr	r3, [sp, #12]
3000c5d0:	e1520003 	cmp	r2, r3
3000c5d4:	aaffffeb 	bge	3000c588 <acoral_strstr+0x48>
		l1--;
		if (!acoral_memcmp(s1,s2,l2))
			return (acoral_char *) s1;
		s1++;
	}
	return NULL;
3000c5d8:	e3a03000 	mov	r3, #0
}
3000c5dc:	e1a00003 	mov	r0, r3
3000c5e0:	e28dd014 	add	sp, sp, #20
3000c5e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000c5e8:	e12fff1e 	bx	lr

3000c5ec <acoral_memchr>:
 *
 * returns the address of the first occurrence of @c, or %NULL
 * if @c is not found
 */
void *acoral_memchr(const void *s, acoral_32 c, acoral_u32 n)
{
3000c5ec:	e24dd018 	sub	sp, sp, #24
3000c5f0:	e58d000c 	str	r0, [sp, #12]
3000c5f4:	e58d1008 	str	r1, [sp, #8]
3000c5f8:	e58d2004 	str	r2, [sp, #4]
	const acoral_u8 *p = s;
3000c5fc:	e59d300c 	ldr	r3, [sp, #12]
3000c600:	e58d3014 	str	r3, [sp, #20]
	while (n-- != 0) {
3000c604:	ea00000f 	b	3000c648 <acoral_memchr+0x5c>
        	if ((acoral_u8)c == *p++) {
3000c608:	e59d3008 	ldr	r3, [sp, #8]
3000c60c:	e20320ff 	and	r2, r3, #255	; 0xff
3000c610:	e59d3014 	ldr	r3, [sp, #20]
3000c614:	e5d33000 	ldrb	r3, [r3]
3000c618:	e1520003 	cmp	r2, r3
3000c61c:	13a03000 	movne	r3, #0
3000c620:	03a03001 	moveq	r3, #1
3000c624:	e20330ff 	and	r3, r3, #255	; 0xff
3000c628:	e59d2014 	ldr	r2, [sp, #20]
3000c62c:	e2822001 	add	r2, r2, #1
3000c630:	e58d2014 	str	r2, [sp, #20]
3000c634:	e3530000 	cmp	r3, #0
3000c638:	0a000002 	beq	3000c648 <acoral_memchr+0x5c>
			return (void *)(p-1);
3000c63c:	e59d3014 	ldr	r3, [sp, #20]
3000c640:	e2433001 	sub	r3, r3, #1
3000c644:	ea00000a 	b	3000c674 <acoral_memchr+0x88>
 * if @c is not found
 */
void *acoral_memchr(const void *s, acoral_32 c, acoral_u32 n)
{
	const acoral_u8 *p = s;
	while (n-- != 0) {
3000c648:	e59d3004 	ldr	r3, [sp, #4]
3000c64c:	e3530000 	cmp	r3, #0
3000c650:	03a03000 	moveq	r3, #0
3000c654:	13a03001 	movne	r3, #1
3000c658:	e20330ff 	and	r3, r3, #255	; 0xff
3000c65c:	e59d2004 	ldr	r2, [sp, #4]
3000c660:	e2422001 	sub	r2, r2, #1
3000c664:	e58d2004 	str	r2, [sp, #4]
3000c668:	e3530000 	cmp	r3, #0
3000c66c:	1affffe5 	bne	3000c608 <acoral_memchr+0x1c>
        	if ((acoral_u8)c == *p++) {
			return (void *)(p-1);
		}
	}
	return NULL;
3000c670:	e3a03000 	mov	r3, #0
}
3000c674:	e1a00003 	mov	r0, r3
3000c678:	e28dd018 	add	sp, sp, #24
3000c67c:	e12fff1e 	bx	lr

3000c680 <acoral_rand>:
#include<acoral.h>
static acoral_u32 rand_seed;
acoral_u32 acoral_rand(void)
{
	rand_seed=(rand_seed*123+59)%65536;
3000c680:	e59f3038 	ldr	r3, [pc, #56]	; 3000c6c0 <acoral_rand+0x40>
3000c684:	e5932000 	ldr	r2, [r3]
3000c688:	e1a03002 	mov	r3, r2
3000c68c:	e1a03283 	lsl	r3, r3, #5
3000c690:	e0623003 	rsb	r3, r2, r3
3000c694:	e1a03103 	lsl	r3, r3, #2
3000c698:	e0623003 	rsb	r3, r2, r3
3000c69c:	e283303b 	add	r3, r3, #59	; 0x3b
3000c6a0:	e1a03803 	lsl	r3, r3, #16
3000c6a4:	e1a03823 	lsr	r3, r3, #16
3000c6a8:	e59f2010 	ldr	r2, [pc, #16]	; 3000c6c0 <acoral_rand+0x40>
3000c6ac:	e5823000 	str	r3, [r2]
	return rand_seed;
3000c6b0:	e59f3008 	ldr	r3, [pc, #8]	; 3000c6c0 <acoral_rand+0x40>
3000c6b4:	e5933000 	ldr	r3, [r3]
}
3000c6b8:	e1a00003 	mov	r0, r3
3000c6bc:	e12fff1e 	bx	lr
3000c6c0:	3000f348 	.word	0x3000f348

3000c6c4 <acoral_rand_start>:

void acoral_rand_start(void)
{
3000c6c4:	e92d4008 	push	{r3, lr}
	rand_seed=acoral_ticks;
3000c6c8:	ebffdf87 	bl	300044ec <acoral_get_ticks>
3000c6cc:	e1a02000 	mov	r2, r0
3000c6d0:	e59f3008 	ldr	r3, [pc, #8]	; 3000c6e0 <acoral_rand_start+0x1c>
3000c6d4:	e5832000 	str	r2, [r3]
}
3000c6d8:	e8bd4008 	pop	{r3, lr}
3000c6dc:	e12fff1e 	bx	lr
3000c6e0:	3000f348 	.word	0x3000f348

3000c6e4 <plugin_init>:
#endif

#ifdef CFG_PLUGIN_GUI
	acoral_gui_init();
#endif
}
3000c6e4:	e12fff1e 	bx	lr

3000c6e8 <dummy>:
#include"acoral.h"
#include"../include/shell.h"
void dummy(void *args){
3000c6e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c6ec:	e24dd014 	sub	sp, sp, #20
3000c6f0:	e58d0004 	str	r0, [sp, #4]
	int i=0;
3000c6f4:	e3a03000 	mov	r3, #0
3000c6f8:	e58d300c 	str	r3, [sp, #12]
	while(1){
		i++;
3000c6fc:	e59d300c 	ldr	r3, [sp, #12]
3000c700:	e2833001 	add	r3, r3, #1
3000c704:	e58d300c 	str	r3, [sp, #12]
//		LedControl(i);
		acoral_delay_self(1000);
3000c708:	e3a00ffa 	mov	r0, #1000	; 0x3e8
3000c70c:	ebffd890 	bl	30002954 <acoral_delay_self>
	}
3000c710:	eafffff9 	b	3000c6fc <dummy+0x14>

3000c714 <user_main>:
#endif
#ifdef CFG_WEB_SERVER
	user_httpd();
#endif
//	acoral_create_thread(dummy,256,NULL,NULL,20,0);
}
3000c714:	e12fff1e 	bx	lr

3000c718 <parse_args>:
	PS_STRING,
	PS_ESCAPE
};

void parse_args(acoral_char *argstr, acoral_32 *argc_p, acoral_char **argv, acoral_char** resid,enum parse_state *stacked)
{
3000c718:	e24dd018 	sub	sp, sp, #24
3000c71c:	e58d000c 	str	r0, [sp, #12]
3000c720:	e58d1008 	str	r1, [sp, #8]
3000c724:	e58d2004 	str	r2, [sp, #4]
3000c728:	e58d3000 	str	r3, [sp]
	acoral_32 argc = 0;
3000c72c:	e3a03000 	mov	r3, #0
3000c730:	e58d3010 	str	r3, [sp, #16]
	acoral_char c;
	enum parse_state newState;
	enum parse_state stacked_state=*stacked;
3000c734:	e59d3018 	ldr	r3, [sp, #24]
3000c738:	e5d33000 	ldrb	r3, [r3]
3000c73c:	e5cd3016 	strb	r3, [sp, #22]
	enum parse_state lastState = PS_WHITESPACE;
3000c740:	e3a03000 	mov	r3, #0
3000c744:	e5cd3017 	strb	r3, [sp, #23]

	while ((c = *argstr) != 0&&argc<MAX_ARGS_NUM) {
3000c748:	ea000059 	b	3000c8b4 <parse_args+0x19c>

		if (c == ';' && lastState != PS_STRING && lastState != PS_ESCAPE)
3000c74c:	e5dd3014 	ldrb	r3, [sp, #20]
3000c750:	e353003b 	cmp	r3, #59	; 0x3b
3000c754:	1a000005 	bne	3000c770 <parse_args+0x58>
3000c758:	e5dd3017 	ldrb	r3, [sp, #23]
3000c75c:	e3530002 	cmp	r3, #2
3000c760:	0a000002 	beq	3000c770 <parse_args+0x58>
3000c764:	e5dd3017 	ldrb	r3, [sp, #23]
3000c768:	e3530003 	cmp	r3, #3
3000c76c:	1a00005a 	bne	3000c8dc <parse_args+0x1c4>
			break;

		if (lastState == PS_ESCAPE) {
3000c770:	e5dd3017 	ldrb	r3, [sp, #23]
3000c774:	e3530003 	cmp	r3, #3
3000c778:	1a000002 	bne	3000c788 <parse_args+0x70>
			newState = stacked_state;
3000c77c:	e5dd3016 	ldrb	r3, [sp, #22]
3000c780:	e5cd3015 	strb	r3, [sp, #21]
3000c784:	ea000045 	b	3000c8a0 <parse_args+0x188>
		} else if (lastState == PS_STRING) {
3000c788:	e5dd3017 	ldrb	r3, [sp, #23]
3000c78c:	e3530002 	cmp	r3, #2
3000c790:	1a00000b 	bne	3000c7c4 <parse_args+0xac>
			if (c == '"') {
3000c794:	e5dd3014 	ldrb	r3, [sp, #20]
3000c798:	e3530022 	cmp	r3, #34	; 0x22
3000c79c:	1a000005 	bne	3000c7b8 <parse_args+0xa0>
				newState = PS_WHITESPACE;
3000c7a0:	e3a03000 	mov	r3, #0
3000c7a4:	e5cd3015 	strb	r3, [sp, #21]
				*argstr = 0;
3000c7a8:	e59d300c 	ldr	r3, [sp, #12]
3000c7ac:	e3a02000 	mov	r2, #0
3000c7b0:	e5c32000 	strb	r2, [r3]
			} else {
				newState = PS_STRING;
3000c7b4:	ea000039 	b	3000c8a0 <parse_args+0x188>
3000c7b8:	e3a03002 	mov	r3, #2
3000c7bc:	e5cd3015 	strb	r3, [sp, #21]
3000c7c0:	ea000036 	b	3000c8a0 <parse_args+0x188>
			}
		} else if ((c == ' ') || (c == '\t')) {
3000c7c4:	e5dd3014 	ldrb	r3, [sp, #20]
3000c7c8:	e3530020 	cmp	r3, #32
3000c7cc:	0a000002 	beq	3000c7dc <parse_args+0xc4>
3000c7d0:	e5dd3014 	ldrb	r3, [sp, #20]
3000c7d4:	e3530009 	cmp	r3, #9
3000c7d8:	1a000005 	bne	3000c7f4 <parse_args+0xdc>
			*argstr = 0;
3000c7dc:	e59d300c 	ldr	r3, [sp, #12]
3000c7e0:	e3a02000 	mov	r2, #0
3000c7e4:	e5c32000 	strb	r2, [r3]
			newState = PS_WHITESPACE;
3000c7e8:	e3a03000 	mov	r3, #0
3000c7ec:	e5cd3015 	strb	r3, [sp, #21]
				newState = PS_WHITESPACE;
				*argstr = 0;
			} else {
				newState = PS_STRING;
			}
		} else if ((c == ' ') || (c == '\t')) {
3000c7f0:	ea00002a 	b	3000c8a0 <parse_args+0x188>
			*argstr = 0;
			newState = PS_WHITESPACE;
		} else if (c == '"') {
3000c7f4:	e5dd3014 	ldrb	r3, [sp, #20]
3000c7f8:	e3530022 	cmp	r3, #34	; 0x22
3000c7fc:	1a000011 	bne	3000c848 <parse_args+0x130>
			newState = PS_STRING;
3000c800:	e3a03002 	mov	r3, #2
3000c804:	e5cd3015 	strb	r3, [sp, #21]
			*argstr++ = 0;
3000c808:	e59d300c 	ldr	r3, [sp, #12]
3000c80c:	e3a02000 	mov	r2, #0
3000c810:	e5c32000 	strb	r2, [r3]
3000c814:	e59d300c 	ldr	r3, [sp, #12]
3000c818:	e2833001 	add	r3, r3, #1
3000c81c:	e58d300c 	str	r3, [sp, #12]
			argv[argc++] = argstr;
3000c820:	e59d3010 	ldr	r3, [sp, #16]
3000c824:	e1a02103 	lsl	r2, r3, #2
3000c828:	e59d3004 	ldr	r3, [sp, #4]
3000c82c:	e0823003 	add	r3, r2, r3
3000c830:	e59d200c 	ldr	r2, [sp, #12]
3000c834:	e5832000 	str	r2, [r3]
3000c838:	e59d3010 	ldr	r3, [sp, #16]
3000c83c:	e2833001 	add	r3, r3, #1
3000c840:	e58d3010 	str	r3, [sp, #16]
3000c844:	ea000015 	b	3000c8a0 <parse_args+0x188>
		} else if (c == '\\') {
3000c848:	e5dd3014 	ldrb	r3, [sp, #20]
3000c84c:	e353005c 	cmp	r3, #92	; 0x5c
3000c850:	1a000004 	bne	3000c868 <parse_args+0x150>
			stacked_state = lastState;
3000c854:	e5dd3017 	ldrb	r3, [sp, #23]
3000c858:	e5cd3016 	strb	r3, [sp, #22]
			newState = PS_ESCAPE;
3000c85c:	e3a03003 	mov	r3, #3
3000c860:	e5cd3015 	strb	r3, [sp, #21]
3000c864:	ea00000d 	b	3000c8a0 <parse_args+0x188>
		} else {
			if (lastState == PS_WHITESPACE) {
3000c868:	e5dd3017 	ldrb	r3, [sp, #23]
3000c86c:	e3530000 	cmp	r3, #0
3000c870:	1a000008 	bne	3000c898 <parse_args+0x180>
				argv[argc++] = argstr;
3000c874:	e59d3010 	ldr	r3, [sp, #16]
3000c878:	e1a02103 	lsl	r2, r3, #2
3000c87c:	e59d3004 	ldr	r3, [sp, #4]
3000c880:	e0823003 	add	r3, r2, r3
3000c884:	e59d200c 	ldr	r2, [sp, #12]
3000c888:	e5832000 	str	r2, [r3]
3000c88c:	e59d3010 	ldr	r3, [sp, #16]
3000c890:	e2833001 	add	r3, r3, #1
3000c894:	e58d3010 	str	r3, [sp, #16]
			}
			newState = PS_TOKEN;
3000c898:	e3a03001 	mov	r3, #1
3000c89c:	e5cd3015 	strb	r3, [sp, #21]
		}

		lastState = newState;
3000c8a0:	e5dd3015 	ldrb	r3, [sp, #21]
3000c8a4:	e5cd3017 	strb	r3, [sp, #23]
		argstr++;
3000c8a8:	e59d300c 	ldr	r3, [sp, #12]
3000c8ac:	e2833001 	add	r3, r3, #1
3000c8b0:	e58d300c 	str	r3, [sp, #12]
	acoral_char c;
	enum parse_state newState;
	enum parse_state stacked_state=*stacked;
	enum parse_state lastState = PS_WHITESPACE;

	while ((c = *argstr) != 0&&argc<MAX_ARGS_NUM) {
3000c8b4:	e59d300c 	ldr	r3, [sp, #12]
3000c8b8:	e5d33000 	ldrb	r3, [r3]
3000c8bc:	e5cd3014 	strb	r3, [sp, #20]
3000c8c0:	e5dd3014 	ldrb	r3, [sp, #20]
3000c8c4:	e3530000 	cmp	r3, #0
3000c8c8:	0a000004 	beq	3000c8e0 <parse_args+0x1c8>
3000c8cc:	e59d3010 	ldr	r3, [sp, #16]
3000c8d0:	e3530007 	cmp	r3, #7
3000c8d4:	daffff9c 	ble	3000c74c <parse_args+0x34>
3000c8d8:	ea000000 	b	3000c8e0 <parse_args+0x1c8>

		if (c == ';' && lastState != PS_STRING && lastState != PS_ESCAPE)
			break;
3000c8dc:	e1a00000 	nop			; (mov r0, r0)

		lastState = newState;
		argstr++;
	}

	argv[argc] = NULL;
3000c8e0:	e59d3010 	ldr	r3, [sp, #16]
3000c8e4:	e1a02103 	lsl	r2, r3, #2
3000c8e8:	e59d3004 	ldr	r3, [sp, #4]
3000c8ec:	e0823003 	add	r3, r2, r3
3000c8f0:	e3a02000 	mov	r2, #0
3000c8f4:	e5832000 	str	r2, [r3]
	if (argc_p != NULL)
3000c8f8:	e59d3008 	ldr	r3, [sp, #8]
3000c8fc:	e3530000 	cmp	r3, #0
3000c900:	0a000002 	beq	3000c910 <parse_args+0x1f8>
		*argc_p = argc;
3000c904:	e59d3008 	ldr	r3, [sp, #8]
3000c908:	e59d2010 	ldr	r2, [sp, #16]
3000c90c:	e5832000 	str	r2, [r3]

	if (*argstr == ';') {
3000c910:	e59d300c 	ldr	r3, [sp, #12]
3000c914:	e5d33000 	ldrb	r3, [r3]
3000c918:	e353003b 	cmp	r3, #59	; 0x3b
3000c91c:	1a000005 	bne	3000c938 <parse_args+0x220>
		*argstr++ = '\0';
3000c920:	e59d300c 	ldr	r3, [sp, #12]
3000c924:	e3a02000 	mov	r2, #0
3000c928:	e5c32000 	strb	r2, [r3]
3000c92c:	e59d300c 	ldr	r3, [sp, #12]
3000c930:	e2833001 	add	r3, r3, #1
3000c934:	e58d300c 	str	r3, [sp, #12]
	}
	*resid = argstr;
3000c938:	e59d3000 	ldr	r3, [sp]
3000c93c:	e59d200c 	ldr	r2, [sp, #12]
3000c940:	e5832000 	str	r2, [r3]
	*stacked=stacked_state;
3000c944:	e59d3018 	ldr	r3, [sp, #24]
3000c948:	e5dd2016 	ldrb	r2, [sp, #22]
3000c94c:	e5c32000 	strb	r2, [r3]
}
3000c950:	e28dd018 	add	sp, sp, #24
3000c954:	e12fff1e 	bx	lr

3000c958 <add_command>:

void add_command(acoral_shell_cmd_t *cmd)
{
3000c958:	e24dd008 	sub	sp, sp, #8
3000c95c:	e58d0004 	str	r0, [sp, #4]
	if (head_cmd == NULL) {
3000c960:	e59f304c 	ldr	r3, [pc, #76]	; 3000c9b4 <add_command+0x5c>
3000c964:	e5933000 	ldr	r3, [r3]
3000c968:	e3530000 	cmp	r3, #0
3000c96c:	1a000007 	bne	3000c990 <add_command+0x38>
		head_cmd = tail_cmd = cmd;
3000c970:	e59f3040 	ldr	r3, [pc, #64]	; 3000c9b8 <add_command+0x60>
3000c974:	e59d2004 	ldr	r2, [sp, #4]
3000c978:	e5832000 	str	r2, [r3]
3000c97c:	e59f3034 	ldr	r3, [pc, #52]	; 3000c9b8 <add_command+0x60>
3000c980:	e5932000 	ldr	r2, [r3]
3000c984:	e59f3028 	ldr	r3, [pc, #40]	; 3000c9b4 <add_command+0x5c>
3000c988:	e5832000 	str	r2, [r3]
3000c98c:	ea000006 	b	3000c9ac <add_command+0x54>
	} else {
		tail_cmd->next = cmd;
3000c990:	e59f3020 	ldr	r3, [pc, #32]	; 3000c9b8 <add_command+0x60>
3000c994:	e5933000 	ldr	r3, [r3]
3000c998:	e59d2004 	ldr	r2, [sp, #4]
3000c99c:	e583200c 	str	r2, [r3, #12]
		tail_cmd = cmd;
3000c9a0:	e59f3010 	ldr	r3, [pc, #16]	; 3000c9b8 <add_command+0x60>
3000c9a4:	e59d2004 	ldr	r2, [sp, #4]
3000c9a8:	e5832000 	str	r2, [r3]
	}
}
3000c9ac:	e28dd008 	add	sp, sp, #8
3000c9b0:	e12fff1e 	bx	lr
3000c9b4:	3000facc 	.word	0x3000facc
3000c9b8:	30010420 	.word	0x30010420

3000c9bc <find_cmd>:

acoral_shell_cmd_t *find_cmd(acoral_char *cmdname)
{
3000c9bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000c9c0:	e24dd014 	sub	sp, sp, #20
3000c9c4:	e58d0004 	str	r0, [sp, #4]
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
3000c9c8:	e59f305c 	ldr	r3, [pc, #92]	; 3000ca2c <find_cmd+0x70>
3000c9cc:	e5933000 	ldr	r3, [r3]
3000c9d0:	e58d300c 	str	r3, [sp, #12]
	while(curr != NULL) {
3000c9d4:	ea00000c 	b	3000ca0c <find_cmd+0x50>
		if (acoral_str_cmp(curr->name, cmdname) == 0)
3000c9d8:	e59d300c 	ldr	r3, [sp, #12]
3000c9dc:	e5933000 	ldr	r3, [r3]
3000c9e0:	e1a00003 	mov	r0, r3
3000c9e4:	e59d1004 	ldr	r1, [sp, #4]
3000c9e8:	ebfffb78 	bl	3000b7d0 <acoral_str_cmp>
3000c9ec:	e1a03000 	mov	r3, r0
3000c9f0:	e3530000 	cmp	r3, #0
3000c9f4:	1a000001 	bne	3000ca00 <find_cmd+0x44>
			return curr;
3000c9f8:	e59d300c 	ldr	r3, [sp, #12]
3000c9fc:	ea000006 	b	3000ca1c <find_cmd+0x60>
		curr = curr->next;
3000ca00:	e59d300c 	ldr	r3, [sp, #12]
3000ca04:	e593300c 	ldr	r3, [r3, #12]
3000ca08:	e58d300c 	str	r3, [sp, #12]

acoral_shell_cmd_t *find_cmd(acoral_char *cmdname)
{
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
	while(curr != NULL) {
3000ca0c:	e59d300c 	ldr	r3, [sp, #12]
3000ca10:	e3530000 	cmp	r3, #0
3000ca14:	1affffef 	bne	3000c9d8 <find_cmd+0x1c>
		if (acoral_str_cmp(curr->name, cmdname) == 0)
			return curr;
		curr = curr->next;
	}
	return NULL;
3000ca18:	e3a03000 	mov	r3, #0
}
3000ca1c:	e1a00003 	mov	r0, r3
3000ca20:	e28dd014 	add	sp, sp, #20
3000ca24:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000ca28:	e12fff1e 	bx	lr
3000ca2c:	3000facc 	.word	0x3000facc

3000ca30 <execmd>:

void execmd(acoral_32 argc,acoral_char **argv)
{
3000ca30:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000ca34:	e24dd014 	sub	sp, sp, #20
3000ca38:	e58d0004 	str	r0, [sp, #4]
3000ca3c:	e58d1000 	str	r1, [sp]
	acoral_shell_cmd_t *cmd = find_cmd(argv[0]);
3000ca40:	e59d3000 	ldr	r3, [sp]
3000ca44:	e5933000 	ldr	r3, [r3]
3000ca48:	e1a00003 	mov	r0, r3
3000ca4c:	ebffffda 	bl	3000c9bc <find_cmd>
3000ca50:	e1a03000 	mov	r3, r0
3000ca54:	e58d300c 	str	r3, [sp, #12]
	if (cmd == NULL) {
3000ca58:	e59d300c 	ldr	r3, [sp, #12]
3000ca5c:	e3530000 	cmp	r3, #0
3000ca60:	1a000007 	bne	3000ca84 <execmd+0x54>
		acoral_print("Could not found '%s' command\r\n", argv[0]);
3000ca64:	e59d3000 	ldr	r3, [sp]
3000ca68:	e5933000 	ldr	r3, [r3]
3000ca6c:	e59f0034 	ldr	r0, [pc, #52]	; 3000caa8 <execmd+0x78>
3000ca70:	e1a01003 	mov	r1, r3
3000ca74:	ebfff9e3 	bl	3000b208 <acoral_print>
		acoral_print("you can type 'help'\r\n"); 
3000ca78:	e59f002c 	ldr	r0, [pc, #44]	; 3000caac <execmd+0x7c>
3000ca7c:	ebfff9e1 	bl	3000b208 <acoral_print>
		return;
3000ca80:	ea000005 	b	3000ca9c <execmd+0x6c>
	}
	cmd->exe(argc, argv);
3000ca84:	e59d300c 	ldr	r3, [sp, #12]
3000ca88:	e5933004 	ldr	r3, [r3, #4]
3000ca8c:	e59d0004 	ldr	r0, [sp, #4]
3000ca90:	e59d1000 	ldr	r1, [sp]
3000ca94:	e1a0e00f 	mov	lr, pc
3000ca98:	e12fff13 	bx	r3
}
3000ca9c:	e28dd014 	add	sp, sp, #20
3000caa0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000caa4:	e12fff1e 	bx	lr
3000caa8:	3000e7f0 	.word	0x3000e7f0
3000caac:	3000e810 	.word	0x3000e810

3000cab0 <cmd_exe>:


void cmd_exe(acoral_char *buf){
3000cab0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cab4:	e24dd044 	sub	sp, sp, #68	; 0x44
3000cab8:	e58d000c 	str	r0, [sp, #12]
	acoral_32 argc;
	acoral_char *argv[MAX_ARGS_NUM];
	acoral_char *resid;
	enum parse_state stacked_state;
	while (*buf) {
3000cabc:	ea000015 	b	3000cb18 <cmd_exe+0x68>
		acoral_memset(argv, 0, sizeof(argv));
3000cac0:	e28d301c 	add	r3, sp, #28
3000cac4:	e1a00003 	mov	r0, r3
3000cac8:	e3a01000 	mov	r1, #0
3000cacc:	e3a02020 	mov	r2, #32
3000cad0:	ebfffdd7 	bl	3000c234 <acoral_memset>
		parse_args(buf, &argc, argv, &resid,&stacked_state);
3000cad4:	e28d103c 	add	r1, sp, #60	; 0x3c
3000cad8:	e28d201c 	add	r2, sp, #28
3000cadc:	e28d3018 	add	r3, sp, #24
3000cae0:	e28d0017 	add	r0, sp, #23
3000cae4:	e58d0000 	str	r0, [sp]
3000cae8:	e59d000c 	ldr	r0, [sp, #12]
3000caec:	ebffff09 	bl	3000c718 <parse_args>
		if (argc > 0)
3000caf0:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
3000caf4:	e3530000 	cmp	r3, #0
3000caf8:	da000004 	ble	3000cb10 <cmd_exe+0x60>
			execmd(argc, (const acoral_char **)argv);
3000cafc:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
3000cb00:	e28d301c 	add	r3, sp, #28
3000cb04:	e1a00002 	mov	r0, r2
3000cb08:	e1a01003 	mov	r1, r3
3000cb0c:	ebffffc7 	bl	3000ca30 <execmd>
		buf = resid;
3000cb10:	e59d3018 	ldr	r3, [sp, #24]
3000cb14:	e58d300c 	str	r3, [sp, #12]
void cmd_exe(acoral_char *buf){
	acoral_32 argc;
	acoral_char *argv[MAX_ARGS_NUM];
	acoral_char *resid;
	enum parse_state stacked_state;
	while (*buf) {
3000cb18:	e59d300c 	ldr	r3, [sp, #12]
3000cb1c:	e5d33000 	ldrb	r3, [r3]
3000cb20:	e3530000 	cmp	r3, #0
3000cb24:	1affffe5 	bne	3000cac0 <cmd_exe+0x10>
		parse_args(buf, &argc, argv, &resid,&stacked_state);
		if (argc > 0)
			execmd(argc, (const acoral_char **)argv);
		buf = resid;
	}	
}
3000cb28:	e28dd044 	add	sp, sp, #68	; 0x44
3000cb2c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cb30:	e12fff1e 	bx	lr

3000cb34 <echo>:

void echo(acoral_char c){
3000cb34:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cb38:	e24dd00c 	sub	sp, sp, #12
3000cb3c:	e1a03000 	mov	r3, r0
3000cb40:	e5cd3007 	strb	r3, [sp, #7]
	acoral_putchar(c);
3000cb44:	e5dd3007 	ldrb	r3, [sp, #7]
3000cb48:	e1a00003 	mov	r0, r3
3000cb4c:	ebfff9fb 	bl	3000b340 <acoral_putchar>
}
3000cb50:	e28dd00c 	add	sp, sp, #12
3000cb54:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cb58:	e12fff1e 	bx	lr

3000cb5c <get_cmd>:

void get_cmd(acoral_char *cmd_buf){
3000cb5c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cb60:	e24dd024 	sub	sp, sp, #36	; 0x24
3000cb64:	e58d000c 	str	r0, [sp, #12]
	acoral_u32 cur_pos;
	acoral_char c;
	acoral_u8 IsEcho=0;
3000cb68:	e3a03000 	mov	r3, #0
3000cb6c:	e5cd3016 	strb	r3, [sp, #22]
	acoral_id console_id;
	console_id=acoral_cur_thread->console_id;
3000cb70:	e59f31a8 	ldr	r3, [pc, #424]	; 3000cd20 <get_cmd+0x1c4>
3000cb74:	e5933000 	ldr	r3, [r3]
3000cb78:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000cb7c:	e58d301c 	str	r3, [sp, #28]
	acoral_dev_config(console_id,CONSOLE_ECHO,&IsEcho,0);
3000cb80:	e28d3016 	add	r3, sp, #22
3000cb84:	e59d001c 	ldr	r0, [sp, #28]
3000cb88:	e3a01001 	mov	r1, #1
3000cb8c:	e1a02003 	mov	r2, r3
3000cb90:	e3a03000 	mov	r3, #0
3000cb94:	eb000283 	bl	3000d5a8 <acoral_dev_config>
	cur_pos=0;
3000cb98:	e3a03000 	mov	r3, #0
3000cb9c:	e58d3018 	str	r3, [sp, #24]
3000cba0:	ea000000 	b	3000cba8 <get_cmd+0x4c>
						echo(c);
					cur_pos++;
				}
				break;
		}
	}
3000cba4:	e1a00000 	nop			; (mov r0, r0)
	acoral_id console_id;
	console_id=acoral_cur_thread->console_id;
	acoral_dev_config(console_id,CONSOLE_ECHO,&IsEcho,0);
	cur_pos=0;
	while(1){
		while(acoral_dev_read(console_id,&c,1,0,0)<1);
3000cba8:	e28d3017 	add	r3, sp, #23
3000cbac:	e3a02000 	mov	r2, #0
3000cbb0:	e58d2000 	str	r2, [sp]
3000cbb4:	e59d001c 	ldr	r0, [sp, #28]
3000cbb8:	e1a01003 	mov	r1, r3
3000cbbc:	e3a02001 	mov	r2, #1
3000cbc0:	e3a03000 	mov	r3, #0
3000cbc4:	eb000251 	bl	3000d510 <acoral_dev_read>
3000cbc8:	e1a03000 	mov	r3, r0
3000cbcc:	e3530000 	cmp	r3, #0
3000cbd0:	dafffff4 	ble	3000cba8 <get_cmd+0x4c>
		switch (c) {
3000cbd4:	e5dd3017 	ldrb	r3, [sp, #23]
3000cbd8:	e353000a 	cmp	r3, #10
3000cbdc:	0a000028 	beq	3000cc84 <get_cmd+0x128>
3000cbe0:	e353000a 	cmp	r3, #10
3000cbe4:	ca000007 	bgt	3000cc08 <get_cmd+0xac>
3000cbe8:	e3530000 	cmp	r3, #0
3000cbec:	0a000024 	beq	3000cc84 <get_cmd+0x128>
3000cbf0:	e3530000 	cmp	r3, #0
3000cbf4:	ba000036 	blt	3000ccd4 <get_cmd+0x178>
3000cbf8:	e2433006 	sub	r3, r3, #6
3000cbfc:	e3530002 	cmp	r3, #2
3000cc00:	8a000033 	bhi	3000ccd4 <get_cmd+0x178>
3000cc04:	ea000009 	b	3000cc30 <get_cmd+0xd4>
3000cc08:	e3530018 	cmp	r3, #24
3000cc0c:	0a00002d 	beq	3000ccc8 <get_cmd+0x16c>
3000cc10:	e3530018 	cmp	r3, #24
3000cc14:	ca000002 	bgt	3000cc24 <get_cmd+0xc8>
3000cc18:	e353000d 	cmp	r3, #13
3000cc1c:	0a000018 	beq	3000cc84 <get_cmd+0x128>
3000cc20:	ea00002b 	b	3000ccd4 <get_cmd+0x178>
3000cc24:	e243307e 	sub	r3, r3, #126	; 0x7e
3000cc28:	e3530001 	cmp	r3, #1
3000cc2c:	8a000028 	bhi	3000ccd4 <get_cmd+0x178>
			case 0x08:
			case 0x06:
			case 0x07:
			case 0x7E:
			case 0x7F:
				if (cur_pos) {
3000cc30:	e59d3018 	ldr	r3, [sp, #24]
3000cc34:	e3530000 	cmp	r3, #0
3000cc38:	0a00000b 	beq	3000cc6c <get_cmd+0x110>
					cur_pos--;
3000cc3c:	e59d3018 	ldr	r3, [sp, #24]
3000cc40:	e2433001 	sub	r3, r3, #1
3000cc44:	e58d3018 	str	r3, [sp, #24]
					if(IsEcho){
3000cc48:	e5dd3016 	ldrb	r3, [sp, #22]
3000cc4c:	e3530000 	cmp	r3, #0
3000cc50:	0a000005 	beq	3000cc6c <get_cmd+0x110>
						echo(0x08);
3000cc54:	e3a00008 	mov	r0, #8
3000cc58:	ebffffb5 	bl	3000cb34 <echo>
						echo(' ');
3000cc5c:	e3a00020 	mov	r0, #32
3000cc60:	ebffffb3 	bl	3000cb34 <echo>
						echo(0x08);
3000cc64:	e3a00008 	mov	r0, #8
3000cc68:	ebffffb1 	bl	3000cb34 <echo>
					}
				}
				cmd_buf[cur_pos] = '\0';
3000cc6c:	e59d200c 	ldr	r2, [sp, #12]
3000cc70:	e59d3018 	ldr	r3, [sp, #24]
3000cc74:	e0823003 	add	r3, r2, r3
3000cc78:	e3a02000 	mov	r2, #0
3000cc7c:	e5c32000 	strb	r2, [r3]
				break;
3000cc80:	ea000025 	b	3000cd1c <get_cmd+0x1c0>
			case '\r':
			case '\n':
			case '\0':
				echo('\r');
3000cc84:	e3a0000d 	mov	r0, #13
3000cc88:	ebffffa9 	bl	3000cb34 <echo>
				echo('\n');
3000cc8c:	e3a0000a 	mov	r0, #10
3000cc90:	ebffffa7 	bl	3000cb34 <echo>
				cmd_buf[cur_pos]='\0';
3000cc94:	e59d200c 	ldr	r2, [sp, #12]
3000cc98:	e59d3018 	ldr	r3, [sp, #24]
3000cc9c:	e0823003 	add	r3, r2, r3
3000cca0:	e3a02000 	mov	r2, #0
3000cca4:	e5c32000 	strb	r2, [r3]
				acoral_dev_config(console_id,CONSOLE_BUF_CLEAR,NULL,0);
3000cca8:	e59d001c 	ldr	r0, [sp, #28]
3000ccac:	e3a01004 	mov	r1, #4
3000ccb0:	e3a02000 	mov	r2, #0
3000ccb4:	e3a03000 	mov	r3, #0
3000ccb8:	eb00023a 	bl	3000d5a8 <acoral_dev_config>
					cur_pos++;
				}
				break;
		}
	}
}
3000ccbc:	e28dd024 	add	sp, sp, #36	; 0x24
3000ccc0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000ccc4:	e12fff1e 	bx	lr
				echo('\n');
				cmd_buf[cur_pos]='\0';
				acoral_dev_config(console_id,CONSOLE_BUF_CLEAR,NULL,0);
				return;
			case 'x'-'a'+1:
				cur_pos = 0;
3000ccc8:	e3a03000 	mov	r3, #0
3000cccc:	e58d3018 	str	r3, [sp, #24]
				break;
3000ccd0:	ea000011 	b	3000cd1c <get_cmd+0x1c0>

			default:
				if (cur_pos < BUF_SIZE) {
3000ccd4:	e59d3018 	ldr	r3, [sp, #24]
3000ccd8:	e353007f 	cmp	r3, #127	; 0x7f
3000ccdc:	8affffb0 	bhi	3000cba4 <get_cmd+0x48>
					cmd_buf[cur_pos] = c;
3000cce0:	e59d200c 	ldr	r2, [sp, #12]
3000cce4:	e59d3018 	ldr	r3, [sp, #24]
3000cce8:	e0823003 	add	r3, r2, r3
3000ccec:	e5dd2017 	ldrb	r2, [sp, #23]
3000ccf0:	e5c32000 	strb	r2, [r3]
					if(IsEcho)
3000ccf4:	e5dd3016 	ldrb	r3, [sp, #22]
3000ccf8:	e3530000 	cmp	r3, #0
3000ccfc:	0a000002 	beq	3000cd0c <get_cmd+0x1b0>
						echo(c);
3000cd00:	e5dd3017 	ldrb	r3, [sp, #23]
3000cd04:	e1a00003 	mov	r0, r3
3000cd08:	ebffff89 	bl	3000cb34 <echo>
					cur_pos++;
3000cd0c:	e59d3018 	ldr	r3, [sp, #24]
3000cd10:	e2833001 	add	r3, r3, #1
3000cd14:	e58d3018 	str	r3, [sp, #24]
				}
				break;
		}
	}
3000cd18:	eaffffa2 	b	3000cba8 <get_cmd+0x4c>
3000cd1c:	eaffffa1 	b	3000cba8 <get_cmd+0x4c>
3000cd20:	300103f8 	.word	0x300103f8

3000cd24 <acoral_shell_init>:
}

#define SHELL_STACK_SIZE 1024
void acoral_shell_init(){
3000cd24:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cd28:	e24dd01c 	sub	sp, sp, #28
	acoral_comm_policy_data_t data;
	head_cmd=NULL;
3000cd2c:	e59f3070 	ldr	r3, [pc, #112]	; 3000cda4 <acoral_shell_init+0x80>
3000cd30:	e3a02000 	mov	r2, #0
3000cd34:	e5832000 	str	r2, [r3]
	tail_cmd=NULL;
3000cd38:	e59f3068 	ldr	r3, [pc, #104]	; 3000cda8 <acoral_shell_init+0x84>
3000cd3c:	e3a02000 	mov	r2, #0
3000cd40:	e5832000 	str	r2, [r3]
	cmd_init();
3000cd44:	eb000094 	bl	3000cf9c <cmd_init>
#ifdef CFG_UART_SHELL
	data.cpu=acoral_current_cpu;
3000cd48:	e3a03000 	mov	r3, #0
3000cd4c:	e5cd3014 	strb	r3, [sp, #20]
	data.prio=ACORAL_TMP_PRIO;
3000cd50:	e3a03045 	mov	r3, #69	; 0x45
3000cd54:	e5cd3015 	strb	r3, [sp, #21]
	data.prio_type=ACORAL_ABSOLUTE_PRIO;
3000cd58:	e3a03004 	mov	r3, #4
3000cd5c:	e5cd3016 	strb	r3, [sp, #22]
	acoral_create_thread_ext(acoral_shell_enter,SHELL_STACK_SIZE,(void *)acoral_cur_thread->console_id,"shell",NULL,ACORAL_SCHED_POLICY_COMM,&data);
3000cd60:	e59f3044 	ldr	r3, [pc, #68]	; 3000cdac <acoral_shell_init+0x88>
3000cd64:	e5933000 	ldr	r3, [r3]
3000cd68:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000cd6c:	e3a02000 	mov	r2, #0
3000cd70:	e58d2000 	str	r2, [sp]
3000cd74:	e3a02015 	mov	r2, #21
3000cd78:	e58d2004 	str	r2, [sp, #4]
3000cd7c:	e28d2014 	add	r2, sp, #20
3000cd80:	e58d2008 	str	r2, [sp, #8]
3000cd84:	e59f0024 	ldr	r0, [pc, #36]	; 3000cdb0 <acoral_shell_init+0x8c>
3000cd88:	e3a01b01 	mov	r1, #1024	; 0x400
3000cd8c:	e1a02003 	mov	r2, r3
3000cd90:	e59f301c 	ldr	r3, [pc, #28]	; 3000cdb4 <acoral_shell_init+0x90>
3000cd94:	ebffd3a6 	bl	30001c34 <create_thread_ext>
#endif
}
3000cd98:	e28dd01c 	add	sp, sp, #28
3000cd9c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cda0:	e12fff1e 	bx	lr
3000cda4:	3000facc 	.word	0x3000facc
3000cda8:	30010420 	.word	0x30010420
3000cdac:	300103f8 	.word	0x300103f8
3000cdb0:	3000cddc 	.word	0x3000cddc
3000cdb4:	3000e828 	.word	0x3000e828

3000cdb8 <acoral_shell_exit>:

void acoral_shell_exit(void *ptr){
3000cdb8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cdbc:	e24dd00c 	sub	sp, sp, #12
3000cdc0:	e58d0004 	str	r0, [sp, #4]
	acoral_free(ptr);
3000cdc4:	e59d0004 	ldr	r0, [sp, #4]
3000cdc8:	ebffe5aa 	bl	30006478 <buddy_free>
	acoral_thread_exit();
3000cdcc:	ebffd71f 	bl	30002a50 <acoral_thread_exit>
}
3000cdd0:	e28dd00c 	add	sp, sp, #12
3000cdd4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cdd8:	e12fff1e 	bx	lr

3000cddc <acoral_shell_enter>:

void acoral_shell_enter(void *args){
3000cddc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cde0:	e24dd014 	sub	sp, sp, #20
3000cde4:	e58d0004 	str	r0, [sp, #4]
	acoral_char *cmd_buf;
	acoral_set_thread_console((acoral_id)args);
3000cde8:	e59d3004 	ldr	r3, [sp, #4]
3000cdec:	e1a00003 	mov	r0, r3
3000cdf0:	ebffd845 	bl	30002f0c <acoral_set_thread_console>
	if(acoral_cur_thread->console_id<0){
3000cdf4:	e59f306c 	ldr	r3, [pc, #108]	; 3000ce68 <acoral_shell_enter+0x8c>
3000cdf8:	e5933000 	ldr	r3, [r3]
3000cdfc:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000ce00:	e3530000 	cmp	r3, #0
3000ce04:	aa000004 	bge	3000ce1c <acoral_shell_enter+0x40>
		acoral_prints("The thread have no Console\n");
3000ce08:	e59f005c 	ldr	r0, [pc, #92]	; 3000ce6c <acoral_shell_enter+0x90>
3000ce0c:	ebfff920 	bl	3000b294 <acoral_prints>
		acoral_prints("aCoral:>");
		get_cmd(cmd_buf);
		if(cmd_buf[0])
			cmd_exe(cmd_buf);
	}
}
3000ce10:	e28dd014 	add	sp, sp, #20
3000ce14:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000ce18:	e12fff1e 	bx	lr
	acoral_set_thread_console((acoral_id)args);
	if(acoral_cur_thread->console_id<0){
		acoral_prints("The thread have no Console\n");
		return;
	}
	cmd_buf=acoral_malloc(sizeof(BUF_SIZE));
3000ce1c:	e3a00004 	mov	r0, #4
3000ce20:	ebffe55c 	bl	30006398 <buddy_malloc>
3000ce24:	e1a03000 	mov	r3, r0
3000ce28:	e58d300c 	str	r3, [sp, #12]
3000ce2c:	ea000000 	b	3000ce34 <acoral_shell_enter+0x58>
		acoral_prints("\r\n");
		acoral_prints("aCoral:>");
		get_cmd(cmd_buf);
		if(cmd_buf[0])
			cmd_exe(cmd_buf);
	}
3000ce30:	e1a00000 	nop			; (mov r0, r0)
		acoral_prints("The thread have no Console\n");
		return;
	}
	cmd_buf=acoral_malloc(sizeof(BUF_SIZE));
	while(1){
		acoral_prints("\r\n");
3000ce34:	e59f0034 	ldr	r0, [pc, #52]	; 3000ce70 <acoral_shell_enter+0x94>
3000ce38:	ebfff915 	bl	3000b294 <acoral_prints>
		acoral_prints("aCoral:>");
3000ce3c:	e59f0030 	ldr	r0, [pc, #48]	; 3000ce74 <acoral_shell_enter+0x98>
3000ce40:	ebfff913 	bl	3000b294 <acoral_prints>
		get_cmd(cmd_buf);
3000ce44:	e59d000c 	ldr	r0, [sp, #12]
3000ce48:	ebffff43 	bl	3000cb5c <get_cmd>
		if(cmd_buf[0])
3000ce4c:	e59d300c 	ldr	r3, [sp, #12]
3000ce50:	e5d33000 	ldrb	r3, [r3]
3000ce54:	e3530000 	cmp	r3, #0
3000ce58:	0afffff4 	beq	3000ce30 <acoral_shell_enter+0x54>
			cmd_exe(cmd_buf);
3000ce5c:	e59d000c 	ldr	r0, [sp, #12]
3000ce60:	ebffff12 	bl	3000cab0 <cmd_exe>
	}
3000ce64:	eafffff2 	b	3000ce34 <acoral_shell_enter+0x58>
3000ce68:	300103f8 	.word	0x300103f8
3000ce6c:	3000e830 	.word	0x3000e830
3000ce70:	3000e84c 	.word	0x3000e84c
3000ce74:	3000e850 	.word	0x3000e850

3000ce78 <malloc_scan>:
#include<kernel.h>
#include"../include/shell.h"
#include"console.h"
void malloc_scan(acoral_32 argc,acoral_char **argv){
3000ce78:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000ce7c:	e24dd00c 	sub	sp, sp, #12
3000ce80:	e58d0004 	str	r0, [sp, #4]
3000ce84:	e58d1000 	str	r1, [sp]
	acoral_mem_scan();
3000ce88:	ebffe151 	bl	300053d4 <buddy_scan>
}
3000ce8c:	e28dd00c 	add	sp, sp, #12
3000ce90:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000ce94:	e12fff1e 	bx	lr

3000ce98 <malloc_scan2>:
	malloc_scan,
	"View the first Level Memory Managment Info",
	NULL
};

void malloc_scan2(acoral_32 argc,acoral_char **argv){
3000ce98:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000ce9c:	e24dd00c 	sub	sp, sp, #12
3000cea0:	e58d0004 	str	r0, [sp, #4]
3000cea4:	e58d1000 	str	r1, [sp]
	acoral_mem_scan2();
3000cea8:	ebffe83a 	bl	30006f98 <v_mem_scan>
}
3000ceac:	e28dd00c 	add	sp, sp, #12
3000ceb0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000ceb4:	e12fff1e 	bx	lr

3000ceb8 <help>:
	"View the seconde Level Memory Managment Info",
	NULL
};

extern acoral_shell_cmd_t *head_cmd;
void help(acoral_32 argc,acoral_char **argv){
3000ceb8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cebc:	e24dd014 	sub	sp, sp, #20
3000cec0:	e58d0004 	str	r0, [sp, #4]
3000cec4:	e58d1000 	str	r1, [sp]
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
3000cec8:	e59f304c 	ldr	r3, [pc, #76]	; 3000cf1c <help+0x64>
3000cecc:	e5933000 	ldr	r3, [r3]
3000ced0:	e58d300c 	str	r3, [sp, #12]
	while(curr != NULL) {
3000ced4:	ea00000a 	b	3000cf04 <help+0x4c>
		acoral_print("%s  %s\n",curr->name,curr->comment);
3000ced8:	e59d300c 	ldr	r3, [sp, #12]
3000cedc:	e5932000 	ldr	r2, [r3]
3000cee0:	e59d300c 	ldr	r3, [sp, #12]
3000cee4:	e5933008 	ldr	r3, [r3, #8]
3000cee8:	e59f0030 	ldr	r0, [pc, #48]	; 3000cf20 <help+0x68>
3000ceec:	e1a01002 	mov	r1, r2
3000cef0:	e1a02003 	mov	r2, r3
3000cef4:	ebfff8c3 	bl	3000b208 <acoral_print>
		curr = curr->next;
3000cef8:	e59d300c 	ldr	r3, [sp, #12]
3000cefc:	e593300c 	ldr	r3, [r3, #12]
3000cf00:	e58d300c 	str	r3, [sp, #12]

extern acoral_shell_cmd_t *head_cmd;
void help(acoral_32 argc,acoral_char **argv){
	acoral_shell_cmd_t *curr;
	curr =head_cmd;
	while(curr != NULL) {
3000cf04:	e59d300c 	ldr	r3, [sp, #12]
3000cf08:	e3530000 	cmp	r3, #0
3000cf0c:	1afffff1 	bne	3000ced8 <help+0x20>
		acoral_print("%s  %s\n",curr->name,curr->comment);
		curr = curr->next;
	}
}
3000cf10:	e28dd014 	add	sp, sp, #20
3000cf14:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cf18:	e12fff1e 	bx	lr
3000cf1c:	3000facc 	.word	0x3000facc
3000cf20:	3000e8cc 	.word	0x3000e8cc

3000cf24 <exit>:
	help,
	"View all Shell Command info",
	NULL
};

void exit(acoral_32 argc,acoral_char **argv){
3000cf24:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cf28:	e24dd00c 	sub	sp, sp, #12
3000cf2c:	e58d0004 	str	r0, [sp, #4]
3000cf30:	e58d1000 	str	r1, [sp]
	acoral_dev_config(acoral_cur_thread->console_id,CONSOLE_EXIT,NULL,0);
3000cf34:	e59f3034 	ldr	r3, [pc, #52]	; 3000cf70 <exit+0x4c>
3000cf38:	e5933000 	ldr	r3, [r3]
3000cf3c:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000cf40:	e1a00003 	mov	r0, r3
3000cf44:	e3a01003 	mov	r1, #3
3000cf48:	e3a02000 	mov	r2, #0
3000cf4c:	e3a03000 	mov	r3, #0
3000cf50:	eb000194 	bl	3000d5a8 <acoral_dev_config>
	acoral_shell_exit((void *)argv[0]);
3000cf54:	e59d3000 	ldr	r3, [sp]
3000cf58:	e5933000 	ldr	r3, [r3]
3000cf5c:	e1a00003 	mov	r0, r3
3000cf60:	ebffff94 	bl	3000cdb8 <acoral_shell_exit>
}
3000cf64:	e28dd00c 	add	sp, sp, #12
3000cf68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cf6c:	e12fff1e 	bx	lr
3000cf70:	300103f8 	.word	0x300103f8

3000cf74 <spg>:
	"exit",
	exit,
	"Exit Shell",
	NULL
};
void spg(acoral_32 argc,acoral_char **argv){
3000cf74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cf78:	e24dd00c 	sub	sp, sp, #12
3000cf7c:	e58d0004 	str	r0, [sp, #4]
3000cf80:	e58d1000 	str	r1, [sp]
	acoral_prints("SPGGOGOGO!");
3000cf84:	e59f000c 	ldr	r0, [pc, #12]	; 3000cf98 <spg+0x24>
3000cf88:	ebfff8c1 	bl	3000b294 <acoral_prints>
}
3000cf8c:	e28dd00c 	add	sp, sp, #12
3000cf90:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000cf94:	e12fff1e 	bx	lr
3000cf98:	3000e90c 	.word	0x3000e90c

3000cf9c <cmd_init>:
};
#endif

extern acoral_shell_cmd_t dt_cmd;
extern fs_cmd_init();
void cmd_init(){
3000cf9c:	e92d4008 	push	{r3, lr}
	add_command(&mem_cmd);
3000cfa0:	e59f0028 	ldr	r0, [pc, #40]	; 3000cfd0 <cmd_init+0x34>
3000cfa4:	ebfffe6b 	bl	3000c958 <add_command>
	//add_command(&mem2_cmd);
	add_command(&dt_cmd);
3000cfa8:	e59f0024 	ldr	r0, [pc, #36]	; 3000cfd4 <cmd_init+0x38>
3000cfac:	ebfffe69 	bl	3000c958 <add_command>
	add_command(&spg_cmd);
3000cfb0:	e59f0020 	ldr	r0, [pc, #32]	; 3000cfd8 <cmd_init+0x3c>
3000cfb4:	ebfffe67 	bl	3000c958 <add_command>
#ifdef CFG_PM
	add_command(&suspend_cmd);
#endif
	add_command(&exit_cmd);
3000cfb8:	e59f001c 	ldr	r0, [pc, #28]	; 3000cfdc <cmd_init+0x40>
3000cfbc:	ebfffe65 	bl	3000c958 <add_command>
	add_command(&help_cmd);
3000cfc0:	e59f0018 	ldr	r0, [pc, #24]	; 3000cfe0 <cmd_init+0x44>
3000cfc4:	ebfffe63 	bl	3000c958 <add_command>
#ifdef CFG_SHELL_FS_CMD
	fs_cmd_init();
#endif

}
3000cfc8:	e8bd4008 	pop	{r3, lr}
3000cfcc:	e12fff1e 	bx	lr
3000cfd0:	3000ea7c 	.word	0x3000ea7c
3000cfd4:	3000eacc 	.word	0x3000eacc
3000cfd8:	3000eabc 	.word	0x3000eabc
3000cfdc:	3000eaac 	.word	0x3000eaac
3000cfe0:	3000ea9c 	.word	0x3000ea9c

3000cfe4 <display_thread>:
#include<thread.h>
#include<policy.h>
#include<hal.h>
#include"../include/shell.h"
void display_thread(acoral_32 argc,acoral_char **argv){
3000cfe4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000cfe8:	e24dd01c 	sub	sp, sp, #28
3000cfec:	e58d0004 	str	r0, [sp, #4]
3000cff0:	e58d1000 	str	r1, [sp]
	acoral_sr cpu_sr;	
	acoral_list_t *head,*tmp;
	acoral_thread_t * thread;
	head=&acoral_threads_queue.head;
3000cff4:	e59f31b4 	ldr	r3, [pc, #436]	; 3000d1b0 <display_thread+0x1cc>
3000cff8:	e58d300c 	str	r3, [sp, #12]
	acoral_prints("\t\tSystem Thread Information\r\n");
3000cffc:	e59f01b0 	ldr	r0, [pc, #432]	; 3000d1b4 <display_thread+0x1d0>
3000d000:	ebfff8a3 	bl	3000b294 <acoral_prints>
	acoral_prints("------------------------------------------------------\r\n");
3000d004:	e59f01ac 	ldr	r0, [pc, #428]	; 3000d1b8 <display_thread+0x1d4>
3000d008:	ebfff8a1 	bl	3000b294 <acoral_prints>
	acoral_prints("Name\t\tType\t\tConsole\t\tState\r\n");
3000d00c:	e59f01a8 	ldr	r0, [pc, #424]	; 3000d1bc <display_thread+0x1d8>
3000d010:	ebfff89f 	bl	3000b294 <acoral_prints>
	HAL_ENTER_CRITICAL();
3000d014:	ebffd1b6 	bl	300016f4 <HAL_INTR_DISABLE_SAVE>
3000d018:	e1a03000 	mov	r3, r0
3000d01c:	e58d3008 	str	r3, [sp, #8]
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
3000d020:	e59d300c 	ldr	r3, [sp, #12]
3000d024:	e5933000 	ldr	r3, [r3]
3000d028:	e58d3010 	str	r3, [sp, #16]
3000d02c:	ea000054 	b	3000d184 <display_thread+0x1a0>
		thread=list_entry(tmp,acoral_thread_t,global_list);
3000d030:	e59d3010 	ldr	r3, [sp, #16]
3000d034:	e2433028 	sub	r3, r3, #40	; 0x28
3000d038:	e58d3014 	str	r3, [sp, #20]
		acoral_print("%s\t\t",thread->name);
3000d03c:	e59d3014 	ldr	r3, [sp, #20]
3000d040:	e5933048 	ldr	r3, [r3, #72]	; 0x48
3000d044:	e59f0174 	ldr	r0, [pc, #372]	; 3000d1c0 <display_thread+0x1dc>
3000d048:	e1a01003 	mov	r1, r3
3000d04c:	ebfff86d 	bl	3000b208 <acoral_print>
		switch(thread->policy){
3000d050:	e59d3014 	ldr	r3, [sp, #20]
3000d054:	e5d3300c 	ldrb	r3, [r3, #12]
3000d058:	e2433015 	sub	r3, r3, #21
3000d05c:	e3530004 	cmp	r3, #4
3000d060:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
3000d064:	ea000012 	b	3000d0b4 <display_thread+0xd0>
3000d068:	3000d07c 	.word	0x3000d07c
3000d06c:	3000d094 	.word	0x3000d094
3000d070:	3000d0a0 	.word	0x3000d0a0
3000d074:	3000d088 	.word	0x3000d088
3000d078:	3000d0ac 	.word	0x3000d0ac
			case ACORAL_SCHED_POLICY_COMM:
				acoral_prints("Common\t\t");
3000d07c:	e59f0140 	ldr	r0, [pc, #320]	; 3000d1c4 <display_thread+0x1e0>
3000d080:	ebfff883 	bl	3000b294 <acoral_prints>
				break;
3000d084:	ea00000a 	b	3000d0b4 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_SLICE:
				acoral_prints("Slice\t\t");
3000d088:	e59f0138 	ldr	r0, [pc, #312]	; 3000d1c8 <display_thread+0x1e4>
3000d08c:	ebfff880 	bl	3000b294 <acoral_prints>
				break;
3000d090:	ea000007 	b	3000d0b4 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_PERIOD:
				acoral_prints("Period\t\t");
3000d094:	e59f0130 	ldr	r0, [pc, #304]	; 3000d1cc <display_thread+0x1e8>
3000d098:	ebfff87d 	bl	3000b294 <acoral_prints>
				break;
3000d09c:	ea000004 	b	3000d0b4 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_RM:
				acoral_prints("RM\t\t");
3000d0a0:	e59f0128 	ldr	r0, [pc, #296]	; 3000d1d0 <display_thread+0x1ec>
3000d0a4:	ebfff87a 	bl	3000b294 <acoral_prints>
				break;
3000d0a8:	ea000001 	b	3000d0b4 <display_thread+0xd0>
			case ACORAL_SCHED_POLICY_POSIX:
				acoral_prints("Posix\t\t");
3000d0ac:	e59f0120 	ldr	r0, [pc, #288]	; 3000d1d4 <display_thread+0x1f0>
3000d0b0:	ebfff877 	bl	3000b294 <acoral_prints>
			default:
				break;
		}
		acoral_print("%d\t\t",thread->console_id);
3000d0b4:	e59d3014 	ldr	r3, [sp, #20]
3000d0b8:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
3000d0bc:	e59f0114 	ldr	r0, [pc, #276]	; 3000d1d8 <display_thread+0x1f4>
3000d0c0:	e1a01003 	mov	r1, r3
3000d0c4:	ebfff84f 	bl	3000b208 <acoral_print>
		if(thread->state&ACORAL_THREAD_STATE_RUNNING)
3000d0c8:	e59d3014 	ldr	r3, [sp, #20]
3000d0cc:	e5d33004 	ldrb	r3, [r3, #4]
3000d0d0:	e2033004 	and	r3, r3, #4
3000d0d4:	e3530000 	cmp	r3, #0
3000d0d8:	0a000002 	beq	3000d0e8 <display_thread+0x104>
				acoral_prints("Running\t\t");
3000d0dc:	e59f00f8 	ldr	r0, [pc, #248]	; 3000d1dc <display_thread+0x1f8>
3000d0e0:	ebfff86b 	bl	3000b294 <acoral_prints>
3000d0e4:	ea000021 	b	3000d170 <display_thread+0x18c>
		else if(thread->state&ACORAL_THREAD_STATE_READY)
3000d0e8:	e59d3014 	ldr	r3, [sp, #20]
3000d0ec:	e5d33004 	ldrb	r3, [r3, #4]
3000d0f0:	e2033001 	and	r3, r3, #1
3000d0f4:	e20330ff 	and	r3, r3, #255	; 0xff
3000d0f8:	e3530000 	cmp	r3, #0
3000d0fc:	0a000002 	beq	3000d10c <display_thread+0x128>
				acoral_prints("Ready\t\t");
3000d100:	e59f00d8 	ldr	r0, [pc, #216]	; 3000d1e0 <display_thread+0x1fc>
3000d104:	ebfff862 	bl	3000b294 <acoral_prints>
3000d108:	ea000018 	b	3000d170 <display_thread+0x18c>
		else if(thread->state&ACORAL_THREAD_STATE_DELAY)
3000d10c:	e59d3014 	ldr	r3, [sp, #20]
3000d110:	e5d33004 	ldrb	r3, [r3, #4]
3000d114:	e2033020 	and	r3, r3, #32
3000d118:	e3530000 	cmp	r3, #0
3000d11c:	0a000002 	beq	3000d12c <display_thread+0x148>
				acoral_prints("Delay\t\t");
3000d120:	e59f00bc 	ldr	r0, [pc, #188]	; 3000d1e4 <display_thread+0x200>
3000d124:	ebfff85a 	bl	3000b294 <acoral_prints>
3000d128:	ea000010 	b	3000d170 <display_thread+0x18c>
		else if(thread->state&ACORAL_THREAD_STATE_SUSPEND)
3000d12c:	e59d3014 	ldr	r3, [sp, #20]
3000d130:	e5d33004 	ldrb	r3, [r3, #4]
3000d134:	e2033002 	and	r3, r3, #2
3000d138:	e3530000 	cmp	r3, #0
3000d13c:	0a000002 	beq	3000d14c <display_thread+0x168>
				acoral_prints("Sleep\t\t");
3000d140:	e59f00a0 	ldr	r0, [pc, #160]	; 3000d1e8 <display_thread+0x204>
3000d144:	ebfff852 	bl	3000b294 <acoral_prints>
3000d148:	ea000008 	b	3000d170 <display_thread+0x18c>
		else if(thread->state==ACORAL_THREAD_STATE_EXIT)
3000d14c:	e59d3014 	ldr	r3, [sp, #20]
3000d150:	e5d33004 	ldrb	r3, [r3, #4]
3000d154:	e3530008 	cmp	r3, #8
3000d158:	1a000002 	bne	3000d168 <display_thread+0x184>
				acoral_prints("Freeze\t\t");
3000d15c:	e59f0088 	ldr	r0, [pc, #136]	; 3000d1ec <display_thread+0x208>
3000d160:	ebfff84b 	bl	3000b294 <acoral_prints>
3000d164:	ea000001 	b	3000d170 <display_thread+0x18c>
		else
				acoral_prints("Error\t\t");
3000d168:	e59f0080 	ldr	r0, [pc, #128]	; 3000d1f0 <display_thread+0x20c>
3000d16c:	ebfff848 	bl	3000b294 <acoral_prints>
		acoral_prints("\r\n");
3000d170:	e59f007c 	ldr	r0, [pc, #124]	; 3000d1f4 <display_thread+0x210>
3000d174:	ebfff846 	bl	3000b294 <acoral_prints>
	acoral_prints("\t\tSystem Thread Information\r\n");
	acoral_prints("------------------------------------------------------\r\n");
	acoral_prints("Name\t\tType\t\tConsole\t\tState\r\n");
	HAL_ENTER_CRITICAL();
	acoral_spin_lock(&acoral_threads_queue.head.lock);
	for(tmp=head->next;tmp!=head;tmp=tmp->next){
3000d178:	e59d3010 	ldr	r3, [sp, #16]
3000d17c:	e5933000 	ldr	r3, [r3]
3000d180:	e58d3010 	str	r3, [sp, #16]
3000d184:	e59d2010 	ldr	r2, [sp, #16]
3000d188:	e59d300c 	ldr	r3, [sp, #12]
3000d18c:	e1520003 	cmp	r2, r3
3000d190:	1affffa6 	bne	3000d030 <display_thread+0x4c>
				acoral_prints("Freeze\t\t");
		else
				acoral_prints("Error\t\t");
		acoral_prints("\r\n");
	}
	acoral_prints("------------------------------------------------------\r\n");
3000d194:	e59f001c 	ldr	r0, [pc, #28]	; 3000d1b8 <display_thread+0x1d4>
3000d198:	ebfff83d 	bl	3000b294 <acoral_prints>
	acoral_spin_unlock(&acoral_threads_queue.head.lock);
	HAL_EXIT_CRITICAL();
3000d19c:	e59d0008 	ldr	r0, [sp, #8]
3000d1a0:	ebffd151 	bl	300016ec <HAL_INTR_RESTORE>
}
3000d1a4:	e28dd01c 	add	sp, sp, #28
3000d1a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d1ac:	e12fff1e 	bx	lr
3000d1b0:	3000fa24 	.word	0x3000fa24
3000d1b4:	3000e928 	.word	0x3000e928
3000d1b8:	3000e948 	.word	0x3000e948
3000d1bc:	3000e984 	.word	0x3000e984
3000d1c0:	3000e9a4 	.word	0x3000e9a4
3000d1c4:	3000e9ac 	.word	0x3000e9ac
3000d1c8:	3000e9b8 	.word	0x3000e9b8
3000d1cc:	3000e9c0 	.word	0x3000e9c0
3000d1d0:	3000e9cc 	.word	0x3000e9cc
3000d1d4:	3000e9d4 	.word	0x3000e9d4
3000d1d8:	3000e9dc 	.word	0x3000e9dc
3000d1dc:	3000e9e4 	.word	0x3000e9e4
3000d1e0:	3000e9f0 	.word	0x3000e9f0
3000d1e4:	3000e9f8 	.word	0x3000e9f8
3000d1e8:	3000ea00 	.word	0x3000ea00
3000d1ec:	3000ea08 	.word	0x3000ea08
3000d1f0:	3000ea14 	.word	0x3000ea14
3000d1f4:	3000ea1c 	.word	0x3000ea1c

3000d1f8 <acoral_get_drv_ctrl_by_name>:
#define DRV_MAIN_ID_SHIFT 5
#define DRV_MAIN_ID(id) (id>>DRV_MAIN_ID_SHIFT)
#define DRV_CHK_ID(id) (DRV_MAIN_ID(id)>=0&&DRV_MAIN_ID(id)<ACORAL_DEV_NUM)
acoral_pool_ctrl_t acoral_drv_pool_ctrl;
acoral_drv_ctrl_t *drv_table[ACORAL_DEV_NUM];
acoral_drv_ctrl_t *acoral_get_drv_ctrl_by_name(acoral_char *name){
3000d1f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d1fc:	e24dd014 	sub	sp, sp, #20
3000d200:	e58d0004 	str	r0, [sp, #4]
  	acoral_u32 i;
	acoral_drv_ctrl_t *ctrl;
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d204:	e3a03000 	mov	r3, #0
3000d208:	e58d3008 	str	r3, [sp, #8]
3000d20c:	ea000013 	b	3000d260 <acoral_get_drv_ctrl_by_name+0x68>
	  	ctrl=drv_table[i];	    
3000d210:	e59d2008 	ldr	r2, [sp, #8]
3000d214:	e59f3064 	ldr	r3, [pc, #100]	; 3000d280 <acoral_get_drv_ctrl_by_name+0x88>
3000d218:	e7933102 	ldr	r3, [r3, r2, lsl #2]
3000d21c:	e58d300c 	str	r3, [sp, #12]
		if(ctrl!=NULL&&!acoral_str_cmp(ctrl->name,name))
3000d220:	e59d300c 	ldr	r3, [sp, #12]
3000d224:	e3530000 	cmp	r3, #0
3000d228:	0a000009 	beq	3000d254 <acoral_get_drv_ctrl_by_name+0x5c>
3000d22c:	e59d300c 	ldr	r3, [sp, #12]
3000d230:	e593300c 	ldr	r3, [r3, #12]
3000d234:	e1a00003 	mov	r0, r3
3000d238:	e59d1004 	ldr	r1, [sp, #4]
3000d23c:	ebfff963 	bl	3000b7d0 <acoral_str_cmp>
3000d240:	e1a03000 	mov	r3, r0
3000d244:	e3530000 	cmp	r3, #0
3000d248:	1a000001 	bne	3000d254 <acoral_get_drv_ctrl_by_name+0x5c>
		   return ctrl;
3000d24c:	e59d300c 	ldr	r3, [sp, #12]
3000d250:	ea000006 	b	3000d270 <acoral_get_drv_ctrl_by_name+0x78>
acoral_pool_ctrl_t acoral_drv_pool_ctrl;
acoral_drv_ctrl_t *drv_table[ACORAL_DEV_NUM];
acoral_drv_ctrl_t *acoral_get_drv_ctrl_by_name(acoral_char *name){
  	acoral_u32 i;
	acoral_drv_ctrl_t *ctrl;
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d254:	e59d3008 	ldr	r3, [sp, #8]
3000d258:	e2833001 	add	r3, r3, #1
3000d25c:	e58d3008 	str	r3, [sp, #8]
3000d260:	e59d3008 	ldr	r3, [sp, #8]
3000d264:	e3530013 	cmp	r3, #19
3000d268:	9affffe8 	bls	3000d210 <acoral_get_drv_ctrl_by_name+0x18>
	  	ctrl=drv_table[i];	    
		if(ctrl!=NULL&&!acoral_str_cmp(ctrl->name,name))
		   return ctrl;
	}
	return NULL;
3000d26c:	e3a03000 	mov	r3, #0
}
3000d270:	e1a00003 	mov	r0, r3
3000d274:	e28dd014 	add	sp, sp, #20
3000d278:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d27c:	e12fff1e 	bx	lr
3000d280:	3000f358 	.word	0x3000f358

3000d284 <acoral_drv_register>:

acoral_err acoral_drv_register(acoral_dev_ops_t *ops,acoral_char *name){
3000d284:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d288:	e24dd01c 	sub	sp, sp, #28
3000d28c:	e58d0004 	str	r0, [sp, #4]
3000d290:	e58d1000 	str	r1, [sp]
	acoral_u32 i;
	acoral_drv_ctrl_t *tmp,*ctrl;
	ctrl=acoral_alloc_drv();
3000d294:	eb000107 	bl	3000d6b8 <acoral_alloc_drv>
3000d298:	e1a03000 	mov	r3, r0
3000d29c:	e58d3014 	str	r3, [sp, #20]
	if(ctrl==NULL)
3000d2a0:	e59d3014 	ldr	r3, [sp, #20]
3000d2a4:	e3530000 	cmp	r3, #0
3000d2a8:	1a000001 	bne	3000d2b4 <acoral_drv_register+0x30>
		return ACORAL_ERR_NO_DRV_RES;
3000d2ac:	e3a03005 	mov	r3, #5
3000d2b0:	ea000024 	b	3000d348 <acoral_drv_register+0xc4>
	ctrl->name=name;
3000d2b4:	e59d3014 	ldr	r3, [sp, #20]
3000d2b8:	e59d2000 	ldr	r2, [sp]
3000d2bc:	e583200c 	str	r2, [r3, #12]
	ctrl->ops=ops;
3000d2c0:	e59d3014 	ldr	r3, [sp, #20]
3000d2c4:	e59d2004 	ldr	r2, [sp, #4]
3000d2c8:	e5832004 	str	r2, [r3, #4]
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d2cc:	e3a03000 	mov	r3, #0
3000d2d0:	e58d300c 	str	r3, [sp, #12]
3000d2d4:	ea000012 	b	3000d324 <acoral_drv_register+0xa0>
	  	tmp=drv_table[i];	    
3000d2d8:	e59d200c 	ldr	r2, [sp, #12]
3000d2dc:	e59f3074 	ldr	r3, [pc, #116]	; 3000d358 <acoral_drv_register+0xd4>
3000d2e0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
3000d2e4:	e58d3010 	str	r3, [sp, #16]
		if(tmp==NULL){
3000d2e8:	e59d3010 	ldr	r3, [sp, #16]
3000d2ec:	e3530000 	cmp	r3, #0
3000d2f0:	1a000008 	bne	3000d318 <acoral_drv_register+0x94>
			drv_table[i]=ctrl;
3000d2f4:	e59d200c 	ldr	r2, [sp, #12]
3000d2f8:	e59f3058 	ldr	r3, [pc, #88]	; 3000d358 <acoral_drv_register+0xd4>
3000d2fc:	e59d1014 	ldr	r1, [sp, #20]
3000d300:	e7831102 	str	r1, [r3, r2, lsl #2]
			ctrl->drv_id=i<<DRV_MAIN_ID_SHIFT;
3000d304:	e59d300c 	ldr	r3, [sp, #12]
3000d308:	e1a02283 	lsl	r2, r3, #5
3000d30c:	e59d3014 	ldr	r3, [sp, #20]
3000d310:	e5832008 	str	r2, [r3, #8]
			break;
3000d314:	ea000005 	b	3000d330 <acoral_drv_register+0xac>
	ctrl=acoral_alloc_drv();
	if(ctrl==NULL)
		return ACORAL_ERR_NO_DRV_RES;
	ctrl->name=name;
	ctrl->ops=ops;
	for(i=0;i<ACORAL_DEV_NUM;i++){
3000d318:	e59d300c 	ldr	r3, [sp, #12]
3000d31c:	e2833001 	add	r3, r3, #1
3000d320:	e58d300c 	str	r3, [sp, #12]
3000d324:	e59d300c 	ldr	r3, [sp, #12]
3000d328:	e3530013 	cmp	r3, #19
3000d32c:	9affffe9 	bls	3000d2d8 <acoral_drv_register+0x54>
			drv_table[i]=ctrl;
			ctrl->drv_id=i<<DRV_MAIN_ID_SHIFT;
			break;
		}
	}
	if(i==ACORAL_DEV_NUM)
3000d330:	e59d300c 	ldr	r3, [sp, #12]
3000d334:	e3530014 	cmp	r3, #20
3000d338:	1a000001 	bne	3000d344 <acoral_drv_register+0xc0>
		return ACORAL_ERR_DRV_FULL;
3000d33c:	e3a03005 	mov	r3, #5
3000d340:	ea000000 	b	3000d348 <acoral_drv_register+0xc4>
	return 0;
3000d344:	e3a03000 	mov	r3, #0
}
3000d348:	e1a00003 	mov	r0, r3
3000d34c:	e28dd01c 	add	sp, sp, #28
3000d350:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d354:	e12fff1e 	bx	lr
3000d358:	3000f358 	.word	0x3000f358

3000d35c <acoral_drv_unregister>:

void acoral_drv_unregister(acoral_id res_id){
3000d35c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d360:	e24dd014 	sub	sp, sp, #20
3000d364:	e58d0004 	str	r0, [sp, #4]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(res_id);
3000d368:	e59d0004 	ldr	r0, [sp, #4]
3000d36c:	ebffd939 	bl	30003858 <acoral_get_res_by_id>
3000d370:	e1a03000 	mov	r3, r0
3000d374:	e58d300c 	str	r3, [sp, #12]
	if(ctrl->ops!=NULL&&ctrl->ops->close!=NULL)
3000d378:	e59d300c 	ldr	r3, [sp, #12]
3000d37c:	e5933004 	ldr	r3, [r3, #4]
3000d380:	e3530000 	cmp	r3, #0
3000d384:	0a000009 	beq	3000d3b0 <acoral_drv_unregister+0x54>
3000d388:	e59d300c 	ldr	r3, [sp, #12]
3000d38c:	e5933004 	ldr	r3, [r3, #4]
3000d390:	e5933010 	ldr	r3, [r3, #16]
3000d394:	e3530000 	cmp	r3, #0
3000d398:	0a000004 	beq	3000d3b0 <acoral_drv_unregister+0x54>
		ctrl->ops->close();
3000d39c:	e59d300c 	ldr	r3, [sp, #12]
3000d3a0:	e5933004 	ldr	r3, [r3, #4]
3000d3a4:	e5933010 	ldr	r3, [r3, #16]
3000d3a8:	e1a0e00f 	mov	lr, pc
3000d3ac:	e12fff13 	bx	r3
	drv_table[DRV_MAIN_ID(ctrl->drv_id)]=NULL;
3000d3b0:	e59d300c 	ldr	r3, [sp, #12]
3000d3b4:	e5933008 	ldr	r3, [r3, #8]
3000d3b8:	e1a022a3 	lsr	r2, r3, #5
3000d3bc:	e59f301c 	ldr	r3, [pc, #28]	; 3000d3e0 <acoral_drv_unregister+0x84>
3000d3c0:	e3a01000 	mov	r1, #0
3000d3c4:	e7831102 	str	r1, [r3, r2, lsl #2]
	acoral_release_res((acoral_res_t *)ctrl);
3000d3c8:	e59d300c 	ldr	r3, [sp, #12]
3000d3cc:	e1a00003 	mov	r0, r3
3000d3d0:	ebffd88c 	bl	30003608 <acoral_release_res>
}
3000d3d4:	e28dd014 	add	sp, sp, #20
3000d3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d3dc:	e12fff1e 	bx	lr
3000d3e0:	3000f358 	.word	0x3000f358

3000d3e4 <acoral_dev_open>:

acoral_id acoral_dev_open(acoral_char *name){
3000d3e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d3e8:	e24dd014 	sub	sp, sp, #20
3000d3ec:	e58d0004 	str	r0, [sp, #4]
	acoral_drv_ctrl_t *ctrl=acoral_get_drv_ctrl_by_name(name);
3000d3f0:	e59d0004 	ldr	r0, [sp, #4]
3000d3f4:	ebffff7f 	bl	3000d1f8 <acoral_get_drv_ctrl_by_name>
3000d3f8:	e1a03000 	mov	r3, r0
3000d3fc:	e58d300c 	str	r3, [sp, #12]
	if(ctrl==NULL)
3000d400:	e59d300c 	ldr	r3, [sp, #12]
3000d404:	e3530000 	cmp	r3, #0
3000d408:	1a000001 	bne	3000d414 <acoral_dev_open+0x30>
		return ACORAL_DEV_ERR_ID;
3000d40c:	e3e03000 	mvn	r3, #0
3000d410:	ea000014 	b	3000d468 <acoral_dev_open+0x84>
	if(ctrl->ops!=NULL&&ctrl->ops->open!=NULL){
3000d414:	e59d300c 	ldr	r3, [sp, #12]
3000d418:	e5933004 	ldr	r3, [r3, #4]
3000d41c:	e3530000 	cmp	r3, #0
3000d420:	0a00000e 	beq	3000d460 <acoral_dev_open+0x7c>
3000d424:	e59d300c 	ldr	r3, [sp, #12]
3000d428:	e5933004 	ldr	r3, [r3, #4]
3000d42c:	e5933000 	ldr	r3, [r3]
3000d430:	e3530000 	cmp	r3, #0
3000d434:	0a000009 	beq	3000d460 <acoral_dev_open+0x7c>
		if(ctrl->ops->open()!=0)
3000d438:	e59d300c 	ldr	r3, [sp, #12]
3000d43c:	e5933004 	ldr	r3, [r3, #4]
3000d440:	e5933000 	ldr	r3, [r3]
3000d444:	e1a0e00f 	mov	lr, pc
3000d448:	e12fff13 	bx	r3
3000d44c:	e1a03000 	mov	r3, r0
3000d450:	e3530000 	cmp	r3, #0
3000d454:	0a000001 	beq	3000d460 <acoral_dev_open+0x7c>
			return ACORAL_DEV_ERR_ID;
3000d458:	e3e03000 	mvn	r3, #0
3000d45c:	ea000001 	b	3000d468 <acoral_dev_open+0x84>
	}
	return ctrl->res.id;
3000d460:	e59d300c 	ldr	r3, [sp, #12]
3000d464:	e5933000 	ldr	r3, [r3]
}
3000d468:	e1a00003 	mov	r0, r3
3000d46c:	e28dd014 	add	sp, sp, #20
3000d470:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d474:	e12fff1e 	bx	lr

3000d478 <acoral_dev_write>:

acoral_32 acoral_dev_write(acoral_id id,void *data,acoral_size size,acoral_size offset,acoral_time time_out){
3000d478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d47c:	e24dd01c 	sub	sp, sp, #28
3000d480:	e58d000c 	str	r0, [sp, #12]
3000d484:	e58d1008 	str	r1, [sp, #8]
3000d488:	e58d2004 	str	r2, [sp, #4]
3000d48c:	e58d3000 	str	r3, [sp]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d490:	e59d000c 	ldr	r0, [sp, #12]
3000d494:	ebffd8ef 	bl	30003858 <acoral_get_res_by_id>
3000d498:	e1a03000 	mov	r3, r0
3000d49c:	e58d3014 	str	r3, [sp, #20]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->write!=NULL)
3000d4a0:	e59d3014 	ldr	r3, [sp, #20]
3000d4a4:	e3530000 	cmp	r3, #0
3000d4a8:	0a000013 	beq	3000d4fc <acoral_dev_write+0x84>
3000d4ac:	e59d3014 	ldr	r3, [sp, #20]
3000d4b0:	e5933004 	ldr	r3, [r3, #4]
3000d4b4:	e3530000 	cmp	r3, #0
3000d4b8:	0a00000f 	beq	3000d4fc <acoral_dev_write+0x84>
3000d4bc:	e59d3014 	ldr	r3, [sp, #20]
3000d4c0:	e5933004 	ldr	r3, [r3, #4]
3000d4c4:	e5933008 	ldr	r3, [r3, #8]
3000d4c8:	e3530000 	cmp	r3, #0
3000d4cc:	0a00000a 	beq	3000d4fc <acoral_dev_write+0x84>
		return ctrl->ops->write(data,size,offset,time_out);
3000d4d0:	e59d3014 	ldr	r3, [sp, #20]
3000d4d4:	e5933004 	ldr	r3, [r3, #4]
3000d4d8:	e593c008 	ldr	ip, [r3, #8]
3000d4dc:	e59d0008 	ldr	r0, [sp, #8]
3000d4e0:	e59d1004 	ldr	r1, [sp, #4]
3000d4e4:	e59d2000 	ldr	r2, [sp]
3000d4e8:	e59d3020 	ldr	r3, [sp, #32]
3000d4ec:	e1a0e00f 	mov	lr, pc
3000d4f0:	e12fff1c 	bx	ip
3000d4f4:	e1a03000 	mov	r3, r0
3000d4f8:	ea000000 	b	3000d500 <acoral_dev_write+0x88>
	return 0;
3000d4fc:	e3a03000 	mov	r3, #0
}
3000d500:	e1a00003 	mov	r0, r3
3000d504:	e28dd01c 	add	sp, sp, #28
3000d508:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d50c:	e12fff1e 	bx	lr

3000d510 <acoral_dev_read>:

acoral_32 acoral_dev_read(acoral_id id,void *data,acoral_size size,acoral_size offset,acoral_time time_out){
3000d510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d514:	e24dd01c 	sub	sp, sp, #28
3000d518:	e58d000c 	str	r0, [sp, #12]
3000d51c:	e58d1008 	str	r1, [sp, #8]
3000d520:	e58d2004 	str	r2, [sp, #4]
3000d524:	e58d3000 	str	r3, [sp]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d528:	e59d000c 	ldr	r0, [sp, #12]
3000d52c:	ebffd8c9 	bl	30003858 <acoral_get_res_by_id>
3000d530:	e1a03000 	mov	r3, r0
3000d534:	e58d3014 	str	r3, [sp, #20]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->read!=NULL)
3000d538:	e59d3014 	ldr	r3, [sp, #20]
3000d53c:	e3530000 	cmp	r3, #0
3000d540:	0a000013 	beq	3000d594 <acoral_dev_read+0x84>
3000d544:	e59d3014 	ldr	r3, [sp, #20]
3000d548:	e5933004 	ldr	r3, [r3, #4]
3000d54c:	e3530000 	cmp	r3, #0
3000d550:	0a00000f 	beq	3000d594 <acoral_dev_read+0x84>
3000d554:	e59d3014 	ldr	r3, [sp, #20]
3000d558:	e5933004 	ldr	r3, [r3, #4]
3000d55c:	e5933004 	ldr	r3, [r3, #4]
3000d560:	e3530000 	cmp	r3, #0
3000d564:	0a00000a 	beq	3000d594 <acoral_dev_read+0x84>
		return ctrl->ops->read(data,size,offset,time_out);
3000d568:	e59d3014 	ldr	r3, [sp, #20]
3000d56c:	e5933004 	ldr	r3, [r3, #4]
3000d570:	e593c004 	ldr	ip, [r3, #4]
3000d574:	e59d0008 	ldr	r0, [sp, #8]
3000d578:	e59d1004 	ldr	r1, [sp, #4]
3000d57c:	e59d2000 	ldr	r2, [sp]
3000d580:	e59d3020 	ldr	r3, [sp, #32]
3000d584:	e1a0e00f 	mov	lr, pc
3000d588:	e12fff1c 	bx	ip
3000d58c:	e1a03000 	mov	r3, r0
3000d590:	ea000000 	b	3000d598 <acoral_dev_read+0x88>
	return 0;
3000d594:	e3a03000 	mov	r3, #0
}
3000d598:	e1a00003 	mov	r0, r3
3000d59c:	e28dd01c 	add	sp, sp, #28
3000d5a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d5a4:	e12fff1e 	bx	lr

3000d5a8 <acoral_dev_config>:

acoral_32 acoral_dev_config(acoral_id id,acoral_u32 cmd,void *data,acoral_time tm_out){
3000d5a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d5ac:	e24dd01c 	sub	sp, sp, #28
3000d5b0:	e58d000c 	str	r0, [sp, #12]
3000d5b4:	e58d1008 	str	r1, [sp, #8]
3000d5b8:	e58d2004 	str	r2, [sp, #4]
3000d5bc:	e58d3000 	str	r3, [sp]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d5c0:	e59d000c 	ldr	r0, [sp, #12]
3000d5c4:	ebffd8a3 	bl	30003858 <acoral_get_res_by_id>
3000d5c8:	e1a03000 	mov	r3, r0
3000d5cc:	e58d3014 	str	r3, [sp, #20]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->config!=NULL)
3000d5d0:	e59d3014 	ldr	r3, [sp, #20]
3000d5d4:	e3530000 	cmp	r3, #0
3000d5d8:	0a000012 	beq	3000d628 <acoral_dev_config+0x80>
3000d5dc:	e59d3014 	ldr	r3, [sp, #20]
3000d5e0:	e5933004 	ldr	r3, [r3, #4]
3000d5e4:	e3530000 	cmp	r3, #0
3000d5e8:	0a00000e 	beq	3000d628 <acoral_dev_config+0x80>
3000d5ec:	e59d3014 	ldr	r3, [sp, #20]
3000d5f0:	e5933004 	ldr	r3, [r3, #4]
3000d5f4:	e593300c 	ldr	r3, [r3, #12]
3000d5f8:	e3530000 	cmp	r3, #0
3000d5fc:	0a000009 	beq	3000d628 <acoral_dev_config+0x80>
		return ctrl->ops->config(cmd,data,tm_out);
3000d600:	e59d3014 	ldr	r3, [sp, #20]
3000d604:	e5933004 	ldr	r3, [r3, #4]
3000d608:	e593300c 	ldr	r3, [r3, #12]
3000d60c:	e59d0008 	ldr	r0, [sp, #8]
3000d610:	e59d1004 	ldr	r1, [sp, #4]
3000d614:	e59d2000 	ldr	r2, [sp]
3000d618:	e1a0e00f 	mov	lr, pc
3000d61c:	e12fff13 	bx	r3
3000d620:	e1a03000 	mov	r3, r0
3000d624:	ea000000 	b	3000d62c <acoral_dev_config+0x84>
	return 0;	
3000d628:	e3a03000 	mov	r3, #0
}
3000d62c:	e1a00003 	mov	r0, r3
3000d630:	e28dd01c 	add	sp, sp, #28
3000d634:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d638:	e12fff1e 	bx	lr

3000d63c <acoral_dev_close>:
acoral_32 acoral_dev_close(acoral_id id){
3000d63c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d640:	e24dd014 	sub	sp, sp, #20
3000d644:	e58d0004 	str	r0, [sp, #4]
	acoral_drv_ctrl_t *ctrl=(acoral_drv_ctrl_t *)acoral_get_res_by_id(id);
3000d648:	e59d0004 	ldr	r0, [sp, #4]
3000d64c:	ebffd881 	bl	30003858 <acoral_get_res_by_id>
3000d650:	e1a03000 	mov	r3, r0
3000d654:	e58d300c 	str	r3, [sp, #12]
	if(ctrl!=NULL&&ctrl->ops!=NULL&&ctrl->ops->close!=NULL)
3000d658:	e59d300c 	ldr	r3, [sp, #12]
3000d65c:	e3530000 	cmp	r3, #0
3000d660:	0a00000f 	beq	3000d6a4 <acoral_dev_close+0x68>
3000d664:	e59d300c 	ldr	r3, [sp, #12]
3000d668:	e5933004 	ldr	r3, [r3, #4]
3000d66c:	e3530000 	cmp	r3, #0
3000d670:	0a00000b 	beq	3000d6a4 <acoral_dev_close+0x68>
3000d674:	e59d300c 	ldr	r3, [sp, #12]
3000d678:	e5933004 	ldr	r3, [r3, #4]
3000d67c:	e5933010 	ldr	r3, [r3, #16]
3000d680:	e3530000 	cmp	r3, #0
3000d684:	0a000006 	beq	3000d6a4 <acoral_dev_close+0x68>
		return ctrl->ops->close();
3000d688:	e59d300c 	ldr	r3, [sp, #12]
3000d68c:	e5933004 	ldr	r3, [r3, #4]
3000d690:	e5933010 	ldr	r3, [r3, #16]
3000d694:	e1a0e00f 	mov	lr, pc
3000d698:	e12fff13 	bx	r3
3000d69c:	e1a03000 	mov	r3, r0
3000d6a0:	ea000000 	b	3000d6a8 <acoral_dev_close+0x6c>
	return 0;
3000d6a4:	e3a03000 	mov	r3, #0
}
3000d6a8:	e1a00003 	mov	r0, r3
3000d6ac:	e28dd014 	add	sp, sp, #20
3000d6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d6b4:	e12fff1e 	bx	lr

3000d6b8 <acoral_alloc_drv>:

acoral_drv_ctrl_t *acoral_alloc_drv(){
3000d6b8:	e92d4008 	push	{r3, lr}
  	return (acoral_drv_ctrl_t *)acoral_get_res(&acoral_drv_pool_ctrl);
3000d6bc:	e59f0010 	ldr	r0, [pc, #16]	; 3000d6d4 <acoral_alloc_drv+0x1c>
3000d6c0:	ebffd785 	bl	300034dc <acoral_get_res>
3000d6c4:	e1a03000 	mov	r3, r0
}
3000d6c8:	e1a00003 	mov	r0, r3
3000d6cc:	e8bd4008 	pop	{r3, lr}
3000d6d0:	e12fff1e 	bx	lr
3000d6d4:	3000f9ec 	.word	0x3000f9ec

3000d6d8 <acoral_drv_pool_init>:


void acoral_drv_pool_init(){
3000d6d8:	e92d4008 	push	{r3, lr}
	acoral_drv_pool_ctrl.type=ACORAL_RES_DRIVER;
3000d6dc:	e59f3038 	ldr	r3, [pc, #56]	; 3000d71c <acoral_drv_pool_init+0x44>
3000d6e0:	e3a02004 	mov	r2, #4
3000d6e4:	e5832000 	str	r2, [r3]
	acoral_drv_pool_ctrl.size=sizeof(acoral_drv_ctrl_t);
3000d6e8:	e59f302c 	ldr	r3, [pc, #44]	; 3000d71c <acoral_drv_pool_init+0x44>
3000d6ec:	e3a02010 	mov	r2, #16
3000d6f0:	e5832004 	str	r2, [r3, #4]
	acoral_drv_pool_ctrl.num_per_pool=10;
3000d6f4:	e59f3020 	ldr	r3, [pc, #32]	; 3000d71c <acoral_drv_pool_init+0x44>
3000d6f8:	e3a0200a 	mov	r2, #10
3000d6fc:	e5832008 	str	r2, [r3, #8]
	acoral_drv_pool_ctrl.max_pools=3;
3000d700:	e59f3014 	ldr	r3, [pc, #20]	; 3000d71c <acoral_drv_pool_init+0x44>
3000d704:	e3a02003 	mov	r2, #3
3000d708:	e5832010 	str	r2, [r3, #16]
	acoral_pool_ctrl_init(&acoral_drv_pool_ctrl);
3000d70c:	e59f0008 	ldr	r0, [pc, #8]	; 3000d71c <acoral_drv_pool_init+0x44>
3000d710:	ebffd8d0 	bl	30003a58 <acoral_pool_ctrl_init>
}
3000d714:	e8bd4008 	pop	{r3, lr}
3000d718:	e12fff1e 	bx	lr
3000d71c:	3000f9ec 	.word	0x3000f9ec

3000d720 <acoral_drv_sys_init>:

void acoral_drv_sys_init(){
3000d720:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d724:	e24dd00c 	sub	sp, sp, #12
	acoral_u32 i;
	for(i=0;i<ACORAL_DEV_NUM;i++)
3000d728:	e3a03000 	mov	r3, #0
3000d72c:	e58d3004 	str	r3, [sp, #4]
3000d730:	ea000006 	b	3000d750 <acoral_drv_sys_init+0x30>
	  	drv_table[i]=NULL;	    
3000d734:	e59d2004 	ldr	r2, [sp, #4]
3000d738:	e59f3030 	ldr	r3, [pc, #48]	; 3000d770 <acoral_drv_sys_init+0x50>
3000d73c:	e3a01000 	mov	r1, #0
3000d740:	e7831102 	str	r1, [r3, r2, lsl #2]
	acoral_pool_ctrl_init(&acoral_drv_pool_ctrl);
}

void acoral_drv_sys_init(){
	acoral_u32 i;
	for(i=0;i<ACORAL_DEV_NUM;i++)
3000d744:	e59d3004 	ldr	r3, [sp, #4]
3000d748:	e2833001 	add	r3, r3, #1
3000d74c:	e58d3004 	str	r3, [sp, #4]
3000d750:	e59d3004 	ldr	r3, [sp, #4]
3000d754:	e3530013 	cmp	r3, #19
3000d758:	9afffff5 	bls	3000d734 <acoral_drv_sys_init+0x14>
	  	drv_table[i]=NULL;	    
	acoral_drv_pool_init();
3000d75c:	ebffffdd 	bl	3000d6d8 <acoral_drv_pool_init>
	brd_driver_init();
3000d760:	eb000003 	bl	3000d774 <brd_driver_init>
}
3000d764:	e28dd00c 	add	sp, sp, #12
3000d768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d76c:	e12fff1e 	bx	lr
3000d770:	3000f358 	.word	0x3000f358

3000d774 <brd_driver_init>:
#include<autocfg.h>
void brd_driver_init(){
3000d774:	e92d4008 	push	{r3, lr}
#ifdef CFG_DRV_CON_UART
	con_uart_init();
3000d778:	eb000089 	bl	3000d9a4 <con_uart_init>
#endif

#ifdef CFG_DRV_NET_DM9000
	dm9000_init();
#endif
}
3000d77c:	e8bd4008 	pop	{r3, lr}
3000d780:	e12fff1e 	bx	lr

3000d784 <uart_write>:
#define put_char(ch) uart_write(ch)
#define get_char(ch) uart_read(ch)
acoral_dev_ops_t console_ops;
void uart_init();

void uart_write(acoral_u8 ch){
3000d784:	e24dd008 	sub	sp, sp, #8
3000d788:	e1a03000 	mov	r3, r0
3000d78c:	e5cd3007 	strb	r3, [sp, #7]
	while(!(rUTRSTAT0 & 0x4));
3000d790:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d794:	e2833010 	add	r3, r3, #16
3000d798:	e5933000 	ldr	r3, [r3]
3000d79c:	e2033004 	and	r3, r3, #4
3000d7a0:	e3530000 	cmp	r3, #0
3000d7a4:	0afffff9 	beq	3000d790 <uart_write+0xc>
	WrUTXH0(ch);
3000d7a8:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d7ac:	e2833020 	add	r3, r3, #32
3000d7b0:	e5dd2007 	ldrb	r2, [sp, #7]
3000d7b4:	e5c32000 	strb	r2, [r3]
}
3000d7b8:	e28dd008 	add	sp, sp, #8
3000d7bc:	e12fff1e 	bx	lr

3000d7c0 <uart_read>:

void uart_read(acoral_char *ch){
3000d7c0:	e24dd008 	sub	sp, sp, #8
3000d7c4:	e58d0004 	str	r0, [sp, #4]
	while(!(rUTRSTAT0 & 0x1));
3000d7c8:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d7cc:	e2833010 	add	r3, r3, #16
3000d7d0:	e5933000 	ldr	r3, [r3]
3000d7d4:	e2033001 	and	r3, r3, #1
3000d7d8:	e3530000 	cmp	r3, #0
3000d7dc:	0afffff9 	beq	3000d7c8 <uart_read+0x8>
	*ch=RdURXH0();
3000d7e0:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d7e4:	e2833024 	add	r3, r3, #36	; 0x24
3000d7e8:	e5d33000 	ldrb	r3, [r3]
3000d7ec:	e20320ff 	and	r2, r3, #255	; 0xff
3000d7f0:	e59d3004 	ldr	r3, [sp, #4]
3000d7f4:	e5c32000 	strb	r2, [r3]
}
3000d7f8:	e28dd008 	add	sp, sp, #8
3000d7fc:	e12fff1e 	bx	lr

3000d800 <console_write>:

acoral_32 console_write(void *data,acoral_u32 size,acoral_time tm_out){
3000d800:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d804:	e24dd01c 	sub	sp, sp, #28
3000d808:	e58d000c 	str	r0, [sp, #12]
3000d80c:	e58d1008 	str	r1, [sp, #8]
3000d810:	e58d2004 	str	r2, [sp, #4]
	acoral_u32 i;
  	char p;
	for(i=0;i<size;i++){
3000d814:	e3a03000 	mov	r3, #0
3000d818:	e58d3010 	str	r3, [sp, #16]
3000d81c:	ea00000f 	b	3000d860 <console_write+0x60>
		p=*((acoral_char *)data+i);
3000d820:	e59d200c 	ldr	r2, [sp, #12]
3000d824:	e59d3010 	ldr	r3, [sp, #16]
3000d828:	e0823003 	add	r3, r2, r3
3000d82c:	e5d33000 	ldrb	r3, [r3]
3000d830:	e5cd3017 	strb	r3, [sp, #23]
		if(p=='\n')
3000d834:	e5dd3017 	ldrb	r3, [sp, #23]
3000d838:	e353000a 	cmp	r3, #10
3000d83c:	1a000001 	bne	3000d848 <console_write+0x48>
			put_char('\r');
3000d840:	e3a0000d 	mov	r0, #13
3000d844:	ebffffce 	bl	3000d784 <uart_write>
		put_char(p);
3000d848:	e5dd3017 	ldrb	r3, [sp, #23]
3000d84c:	e1a00003 	mov	r0, r3
3000d850:	ebffffcb 	bl	3000d784 <uart_write>
}

acoral_32 console_write(void *data,acoral_u32 size,acoral_time tm_out){
	acoral_u32 i;
  	char p;
	for(i=0;i<size;i++){
3000d854:	e59d3010 	ldr	r3, [sp, #16]
3000d858:	e2833001 	add	r3, r3, #1
3000d85c:	e58d3010 	str	r3, [sp, #16]
3000d860:	e59d2010 	ldr	r2, [sp, #16]
3000d864:	e59d3008 	ldr	r3, [sp, #8]
3000d868:	e1520003 	cmp	r2, r3
3000d86c:	3affffeb 	bcc	3000d820 <console_write+0x20>
		p=*((acoral_char *)data+i);
		if(p=='\n')
			put_char('\r');
		put_char(p);
	}
}
3000d870:	e28dd01c 	add	sp, sp, #28
3000d874:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d878:	e12fff1e 	bx	lr

3000d87c <console_read>:

acoral_32 console_read(void *data,acoral_size size,acoral_size offset,acoral_time tm_out){
3000d87c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
3000d880:	e24dd01c 	sub	sp, sp, #28
3000d884:	e58d000c 	str	r0, [sp, #12]
3000d888:	e58d1008 	str	r1, [sp, #8]
3000d88c:	e58d2004 	str	r2, [sp, #4]
3000d890:	e58d3000 	str	r3, [sp]
	acoral_u32 i;
  	acoral_char *p;
	for(i=0;i<size;i++){
3000d894:	e3a03000 	mov	r3, #0
3000d898:	e58d3010 	str	r3, [sp, #16]
3000d89c:	ea000008 	b	3000d8c4 <console_read+0x48>
		p=(acoral_char *)data+i;
3000d8a0:	e59d200c 	ldr	r2, [sp, #12]
3000d8a4:	e59d3010 	ldr	r3, [sp, #16]
3000d8a8:	e0823003 	add	r3, r2, r3
3000d8ac:	e58d3014 	str	r3, [sp, #20]
		get_char(p);
3000d8b0:	e59d0014 	ldr	r0, [sp, #20]
3000d8b4:	ebffffc1 	bl	3000d7c0 <uart_read>
}

acoral_32 console_read(void *data,acoral_size size,acoral_size offset,acoral_time tm_out){
	acoral_u32 i;
  	acoral_char *p;
	for(i=0;i<size;i++){
3000d8b8:	e59d3010 	ldr	r3, [sp, #16]
3000d8bc:	e2833001 	add	r3, r3, #1
3000d8c0:	e58d3010 	str	r3, [sp, #16]
3000d8c4:	e59d2010 	ldr	r2, [sp, #16]
3000d8c8:	e59d3008 	ldr	r3, [sp, #8]
3000d8cc:	e1520003 	cmp	r2, r3
3000d8d0:	3afffff2 	bcc	3000d8a0 <console_read+0x24>
		p=(acoral_char *)data+i;
		get_char(p);
	}
	return size;
3000d8d4:	e59d3008 	ldr	r3, [sp, #8]
}
3000d8d8:	e1a00003 	mov	r0, r3
3000d8dc:	e28dd01c 	add	sp, sp, #28
3000d8e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
3000d8e4:	e12fff1e 	bx	lr

3000d8e8 <console_config>:

acoral_32 console_config(acoral_u32 cmd,void *data,acoral_time time_out){
3000d8e8:	e24dd010 	sub	sp, sp, #16
3000d8ec:	e58d000c 	str	r0, [sp, #12]
3000d8f0:	e58d1008 	str	r1, [sp, #8]
3000d8f4:	e58d2004 	str	r2, [sp, #4]
	switch(cmd){
3000d8f8:	e59d300c 	ldr	r3, [sp, #12]
3000d8fc:	e3530001 	cmp	r3, #1
3000d900:	1a000002 	bne	3000d910 <console_config+0x28>
		case CONSOLE_ECHO:
			*(acoral_u8 *)data=1;
3000d904:	e59d3008 	ldr	r3, [sp, #8]
3000d908:	e3a02001 	mov	r2, #1
3000d90c:	e5c32000 	strb	r2, [r3]
		default:
			break;
	}		
}
3000d910:	e28dd010 	add	sp, sp, #16
3000d914:	e12fff1e 	bx	lr

3000d918 <console_open>:

acoral_32 console_open(){
3000d918:	e92d4008 	push	{r3, lr}
	uart_init();
3000d91c:	eb000003 	bl	3000d930 <uart_init>
	return 0;
3000d920:	e3a03000 	mov	r3, #0
}
3000d924:	e1a00003 	mov	r0, r3
3000d928:	e8bd4008 	pop	{r3, lr}
3000d92c:	e12fff1e 	bx	lr

3000d930 <uart_init>:

void uart_init(){
	rUCON0=0x245;	
3000d930:	e3a02245 	mov	r2, #1342177284	; 0x50000004
3000d934:	e3a03f91 	mov	r3, #580	; 0x244
3000d938:	e2833001 	add	r3, r3, #1
3000d93c:	e5823000 	str	r3, [r2]
	rULCON0=0x3;	
3000d940:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d944:	e3a02003 	mov	r2, #3
3000d948:	e5832000 	str	r2, [r3]
	rUFCON0=0x0;	
3000d94c:	e3a03285 	mov	r3, #1342177288	; 0x50000008
3000d950:	e3a02000 	mov	r2, #0
3000d954:	e5832000 	str	r2, [r3]
	rUMCON0=0x0;	
3000d958:	e3a032c5 	mov	r3, #1342177292	; 0x5000000c
3000d95c:	e3a02000 	mov	r2, #0
3000d960:	e5832000 	str	r2, [r3]
	rUBRDIV0=(PCLK /(CFG_BAUD_RATE * 16))-1;
3000d964:	e3a03205 	mov	r3, #1342177280	; 0x50000000
3000d968:	e2833028 	add	r3, r3, #40	; 0x28
3000d96c:	e3a0201a 	mov	r2, #26
3000d970:	e5832000 	str	r2, [r3]
    rGPHCON = 0x0016faaa;
3000d974:	e3a02456 	mov	r2, #1442840576	; 0x56000000
3000d978:	e2822070 	add	r2, r2, #112	; 0x70
3000d97c:	e3a0395b 	mov	r3, #1490944	; 0x16c000
3000d980:	e2833dea 	add	r3, r3, #14976	; 0x3a80
3000d984:	e283302a 	add	r3, r3, #42	; 0x2a
3000d988:	e5823000 	str	r3, [r2]
	rGPHUP  = 0x7ff;    /* The pull up function is disabled GPH[10:0]*/
3000d98c:	e3a03456 	mov	r3, #1442840576	; 0x56000000
3000d990:	e2833078 	add	r3, r3, #120	; 0x78
3000d994:	e3a02e7f 	mov	r2, #2032	; 0x7f0
3000d998:	e282200f 	add	r2, r2, #15
3000d99c:	e5832000 	str	r2, [r3]
}
3000d9a0:	e12fff1e 	bx	lr

3000d9a4 <con_uart_init>:

void con_uart_init(){
3000d9a4:	e92d4008 	push	{r3, lr}
	console_ops.open=console_open;
3000d9a8:	e59f203c 	ldr	r2, [pc, #60]	; 3000d9ec <con_uart_init+0x48>
3000d9ac:	e59f303c 	ldr	r3, [pc, #60]	; 3000d9f0 <con_uart_init+0x4c>
3000d9b0:	e5832000 	str	r2, [r3]
	console_ops.write=console_write;
3000d9b4:	e59f2038 	ldr	r2, [pc, #56]	; 3000d9f4 <con_uart_init+0x50>
3000d9b8:	e59f3030 	ldr	r3, [pc, #48]	; 3000d9f0 <con_uart_init+0x4c>
3000d9bc:	e5832008 	str	r2, [r3, #8]
	console_ops.read=console_read;
3000d9c0:	e59f3028 	ldr	r3, [pc, #40]	; 3000d9f0 <con_uart_init+0x4c>
3000d9c4:	e59f202c 	ldr	r2, [pc, #44]	; 3000d9f8 <con_uart_init+0x54>
3000d9c8:	e5832004 	str	r2, [r3, #4]
	console_ops.config=console_config;
3000d9cc:	e59f301c 	ldr	r3, [pc, #28]	; 3000d9f0 <con_uart_init+0x4c>
3000d9d0:	e59f2024 	ldr	r2, [pc, #36]	; 3000d9fc <con_uart_init+0x58>
3000d9d4:	e583200c 	str	r2, [r3, #12]
  	acoral_drv_register(&console_ops,"console");
3000d9d8:	e59f0010 	ldr	r0, [pc, #16]	; 3000d9f0 <con_uart_init+0x4c>
3000d9dc:	e59f101c 	ldr	r1, [pc, #28]	; 3000da00 <con_uart_init+0x5c>
3000d9e0:	ebfffe27 	bl	3000d284 <acoral_drv_register>
}
3000d9e4:	e8bd4008 	pop	{r3, lr}
3000d9e8:	e12fff1e 	bx	lr
3000d9ec:	3000d918 	.word	0x3000d918
3000d9f0:	3000faa0 	.word	0x3000faa0
3000d9f4:	3000d800 	.word	0x3000d800
3000d9f8:	3000d87c 	.word	0x3000d87c
3000d9fc:	3000d8e8 	.word	0x3000d8e8
3000da00:	3000ea3c 	.word	0x3000ea3c

3000da04 <__aeabi_uidiv>:
3000da04:	e2512001 	subs	r2, r1, #1
3000da08:	012fff1e 	bxeq	lr
3000da0c:	3a000036 	bcc	3000daec <__aeabi_uidiv+0xe8>
3000da10:	e1500001 	cmp	r0, r1
3000da14:	9a000022 	bls	3000daa4 <__aeabi_uidiv+0xa0>
3000da18:	e1110002 	tst	r1, r2
3000da1c:	0a000023 	beq	3000dab0 <__aeabi_uidiv+0xac>
3000da20:	e311020e 	tst	r1, #-536870912	; 0xe0000000
3000da24:	01a01181 	lsleq	r1, r1, #3
3000da28:	03a03008 	moveq	r3, #8
3000da2c:	13a03001 	movne	r3, #1
3000da30:	e3510201 	cmp	r1, #268435456	; 0x10000000
3000da34:	31510000 	cmpcc	r1, r0
3000da38:	31a01201 	lslcc	r1, r1, #4
3000da3c:	31a03203 	lslcc	r3, r3, #4
3000da40:	3afffffa 	bcc	3000da30 <__aeabi_uidiv+0x2c>
3000da44:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
3000da48:	31510000 	cmpcc	r1, r0
3000da4c:	31a01081 	lslcc	r1, r1, #1
3000da50:	31a03083 	lslcc	r3, r3, #1
3000da54:	3afffffa 	bcc	3000da44 <__aeabi_uidiv+0x40>
3000da58:	e3a02000 	mov	r2, #0
3000da5c:	e1500001 	cmp	r0, r1
3000da60:	20400001 	subcs	r0, r0, r1
3000da64:	21822003 	orrcs	r2, r2, r3
3000da68:	e15000a1 	cmp	r0, r1, lsr #1
3000da6c:	204000a1 	subcs	r0, r0, r1, lsr #1
3000da70:	218220a3 	orrcs	r2, r2, r3, lsr #1
3000da74:	e1500121 	cmp	r0, r1, lsr #2
3000da78:	20400121 	subcs	r0, r0, r1, lsr #2
3000da7c:	21822123 	orrcs	r2, r2, r3, lsr #2
3000da80:	e15001a1 	cmp	r0, r1, lsr #3
3000da84:	204001a1 	subcs	r0, r0, r1, lsr #3
3000da88:	218221a3 	orrcs	r2, r2, r3, lsr #3
3000da8c:	e3500000 	cmp	r0, #0
3000da90:	11b03223 	lsrsne	r3, r3, #4
3000da94:	11a01221 	lsrne	r1, r1, #4
3000da98:	1affffef 	bne	3000da5c <__aeabi_uidiv+0x58>
3000da9c:	e1a00002 	mov	r0, r2
3000daa0:	e12fff1e 	bx	lr
3000daa4:	03a00001 	moveq	r0, #1
3000daa8:	13a00000 	movne	r0, #0
3000daac:	e12fff1e 	bx	lr
3000dab0:	e3510801 	cmp	r1, #65536	; 0x10000
3000dab4:	21a01821 	lsrcs	r1, r1, #16
3000dab8:	23a02010 	movcs	r2, #16
3000dabc:	33a02000 	movcc	r2, #0
3000dac0:	e3510c01 	cmp	r1, #256	; 0x100
3000dac4:	21a01421 	lsrcs	r1, r1, #8
3000dac8:	22822008 	addcs	r2, r2, #8
3000dacc:	e3510010 	cmp	r1, #16
3000dad0:	21a01221 	lsrcs	r1, r1, #4
3000dad4:	22822004 	addcs	r2, r2, #4
3000dad8:	e3510004 	cmp	r1, #4
3000dadc:	82822003 	addhi	r2, r2, #3
3000dae0:	908220a1 	addls	r2, r2, r1, lsr #1
3000dae4:	e1a00230 	lsr	r0, r0, r2
3000dae8:	e12fff1e 	bx	lr
3000daec:	e3500000 	cmp	r0, #0
3000daf0:	13e00000 	mvnne	r0, #0
3000daf4:	ea000007 	b	3000db18 <__aeabi_idiv0>

3000daf8 <__aeabi_uidivmod>:
3000daf8:	e3510000 	cmp	r1, #0
3000dafc:	0afffffa 	beq	3000daec <__aeabi_uidiv+0xe8>
3000db00:	e92d4003 	push	{r0, r1, lr}
3000db04:	ebffffbe 	bl	3000da04 <__aeabi_uidiv>
3000db08:	e8bd4006 	pop	{r1, r2, lr}
3000db0c:	e0030092 	mul	r3, r2, r0
3000db10:	e0411003 	sub	r1, r1, r3
3000db14:	e12fff1e 	bx	lr

3000db18 <__aeabi_idiv0>:
3000db18:	e12fff1e 	bx	lr

3000db1c <__aeabi_frsub>:
3000db1c:	e2200102 	eor	r0, r0, #-2147483648	; 0x80000000
3000db20:	ea000000 	b	3000db28 <__addsf3>

3000db24 <__aeabi_fsub>:
3000db24:	e2211102 	eor	r1, r1, #-2147483648	; 0x80000000

3000db28 <__addsf3>:
3000db28:	e1b02080 	lsls	r2, r0, #1
3000db2c:	11b03081 	lslsne	r3, r1, #1
3000db30:	11320003 	teqne	r2, r3
3000db34:	11f0cc42 	mvnsne	ip, r2, asr #24
3000db38:	11f0cc43 	mvnsne	ip, r3, asr #24
3000db3c:	0a000047 	beq	3000dc60 <__addsf3+0x138>
3000db40:	e1a02c22 	lsr	r2, r2, #24
3000db44:	e0723c23 	rsbs	r3, r2, r3, lsr #24
3000db48:	c0822003 	addgt	r2, r2, r3
3000db4c:	c0201001 	eorgt	r1, r0, r1
3000db50:	c0210000 	eorgt	r0, r1, r0
3000db54:	c0201001 	eorgt	r1, r0, r1
3000db58:	b2633000 	rsblt	r3, r3, #0
3000db5c:	e3530019 	cmp	r3, #25
3000db60:	812fff1e 	bxhi	lr
3000db64:	e3100102 	tst	r0, #-2147483648	; 0x80000000
3000db68:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000db6c:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
3000db70:	12600000 	rsbne	r0, r0, #0
3000db74:	e3110102 	tst	r1, #-2147483648	; 0x80000000
3000db78:	e3811502 	orr	r1, r1, #8388608	; 0x800000
3000db7c:	e3c114ff 	bic	r1, r1, #-16777216	; 0xff000000
3000db80:	12611000 	rsbne	r1, r1, #0
3000db84:	e1320003 	teq	r2, r3
3000db88:	0a00002e 	beq	3000dc48 <__addsf3+0x120>
3000db8c:	e2422001 	sub	r2, r2, #1
3000db90:	e0900351 	adds	r0, r0, r1, asr r3
3000db94:	e2633020 	rsb	r3, r3, #32
3000db98:	e1a01311 	lsl	r1, r1, r3
3000db9c:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
3000dba0:	5a000001 	bpl	3000dbac <__addsf3+0x84>
3000dba4:	e2711000 	rsbs	r1, r1, #0
3000dba8:	e2e00000 	rsc	r0, r0, #0
3000dbac:	e3500502 	cmp	r0, #8388608	; 0x800000
3000dbb0:	3a00000b 	bcc	3000dbe4 <__addsf3+0xbc>
3000dbb4:	e3500401 	cmp	r0, #16777216	; 0x1000000
3000dbb8:	3a000004 	bcc	3000dbd0 <__addsf3+0xa8>
3000dbbc:	e1b000a0 	lsrs	r0, r0, #1
3000dbc0:	e1a01061 	rrx	r1, r1
3000dbc4:	e2822001 	add	r2, r2, #1
3000dbc8:	e35200fe 	cmp	r2, #254	; 0xfe
3000dbcc:	2a000038 	bcs	3000dcb4 <__addsf3+0x18c>
3000dbd0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
3000dbd4:	e0a00b82 	adc	r0, r0, r2, lsl #23
3000dbd8:	03c00001 	biceq	r0, r0, #1
3000dbdc:	e1800003 	orr	r0, r0, r3
3000dbe0:	e12fff1e 	bx	lr
3000dbe4:	e1b01081 	lsls	r1, r1, #1
3000dbe8:	e0a00000 	adc	r0, r0, r0
3000dbec:	e3100502 	tst	r0, #8388608	; 0x800000
3000dbf0:	e2422001 	sub	r2, r2, #1
3000dbf4:	1afffff5 	bne	3000dbd0 <__addsf3+0xa8>
3000dbf8:	e1b0c620 	lsrs	ip, r0, #12
3000dbfc:	01a00600 	lsleq	r0, r0, #12
3000dc00:	0242200c 	subeq	r2, r2, #12
3000dc04:	e31008ff 	tst	r0, #16711680	; 0xff0000
3000dc08:	01a00400 	lsleq	r0, r0, #8
3000dc0c:	02422008 	subeq	r2, r2, #8
3000dc10:	e310060f 	tst	r0, #15728640	; 0xf00000
3000dc14:	01a00200 	lsleq	r0, r0, #4
3000dc18:	02422004 	subeq	r2, r2, #4
3000dc1c:	e3100503 	tst	r0, #12582912	; 0xc00000
3000dc20:	01a00100 	lsleq	r0, r0, #2
3000dc24:	02422002 	subeq	r2, r2, #2
3000dc28:	e3500502 	cmp	r0, #8388608	; 0x800000
3000dc2c:	31a00080 	lslcc	r0, r0, #1
3000dc30:	e2d22000 	sbcs	r2, r2, #0
3000dc34:	a0800b82 	addge	r0, r0, r2, lsl #23
3000dc38:	b2622000 	rsblt	r2, r2, #0
3000dc3c:	a1800003 	orrge	r0, r0, r3
3000dc40:	b1830230 	orrlt	r0, r3, r0, lsr r2
3000dc44:	e12fff1e 	bx	lr
3000dc48:	e3320000 	teq	r2, #0
3000dc4c:	e2211502 	eor	r1, r1, #8388608	; 0x800000
3000dc50:	02200502 	eoreq	r0, r0, #8388608	; 0x800000
3000dc54:	02822001 	addeq	r2, r2, #1
3000dc58:	12433001 	subne	r3, r3, #1
3000dc5c:	eaffffca 	b	3000db8c <__addsf3+0x64>
3000dc60:	e1a03081 	lsl	r3, r1, #1
3000dc64:	e1f0cc42 	mvns	ip, r2, asr #24
3000dc68:	11f0cc43 	mvnsne	ip, r3, asr #24
3000dc6c:	0a000013 	beq	3000dcc0 <__addsf3+0x198>
3000dc70:	e1320003 	teq	r2, r3
3000dc74:	0a000002 	beq	3000dc84 <__addsf3+0x15c>
3000dc78:	e3320000 	teq	r2, #0
3000dc7c:	01a00001 	moveq	r0, r1
3000dc80:	e12fff1e 	bx	lr
3000dc84:	e1300001 	teq	r0, r1
3000dc88:	13a00000 	movne	r0, #0
3000dc8c:	112fff1e 	bxne	lr
3000dc90:	e31204ff 	tst	r2, #-16777216	; 0xff000000
3000dc94:	1a000002 	bne	3000dca4 <__addsf3+0x17c>
3000dc98:	e1b00080 	lsls	r0, r0, #1
3000dc9c:	23800102 	orrcs	r0, r0, #-2147483648	; 0x80000000
3000dca0:	e12fff1e 	bx	lr
3000dca4:	e2922402 	adds	r2, r2, #33554432	; 0x2000000
3000dca8:	32800502 	addcc	r0, r0, #8388608	; 0x800000
3000dcac:	312fff1e 	bxcc	lr
3000dcb0:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
3000dcb4:	e383047f 	orr	r0, r3, #2130706432	; 0x7f000000
3000dcb8:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000dcbc:	e12fff1e 	bx	lr
3000dcc0:	e1f02c42 	mvns	r2, r2, asr #24
3000dcc4:	11a00001 	movne	r0, r1
3000dcc8:	01f03c43 	mvnseq	r3, r3, asr #24
3000dccc:	11a01000 	movne	r1, r0
3000dcd0:	e1b02480 	lsls	r2, r0, #9
3000dcd4:	01b03481 	lslseq	r3, r1, #9
3000dcd8:	01300001 	teqeq	r0, r1
3000dcdc:	13800501 	orrne	r0, r0, #4194304	; 0x400000
3000dce0:	e12fff1e 	bx	lr

3000dce4 <__aeabi_ui2f>:
3000dce4:	e3a03000 	mov	r3, #0
3000dce8:	ea000001 	b	3000dcf4 <__aeabi_i2f+0x8>

3000dcec <__aeabi_i2f>:
3000dcec:	e2103102 	ands	r3, r0, #-2147483648	; 0x80000000
3000dcf0:	42600000 	rsbmi	r0, r0, #0
3000dcf4:	e1b0c000 	movs	ip, r0
3000dcf8:	012fff1e 	bxeq	lr
3000dcfc:	e383344b 	orr	r3, r3, #1258291200	; 0x4b000000
3000dd00:	e1a01000 	mov	r1, r0
3000dd04:	e3a00000 	mov	r0, #0
3000dd08:	ea00000f 	b	3000dd4c <__aeabi_l2f+0x30>

3000dd0c <__aeabi_ul2f>:
3000dd0c:	e1902001 	orrs	r2, r0, r1
3000dd10:	012fff1e 	bxeq	lr
3000dd14:	e3a03000 	mov	r3, #0
3000dd18:	ea000005 	b	3000dd34 <__aeabi_l2f+0x18>

3000dd1c <__aeabi_l2f>:
3000dd1c:	e1902001 	orrs	r2, r0, r1
3000dd20:	012fff1e 	bxeq	lr
3000dd24:	e2113102 	ands	r3, r1, #-2147483648	; 0x80000000
3000dd28:	5a000001 	bpl	3000dd34 <__aeabi_l2f+0x18>
3000dd2c:	e2700000 	rsbs	r0, r0, #0
3000dd30:	e2e11000 	rsc	r1, r1, #0
3000dd34:	e1b0c001 	movs	ip, r1
3000dd38:	01a0c000 	moveq	ip, r0
3000dd3c:	01a01000 	moveq	r1, r0
3000dd40:	03a00000 	moveq	r0, #0
3000dd44:	e383345b 	orr	r3, r3, #1526726656	; 0x5b000000
3000dd48:	02433201 	subeq	r3, r3, #268435456	; 0x10000000
3000dd4c:	e2433502 	sub	r3, r3, #8388608	; 0x800000
3000dd50:	e3a02017 	mov	r2, #23
3000dd54:	e35c0801 	cmp	ip, #65536	; 0x10000
3000dd58:	21a0c82c 	lsrcs	ip, ip, #16
3000dd5c:	22422010 	subcs	r2, r2, #16
3000dd60:	e35c0c01 	cmp	ip, #256	; 0x100
3000dd64:	21a0c42c 	lsrcs	ip, ip, #8
3000dd68:	22422008 	subcs	r2, r2, #8
3000dd6c:	e35c0010 	cmp	ip, #16
3000dd70:	21a0c22c 	lsrcs	ip, ip, #4
3000dd74:	22422004 	subcs	r2, r2, #4
3000dd78:	e35c0004 	cmp	ip, #4
3000dd7c:	22422002 	subcs	r2, r2, #2
3000dd80:	304220ac 	subcc	r2, r2, ip, lsr #1
3000dd84:	e05221ac 	subs	r2, r2, ip, lsr #3
3000dd88:	e0433b82 	sub	r3, r3, r2, lsl #23
3000dd8c:	ba000006 	blt	3000ddac <__aeabi_l2f+0x90>
3000dd90:	e0833211 	add	r3, r3, r1, lsl r2
3000dd94:	e1a0c210 	lsl	ip, r0, r2
3000dd98:	e2622020 	rsb	r2, r2, #32
3000dd9c:	e35c0102 	cmp	ip, #-2147483648	; 0x80000000
3000dda0:	e0a30230 	adc	r0, r3, r0, lsr r2
3000dda4:	03c00001 	biceq	r0, r0, #1
3000dda8:	e12fff1e 	bx	lr
3000ddac:	e2822020 	add	r2, r2, #32
3000ddb0:	e1a0c211 	lsl	ip, r1, r2
3000ddb4:	e2622020 	rsb	r2, r2, #32
3000ddb8:	e190008c 	orrs	r0, r0, ip, lsl #1
3000ddbc:	e0a30231 	adc	r0, r3, r1, lsr r2
3000ddc0:	01c00fac 	biceq	r0, r0, ip, lsr #31
3000ddc4:	e12fff1e 	bx	lr

3000ddc8 <__aeabi_fmul>:
3000ddc8:	e3a0c0ff 	mov	ip, #255	; 0xff
3000ddcc:	e01c2ba0 	ands	r2, ip, r0, lsr #23
3000ddd0:	101c3ba1 	andsne	r3, ip, r1, lsr #23
3000ddd4:	1132000c 	teqne	r2, ip
3000ddd8:	1133000c 	teqne	r3, ip
3000dddc:	0a00003e 	beq	3000dedc <__aeabi_fmul+0x114>
3000dde0:	e0822003 	add	r2, r2, r3
3000dde4:	e020c001 	eor	ip, r0, r1
3000dde8:	e1b00480 	lsls	r0, r0, #9
3000ddec:	11b01481 	lslsne	r1, r1, #9
3000ddf0:	0a000010 	beq	3000de38 <__aeabi_fmul+0x70>
3000ddf4:	e3a03302 	mov	r3, #134217728	; 0x8000000
3000ddf8:	e18302a0 	orr	r0, r3, r0, lsr #5
3000ddfc:	e18312a1 	orr	r1, r3, r1, lsr #5
3000de00:	e0813190 	umull	r3, r1, r0, r1
3000de04:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
3000de08:	e3510502 	cmp	r1, #8388608	; 0x800000
3000de0c:	31a01081 	lslcc	r1, r1, #1
3000de10:	31811fa3 	orrcc	r1, r1, r3, lsr #31
3000de14:	31a03083 	lslcc	r3, r3, #1
3000de18:	e1800001 	orr	r0, r0, r1
3000de1c:	e2c2207f 	sbc	r2, r2, #127	; 0x7f
3000de20:	e35200fd 	cmp	r2, #253	; 0xfd
3000de24:	8a00000f 	bhi	3000de68 <__aeabi_fmul+0xa0>
3000de28:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
3000de2c:	e0a00b82 	adc	r0, r0, r2, lsl #23
3000de30:	03c00001 	biceq	r0, r0, #1
3000de34:	e12fff1e 	bx	lr
3000de38:	e3300000 	teq	r0, #0
3000de3c:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
3000de40:	01a01481 	lsleq	r1, r1, #9
3000de44:	e18c04a0 	orr	r0, ip, r0, lsr #9
3000de48:	e18004a1 	orr	r0, r0, r1, lsr #9
3000de4c:	e252207f 	subs	r2, r2, #127	; 0x7f
3000de50:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
3000de54:	c1800b82 	orrgt	r0, r0, r2, lsl #23
3000de58:	c12fff1e 	bxgt	lr
3000de5c:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000de60:	e3a03000 	mov	r3, #0
3000de64:	e2522001 	subs	r2, r2, #1
3000de68:	ca000035 	bgt	3000df44 <__aeabi_fmul+0x17c>
3000de6c:	e3720019 	cmn	r2, #25
3000de70:	d2000102 	andle	r0, r0, #-2147483648	; 0x80000000
3000de74:	d12fff1e 	bxle	lr
3000de78:	e2622000 	rsb	r2, r2, #0
3000de7c:	e1b01080 	lsls	r1, r0, #1
3000de80:	e1a01231 	lsr	r1, r1, r2
3000de84:	e2622020 	rsb	r2, r2, #32
3000de88:	e1a0c210 	lsl	ip, r0, r2
3000de8c:	e1b00061 	rrxs	r0, r1
3000de90:	e2a00000 	adc	r0, r0, #0
3000de94:	e193308c 	orrs	r3, r3, ip, lsl #1
3000de98:	01c00fac 	biceq	r0, r0, ip, lsr #31
3000de9c:	e12fff1e 	bx	lr
3000dea0:	e3320000 	teq	r2, #0
3000dea4:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
3000dea8:	01a00080 	lsleq	r0, r0, #1
3000deac:	03100502 	tsteq	r0, #8388608	; 0x800000
3000deb0:	02422001 	subeq	r2, r2, #1
3000deb4:	0afffffb 	beq	3000dea8 <__aeabi_fmul+0xe0>
3000deb8:	e180000c 	orr	r0, r0, ip
3000debc:	e3330000 	teq	r3, #0
3000dec0:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
3000dec4:	01a01081 	lsleq	r1, r1, #1
3000dec8:	03110502 	tsteq	r1, #8388608	; 0x800000
3000decc:	02433001 	subeq	r3, r3, #1
3000ded0:	0afffffb 	beq	3000dec4 <__aeabi_fmul+0xfc>
3000ded4:	e181100c 	orr	r1, r1, ip
3000ded8:	eaffffc0 	b	3000dde0 <__aeabi_fmul+0x18>
3000dedc:	e00c3ba1 	and	r3, ip, r1, lsr #23
3000dee0:	e132000c 	teq	r2, ip
3000dee4:	1133000c 	teqne	r3, ip
3000dee8:	0a000005 	beq	3000df04 <__aeabi_fmul+0x13c>
3000deec:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
3000def0:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
3000def4:	1affffe9 	bne	3000dea0 <__aeabi_fmul+0xd8>
3000def8:	e0200001 	eor	r0, r0, r1
3000defc:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
3000df00:	e12fff1e 	bx	lr
3000df04:	e3300000 	teq	r0, #0
3000df08:	13300102 	teqne	r0, #-2147483648	; 0x80000000
3000df0c:	01a00001 	moveq	r0, r1
3000df10:	13310000 	teqne	r1, #0
3000df14:	13310102 	teqne	r1, #-2147483648	; 0x80000000
3000df18:	0a00000d 	beq	3000df54 <__aeabi_fmul+0x18c>
3000df1c:	e132000c 	teq	r2, ip
3000df20:	1a000001 	bne	3000df2c <__aeabi_fmul+0x164>
3000df24:	e1b02480 	lsls	r2, r0, #9
3000df28:	1a000009 	bne	3000df54 <__aeabi_fmul+0x18c>
3000df2c:	e133000c 	teq	r3, ip
3000df30:	1a000002 	bne	3000df40 <__aeabi_fmul+0x178>
3000df34:	e1b03481 	lsls	r3, r1, #9
3000df38:	11a00001 	movne	r0, r1
3000df3c:	1a000004 	bne	3000df54 <__aeabi_fmul+0x18c>
3000df40:	e0200001 	eor	r0, r0, r1
3000df44:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
3000df48:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
3000df4c:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000df50:	e12fff1e 	bx	lr
3000df54:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
3000df58:	e3800503 	orr	r0, r0, #12582912	; 0xc00000
3000df5c:	e12fff1e 	bx	lr

3000df60 <__aeabi_fdiv>:
3000df60:	e3a0c0ff 	mov	ip, #255	; 0xff
3000df64:	e01c2ba0 	ands	r2, ip, r0, lsr #23
3000df68:	101c3ba1 	andsne	r3, ip, r1, lsr #23
3000df6c:	1132000c 	teqne	r2, ip
3000df70:	1133000c 	teqne	r3, ip
3000df74:	0a00003a 	beq	3000e064 <__aeabi_fdiv+0x104>
3000df78:	e0422003 	sub	r2, r2, r3
3000df7c:	e020c001 	eor	ip, r0, r1
3000df80:	e1b01481 	lsls	r1, r1, #9
3000df84:	e1a00480 	lsl	r0, r0, #9
3000df88:	0a00001c 	beq	3000e000 <__aeabi_fdiv+0xa0>
3000df8c:	e3a03201 	mov	r3, #268435456	; 0x10000000
3000df90:	e1831221 	orr	r1, r3, r1, lsr #4
3000df94:	e1833220 	orr	r3, r3, r0, lsr #4
3000df98:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
3000df9c:	e1530001 	cmp	r3, r1
3000dfa0:	31a03083 	lslcc	r3, r3, #1
3000dfa4:	e2a2207d 	adc	r2, r2, #125	; 0x7d
3000dfa8:	e3a0c502 	mov	ip, #8388608	; 0x800000
3000dfac:	e1530001 	cmp	r3, r1
3000dfb0:	20433001 	subcs	r3, r3, r1
3000dfb4:	2180000c 	orrcs	r0, r0, ip
3000dfb8:	e15300a1 	cmp	r3, r1, lsr #1
3000dfbc:	204330a1 	subcs	r3, r3, r1, lsr #1
3000dfc0:	218000ac 	orrcs	r0, r0, ip, lsr #1
3000dfc4:	e1530121 	cmp	r3, r1, lsr #2
3000dfc8:	20433121 	subcs	r3, r3, r1, lsr #2
3000dfcc:	2180012c 	orrcs	r0, r0, ip, lsr #2
3000dfd0:	e15301a1 	cmp	r3, r1, lsr #3
3000dfd4:	204331a1 	subcs	r3, r3, r1, lsr #3
3000dfd8:	218001ac 	orrcs	r0, r0, ip, lsr #3
3000dfdc:	e1b03203 	lsls	r3, r3, #4
3000dfe0:	11b0c22c 	lsrsne	ip, ip, #4
3000dfe4:	1afffff0 	bne	3000dfac <__aeabi_fdiv+0x4c>
3000dfe8:	e35200fd 	cmp	r2, #253	; 0xfd
3000dfec:	8affff9d 	bhi	3000de68 <__aeabi_fmul+0xa0>
3000dff0:	e1530001 	cmp	r3, r1
3000dff4:	e0a00b82 	adc	r0, r0, r2, lsl #23
3000dff8:	03c00001 	biceq	r0, r0, #1
3000dffc:	e12fff1e 	bx	lr
3000e000:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
3000e004:	e18c04a0 	orr	r0, ip, r0, lsr #9
3000e008:	e292207f 	adds	r2, r2, #127	; 0x7f
3000e00c:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
3000e010:	c1800b82 	orrgt	r0, r0, r2, lsl #23
3000e014:	c12fff1e 	bxgt	lr
3000e018:	e3800502 	orr	r0, r0, #8388608	; 0x800000
3000e01c:	e3a03000 	mov	r3, #0
3000e020:	e2522001 	subs	r2, r2, #1
3000e024:	eaffff8f 	b	3000de68 <__aeabi_fmul+0xa0>
3000e028:	e3320000 	teq	r2, #0
3000e02c:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
3000e030:	01a00080 	lsleq	r0, r0, #1
3000e034:	03100502 	tsteq	r0, #8388608	; 0x800000
3000e038:	02422001 	subeq	r2, r2, #1
3000e03c:	0afffffb 	beq	3000e030 <__aeabi_fdiv+0xd0>
3000e040:	e180000c 	orr	r0, r0, ip
3000e044:	e3330000 	teq	r3, #0
3000e048:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
3000e04c:	01a01081 	lsleq	r1, r1, #1
3000e050:	03110502 	tsteq	r1, #8388608	; 0x800000
3000e054:	02433001 	subeq	r3, r3, #1
3000e058:	0afffffb 	beq	3000e04c <__aeabi_fdiv+0xec>
3000e05c:	e181100c 	orr	r1, r1, ip
3000e060:	eaffffc4 	b	3000df78 <__aeabi_fdiv+0x18>
3000e064:	e00c3ba1 	and	r3, ip, r1, lsr #23
3000e068:	e132000c 	teq	r2, ip
3000e06c:	1a000005 	bne	3000e088 <__aeabi_fdiv+0x128>
3000e070:	e1b02480 	lsls	r2, r0, #9
3000e074:	1affffb6 	bne	3000df54 <__aeabi_fmul+0x18c>
3000e078:	e133000c 	teq	r3, ip
3000e07c:	1affffaf 	bne	3000df40 <__aeabi_fmul+0x178>
3000e080:	e1a00001 	mov	r0, r1
3000e084:	eaffffb2 	b	3000df54 <__aeabi_fmul+0x18c>
3000e088:	e133000c 	teq	r3, ip
3000e08c:	1a000003 	bne	3000e0a0 <__aeabi_fdiv+0x140>
3000e090:	e1b03481 	lsls	r3, r1, #9
3000e094:	0affff97 	beq	3000def8 <__aeabi_fmul+0x130>
3000e098:	e1a00001 	mov	r0, r1
3000e09c:	eaffffac 	b	3000df54 <__aeabi_fmul+0x18c>
3000e0a0:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
3000e0a4:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
3000e0a8:	1affffde 	bne	3000e028 <__aeabi_fdiv+0xc8>
3000e0ac:	e3d02102 	bics	r2, r0, #-2147483648	; 0x80000000
3000e0b0:	1affffa2 	bne	3000df40 <__aeabi_fmul+0x178>
3000e0b4:	e3d13102 	bics	r3, r1, #-2147483648	; 0x80000000
3000e0b8:	1affff8e 	bne	3000def8 <__aeabi_fmul+0x130>
3000e0bc:	eaffffa4 	b	3000df54 <__aeabi_fmul+0x18c>

3000e0c0 <__gesf2>:
3000e0c0:	e3e0c000 	mvn	ip, #0
3000e0c4:	ea000002 	b	3000e0d4 <__cmpsf2+0x4>

3000e0c8 <__lesf2>:
3000e0c8:	e3a0c001 	mov	ip, #1
3000e0cc:	ea000000 	b	3000e0d4 <__cmpsf2+0x4>

3000e0d0 <__cmpsf2>:
3000e0d0:	e3a0c001 	mov	ip, #1
3000e0d4:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
3000e0d8:	e1a02080 	lsl	r2, r0, #1
3000e0dc:	e1a03081 	lsl	r3, r1, #1
3000e0e0:	e1f0cc42 	mvns	ip, r2, asr #24
3000e0e4:	11f0cc43 	mvnsne	ip, r3, asr #24
3000e0e8:	0a000007 	beq	3000e10c <__cmpsf2+0x3c>
3000e0ec:	e28dd004 	add	sp, sp, #4
3000e0f0:	e192c0a3 	orrs	ip, r2, r3, lsr #1
3000e0f4:	11300001 	teqne	r0, r1
3000e0f8:	50520003 	subspl	r0, r2, r3
3000e0fc:	81a00fc1 	asrhi	r0, r1, #31
3000e100:	31e00fc1 	mvncc	r0, r1, asr #31
3000e104:	13800001 	orrne	r0, r0, #1
3000e108:	e12fff1e 	bx	lr
3000e10c:	e1f0cc42 	mvns	ip, r2, asr #24
3000e110:	1a000001 	bne	3000e11c <__cmpsf2+0x4c>
3000e114:	e1b0c480 	lsls	ip, r0, #9
3000e118:	1a000003 	bne	3000e12c <__cmpsf2+0x5c>
3000e11c:	e1f0cc43 	mvns	ip, r3, asr #24
3000e120:	1afffff1 	bne	3000e0ec <__cmpsf2+0x1c>
3000e124:	e1b0c481 	lsls	ip, r1, #9
3000e128:	0affffef 	beq	3000e0ec <__cmpsf2+0x1c>
3000e12c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
3000e130:	e12fff1e 	bx	lr

3000e134 <__aeabi_cfrcmple>:
3000e134:	e1a0c000 	mov	ip, r0
3000e138:	e1a00001 	mov	r0, r1
3000e13c:	e1a0100c 	mov	r1, ip
3000e140:	eaffffff 	b	3000e144 <__aeabi_cfcmpeq>

3000e144 <__aeabi_cfcmpeq>:
3000e144:	e92d400f 	push	{r0, r1, r2, r3, lr}
3000e148:	ebffffe0 	bl	3000e0d0 <__cmpsf2>
3000e14c:	e3500000 	cmp	r0, #0
3000e150:	43700000 	cmnmi	r0, #0
3000e154:	e8bd400f 	pop	{r0, r1, r2, r3, lr}
3000e158:	e12fff1e 	bx	lr

3000e15c <__aeabi_fcmpeq>:
3000e15c:	e52de008 	str	lr, [sp, #-8]!
3000e160:	ebfffff7 	bl	3000e144 <__aeabi_cfcmpeq>
3000e164:	03a00001 	moveq	r0, #1
3000e168:	13a00000 	movne	r0, #0
3000e16c:	e49de008 	ldr	lr, [sp], #8
3000e170:	e12fff1e 	bx	lr

3000e174 <__aeabi_fcmplt>:
3000e174:	e52de008 	str	lr, [sp, #-8]!
3000e178:	ebfffff1 	bl	3000e144 <__aeabi_cfcmpeq>
3000e17c:	33a00001 	movcc	r0, #1
3000e180:	23a00000 	movcs	r0, #0
3000e184:	e49de008 	ldr	lr, [sp], #8
3000e188:	e12fff1e 	bx	lr

3000e18c <__aeabi_fcmple>:
3000e18c:	e52de008 	str	lr, [sp, #-8]!
3000e190:	ebffffeb 	bl	3000e144 <__aeabi_cfcmpeq>
3000e194:	93a00001 	movls	r0, #1
3000e198:	83a00000 	movhi	r0, #0
3000e19c:	e49de008 	ldr	lr, [sp], #8
3000e1a0:	e12fff1e 	bx	lr

3000e1a4 <__aeabi_fcmpge>:
3000e1a4:	e52de008 	str	lr, [sp, #-8]!
3000e1a8:	ebffffe1 	bl	3000e134 <__aeabi_cfrcmple>
3000e1ac:	93a00001 	movls	r0, #1
3000e1b0:	83a00000 	movhi	r0, #0
3000e1b4:	e49de008 	ldr	lr, [sp], #8
3000e1b8:	e12fff1e 	bx	lr

3000e1bc <__aeabi_fcmpgt>:
3000e1bc:	e52de008 	str	lr, [sp, #-8]!
3000e1c0:	ebffffdb 	bl	3000e134 <__aeabi_cfrcmple>
3000e1c4:	33a00001 	movcc	r0, #1
3000e1c8:	23a00000 	movcs	r0, #0
3000e1cc:	e49de008 	ldr	lr, [sp], #8
3000e1d0:	e12fff1e 	bx	lr
3000e1d4:	72724544 	.word	0x72724544
3000e1d8:	0000000a 	.word	0x0000000a
3000e1dc:	6d656164 	.word	0x6d656164
3000e1e0:	00006e6f 	.word	0x00006e6f
3000e1e4:	736e6f63 	.word	0x736e6f63
3000e1e8:	00656c6f 	.word	0x00656c6f
3000e1ec:	656c6469 	.word	0x656c6469
3000e1f0:	00000000 	.word	0x00000000
3000e1f4:	69206e69 	.word	0x69206e69
3000e1f8:	0074696e 	.word	0x0074696e
3000e1fc:	74696e69 	.word	0x74696e69
3000e200:	00000000 	.word	0x00000000
3000e204:	6f6c6c41 	.word	0x6f6c6c41
3000e208:	68742063 	.word	0x68742063
3000e20c:	64616572 	.word	0x64616572
3000e210:	2073253a 	.word	0x2073253a
3000e214:	6c696166 	.word	0x6c696166
3000e218:	0000000a 	.word	0x0000000a
3000e21c:	74206f4e 	.word	0x74206f4e
3000e220:	61657268 	.word	0x61657268
3000e224:	6f702064 	.word	0x6f702064
3000e228:	7963696c 	.word	0x7963696c
3000e22c:	70757320 	.word	0x70757320
3000e230:	74726f70 	.word	0x74726f70
3000e234:	0a64253a 	.word	0x0a64253a
3000e238:	00000000 	.word	0x00000000
3000e23c:	65657341 	.word	0x65657341
3000e240:	493a7472 	.word	0x493a7472
3000e244:	6573206e 	.word	0x6573206e
3000e248:	7463656c 	.word	0x7463656c
3000e24c:	72687420 	.word	0x72687420
3000e250:	00646165 	.word	0x00646165
3000e254:	6f6c6c41 	.word	0x6f6c6c41
3000e258:	68742063 	.word	0x68742063
3000e25c:	64616572 	.word	0x64616572
3000e260:	2073253a 	.word	0x2073253a
3000e264:	6c696166 	.word	0x6c696166
3000e268:	0000000a 	.word	0x0000000a
3000e26c:	74206f4e 	.word	0x74206f4e
3000e270:	61657268 	.word	0x61657268
3000e274:	74732064 	.word	0x74732064
3000e278:	3a6b6361 	.word	0x3a6b6361
3000e27c:	000a7325 	.word	0x000a7325
3000e280:	6d6d6f63 	.word	0x6d6d6f63
3000e284:	00000000 	.word	0x00000000
3000e288:	20736552 	.word	0x20736552
3000e28c:	656c6552 	.word	0x656c6552
3000e290:	0a657361 	.word	0x0a657361
3000e294:	00000000 	.word	0x00000000
3000e298:	20736552 	.word	0x20736552
3000e29c:	656c6572 	.word	0x656c6572
3000e2a0:	20657361 	.word	0x20657361
3000e2a4:	0a727245 	.word	0x0a727245
3000e2a8:	00000000 	.word	0x00000000
3000e2ac:	20727245 	.word	0x20727245
3000e2b0:	0a736552 	.word	0x0a736552
3000e2b4:	00000000 	.word	0x00000000
3000e2b8:	000a7325 	.word	0x000a7325
3000e2bc:	20727245 	.word	0x20727245
3000e2c0:	27736572 	.word	0x27736572
3000e2c4:	64692073 	.word	0x64692073
3000e2c8:	0a78253a 	.word	0x0a78253a
3000e2cc:	00000000 	.word	0x00000000
3000e2d0:	65637845 	.word	0x65637845
3000e2d4:	6f697470 	.word	0x6f697470
3000e2d8:	636f206e 	.word	0x636f206e
3000e2dc:	0a727563 	.word	0x0a727563
3000e2e0:	00000000 	.word	0x00000000
3000e2e4:	2a2a2a2a 	.word	0x2a2a2a2a
3000e2e8:	2a2a2a2a 	.word	0x2a2a2a2a
3000e2ec:	2a2a2a2a 	.word	0x2a2a2a2a
3000e2f0:	2a2a2a2a 	.word	0x2a2a2a2a
3000e2f4:	000a2a2a 	.word	0x000a2a2a
3000e2f8:	3a555043 	.word	0x3a555043
3000e2fc:	000a6425 	.word	0x000a6425
3000e300:	65726854 	.word	0x65726854
3000e304:	6e206461 	.word	0x6e206461
3000e308:	3a656d61 	.word	0x3a656d61
3000e30c:	000a7325 	.word	0x000a7325
3000e310:	65726854 	.word	0x65726854
3000e314:	70206461 	.word	0x70206461
3000e318:	3a6f6972 	.word	0x3a6f6972
3000e31c:	000a6425 	.word	0x000a6425
3000e320:	65726854 	.word	0x65726854
3000e324:	73206461 	.word	0x73206461
3000e328:	6b636174 	.word	0x6b636174
3000e32c:	7a69735f 	.word	0x7a69735f
3000e330:	64253a65 	.word	0x64253a65
3000e334:	0000000a 	.word	0x0000000a
3000e338:	65726854 	.word	0x65726854
3000e33c:	73206461 	.word	0x73206461
3000e340:	6b636174 	.word	0x6b636174
3000e344:	7475625f 	.word	0x7475625f
3000e348:	3a6d6f74 	.word	0x3a6d6f74
3000e34c:	78257830 	.word	0x78257830
3000e350:	0000000a 	.word	0x0000000a
3000e354:	65726854 	.word	0x65726854
3000e358:	73206461 	.word	0x73206461
3000e35c:	6b636174 	.word	0x6b636174
3000e360:	2578303a 	.word	0x2578303a
3000e364:	00000a78 	.word	0x00000a78
3000e368:	303a6350 	.word	0x303a6350
3000e36c:	0a782578 	.word	0x0a782578
3000e370:	00000000 	.word	0x00000000
3000e374:	63617453 	.word	0x63617453
3000e378:	78303a6b 	.word	0x78303a6b
3000e37c:	000a7825 	.word	0x000a7825
3000e380:	74206e69 	.word	0x74206e69
3000e384:	20656d69 	.word	0x20656d69
3000e388:	6c616564 	.word	0x6c616564
3000e38c:	00000000 	.word	0x00000000
3000e390:	74206e69 	.word	0x74206e69
3000e394:	20656d69 	.word	0x20656d69
3000e398:	6c616564 	.word	0x6c616564
3000e39c:	726f6620 	.word	0x726f6620
3000e3a0:	00000000 	.word	0x00000000
3000e3a4:	74206e69 	.word	0x74206e69
3000e3a8:	6f656d69 	.word	0x6f656d69
3000e3ac:	64207475 	.word	0x64207475
3000e3b0:	006c6165 	.word	0x006c6165
3000e3b4:	6574756d 	.word	0x6574756d
3000e3b8:	554e2078 	.word	0x554e2078
3000e3bc:	000a4c4c 	.word	0x000a4c4c
3000e3c0:	6574756d 	.word	0x6574756d
3000e3c4:	72702078 	.word	0x72702078
3000e3c8:	65206f69 	.word	0x65206f69
3000e3cc:	000a7272 	.word	0x000a7272
3000e3d0:	6576654c 	.word	0x6576654c
3000e3d4:	0d64256c 	.word	0x0d64256c
3000e3d8:	0000000a 	.word	0x0000000a
3000e3dc:	6d746962 	.word	0x6d746962
3000e3e0:	003a7061 	.word	0x003a7061
3000e3e4:	00207825 	.word	0x00207825
3000e3e8:	00000a0d 	.word	0x00000a0d
3000e3ec:	65657246 	.word	0x65657246
3000e3f0:	6f6c4220 	.word	0x6f6c4220
3000e3f4:	68206b63 	.word	0x68206b63
3000e3f8:	3a646165 	.word	0x3a646165
3000e3fc:	0a0d6425 	.word	0x0a0d6425
3000e400:	00000000 	.word	0x00000000
3000e404:	65657246 	.word	0x65657246
3000e408:	6d654d20 	.word	0x6d654d20
3000e40c:	6f6c4220 	.word	0x6f6c4220
3000e410:	4e206b63 	.word	0x4e206b63
3000e414:	65626d75 	.word	0x65626d75
3000e418:	64253a72 	.word	0x64253a72
3000e41c:	00000a0d 	.word	0x00000a0d
3000e420:	61766e49 	.word	0x61766e49
3000e424:	2064696c 	.word	0x2064696c
3000e428:	65657246 	.word	0x65657246
3000e42c:	64644120 	.word	0x64644120
3000e430:	73736572 	.word	0x73736572
3000e434:	2578303a 	.word	0x2578303a
3000e438:	00000a78 	.word	0x00000a78
3000e43c:	72646441 	.word	0x72646441
3000e440:	3a737365 	.word	0x3a737365
3000e444:	78257830 	.word	0x78257830
3000e448:	76616820 	.word	0x76616820
3000e44c:	65622065 	.word	0x65622065
3000e450:	66206e65 	.word	0x66206e65
3000e454:	64656572 	.word	0x64656572
3000e458:	0000000a 	.word	0x0000000a
3000e45c:	20727245 	.word	0x20727245
3000e460:	72646461 	.word	0x72646461
3000e464:	20737365 	.word	0x20737365
3000e468:	30207369 	.word	0x30207369
3000e46c:	2c782578 	.word	0x2c782578
3000e470:	657a6973 	.word	0x657a6973
3000e474:	6f687320 	.word	0x6f687320
3000e478:	20646c75 	.word	0x20646c75
3000e47c:	20746f6e 	.word	0x20746f6e
3000e480:	30206562 	.word	0x30206562
3000e484:	00000000 	.word	0x00000000
3000e488:	61766e49 	.word	0x61766e49
3000e48c:	6564696c 	.word	0x6564696c
3000e490:	65724620 	.word	0x65724620
3000e494:	64612065 	.word	0x64612065
3000e498:	73657264 	.word	0x73657264
3000e49c:	78303a73 	.word	0x78303a73
3000e4a0:	000a7825 	.word	0x000a7825
3000e4a4:	72646441 	.word	0x72646441
3000e4a8:	3a737365 	.word	0x3a737365
3000e4ac:	78257830 	.word	0x78257830
3000e4b0:	76616820 	.word	0x76616820
3000e4b4:	65622065 	.word	0x65622065
3000e4b8:	66206e65 	.word	0x66206e65
3000e4bc:	64656572 	.word	0x64656572
3000e4c0:	0000000a 	.word	0x0000000a
3000e4c4:	20727265 	.word	0x20727265
3000e4c8:	72646461 	.word	0x72646461
3000e4cc:	20737365 	.word	0x20737365
3000e4d0:	30207369 	.word	0x30207369
3000e4d4:	2c782578 	.word	0x2c782578
3000e4d8:	657a6973 	.word	0x657a6973
3000e4dc:	6f687320 	.word	0x6f687320
3000e4e0:	20646c75 	.word	0x20646c75
3000e4e4:	20746f6e 	.word	0x20746f6e
3000e4e8:	30206562 	.word	0x30206562
3000e4ec:	00000000 	.word	0x00000000
3000e4f0:	206d654d 	.word	0x206d654d
3000e4f4:	74696e49 	.word	0x74696e49
3000e4f8:	72724520 	.word	0x72724520
3000e4fc:	6f732c20 	.word	0x6f732c20
3000e500:	206f6e20 	.word	0x206f6e20
3000e504:	206d656d 	.word	0x206d656d
3000e508:	63617073 	.word	0x63617073
3000e50c:	6f742065 	.word	0x6f742065
3000e510:	6c616d20 	.word	0x6c616d20
3000e514:	0d636f6c 	.word	0x0d636f6c
3000e518:	0000000a 	.word	0x0000000a
3000e51c:	20727245 	.word	0x20727245
3000e520:	72646461 	.word	0x72646461
3000e524:	20737365 	.word	0x20737365
3000e528:	30207369 	.word	0x30207369
3000e52c:	2c782578 	.word	0x2c782578
3000e530:	657a6973 	.word	0x657a6973
3000e534:	6f687320 	.word	0x6f687320
3000e538:	20646c75 	.word	0x20646c75
3000e53c:	20746f6e 	.word	0x20746f6e
3000e540:	30206562 	.word	0x30206562
3000e544:	00000a0d 	.word	0x00000a0d
3000e548:	20656854 	.word	0x20656854
3000e54c:	72646461 	.word	0x72646461
3000e550:	20737365 	.word	0x20737365
3000e554:	30207369 	.word	0x30207369
3000e558:	2c782578 	.word	0x2c782578
3000e55c:	20656874 	.word	0x20656874
3000e560:	636f6c62 	.word	0x636f6c62
3000e564:	7369206b 	.word	0x7369206b
3000e568:	65737520 	.word	0x65737520
3000e56c:	6e612064 	.word	0x6e612064
3000e570:	74692064 	.word	0x74692064
3000e574:	73207327 	.word	0x73207327
3000e578:	20657a69 	.word	0x20657a69
3000e57c:	25207369 	.word	0x25207369
3000e580:	000a0d64 	.word	0x000a0d64
3000e584:	20656854 	.word	0x20656854
3000e588:	72646461 	.word	0x72646461
3000e58c:	20737365 	.word	0x20737365
3000e590:	30207369 	.word	0x30207369
3000e594:	2c782578 	.word	0x2c782578
3000e598:	20656874 	.word	0x20656874
3000e59c:	636f6c62 	.word	0x636f6c62
3000e5a0:	7369206b 	.word	0x7369206b
3000e5a4:	756e7520 	.word	0x756e7520
3000e5a8:	20646573 	.word	0x20646573
3000e5ac:	20646e61 	.word	0x20646e61
3000e5b0:	73277469 	.word	0x73277469
3000e5b4:	7a697320 	.word	0x7a697320
3000e5b8:	73692065 	.word	0x73692065
3000e5bc:	0d642520 	.word	0x0d642520
3000e5c0:	0000000a 	.word	0x0000000a
3000e5c4:	20727245 	.word	0x20727245
3000e5c8:	206d6553 	.word	0x206d6553
3000e5cc:	74736f70 	.word	0x74736f70
3000e5d0:	0000000a 	.word	0x0000000a
3000e5d4:	2064690a 	.word	0x2064690a
3000e5d8:	6425203d 	.word	0x6425203d
3000e5dc:	00000000 	.word	0x00000000
3000e5e0:	6177200a 	.word	0x6177200a
3000e5e4:	74207469 	.word	0x74207469
3000e5e8:	61657268 	.word	0x61657268
3000e5ec:	6d207364 	.word	0x6d207364
3000e5f0:	3d206d75 	.word	0x3d206d75
3000e5f4:	00642520 	.word	0x00642520
3000e5f8:	6c206f4e 	.word	0x6c206f4e
3000e5fc:	6c657665 	.word	0x6c657665
3000e600:	656d2032 	.word	0x656d2032
3000e604:	7073206d 	.word	0x7073206d
3000e608:	20656361 	.word	0x20656361
3000e60c:	20726f66 	.word	0x20726f66
3000e610:	76697270 	.word	0x76697270
3000e614:	5f657461 	.word	0x5f657461
3000e618:	61746164 	.word	0x61746164
3000e61c:	0a73253a 	.word	0x0a73253a
3000e620:	00000000 	.word	0x00000000
3000e624:	74204d52 	.word	0x74204d52
3000e628:	61657268 	.word	0x61657268
3000e62c:	73252064 	.word	0x73252064
3000e630:	72724520 	.word	0x72724520
3000e634:	6972502c 	.word	0x6972502c
3000e638:	7369206f 	.word	0x7369206f
3000e63c:	746f6e20 	.word	0x746f6e20
3000e640:	6f6e6520 	.word	0x6f6e6520
3000e644:	0a686775 	.word	0x0a686775
3000e648:	00000000 	.word	0x00000000
3000e64c:	63736944 	.word	0x63736944
3000e650:	20647261 	.word	0x20647261
3000e654:	65726874 	.word	0x65726874
3000e658:	25206461 	.word	0x25206461
3000e65c:	00000a73 	.word	0x00000a73
3000e660:	00006d72 	.word	0x00006d72
3000e664:	6c206f4e 	.word	0x6c206f4e
3000e668:	6c657665 	.word	0x6c657665
3000e66c:	656d2032 	.word	0x656d2032
3000e670:	7073206d 	.word	0x7073206d
3000e674:	20656361 	.word	0x20656361
3000e678:	20726f66 	.word	0x20726f66
3000e67c:	76697270 	.word	0x76697270
3000e680:	5f657461 	.word	0x5f657461
3000e684:	61746164 	.word	0x61746164
3000e688:	0a73253a 	.word	0x0a73253a
3000e68c:	00000000 	.word	0x00000000
3000e690:	74206f4e 	.word	0x74206f4e
3000e694:	61657268 	.word	0x61657268
3000e698:	74732064 	.word	0x74732064
3000e69c:	3a6b6361 	.word	0x3a6b6361
3000e6a0:	000a7325 	.word	0x000a7325
3000e6a4:	70206e69 	.word	0x70206e69
3000e6a8:	6f697265 	.word	0x6f697265
3000e6ac:	68742064 	.word	0x68742064
3000e6b0:	64616572 	.word	0x64616572
3000e6b4:	61656420 	.word	0x61656420
3000e6b8:	0000006c 	.word	0x0000006c
3000e6bc:	70206e69 	.word	0x70206e69
3000e6c0:	6f697265 	.word	0x6f697265
3000e6c4:	68742064 	.word	0x68742064
3000e6c8:	64616572 	.word	0x64616572
3000e6cc:	61656420 	.word	0x61656420
3000e6d0:	0000206c 	.word	0x0000206c
3000e6d4:	69726570 	.word	0x69726570
3000e6d8:	0000646f 	.word	0x0000646f
3000e6dc:	6c206f4e 	.word	0x6c206f4e
3000e6e0:	6c657665 	.word	0x6c657665
3000e6e4:	656d2032 	.word	0x656d2032
3000e6e8:	7073206d 	.word	0x7073206d
3000e6ec:	20656361 	.word	0x20656361
3000e6f0:	20726f66 	.word	0x20726f66
3000e6f4:	76697270 	.word	0x76697270
3000e6f8:	5f657461 	.word	0x5f657461
3000e6fc:	61746164 	.word	0x61746164
3000e700:	0a73253a 	.word	0x0a73253a
3000e704:	00000000 	.word	0x00000000
3000e708:	74206f4e 	.word	0x74206f4e
3000e70c:	61657268 	.word	0x61657268
3000e710:	74732064 	.word	0x74732064
3000e714:	3a6b6361 	.word	0x3a6b6361
3000e718:	000a7325 	.word	0x000a7325
3000e71c:	63696c73 	.word	0x63696c73
3000e720:	00000065 	.word	0x00000065
3000e724:	6f6c6c41 	.word	0x6f6c6c41
3000e728:	6f502063 	.word	0x6f502063
3000e72c:	20786973 	.word	0x20786973
3000e730:	65726874 	.word	0x65726874
3000e734:	66206461 	.word	0x66206461
3000e738:	0a6c6961 	.word	0x0a6c6961
3000e73c:	00000000 	.word	0x00000000
3000e740:	6d206f4e 	.word	0x6d206f4e
3000e744:	73206d65 	.word	0x73206d65
3000e748:	65636170 	.word	0x65636170
3000e74c:	726f6620 	.word	0x726f6620
3000e750:	736f7020 	.word	0x736f7020
3000e754:	70207869 	.word	0x70207869
3000e758:	61766972 	.word	0x61766972
3000e75c:	645f6574 	.word	0x645f6574
3000e760:	3a617461 	.word	0x3a617461
3000e764:	000a7325 	.word	0x000a7325
3000e768:	74206f4e 	.word	0x74206f4e
3000e76c:	61657268 	.word	0x61657268
3000e770:	74732064 	.word	0x74732064
3000e774:	3a6b6361 	.word	0x3a6b6361
3000e778:	000a7325 	.word	0x000a7325
3000e77c:	69736f70 	.word	0x69736f70
3000e780:	00000078 	.word	0x00000078
3000e784:	74666f73 	.word	0x74666f73
3000e788:	616c6564 	.word	0x616c6564
3000e78c:	00000079 	.word	0x00000079

3000e790 <small_digits>:
3000e790:	33323130 37363534 62613938 66656463     0123456789abcdef
3000e7a0:	6a696867 6e6d6c6b 7271706f 76757473     ghijklmnopqrstuv
3000e7b0:	7a797877 00000000                       wxyz....

3000e7b8 <large_digits>:
3000e7b8:	33323130 37363534 42413938 46454443     0123456789ABCDEF
3000e7c8:	4a494847 4e4d4c4b 5251504f 56555453     GHIJKLMNOPQRSTUV
3000e7d8:	5a595857 00000000 4c554e3c 00003e4c     WXYZ....<NULL>..
3000e7e8:	736e6f63 00656c6f 6c756f43 6f6e2064     console.Could no
3000e7f8:	6f662074 20646e75 27732527 6d6f6320     t found '%s' com
3000e808:	646e616d 00000a0d 20756f79 206e6163     mand....you can 
3000e818:	65707974 65682720 0d27706c 0000000a     type 'help'.....
3000e828:	6c656873 0000006c 20656854 65726874     shell...The thre
3000e838:	68206461 20657661 43206f6e 6f736e6f     ad have no Conso
3000e848:	000a656c 00000a0d 726f4361 3e3a6c61     le......aCoral:>
3000e858:	00000000 736d656d 006e6163 77656956     ....memscan.View
3000e868:	65687420 72696620 4c207473 6c657665      the first Level
3000e878:	6d654d20 2079726f 616e614d 6e656d67      Memory Managmen
3000e888:	6e492074 00006f66 736d656d 326e6163     t Info..memscan2
3000e898:	00000000 77656956 65687420 63657320     ....View the sec
3000e8a8:	65646e6f 76654c20 4d206c65 726f6d65     onde Level Memor
3000e8b8:	614d2079 6d67616e 20746e65 6f666e49     y Managment Info
3000e8c8:	00000000 20207325 000a7325 706c6568     ....%s  %s..help
3000e8d8:	00000000 77656956 6c6c6120 65685320     ....View all She
3000e8e8:	43206c6c 616d6d6f 6920646e 006f666e     ll Command info.
3000e8f8:	74697865 00000000 74697845 65685320     exit....Exit She
3000e908:	00006c6c 47475053 474f474f 0000214f     ll..SPGGOGOGO!..
3000e918:	00677073 74736145 65207265 00006767     spg.Easter egg..
3000e928:	79530909 6d657473 72685420 20646165     ..System Thread 
3000e938:	6f666e49 74616d72 0d6e6f69 0000000a     Information.....
3000e948:	2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d     ----------------
3000e958:	2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d     ----------------
3000e968:	2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d     ----------------
3000e978:	2d2d2d2d 0a0d2d2d 00000000 656d614e     ------......Name
3000e988:	79540909 09096570 736e6f43 09656c6f     ..Type..Console.
3000e998:	61745309 0a0d6574 00000000 09097325     .State......%s..
3000e9a8:	00000000 6d6d6f43 09096e6f 00000000     ....Common......
3000e9b8:	63696c53 00090965 69726550 0909646f     Slice...Period..
3000e9c8:	00000000 09094d52 00000000 69736f50     ....RM......Posi
3000e9d8:	00090978 09096425 00000000 6e6e7552     x...%d......Runn
3000e9e8:	09676e69 00000009 64616552 00090979     ing.....Ready...
3000e9f8:	616c6544 00090979 65656c53 00090970     Delay...Sleep...
3000ea08:	65657246 0909657a 00000000 6f727245     Freeze......Erro
3000ea18:	00090972 00000a0d 00007464 77656956     r.......dt..View
3000ea28:	6c6c6120 72687420 20646165 6f666e69      all thread info
3000ea38:	00000000 736e6f63 00656c6f              ....console.
