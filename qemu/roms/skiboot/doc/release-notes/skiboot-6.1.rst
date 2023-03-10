.. _skiboot-6.1:

skiboot-6.1
===========

skiboot v6.1 was released on Wednesday July 11th 2018. It is the first
release of skiboot 6.1, which is the new stable release of skiboot
following the 6.0 release, first released May 11th 2018.

Skiboot 6.1 is the basis for op-build v2.1 and contains all bug fixes as
of :ref:`skiboot-6.0.5`, and :ref:`skiboot-5.4.9` (the currently maintained
stable releases). We expect further stable releases in the 6.0.x and 5.4.x
series, while we do not expect to do any stable releases of 6.1.x.

This final 6.1 release follows a single release candidate release, as this
cycle we have been rather quiet, with mainly cleanup and bug fix patches
going in.

For how the skiboot stable releases work, see :ref:`stable-rules` for details.

Over skiboot-6.0, we have the following changes:

General changes and bug fixes
-----------------------------

Since :ref:`skiboot-6.1-rc1`:

- slw: Fix trivial typo in debug message
- vpd: Add vendor property to processor node

  Processor FRU vpd doesn't contain vendor detail. We have to parse
  module VPD to get vendor detail.

- vpd: Sanitize VPD data

  On OpenPower system, VPD keyword size tells us the maximum size of the data.
  But they fill trailing end with space (0x20) instead of NULL. Also spec
  doesn't stop user to have space (0x20) within actual data.

  This patch discards trailing spaces before populating device tree.
- core: always flush console before stopping

  This catches a few cases (e.g., fast reboot failure messages) that
  don't always make it to the console before the machine is rebooted.
- core/cpu: parallelise global CPU register setting jobs

  On a 176 thread system, before: ::

    [  122.319923233,5] OPAL: Switch to big-endian OS
    [  126.317897467,5] OPAL: Switch to little-endian OS

  after: ::

    [  212.439299889,5] OPAL: Switch to big-endian OS
    [  212.469323643,5] OPAL: Switch to little-endian OS
- init, occ: Initialise OCC earlier on BMC systems

  We need to use the OCC to obtain presence data for the SXM2 slots on
  Witherspoon systems. This is needed to determine device type for NVLink
  GPUs and OpenCAPI devices which can be plugged into the same slot. Support
  for this will be implemented in a future patch.

  Currently, OCC initialisation is done just before handing over to Linux,
  which is well after NPU probe. On FSP systems, OCC boot starts very late,
  so we wait until the last possible moment to initialise the skiboot side in
  order to give it the maximum time to boot. On BMC systems, OCC boot starts
  earlier, so there aren't any issues in moving it earlier in the skiboot
  init sequence.

  When running on a BMC machine, call occ_pstates_init() as early as
  possible in the init sequence. On FSP machines, continue to call it from
  its current location.

Since :ref:`skiboot-6.0`:

- GCC8 build fixes
- Add prepare_hbrt_update to hbrt interfaces

  Add placeholder support for prepare_hbrt_update call into
  hostboot runtime (opal-prd) code.  This interface is only
  called as part of a concurrent code update on a FSP based
  system.
- cpu: Clear PCR SPR in opal_reinit_cpus()

  Currently if Linux boots with a non-zero PCR, things can go bad where
  some early userspace programs can take illegal instructions. This is
  being fixed in Linux, but in the mean time, we should cleanup in
  skiboot also.
- pci: Fix PCI_DEVICE_ID()

  The vendor ID is 16 bits not 8. This error leaves the top of the vendor
  ID in the bottom bits of the device ID, which resulted in e.g. a failure
  to run the PCI quirk for the AST VGA device.
- Quieten console output on boot

  We print out a whole bunch of things on boot, most of which aren't
  interesting, so we should *not* print them instead.

  Printing things like what CPUs we found and what PCI devices we found
  *are* useful, so continue to do that. But we don't need to splat out
  a bunch of things that are always going to be true.
