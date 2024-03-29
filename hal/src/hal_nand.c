/**
 * @file hal_nand.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，nand flash初始化、读写函数定义
 * @version 1.0
 * @date 2022-06-24
 * @copyright Copyright (c) 2022
 * @revisionHistory
 *  <table>
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-06-24 <td>Standardized
 *  </table>
 */

#include "hal_2440_cfg.h"
#include <hal_nand.h>

static void nand_wait(void)
{
	int i;
	while (!(NFSTAT & NFSTAT_BUSY))
		for (i = 0; i < 10; i++)
			;
}

/**
 * @brief nandflash重置
 * 
 */
static void nand_reset()
{
	int i;
	nand_select();
	NFCMD = NAND_CMD_RESET;
	for (i = 0; i < 10; i++)
		;
	nand_wait();
	nand_deselect();
}

/**
 * @brief nandflash初始化
 * 
 */
void nand_init(void)
{

	NFCONF = (7 << 12) | (7 << 8) | (7 << 4) | (0 << 0);
	NFCONT = (1 << 4) | (0 << 1) | (1 << 0);

	nand_reset();
}

/**
 * @brief 判断block是否有数据反转
 *
 * @param nand
 * @param i
 * @return int
 */
static int is_bad_block(struct boot_nand_t *nand, unsigned long i)
{
	unsigned char data;
	unsigned long page_num;

	nand_clear_RnB();
	if (nand->page_size == 512)
	{
		NFCMD = NAND_CMD_READOOB; /* 0x50 */
		NFADDR = nand->bad_block_offset & 0xf;
		NFADDR = (i >> 9) & 0xff;
		NFADDR = (i >> 17) & 0xff;
		NFADDR = (i >> 25) & 0xff;
	}
	else if (nand->page_size == 2048)
	{
		page_num = i >> 11; /* addr / 2048 */
		NFCMD = NAND_CMD_READ0;
		NFADDR = nand->bad_block_offset & 0xff;
		NFADDR = (nand->bad_block_offset >> 8) & 0xff;
		NFADDR = page_num & 0xff;
		NFADDR = (page_num >> 8) & 0xff;
		NFADDR = (page_num >> 16) & 0xff;
		NFCMD = NAND_CMD_READSTART;
	}
	else
	{
		return -1;
	}
	nand_wait();
	data = (NFDATA & 0xff);
	if (data != 0xff)
		return 1;

	return 0;
}

/**
 * @brief 读取某一个page
 *
 * @param nand nandflash指针
 * @param buf 读取到的数据存放到buf
 * @param addr page的起始地址
 * @return int 返回读取到的大小，必定是page_size
 */
static int nand_read_page(struct boot_nand_t *nand, unsigned char *buf, unsigned long addr)
{
	unsigned short *ptr16 = (unsigned short *)buf;
	unsigned int i, page_num;

	nand_clear_RnB();

	NFCMD = NAND_CMD_READ0;

	if (nand->page_size == 512)
	{
		/* Write Address */
		NFADDR = addr & 0xff;
		NFADDR = (addr >> 9) & 0xff;
		NFADDR = (addr >> 17) & 0xff;
		NFADDR = (addr >> 25) & 0xff;
	}
	else if (nand->page_size == 2048)
	{
		page_num = addr >> 11; /* addr / 2048 */
		/* Write Address */
		NFADDR = 0;
		NFADDR = 0;
		NFADDR = page_num & 0xff;
		NFADDR = (page_num >> 8) & 0xff;
		NFADDR = (page_num >> 16) & 0xff;
		NFCMD = NAND_CMD_READSTART;
	}
	else
	{
		return -1;
	}
	nand_wait();
	for (i = 0; i < (nand->page_size >> 1); i++)
	{
		*ptr16 = NFDATA16;
		ptr16++;
	}

	return nand->page_size;
}

/**
 * @brief 读取nandflash的型号
 *
 * @return unsigned short 读取到的型号id
 */
static unsigned short nand_read_id()
{
	unsigned short res = 0;
	NFCMD = NAND_CMD_READID;
	NFADDR = 0;
	res = NFDATA;
	res = (res << 8) | NFDATA;
	return res;
}

/**
 * @brief 读取nandflash中某一块数据，大小对page向上取整。只适用于特定型号的nandflash
 *
 * @param buf 读取到的数据存放在buf中
 * @param start_addr 要读取的区域的起始地址
 * @param size 要读取的大小
 * @return int 返回0表示读取成功，其余失败
 */
int nand_read(unsigned char *buf, unsigned long start_addr, int size)
{

	int i, j;
	unsigned short nand_id;
	struct boot_nand_t nand;

	nand_select();
	nand_clear_RnB();

	for (i = 0; i < 10; i++)
		;

	nand_id = nand_read_id(); //读取型号

	if (nand_id == 0xec76 || /* Samsung K91208 */
		nand_id == 0xad76)
	{ /*Hynix HY27US08121A*/
		nand.page_size = 512;
		nand.block_size = 16 * 1024;
		nand.bad_block_offset = 5;
	}
	else if (nand_id == 0xecf1 || /* Samsung K9F1G08U0B */
			 nand_id == 0xecda || /* Samsung K9F2G08U0B */
			 nand_id == 0xecd3)
	{ /* Samsung K9K8G08 */
		nand.page_size = 2048;
		nand.block_size = 128 * 1024;
		nand.bad_block_offset = nand.page_size;
	}
	else //未知的型号
	{
		return -1;
	}

	if ((start_addr & (nand.block_size - 1))) //起始地址必须是page的倍数，因为nandflash读写的最小单位是page
		return -1;

	if (size & (nand.page_size - 1))
	{
		size = (size + nand.page_size - 1) & (~(nand.page_size - 1)); //对size向上取整，比如一个size不到就取一个size，不到两个就取2.
	}

	if ((size & (nand.page_size - 1))) //取整失败
		return -1;

	//开始读取
	for (i = start_addr; i < (start_addr + size);)
	{

		if ((i & (nand.block_size - 1)) == 0)
		{
			if (is_bad_block(&nand, i) || is_bad_block(&nand, i + nand.page_size))
			{
				i += nand.block_size;
				size += nand.block_size;
				continue;
			}
		}

		j = nand_read_page(&nand, buf, i);
		i += j;
		buf += j;
	}

	nand_deselect();

	return 0;
}
