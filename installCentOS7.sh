#!/bin/bash

virsh destroy test2 2>/dev/null
virsh undefine test2 2>/dev/null

[ -e /etc/libvirt/qemu/test2.xml ] && \
	rm /etc/libvirt/qemu/test2.xml

[ -e /home/VMs/test2.img ] && \
	rm /home/VMs/test2.img

[ -e /var/log/libvirt/qemu/test2.log ] && \
	rm /var/log/libvirt/test2.log


virt-install \
	--network default \
	--name centos7 \
	--ram=1024 \
	--vcpus=2 \
	--location=/home/CentOS-7-x86_64-DVD-1511.iso \
	--disk path=/home/VMs/test2.img,size=10 \
	--initrd-inject=/home/roger/workspace/CentOS7baseConfig/centos7-ks.cfg \
	--extra-args "ks=file:/centos7-ks.cfg" \
	--graphics vnc