- core/console: fix deadlock when printing with console lock held

  Some debugging options will print while the console lock is held,
  which is why the console lock is taken as a recursive lock.
  However console_write calls __flush_console, which will drop and
  re-take the lock non-recursively in some cases.

  Just set con_need_flush and return from __flush_console if we are
  holding the console lock already.

  This stack usage message (taken with this patch applied) could lead
  to a deadlock without this: ::

    CPU 0000 lowest stack mark 11768 bytes left pc=300cb808 token=0
    CPU 0000 Backtrace:
    S: 0000000031c03370 R: 00000000300cb808   .list_check_node+0x1c
    S: 0000000031c03410 R: 00000000300cb910   .list_check+0x38
    S: 0000000031c034b0 R: 00000000300190ac   .try_lock_caller+0xb8
    S: 0000000031c03540 R: 00000000300192e0   .lock_caller+0x80
    S: 0000000031c03600 R: 0000000030012c70   .__flush_console+0x134
    S: 0000000031c036d0 R: 00000000300130cc   .console_write+0x68
    S: 0000000031c03780 R: 00000000300347bc   .vprlog+0xc8
    S: 0000000031c03970 R: 0000000030034844   ._prlog+0x50
    S: 0000000031c03a00 R: 00000000300364a4   .log_simple_error+0x74
    S: 0000000031c03b90 R: 000000003004ab48   .occ_pstates_init+0x184
    S: 0000000031c03d50 R: 000000003001480c   .load_and_boot_kernel+0x38c
    S: 0000000031c03e30 R: 000000003001571c   .main_cpu_entry+0x62c
    S: 0000000031c03f00 R: 0000000030002700   boot_entry+0x1c0
- opal-prd: Do not error out on first failure for soft/hard offline.

  The memory errors (CEs and UEs) that are detected as part of background
  memory scrubbing are reported by PRD asynchronously to opal-prd along with
  affected memory ranges. hservice_memory_error() converts these ranges into
  page granularity before hooking up them to soft/hard offline-ing
  infrastructure.

  But the current implementation of hservice_memory_error() does not hookup
  all the pages to soft/hard offline-ing if any of the page offline action
  fails. e.g hard offline can fail for:

  - Pages that are not part of buddy managed pool.
  - Pages that are reserved by kernel using memblock_reserved()
  - Pages that are in use by kernel.

  But for the pages that are in use by user space application, the hard
  offline marks the page as hwpoison, sends SIGBUS signal to kill the
  affected application as recovery action and returns success.

  Hence, It is possible that some of the pages in that memory range are in
  use by application or free. By stopping on first error we loose the
  opportunity to hwpoison the subsequent pages which may be free or in use by
  application. This patch fixes this issue.
- libflash/blocklevel_write: Fix missing error handling

  Caught by scan-build, we seem to trap the errors in rc, but
  not take any recovery action during blocklevel_write.

I2C
^^^
- p8-i2c: fix wrong request status when a reset is needed

  If the bus is found in error state when starting a new request, the
  engine is reset and we enter recovery. However, once complete, the
  reset operation shows a status of complete in the status register. So
  any badly-timed called to check_status() will think the current top
  request is complete, even though it hasn't run yet.

  So don't update any request status while we are in recovery, as
  nothing useful for the request is supposed to happen in that state.
- p8-i2c: Remove force reset

  Force reset was added as an attempt to work around some issues with TPM
  devices locking up their I2C bus. In that particular case the problem
  was that the device would hold the SCL line down permanently due to a
  device firmware bug. The force reset doesn't actually do anything to
  alleviate the situation here, it just happens to reset the internal
  master state enough to make the I2C driver appear to work until
  something tries to access the bus again.

  On P9 systems with secure boot enabled there is the added problem
  of the "diagostic mode" not being supported on I2C masters A,B,C and
  D. Diagnostic mode allows the SCL and SDA lines to be driven directly
  by software. Without this force reset is impossible to implement.

  This patch removes the force reset functionality entirely since:

  a) it doesn't do what it's supposed to, and
  b) it's butt ugly code

  Additionally, turn p8_i2c_reset_engine() into p8_i2c_reset_port().
  There's no need to reset every port on a master in response to an
  error that occurred on a specific port.
- libstb/i2c-driver: Bump max timeout

  We have observed some TPMs clock streching the I2C bus for signifigant
  amounts of time when processing commands. The same TPMs also have
  errata that can result in permernantly locking up a bus in response to
  an I2C transaction they don't understand. Using an excessively long
  timeout to prevent this in the field.
- hdata: Add TPM timeout workaround

  Set the default timeout for any bus containing a TPM to one second. This
  is needed to work around a bug in the firmware of certain TPMs that will
  clock strech the I2C port the for up to a second. Additionally, when the
  TPM is clock streching it responds to a STOP condition on the bus by
  bricking itself. Clearing this error requires a hard power cycle of the
  system since the TPM is powered by standby power.
