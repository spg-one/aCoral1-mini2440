
/*
*********************************************************
*   					 头文件
*********************************************************
*/
#include <hal.h>
#include "driver.h"
#include "print.h"
#include "../include/reg.h"

// PWM TIMER
#define rTCFG0  (*(volatile unsigned *)0x51000000)	//Timer 0 configuration
#define rTCFG1  (*(volatile unsigned *)0x51000004)	//Timer 1 configuration
#define rTCON   (*(volatile unsigned *)0x51000008)	//Timer control
#define rTCNTB0 (*(volatile unsigned *)0x5100000c)	//Timer count buffer 0
#define rTCMPB0 (*(volatile unsigned *)0x51000010)	//Timer compare buffer 0
#define rTCNTO0 (*(volatile unsigned *)0x51000014)	//Timer count observation 0
#define rTCNTB1 (*(volatile unsigned *)0x51000018)	//Timer count buffer 1
#define rTCMPB1 (*(volatile unsigned *)0x5100001c)	//Timer compare buffer 1
#define rTCNTO1 (*(volatile unsigned *)0x51000020)	//Timer count observation 1
#define rTCNTB2 (*(volatile unsigned *)0x51000024)	//Timer count buffer 2
#define rTCMPB2 (*(volatile unsigned *)0x51000028)	//Timer compare buffer 2
#define rTCNTO2 (*(volatile unsigned *)0x5100002c)	//Timer count observation 2
#define rTCNTB3 (*(volatile unsigned *)0x51000030)	//Timer count buffer 3
#define rTCMPB3 (*(volatile unsigned *)0x51000034)	//Timer compare buffer 3
#define rTCNTO3 (*(volatile unsigned *)0x51000038)	//Timer count observation 3
#define rTCNTB4 (*(volatile unsigned *)0x5100003c)	//Timer count buffer 4
#define rTCNTO4 (*(volatile unsigned *)0x51000040)	//Timer count observation 4




#define INICLK	300000		//初始频率
#define SDCLK	24000000	//PCLK=49.392MHz
#define MMCCLK	15000000	//PCLK=49.392MHz

#define MAX_DATABUSY_TIMEOUT			0x007FFFFF

#define WORDS_PER_BLOCK					128
#define MAX_RWBUFFER_BLOCKNUM			16


#define POL	0
#define INT	1
#define DMA	2


#define Wide	ENUM_SD_BUS_4_BIT	// 总线位数


typedef enum _enum_sd_bus_width
{
	ENUM_SD_BUS_1_BIT = 0,
	ENUM_SD_BUS_4_BIT = 1
}enum_sd_bus_width;

typedef enum _enum_card_type
{
	ENUM_CARD_TYPE_MMC = 0,
	ENUM_CARD_TYPE_SD  = 1
}enum_card_type;

typedef enum _enum_card_capacity_status
{
	ENUM_High_Capacity 		= 0,
	ENUM_Standard_Capacity  = 1
}enum_card_capacity_status;

typedef struct _sd_control_desc
{
	enum_sd_bus_width Wide;
	int 	reserved[4];
}sd_control_desc;

typedef struct _card_desc
{
	enum_card_type				Card_Type;
	enum_card_capacity_status	Card_Capacity_Stat;
	int  						Maker_ID;
	char 						Product_Name[8];
	int  						Serial_Num;
	int							Manufacturing_Date[2];
	int							RCA;
	int							Device_Size;
	int							Reserved[3];
}card_desc;

//--- Function prototypes
acoral_u32 Check_Card_In(void);		// SD卡插入检测
acoral_32 SD_card_init(card_desc *CardInfo);	//初始化
int SD_Get_CardStat(int iRCA);//CMD13	// 获取卡当前状态
acoral_u32 SD_Rd_Block(card_desc *CardInfo, acoral_u32 mode, acoral_u32 addr, acoral_u32* Rx_buffer, acoral_u32 blocknum);
acoral_u32 SD_Wt_Block(card_desc *CardInfo, acoral_u32 mode, acoral_u32 addr, acoral_u32* Tx_buffer, acoral_u32 blocknum);
static void SD_Set_IOPort(void);
static int CMD8(void);//SEND_IF_COND
static int CMD2(void);//SEND_IF_COND;
static int CMD3(void);
static int Chk_MMC_OCR(void);
static void CMD0(void);
static int Chk_SD_OCR(void);	//ACMD41
static int CMD9(int iRCA);	//SEND_CSD
static int SetBus(int iRCA,enum_sd_bus_width iWide);
static int Set_1bit_bus(int iRCA);



card_desc CardInf;




/*
*********************************************************
*   					 变量
*********************************************************
*/

volatile acoral_u32 			SD_CardIn = 0;		//SD卡插入中断标志
volatile acoral_u32			TR_end =0;		//数据传输完成标志

/*
*********************************************************
*   					 函数
*********************************************************
*/

acoral_u32 SDI_Init(void) {
    rGPEUP  = 0xf83f;     // SDCMD, SDDAT[3:0] => PU En.
    rGPECON = 0xaaaaaaaa;	//SDCMD, SDDAT[3:0]
    return SD_card_init(&CardInf);
}


