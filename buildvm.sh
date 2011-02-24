#!/bin/bash

vboxmanage createvm -name $1 --register
vboxmanage modifyvm $1 --synthcpu on --ostype WindowsXP --memory 512 --nic1 bridged --bridgeadapter1 eth0 --acpi off --pae off
vboxmanage storagectl $1 --name SATA0 --add sata

vboxmanage createhd --filename $1 --size 10480 --variant Standard


vboxmanage storageattach $1 --storagectl SATA0 --port 0 --device 0 --type hdd --medium ${1}.vdi