- p8-i2c: Allow a per-port default timeout

  Add support for setting a default timeout for the I2C port to the
  device-tree. This is consumed by skiboot.

IPMI Watchdog
^^^^^^^^^^^^^
- ipmi-watchdog: Support handling re-initialization

  Watchdog resets can return an error code from the BMC indicating that
  the BMC watchdog was not initialized. Currently we abort skiboot due to
  a missing error handler. This patch implements handling
  re-initialization for the watchdog, automatically saving the last
  watchdog set values and re-issuing them if needed.
- ipmi-watchdog: The stop action should disable reset

  Otherwise it is possible for the reset timer to elapse and trigger the
  watchdog to wake back up. This doesn't affect the behavior of the
  system since we are providing a NONE action to the BMC. However we would
  like to avoid the action from taking place if possible.
- ipmi-watchdog: Add a flag to determine if we are still ticking

  This makes it easier for future changes to ensure that the watchdog
  stops ticking and doesn't requeue itself for execution in the
  background. This way it is safe for resets to be performed after the
  ticks are assumed to be stopped and it won't start the timer again.
- ipmi-watchdog: (prepare for) not disabling at shutdown

  The op-build linux kernel has been configured to support the ipmi
  watchdog. This driver will always handle the watchdog by either leaving
  it enabled if configured, or by disabling it during module load if no
  configuration is provided. This increases the coverage of the watchdog
  during the boot process. The watchdog should no longer be disabled at
  any point during skiboot execution.

  We're not enabling this by default yet as people can (and do, at least in
  development) mix and match old BOOTKERNEL with new skiboot and we don't
  want to break that too obviously.
- ipmi-watchdog: Don't reset the watchdog twice

  There is no clarification for why this change was needed, but presumably
  this is due to a buggy BMC implementation where the Watchdog Set command
  was processed concurrently or after the initial Watchdog Reset. This
  inversion would cause the watchdog to stop since the DONT_STOP bit was
  not set. Since we are now using the DONT_STOP bit during initialization,
  the watchdog should not be stopped even if an inversion occurs.
- ipmi-watchdog: Make it possible to set DONT_STOP

  The IPMI standard supports setting a DONT_STOP bit during an Watchdog
  Set operation. Most of the time we don't want to stop the Watchdog when
  updating the settings so we should be using this bit. This patch makes
  it possible for callers of set_wdt to prevent the watchdog from being
  stopped. This only changes the behavior of the watchdog during the
  initial settings update when initializing skiboot. The watchdog is no
  longer disabled and then immediately re-enabled.
- ipmi-watchdog: WD_POWER_CYCLE_ACTION -> WD_RESET_ACTION

  The IPMI specification denotes that action 0x1 is Host Reset and 0x3 is
  Host Power Cycle. Use the correct name for Reset in our watchdog code.


POWER8 platforms
----------------

- astbmc: Enable mbox depending on scratch reg

  P8 boxes can opt in for mbox pnor support if they set the scratch
  register bit to indicate it is supported.

Simulator platforms
-------------------

Since :ref:`skiboot-6.1-rc1`:

- pmem: volatile bindings for the poorly enabled

  PMEM_DISK bindings were added, but they rely on a rather
  recent mmap feature. This patch steals from those bindings
  to add volatile bindings. I've used these bindings with
  PMEM_VOLATILE to launch an instance with the publicly
  available systemsim-p9. The bindings are volatile and one
  should not expect any data to be saved/retrieved.

Since :ref:`skiboot-6.0`:

- plat/qemu: add PNOR support

  To access the PNOR, OPAL/skiboot drives the BMC SPI controller using
  the iLPC2AHB device of the BMC SuperIO controller and accesses the
  flash contents using the LPC FW address space on which the PNOR is
  remapped.

  The QEMU PowerNV machine now integrates such models (SuperIO
  controller, iLPC2AHB device) and also a pseudo Aspeed SoC AHB memory
  space populated with the SPI controller registers (same model as for
  ARM). The AHB window giving access to the contents of the BMC SPI
  controller flash modules is mapped on the LPC FW address space.

  The change should be compatible for machine without PNOR support.
- external/mambo: Add support for readline if it exists

  Add support for tclreadline package if it is present.
  This patch loads the package and uses it when the
  simulation stops for any reason.


