#!/bin/sh

echo "Rebuilding opcodes.s from allopcodes.S"
cat <<EOF >opcodes.s
; File is autogenerated from allopcodes.S - do not edit
; Please use ./rebuild.sh to rebuild this file

EOF

cpp -P allopcodes.S >>opcodes.s