void Delay(int time) {
	acoral_u32 val = (PCLK>>3)/1000-1;

	rTCFG0 &= ~(0xff<<8);
	rTCFG0 |= 3<<8;			//prescaler = 3+1
	rTCFG1 &= ~(0xf<<12);
	rTCFG1 |= 0<<12;		//mux = 1/2

	rTCNTB3 = val;
	rTCMPB3 = val>>1;		// 50%
	rTCON &= ~(0xf<<16);
	rTCON |= 0xb<<16;		//interval, inv-off, update TCNTB3&TCMPB3, start timer 3
	rTCON &= ~(2<<16);		//clear manual update bit
	while(time--) {
		while(rTCNTO3>=val>>1);
		while(rTCNTO3<val>>1);
	};
}

acoral_32 SD_card_init(card_desc *CardInfo) {
		//-- SD controller & card initialize

		int i;
		card_desc *pCardInfo = CardInfo;
		pCardInfo->RCA = 0;

		/* Important notice for MMC test condition */
		/* Cmd & Data lines must be enabled by pull up resister */

		SD_Set_IOPort();

		rSDIPRE = PCLK/(INICLK) - 1;	// 400KHz
		acoral_print("Initial Frequency is %dKHz\n",(PCLK/(rSDIPRE+1))/1000 );

		rSDICON = (1<<4)|1; 			// Type B, clk enable
		rSDIFSTA = rSDIFSTA|(1<<16);	// YH 040223 FIFO reset
		rSDIBSIZE = 0x200;				// 512byte(128word)
		rSDIDTIMER = MAX_DATABUSY_TIMEOUT;			// Set timeout count

		for(i = 0; i < 0x1000; i++);	// Wait 74 SDCLK for MMC card

		CMD0();
		//acoral_print("Card is in idle\n");

		//-- Check MMC card OCR
		if (Chk_MMC_OCR() == ENUM_CARD_TYPE_MMC)	//ACMD1
		{
			acoral_print("MMC check end!!\nIn MMC ready\n");
			pCardInfo->Card_Type = ENUM_CARD_TYPE_MMC;
			goto RECMD2;
		}
		else
		{
			pCardInfo->Card_Type = ENUM_CARD_TYPE_SD;
		}

		//-- Check SD card OCR

		if (!CMD8())
		{
			return 0;
		}

		i = Chk_SD_OCR();	//ACMD41
		if (i == 1)
		{
			//acoral_print("----SD Card is Ready----\n");
			pCardInfo->Card_Capacity_Stat = ENUM_High_Capacity;
		}
		else if (i == 2)
		{
			pCardInfo->Card_Capacity_Stat = ENUM_Standard_Capacity;
		}
		else
		{
			return 0;
		}


	RECMD2:
		//-- Check attached cards, it makes card identification state
		if(CMD2())			//Get_CID
		{
			pCardInfo->Maker_ID = ((rSDIRSP0 & 0xff000000) >> 24);
			pCardInfo->Product_Name[0] = (rSDIRSP0&0xff0000)>>16;
			pCardInfo->Product_Name[1] = (rSDIRSP0&0xff00)>>8;
			pCardInfo->Product_Name[2] = rSDIRSP0&0xff;
			pCardInfo->Product_Name[3] = (rSDIRSP1 & 0xff000000) >> 24;
			pCardInfo->Product_Name[4] = (rSDIRSP1&0xff0000)>>16;
			pCardInfo->Product_Name[5] = (rSDIRSP1&0xff00)>>8;
			pCardInfo->Product_Name[6] = rSDIRSP1&0xff;
			pCardInfo->Product_Name[7] = 0;
			pCardInfo->Serial_Num = ((rSDIRSP2 & 0xffffff) << 8) | ((rSDIRSP3 & 0xff000000) >> 24);
			pCardInfo->Manufacturing_Date[0] = 2000+((rSDIRSP3&0xff000)>>12);
			pCardInfo->Manufacturing_Date[1] = (rSDIRSP3&0xf00)>>8;
		}
		else
		{
			return 0;
		}

		if(CMD3() != 0) 	// Get_RCA
		{
			if(pCardInfo->Card_Type == ENUM_CARD_TYPE_MMC)
			{
				pCardInfo->RCA = 1;

				rSDIPRE=(PCLK/MMCCLK)-1;	// YH 0812, Normal clock=20MHz
				acoral_print("MMC Frequency is %dHz\n",(PCLK/(rSDIPRE+1)));
			}
			else
			{
				pCardInfo->RCA = ( rSDIRSP0 & 0xffff0000 )>>16;
				acoral_print("RCA = 0x%x\n",pCardInfo->RCA);

				rSDIPRE = (PCLK/SDCLK) - 1; 	// Normal clock=25MHz
				acoral_print("Now SD Frequency is %dMHz\n",(PCLK/(rSDIPRE+1))/1000000);
			}

		}
		else
		{
			return 0;
		}

		//CMD13();			// Get card status

		Card_Select(pCardInfo->RCA);	// 选中当前卡

		//--设置总线位数
		if(pCardInfo->Card_Type == ENUM_CARD_TYPE_SD)
		{
			SetBus(pCardInfo->RCA, Wide);
		}
		else
		{
			Set_1bit_bus(pCardInfo->RCA);
		}


		if(!CMD9(CardInf.RCA))			// Get CSD
		{
			acoral_print("Get CSD Failed!!!\n");
		}


		return 1;

}



acoral_u32 Check_Card_In(void)
{
	int CardIn;
	acoral_u32	save_rGPGCON = rGPGCON;

	rGPGCON = (rGPGCON & 0xfffcffff); 				// CDSD,GPG8 =>In
	Delay(50);

	if(rGPGDAT & (1<<8))
	{
		CardIn = 0;
	}
	else
	{
		CardIn = 1;
	}

	rGPGCON = save_rGPGCON;

	return CardIn;
}

