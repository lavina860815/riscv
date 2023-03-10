/* Copyright 2013-2014 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * 	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <config.h>

#define BITS_PER_LONG (sizeof(long) * 8)

#include "dummy-cpu.h"

#include <stdlib.h>

static void *__malloc(size_t size, const char *location __attribute__((unused)))
{
	return malloc(size);
}

static void *__realloc(void *ptr, size_t size, const char *location __attribute__((unused)))
{
	return realloc(ptr, size);
}

static void *__zalloc(size_t size, const char *location __attribute__((unused)))
{
	return calloc(size, 1);
}

static inline void __free(void *p, const char *location __attribute__((unused)))
{
	return free(p);
}

#include <skiboot.h>

/* We need mem_region to accept __location__ */
#define is_rodata(p) true
#include "../mem_region.c"

/* But we need device tree to make copies of names. */
#undef is_rodata
#define is_rodata(p) false

#include "../device.c"
#include <assert.h>
#include <stdio.h>

enum proc_chip_quirks proc_chip_quirks;

void lock_caller(struct lock *l, const char *caller)
{
	(void)caller;
	l->lock_val++;
}

void unlock(struct lock *l)
{
	l->lock_val--;
}

bool lock_held_by_me(struct lock *l)
{
	return l->lock_val;
}

#define TEST_HEAP_ORDER 12
#define TEST_HEAP_SIZE (1ULL << TEST_HEAP_ORDER)

static void add_mem_node(uint64_t start, uint64_t len)
{
	struct dt_node *mem;
	u64 reg[2];
	char *name;

	name = (char*)malloc(sizeof("memory@") + STR_MAX_CHARS(reg[0]));
	assert(name);

	/* reg contains start and length */
	reg[0] = cpu_to_be64(start);
	reg[1] = cpu_to_be64(len);

	sprintf(name, "memory@%llx", (long long)start);

	mem = dt_new(dt_root, name);
	dt_add_property_string(mem, "device_type", "memory");
	dt_add_property(mem, "reg", reg, sizeof(reg));
	free(name);
}

void add_chip_dev_associativity(struct dt_node *dev __attribute__((unused)))
{
}

int main(void)
{
	uint64_t i;
	struct mem_region *r, *other = NULL;
	void *other_mem;
	const char *last;

	/* Use malloc for the heap, so valgrind can find issues. */
	skiboot_heap.start = (unsigned long)malloc(TEST_HEAP_SIZE);
	skiboot_heap.len = TEST_HEAP_SIZE;
	skiboot_os_reserve.len = 0;

	dt_root = dt_new_root("");
	dt_add_property_cells(dt_root, "#address-cells", 2);
	dt_add_property_cells(dt_root, "#size-cells", 2);

	other_mem = malloc(1024*1024);
	add_mem_node((unsigned long)other_mem, 1024*1024);

	/* Now convert. */
	mem_region_init();

	/* Find our node to allocate from */
	list_for_each(&regions, r, list) {
		if (region_start(r) == other_mem)
			other = r;
	}
	/* This could happen if skiboot addresses clashed with our alloc. */
	assert(other);
	assert(mem_check(other));

	/* Allocate 1k from other region. */
	lock(&other->free_list_lock);
	mem_alloc(other, 1024, 1, "1k");
	unlock(&other->free_list_lock);

	mem_region_release_unused();

	assert(mem_check(&skiboot_heap));

	/* Now we expect it to be split. */
	i = 0;
	list_for_each(&regions, r, list) {
		assert(mem_check(r));
		i++;
		if (r == &skiboot_os_reserve)
			continue;
		if (r == &skiboot_code_and_text)
			continue;
		if (r == &skiboot_heap)
			continue;
		if (r == &skiboot_after_heap)
			continue;
		if (r == &skiboot_cpu_stacks)
			continue;
		if (r == other) {
			assert(r->type == REGION_MEMORY);
			assert(r->len < 1024 * 1024);
		} else {
			assert(r->type == REGION_OS);
			assert(r->start == other->start + other->len);
			assert(r->start + r->len == other->start + 1024*1024);
		}
	}
	assert(i == 7);

	last = NULL;
	list_for_each(&regions, r, list) {
		if (last != r->name &&
		    strncmp(r->name, NODE_REGION_PREFIX,
			    strlen(NODE_REGION_PREFIX)) == 0) {
			/* It's safe to cast away const as this is
			 * only going to happen in test code */
			free((void*)r->name);
			break;
		}
		last = r->name;
	}

	dt_free(dt_root);
	free((void *)(long)skiboot_heap.start);
	free(other_mem);
	return 0;
}
