#!/bin/bash
if [ $USER != root ]; then
echo "Error: must be root"
exit 1
fi
apt update
apt -y install nfs-common
mkdir /swap
echo "192.168.1.1:/swap /swap nfs user,exec" >> /etc/fstab
mount /swap
losetup /dev/loop0 /swap/swapfile
mkswap /dev/loop0
swapon /dev/loop0
echo -e "\e[00;1;92mFinished...\e[00m"
exit 0