void SD_Set_IOPort(void)
{
	rGPECON = ((rGPECON & 0xffb003ff) | 0xffeaabff);	// SDCLK, SDCMD, SDDAT[3:0]
    rGPEUP  = (rGPEUP & 0xf83f);     					// SDCMD, SDDAT[3:0] => PU En.
}


static int Chk_CMDend(int cmd, int be_resp)
{
    int finish0;

    if(!be_resp)    // No response
    {
    	finish0 = rSDICSTA;
		while((finish0 & 0x800) != 0x800)	// Check cmd end
		{
	    	finish0 = rSDICSTA;
	    }

		rSDICSTA = finish0;// Clear cmd end state

		return 1;
    }
    else	// With response
    {
    	finish0 = rSDICSTA;
		while( !( ((finish0&0x200)==0x200) | ((finish0&0x400)==0x400) ))    // Check time/rsp end
	//	while( !( ((finish0&0x200)==0x200) | ((finish0&0x400)==0x800) ))	// Check cmd/rsp end
		{
			finish0 = rSDICSTA;
		}
		//acoral_print("CMD%d:rSDICSTA=0x%x\n", cmd, rSDICSTA);	//YH 0811

		if((cmd==1) | (cmd==41))	// CRC no check, CMD9 is a long Resp. command.

		{
		    if( (finish0 & 0xf00) != 0xa00 )  // Check error
		    {
				//acoral_print("Error:  CMD%d:rSDICSTA=0x%x, rSDIRSP0=0x%x\n",cmd, rSDICSTA, rSDIRSP0);
				rSDICSTA=finish0;   // Clear error state

				if(((finish0&0x800) == 0x800))
				{
			    	return 1;	// CMD end
			    }
				if(((finish0&0x400) == 0x400))
				{
			    	return 0;	// Timeout error
			    }
	    	 }

		    rSDICSTA = finish0;	// Clear cmd & rsp end state
		}
		else	// CRC check
		{

		    if( (finish0&0x1f00) != 0xa00 )	// Check error
		    {
				//acoral_print("Error:  CMD%d:rSDICSTA=0x%x, rSDIRSP0=0x%x\n",cmd, rSDICSTA, rSDIRSP0);
				rSDICSTA = finish0;   	// Clear error state

				if((finish0 & 0x400) == 0x400)
				{
			    	return 0;			// Timeout error
			    }
	    	}
	    	//acoral_print("ok:  CMD%d:rSDICSTA=0x%x, rSDIRSP0=0x%x\n",cmd, rSDICSTA, rSDIRSP0);
		    rSDICSTA = finish0;
		}

		return 1;
    }
}

static void CMD0(void)
{
    //-- Make card idle state
    rSDICARG = 0x0;	    		// CMD0(stuff bit)
    rSDICCON = (1<<8) | 0x40;   // No_resp, start, CMD0

    //-- Check end of CMD0
    Chk_CMDend(0, 0);
    rSDICSTA = 0x800;	    	// Clear cmd_end(no rsp)
}

static int CMD8(void)//SEND_IF_COND
{
    int i = 0;
    for (i = 0; i < 50; i++)			//CMD8
    {
    	rSDICARG = 0x1AA;						//CMD8(SD VHS:2.7V~3.6V)
    	rSDICCON = (0x1<<9) | (0x1<<8) | 0x48;	//sht_resp, wait_resp, start, CMD8

    	if ( Chk_CMDend(8, 1) & (rSDIRSP0 == 0x1aa) )
    	{
    		rSDICSTA = 0xa00;		// Clear cmd_end(with rsp)
			return 1;
		}
		Delay(200); 			// Wait Card power up status
	}
	return 0;
}

static int CMD2(void)// ALL_SEND_CID
{
	int  Serial_Num;	//SD卡ID

	rSDICARG = 0x0;   		// CMD2(stuff bit)
    rSDICCON = (0x1<<10) | (0x1<<9) | (0x1<<8) | 0x42; //lng_resp, wait_resp, start, CMD2

    //-- Check end of CMD2
    if(!Chk_CMDend(2, 1))
    {
		return 0;			// Fail
	}
    rSDICSTA = 0xa00;		// Clear cmd_end(with rsp)

	Serial_Num = ((rSDIRSP2&0xffffff) << 8) | ((rSDIRSP3&0xff000000) >> 24);
    acoral_print("Card Id  = 0x%x\n",Serial_Num);
    //acoral_print("Capacity = %c%c%c\n",(rSDIRSP1&0xff0000)>>16,(rSDIRSP1&0xff00)>>8,rSDIRSP1&0xff);
    acoral_print("The manufacturing date is %d.%d\n",2000+((rSDIRSP3&0xff000)>>12) ,(rSDIRSP3&0xf00)>>8);

	return Serial_Num;		// Success
}

static int CMD3(void)		// SEND_RCA
{
    rSDICARG = 0x0;	    				// CMD3(MMC:Set RCA, SD:Ask RCA-->SBZ)
    rSDICCON = (0x1<<9)|(0x1<<8)|0x43;	// sht_resp, wait_resp, start, CMD3

    //-- Check end of CMD3
    if(!Chk_CMDend(3, 1))
    {
		return 0;
	}
    rSDICSTA = 0xa00;						// Clear cmd_end(with rsp)

    return 1;
}

