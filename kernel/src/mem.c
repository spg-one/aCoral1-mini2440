/**
 * @file mem.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层,集合了伙伴系统和资源池系统初始化的两级内存管理系统
 * @version 1.0
 * @date 2022-07-04
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-04 <td>Standardized, add acoral_res_sys_init
 *  </table>
 */

#include <autocfg.h>
#include<type.h>
#include<hal.h>
#include<mem.h>

/**
 * @brief 内存管理系统初始化
 * @note 初始化mmu;初始化两级内存管理系统，第一级为伙伴系统，第二级为资源池系统
 */
void acoral_mem_sys_init(){
  	HAL_MEM_INIT();	//mmu初始化
  	acoral_mem_init((acoral_u32)HAL_HEAP_START,(acoral_u32)HAL_HEAP_END);	//伙伴系统初始化
#ifdef CFG_MEM2
  	acoral_mem_init2(); //TODO what is this?
#endif
	acoral_res_sys_init();	//资源池系统初始化
}


/**
 * @file buddy.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层,第一级内存管理——伙伴系统
 * @version 1.0
 * @date 2022-07-04
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-04 <td>Standardized 
 *  </table>
 */
#include <type.h>
#include<hal.h>
#include <print.h>
#define LEVEL 14 
#define BLOCK_INDEX(index) ((index)>>1)
#define BLOCK_SHIFT 7 
#define BLOCK_SIZE (1<<BLOCK_SHIFT)
#define MEM_NO_ALLOC 0
#define MEM_OK 1
typedef struct{
	acoral_8 level;
}acoral_block_t;
extern volatile acoral_u32 acoral_start_sched;
typedef struct{
	acoral_32 *free_list[LEVEL];
	acoral_u32 *bitmap[LEVEL];
	acoral_32 free_cur[LEVEL];
	acoral_u32 num[LEVEL];
	acoral_8 level;
	acoral_u8 state;
	acoral_u32 start_adr;
	acoral_u32 end_adr;
	acoral_u32 block_num;
	acoral_u32 free_num;
	acoral_u32 block_size;
}acoral_block_ctr_t;

acoral_block_ctr_t *acoral_mem_ctrl;
acoral_block_t *acoral_mem_blocks;

void buddy_scan(){
	acoral_u32 i,k,num,n;	
	acoral_u32 max_level=acoral_mem_ctrl->level;
	for(i=0;i<max_level;i++){
		acoral_print("Level%d\r\n",i); 	
		acoral_prints("bitmap:"); 	
		num=acoral_mem_ctrl->num[i];
		for(k=0;k<num;){
			for(n=0;n<8&&k<num;n++,k++){
				acoral_print("%x ",acoral_mem_ctrl->bitmap[i][k]); 
			}	
			acoral_prints("\r\n"); 	
		}
		acoral_print("Free Block head:%d\r\n",acoral_mem_ctrl->free_cur[i]); 	
		acoral_prints("\r\n"); 	
	}
	acoral_print("Free Mem Block Number:%d\r\n",acoral_mem_ctrl->free_num); 	
	acoral_print("\r\n"); 	
}

