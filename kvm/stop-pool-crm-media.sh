#!/bin/sh
KVM_POOL=pool-crm-media
LUKS_MNT1=luks-6161fdc8-65b5-4a91-86ca-83e7a2eb8129
UNLOCK_MNT1=/mnt/unlock-luks-6161fdc8-65b5-4a91-86ca-83e7a2eb8129
#
# stop pool
echo "stopping pool..."
virsh pool-destroy $KVM_POOL 

echo "umounting..."
sudo umount $UNLOCK_MNT1

echo "locking crypt vol"
sudo cryptsetup luksClose /dev/mapper/$LUKS_MNT1




