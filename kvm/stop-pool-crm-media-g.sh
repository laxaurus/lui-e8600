#!/bin/sh
KVM_POOL=pool-crm-media-g
LUKS_MNT1=luks-52f1c294-1024-4bcd-832d-1a29ed59e7cb
UNLOCK_MNT1=/mnt/unlock-luks-52f1c294-1024-4bcd-832d-1a29ed59e7cb

# stop pool
echo "stopping pool..."
virsh pool-destroy $KVM_POOL 

echo "umounting..."
sudo umount $UNLOCK_MNT1

echo "locking crypt vol"
sudo cryptsetup luksClose /dev/mapper/$LUKS_MNT1




