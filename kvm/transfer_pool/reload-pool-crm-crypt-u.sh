#!/bin/sh
KVM_POOL1=pool-crm-crypt-u
LV_NAME1=/dev/vguser/crm-crypt-u
LUKS_MNT1=luks-c53ad491-52e5-46f4-9fc8-578f62770c04
DEV_MAPPER=/dev/mapper/$LUKS_MNT1
UNLOCK_MNT1=/mnt/unlock-luks-c53ad491-52e5-46f4-9fc8-578f62770c04

#
# stop pool
#virsh pool-destroy $KVM_POOL 

# unmount LUKS lvm
#cryptsetup luksClose /dev/mapper/$LUKS_MNT1

#
# open device
echo "unlock crm-crypt-u..."
sudo cryptsetup luksOpen $LV_NAME1 $LUKS_MNT1 
#jsudo mkdir $UNLOCK_MNT1
#sudo mount $LV_NAME1 $UNLOCK_MNT1
virsh pool-define-as $KVM_POOL1 logical --source-dev $DEV_MAPPER --target $UNLOCK_MNT1


# start pool
echo "start pool"
virsh pool-start $KVM_POOL1 

# mount unlock device