FSP based platforms
-------------------

- Disable fast reboot on FSP IPL side change

  If FSP changes next IPL side, then disable fast reboot.

  sample output: ::

      [  620.196442259,5] FSP: Got sysparam update, param ID 0xf0000007
      [  620.196444501,5] CUPD: FW IPL side changed. Disable fast reboot
      [  620.196445389,5] CUPD: Next IPL side : perm
- fsp/console: Always establish OPAL console API backend

  Currently we only call set_opal_console() to establish the backend
  used by the OPAL console API if we find at least one FSP serial
  port in HDAT.

  On systems where there is none (IPMI only), we fail to set it,
  causing the console code to try to use the dummy console causing
  an assertion failure during boot due to clashing on the device-tree
  node names.

  So always set it if an FSP is present

AST BMC based platforms
-----------------------

- AMI BMC: use 0x3a as OEM command

  The 0x3a OEM command is for IBM commands, while 0x32 was for AMI ones.
  Sometime in the P8 timeframe, AMI BMCs were changed to listen for our
  commands on either 0x32 or 0x3a. Since 0x3a is the direction forward,
  we'll use that, as P9 machines with AMI BMCs probably also want these
  to work, and let's not bet that 0x32 will continue to be okay.
- astbmc: Set romulus BMC type to OpenBMC
- platform/astbmc: Do not delete compatible property

  P9 onwards OPAL is building device tree for BMC based system using
  HDAT. We are populating bmc/compatible node with bmc version. Hence
  do not delete this property.

Utilities
---------
- external/xscom-utils: Add python library for xscom access

  Patch adds a simple python library module for xscom access.
  It directly manipulate the '/access' file for scom read
  and write from debugfs 'scom' directory.

  Example on how to generate a getscom using this module:

  .. code-block:: python

     from adu_scoms import *
     getscom = GetSCom()
     getscom.parse_args()
     getscom.run_command()

  Sample output for above getscom.py:

  .. code-block:: console

    # ./getscom.py -l
    Chip ID  | Rev   | Chip type
    ---------|-------|-----------
    00000008 | DD2.0 | P9 (Nimbus) processor
    00000000 | DD2.0 | P9 (Nimbus) processor
- ffspart: Don't require user to create blank partitions manually

  Add '--allow-empty' which allows the filename for a given partition to
  be blank. If set ffspart will set that part of the PNOR file 'blank' and
  set ECC bits if required.
  Without this option behaviour is unchanged and ffspart will return an
  error if it can not find the partition file.
- pflash: Use correct prefix when installing

  pflash uses lowercase prefix when running make install in it's
  direcetory, but uppercase PREFIX when running it in shared. Use
  lowercase everywhere.

  With this the OpenBMC bitbake recipie can drop an out of tree patch it's
  been carrying for years.


POWER9
------

Since :ref:`skiboot-6.1-rc1`:

- occ: sensors: Fix the size of the phandle array 'sensors' in DT

  Fixes: 99505c03f493 (present in v5.10-rc4)
- phb4: Delay training till after PERST is deasserted

  This helps some cards train on the second PERST (ie fast-reboot). The
  reason is not clear why but it helps, so YOLO!

Since :ref:`skiboot-6.0`:

- occ-sensor: Avoid using uninitialised struct cpu_thread

  When adding the sensors in occ_sensors_init, if the type is not
  OCC_SENSOR_LOC_CORE, then the loop to find 'c' will not be executed.
  Then c->pir is used for both of the the add_sensor_node calls below.

  This provides a default value of 0 instead.
- NX: Add NX coprocessor init opal call

  The read offset (4:11) in Receive FIFO control register is incremented
  by FIFO size whenever CRB read by NX. But the index in RxFIFO has to
  match with the corresponding entry in FIFO maintained by VAS in kernel.
  VAS entry is reset to 0 when opening the receive window during driver
  initialization. So when NX842 is reloaded or in kexec boot, possibility
  of mismatch between RxFIFO control register and VAS entries in kernel.
  It could cause CRB failure / timeout from NX.

  This patch adds nx_coproc_init opal call for kernel to initialize
  readOffset (4:11) and Queued (15:23) in RxFIFO control register.
