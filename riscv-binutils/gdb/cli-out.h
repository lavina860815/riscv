/* Output generating routines for GDB CLI.
   Copyright (C) 1999-2021 Free Software Foundation, Inc.
   Contributed by Cygnus Solutions.

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

#ifndef CLI_OUT_H
#define CLI_OUT_H

#include "ui-out.h"
#include <vector>

class cli_ui_out : public ui_out
{
public:

  explicit cli_ui_out (ui_file *stream, ui_out_flags flags);
  virtual ~cli_ui_out ();

  ui_file *set_stream (ui_file *stream);

  bool can_emit_style_escape () const override;

protected:

  virtual void do_table_begin (int nbrofcols, int nr_rows,
			       const char *tblid) override;
  virtual void do_table_body () override;
  virtual void do_table_end () override;
  virtual void do_table_header (int width, ui_align align,
				const std::string &col_name,
				const std::string &col_hdr) override;
  /* Note: level 0 is the top-level so LEVEL is always greater than
     zero.  */
  virtual void do_begin (ui_out_type type, const char *id) override;
  virtual void do_end (ui_out_type type) override;
  virtual void do_field_signed (int fldno, int width, ui_align align,
				const char *fldname, LONGEST value) override;
  virtual void do_field_unsigned (int fldno, int width, ui_align align,
				  const char *fldname, ULONGEST value)
    override;
  virtual void do_field_skip (int fldno, int width, ui_align align,
			      const char *fldname) override;
  virtual void do_field_string (int fldno, int width, ui_align align,
				const char *fldname,
				const char *string,
				const ui_file_style &style) override;
  virtual void do_field_fmt (int fldno, int width, ui_align align,
			     const char *fldname, const ui_file_style &style,
			     const char *format, va_list args)
    override ATTRIBUTE_PRINTF (7, 0);
  virtual void do_spaces (int numspaces) override;
  virtual void do_text (const char *string) override;
  virtual void do_message (const ui_file_style &style,
			   const char *format, va_list args) override
    ATTRIBUTE_PRINTF (3,0);
  virtual void do_wrap_hint (const char *identstring) override;
  virtual void do_flush () override;
  virtual void do_redirect (struct ui_file *outstream) override;

  virtual void do_progress_start (const std::string &, bool) override;
  virtual void do_progress_notify (double) override;
  virtual void do_progress_end () override;

  bool suppress_output ()
  { return m_suppress_output; }

private:

  void field_separator ();

  std::vector<ui_file *> m_streams;
  bool m_suppress_output;

  /* Represents the printing state of a progress meter.  */
  enum meter_state
  {
    /* Printing will start with the next output.  */
    START,
    /* Printing has already started.  */
    WORKING,
    /* Progress printing has already started.  */
    PROGRESS,
    /* Printing should not be done.  */
    NO_PRINT
  };

  /* The state of a recent progress meter.  */
  struct cli_progress_info
  {
    /* The current state.  */
    enum meter_state printing;
    /* The name to print.  */
    std::string name;
    /* The last notification value.  */
    double last_value;
  };

  /* Stack of progress meters.  */
  std::vector<cli_progress_info> m_meters;
};

extern cli_ui_out *cli_out_new (struct ui_file *stream);

extern void cli_display_match_list (char **matches, int len, int max);

#endif