acoral_err buddy_init(acoral_u32 start_adr,acoral_u32 end_adr){
	acoral_32 i,k;
	acoral_u32 resize_size;
	acoral_u32 save_adr;
	acoral_u32 index;
	acoral_u32 num=1;
	acoral_u32 adjust_level=1;
	acoral_32 level=0;
	acoral_u32 max_num,o_num;
	acoral_u32 cur;
	start_adr+=3;
	start_adr&=~(4-1);		
	end_adr&=~(4-1);		
	resize_size=BLOCK_SIZE;
	end_adr=end_adr - sizeof(acoral_block_ctr_t);
	end_adr&=~(4-1);
	acoral_mem_ctrl=(acoral_block_ctr_t *)end_adr;
	/*如果内存这么少，不适合分配*/
	if(start_adr>end_adr||end_adr-start_adr<BLOCK_SIZE){
		acoral_mem_ctrl->state=MEM_NO_ALLOC;
		return -1;
	}
	acoral_mem_ctrl->state=MEM_OK;
	while(1){
		if(end_adr<=start_adr+resize_size)
			break;
		resize_size=resize_size<<1;
		num=num<<1;
		adjust_level++;
	}
	acoral_mem_blocks=(acoral_block_t *)end_adr-num;
	save_adr=(acoral_u32)acoral_mem_blocks;
	level=adjust_level;
	if(adjust_level>LEVEL)
		level=LEVEL;
	num=num/32; 
	for(i=0;i<level-1;i++){
		num=num>>1;
		if(num==0)
			num=1;
		save_adr-=num*4;
		save_adr&=~(4-1);
		acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
		acoral_mem_ctrl->num[i]=num;
		save_adr-=num*4;
		save_adr&=~(4-1);
		acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
		for(k=0;k<num;k++){
			acoral_mem_ctrl->bitmap[i][k]=0;;
			acoral_mem_ctrl->free_list[i][k]=-1;
		}
		acoral_mem_ctrl->free_cur[i]=-1;
	}
	if(num==0)
		num=1;
	save_adr-=num*4;
	save_adr&=~(4-1);
	acoral_mem_ctrl->bitmap[i]=(acoral_u32 *)save_adr;
	acoral_mem_ctrl->num[i]=num;
	save_adr-=num*4;
	save_adr&=~(4-1);
	acoral_mem_ctrl->free_list[i]=(acoral_32 *)save_adr;
	for(k=0;k<num;k++){
		acoral_mem_ctrl->bitmap[i][k]=0;;
		acoral_mem_ctrl->free_list[i][k]=-1;
	}
	acoral_mem_ctrl->free_cur[i]=-1;

	/*如果减去刚才bitmap用的内存刚好是下一level*/
	if(save_adr<=(start_adr+(resize_size>>1)))
		adjust_level--;
	if(adjust_level>LEVEL)
		level=LEVEL;
	acoral_mem_ctrl->level=level;
	acoral_mem_ctrl->start_adr=start_adr;
	num=(save_adr-start_adr)>>BLOCK_SHIFT;
	acoral_mem_ctrl->end_adr=start_adr+(num<<BLOCK_SHIFT);
	acoral_mem_ctrl->block_num=num;
	acoral_mem_ctrl->free_num=num;
	acoral_mem_ctrl->block_size=BLOCK_SIZE;

	i=0;
	max_num=1<<level-1;
	o_num=0;
	if(num>0)
		acoral_mem_ctrl->free_cur[level-1]=0;
	else
		acoral_mem_ctrl->free_cur[level-1]=-1;

	while(num>=max_num*32){
		acoral_mem_ctrl->bitmap[level-1][i]=-1;;
		acoral_mem_ctrl->free_list[level-1][i]=i+1;
		num-=max_num*32;
		o_num+=max_num*32;
		i++;
	}
	if(num==0)
		acoral_mem_ctrl->free_list[level-1][i-1]=-1;
	while(num>=max_num){
		index=o_num>>level-1;
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
		num-=max_num;
		o_num+=max_num;
	}
	acoral_mem_ctrl->free_list[level-1][i]=-1;

	
	while(--level>0){
		index=o_num>>level;
		if(num==0)
			break;
		cur=index/32;
		max_num=1<<level-1;
		if(num>=max_num){
			acoral_mem_blocks[BLOCK_INDEX(o_num)].level=-1;	
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level-1]);
			acoral_mem_ctrl->free_list[level-1][cur]=-1;	
			acoral_mem_ctrl->free_cur[level-1]=cur;	
			o_num+=max_num;
			num-=max_num;
		}
	}
	return 0;
}

