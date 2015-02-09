#!/bin/bash
if [ $USER != root ]; then
echo "Error: must be root"
exit 1
fi
apt -y install nfs-common
mkdir /home/user/swap
echo "192.168.1.1:/swap /swap nfs user,exec" >> /etc/fstab
mount /swap
losetup /dev/loop0 /swap/swapfile
mkswap /dev/loop0
swapon /dev/loop0
reboot
exit 0
