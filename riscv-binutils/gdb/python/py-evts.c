/* Python interface to inferior events.

   Copyright (C) 2009-2021 Free Software Foundation, Inc.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#include "defs.h"
#include "py-events.h"

#ifdef IS_PY3K
static struct PyModuleDef EventModuleDef =
{
  PyModuleDef_HEAD_INIT,
  "gdb.events",
  NULL,
  -1,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL
};
#endif

/* Initialize python events.  */

static int CPYCHECKER_NEGATIVE_RESULT_SETS_EXCEPTION
add_new_registry (eventregistry_object **registryp, const char *name)
{
  *registryp = create_eventregistry_object ();

  if (*registryp == NULL)
    return -1;

  return gdb_pymodule_addobject (gdb_py_events.module,
				 name,
				 (PyObject *)(*registryp));
}

int
gdbpy_initialize_py_events (void)
{
#ifdef IS_PY3K
  gdb_py_events.module = PyModule_Create (&EventModuleDef);
#else
  gdb_py_events.module = Py_InitModule ("events", NULL);
#endif

  if (!gdb_py_events.module)
    return -1;

#define GDB_PY_DEFINE_EVENT(name)				\
  if (add_new_registry (&gdb_py_events.name, #name) < 0)	\
    return -1;
#include "py-all-events.def"
#undef GDB_PY_DEFINE_EVENT

  if (gdb_pymodule_addobject (gdb_module,
			      "events",
			      (PyObject *) gdb_py_events.module) < 0)
    return -1;

  return 0;
}
