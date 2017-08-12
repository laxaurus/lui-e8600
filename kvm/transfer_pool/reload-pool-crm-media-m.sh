#!/bin/sh
KVM_POOL1=pool-crm-media-m
LV_NAME1=/dev/vgcrm0/crm-crypt-m
LUKS_MNT1=luks-af63366f-b884-4846-b1f1-2f3e429e9f7a
DEV_MAPPER=/dev/mapper/$LUKS_MNT1
UNLOCK_MNT1=/mnt/unlock-luks-af63366f-b884-4846-b1f1-2f3e429e9f7a


#
# open device
echo "unlock crm-crypt-u..."
sudo cryptsetup luksOpen $LV_NAME1 $LUKS_MNT1
virsh pool-define-as $KVM_POOL1 logical --source-dev $DEV_MAPPER --target $UNLOCK_MNT1


# start pool
echo "start pool"
virsh pool-start $KVM_POOL1




