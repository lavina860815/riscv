/* Linux-specific functions to retrieve OS data.

   Copyright (C) 2009-2020 Free Software Foundation, Inc.

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

#include "gdbsupport/common-defs.h"
#include "linux-osdata.h"

#include <sys/types.h>
#include <sys/sysinfo.h>
#include <ctype.h>
#include <utmp.h>
#include <time.h>
#include <unistd.h>
#include <pwd.h>
#include <grp.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include "gdbsupport/xml-utils.h"
#include "gdbsupport/buffer.h"
#include <dirent.h>
#include <sys/stat.h>
#include "gdbsupport/filestuff.h"
#include <algorithm>

#define NAMELEN(dirent) strlen ((dirent)->d_name)

/* Define PID_T to be a fixed size that is at least as large as pid_t,
   so that reading pid values embedded in /proc works
   consistently.  */

typedef long long  PID_T;

/* Define TIME_T to be at least as large as time_t, so that reading
   time values embedded in /proc works consistently.  */

typedef long long TIME_T;

#define MAX_PID_T_STRLEN  (sizeof ("-9223372036854775808") - 1)

/* Returns the CPU core that thread PTID is currently running on.  */

/* Compute and return the processor core of a given thread.  */

int
linux_common_core_of_thread (ptid_t ptid)
{
  char filename[sizeof ("/proc//task//stat") + 2 * MAX_PID_T_STRLEN];
  char *content = NULL;
  char *p;
  char *ts = 0;
  int content_read = 0;
  int i;
  int core;

  sprintf (filename, "/proc/%lld/task/%lld/stat",
	   (PID_T) ptid.pid (), (PID_T) ptid.lwp ());
  gdb_file_up f = gdb_fopen_cloexec (filename, "r");
  if (!f)
    return -1;

  for (;;)
    {
      int n;
      content = (char *) xrealloc (content, content_read + 1024);
      n = fread (content + content_read, 1, 1024, f.get ());
      content_read += n;
      if (n < 1024)
	{
	  content[content_read] = '\0';
	  break;
	}
    }

  /* ps command also relies on no trailing fields ever contain ')'.  */
  p = strrchr (content, ')');
  if (p != NULL)
    p++;

  /* If the first field after program name has index 0, then core number is
     the field with index 36.  There's no constant for that anywhere.  */
  if (p != NULL)
    p = strtok_r (p, " ", &ts);
  for (i = 0; p != NULL && i != 36; ++i)
    p = strtok_r (NULL, " ", &ts);

  if (p == NULL || sscanf (p, "%d", &core) == 0)
    core = -1;

  xfree (content);

  return core;
}

/* Finds the command-line of process PID and copies it into COMMAND.
   At most MAXLEN characters are copied.  If the command-line cannot
   be found, PID is copied into command in text-form.  */

static void
command_from_pid (char *command, int maxlen, PID_T pid)
{
  std::string stat_path = string_printf ("/proc/%lld/stat", pid);
  gdb_file_up fp = gdb_fopen_cloexec (stat_path, "r");

  command[0] = '\0';

  if (fp)
    {
      /* sizeof (cmd) should be greater or equal to TASK_COMM_LEN (in
	 include/linux/sched.h in the Linux kernel sources) plus two
	 (for the brackets).  */
      char cmd[18];
      PID_T stat_pid;
      int items_read = fscanf (fp.get (), "%lld %17s", &stat_pid, cmd);

      if (items_read == 2 && pid == stat_pid)
	{
	  cmd[strlen (cmd) - 1] = '\0'; /* Remove trailing parenthesis.  */
	  strncpy (command, cmd + 1, maxlen); /* Ignore leading parenthesis.  */
	}
    }
  else
    {
      /* Return the PID if a /proc entry for the process cannot be found.  */
      snprintf (command, maxlen, "%lld", pid);
    }

  command[maxlen - 1] = '\0'; /* Ensure string is null-terminated.  */
}

/* Returns the command-line of the process with the given PID. The
   returned string needs to be freed using xfree after use.  */

static char *
commandline_from_pid (PID_T pid)
{
  std::string pathname = string_printf ("/proc/%lld/cmdline", pid);
  char *commandline = NULL;
  gdb_file_up f = gdb_fopen_cloexec (pathname, "r");

  if (f)
    {
      size_t len = 0;

      while (!feof (f.get ()))
	{
	  char buf[1024];
	  size_t read_bytes = fread (buf, 1, sizeof (buf), f.get ());

	  if (read_bytes)
	    {
	      commandline = (char *) xrealloc (commandline, len + read_bytes + 1);
	      memcpy (commandline + len, buf, read_bytes);
	      len += read_bytes;
	    }
	}

      if (commandline)
	{
	  size_t i;

	  /* Replace null characters with spaces.  */
	  for (i = 0; i < len; ++i)
	    if (commandline[i] == '\0')
	      commandline[i] = ' ';

	  commandline[len] = '\0';
	}
      else
	{
	  /* Return the command in square brackets if the command-line
	     is empty.  */
	  commandline = (char *) xmalloc (32);
	  commandline[0] = '[';
	  command_from_pid (commandline + 1, 31, pid);

	  len = strlen (commandline);
	  if (len < 31)
	    strcat (commandline, "]");
	}
    }

  return commandline;
}

