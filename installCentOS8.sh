#!/bin/bash

virsh destroy centos8 2>/dev/null
virsh undefine centos8 2>/dev/null

[ -e /etc/libvirt/qemu/centos8.xml ] && \
	rm /etc/libvirt/qemu/centos8.xml

[ -e /home/VMs/centos8.img ] && \
	rm /home/VMs/centos8.img

[ -e /var/log/libvirt/qemu/centos8.log ] && \
	rm /var/log/libvirt/centos8.log


virt-install \
	--network default \
	--name centos8 \
	--ram=1024 \
	--vcpus=2 \
	--location=/home/CentOS-8-x86_64-1905-dvd1.iso \
	--disk path=/home/VMs/centos8.img,size=10 \
	--initrd-inject=/home/roger/workspace/CentOS7baseConfig/centos8-ks.cfg \
	--extra-args "ks=file:/centos8-ks.cfg" \
	--graphics vnc
