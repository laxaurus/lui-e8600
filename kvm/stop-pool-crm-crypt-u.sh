#!/bin/sh

KVM_POOL1=pool-crm-crypt-u
LUKS_MNT1=luks-c53ad491-52e5-46f4-9fc8-578f62770c04
UNLOCK_MNT1=/mnt/unlock-luks-c53ad491-52e5-46f4-9fc8-578f62770c04
#
#
# stop pool
echo "stopping pool..."
virsh pool-destroy $KVM_POOL 

echo "umounting..."
sudo umount $UNLOCK_MNT1

echo "locking crypt vol"
sudo cryptsetup luksClose /dev/mapper/$LUKS_MNT1




