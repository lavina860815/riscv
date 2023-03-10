.. _skiboot-5.7:

skiboot-5.7
===========

skiboot v5.7 was released on Tuesday July 25th 2017. It follows two
release candidates of skiboot 5.7, and is now the new stable release
of skiboot following the 5.6 release, first released 24th May 2017.

skiboot v5.7 contains all bug fixes as of :ref:`skiboot-5.4.6`
and :ref:`skiboot-5.1.19` (the currently maintained stable releases). We
do not currently expect to do any 5.6.x stable releases.

For how the skiboot stable releases work, see :ref:`stable-rules` for details.

POWER9 is still in development, and thus all POWER9 users must upgrade
to skiboot v5.7.

This is the second release using the new regular six week release cycle,
similar to op-build, but slightly offset to allow for a short stabilisation
period. Expected release dates and contents are tracked using GitHub milestone
and issues: https://github.com/open-power/skiboot/milestones

New Features
------------

Since :ref:`skiboot-5.6.0`, we have a few new features:

New features in this release for POWER9 systems:

- In Memory Counters (IMC) (See :ref:`imc` for details)
- phb4: Activate shared PCI slot on witherspoon (see :ref:`Shared Slot <shared-slot-rn>`)
- phb4 capi (i.e. CAPI2): Enable capi mode for PHB4 (see :ref:`CAPI on PHB4 <capi2-rn>`)

New feature for IBM FSP based systems:

- fsp/tpo: Provide support for disabling TPO alarm

  This patch adds support for disabling a preconfigured
  Timed-Power-On(TPO) alarm on FSP based systems. Presently once a TPO alarm
  is configured from the kernel it will be triggered even if its
  subsequently disabled.

  With this patch a TPO alarm can be disabled by passing
  y_m_d==hr_min==0 to fsp_opal_tpo_write(). A branch is added to the
  function to handle this case by sending FSP_CMD_TPO_DISABLE message to
  the FSP instead of usual FSP_CMD_TPO_WRITE message. The kernel is
  expected to call opal_tpo_write() with y_m_d==hr_min==0 to request
  opal to disable TPO alarm.


POWER9
------
There are many important changes for POWER9 DD1 and DD2 systems. POWER9 support
should be considered in development and skiboot 5.7 is certainly **NOT**
suitable for POWER9 production environments.

Since :ref:`skiboot-5.7-rc2`:

- platform/witherspoon: Enable eSEL logging

  OpenBMC stack added IPMI OEM extension to log eSEL events.
  Lets enable eSEL logging from OPAL side.

  See: https://github.com/openbmc/openpower-host-ipmi-oem/blob/d9296050bcece5c2eca5ede0932d944b0ced66c9/oemhandler.cpp#L142
  (yes, that is the documentation)
- hdat/i2c: Fix array version check
- mem_region: Check for no-map in reserved nodes

  Regions with the no-map property should be handled seperately to
  "normal" firmware reservations. When creating mem_region regions
  from a reserved-memory DT node use the no-map property to select
  the right reservation type.

- hdata/memory: Add memory reservations to the DT

  Currently we just add these to a list of pre-boot reserved regions
  which is then converted into a the contents of the /reserved-memory/
  node just before Skiboot jumps into the firmware kernel.

  This approach is insufficent because we need to add the ibm,prd-instance
  labels to the various hostboot reserved regions. To do this we want to
  create these resevation nodes inside the HDAT parser rather than having
  the mem_region flattening code handle it. On P8 systems Hostboot placed
  its memory reservations under the /ibm,hostboot/ node and this patch
  makes the HDAT parser do the same.

Since Since :ref:`skiboot-5.7-rc1`:

- HDAT: Add IPMI sensor data under /bmc node
- numa/associativity: Add a new level of NUMA for GPU's

  Today we have an issue where the NUMA nodes corresponding
  to GPU's have the same affinity/distance as normal memory
  nodes. Our reference-points today supports two levels
  [0x4, 0x4] for normal systems and [0x4, 0x3] for Power8E
  systems. This patch adds a new level [0x4, X, 0x2] and
  uses node-id as at all levels for the GPU.
- xive: Enable memory backing of queues

  This dedicates 6x64k pages of memory permanently for the XIVE to
  use for internal queue overflow. This allows the XIVE to deal with
  some corner cases where the internal queues might prove insufficient.

- xive: Properly get rid of donated indirect pages during reset

  Otherwise they keep being used accross kexec causing memory
  corruption in subsequent kernels once KVM has been used.

- cpu: Better handle unknown flags in opal_reinit_cpus()

  At the moment, if we get passed flags we don't know about, we
  return OPAL_UNSUPPORTED but we still perform whatever actions
  was requied by the flags we do support. Additionally, on P8,
  we attempt a SLW re-init which hasn't been supported since
  Murano DD2.0 and will crash your system.

  It's too late to fix on existing systems so Linux will have to
  be careful at least on P8, but to avoid future issues let's clean
  that up, make sure we only use slw_reinit() when HILE isn't
  supported.
- cpu: Unconditionally cleanup TLBs on P9 in opal_reinit_cpus()

  This can work around problems where Linux fails to properly
  cleanup part or all of the TLB on kexec.

- Fix scom addresses for power9 nx checkstop hmi handling.

  Scom addresses for NX status, DMA & ENGINE FIR and PBI FIR has changed
  for Power9. Fixup thoes while handling nx checkstop for Power9.
- Fix scom addresses for power9 core checkstop hmi handling.

  Scom addresses for CORE FIR (Fault Isolation Register) and Malfunction
  Alert Register has changed for Power9. Fixup those while handling core
  checkstop for Power9.

  Without this change HMI handler fails to check for correct reason for
  core checkstop on Power9.

- core/mem_region: check return value of add_region

  The only sensible thing to do if this fails is to abort() as we've
  likely just failed reserving reserved memory regions, and nothing
  good comes from that.

Since Since :ref:`skiboot-5.6.0`:

- hdata: Reserve Trace Areas

  When hostboot is configured to setup in memory tracing it will reserve
  some memory for use by the hardware tracing facility. We need to mark
  these areas as off limits to the operating system and firmware.
- hdata: Make out-of-range idata print at PR_DEBUG

  Some fields just aren't populated on some systems.

- hdata: Ignore unnamed memory reservations.

  Hostboot should name any and all memory reservations that it provides.
  Currently some hostboots export a broken reservation covering the first
  256MB of memory and this causes the system to crash at boot due to an
  invalid free because this overlaps with the static "ibm,os-reserve"
  region (which covers the first 768MB of memory).

  According to the hostboot team unnamed reservations are invalid and can
  be ignored.

- hdata: Check the Host I2C devices array version

  Currently this is not populated on FSP machines which causes some
  obnoxious errors to appear in the boot log. We also only want to
  parse version 1 of this structure since future versions will completely
  change the array item format.

- Ensure P9 DD1 workarounds apply only to Nimbus

  The workarounds for P9 DD1 are only needed for Nimbus. P9 Cumulus will
  be DD1 but don't need these same workarounds.

  This patch ensures the P9 DD1 workarounds only apply to Nimbus. It
  also renames some things to make clear what's what.

