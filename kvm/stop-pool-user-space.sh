#!/bin/sh

KVM_POOL1=pool-user-space
LUKS_MNT1=luks-698534b3-a45e-4758-9623-b0c5977b62f2
UNLOCK_MNT1=/mnt/unlock-luks-698534b3-a45e-4758-9623-b0c5977b62f2
#
#
# stop pool
echo "stopping pool..."
virsh pool-destroy $KVM_POOL 

echo "umounting..."
sudo umount $UNLOCK_MNT1

echo "locking crypt vol"
sudo cryptsetup luksClose /dev/mapper/$LUKS_MNT1




