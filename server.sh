#!/bin/bash
if [[ $USER != root ]]; then
echo -e "\e[00;31mERROR: must be root\e[00m"
exit 1
fi
apt update
apt -y install nfs-kernel-server
mkdir /swap
dd if=/dev/zero of=/swap/swapfile bs=1024 count=1048576
echo "/swap 192.168.1.1(rw,insecure,sync)" >> /etc/exports
chmod -v 777 /swap/swapfile
exportfs -r
echo -e "\e[00;1;92mFinished...\e[00m"
exit 0
