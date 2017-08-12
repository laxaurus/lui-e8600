#!/bin/sh
KVM_POOL1=pool_lvuser_space
LV_NAME1=/dev/vguser/lvuser_space
LUKS_MNT1=luks-698534b3-a45e-4758-9623-b0c5977b62f2
UNLOCK_MNT1=/mnt/unlock-luks-698534b3-a45e-4758-9623-b0c5977b62f2


DEV_MAPPER=/dev/mapper/$LUKS_MNT1

#
# open device
echo "unlock crm-crypt-u..."
sudo cryptsetup luksOpen $LV_NAME1 $LUKS_MNT1
virsh pool-define-as $KVM_POOL1 logical --source-dev $DEV_MAPPER --target $UNLOCK_MNT1


# start pool
echo "start pool"
virsh pool-start $KVM_POOL1
