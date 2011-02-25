#!/bin/bash

vboxmanage createvm -name $1 --register
vboxmanage modifyvm $1 \
 --synthcpu on \
 --ostype WindowsXP \
 --memory 512 \
 --nic1 bridged \
 --bridgeadapter1 eth1 \
 --acpi off \
 --pae off \
 --hwvirtex off \
 --vram 14

vboxmanage storagectl $1 \
--name IDE0 \
--add ide

vboxmanage createhd \
--filename $1 \
--size 10480 \
--variant Standard


vboxmanage storageattach $1 \
--storagectl IDE0 \
--port 0 \
--device 0 \
--type hdd \
--medium ${1}.vdi

vboxmanage storageattach $1 \
--storagectl IDE0 \
--port 1 \
--device 0 \
--type dvddrive \
--medium emptydrive