static int Chk_MMC_OCR(void)
{
    int i;
    Delay(1000);
    //-- Negotiate operating condition for MMC, it makes card ready state
    for(i = 0; i < 50; i++)	//Negotiation time is dependent on CARD Vendors.
    {
		//rSDICARG=0xffc000;	    	    //CMD1(MMC OCR:2.6V~3.6V)
		rSDICARG = 0xff8000;	    	    	//CMD1(SD OCR:2.7V~3.6V)
    	rSDICCON = (0x1<<9)|(0x1<<8)|0x41;    	//sht_resp, wait_resp, start, CMD1

    	//-- Check end of CMD1
		if(Chk_CMDend(1, 1) && (rSDIRSP0>>16)==0x80ff) //YH 0903 [31]:Card Power up status bit (busy)
		//if(Chk_CMDend(1, 1) & rSDIRSP0==0x80ff8000)
		{
		    rSDICSTA = 0xa00;	// Clear cmd_end(with rsp)
		    return 0;			// Success,MMC
		}
    }
    rSDICSTA = 0xf00;	// Clear cmd_end(with rsp)
    return 1;			// Fail,SD
}

static int CMD55(int iRCA)
{
    //--Make ACMD
    rSDICARG = iRCA<<16;					//CMD7(RCA,stuff bit)
    rSDICCON = (0x1<<9) | (0x1<<8) | 0x77;	//sht_resp, wait_resp, start, CMD55

    //-- Check end of CMD55
    if(!Chk_CMDend(55, 1))
    {
		return 0;
	}

    rSDICSTA = 0xa00;	// Clear cmd_end(with rsp)
    return 1;
}

static int Chk_SD_OCR(void)	//ACMD41
{
    int i;

    //-- Negotiate operating condition for SD, it makes card ready state
    Delay(1000);
    for(i=0;i<50;i++)			//If this time is short, init. can be fail.
    {
		//-- 检测是否为SDHC
    	CMD55(0);    			// Make ACMD
    	rSDICARG = 0xc0ff8000;	//ACMD41(SD OCR:2.7V~3.6V,HCS=1)
		//rSDICARG=0xffc000;	//ACMD41(MMC OCR:2.6V~3.6V)
    	rSDICCON = (0x1<<9)|(0x1<<8)|0x69;//sht_resp, wait_resp, start, ACMD41

		//-- Check end of ACMD41
    	if( Chk_CMDend(41, 1) && (rSDIRSP0==0xc0ff8000) )
		{
			acoral_print("SDHC Card...\n");
		    rSDICSTA = 0xa00;		// Clear cmd_end(with rsp)
		    return 1;			// Success
		}

		//-- 检测是否为SD1.0
		CMD55(0);    			// Make ACMD
    	rSDICARG = 0x80ff8000;	//ACMD41(SD OCR:2.7V~3.6V,HCS=0)
    	rSDICCON = (0x1<<9) | (0x1<<8) | 0x69;//sht_resp, wait_resp, start, ACMD41

		//-- Check end of ACMD41
    	if( Chk_CMDend(41, 1) && (rSDIRSP0==0x80ff8000) )
		{
			acoral_print("SD1.0 Card...\n",rSDIRSP0);
		    rSDICSTA = 0xa00;		// Clear cmd_end(with rsp)
		    return 2;			// Success
		}

		Delay(200); 			// Wait Card power up status

    }

    acoral_print("Error: ACMD41 SDIRSP0=0x%x\n",rSDIRSP0);
    rSDICSTA = 0xa00;	// Clear cmd_end(with rsp)
    return 0;		// Fail
}

int Card_Select( int iRCA)
{
    //-- Card select
    int i = 0;
	do
	{
		rSDICARG = iRCA<<16;					// CMD7(RCA,stuff bit)
		rSDICCON = (0x1<<9) | (0x1<<8) | 0x47;  // sht_resp, wait_resp, start, CMD7
		i++;
	}
	//-- Check end of CMD7
	while(!Chk_CMDend(7, 1) && (i < 100));

	rSDICSTA = 0xa00;			// Clear cmd_end(with rsp)

	if (i == 100)
	{
		return 0;
	}

	//--State(transfer) check
	if( (rSDIRSP0 & 0x1e00) != 0x800 )
	{
	    return 0;
	}
	return 1;
}

int Card_Deselect( void)
{
	//-- Card deselect
	int i = 0;
	do
	{
		rSDICARG = 0<<16;			//CMD7(RCA,stuff bit)
		rSDICCON = (0x1<<8)|0x47;	//no_resp, start, CMD7
		i++;
	}
	//-- Check end of CMD7
	while(!Chk_CMDend(7, 0) && (i < 100));

	rSDICSTA = 0x800;			// Clear cmd_end(no rsp)
	if (i == 100)
	{
		return 0;
	}

	return 1;
}