static acoral_32 recus_malloc(level){
	acoral_u32 index;
	acoral_32 cur;
	acoral_32 num;
	if(level>=acoral_mem_ctrl->level)
		return -1;
	cur=acoral_mem_ctrl->free_cur[level];
	if(cur<0){
		num=recus_malloc(level+1);
		if(num<0)
			return -1;
		index=num>>level+1;
		cur=index/32;
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
		acoral_mem_ctrl->free_list[level][cur]=-1;
		acoral_mem_ctrl->free_cur[level]=cur;
		return num;
	}
	index=acoral_ffs(acoral_mem_ctrl->bitmap[level][cur]);
	index=cur*32+index;
	acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
	if(acoral_mem_ctrl->bitmap[level][cur]==0)
		acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];
	num=index<<level+1;
	/*最高level情况*/
	if(level==acoral_mem_ctrl->level-1){
		if((num>>1)+(1<<level)>acoral_mem_ctrl->block_num)
			return -1;
		return num>>1;
	}
	if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
		return num+(1<<level);
	else
		return num;
}

static void *r_malloc(acoral_u8 level){
	acoral_sr cpu_sr;
	acoral_u32 index;
	acoral_32 num,cur;
	HAL_ENTER_CRITICAL();
	acoral_mem_ctrl->free_num-=1<<level;
	cur=acoral_mem_ctrl->free_cur[level];
	if(cur<0){
		num=recus_malloc(level+1);
		if(num<0){
			HAL_EXIT_CRITICAL();
			return NULL;
		}
		index=num>>level+1;
		cur=index/32;
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
		acoral_mem_ctrl->free_list[level][cur]=-1;
		acoral_mem_ctrl->free_cur[level]=cur;
		if((num&0x1)==0)
			acoral_mem_blocks[BLOCK_INDEX(num)].level=level;
#ifdef CFG_TEST
		acoral_print("Malloc-level:%d,num:%d\n",level,num);
#endif
#ifdef CFG_TEST_MEM
		buddy_scan();
#endif
		HAL_EXIT_CRITICAL();
		return (void *)(acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT));
	}
	index=acoral_ffs(acoral_mem_ctrl->bitmap[level][cur]);
	index=index+cur*32;
	acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
	if(acoral_mem_ctrl->bitmap[level][cur]==0){
		acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];
	}
	if(level==acoral_mem_ctrl->level-1){
		num=index<<level;
		if(num+(1<<level)>acoral_mem_ctrl->block_num){
			HAL_EXIT_CRITICAL();
			return NULL; 
		}
	}
	else{
		num=index<<level+1;
		if(acoral_mem_blocks[BLOCK_INDEX(num)].level>=0)
			num+=(1<<level);
	}
	if((num&0x1)==0)
		acoral_mem_blocks[BLOCK_INDEX(num)].level=level;
#ifdef CFG_TEST
	acoral_print("malloc-level:%d,num:%d\n",level,num);
#endif
#ifdef CFG_TEST_MEM
	buddy_scan();
#endif
	HAL_EXIT_CRITICAL();
	return (void *)(acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT));
}

acoral_u32 buddy_malloc_size(acoral_u32 size){
	acoral_u32 resize_size;	
	acoral_u8 level=0;	
	acoral_u32 num=1;	
	resize_size=BLOCK_SIZE;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return 0;
	while(resize_size<size&&level<acoral_mem_ctrl->level){
		num=num<<1;
		level++;
		resize_size=resize_size<<1;
	}
	return resize_size;
}

void *buddy_malloc(acoral_u32 size){
	acoral_u32 resize_size;	
	acoral_u8 level=0;	
	acoral_u32 num=1;	
	resize_size=BLOCK_SIZE;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return NULL;
	while(resize_size<size){
		num=num<<1;
		level++;
		resize_size=resize_size<<1;
	}
	if(num>acoral_mem_ctrl->free_num)
		return NULL;
	if(level>=acoral_mem_ctrl->level)
		return NULL;	
	return r_malloc(level);
}