- cpu: Cleanup AMR and IAMR when re-initializing CPUs

  There's a bug in current Linux kernels leaving crap in those registers
  accross kexec and not sanitizing them on boot. This breaks kexec under
  some circumstances (such as booting a hash kernel from a radix one
  on P9 DD2.0).

  The long term fix is in Linux, but this workaround is a reasonable
  way of "sanitizing" those SPRs when Linux calls opal_reinit_cpus()
  and shouldn't have adverse effects.

  We could also use that same mechanism to cleanup other things as
  well such as restoring some other SPRs to their default value in
  the future.

- Set POWER9 RPR SPR to 0x00000103070F1F3F.  Same value as P8.

  Without this, thread priorities inside a core don't work.

- cpu: Support setting HID[RADIX] and set it by default on P9

  This adds new opal_reinit_cpus() flags to setup radix or hash
  mode in HID[8] on POWER9.

  By default HID[8] will be set. On P9 DD1.0, Linux will change
  it as needed. On P9 DD2.0 hash works in radix mode (radix is
  really "dual" mode) so KVM won't break and existing kernels
  will work.

  Newer kernels built for hash will call this to clear the HID bit
  and thus get the full size of the TLB as an optimization.

- Add "cleanup_global_tlb" for P9 and later

  Uses broadcast TLBIE's to cleanup the TLB on all cores and on
  the nest MMU

- xive: DD2.0 updates

  Add support for StoreEOI, fix StoreEOI MMIO offset in ESB page,
  and other cleanups

- Update default TSCR value for P9 as recommended by HW folk.

- xive: Fix initialisation of xive_cpu_state struct

  When using XIVE emulation with DEBUG=1, we run into crashes in log_add()
  due to the xive_cpu_state->log_pos being uninitialised (and thus, with
  DEBUG enabled, initialised to the poison value of 0x99999999).


PHB4
^^^^

Since :ref:`skiboot-5.7-rc2`:

- phb4: Add link training trace mode

  Add a mode to PHB4 to trace training process closely. This activates
  as soon as PERST is deasserted and produces human readable output of
  the process.

  This may increase training times since it duplicates some of the
  training code.  This code has it's own simple checks for fence and
  timeout but will fall through to the default training code once done.

  Output produced, looks like the "TRACE:" lines below: ::

      [    3.410799664,7] PHB#0001[0:1]: FRESET: Starts
      [    3.410802000,7] PHB#0001[0:1]: FRESET: Prepare for link down
      [    3.410806624,7] PHB#0001[0:1]: FRESET: Assert skipped
      [    3.410808848,7] PHB#0001[0:1]: FRESET: Deassert
      [    3.410812176,3] PHB#0001[0:1]: TRACE: 0x0000000101000000  0ms
      [    3.417170176,3] PHB#0001[0:1]: TRACE: 0x0000100101000000 12ms presence
      [    3.436289104,3] PHB#0001[0:1]: TRACE: 0x0000180101000000 49ms training
      [    3.436373312,3] PHB#0001[0:1]: TRACE: 0x00001d0811000000 49ms trained
      [    3.436420752,3] PHB#0001[0:1]: TRACE: Link trained.
      [    3.436967856,7] PHB#0001[0:1]: LINK: Start polling
      [    3.437482240,7] PHB#0001[0:1]: LINK: Electrical link detected
      [    3.437996864,7] PHB#0001[0:1]: LINK: Link is up
      [    4.438000048,7] PHB#0001[0:1]: LINK: Link is stable

  Enabled via nvram using: ::

      nvram -p ibm,skiboot --update-config pci-tracing=true

- phb4: Improve reset and link training timing

  This improves PHB reset and link training timing.

- phb4: Add phb4_check_reg() to sanity check failures

  This adds a function phb4_check_reg() to sanity check when we do MMIO
  reads from the PHB to make sure it's not fenced.