static int CMD9(int iRCA)	//SEND_CSD
{
    Card_Deselect();	// Card deselect

    rSDICARG = iRCA<<16;								// CMD9(RCA,stuff bit)
    rSDICCON = (0x1<<10)|(0x1<<9)|(0x1<<8)|0x49;	// long_resp, wait_resp, start, CMD9

    //-- Check end of CMD9
    if (!Chk_CMDend(9, 1))
    {
		return 0;
	}
	if ((rSDIRSP0&0xf0000000)>>28 == 4)				//CSD Version 2.0
	{
		acoral_print("Memory Capacity= %dMB\n",( (rSDIRSP2&0xffff0000)>>16 )>>1 );
	}
	else if ((rSDIRSP0&0xf0000000)>>28 == 0)		//CSD Version 1.0
	{
		acoral_print("Memory Capacity= %dMB\n",(((rSDIRSP1&0x3ff)<<2) | (rSDIRSP2&0xc0000000))>>1);
	}

	//acoral_print("CSD register :\n");
    //acoral_print("SDIRSP0=0x%x\nSDIRSP1=0x%x\nSDIRSP2=0x%x\nSDIRSP3=0x%x\n", rSDIRSP0,rSDIRSP1,rSDIRSP2,rSDIRSP3);

    Card_Select(iRCA);	// Card select

    return 1;
}

static int SetBus(int iRCA,enum_sd_bus_width iWide)
{
	int i = 0;
	do
	{
	    CMD55(iRCA);	// Make ACMD
	    //-- CMD6 implement
	    rSDICARG = iWide << 1;	    			//Wide 0: 1bit, 1: 4bit
	    rSDICCON = (0x1 << 9) | (0x1 << 8) | 0x46;	//sht_resp, wait_resp, start, CMD46
	    i++;
	}
    while((i < 50) && (!Chk_CMDend(6, 1)));   	// ACMD6

    rSDICSTA = 0xa00;	    // Clear cmd_end(with rsp)

    if (i < 50)
    {
    	if (iWide)
    	{
	    	acoral_print("**** 4bit bus ****\n");
	    }
    	else
    	{
    		acoral_print("**** 1bit bus ****\n");
    	}
	    return	1;
    }
    else
    {
    	return 0;
    }
}

static int Set_1bit_bus(int iRCA)
{
   	int i = 0;
	do
	{
	    CMD55(iRCA);	// Make ACMD
	    //-- CMD6 implement
	    rSDICARG = 0 << 1;	    				//Wide 0: 1bit, 1: 4bit
	    rSDICCON = (0x1<<9) | (0x1<<8) | 0x46;	//sht_resp, wait_resp, start, CMD46
	    i++;
	}
    while((i<50) && (!Chk_CMDend(6, 1)));   	// ACMD6

    rSDICSTA = 0xa00;	    // Clear cmd_end(with rsp)

    if (i < 50)
    {
	    acoral_print("****1bit bus****\n");
	    return	1;
    }
    else
    {
    	return 0;
    }
}



static int Chk_DATend(void)
{
    int i=0,finish;

    finish = rSDIDSTA;

    while( !( ((finish&0x10) == 0x10) | ((finish&0x20) ==0x20) | (i>500) ))		// Chek timeout or data end
	{
		finish = rSDIDSTA;
		i++;
	}
	if( ((finish&0x2) == 0x2) || ((finish&0x1) == 0x1) )
		{
			Delay(200);
		}
    if( (finish&0xf0) != 0x10 )				//wangq,reserved 位也可能为1!!
    {
        //acoral_print("DATA Error:SDIDatSta=0x%x\n", finish);
        //rSDIDSTA=0xec;  // Clear error state
        rSDIDSTA = 0xf8;  // Clear error state,wangq
        return 0;
    }
    return 1;
}

static int Chk_BUSYend(void)
{
    int finish;

    finish = rSDIDSTA;
    while( !( ((finish&0x08)==0x08) | ((finish&0x20)==0x20) ))
    {
		finish = rSDIDSTA;
	}

    if( (finish&0xf8) != 0x08 )
    {
       // acoral_print("DATA Error:SDIDSTA=0x%x\n", finish);
        //rSDIDSTA=0xf4;  //clear error state
        rSDIDSTA = 0xf8;  //clear error state,wangq
        return 0;
    }
    return 1;
}