void buddy_free(void *ptr){
	acoral_sr cpu_sr;
	acoral_8 level;
	acoral_8 buddy_level;
	acoral_32 cur;
	acoral_u32 index;
	acoral_u32 num;
	acoral_u32 max_level;
	acoral_u32 adr;
	adr=(acoral_u32)ptr;
	if(acoral_mem_ctrl->state==MEM_NO_ALLOC)
		return;
	if(ptr==NULL||adr<acoral_mem_ctrl->start_adr||adr+BLOCK_SIZE>acoral_mem_ctrl->end_adr){
		acoral_printerr("Invalid Free Address:0x%x\n",ptr);
		return;
	}
	max_level=acoral_mem_ctrl->level;
	num=(adr-acoral_mem_ctrl->start_adr)>>BLOCK_SHIFT;
	/*如果不是block整数倍，肯定是非法地址*/
	if(adr!=acoral_mem_ctrl->start_adr+(num<<BLOCK_SHIFT)){
		acoral_printerr("Invalid Free Address:0x%x\n",ptr);
		return;
	}
	HAL_ENTER_CRITICAL();
	if(num&0x1){
		level=0;
		/*下面是地址检查*/
		index=num>>1;
		buddy_level=acoral_mem_blocks[BLOCK_INDEX(num)].level;
		if(buddy_level>0){
			acoral_printerr("Invalid Free Address:0x%x\n",ptr);
			HAL_EXIT_CRITICAL();
			return;
		}
		/*伙伴分配出去，如果对应的位为1,肯定是回收过一次了*/
		if(buddy_level==0&&acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
			acoral_printerr("Address:0x%x have been freed\n",ptr);
			HAL_EXIT_CRITICAL();
			return;
		}
		/*伙伴没有分配出去了，如果对应的位为0,肯定是回收过一次了*/
		if(buddy_level<0&&!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
			acoral_printerr("Address:0x%x have been freed\n",ptr);
			HAL_EXIT_CRITICAL();
			return;
		}
	}else{
		level=acoral_mem_blocks[BLOCK_INDEX(num)].level;
		/*已经释放*/
		if(level<0){
			acoral_printerr("Address:0x%x have been freed\n",ptr);
			HAL_EXIT_CRITICAL();
			return;
		}	
		acoral_mem_ctrl->free_num+=1<<level;
		acoral_mem_blocks[BLOCK_INDEX(num)].level=-1;
	}
#ifdef CFG_TEST
	acoral_print("Free-level:%d,num:%d\n",level,num);
#endif
	if(level==max_level-1){
		index=num>>level;
		acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
		HAL_EXIT_CRITICAL();
		return;
	}
	index=num>>1+level;
	while(level<max_level){
		cur=index/32;
		if(!acoral_get_bit(index,acoral_mem_ctrl->bitmap[level])){
			acoral_set_bit(index,acoral_mem_ctrl->bitmap[level]);
			if(acoral_mem_ctrl->free_cur[level]<0||cur<acoral_mem_ctrl->free_cur[level]){
				acoral_mem_ctrl->free_list[level][cur]=acoral_mem_ctrl->free_cur[level];	
				acoral_mem_ctrl->free_cur[level]=cur;	
			}
			break;
		}
		/*有个伙伴是空闲的，向上级回收*/
		acoral_clear_bit(index,acoral_mem_ctrl->bitmap[level]);
		if(cur==acoral_mem_ctrl->free_cur[level])
			acoral_mem_ctrl->free_cur[level]=acoral_mem_ctrl->free_list[level][cur];	
		level++;
		if(level<max_level-1)
			index=index>>1;
	}
	HAL_EXIT_CRITICAL();
#ifdef CFG_TEST_MEM
	buddy_scan();
#endif
}






