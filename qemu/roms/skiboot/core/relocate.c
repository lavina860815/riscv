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

#include <stdbool.h>
#include <elf.h>

/* WARNING: This code is used to self-relocate, it cannot have any
 * global reference nor TOC reference. It's also called before BSS
 * is cleared.
 */

/* Called from head.S, thus no header. */
int relocate(uint64_t offset, struct elf64_dyn *dyn, struct elf64_rela *rela);

/* Note: This code is simplified according to the assumptions
 *       that our link address is 0 and we are running at the
 *       target address already.
 */
int relocate(uint64_t offset, struct elf64_dyn *dyn, struct elf64_rela *rela)
{
	uint64_t dt_rela	= 0;
	uint64_t dt_relacount	= 0;
	unsigned int i;

	/* Look for relocation table */
	for (; dyn->d_tag != DT_NULL; dyn++) {
		if (dyn->d_tag == DT_RELA)
			dt_rela = dyn->d_val;
		else if (dyn->d_tag == DT_RELACOUNT)
			dt_relacount = dyn->d_val;
	}

	/* If we miss either rela or relacount, bail */
	if (!dt_rela || !dt_relacount)
		return -1;

	/* Check if the offset is consistent */
	if ((offset + dt_rela) != (uint64_t)rela)
		return -2;

	/* Perform relocations */
	for (i = 0; i < dt_relacount; i++, rela++) {
		uint64_t *t;

		if (ELF64_R_TYPE(rela->r_info) != R_PPC64_RELATIVE)
			return -3;
		t = (uint64_t *)(rela->r_offset + offset);
		*t = rela->r_addend + offset;
	}

	return 0;
}