acoral_u32 SD_Rd_Block(card_desc *CardInfo, acoral_u32 mode, acoral_u32 addr, acoral_u32* Rx_buffer, acoral_u32 blocknum)
{
    int status;
    int i = 0;
    int rd_cnt = 0;
	const acoral_u32	cc = 1;
	//-----  Reset the FIFO -----
	rSDIFSTA = rSDIFSTA|(1<<16);	// FIFO reset

    if(mode!=2)
		rSDIDCON=(2<<22)|(1<<19)|(1<<17)|(Wide<<16)|(1<<14)|(2<<12)|(blocknum<<0);	//YH 040220
		//Word Rx, Rx after cmd, blk, 4bit bus, Rx start, blk num, data start, data transmit mode

    rSDICARG = addr;				// CMD17/18(addr)读地址

    switch(mode)
    {
	case POL:
	    if(blocknum<2)	// SINGLE_READ
	    {
			do
			{
				rSDICCON=(0x1<<9)|(0x1<<8)|0x51;	// sht_resp, wait_resp, dat, start, CMD17
				i++;
			}
			while(!Chk_CMDend(17, 1) && (i<50));	//-- Check end of CMD17
			if(i == 50)
			{
				acoral_print("CMD18 Failed\n");
				return 0;
		    }
	    }
	    else		// MULTI_READ
	    {
			do
			{
				rSDICCON=(0x1<<9)|(0x1<<8)|0x52;    // sht_resp, wait_resp, dat, start, CMD18
				i++;
			}
			while(!Chk_CMDend(18, 1) && (i<50));	//-- Check end of CMD18
			if(i == 50)
			{
				acoral_print("CMD18 Failed\n");
				return 0;
		    }
	    }

	    rSDICSTA = 0xa00;	// Clear cmd_end(with rsp)

	    while(rd_cnt < (128*blocknum))	// 512*block bytes
	    {
	    	//acoral_print("***rd_cnt:%d dat:%d\n",rd_cnt,rSDIDAT);
			if ((rSDIDSTA & 0x20) == 0x20) 			// Check timeout
			{
			    //rSDIDSTA=(0x1<<0x5);  			// Clear timeout flag
			    rSDIDSTA = (0x1<<5);  			// Clear timeout flag,wangq

			    acoral_print("Read Error,timeout!!!\n");
			    break;
			}
			status = rSDIFSTA;
			if((status&0x1000) == 0x1000)			// Is Rx data?
			{
				//acoral_print("Number of data(byte) in FIFO:%d \n",status&0x7f);
				//for(i=0; i < (status&0x7f); i++)
				{
				    *(Rx_buffer+rd_cnt) = rSDIDAT;
				    //acoral_print("rd_cnt:%d dat:%d\n", rd_cnt, *(Rx_buffer+rd_cnt));
				    rd_cnt++;
			    }
			}

	    }
	    break;

	case INT:
		return 0;

	case DMA:
	    break;

	default:
	    break;
    }

    //-- Check end of DATA
    for (i = 0; i < 50; i++)
    {
	    if(Chk_DATend())
		{
			break;
		}
	    else
	    {
			acoral_print("Read Dat Error!!\n");
			return 0;
		}
	}

	rSDIDCON = rSDIDCON&~(7<<12);		//YH 040220, Clear Data Transfer mode => no operation, Cleata Data Transfer start
	rSDIFSTA = rSDIFSTA&0x200;		//Clear Rx FIFO Last data Ready, YH 040221
    rSDIDSTA = 0x10;					// Clear data Tx/Rx end detect

    if(blocknum > 1)
    {
    	i = 0;
		do
		{
			//--Stop cmd(CMD12)
			rSDICARG = 0x0;	    			//CMD12(stuff bit)
			rSDICCON = (0x1<<9)|(0x1<<8)|0x4c;//sht_resp, wait_resp, start, CMD12
			i++;
		}
		//-- Check end of CMD12
		while(!Chk_CMDend(12, 1) && (i < 100));

		rSDICSTA = 0xa00;	// Clear cmd_end(with rsp)
    }
    //CMD13();

    return 1;
}

acoral_u32 SD_Wt_Block(card_desc *CardInfo, acoral_u32 mode, acoral_u32 addr, acoral_u32* Tx_buffer, acoral_u32 blocknum)
{
    int status;
    int i = 0;
    int wt_cnt = 0;
	//const acoral_u32 cc = 1;

	rSDIFSTA = rSDIFSTA | (1<<16);		//YH 040223 FIFO reset

    if (mode != 2)
    {
		//rSDIDCON=(2<<22)|(1<<20)|(1<<17)|(Wide<<16)|(3<<12)|(block<<0);
		rSDIDCON=(2<<22)|(1<<20)|(1<<17)|(Wide<<16)|(1<<14)|(3<<12)|(blocknum<<0);	//YH 040220

		    //Word Tx, Tx after rsp, blk, 4bit bus, Tx start,Data transmit mode, blk num
	}

    rSDICARG = addr;	    			// CMD24/25(addr)写入地址

    switch(mode)
    {
	case POL:
	    if(blocknum < 2)	// SINGLE_WRITE
	    {
			do
			{
				rSDICCON = (0x1<<9)|(0x1<<8)|0x58;	//sht_resp, wait_resp, dat, start, CMD24
				i++;
			}
			while(!Chk_CMDend(24, 1) && (i < 50));				//-- Check end of CMD24

	    }
	    else				// MULTI_WRITE
	    {
	    	do
			{
				rSDICCON=(0x1<<9)|(0x1<<8)|0x59;	//sht_resp, wait_resp, dat, start, CMD25
				i++;
			}
			while(!Chk_CMDend(25, 1) && (i < 50));				//-- Check end of CMD25

	    }

	    rSDICSTA = 0xa00;							// Clear cmd_end(with rsp)

	    i = 0;
	    while(wt_cnt < 128*blocknum)
	    {
			status = rSDIFSTA;
			if((status&0x2000) == 0x2000)
			{
			    rSDIDAT = *(Tx_buffer + i);
			    i++;
			    wt_cnt++;
				//acoral_print("Dat=%d, wt_cnt=%d\n",*(Tx_buffer+i),wt_cnt);
			}
	    }

	    break;

	case INT:
		return 0;


	case DMA:


	    break;

	default:
	    break;
    }

    //-- Check end of DATA
    for (i = 0; i < 50; i++)
    {
	    if(Chk_DATend())
		{
			break;
		}

	}
	if (i == 50)
	{
		acoral_print("Write Dat Error!!\n");
		return 0;
	}

	rSDIDCON = rSDIDCON & ~(7<<12);			//YH 040220, Clear Data Transfer mode => no operation, Cleata Data Transfer start
    rSDIDSTA = 0x10;						// Clear data Tx/Rx end

    if((blocknum > 1) )
    {
		//--Stop cmd(CMD12)
		i = 0;
		do
		{
			rSDIDCON=(1<<18)|(1<<17)|(Wide<<16)|(1<<14)|(1<<12)|(blocknum<<0); 	//YH  040220


			rSDICARG = 0x0;	    				//CMD12(stuff bit)
			rSDICCON=(0x1<<9)|(0x1<<8)|0x4c;    //sht_resp, wait_resp, start, CMD12
		}
		//-- Check end of CMD12
		while(!Chk_CMDend(12, 1) && (i < 50));

		rSDICSTA = 0xa00;						// Clear cmd_end(with rsp)

		//-- Check end of DATA(with busy state)
		if(!Chk_BUSYend())
		{
		    acoral_print("Chk_BUSYend Error!!\n");
		    return 0;
		}

		rSDIDSTA = 0x08;						//! Should be cleared by writing '1'.
    }
    return 1;

    //CMD13();
}