/* Finds the user name for the user UID and copies it into USER.  At
   most MAXLEN characters are copied.  */

static void
user_from_uid (char *user, int maxlen, uid_t uid)
{
  struct passwd *pwentry;
  char buf[1024];
  struct passwd pwd;
  getpwuid_r (uid, &pwd, buf, sizeof (buf), &pwentry);

  if (pwentry)
    {
      strncpy (user, pwentry->pw_name, maxlen);
      /* Ensure that the user name is null-terminated.  */
      user[maxlen - 1] = '\0';
    }
  else
    user[0] = '\0';
}

/* Finds the owner of process PID and returns the user id in OWNER.
   Returns 0 if the owner was found, -1 otherwise.  */

static int
get_process_owner (uid_t *owner, PID_T pid)
{
  struct stat statbuf;
  char procentry[sizeof ("/proc/") + MAX_PID_T_STRLEN];

  sprintf (procentry, "/proc/%lld", pid);

  if (stat (procentry, &statbuf) == 0 && S_ISDIR (statbuf.st_mode))
    {
      *owner = statbuf.st_uid;
      return 0;
    }
  else
    return -1;
}

/* Find the CPU cores used by process PID and return them in CORES.
   CORES points to an array of NUM_CORES elements.  */

static int
get_cores_used_by_process (PID_T pid, int *cores, const int num_cores)
{
  char taskdir[sizeof ("/proc/") + MAX_PID_T_STRLEN + sizeof ("/task") - 1];
  DIR *dir;
  struct dirent *dp;
  int task_count = 0;

  sprintf (taskdir, "/proc/%lld/task", pid);
  dir = opendir (taskdir);
  if (dir)
    {
      while ((dp = readdir (dir)) != NULL)
	{
	  PID_T tid;
	  int core;

	  if (!isdigit (dp->d_name[0])
	      || NAMELEN (dp) > MAX_PID_T_STRLEN)
	    continue;

	  sscanf (dp->d_name, "%lld", &tid);
	  core = linux_common_core_of_thread (ptid_t ((pid_t) pid,
						      (pid_t) tid, 0));

	  if (core >= 0 && core < num_cores)
	    {
	      ++cores[core];
	      ++task_count;
	    }
	}

      closedir (dir);
    }

  return task_count;
}

