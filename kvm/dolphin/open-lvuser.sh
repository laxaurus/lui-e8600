#!/bin/sh
KVM_POOL1=family_data
LV_NAME1=/dev/vgfamily/lvuser_private
LUKS_MNT1=luks-c6531664-b241-4799-b0ba-99eba9a09fd4
UNLOCK_MNT1=/mnt/unlock-luks-c6531664-b241-4799-b0ba-99eba9a09fd4

#
# open device
echo "unlock lvuser_private ..."
sudo cryptsetup luksOpen $LV_NAME1 $LUKS_MNT1 
#echo "mounting ..."
#sudo mount /dev/mapper/$LUKS_MNT1 $UNLOCK_MNT1

# start pool
#echo "start pool"
#virsh pool-start $KVM_POOL1 

# mount unlock device