- phb4: Remove retry on electrical link timeout

  Currently we retry if we don't detect an electrical link. This is
  pointless as all devices should respond in the given time.

  This patches removes this retry and just returns OPAL_HARDWARE if we
  don't detect an electrical link.

  This has the additional benefit of improving boot times on machines
  that have badly wired presence detect (ie. says a device is present
  when there isn't).

- phb4: Read PERST signal rather than assuming it's asserted

  Currently we assume on boot that PERST is asserted so that we can skip
  having to assert it ourselves.

  This instead reads the PERST status and determines if we need to
  assert it based on that.

- phb4: Fix endian of TLP headers print

  Byte swap TLP headers so they are the same as the PCIe spec.
- phb4: Change timeouts prints to error level

  If the link doesn't have a electrical link or the link doesn't train
  we should make that more obvious to the user.
- phb4: Better logs why the slot didn't work

  Better logs why the slot didn't work and make it a PR_ERR so users
  see it by default.

- phb4: Force verbose EEH logging

  Force verbose EEH. This is a heavy handed and we should turn if off
  later as things stabilise, but is useful for now.
- phb4: Initialization sequence updates

  Mostly errata workarounds, some DD1 specific.

  The step Init_5 was moved to Init_16, so the numbering was updated to
  reflect this.

Since :ref:`skiboot-5.7-rc1`:

- phb4: Do more retries on link training failures
  Currently we only retry once when we have a link training failure.
  This changes this to be 3 retries as 1 retry is not giving us enough
  reliablity.

  This will increase the boot time, especially on systems where we
  incorrectly detect a link presence when there really is nothing
  present. I'll post a followup patch to optimise our timings to help
  mitigate this later.

- phb4: Workaround phy lockup by doing full PHB reset on retry

  For PHB4 it's possible that the phy may end up in a bad state where it
  can no longer recieve data. This can manifest as the link not
  retraining. A simple PERST will not clear this. The PHB must be
  completely reset.

  This changes the retry state to CRESET to do this.

  This issue may also manifest itself as the link training in a degraded
  state (lower speed or narrower width). This patch doesn't attempt to
  fix that (will come later).
- pci: Add ability to trace timing

  PCI link training is responsible for a huge chunk of the skiboot boot
  time, so add the ability to trace it waiting in the main state
  machine.
- pci: Print resetting PHB notice at higher log level

  Currently during boot there a long delay while we wait for the PHBs to
  be reset and train. During this time, there is no output from skiboot
  and the last message doesn't give an indication of what's happening.

  This boosts the PHB reset message from info to notice so users can see
  what's happening during this long period of waiting.
- phb4: Only set one bit in nfir

  The MPIPL procedure says to only set bit 26 when forcing the PEC into
  freeze mode. Currently we set bits 24-27.

  This changes the code to follow spec and only set bit 26.
- phb4: Fix order of pfir/nfir clearing in CRESET

  According to the workbook, pfir must be cleared before the nfir.
  The way we have it now causes the nfir to not clear properly in some
  error circumstances.

  This swaps the order to match the workbook.
- phb4: Remove incorrect state transition

  When waiting in PHB4_SLOT_CRESET_WAIT_CQ for transations to end, we
  incorrectly move onto the next state.  Generally we don't hit this as
  the transactions have ended already anyway.

  This removes the incorrect state transition.
- phb4: Set default lane equalisation

  Set default lane equalisation if there is nothing in the device-tree.

  Default value taken from hdat and confirmed by hardware team. Neatens
  the code up a bit too.
- hdata: Fix phb4 lane-eq property generation

  The lane-eq data we get from hdat is all 7s but what we end up in the
  device tree is: ::

    xscom@603fc00000000/pbcq@4010c00/stack@0/ibm,lane-eq
                     00000000 31c339e0 00000000 0000000c
                     00000000 00000000 00000000 00000000
                     00000000 31c30000 77777777 77777777
                     77777777 77777777 77777777 77777777

  This fixes grabbing the properties from hdat and fixes the call to put
  them in the device tree.
- phb4: Fix PHB4 fence recovery.

  We had a few problems:

  - We used the wrong register to trigger the reset (spec bug)
  - We should clear the PFIR and NFIR while the reset is asserted
  - ... and in the right order !
  - We should only apply the DD1 workaround after the reset has
    been lifted.
  - We should ensure we use ASB whenever we are fenced or doing a
    CRESET
  - Make config ops write with ASB
- phb4: Verbose EEH options

  Enabled via nvram pci-eeh-verbose=true. ie. ::

    nvram -p ibm,skiboot --update-config pci-eeh-verbose=true
- phb4: Print more info when PHB fences

  For now at PHBERR level. We don't have room in the diags data
  passed to Linux for these unfortunately.

Since :ref:`skiboot-5.6.0`:

- phb4: Fix number of index bits in IODA tables

  On PHB4 the number of index bits in the IODA table address register
  was bumped to 10 bits to accomodate for 1024 MSIs and 1024 TVEs (DD2).

  However our macro only defined the field to be 9 bits, thus causing
  "interesting" behaviours on some systems.

- phb4: Harden init with bad PHBs

  Currently if we read all 1's from the EEH or IRQ capabilities, we end
  up train wrecking on some other random code (eg. an assert() in xive).

  This hardens the PHB4 code to look for these bad reads and more
  gracefully fails the init for that PHB alone.  This allows the rest of
  the system to boot and ignore those bad PHBs.

- phb4 capi (i.e. CAPI2): Handle HMI events

  Find the CAPP on the chip associated with the HMI event for PHB4.
  The recovery mode (re-initialization of the capp, resume of functional
  operations) is only available with P9 DD2. A new patch will be provided
  to support this feature.

.. _capi2-rn:

- phb4 capi (i.e. CAPI2): Enable capi mode for PHB4

  Enable the Coherently attached processor interface. The PHB is used as
  a CAPI interface.
  CAPI Adapters can be connected to either PEC0 or PEC2. Single port
  CAPI adapter can be connected to either PEC0 or PEC2, but Dual-Port
  Adapter can be only connected to PEC2
  * CAPP0 attached to PHB0(PEC0 - single port)
  * CAPP1 attached to PHB3(PEC2 - single or dual port)

- hw/phb4: Rework phb4_get_presence_state()

  There are two issues in current implementation: It should return errcode
  visibile to Linux, which has prefix OPAL_*. The code isn't very obvious.

  This returns OPAL_HARDWARE when the PHB is broken. Otherwise, OPAL_SUCCESS
  is always returned. In the mean while, It refactors the code to make it
  obvious: OPAL_PCI_SLOT_PRESENT is returned when the presence signal (low active)
  or PCIe link is active. Otherwise, OPAL_PCI_SLOT_EMPTY is returned.

- phb4: Error injection for config space

  Implement CFG (config space) error injection.

  This works the same as PHB3.  MMIO and DMA error injection require a
  rewrite, so they're unsupported for now.

  While it's not feature complete, this at least provides an easy way to
  inject an error that will trigger EEH.

- phb4: Error clear implementation
- phb4: Mask link down errors during reset

  During a hot reset the PCI link will drop, so we need to mask link down
  events to prevent unnecessary errors.
- phb4: Implement root port initialization

  phb4_root_port_init() was a NOP before, so fix that.
- phb4: Complete reset implementation

  This implements complete reset (creset) functionality for POWER9 DD1.

  Only partially tested and contends with some DD1 errata, but it's a start.

.. _shared-slot-rn:

- phb4: Activate shared PCI slot on witherspoon

  Witherspoon systems come with a 'shared' PCI slot: physically, it
  looks like a x16 slot, but it's actually two x8 slots connected to two
  PHBs of two different chips. Taking advantage of it requires some
  logic on the PCI adapter. Only the Mellanox CX5 adapter is known to
  support it at the time of this writing.

  This patch enables support for the shared slot on witherspoon if a x16
  adapter is detected. Each x8 slot has a presence bit, so both bits
  need to be set for the activation to take place. Slot sharing is
  activated through a gpio.

  Note that there's no easy way to be sure that the card is indeed a
  shared-slot compatible PCI adapter and not a normal x16 card. Plugging
  a normal x16 adapter on the shared slot should be avoided on
  witherspoon, as the link won't train on the second slot, resulting in
  a timeout and a longer boot time. Only the first slot is usable and
  the x16 adapter will end up using only half the lines.

  If the PCI card plugged on the physical slot is only x8 (or less),
  then the presence bit of the second slot is not set, so this patch
  does nothing. The x8 (or less) adapter should work like on any other
  physical slot.

- phb4: Block D-state power management on direct slots

  As current revisions of PHB4 don't properly handle the resulting
  L1 link transition.

- phb4: Call pci config filters

- phb4: Mask out write-1-to-clear registers in RC cfg

  The root complex config space only supports 4-byte accesses. Thus, when
  the client requests a smaller size write, we do a read-modify-write to
  the register.

  However, some register have bits defined as "write 1 to clear".

  If we do a RMW cycles on such a register and such bits are 1 in the
  part that the client doesn't intend to modify, we will accidentally
  write back those 1's and clear the corresponding bit.

  This avoids it by masking out those magic bits from the "old" value
  read from the register.

- phb4: Properly mask out link down errors during reset
- phb3/4: Silence a useless warning

  PHB's don't have base location codes on non-FSP systems and it's
  normal.

- phb4: Workaround bug in spec 053

  Wait for DLP PGRESET to clear *after* lifting the PCIe core reset

- phb4: DD2.0 updates

  Support StoreEOI, full complements of PEs (twice as big TVT)
  and other updates.

  Also renumber init steps to match spec 063

NPU2
^^^^

Note that currently NPU2 support is limited to POWER9 DD1 hardware.

Since :ref:`skiboot-5.6.0`:

- platforms/astbmc/witherspoon.c: Add NPU2 slot mappings

  For NVLink2 to function PCIe devices need to be associated with the right
  NVLinks. This association is supposed to be passed down to Skiboot via HDAT but
  those fields are still not correctly filled out. To work around this we add slot
  tables for the NVLinks similar to what we have for P8+.

- hw/npu2.c: Fix device aperture calculation

  The POWER9 NPU2 implements an address compression scheme to compress 56-bit P9
  physical addresses to 47-bit GPU addresses. System software needs to know both
  addresses, unfortunately the calculation of the compressed address was
  incorrect. Fix it here.

- hw/npu2.c: Change MCD BAR allocation order

  MCD BARs need to be correctly aligned to the size of the region. As GPU
  memory is allocated from the top of memory down we should start allocating
  from the highest GPU memory address to the lowest to ensure correct
  alignment.

- NPU2: Add flag to nvlink config space indicating DL reset state

  Device drivers need to be able to determine if the DL is out of reset or
  not so they can safely probe to see if links have already been trained.
  This patch adds a flag to the vendor specific config space indicating if
  the DL is out of reset.

- hw/npu2.c: Hardcode MSR_SF when setting up npu XTS contexts

  We don't support anything other than 64-bit mode for address translations so we
  can safely hardcode it.

- hw/npu2-hw-procedures.c: Add nvram option to override zcal calculations

  In some rare cases the zcal state machine may fail and flag an error. According
  to hardware designers it is sometimes ok to ignore this failure and use nominal
  values for the calculations. In this case we add a nvram variable
  (nv_zcal_override) which will cause skiboot to ignore the failure and use the
  nominal value specified in nvram.
- npu2: Fix npu2_{read,write}_4b()

  When writing or reading 4-byte values, we need to use the upper half of
  the 64-bit SCOM register.

  Fix npu2_{read,write}_4b() and their callers to use uint32_t, and
  appropriately shift the value being written or returned.


- hw/npu2.c: Fix opal_npu_map_lpar to search for existing BDF
- hw/npu2-hw-procedures.c: Fix running of zcal procedure

    The zcal procedure should only be run once per obus (ie. once per group of 3
    links). Clean up the code and fix the potential buffer overflow due to a typo.
    Also updates the zcal settings to their proper values.
- hw/npu2.c: Add memory coherence directory programming

  The memory coherence directory (MCD) needs to know which system memory addresses
  belong to the GPU. This amounts to setting a BAR and a size in the MCD to cover
  the addresses assigned to each of the GPUs. To ease assignment we assume GPUs
  are assigned memory in a contiguous block per chip.

OCC/Power Management
^^^^^^^^^^^^^^^^^^^^

With this release, it's possible to boot POWER9 systems with the OCC
enabled and change CPU frequencies. Doing so does require other firmware
components to also support this (otherwise the frequency will not be set).

Since :ref:`skiboot-5.6.0`:

- occ: Skip setting cores to nominal frequency in P9

  In P9, once OCC is up, it is supposed to setup the cores to nominal
  frequency. So skip this step in OPAL.
- occ: Fix Pstate ordering for P9

  In P9 the pstate values are positive. They are continuous set of
  unsigned integers [0 to +N] where Pmax is 0 and Pmin is N. The
  linear ordering of pstates for P9 has changed compared to P8.
  P8 has neagtive pstate values advertised as [0 to -N] where Pmax
  is 0 and Pmin is -N. This patch adds helper routines to abstract
  pstate comparison with pmax and adds sanity pstate limit checks.
  This patch also fixes pstate arithmetic by using labs().
- p8-i2c: occ: Add support for OCC to use I2C engines

  This patch adds support to share the I2C engines with host and OCC.
  OCC uses I2C engines to read DIMM temperatures and to communicate with
  GPU. OCC Flag register is used for locking between host and OCC. Host
  requests for the bus by setting a bit in OCC Flag register. OCC sends
  an interrupt to indicate the change in ownership.

opal-prd/PRD
^^^^^^^^^^^^

Since :ref:`skiboot-5.6.0`:

- opal-prd: Handle SBE passthrough message passing

  This patch adds support to send SBE pass through command to HBRT.
- SBE: Add passthrough command support

  SBE sends passthrough command. We have to capture this interrupt and
  send event to HBRT via opal-prd (user space daemon).
- opal-prd: hook up reset_pm_complex

  This change provides the facility to invoke HBRT's reset_pm_complex, in
  the same manner is done with process_occ_reset previously.

  We add a control command for `opal-prd pm-complex reset`, which is just
  an alias for occ_reset at this stage.

- prd: Implement firmware side of opaque PRD channel

  This change introduces the firmware side of the opaque HBRT <--> OPAL
  message channel. We define a base message format to be shared with HBRT
  (in include/prd-fw-msg.h), and allow firmware requests and responses to
  be sent over this channel.

  We don't currently have any notifications defined, so have nothing to do
  for firmware_notify() at this stage.

- opal-prd: Add firmware_request & firmware_notify implementations

  This change adds the implementation of firmware_request() and
  firmware_notify(). To do this, we need to add a message queue, so that
  we can properly handle out-of-order messages coming from firmware.

- opal-prd: Add support for variable-sized messages

  With the introductuion of the opaque firmware channel, we want to
  support variable-sized messages. Rather than expecting to read an
  entire 'struct opal_prd_msg' in one read() call, we can split this
  over mutiple reads, potentially expanding our message buffer.

- opal-prd: Sync hostboot interfaces with HBRT

  This change adds new callbacks defined for p9, and the base thunks for
  the added calls.

- opal-prd: interpret log level prefixes from HBRT

  Interpret the (optional) \*_MRK log prefixes on HBRT messages, and set
  the syslog log priority to suit.

- opal-prd: Add occ reset to usage text
- opal-prd: allow different chips for occ control actions

  The `occ reset` and `occ error` actions can both take a chip id
  argument, but we're currently just using zero. This change changes the
  control message format to pass the chip ID from the control process to
  the opal-prd daemon.


IBM FSP based platforms
-----------------------

Since :ref:`skiboot-5.7-rc2`:

- FSP/CONSOLE: Do not enable input irq in write path

  We use irq for reading input from console, but not in output path.
  Hence do not enable input irq in write path.

  Fixes : 583c8203 (fsp/console: Allocate irq for each hvc console)

Since :ref:`skiboot-5.6.0`:

- FSP/CONSOLE: Fix possible NULL dereference
- platforms/ibm-fsp/firenze: Fix PCI slot power-off pattern

  When powering off the PCI slot, the corresponding bits should
  be set to 0bxx00xx00 instead of 0bxx11xx11. Otherwise, the
  specified PCI slot can't be put into power-off state. Fortunately,
  it didn't introduce any side-effects so far.
- FSP/CONSOLE: Workaround for unresponsive ipmi daemon

  We use TCE mapped area to write data to console. Console header
  (fsp_serbuf_hdr) is modified by both FSP and OPAL (OPAL updates
  next_in pointer in fsp_serbuf_hdr and FSP updates next_out pointer).

  Kernel makes opal_console_write() OPAL call to write data to console.
  OPAL write data to TCE mapped area and sends MBOX command to FSP.
  If our console becomes full and we have data to write to console,
  we keep on waiting until FSP reads data.

  In some corner cases, where FSP is active but not responding to
  console MBOX message (due to buggy IPMI) and we have heavy console
  write happening from kernel, then eventually our console buffer
  becomes full. At this point OPAL starts sending OPAL_BUSY_EVENT to
  kernel. Kernel will keep on retrying. This is creating kernel soft
  lockups. In some extreme case when every CPU is trying to write to
  console, user will not be able to ssh and thinks system is hang.

  If we reset FSP or restart IPMI daemon on FSP, system recovers and
  everything becomes normal.

  This patch adds workaround to above issue by returning OPAL_HARDWARE
  when cosole is full. Side effect of this patch is, we may endup dropping
  latest console data. But better to drop console data than system hang.

- FSP: Set status field in response message for timed out message

  For timed out FSP messages, we set message status as "fsp_msg_timeout".
  But most FSP driver users (like surviellance) are ignoring this field.
  They always look for FSP returned status value in callback function
  (second byte in word1). So we endup treating timed out message as success
  response from FSP.

  Sample output: ::

    [69902.432509048,7] SURV: Sending the heartbeat command to FSP
    [70023.226860117,4] FSP: Response from FSP timed out, word0 = d66a00d7, word1 = 0 state: 3
    ....
    [70023.226901445,7] SURV: Received heartbeat acknowledge from FSP
    [70023.226903251,3] FSP: fsp_trigger_reset() entry

  Here SURV code thought it got valid response from FSP. But actually we didn't
  receive response from FSP.

  This patch fixes above issue by updating status field in response structure.

- FSP: Improve timeout message

- FSP/RTC: Fix possible FSP R/R issue in rtc write path
- hw/fsp/rtc: read/write cached rtc tod on fsp hir.

  Currently fsp-rtc reads/writes the cached RTC TOD on an fsp
  reset. Use latest fsp_in_rr() function to properly read the cached rtc
  value when fsp reset initiated by the hir.

  Below is the kernel trace when we set hw clock, when hir process starts. ::

    [ 1727.775824] NMI watchdog: BUG: soft lockup - CPU#57 stuck for 23s! [hwclock:7688]
    [ 1727.775856] Modules linked in: vmx_crypto ibmpowernv ipmi_powernv uio_pdrv_genirq ipmi_devintf powernv_op_panel uio ipmi_msghandler powernv_rng leds_powernv ip_tables x_tables autofs4 ses enclosure scsi_transport_sas crc32c_vpmsum lpfc ipr tg3 scsi_transport_fc
    [ 1727.775883] CPU: 57 PID: 7688 Comm: hwclock Not tainted 4.10.0-14-generic #16-Ubuntu
    [ 1727.775883] task: c000000fdfdc8400 task.stack: c000000fdfef4000
    [ 1727.775884] NIP: c00000000090540c LR: c0000000000846f4 CTR: 000000003006dd70
    [ 1727.775885] REGS: c000000fdfef79a0 TRAP: 0901   Not tainted  (4.10.0-14-generic)
    [ 1727.775886] MSR: 9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>
    [ 1727.775889]   CR: 28024442  XER: 20000000
    [ 1727.775890] CFAR: c00000000008472c SOFTE: 1
                   GPR00: 0000000030005128 c000000fdfef7c20 c00000000144c900 fffffffffffffff4
                   GPR04: 0000000028024442 c00000000090540c 9000000000009033 0000000000000000
                   GPR08: 0000000000000000 0000000031fc4000 c000000000084710 9000000000001003
                   GPR12: c0000000000846e8 c00000000fba0100
    [ 1727.775897] NIP [c00000000090540c] opal_set_rtc_time+0x4c/0xb0
    [ 1727.775899] LR [c0000000000846f4] opal_return+0xc/0x48
    [ 1727.775899] Call Trace:
    [ 1727.775900] [c000000fdfef7c20] [c00000000090540c] opal_set_rtc_time+0x4c/0xb0 (unreliable)
    [ 1727.775901] [c000000fdfef7c60] [c000000000900828] rtc_set_time+0xb8/0x1b0
    [ 1727.775903] [c000000fdfef7ca0] [c000000000902364] rtc_dev_ioctl+0x454/0x630
    [ 1727.775904] [c000000fdfef7d40] [c00000000035b1f4] do_vfs_ioctl+0xd4/0x8c0
    [ 1727.775906] [c000000fdfef7de0] [c00000000035bab4] SyS_ioctl+0xd4/0xf0
    [ 1727.775907] [c000000fdfef7e30] [c00000000000b184] system_call+0x38/0xe0
    [ 1727.775908] Instruction dump:
    [ 1727.775909] f821ffc1 39200000 7c832378 91210028 38a10020 39200000 38810028 f9210020
    [ 1727.775911] 4bfffe6d e8810020 80610028 4b77f61d <60000000> 7c7f1b78 3860000a 2fbffff4

  This is found when executing the testcase
  https://github.com/open-power/op-test-framework/blob/master/testcases/fspresetReload.py

  With this fix ran fsp hir torture testcase in the above test
  which is working fine.
- occ: Set return variable to correct value

  When entering this section of code rc will be zero. If fsp_mkmsg() fails
  the code responsible for printing an error message won't be set.
  Resetting rc should allow for the error case to trigger if fsp_mkmsg
  fails.
- capp: Fix hang when CAPP microcode LID is missing on FSP machine

  When the LID is absent, we fail early with an error from
  start_preload_resource. In that case, capp_ucode_info.load_result
  isn't set properly causing a subsequent capp_lid_download() to
  call wait_for_resource_loaded() on something that isn't being
  loaded, thus hanging.

- FSP: Add check to detect FSP R/R inside fsp_sync_msg()

  OPAL sends MBOX message to FSP and updates message state from fsp_msg_queued
  -> fsp_msg_sent. fsp_sync_msg() queues message and waits until we get response
  from FSP. During FSP R/R we move outstanding MBOX messages from msgq to rr_queue
  including inflight message (fsp_reset_cmdclass()). But we are not resetting
  inflight message state.

  In extreme croner case where we sent message to FSP via fsp_sync_msg() path
  and FSP R/R happens before getting respose from FSP, then we will endup waiting
  in fsp_sync_msg() until everything becomes normal.

  This patch adds fsp_in_rr() check to fsp_sync_msg() and return error to caller
    if FSP is in R/R.
- FSP: Add check to detect FSP R/R inside fsp_sync_msg()

  OPAL sends MBOX message to FSP and updates message state from fsp_msg_queued
  -> fsp_msg_sent. fsp_sync_msg() queues message and waits until we get response
  from FSP. During FSP R/R we move outstanding MBOX messages from msgq to rr_queue
  including inflight message (fsp_reset_cmdclass()). But we are not resetting
  inflight message state.

  In extreme croner case where we sent message to FSP via fsp_sync_msg() path
  and FSP R/R happens before getting respose from FSP, then we will endup waiting
  in fsp_sync_msg() until everything becomes normal.

  This patch adds fsp_in_rr() check to fsp_sync_msg() and return error to caller
    if FSP is in R/R.
- capp: Fix hang when CAPP microcode LID is missing on FSP machine

  When the LID is absent, we fail early with an error from
  start_preload_resource. In that case, capp_ucode_info.load_result
  isn't set properly causing a subsequent capp_lid_download() to
  call wait_for_resource_loaded() on something that isn't being
  loaded, thus hanging.
- FSP/CONSOLE: Do not free fsp_msg in error path

  as we reuse same msg to send next output message.

- platform/zz: Acknowledge OCC_LOAD mbox message in ZZ

  In P9 FSP box, OCC image is pre-loaded. So do not handle the load
  command and send SUCCESS to FSP on recieving OCC_LOAD mbox message.

- FSP/RTC: Improve error log

astbmc systems
--------------

Since :ref:`skiboot-5.6.0`:

- platforms/astbmc: Don't validate model on palmetto

  The platform isn't compatible with palmetto until the root device-tree
  node's "model" property is NULL or "palmetto". However, we could have
  "TN71-BP012" for the property on palmetto. ::

       linux# cat /proc/device-tree/model
       TN71-BP012

  This skips the validation on root device-tree node's "model" property
  on palmetto, meaning we check the "compatible" property only.


General
-------

Since :ref:`skiboot-5.7-rc2`:

- core/pci: Fix mem-leak on fast-reboot

  Fast-reboot has a memory leak which causes the system to crash after about
  250 fast-reboots. The patch fixes the memory leak.
  The cause of the leak was the pci_device's being freed, without freeing
  the pci_slot within it.

- gcov: properly handle gard and pflash code coverage

Since :ref:`skiboot-5.6.0`:

- Reduce log level on non-error log messages

  90% of what we print isn't useful to a normal user. This
  dramatically reduces the amount of messages printed by
  OPAL in normal circumstances.

- init: Silence messages and call ourselves "OPAL"
- psi: Switch to ESB mode later

  There's an errata, if we switch to ESB mode before setting up
  the various ESB mode related registers, a pending interrupts
  can go wrong.

- lpc: Enable "new" SerIRQ mode
- hw/ipmi/ipmi-sel: missing newline in prlog warning

- p8-i2c OCC lock: fix locking in p9_i2c_bus_owner_change
- Convert important polling loops to spin at lowest SMT priority

  The pattern of calling cpu_relax() inside a polling loop does
  not suit the powerpc SMT priority instructions. Prefrred is to
  set a low priority then spin until break condition is reached,
  then restore priority.

- Improve cpu_idle when PM is disabled

  Split cpu_idle() into cpu_idle_delay() and cpu_idle_job() rather than
  requesting the idle type as a function argument. Have those functions
  provide a default polling (non-PM) implentation which spin at the
  lowest SMT priority.

- core/fdt: Always add a reserve map

  Currently we skip adding the reserved ranges block to the generated
  FDT blob if we are excluding the root node. This can result in a DTB
  that dtc will barf on because the reserved memory ranges overlap with
  the start of the dt_struct block. As an example: ::

    $ fdtdump broken.dtb -d
    /dts-v1/;
    // magic:               0xd00dfeed
    // totalsize:           0x7f3 (2035)
    // off_dt_struct:       0x30  <----\
    // off_dt_strings:      0x7b8       | this is bad!
    // off_mem_rsvmap:      0x30  <----/
    // version:             17
    // last_comp_version:   16
    // boot_cpuid_phys:     0x0
    // size_dt_strings:     0x3b
    // size_dt_struct:      0x788

    /memreserve/ 0x100000000 0x300000004;
    /memreserve/ 0x3300000001 0x169626d2c;
    /memreserve/ 0x706369652d736c6f 0x7473000000000003;
            *continues*

  With this patch: ::

    $ fdtdump working.dtb -d
    /dts-v1/;
    // magic:               0xd00dfeed
    // totalsize:           0x803 (2051)
    // off_dt_struct:       0x40
    // off_dt_strings:      0x7c8
    // off_mem_rsvmap:      0x30
    // version:             17
    // last_comp_version:   16
    // boot_cpuid_phys:     0x0
    // size_dt_strings:     0x3b
    // size_dt_struct:      0x788

    // 0040: tag: 0x00000001 (FDT_BEGIN_NODE)
    / {
    // 0048: tag: 0x00000003 (FDT_PROP)
    // 07fb: string: phandle
    // 0054: value
        phandle = <0x00000001>;
            *continues*

- hw/lpc-mbox: Use message registers for interrupts

  Currently the BMC raises the interrupt using the BMC control register.
  It does so on all accesses to the 16 'data' registers meaning that when
  the BMC only wants to set the ATTN (on which we have interrupts enabled)
  bit we will also get a control register based interrupt.

  The solution here is to mask that interrupt permanantly and enable
  interrupts on the protocol defined 'response' data byte.

PCI
---

Since :ref:`skiboot-5.6.0`:

- pci: Wait 20ms before checking presence detect on PCIe

  As the PHB presence logic has a debounce timer that can take
  a while to settle.

- phb3+iov: Fixup support for config space filters

  The filter should be called before the HW access and its
  return value control whether to perform the access or not
- core/pci: Use PCI slot's power facality in pci_enable_bridge()

  The current implmentation has incorrect assumptions: there is
  always a PCI slot associated with root port and PCIe switch
  downstream port and all of them are capable to change its
  power state by register PCICAP_EXP_SLOTCTL. Firstly, there
  might not a PCI slot associated with the root port or PCIe
  switch downstream port. Secondly, the power isn't controlled
  by standard config register (PCICAP_EXP_SLOTCTL). There are
  I2C slave devices used to control the power states on Tuleta.

  In order to use the PCI slot's methods to manage the power
  states, this does:

  * Introduce PCI_SLOT_FLAG_ENFORCE, indicates the request operation
    is enforced to be applied.
  * pci_enable_bridge() is split into 3 functions: pci_bridge_power_on()
    to power it on; pci_enable_bridge() as a place holder and
    pci_bridge_wait_link() to wait the downstream link to come up.
  * In pci_bridge_power_on(), the PCI slot's specific power management
    methods are used if there is a PCI slot associated with the PCIe
    switch downstream port or root port.
- platforms/astbmc/slots.c: Allow comparison of bus numbers when matching slots

  When matching devices on multiple down stream PLX busses we need to compare more
  than just the device-id of the PCIe BDFN, so increase the mask to do so.

Debugging, Tests and simulators
-------------------------------

Since :ref:`skiboot-5.7-rc2`:

- boot_tests: add PFLASH_TO_COPY for OpenBMC
- travis: Add debian stretch and unstable

  At the moment, we mark them both as being able to fail, as we're
  hitting an assert in one of the unit tests on debian stretch, and
  that hasn't yet been chased down.

- core/backtrace: Serialise printing backtraces

  Add a lock so that only one thread can print a backtrace at a time.
  This should prevent multiple threads from garbaling each other's
  backtraces.

Since :ref:`skiboot-5.7-rc1`:

- lpc: remove double LPC prefix from messages
- opal-ci/fetch-debian-jessie-installer: follow redirects
  Fixes some CI failures
- test/qemu-jessie: bail out fast on kernel panic
- test/qemu-jessie: dump boot log on failure
- travis: add fedora26
- xz: add fallthrough annotations to silence GCC7 warning

Since :ref:`skiboot-5.6.0`:

- boot-tests: add OpenBMC support
- boot_test.sh: Add SMC BMC support

  Your BMC needs a special debug image flashed to use this, the exact
  image and methods aren't something I can publish here, but if you work
  for IBM or SMC you can find out from the right sources.

  A few things are needed to move around to be able to flash to a SMC BMC.

  For a start, the SSH daemon will only accept connections after a special
  incantation (which I also can't share), but you should put that in the
  ~/.skiboot_boot_tests file along with some other default login information
  we don't publicise too broadly (because Security Through Obscurity is
  *obviously* a good idea....)

  We also can't just directly "ssh /bin/true", we need an expect script,
  and we can't scp, but we can anonymous rsync!

  You also need a pflash binary to copy over.
- hdata_to_dt: Add PVR overrides to the usage text
- mambo: Add a reservation for the initramfs

  On most systems the initramfs is loaded inside the part of memory
  reserved for the OS [0x0-0x30000000] and skiboot will never touch it.
  On mambo it's loaded at 0x80000000 and if you're unlucky skiboot can
  allocate over the top of it and corrupt the initramfs blob.

  There might be the downside that the kernel cannot re-use the initramfs
  memory since it's marked as reserved, but the kernel might also free it
  anyway.
- mambo: Update P9 PVR to reflect Scale out 24 core chips

  The P9 PVR bits 48:51 don't indicate a revision but instead different
  configurations.  From BookIV we have:

  ==== ===================
  Bits Configuration
  ==== ===================
     0 Scale out 12 cores
     1 Scale out 24 cores
     2 Scale up 12 cores
     3 Scale up 24 cores
  ==== ===================

  Skiboot will mostly the use "Scale out 24 core" configuration
  (ie. SMT4 not SMT8) so reflect this in mambo.
- core: Move enable_mambo_console() into chip initialisation

  Rather than having a wart in main_cpu_entry() that initialises the mambo
  console, we can move it into init_chips() which is where we discover that we're
  on mambo.

- mambo: Create multiple chips when we have multiple CPUs

  Currently when we boot mambo with multiple CPUs, we create multiple CPU nodes in
  the device tree, and each claims to be on a separate chip.

  However we don't create multiple xscom nodes, which means skiboot only knows
  about a single chip, and all CPUs end up on it. At the moment mambo is not able
  to create multiple xscom controllers. We can create fake ones, just by faking
  the device tree up, but that seems uglier than this solution.

  So create a mambo-chip for each CPU other than 0, to tell skiboot we want a
  separate chip created. This then enables Linux to see multiple chips: ::

      smp: Brought up 2 nodes, 2 CPUs
      numa: Node 0 CPUs: 0
      numa: Node 1 CPUs: 1

- chip: Add support for discovering chips on mambo

  Currently the only way for skiboot to discover chips is by looking for xscom
  nodes. But on mambo it's currently not possible to create multiple xscom nodes,
  which means we can only simulate a single chip system.

  However it seems we can fairly cleanly add support for a special mambo chip
  node, and use that to instantiate multiple chips.

  Add a check in init_chip() that we're not clobbering an already initialised
  chip, now that we have two places that initialise chips.
- mambo: Make xscom claim to be DD 2.0

  In the mambo tcl we set the CPU version to DD 2.0, because mambo is not
  bug compatible with DD 1.

  But in xscom_read_cfam_chipid() we have a hard coded value, to work
  around the lack of the f000f register, which claims to be P9 DD 1.0.

  This doesn't seem to cause crashes or anything, but at boot we do see: ::

      [    0.003893084,5] XSCOM: chip 0x0 at 0x1a0000000000 [P9N DD1.0]

  So fix it to claim that the xscom is also DD 2.0 to match the CPU.

- mambo: Match whole string when looking up symbols with linsym/skisym

  linsym/skisym use a regex to match the symbol name, and accepts a
  partial match against the entry in the symbol map, which can lead to
  somewhat confusing results, eg: ::

      systemsim % linsym early_setup
      0xc000000000027890
      systemsim % linsym early_setup$
      0xc000000000aa8054
      systemsim % linsym early_setup_secondary
      0xc000000000027890

  I don't think that's the behaviour we want, so append a $ to the name so
  that the symbol has to match against the whole entry, eg: ::

      systemsim % linsym early_setup
      0xc000000000aa8054

- Disable nap on P8 Mambo, public release has bugs
- mambo: Allow loading multiple CPIOs

  Currently we have support for loading a single CPIO and telling Linux to
  use it as the initrd. But the Linux code actually supports having
  multiple CPIOs contiguously in memory, between initrd-start and end, and
  will unpack them all in order. That is a really nice feature as it means
  you can have a base CPIO with your root filesystem, and then tack on
  others as you need for various tests etc.

  So expand the logic to handle SKIBOOT_INITRD, and treat it as a comma
  separated list of CPIOs to load. I chose comma as it's fairly rare in
  filenames, but we could make it space, colon, whatever. Or we could add
  a new environment variable entirely. The code also supports trimming
  whitespace from the values, so you can have "cpio1, cpio2".
- hdata/test: Add memory reservations to hdata_to_dt

  Currently memory reservations are parsed, but since they are not
  processed until mem_region_init() they don't appear in the output
  device tree blob. Several bugs have been found with memory reservations
  so we want them to be part of the test output.

  Add them and clean up several usages of printf() since we want only the
  dtb to appear in standard out.


pflash/libffs
-------------

Since :ref:`skiboot-5.7-rc2`:

- pflash option to retrieve PNOR partition flags

  This commit extends pflash with an option to retrieve and print
  information for a particular partition, including the content from
  "pflash -i" and a verbose list of set miscellaneous flags. -i option
  is also updated to print a short list of flags in addition to the
  ECC flag, with one character per flag. A test of the new option is
  included in libflash/test.

Since :ref:`skiboot-5.6.0`:

- libflash/libffs: Zero checksum words

  On writing ffs entries to flash libffs doesn't zero checksum words
  before calculating the checksum across the entire structure. This causes
  an inaccurate calculation of the checksum as it may calculate a checksum
  on non-zero checksum bytes.

- libffs: Fix ffs_lookup_part() return value

  It would return success when the part wasn't found
- libflash/libffs: Correctly update the actual size of the partition

  libffs has been updating FFS partition information in the wrong place
  which leads to incomplete erases and corruption.
- libflash: Initialise entries list earlier

  In the bail-out path we call ffs_close() to tear down the partially
  initialised ffs_handle. ffs_close() expects the entries list to be
  initialised so we need to do that earlier to prevent a null pointer
  dereference.

mbox-flash
----------

mbox-flash is the emerging standard way of talking to host PNOR flash
on POWER9 systems.

- libflash/mbox-flash: Implement MARK_WRITE_ERASED mbox call

  Version two of the mbox-flash protocol defines a new command:
  MARK_WRITE_ERASED.

  This command provides a simple way to mark a region of flash as all 0xff
  without the need to go and write all 0xff. This is an optimisation as
  there is no need for an erase before a write, it is the responsibility of
  the BMC to deal with the flash correctly, however in v1 it was ambiguous
  what a client should do if the flash should be erased but not actually
  written to. This allows of a optimal path to resolve this problem.

- libflash/mbox-flash: Update to V2 of the protocol

  Updated version 2 of the protocol can be found at:
  https://github.com/openbmc/mboxbridge/blob/master/Documentation/mbox_protocol.md

  This commit changes mbox-flash such that it will preferentially talk
  version 2 to any capable daemon but still remain capable of talking to
  v1 daemons.

  Version two changes some of the command definitions for increased
  consistency and usability.
  Version two includes more attention bits - these are now dealt with at a
  simple level.
- libflash/mbox-flash: Implement MARK_WRITE_ERASED mbox call

  Version two of the mbox-flash protocol defines a new command:
  MARK_WRITE_ERASED.

  This command provides a simple way to mark a region of flash as all 0xff
  without the need to go and write all 0xff. This is an optimisation as
  there is no need for an erase before a write, it is the responsibility of
  the BMC to deal with the flash correctly, however in v1 it was ambiguous
  what a client should do if the flash should be erased but not actually
  written to. This allows of a optimal path to resolve this problem.

- libflash/mbox-flash: Update to V2 of the protocol

  Updated version 2 of the protocol can be found at:
  https://github.com/openbmc/mboxbridge/blob/master/Documentation/mbox_protocol.md

  This commit changes mbox-flash such that it will preferentially talk
  version 2 to any capable daemon but still remain capable of talking to
  v1 daemons.

  Version two changes some of the command definitions for increased
  consistency and usability.
  Version two includes more attention bits - these are now dealt with at a
  simple level.

- hw/lpc-mbox: Use message registers for interrupts

  Currently the BMC raises the interrupt using the BMC control register.
  It does so on all accesses to the 16 'data' registers meaning that when
  the BMC only wants to set the ATTN (on which we have interrupts enabled)
  bit we will also get a control register based interrupt.

  The solution here is to mask that interrupt permanantly and enable
  interrupts on the protocol defined 'response' data byte.


Contributors
------------

* Processed 232 csets from 29 developers.
* 1 employer found
* A total of 13043 lines added, 2517 removed (delta 10526)

Extending the analysis done for some previous releases, we can see our trends
in code review across versions:

======= ====== ======== ========= ========= ===========
Release	csets  Ack %    Reviews % Tested %  Reported %
======= ====== ======== ========= ========= ===========
5.0	329    15 (5%)  20 (6%)   1 (0%)    0 (0%)
5.1	372    13 (3%)  38 (10%)  1 (0%)    4 (1%)
5.2-rc1	334    20 (6%)  34 (10%)  6 (2%)    11 (3%)
5.3-rc1	302    36 (12%) 53 (18%)  4 (1%)    5 (2%)
5.4	361    16 (4%)  28 (8%)   1 (0%)    9 (2%)
5.5	408    11 (3%)  48 (12%)  14 (3%)   10 (2%)
5.6	87     12 (14%)  6 (7%)   5 (6%)    2 (2%)
5.7	232    30 (13%) 32 (14%)  5 (2%)    2 (1%)
======= ====== ======== ========= ========= ===========

This cycle has been good for reviews/acks, scoring second highest percentage
ever on both, as well as being right up there on absolute numbers.


Developers with the most changesets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

========================= ==== =======
Developer                    #       %
========================= ==== =======
Benjamin Herrenschmidt      41 (17.7%)
Stewart Smith               31 (13.4%)
Michael Neuling             28 (12.1%)
Oliver O'Halloran           18 (7.8%)
Vasant Hegde                18 (7.8%)
Jeremy Kerr                 12 (5.2%)
Alistair Popple             11 (4.7%)
Gavin Shan                  10 (4.3%)
Russell Currey               9 (3.9%)
Michael Ellerman             9 (3.9%)
Madhavan Srinivasan          7 (3.0%)
Cyril Bur                    6 (2.6%)
Christophe Lombard           5 (2.2%)
Shilpasri G Bhat             5 (2.2%)
Andrew Donnellan             3 (1.3%)
Nicholas Piggin              3 (1.3%)
Mahesh Salgaonkar            2 (0.9%)
Anju T Sudhakar              2 (0.9%)
Hemant Kumar                 2 (0.9%)
Matt Brown                   1 (0.4%)
Michael Tritz                1 (0.4%)
Joel Stanley                 1 (0.4%)
Balbir Singh                 1 (0.4%)
Frederic Barrat              1 (0.4%)
Andrew Jeffery               1 (0.4%)
Pridhiviraj Paidipeddi       1 (0.4%)
Reza Arbab                   1 (0.4%)
Suraj Jitindar Singh         1 (0.4%)
Vaibhav Jain                 1 (0.4%)
========================= ==== =======


Developers with the most changed lines
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

========================= ==== =======
Developer                    #       %
========================= ==== =======
Hemant Kumar              3056 (23.0%)
Stewart Smith             1826 (13.7%)
Benjamin Herrenschmidt    1348 (10.1%)
Christophe Lombard         937 (7.0%)
Shilpasri G Bhat           770 (5.8%)
Madhavan Srinivasan        755 (5.7%)
Jeremy Kerr                731 (5.5%)
Cyril Bur                  674 (5.1%)
Alistair Popple            477 (3.6%)
Gavin Shan                 414 (3.1%)
Russell Currey             396 (3.0%)
Michael Neuling            336 (2.5%)
Vasant Hegde               308 (2.3%)
Oliver O'Halloran          300 (2.3%)
Anju T Sudhakar            300 (2.3%)
Michael Tritz              167 (1.3%)
Frederic Barrat            113 (0.8%)
Nicholas Piggin             93 (0.7%)
Mahesh Salgaonkar           76 (0.6%)
Michael Ellerman            66 (0.5%)
Suraj Jitindar Singh        59 (0.4%)
Andrew Donnellan            53 (0.4%)
Joel Stanley                20 (0.2%)
Balbir Singh                12 (0.1%)
Reza Arbab                  10 (0.1%)
Vaibhav Jain                 9 (0.1%)
Pridhiviraj Paidipeddi       2 (0.0%)
Matt Brown                   1 (0.0%)
Andrew Jeffery               1 (0.0%)
========================= ==== =======

Developers with the most signoffs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(total 242)

========================= ==== =======
Developer                    #       %
========================= ==== =======
Stewart Smith              201 (83.1%)
Michael Neuling             29 (12.0%)
Madhavan Srinivasan          4 (1.7%)
Suraj Jitindar Singh         3 (1.2%)
Anju T Sudhakar              2 (0.8%)
Hemant Kumar                 2 (0.8%)
Cyril Bur                    1 (0.4%)
========================= ==== =======

Developers with the most reviews
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(total 32)

========================= ==== =======
Developer                    #       %
========================= ==== =======
Vasant Hegde                 8 (25.0%)
Cyril Bur                    7 (21.9%)
Andrew Donnellan             5 (15.6%)
Frederic Barrat              5 (15.6%)
Andrew Jeffery               2 (6.2%)
Gavin Shan                   2 (6.2%)
Joel Stanley                 1 (3.1%)
Oliver O'Halloran            1 (3.1%)
Alistair Popple              1 (3.1%)
========================= ==== =======

Developers with the most test credits
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(total 5)

========================== ==== =======
Developer                    #       %
========================== ==== =======
Vasant Hegde                  2 (40.0%)
Oliver O'Halloran             1 (20.0%)
Ananth N Mavinakayanahalli    1 (20.0%)
Michael Ellerman              1 (20.0%)
========================== ==== =======

Developers who gave the most tested-by credits
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(total 5)

========================= ==== =======
Developer                    #       %
========================= ==== =======
Jeremy Kerr                  2 (40.0%)
Vasant Hegde                 1 (20.0%)
Oliver O'Halloran            1 (20.0%)
Michael Ellerman             1 (20.0%)
========================= ==== =======

Developers with the most report credits
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(total 2)

========================= ==== =======
Developer                    #       %
========================= ==== =======
Oliver O'Halloran            1 (50.0%)
Alastair D'Silva             1 (50.0%)
========================= ==== =======

Developers who gave the most report credits
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(total 2)

========================= ==== =======
Developer                    #       %
========================= ==== =======
Andrew Donnellan             1 (50.0%)
Stewart Smith                1 (50.0%)
========================= ==== =======
