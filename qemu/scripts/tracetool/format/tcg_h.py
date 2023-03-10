# -*- coding: utf-8 -*-

"""
Generate .h file for TCG code generation.
"""

__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
__copyright__  = "Copyright 2012-2017, Lluís Vilanova <vilanova@ac.upc.edu>"
__license__    = "GPL version 2 or (at your option) any later version"

__maintainer__ = "Stefan Hajnoczi"
__email__      = "stefanha@redhat.com"


from tracetool import out, Arguments
import tracetool.vcpu


def vcpu_transform_args(args):
    assert len(args) == 1
    return Arguments([
        args,
        # NOTE: this name must be kept in sync with the one in "tcg_h"
        # NOTE: Current helper code uses TCGv_env (CPUArchState*)
        ("TCGv_env", "__tcg_" + args.names()[0]),
    ])


def generate(events, backend, group):
    if group == "root":
        header = "trace/trace-root.h"
    else:
        header = "trace.h"

    out('/* This file is autogenerated by tracetool, do not edit. */',
        '/* You must include this file after the inclusion of helper.h */',
        '',
        '#ifndef TRACE_%s_GENERATED_TCG_TRACERS_H' % group.upper(),
        '#define TRACE_%s_GENERATED_TCG_TRACERS_H' % group.upper(),
        '',
        '#include "exec/helper-proto.h"',
        '#include "%s"' % header,
        '',
        )

    for e in events:
        # just keep one of them
        if "tcg-exec" not in e.properties:
            continue

        out('static inline void %(name_tcg)s(%(args)s)',
            '{',
            name_tcg=e.original.api(e.QEMU_TRACE_TCG),
            args=tracetool.vcpu.transform_args("tcg_h", e.original))

        if "disable" not in e.properties:
            args_trans = e.original.event_trans.args
            args_exec = tracetool.vcpu.transform_args(
                "tcg_helper_c", e.original.event_exec, "wrapper")
            if "vcpu" in e.properties:
                trace_cpu = e.args.names()[0]
                cond = "trace_event_get_vcpu_state(%(cpu)s,"\
                       " TRACE_%(id)s)"\
                       % dict(
                           cpu=trace_cpu,
                           id=e.original.event_exec.name.upper())
            else:
                cond = "true"

            out('    %(name_trans)s(%(argnames_trans)s);',
                '    if (%(cond)s) {',
                '        gen_helper_%(name_exec)s(%(argnames_exec)s);',
                '    }',
                name_trans=e.original.event_trans.api(e.QEMU_TRACE),
                name_exec=e.original.event_exec.api(e.QEMU_TRACE),
                argnames_trans=", ".join(args_trans.names()),
                argnames_exec=", ".join(args_exec.names()),
                cond=cond)

        out('}')

    out('',
        '#endif /* TRACE_%s_GENERATED_TCG_TRACERS_H */' % group.upper())
