/**
 * @file hal_nand.h
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief hal层，nandflash相关头文件
 * @version 1.0
 * @date 2022-07-08
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-08 <td>Standardized 
 *  </table>
 */
#ifndef HAL_NAND_H
#define HAL_NAND_H

struct boot_nand_t
{
	int page_size;
	int block_size;
	int bad_block_offset;
};

static void nand_wait(void);
static void nand_reset();
void nand_init(void);
static int is_bad_block(struct boot_nand_t *nand, unsigned long i);
static int nand_read_page(struct boot_nand_t *nand, unsigned char *buf, unsigned long addr);
static unsigned short nand_read_id();
int nand_read(unsigned char *buf, unsigned long start_addr, int size);

#endif