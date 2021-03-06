#!/bin/sh
KVM_POOL1=pool-crm-media
LV_NAME1=/dev/vgcrm/crm-crypt
LUKS_MNT1=luks-6161fdc8-65b5-4a91-86ca-83e7a2eb8129
UNLOCK_MNT1=/mnt/unlock-luks-6161fdc8-65b5-4a91-86ca-83e7a2eb8129
#
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