int SD_Get_CardStat(int iRCA)//CMD13
{
    int response0;
	unsigned int cc = 1;
    rSDICARG = iRCA<<16;					// CMD13(RCA,stuff bit)
    rSDICCON = (0x1<<9) | (0x1<<8) | 0x4d;	// sht_resp, wait_resp, start, CMD13

    //-- Check end of CMD13
    if(!Chk_CMDend(13, 1))
    {
		return -1;
	}
    //acoral_print("rSDIRSP0=0x%x\n", rSDIRSP0);

    if (rSDIRSP0 & (cc << 31))
    {
		acoral_print("Error: OUT_OF_RANGE!\n");
	}
	else if (rSDIRSP0 & (cc << 30))
    {
		acoral_print("Error: ADDRESS_ERROR!\n");
	}
	else if (rSDIRSP0 & (cc << 29))
    {
		acoral_print("Error: BLOCK_LEN_ERROR!\n");
	}
	else if (rSDIRSP0 & (cc << 28))
    {
		acoral_print("Error: ERASE_SEQUENCE_ERROR!\n");
	}
	else if (rSDIRSP0 & (cc << 27))
    {
		acoral_print("Error: ERASE_INVALID_BLOCKS_ERROR!\n");
	}
	else if (rSDIRSP0 & (cc << 26))
    {
		acoral_print("Error: WP_VIOLATION_ERROR!\n");
	}
	else if (rSDIRSP0 & (cc << 25))
    {
		acoral_print("CARD_IS_LOCKED!\n");
	}
	else if (rSDIRSP0 & (cc << 24))
    {
		acoral_print("Error: LOCK_UNLOCK_FAILED!\n");
	}
	else if (rSDIRSP0 & (cc << 23))
    {
		acoral_print("Error: COM_CRC_ERROR!\n");
	}
	else if (rSDIRSP0 & (cc << 22))
    {
		acoral_print("Error: ILLEGAL_COMMAND!\n");
	}

    if(rSDIRSP0 & 0x100)
    {
		acoral_print("Ready for Data,");
	}

    response0 = rSDIRSP0;
    response0 &= 0x1e00;	//wangq
    response0 = (response0 >> 9);
    switch (response0)
    {
    	case 0:
    		acoral_print("Current Status = 'Idle'\n");
    		break;
    	case 1:
    		acoral_print("Current Status = 'Ready'\n");
    		break;
    	case 2:
    		acoral_print("Current Status = 'Ident'\n");
    		break;
    	case 3:
    		acoral_print("Current Status = 'stby:Stand-by'\n");
    		break;
    	case 4:
    		acoral_print("Current Status = 'tran:Transfer'\n");
    		break;
    	case 5:
    		acoral_print("Current Status = 'data:Sending data'\n");
    		break;
    	case 6:
    		acoral_print("Current Status = 'rcv:Receive data'\n");
    		break;
    	case 7:
    		acoral_print("Current Status = 'prg:Programming'\n");
    		break;
    	case 8:
    		acoral_print("Current Status = 'dis:Disconnect'\n");
    		break;
    	default:
    		acoral_print("Current Status = 'Reserved'\n");
    		break;

    }

    rSDICSTA = 0xa00;	// Clear cmd_end(with rsp)

    return response0;
}


acoral_dev_ops_t sd_ops;
acoral_32 sd_open(){
	return !SDI_Init();
}

#define SDCard_BlockSize	9

