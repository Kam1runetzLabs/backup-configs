#!/bin/bash

opts=""
if [[ "${1}" == "debug" ]]; then
	opts=" -s -S "
fi

fasm source.asm vm/vdisk/lr.efi &&\
cd vm				&&\
./run.sh "${opts}"