static void
linux_xfer_osdata_processes (struct buffer *buffer)
{
  DIR *dirp;

  buffer_grow_str (buffer, "<osdata type=\"processes\">\n");

  dirp = opendir ("/proc");
  if (dirp)
    {
      const int num_cores = sysconf (_SC_NPROCESSORS_ONLN);
      struct dirent *dp;

      while ((dp = readdir (dirp)) != NULL)
	{
	  PID_T pid;
	  uid_t owner;
	  char user[UT_NAMESIZE];
	  char *command_line;
	  int *cores;
	  int task_count;
	  char *cores_str;
	  int i;

	  if (!isdigit (dp->d_name[0])
	      || NAMELEN (dp) > MAX_PID_T_STRLEN)
	    continue;

	  sscanf (dp->d_name, "%lld", &pid);
	  command_line = commandline_from_pid (pid);

	  if (get_process_owner (&owner, pid) == 0)
	    user_from_uid (user, sizeof (user), owner);
	  else
	    strcpy (user, "?");

	  /* Find CPU cores used by the process.  */
	  cores = XCNEWVEC (int, num_cores);
	  task_count = get_cores_used_by_process (pid, cores, num_cores);
	  cores_str = (char *) xcalloc (task_count, sizeof ("4294967295") + 1);

	  for (i = 0; i < num_cores && task_count > 0; ++i)
	    if (cores[i])
	      {
		char core_str[sizeof ("4294967295")];

		sprintf (core_str, "%d", i);
		strcat (cores_str, core_str);

		task_count -= cores[i];
		if (task_count > 0)
		  strcat (cores_str, ",");
	      }

	  xfree (cores);

	  buffer_xml_printf
	    (buffer,
	     "<item>"
	     "<column name=\"pid\">%lld</column>"
	     "<column name=\"user\">%s</column>"
	     "<column name=\"command\">%s</column>"
	     "<column name=\"cores\">%s</column>"
	     "</item>",
	     pid,
	     user,
	     command_line ? command_line : "",
	     cores_str);

	  xfree (command_line);
	  xfree (cores_str);
	}

      closedir (dirp);
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* A simple PID/PGID pair.  */

struct pid_pgid_entry
{
  pid_pgid_entry (PID_T pid_, PID_T pgid_)
  : pid (pid_), pgid (pgid_)
  {}

  /* Return true if this pid is the leader of its process group.  */

  bool is_leader () const
  {
    return pid == pgid;
  }

  bool operator< (const pid_pgid_entry &other) const
  {
    /* Sort by PGID.  */
    if (this->pgid != other.pgid)
      return this->pgid < other.pgid;

    /* Process group leaders always come first...  */
    if (this->is_leader ())
      {
	if (!other.is_leader ())
	  return true;
      }
    else if (other.is_leader ())
      return false;

    /* ...else sort by PID.  */
    return this->pid < other.pid;
  }

  PID_T pid, pgid;
};

/* Collect all process groups from /proc in BUFFER.  */

static void
linux_xfer_osdata_processgroups (struct buffer *buffer)
{
  DIR *dirp;

  buffer_grow_str (buffer, "<osdata type=\"process groups\">\n");

  dirp = opendir ("/proc");
  if (dirp)
    {
      std::vector<pid_pgid_entry> process_list;
      struct dirent *dp;

      process_list.reserve (512);

      /* Build list consisting of PIDs followed by their
	 associated PGID.  */
      while ((dp = readdir (dirp)) != NULL)
	{
	  PID_T pid, pgid;

	  if (!isdigit (dp->d_name[0])
	      || NAMELEN (dp) > MAX_PID_T_STRLEN)
	    continue;

	  sscanf (dp->d_name, "%lld", &pid);
	  pgid = getpgid (pid);

	  if (pgid > 0)
	    process_list.emplace_back (pid, pgid);
	}

      closedir (dirp);

      /* Sort the process list.  */
      std::sort (process_list.begin (), process_list.end ());

      for (const pid_pgid_entry &entry : process_list)
	{
	  PID_T pid = entry.pid;
	  PID_T pgid = entry.pgid;
	  char leader_command[32];
	  char *command_line;

	  command_from_pid (leader_command, sizeof (leader_command), pgid);
	  command_line = commandline_from_pid (pid);

	  buffer_xml_printf
	    (buffer,
	     "<item>"
	     "<column name=\"pgid\">%lld</column>"
	     "<column name=\"leader command\">%s</column>"
	     "<column name=\"pid\">%lld</column>"
	     "<column name=\"command line\">%s</column>"
	     "</item>",
	     pgid,
	     leader_command,
	     pid,
	     command_line ? command_line : "");

	  xfree (command_line);
	}
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Collect all the threads in /proc by iterating through processes and
   then tasks within each process in BUFFER.  */

static void
linux_xfer_osdata_threads (struct buffer *buffer)
{
  DIR *dirp;

  buffer_grow_str (buffer, "<osdata type=\"threads\">\n");

  dirp = opendir ("/proc");
  if (dirp)
    {
      struct dirent *dp;

      while ((dp = readdir (dirp)) != NULL)
	{
	  struct stat statbuf;
	  char procentry[sizeof ("/proc/4294967295")];

	  if (!isdigit (dp->d_name[0])
	      || NAMELEN (dp) > sizeof ("4294967295") - 1)
	    continue;

	  xsnprintf (procentry, sizeof (procentry), "/proc/%s",
		     dp->d_name);
	  if (stat (procentry, &statbuf) == 0
	      && S_ISDIR (statbuf.st_mode))
	    {
	      DIR *dirp2;
	      PID_T pid;
	      char command[32];

	      std::string pathname
		= string_printf ("/proc/%s/task", dp->d_name);

	      pid = atoi (dp->d_name);
	      command_from_pid (command, sizeof (command), pid);

	      dirp2 = opendir (pathname.c_str ());

	      if (dirp2)
		{
		  struct dirent *dp2;

		  while ((dp2 = readdir (dirp2)) != NULL)
		    {
		      PID_T tid;
		      int core;

		      if (!isdigit (dp2->d_name[0])
			  || NAMELEN (dp2) > sizeof ("4294967295") - 1)
			continue;

		      tid = atoi (dp2->d_name);
		      core = linux_common_core_of_thread (ptid_t (pid, tid, 0));

		      buffer_xml_printf
			(buffer,
			 "<item>"
			 "<column name=\"pid\">%lld</column>"
			 "<column name=\"command\">%s</column>"
			 "<column name=\"tid\">%lld</column>"
			 "<column name=\"core\">%d</column>"
			 "</item>",
			 pid,
			 command,
			 tid,
			 core);
		    }

		  closedir (dirp2);
		}
	    }
	}

      closedir (dirp);
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Collect data about the cpus/cores on the system in BUFFER.  */

static void
linux_xfer_osdata_cpus (struct buffer *buffer)
{
  int first_item = 1;

  buffer_grow_str (buffer, "<osdata type=\"cpus\">\n");

  gdb_file_up fp = gdb_fopen_cloexec ("/proc/cpuinfo", "r");
  if (fp != NULL)
    {
      char buf[8192];

      do
	{
	  if (fgets (buf, sizeof (buf), fp.get ()))
	    {
	      char *key, *value;
	      int i = 0;

	      char *saveptr;
	      key = strtok_r (buf, ":", &saveptr);
	      if (key == NULL)
		continue;

	      value = strtok_r (NULL, ":", &saveptr);
	      if (value == NULL)
		continue;

	      while (key[i] != '\t' && key[i] != '\0')
		i++;

	      key[i] = '\0';

	      i = 0;
	      while (value[i] != '\t' && value[i] != '\0')
		i++;

	      value[i] = '\0';

	      if (strcmp (key, "processor") == 0)
		{
		  if (first_item)
		    buffer_grow_str (buffer, "<item>");
		  else
		    buffer_grow_str (buffer, "</item><item>");

		  first_item = 0;
		}

	      buffer_xml_printf (buffer,
				 "<column name=\"%s\">%s</column>",
				 key,
				 value);
	    }
	}
      while (!feof (fp.get ()));

      if (first_item == 0)
	buffer_grow_str (buffer, "</item>");
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Collect all the open file descriptors found in /proc and put the details
   found about them into BUFFER.  */

static void
linux_xfer_osdata_fds (struct buffer *buffer)
{
  DIR *dirp;

  buffer_grow_str (buffer, "<osdata type=\"files\">\n");

  dirp = opendir ("/proc");
  if (dirp)
    {
      struct dirent *dp;

      while ((dp = readdir (dirp)) != NULL)
	{
	  struct stat statbuf;
	  char procentry[sizeof ("/proc/4294967295")];

	  if (!isdigit (dp->d_name[0])
	      || NAMELEN (dp) > sizeof ("4294967295") - 1)
	    continue;

	  xsnprintf (procentry, sizeof (procentry), "/proc/%s",
		     dp->d_name);
	  if (stat (procentry, &statbuf) == 0
	      && S_ISDIR (statbuf.st_mode))
	    {
	      DIR *dirp2;
	      PID_T pid;
	      char command[32];

	      pid = atoi (dp->d_name);
	      command_from_pid (command, sizeof (command), pid);

	      std::string pathname
		= string_printf ("/proc/%s/fd", dp->d_name);
	      dirp2 = opendir (pathname.c_str ());

	      if (dirp2)
		{
		  struct dirent *dp2;

		  while ((dp2 = readdir (dirp2)) != NULL)
		    {
		      char buf[1000];
		      ssize_t rslt;

		      if (!isdigit (dp2->d_name[0]))
			continue;

		      std::string fdname
			= string_printf ("%s/%s", pathname.c_str (),
					 dp2->d_name);
		      rslt = readlink (fdname.c_str (), buf,
				       sizeof (buf) - 1);
		      if (rslt >= 0)
			buf[rslt] = '\0';

		      buffer_xml_printf
			(buffer,
			 "<item>"
			 "<column name=\"pid\">%s</column>"
			 "<column name=\"command\">%s</column>"
			 "<column name=\"file descriptor\">%s</column>"
			 "<column name=\"name\">%s</column>"
			 "</item>",
			 dp->d_name,
			 command,
			 dp2->d_name,
			 (rslt >= 0 ? buf : dp2->d_name));
		    }

		  closedir (dirp2);
		}
	    }
	}

      closedir (dirp);
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Returns the socket state STATE in textual form.  */

static const char *
format_socket_state (unsigned char state)
{
  /* Copied from include/net/tcp_states.h in the Linux kernel sources.  */
  enum {
    TCP_ESTABLISHED = 1,
    TCP_SYN_SENT,
    TCP_SYN_RECV,
    TCP_FIN_WAIT1,
    TCP_FIN_WAIT2,
    TCP_TIME_WAIT,
    TCP_CLOSE,
    TCP_CLOSE_WAIT,
    TCP_LAST_ACK,
    TCP_LISTEN,
    TCP_CLOSING
  };

  switch (state)
    {
    case TCP_ESTABLISHED:
      return "ESTABLISHED";
    case TCP_SYN_SENT:
      return "SYN_SENT";
    case TCP_SYN_RECV:
      return "SYN_RECV";
    case TCP_FIN_WAIT1:
      return "FIN_WAIT1";
    case TCP_FIN_WAIT2:
      return "FIN_WAIT2";
    case TCP_TIME_WAIT:
      return "TIME_WAIT";
    case TCP_CLOSE:
      return "CLOSE";
    case TCP_CLOSE_WAIT:
      return "CLOSE_WAIT";
    case TCP_LAST_ACK:
      return "LAST_ACK";
    case TCP_LISTEN:
      return "LISTEN";
    case TCP_CLOSING:
      return "CLOSING";
    default:
      return "(unknown)";
    }
}

union socket_addr
  {
    struct sockaddr sa;
    struct sockaddr_in sin;
    struct sockaddr_in6 sin6;
  };

/* Auxiliary function used by linux_xfer_osdata_isocket.  Formats
   information for all open internet sockets of type FAMILY on the
   system into BUFFER.  If TCP is set, only TCP sockets are processed,
   otherwise only UDP sockets are processed.  */

static void
print_sockets (unsigned short family, int tcp, struct buffer *buffer)
{
  const char *proc_file;

  if (family == AF_INET)
    proc_file = tcp ? "/proc/net/tcp" : "/proc/net/udp";
  else if (family == AF_INET6)
    proc_file = tcp ? "/proc/net/tcp6" : "/proc/net/udp6";
  else
    return;

  gdb_file_up fp = gdb_fopen_cloexec (proc_file, "r");
  if (fp)
    {
      char buf[8192];

      do
	{
	  if (fgets (buf, sizeof (buf), fp.get ()))
	    {
	      uid_t uid;
	      unsigned int local_port, remote_port, state;
	      char local_address[NI_MAXHOST], remote_address[NI_MAXHOST];
	      int result;

#if NI_MAXHOST <= 32
#error "local_address and remote_address buffers too small"
#endif

	      result = sscanf (buf,
			       "%*d: %32[0-9A-F]:%X %32[0-9A-F]:%X %X %*X:%*X %*X:%*X %*X %d %*d %*u %*s\n",
			       local_address, &local_port,
			       remote_address, &remote_port,
			       &state,
			       &uid);

	      if (result == 6)
		{
		  union socket_addr locaddr, remaddr;
		  size_t addr_size;
		  char user[UT_NAMESIZE];
		  char local_service[NI_MAXSERV], remote_service[NI_MAXSERV];

		  if (family == AF_INET)
		    {
		      sscanf (local_address, "%X",
			      &locaddr.sin.sin_addr.s_addr);
		      sscanf (remote_address, "%X",
			      &remaddr.sin.sin_addr.s_addr);

		      locaddr.sin.sin_port = htons (local_port);
		      remaddr.sin.sin_port = htons (remote_port);

		      addr_size = sizeof (struct sockaddr_in);
		    }
		  else
		    {
		      sscanf (local_address, "%8X%8X%8X%8X",
			      locaddr.sin6.sin6_addr.s6_addr32,
			      locaddr.sin6.sin6_addr.s6_addr32 + 1,
			      locaddr.sin6.sin6_addr.s6_addr32 + 2,
			      locaddr.sin6.sin6_addr.s6_addr32 + 3);
		      sscanf (remote_address, "%8X%8X%8X%8X",
			      remaddr.sin6.sin6_addr.s6_addr32,
			      remaddr.sin6.sin6_addr.s6_addr32 + 1,
			      remaddr.sin6.sin6_addr.s6_addr32 + 2,
			      remaddr.sin6.sin6_addr.s6_addr32 + 3);

		      locaddr.sin6.sin6_port = htons (local_port);
		      remaddr.sin6.sin6_port = htons (remote_port);

		      locaddr.sin6.sin6_flowinfo = 0;
		      remaddr.sin6.sin6_flowinfo = 0;
		      locaddr.sin6.sin6_scope_id = 0;
		      remaddr.sin6.sin6_scope_id = 0;

		      addr_size = sizeof (struct sockaddr_in6);
		    }

		  locaddr.sa.sa_family = remaddr.sa.sa_family = family;

		  result = getnameinfo (&locaddr.sa, addr_size,
					local_address, sizeof (local_address),
					local_service, sizeof (local_service),
					NI_NUMERICHOST | NI_NUMERICSERV
					| (tcp ? 0 : NI_DGRAM));
		  if (result)
		    continue;

		  result = getnameinfo (&remaddr.sa, addr_size,
					remote_address,
					sizeof (remote_address),
					remote_service,
					sizeof (remote_service),
					NI_NUMERICHOST | NI_NUMERICSERV
					| (tcp ? 0 : NI_DGRAM));
		  if (result)
		    continue;

		  user_from_uid (user, sizeof (user), uid);

		  buffer_xml_printf (
		      buffer,
		      "<item>"
		      "<column name=\"local address\">%s</column>"
		      "<column name=\"local port\">%s</column>"
		      "<column name=\"remote address\">%s</column>"
		      "<column name=\"remote port\">%s</column>"
		      "<column name=\"state\">%s</column>"
		      "<column name=\"user\">%s</column>"
		      "<column name=\"family\">%s</column>"
		      "<column name=\"protocol\">%s</column>"
		      "</item>",
		      local_address,
		      local_service,
		      remote_address,
		      remote_service,
		      format_socket_state (state),
		      user,
		      (family == AF_INET) ? "INET" : "INET6",
		      tcp ? "STREAM" : "DGRAM");
		}
	    }
	}
      while (!feof (fp.get ()));
    }
}

/* Collect data about internet sockets and write it into BUFFER.  */

static void
linux_xfer_osdata_isockets (struct buffer *buffer)
{
  buffer_grow_str (buffer, "<osdata type=\"I sockets\">\n");

  print_sockets (AF_INET, 1, buffer);
  print_sockets (AF_INET, 0, buffer);
  print_sockets (AF_INET6, 1, buffer);
  print_sockets (AF_INET6, 0, buffer);

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Converts the time SECONDS into textual form and copies it into a
   buffer TIME, with at most MAXLEN characters copied.  */

static void
time_from_time_t (char *time, int maxlen, TIME_T seconds)
{
  if (!seconds)
    time[0] = '\0';
  else
    {
      time_t t = (time_t) seconds;

      /* Per the ctime_r manpage, this buffer needs to be at least 26
         characters long.  */
      char buf[30];
      const char *time_str = ctime_r (&t, buf);
      strncpy (time, time_str, maxlen);
      time[maxlen - 1] = '\0';
    }
}

/* Finds the group name for the group GID and copies it into GROUP.
   At most MAXLEN characters are copied.  */

static void
group_from_gid (char *group, int maxlen, gid_t gid)
{
  struct group *grentry = getgrgid (gid);

  if (grentry)
    {
      strncpy (group, grentry->gr_name, maxlen);
      /* Ensure that the group name is null-terminated.  */
      group[maxlen - 1] = '\0';
    }
  else
    group[0] = '\0';
}

/* Collect data about shared memory recorded in /proc and write it
   into BUFFER.  */

static void
linux_xfer_osdata_shm (struct buffer *buffer)
{
  buffer_grow_str (buffer, "<osdata type=\"shared memory\">\n");

  gdb_file_up fp = gdb_fopen_cloexec ("/proc/sysvipc/shm", "r");
  if (fp)
    {
      char buf[8192];

      do
	{
	  if (fgets (buf, sizeof (buf), fp.get ()))
	    {
	      key_t key;
	      uid_t uid, cuid;
	      gid_t gid, cgid;
	      PID_T cpid, lpid;
	      int shmid, size, nattch;
	      TIME_T atime, dtime, ctime;
	      unsigned int perms;
	      int items_read;

	      items_read = sscanf (buf,
				   "%d %d %o %d %lld %lld %d %u %u %u %u %lld %lld %lld",
				   &key, &shmid, &perms, &size,
				   &cpid, &lpid,
				   &nattch,
				   &uid, &gid, &cuid, &cgid,
				   &atime, &dtime, &ctime);

	      if (items_read == 14)
		{
		  char user[UT_NAMESIZE], group[UT_NAMESIZE];
		  char cuser[UT_NAMESIZE], cgroup[UT_NAMESIZE];
		  char ccmd[32], lcmd[32];
		  char atime_str[32], dtime_str[32], ctime_str[32];

		  user_from_uid (user, sizeof (user), uid);
		  group_from_gid (group, sizeof (group), gid);
		  user_from_uid (cuser, sizeof (cuser), cuid);
		  group_from_gid (cgroup, sizeof (cgroup), cgid);

		  command_from_pid (ccmd, sizeof (ccmd), cpid);
		  command_from_pid (lcmd, sizeof (lcmd), lpid);

		  time_from_time_t (atime_str, sizeof (atime_str), atime);
		  time_from_time_t (dtime_str, sizeof (dtime_str), dtime);
		  time_from_time_t (ctime_str, sizeof (ctime_str), ctime);

		  buffer_xml_printf
		    (buffer,
		     "<item>"
		     "<column name=\"key\">%d</column>"
		     "<column name=\"shmid\">%d</column>"
		     "<column name=\"permissions\">%o</column>"
		     "<column name=\"size\">%d</column>"
		     "<column name=\"creator command\">%s</column>"
		     "<column name=\"last op. command\">%s</column>"
		     "<column name=\"num attached\">%d</column>"
		     "<column name=\"user\">%s</column>"
		     "<column name=\"group\">%s</column>"
		     "<column name=\"creator user\">%s</column>"
		     "<column name=\"creator group\">%s</column>"
		     "<column name=\"last shmat() time\">%s</column>"
		     "<column name=\"last shmdt() time\">%s</column>"
		     "<column name=\"last shmctl() time\">%s</column>"
		     "</item>",
		     key,
		     shmid,
		     perms,
		     size,
		     ccmd,
		     lcmd,
		     nattch,
		     user,
		     group,
		     cuser,
		     cgroup,
		     atime_str,
		     dtime_str,
		     ctime_str);
		}
	    }
	}
      while (!feof (fp.get ()));
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Collect data about semaphores recorded in /proc and write it
   into BUFFER.  */

static void
linux_xfer_osdata_sem (struct buffer *buffer)
{
  buffer_grow_str (buffer, "<osdata type=\"semaphores\">\n");

  gdb_file_up fp = gdb_fopen_cloexec ("/proc/sysvipc/sem", "r");
  if (fp)
    {
      char buf[8192];

      do
	{
	  if (fgets (buf, sizeof (buf), fp.get ()))
	    {
	      key_t key;
	      uid_t uid, cuid;
	      gid_t gid, cgid;
	      unsigned int perms, nsems;
	      int semid;
	      TIME_T otime, ctime;
	      int items_read;

	      items_read = sscanf (buf,
				   "%d %d %o %u %d %d %d %d %lld %lld",
				   &key, &semid, &perms, &nsems,
				   &uid, &gid, &cuid, &cgid,
				   &otime, &ctime);

	      if (items_read == 10)
		{
		  char user[UT_NAMESIZE], group[UT_NAMESIZE];
		  char cuser[UT_NAMESIZE], cgroup[UT_NAMESIZE];
		  char otime_str[32], ctime_str[32];

		  user_from_uid (user, sizeof (user), uid);
		  group_from_gid (group, sizeof (group), gid);
		  user_from_uid (cuser, sizeof (cuser), cuid);
		  group_from_gid (cgroup, sizeof (cgroup), cgid);

		  time_from_time_t (otime_str, sizeof (otime_str), otime);
		  time_from_time_t (ctime_str, sizeof (ctime_str), ctime);

		  buffer_xml_printf
		    (buffer,
		     "<item>"
		     "<column name=\"key\">%d</column>"
		     "<column name=\"semid\">%d</column>"
		     "<column name=\"permissions\">%o</column>"
		     "<column name=\"num semaphores\">%u</column>"
		     "<column name=\"user\">%s</column>"
		     "<column name=\"group\">%s</column>"
		     "<column name=\"creator user\">%s</column>"
		     "<column name=\"creator group\">%s</column>"
		     "<column name=\"last semop() time\">%s</column>"
		     "<column name=\"last semctl() time\">%s</column>"
		     "</item>",
		     key,
		     semid,
		     perms,
		     nsems,
		     user,
		     group,
		     cuser,
		     cgroup,
		     otime_str,
		     ctime_str);
		}
	    }
	}
      while (!feof (fp.get ()));
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Collect data about message queues recorded in /proc and write it
   into BUFFER.  */

static void
linux_xfer_osdata_msg (struct buffer *buffer)
{
  buffer_grow_str (buffer, "<osdata type=\"message queues\">\n");

  gdb_file_up fp = gdb_fopen_cloexec ("/proc/sysvipc/msg", "r");
  if (fp)
    {
      char buf[8192];

      do
	{
	  if (fgets (buf, sizeof (buf), fp.get ()))
	    {
	      key_t key;
	      PID_T lspid, lrpid;
	      uid_t uid, cuid;
	      gid_t gid, cgid;
	      unsigned int perms, cbytes, qnum;
	      int msqid;
	      TIME_T stime, rtime, ctime;
	      int items_read;

	      items_read = sscanf (buf,
				   "%d %d %o %u %u %lld %lld %d %d %d %d %lld %lld %lld",
				   &key, &msqid, &perms, &cbytes, &qnum,
				   &lspid, &lrpid, &uid, &gid, &cuid, &cgid,
				   &stime, &rtime, &ctime);

	      if (items_read == 14)
		{
		  char user[UT_NAMESIZE], group[UT_NAMESIZE];
		  char cuser[UT_NAMESIZE], cgroup[UT_NAMESIZE];
		  char lscmd[32], lrcmd[32];
		  char stime_str[32], rtime_str[32], ctime_str[32];

		  user_from_uid (user, sizeof (user), uid);
		  group_from_gid (group, sizeof (group), gid);
		  user_from_uid (cuser, sizeof (cuser), cuid);
		  group_from_gid (cgroup, sizeof (cgroup), cgid);

		  command_from_pid (lscmd, sizeof (lscmd), lspid);
		  command_from_pid (lrcmd, sizeof (lrcmd), lrpid);

		  time_from_time_t (stime_str, sizeof (stime_str), stime);
		  time_from_time_t (rtime_str, sizeof (rtime_str), rtime);
		  time_from_time_t (ctime_str, sizeof (ctime_str), ctime);

		  buffer_xml_printf
		    (buffer,
		     "<item>"
		     "<column name=\"key\">%d</column>"
		     "<column name=\"msqid\">%d</column>"
		     "<column name=\"permissions\">%o</column>"
		     "<column name=\"num used bytes\">%u</column>"
		     "<column name=\"num messages\">%u</column>"
		     "<column name=\"last msgsnd() command\">%s</column>"
		     "<column name=\"last msgrcv() command\">%s</column>"
		     "<column name=\"user\">%s</column>"
		     "<column name=\"group\">%s</column>"
		     "<column name=\"creator user\">%s</column>"
		     "<column name=\"creator group\">%s</column>"
		     "<column name=\"last msgsnd() time\">%s</column>"
		     "<column name=\"last msgrcv() time\">%s</column>"
		     "<column name=\"last msgctl() time\">%s</column>"
		     "</item>",
		     key,
		     msqid,
		     perms,
		     cbytes,
		     qnum,
		     lscmd,
		     lrcmd,
		     user,
		     group,
		     cuser,
		     cgroup,
		     stime_str,
		     rtime_str,
		     ctime_str);
		}
	    }
	}
      while (!feof (fp.get ()));
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

/* Collect data about loaded kernel modules and write it into
   BUFFER.  */

static void
linux_xfer_osdata_modules (struct buffer *buffer)
{
  buffer_grow_str (buffer, "<osdata type=\"modules\">\n");

  gdb_file_up fp = gdb_fopen_cloexec ("/proc/modules", "r");
  if (fp)
    {
      char buf[8192];

      do
	{
	  if (fgets (buf, sizeof (buf), fp.get ()))
	    {
	      char *name, *dependencies, *status, *tmp, *saveptr;
	      unsigned int size;
	      unsigned long long address;
	      int uses;

	      name = strtok_r (buf, " ", &saveptr);
	      if (name == NULL)
		continue;

	      tmp = strtok_r (NULL, " ", &saveptr);
	      if (tmp == NULL)
		continue;
	      if (sscanf (tmp, "%u", &size) != 1)
		continue;

	      tmp = strtok_r (NULL, " ", &saveptr);
	      if (tmp == NULL)
		continue;
	      if (sscanf (tmp, "%d", &uses) != 1)
		continue;

	      dependencies = strtok_r (NULL, " ", &saveptr);
	      if (dependencies == NULL)
		continue;

	      status = strtok_r (NULL, " ", &saveptr);
	      if (status == NULL)
		continue;

	      tmp = strtok_r (NULL, "\n", &saveptr);
	      if (tmp == NULL)
		continue;
	      if (sscanf (tmp, "%llx", &address) != 1)
		continue;

	      buffer_xml_printf (buffer,
				 "<item>"
				 "<column name=\"name\">%s</column>"
				 "<column name=\"size\">%u</column>"
				 "<column name=\"num uses\">%d</column>"
				 "<column name=\"dependencies\">%s</column>"
				 "<column name=\"status\">%s</column>"
				 "<column name=\"address\">%llx</column>"
				 "</item>",
				 name,
				 size,
				 uses,
				 dependencies,
				 status,
				 address);
	    }
	}
      while (!feof (fp.get ()));
    }

  buffer_grow_str0 (buffer, "</osdata>\n");
}

static void linux_xfer_osdata_info_os_types (struct buffer *buffer);

struct osdata_type {
  const char *type;
  const char *title;
  const char *description;
  void (*take_snapshot) (struct buffer *buffer);
  LONGEST len_avail;
  struct buffer buffer;
} osdata_table[] = {
  { "types", "Types", "Listing of info os types you can list",
    linux_xfer_osdata_info_os_types, -1 },
  { "cpus", "CPUs", "Listing of all cpus/cores on the system",
    linux_xfer_osdata_cpus, -1 },
  { "files", "File descriptors", "Listing of all file descriptors",
    linux_xfer_osdata_fds, -1 },
  { "modules", "Kernel modules", "Listing of all loaded kernel modules",
    linux_xfer_osdata_modules, -1 },
  { "msg", "Message queues", "Listing of all message queues",
    linux_xfer_osdata_msg, -1 },
  { "processes", "Processes", "Listing of all processes",
    linux_xfer_osdata_processes, -1 },
  { "procgroups", "Process groups", "Listing of all process groups",
    linux_xfer_osdata_processgroups, -1 },
  { "semaphores", "Semaphores", "Listing of all semaphores",
    linux_xfer_osdata_sem, -1 },
  { "shm", "Shared-memory regions", "Listing of all shared-memory regions",
    linux_xfer_osdata_shm, -1 },
  { "sockets", "Sockets", "Listing of all internet-domain sockets",
    linux_xfer_osdata_isockets, -1 },
  { "threads", "Threads", "Listing of all threads",
  linux_xfer_osdata_threads, -1 },
  { NULL, NULL, NULL }
};

/* Collect data about all types info os can show in BUFFER.  */

static void
linux_xfer_osdata_info_os_types (struct buffer *buffer)
{
  buffer_grow_str (buffer, "<osdata type=\"types\">\n");

  /* Start the below loop at 1, as we do not want to list ourselves.  */
  for (int i = 1; osdata_table[i].type; ++i)
    buffer_xml_printf (buffer,
		       "<item>"
		       "<column name=\"Type\">%s</column>"
		       "<column name=\"Description\">%s</column>"
		       "<column name=\"Title\">%s</column>"
		       "</item>",
		       osdata_table[i].type,
		       osdata_table[i].description,
		       osdata_table[i].title);

  buffer_grow_str0 (buffer, "</osdata>\n");
}


/*  Copies up to LEN bytes in READBUF from offset OFFSET in OSD->BUFFER.
    If OFFSET is zero, first calls OSD->TAKE_SNAPSHOT.  */

static LONGEST
common_getter (struct osdata_type *osd,
	       gdb_byte *readbuf, ULONGEST offset, ULONGEST len)
{
  gdb_assert (readbuf);

  if (offset == 0)
    {
      if (osd->len_avail != -1 && osd->len_avail != 0)
	buffer_free (&osd->buffer);
      osd->len_avail = 0;
      buffer_init (&osd->buffer);
      (osd->take_snapshot) (&osd->buffer);
      osd->len_avail = strlen (osd->buffer.buffer);
    }
  if (offset >= osd->len_avail)
    {
      /* Done.  Get rid of the buffer.  */
      buffer_free (&osd->buffer);
      osd->len_avail = 0;
      return 0;
    }
  if (len > osd->len_avail - offset)
    len = osd->len_avail - offset;
  memcpy (readbuf, osd->buffer.buffer + offset, len);

  return len;

}

LONGEST
linux_common_xfer_osdata (const char *annex, gdb_byte *readbuf,
			  ULONGEST offset, ULONGEST len)
{
  if (!annex || *annex == '\0')
    {
      return common_getter (&osdata_table[0],
			    readbuf, offset, len);
    }
  else
    {
      int i;

      for (i = 0; osdata_table[i].type; ++i)
	{
	  if (strcmp (annex, osdata_table[i].type) == 0)
	    return common_getter (&osdata_table[i],
				  readbuf, offset, len);
	}

      return 0;
    }
}