acoral_u8 Write_One_Block(acoral_u32 Addr,acoral_u32* TxBuffer)
{
	acoral_u16 i = 0;
	acoral_u32 status = 0;
	acoral_u16 BlockSize;                             //瀹氫箟鍧楀ぇ灏?
	acoral_u16 BlockNumber;

	    BlockSize = 1<< SDCard_BlockSize;         //浠yte涓哄崟浣?
	    BlockNumber = ((Addr >>  SDCard_BlockSize) +1) &0x0fff;

	    rSDIDTIMER=0x7fffff;                    // Set timeout count
	    rSDIBSIZE=0x200;                        // 512 byte(128 word)
	    rSDIFSTA = rSDIFSTA|(1<<16);             // FIFO reset
	    rSDIDCON = BlockNumber|(3<<12)|(1<<14)|(1<<16)|(1<<17)|(1<<20)|(0<<22);

	    rSDICARG = Addr;
	    do{
	    	rSDICCON = (0x1<<9)|(0x1<<8)|0x58;	//sht_resp, wait_resp, dat, start, CMD24
	         i++;
	     }while(!Chk_CMDend(24, 1) && (i < 50));				//-- Check end of CMD24

	    /* 寮€濮嬩紶閫掓暟鎹埌缂撳啿鍖?*/
	    while(i < BlockSize)
	    {

	        status=rSDIFSTA;
	        if((status&0x2000)==0x2000)            //濡傛灉鍙戦€丗IFO鍙敤锛屽嵆FIFO鏈弧
	        {
	            rSDIDAT = *TxBuffer;
	            TxBuffer++;
	            i++;
	        }
	    }

	    status = rSDIDSTA;
	    Delay(1);
	    rSDIDCON=rSDIDCON&~(7<<12);                //缁撴潫SDMMC妯″潡鐨勫彂閫?
	    rSDIDSTA = status;

	    /* 纭SD鍗¤繘鍏ヤ簡绌洪棽鐘舵€?-SDIO鎬荤嚎绌洪棽 */
	    rSDIDCON=(0<<18)|(1<<17)|(1<<16)|(1<<14)|(1<<12)|(BlockNumber<<0);
	    rSDIDTIMER=0x7fffff;                    // Set timeout count
	    status = rSDIDSTA;
	    while( !( ((status&0x08)==0x08) | ((status&0x20)==0x20)| ((status&0x800)==0x800) )){
	        status=rSDIDSTA;
	    }

	    if( (status&0x20) == 0x20 ){
	        rSDIDSTA = status;
	        return 0;
	    }
	    rSDIDSTA = status;
	      return 1;
}



acoral_32 sd_write_block(void *data,acoral_size size,acoral_size offset,acoral_time tm_out){
	acoral_32 ret,sdblock_num;
	acoral_u8 *write_data;
	acoral_u8 tmp[512];
	acoral_u32 i;
	sdblock_num=size/512;
	write_data=(acoral_u8 *)data;
	for(;sdblock_num>0;sdblock_num--)
	{
		for(i=0; i<512; ) {
					tmp[i+3] = write_data[i];
					tmp[i+2] = write_data[i+1];
					tmp[i+1] = write_data[i+2];
					tmp[i] = write_data[i+3];
					i += 4;
				}

		/*for(i=0;i<512;)
		{
									acoral_print("%02x ",write_data[i]);
									acoral_print("%02x ",write_data[i+1]);
									acoral_print("%02x ",write_data[i+2]);
									acoral_print("%02x ",write_data[i+3]);
									i += 4;
									if(i%16==0)
										acoral_print("\n");
								}*/
		//Delay(200); //must have a delay time.... why?
		//acoral_print("writing...please wait~\n");
		//Erase_Block(offset/512+8192, offset/512+8192);
		//SD_Wt_Block(&CardInf, POL, offset/512+8192, (acoral_u32 *)tmp, 1);
		Write_One_Block(offset/512+8192,(acoral_u32 *)tmp);
		//Wt_Block(offset,(acoral_acoral_u32 *)write_data,1);
		write_data=write_data+512;
		offset+=512;
		//Delay(1000);
	}
	return 0;
}

acoral_32 sd_read_block(void *data,acoral_size size,acoral_size offset,acoral_time tm_out){
	acoral_32 ret,sdblock_num;
	acoral_u8 *write_data;
	sdblock_num=size/512;
	write_data=(acoral_u8 *)data;
	acoral_u32 i;
		/*for(i=0;i<SDCARD_BUFF_SIZE;i++)
			{
				cRxBuffer[i] = 0x00;
			}
			//8192
			if(Read_One_Block(40960,(acoral_acoral_u32 *)cRxBuffer))
			{
				for(i=0;i<512;)
				{
					acoral_print("%02x ",cRxBuffer[i+3]);
					acoral_print("%02x ",cRxBuffer[i+2]);
					acoral_print("%02x ",cRxBuffer[i+1]);
					acoral_print("%02x ",cRxBuffer[i+0]);
					i += 4;
					if(i%16==0)
						acoral_print("\n");
				}
				acoral_print("\nRead 0 Block is OK!\n");
			}
			else
			{
				acoral_print("\nRead 0 Block is Fail!\n");
			}*/
			acoral_u8 tmp[4];
	for(;sdblock_num>0;sdblock_num--)
	{
		//Rd_Block(offset,(acoral_acoral_u32 *)write_data,1);
		//Read_One_Block(offset/512+8192,(acoral_acoral_u32 *)write_data);
		SD_Rd_Block(&CardInf, POL, offset/512+8192, (acoral_u32 *)write_data, 1);
		for(i=0; i<512; ) {
			tmp[0] = write_data[i];
			tmp[1] = write_data[i+1];
			tmp[2] = write_data[i+2];
			tmp[3] = write_data[i+3];

			write_data[i] = tmp[3];
			write_data[i+1] = tmp[2];
			write_data[i+2] = tmp[1];
			write_data[i+3] = tmp[0];

			i += 4;
		}

		/*for(i=0;i<512;)
						{
							acoral_print("%02x ",write_data[i]);
							acoral_print("%02x ",write_data[i+1]);
							acoral_print("%02x ",write_data[i+2]);
							acoral_print("%02x ",write_data[i+3]);
							i += 4;
							if(i%16==0)
								acoral_print("\n");
						}*/

		write_data=write_data+512;
		offset+=512;
	}
	return 0;
}

void sd_init(){
	sd_ops.write=sd_write_block;
	sd_ops.read=sd_read_block;
	sd_ops.open=sd_open;
	sd_ops.close=NULL;
  	acoral_drv_register(&sd_ops,"disk");
}



