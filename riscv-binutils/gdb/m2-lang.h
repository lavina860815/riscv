/* Modula 2 language support definitions for GDB, the GNU debugger.

   Copyright (C) 1992-2021 Free Software Foundation, Inc.

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

#ifndef M2_LANG_H
#define M2_LANG_H

struct type_print_options;
struct parser_state;

/* Defined in m2-typeprint.c */
extern void m2_print_type (struct type *, const char *, struct ui_file *, int,
			   int, const struct type_print_options *);

extern int m2_is_long_set (struct type *type);
extern int m2_is_unbounded_array (struct type *type);

extern int get_long_set_bounds (struct type *type, LONGEST *low,
				LONGEST *high);

/* Modula-2 types */

struct builtin_m2_type
{
  struct type *builtin_char;
  struct type *builtin_int;
  struct type *builtin_card;
  struct type *builtin_real;
  struct type *builtin_bool;
};

/* Return the Modula-2 type table for the specified architecture.  */
extern const struct builtin_m2_type *builtin_m2_type (struct gdbarch *gdbarch);

/* Class representing the M2 language.  */

class m2_language : public language_defn
{
public:
  m2_language ()
    : language_defn (language_m2)
  { /* Nothing.  */ }

  /* See language.h.  */

  const char *name () const override
  { return "modula-2"; }

  /* See language.h.  */

  const char *natural_name () const override
  { return "Modula-2"; }

  /* See language.h.  */

  void language_arch_info (struct gdbarch *gdbarch,
			   struct language_arch_info *lai) const override;

  /* See language.h.  */

  void print_type (struct type *type, const char *varstring,
		   struct ui_file *stream, int show, int level,
		   const struct type_print_options *flags) const override
  {
    m2_print_type (type, varstring, stream, show, level, flags);
  }

  /* See language.h.  */

  void value_print_inner (struct value *val, struct ui_file *stream,
			  int recurse,
			  const struct value_print_options *options) const override;

  /* See language.h.  */

  int parser (struct parser_state *ps) const override;

  /* See language.h.  */

  void emitchar (int ch, struct type *chtype,
		 struct ui_file *stream, int quoter) const override;

  /* See language.h.  */

  void printchar (int ch, struct type *chtype,
		  struct ui_file *stream) const override;

  /* See language.h.  */

  void printstr (struct ui_file *stream, struct type *elttype,
		 const gdb_byte *string, unsigned int length,
		 const char *encoding, int force_ellipses,
		 const struct value_print_options *options) const override;

  /* See language.h.  */

  void print_typedef (struct type *type, struct symbol *new_symbol,
		      struct ui_file *stream) const override;

  /* See language.h.  */

  bool is_string_type_p (struct type *type) const override
  {
    type = check_typedef (type);
    if (type->code () == TYPE_CODE_ARRAY
	&& TYPE_LENGTH (type) > 0
	&& TYPE_LENGTH (TYPE_TARGET_TYPE (type)) > 0)
      {
	struct type *elttype = check_typedef (TYPE_TARGET_TYPE (type));

	if (TYPE_LENGTH (elttype) == 1
	    && (elttype->code () == TYPE_CODE_INT
		|| elttype->code () == TYPE_CODE_CHAR))
	  return true;
      }

    return false;
  }

  /* See language.h.  */

  bool c_style_arrays_p () const override
  { return false; }

  /* See language.h.  Despite not having C-style arrays, Modula-2 uses 0
     for its string lower bounds.  */

  char string_lower_bound () const override
  { return 0; }

  /* See language.h.  */

  bool range_checking_on_by_default () const override
  { return true; }

  /* See language.h.  */

  const struct exp_descriptor *expression_ops () const override
  { return &exp_descriptor_modula2; }

  /* See language.h.  */

  const struct op_print *opcode_print_table () const override
  { return op_print_tab; }

private:
  /* Table of expression handling functions for use by EXPRESSION_OPS
     member function.  */
  static const struct exp_descriptor exp_descriptor_modula2;

  /* Table of opcode data for use by OPCODE_PRINT_TABLE member function.  */
  static const struct op_print op_print_tab[];
};

#endif /* M2_LANG_H */
