#!/bin/sh
KVM_POOL1=pool-crm-media-g
LV_NAME1=/dev/vgcrm/crm-crypt-g
LUKS_MNT1=luks-52f1c294-1024-4bcd-832d-1a29ed59e7cb
UNLOCK_MNT1=/mnt/unlock-luks-52f1c294-1024-4bcd-832d-1a29ed59e7cb

# stop pool
#virsh pool-destroy $KVM_POOL 

# unmount LUKS lvm
#cryptsetup luksClose /dev/mapper/$LUKS_MNT1

#
# open device
echo "unlock crm-crypt..."
sudo cryptsetup luksOpen $LV_NAME1 $LUKS_MNT1 
#echo "mounting ..."
#sudo mount /dev/mapper/$LUKS_MNT1 $UNLOCK_MNT1

# start pool
echo "start pool"
virsh pool-start $KVM_POOL1 

# mount unlock device


