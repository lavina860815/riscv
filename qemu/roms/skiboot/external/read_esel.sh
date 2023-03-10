#!/bin/bash
# Copyright 2013-2014 IBM Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# 	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -e

BMC_HOST=$1
RECORD_ID=$2

BMC_USER=admin
BMC_PASS=admin

if [ -z "$BMC_HOST" -o -z "$RECORD_ID" ]; then
    echo "Usage: $0 <bmc hostname> <record id>"
    echo "Example: $0 bmc 0xa > pel.bin"
    echo ''
    echo 'Record ids can be found using ipmitool with the "sel list" command. Records with'
    echo 'a description of "OEM record df" contain extended SEL information (in PEL'
    echo 'format) which can be extracted with this tool.'
    exit -1
fi

# Convert a number into 2 hex-bytes in little-endian order
function conv_le {
    echo $(for i in $(printf %04x $1 | grep -o .. | tac); do echo -n "0x$i "; done)
}

function conv_native {
    echo -n "0x${2}${1}"
}

record=$(conv_le $2)
offset=0
progress=0

while [ $progress = 0 ]; do
    result=$(ipmitool -H ${BMC_HOST} -I lan -U ${BMC_USER} -P ${BMC_PASS} raw 0x32 0xf1 ${record} $(conv_le ${offset}))
    len=$(conv_native $(echo ${result} | cut -d " " -f 1-2))
    progress=$(($(echo ${result} | cut -d " " -f 3)))
    data="$data "$(echo -n ${result} | cut -d " " -f 6-)
    offset=$(($offset + ${#data}/3))
done

echo -n ${data} | cut -d " " -f 1-$(($len)) | xxd -r -p