- SLW: Remove stop1_lite and stop2_lite

  stop1_lite has been removed since it adds no additional benefit
  over stop0_lite. stop2_lite has been removed since currently it adds
  minimal benefit over stop2. However, the benefit is eclipsed by the time
  required to ungate the clocks

  Moreover, Lite states don't give up the SMT resources, can potentially
  have a performance impact on sibling threads.

  Since current OSs (Linux) aren't smart enough to make good decisions
  with these stop states, we're (temporarly) removing them from what
  we expose to the OS, the idea being to bring them back in a new
  DT representation so that only an OS that knows what to do will
  do things with them.
- cpu: Use STOP1 on POWER9 for idle/sleep inside OPAL

  The current code requests STOP3, which means it gets STOP2 in practice.

  STOP2 has proven to occasionally be unreliable depending on FW
  version and chip revision, it also requires a functional CME,
  so instead, let's use STOP1. The difference is rather minimum
  for something that is only used a few seconds during boot.

NPU2 (NVLink2 and OpenCAPI)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Since :ref:`skiboot-6.1-rc1`:

- capi: Select the correct IODA table entry for the mbt cache.

  With the current code, the capi mmio window is not correctly configured
  in the IODA table entry. The first entry (generally the non-prefetchable
  BAR) is overwrriten.
  This patch sets the capi window bar at the right place.
- npu2/hw-procedures: Fence bricks via NTL instead of MISC

  There are a couple of places we can set/unset fence for a brick:

  1. MISC register: NPU2_MISC_FENCE_STATE
  2. NTL register for the brick: NPU2_NTL_MISC_CFG1(ndev)

  Recent testing of ATS in combination with GPU reset has exposed a side
  effect of using (1); if fence is set for all six bricks, it triggers a
  sticky nmmu latch which prevents the NPU from getting ATR responses.
  This manifests as a hang in the tests.

  We have npu2_dev_fence_brick() which uses (1), and only two calls to it.
  Replace the call which sets fence with a write to (2). Remove the
  corresponding unset call entirely. It's unneeded because the procedures
  already do a progression from full fence to half to idle using (2).

- phb4/capp: Calculate STQ/DMA read engines based on link-width for PEC

  Presently in CAPI mode the number of STQ/DMA-read engines allocated on
  PEC2 for CAPP is fixed to 6 and 0-30 respectively irrespective of the
  PCI link width. These values are only suitable for x8 cards and
  quickly run out if a x16 card is plugged to a PEC2 attached slot. This
  usually manifests as CAPP reporting TLBI timeout due to these messages
  getting stalled due to insufficient STQs.

  To fix this we update enable_capi_mode() to check if PEC2 chiplet is
  in x16 mode and if yes then we allocate 4/0-47 STQ/DMA-read engines
  for the CAPP traffic.

  Fixes: 37ea3cfdc852 (present in v5.7-rc1)
- npu2: Use same compatible string for NVLink and OpenCAPI link nodes in device tree

  Currently, we distinguish between NPU links for NVLink devices and OpenCAPI
  devices through the use of two different compatible strings - ibm,npu-link
  and ibm,npu-link-opencapi.

  As we move towards supporting configurations with both NVLink and OpenCAPI
  devices behind a single NPU, we need to detect the device type as part of
  presence detection, which can't happen until well after the point where the
  HDAT or platform code has created the NPU device tree nodes. Changing a
  node's compatible string after it's been created is a bit ugly, so instead
  we should move the device type to a new property which we can add to the
  node later on.

  Get rid of the ibm,npu-link-opencapi compatible string, add a new
  ibm,npu-link-type property, and a helper function to check the link type.
  Add an "unknown" device type in preparation for later patches to detect
  device type dynamically.

  These device tree bindings are entirely internal to skiboot and are not
  consumed directly by Linux, so this shouldn't break anything (other than
  internal BML lab environments).
- occ: Add support for GPU presence detection

  On the Witherspoon platform, we need to distinguish between NVLink GPUs and
  OpenCAPI accelerators. In order to do this, we first need to find out
  whether the SXM2 socket is populated.

  On Witherspoon, the SXM2 socket's presence detection pin is only visible
  via I2C from the APSS, and thus can only be exposed to the host via the
  OCC. The OCC, per OCC Firmware Interface Specification for POWER9 version
  0.22, now exposes this to skiboot through a field in the dynamic data
  shared memory.

  Add the necessary dynamic data changes required to read the version and
  GPU presence fields. Add a function, occ_get_gpu_presence(), that can be
  used to check GPU presence.

  If the OCC isn't reporting presence (old OCC firmware, or some other
  reason), we default to assuming there is a device present and wait until
  link training to fail.

  This will be used in later patches to fix up the NPU2 probe path for
  OpenCAPI support on Witherspoon.