/**
 * @file resource.c
 * @author 王彬浩 (SPGGOGOGO@outlook.com)
 * @brief kernel层,第二级内存管理——资源池
 * @version 1.0
 * @date 2022-07-04
 * @copyright Copyright (c) 2022
 * @revisionHistory 
 *  <table> 
 *   <tr><th> 版本 <th>作者 <th>日期 <th>修改内容 
 *   <tr><td> 0.1 <td>jivin <td>2010-03-08 <td>Created 
 *   <tr><td> 1.0 <td>王彬浩 <td> 2022-07-04 <td>Standardized 
 *  </table>
 */

#include<type.h> //TODO 改名字位资源
#include<hal.h>
#include<queue.h>
#include<mem.h>
#include<print.h>
#include<core.h>
acoral_pool_t acoral_pools[ACORAL_MAX_POOLS];
acoral_pool_t *acoral_free_res_pool;
/*================================
 *    create a kind of resource pool
 *       创建某一资源内存池
 *       pool_ctrl---资源内存池管理块
 *================================*/
acoral_err acoral_create_pool(acoral_pool_ctrl_t *pool_ctrl){
  	acoral_pool_t *pool;
	if(pool_ctrl->num>=pool_ctrl->max_pools)
	    return ACORAL_RES_MAX_POOL;
  	pool=acoral_get_free_pool();
	if(pool==NULL)
		return ACORAL_RES_NO_POOL;
	pool->id=pool_ctrl->type<<ACORAL_RES_TYPE_BIT|pool->id;
	pool->size=pool_ctrl->size;
	pool->num=pool_ctrl->num_per_pool;
	pool->base_adr=(void *)acoral_malloc(pool->size*pool->num);
	if(pool->base_adr==NULL)
		return ACORAL_RES_NO_MEM;
	pool->res_free=pool->base_adr;
	pool->free_num=pool->num;
	pool->ctrl=pool_ctrl;
	acoral_pool_res_init(pool);
        acoral_list_add2_tail(&pool->ctrl_list,pool_ctrl->pools);
	acoral_list_add2_tail(&pool->free_list,pool_ctrl->free_pools);
	pool_ctrl->num++;
	return 0;
}

/*================================
 *      release a kind of resource pool
 *       释放某一资源内存池所有资源
 *       pool_ctrl--资源内存池管理块
 *================================*/
void acoral_release_pool(acoral_pool_ctrl_t *pool_ctrl){
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->pools;
	if(acoral_list_empty(head))
	  	return;
   for(list=head->next;list!=head;list=list->next){
			pool=list_entry(list,acoral_pool_t,free_list);
		    acoral_list_del(&pool->ctrl_list);
			acoral_list_del(&pool->free_list);
			acoral_free(pool->base_adr);
			pool->base_adr=(void *)acoral_free_res_pool;
			pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
			acoral_free_res_pool=pool;
	}
}

/*================================
 *    collect a kind of resource pool
 *       回收某一资源内存池空闲的内存池
 *       pool_ctrl--资源内存池管理块
 *================================*/
void acoral_collect_pool(acoral_pool_ctrl_t *pool_ctrl){
	acoral_pool_t *pool;
	acoral_list_t *list,*head;
	head=pool_ctrl->free_pools;
	if(acoral_list_empty(head))
	  	return;
        for(list=head->next;list!=head;list=list->next){
			pool=list_entry(list,acoral_pool_t,free_list);
	       	if(pool->free_num==pool->num){
		      	acoral_list_del(&pool->ctrl_list);
				acoral_list_del(&pool->free_list);
				acoral_free(pool->base_adr);
				pool->base_adr=(void *)acoral_free_res_pool;
				pool->id=pool->id&ACORAL_POOL_INDEX_MASK;
				acoral_free_res_pool=pool;
			}
	}
}

/*================================
 *    get a kind of resource 
 *       获取某一资源
 *       pool_ctrl--资源池管理块
 *================================*/
