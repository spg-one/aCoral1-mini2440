#ifndef ACORAL_LIST_H
#define ACORAL_LIST_H
#include"comm.h"
#include "spinlock.h"
#define list_entry(ptr, type, member) \
	container_of(ptr, type, member)
#define acoral_list_init(list) acoral_init_list(list)
struct acoral_list {
	struct acoral_list *next, *prev;
};
typedef struct acoral_list acoral_list_t;
#define acoral_init_list(ptr) do { \
	(ptr)->next = (ptr); (ptr)->prev = (ptr); \
} while (0)

#define acoral_list_empty(head) ((head)->next==(head))

#endif