- hw/npu2, core/hmi: Use NPU instead of NPU2 as log message prefix

  The NPU2{DBG,INF,ERR} macros use "NPU%d" as a prefix to identify messages
  relating to a particular NPU.

  It's slightly confusing to have per-NPU messages prefixed with "NPU0" or
  "NPU1" and NPU-generic messages prefixed with "NPU2". On some future system
  we could potentially have a NPU #2 in which case it'd be really confusing.

  Use NPU rather than NPU2 for NPU-generic log messages. There's no risk of
  confusion with the original npu.c code since that's only for P8.

Since :ref:`skiboot-6.0`:

- npu2: Reset NVLinks on hot reset

  This effectively fences GPU RAM on GPU reset so the host system
  does not have to crash every time we stop a KVM guest with a GPU
  passed through.
- npu2-opencapi: reduce number of retries to train the link

  We've been reliably training the opencapi link on the first attempt
  for quite a while. Furthermore, if it doesn't train on the first
  attempt, retries haven't been that useful. So let's reduce the number
  of attempts we do to train the link.

  2 retries = 3 attempts to train.

  Each (failed) training sequence costs about 3 seconds.
- opal/hmi: Display correct chip id while printing NPU FIRs.

  HMIs for NPU xstops are broadcasted to all chips. All cores on all the
  chips receive HMI. HMI handler correctly identifies and extracts the
  NPU FIR details from affected chip, but while printing FIR data it
  prints chip id and location code details of this_cpu()->chip_id which
  may not be correct. This patch fixes this issue.
- npu2-opencapi: Fix link state to report link down

  The PHB callback 'get_link_state' is always reporting the link width,
  irrespective of the link status and even when the link is down. It is
  causing too much work (and failures) when the PHB is probed during pci
  init.
  The fix is to look at the link status first and report the link as
  down when appropriate.
- npu2-opencapi: Cleanup traces printed during link training

  Now that links may train in parallel, traces shown during training can
  be all mixed up. So add a prefix to all the traces to clearly identify
  the chip and link the trace refers to: ::

    OCAPI[<chip id>:<link id>]: this is a very useful message

  The lower-level hardware procedures (npu2-hw-procedures.c) also print
  traces which would need work. But that code is being reworked to be
  better integrated with opencapi and nvidia, so leave it alone for now.
- npu2-opencapi: Train links on fundamental reset

  Reorder our link training steps so that they are executed on
  fundamental reset instead of during the initial setup. Skiboot always
  call a fundamental reset on all the PHBs during pci init.

  It is done through a state machine, similarly to what is done for
  'real' PHBs.

  This is the first step for a longer term goal to be able to trigger an
  adapter reset from linux. We'll need the reset callbacks of the PHB to
  be defined. We have to handle the various delays differently, since a
  linux thread shouldn't stay stuck waiting in opal for too long.
- npu2-opencapi: Rework adapter reset

  Rework a bit the code to reset the opencapi adapter:

  - make clearer which i2c pin is resetting which device
  - break the reset operation in smaller chunks. This is really to
    prepare for a future patch.

  No functional changes.
- npu2-opencapi: Use presence detection

  Presence detection is not part of the opencapi specification. So each
  platform may choose to implement it the way it wants.

  All current platforms implement it through an i2c device where we can
  query a pin to know if a device is connected or not. ZZ and Zaius have
  a similar design and even use the same i2c information and pin
  numbers.
  However, presence detection on older ZZ planar (older than v4) doesn't
  work, so we don't activate it for now, until our lab systems are
  upgraded and it's better tested.

  Presence detection on witherspoon is still being worked on. It's
  shaping up to be quite different, so we may have to revisit the topic
  in a later patch.

Testing and CI
--------------

Since :ref:`skiboot-6.1-rc1`:

- test/qemu: start building qemu again, and use our built qemu for tests

  We need to use QEMU_BIN rather than QEMU as the makefiles define
  QEMU already.
- opal-ci: qemu: Use the powernv-3.0 branch

  This is based off the current development version of Qemu, and
  importantly it contains the patch that allows skiboot and Linux to clear
  the PCR that we require to boot.
