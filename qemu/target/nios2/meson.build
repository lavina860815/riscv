nios2_ss = ss.source_set()
nios2_ss.add(files(
  'cpu.c',
  'helper.c',
  'mmu.c',
  'nios2-semi.c',
  'op_helper.c',
  'translate.c',
))

nios2_softmmu_ss = ss.source_set()
nios2_softmmu_ss.add(files('monitor.c'))

target_arch += {'nios2': nios2_ss}
target_softmmu_arch += {'nios2': nios2_softmmu_ss}