acoral_res_t *acoral_get_res(acoral_pool_ctrl_t *pool_ctrl){
	acoral_sr cpu_sr;
  	acoral_list_t *first;
	acoral_res_t *res;
	acoral_pool_t *pool;
	HAL_ENTER_CRITICAL();
	first=pool_ctrl->free_pools->next;
	if(acoral_list_empty(first)){
	  	if(acoral_create_pool(pool_ctrl)){
			HAL_EXIT_CRITICAL();
			return NULL;
		}
		else{
			first=pool_ctrl->free_pools->next;
		}
	}
	pool=list_entry(first,acoral_pool_t,free_list);
	res=(acoral_res_t *)pool->res_free;
	pool->res_free=(void *)((acoral_u8 *)pool->base_adr+res->next_id*pool->size);
	res->id=(res->id>>(ACORAL_RES_INDEX_INIT_BIT-ACORAL_RES_INDEX_BIT))&ACORAL_RES_INDEX_MASK|pool->id;
        pool->free_num--;
#ifdef CFG_TEST
	acoral_print("Alloc res 0x%x\n",res);
#endif
	if(!pool->free_num){
	  	acoral_list_del(&pool->free_list);
	}
	HAL_EXIT_CRITICAL();
	return res;
}

/*================================
 *    release a kind of resource 
 *       释放某一资源
 *      res--资源数据块
 *================================*/
void acoral_release_res(acoral_res_t *res){
  	acoral_pool_t *pool;
	acoral_u32 index;
  	void *tmp;
       	acoral_pool_ctrl_t *pool_ctrl;
	if(!ACORAL_ASSERT(res,"Res Release\n"))
		return;
	pool=acoral_get_pool_by_id(res->id);
	if(pool==NULL){
		acoral_printerr("Res release Err\n");
		return;
	}
 	pool_ctrl=pool->ctrl;
	if((void *)res<pool->base_adr){
		acoral_printerr("Err Res\n");
		return;
	}
	index=(((acoral_u32)res-(acoral_u32)pool->base_adr)/pool->size);
	if(index>=pool->num){
		acoral_printerr("Err Res\n");
		return;
	}
#ifdef CFG_TEST
	acoral_print("Free res 0x%x\n",res);
#endif
	tmp=pool->res_free;
	pool->res_free=(void *)res;
	res->id=index<<ACORAL_RES_INDEX_INIT_BIT;
	res->next_id=((acoral_res_t *)tmp)->id>>ACORAL_RES_INDEX_INIT_BIT;
	pool->free_num++;
	if(acoral_list_empty(&pool->free_list))
	  	acoral_list_add(&pool->free_list,pool_ctrl->free_pools);
	return;
}

/*================================
 *    get a kind of resource by res_id
 *  根据资源ID获取某一资源对应的资源池
 *      res_id--资源ID
 *================================*/
acoral_pool_t *acoral_get_pool_by_id(acoral_id res_id){
  	acoral_u32 index;
	index=(res_id&ACORAL_POOL_INDEX_MASK)>>ACORAL_POOL_INDEX_BIT;
	if(index<ACORAL_MAX_POOLS)
	  	return acoral_pools+index;
	return NULL;
}


/*================================
 *    get a free pool
 *     获取空闲资源池
 *================================*/
acoral_pool_t *acoral_get_free_pool(){
	acoral_sr cpu_sr;
  	acoral_pool_t *tmp;
	HAL_ENTER_CRITICAL();
	tmp=acoral_free_res_pool;
	if(NULL!=tmp){
		acoral_free_res_pool=*(void **)tmp->base_adr;
	}
	HAL_EXIT_CRITICAL();
	return tmp;
}

