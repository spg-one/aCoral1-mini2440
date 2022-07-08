#ifndef HAL_MEM_H
#define HAL_MEM_H

extern acoral_u32 heap_start[];
extern acoral_u32 heap_end[];
#define HAL_HEAP_START heap_start
#define HAL_HEAP_END heap_end
#define HAL_MEM_INIT() hal_mem_init()

static void hal_mmu_init(void);
void flush_cache();
static void hal_mmu_init(void);
void hal_mmu_setmtt(acoral_32 vaddrStart, acoral_32 vaddrEnd, acoral_32 paddrStart, acoral_32 attr);

#endif