/******************************************************************************
 * Copyright (c) 2004, 2008 IBM Corporation
 * All rights reserved.
 * This program and the accompanying materials
 * are made available under the terms of the BSD License
 * which accompanies this distribution, and is available at
 * http://www.opensource.org/licenses/bsd-license.php
 *
 * Contributors:
 *     IBM Corporation - initial implementation
 *****************************************************************************/


#include "stdlib.h"


void *
memalign(size_t blocksize, size_t bytes)
{
	void *x;

	x = malloc(bytes + blocksize);
	x = (void *) (((unsigned long) x + blocksize - 1) & ~(blocksize - 1));

	return (void *) x;
}
