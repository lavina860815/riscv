#!/bin/bash

function print_usage()
{
    if [ -n "$2" ]; then
        echo "Error: $2"
        echo
    fi
    echo "Usage: $1 <scratch dir>"
}

scratch_dir=$1
if [ -z "$scratch_dir" ]; then
    print_usage "$0" 'Scratch dir not given' >&2
    exit 1
fi

cd "$scratch_dir/share" || exit 1

mps=(mnt*)
mp_i=0
for mp in "${mps[@]}"; do
    mp_i=$((mp_i + 1))
    printf "Unmounting %i/%i...\r" "$mp_i" "${#mps[@]}"

    sudo umount -R "$mp"
done
echo

echo 'Done.'