acoral_res_t * acoral_get_res_by_id(acoral_id id){
  	acoral_pool_t *pool;
	acoral_u32 index;
	pool=acoral_get_pool_by_id(id);
	if(pool==NULL)
		return NULL;
	index=(id&ACORAL_RES_INDEX_MASK)>>ACORAL_RES_INDEX_BIT;
     	return (acoral_res_t *)((acoral_u8 *)pool->base_adr+index*pool->size);
}



/*================================
 *       a kind of resource initial 
 *        资源初始化
 *================================*/
void acoral_pool_res_init(acoral_pool_t * pool){
	acoral_res_t *res;
	acoral_u32 i;
	acoral_u8 *pblk;
	acoral_u32 blks;
	blks=pool->num;
	res=(acoral_res_t *)pool->base_adr;
     	pblk=(acoral_u8 *)pool->base_adr + pool->size;
	for (i = 0; i < (blks - 1); i++) {
	    res->id=i<<ACORAL_RES_INDEX_INIT_BIT;
	    res->next_id=i+1;
	    res=(acoral_res_t *)pblk;
	    pblk+=pool->size;
	}
	res->id=blks-1<<ACORAL_RES_INDEX_INIT_BIT;
	res->next_id=0;
}

/*================================
 *        resource pool control initial 
 *              资源池控制块初始化
 *================================*/
void acoral_pool_ctrl_init(acoral_pool_ctrl_t *pool_ctrl)
{
	acoral_u32 size;
	pool_ctrl->free_pools=&pool_ctrl->list[0];
	pool_ctrl->pools=&pool_ctrl->list[1];
	pool_ctrl->num=0;
	acoral_init_list(pool_ctrl->pools);
    acoral_init_list(pool_ctrl->free_pools);
	/*调整pool的对象个数以最大化利用分配了的内存*/
	size=acoral_malloc_size(pool_ctrl->size*pool_ctrl->num_per_pool);
	if(size<pool_ctrl->size){
		pool_ctrl->num_per_pool=0;
	}
	else{
		pool_ctrl->num_per_pool=size/pool_ctrl->size;
		acoral_create_pool(pool_ctrl); //先创建一个资源池，后面如果一个池子不够了，那在不超过这类资源的max_pool的条件下再创建新的池子
	}
}

/*================================
 *        user resource api
 *         用户资源相关接口
 *================================*/

void acoral_obj_pool_init(acoral_pool_ctrl_t *pool_ctrl)
{
	pool_ctrl->type=ACORAL_RES_USER;
	pool_ctrl->size+=sizeof(acoral_res_t);
	acoral_pool_ctrl_init(pool_ctrl);
}

void acoral_obj_pool_release(acoral_pool_ctrl_t *pool_ctrl){
	 acoral_release_pool(pool_ctrl);
}

void *acoral_get_obj(acoral_pool_ctrl_t *pool_ctrl){
	return (void *)((acoral_char *)acoral_get_res(pool_ctrl)+sizeof(acoral_res_t));
}

void acoral_free_obj(void *obj){
	acoral_release_res((acoral_char *)obj-sizeof(acoral_res_t));
}



/**
 * @brief 资源系统初始化
 * @note link all pools by making every pool's base_adr point to next pool,\
 * 		and then initialize acoral_free_res_pool as the first pool.
 * 
 */
void acoral_res_sys_init(){
	acoral_pool_t  *pool;
    acoral_u32 i;
    pool = &acoral_pools[0];
    for (i = 0; i < (ACORAL_MAX_POOLS - 1); i++) {
        pool->base_adr= (void *)&acoral_pools[i+1];
		pool->id=i;
        pool++;
    }
    pool->base_adr= (void *)0;
    acoral_free_res_pool = &acoral_pools[0];
}

acoral_char acoral_assert_res(acoral_res_t *res,acoral_8 *assert){
	if(res==NULL||acoral_get_res_by_id(res->id)!=res){
		acoral_printerr("%s\n",assert);
		acoral_printerr("Err res's id:%x\n",res->id);
		return false;
	}
	return true;
}
