#!/bin/bash

virsh destroy centos6 2>/dev/null
virsh undefine centos6 2>/dev/null

[ -e /etc/libvirt/qemu/centos6.xml ] && \
	rm /etc/libvirt/qemu/centos6.xml

[ -e /home/VMs/centos6.img ] && \
	rm /home/VMs/centos6.img

[ -e /var/log/libvirt/qemu/centos6.log ] && \
	rm /var/log/libvirt/centos6.log


virt-install \
	--network default \
	--name centos6 \
	--ram=1024 \
	--vcpus=2 \
	--location=/home/CentOS-6.10-x86_64-bin-DVD1.iso \
	--disk path=/home/VMs/centos6.img,size=10 \
	--initrd-inject=/home/roger/workspace/CentOS7baseConfig/centos6-ks.cfg \
	--extra-args "ks=file:/centos6-ks.cfg" \
	--graphics vnc
