\ *****************************************************************************
\ * Copyright (c) 2016 IBM Corporation
\ * All rights reserved.
\ * This program and the accompanying materials
\ * are made available under the terms of the BSD License
\ * which accompanies this distribution, and is available at
\ * http://www.opensource.org/licenses/bsd-license.php
\ *
\ * Contributors:
\ *     IBM Corporation - initial implementation
\ ****************************************************************************/

\ Handle virtio-serial device

s" virtio [ serial ]" type cr

my-space pci-device-generic-setup

pci-master-enable
pci-mem-enable
pci-io-enable

s" virtio-serial.fs" included

pci-device-disable
