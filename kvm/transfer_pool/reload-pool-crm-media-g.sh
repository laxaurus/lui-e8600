#!/bin/sh
KVM_POOL1=pool-crm-media-g
LV_NAME1=/dev/vgcrm/crm-crypt-g
LUKS_MNT1=luks-52f1c294-1024-4bcd-832d-1a29ed59e7cb
UNLOCK_MNT1=/mnt/unlock-luks-52f1c294-1024-4bcd-832d-1a29ed59e7cb


DEV_MAPPER=/dev/mapper/$LUKS_MNT1

#
# open device
echo "unlock crm-crypt-u..."
sudo cryptsetup luksOpen $LV_NAME1 $LUKS_MNT1
virsh pool-define-as $KVM_POOL1 logical --source-dev $DEV_MAPPER --target $UNLOCK_MNT1


# start pool
echo "start pool"
virsh pool-start $KVM_POOL1


