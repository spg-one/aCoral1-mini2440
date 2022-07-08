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