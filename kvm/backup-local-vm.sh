#!/bin/bash

#
# usage: backup-vm.sh doman_name domain_image_path
#
DOMAIN_NAME="$1"
REMOTE_USER=laxaurus
REMOTE_HOST=localhost
#
# check that the path at the remote location is a valid location
# the remote location may not have been mounted yet!
# 
# (go to larry@study64:~/scripts/mntwdcrypt.sh to mount and decrypt the device before running this script)
#REMOTE_DIR="$REMOTE_USER@$REMOTE_HOST:/mnt/3Tdisk/hard-disks/images/lui-e8600_kvm_backups" 
REMOTE_DIR="$REMOTE_USER@$REMOTE_HOST:/media/laxaurus/wdcrypt/hard-disks/images/lui-e8600_kvm_backups" 


SOURCE_IMAGE="$2" 
DATE=`date +%Y-%m-%d:%H:%M:%S`
#DEST_IMAGE="$DOMAIN_NAME.img.$DATE"
DEST_IMAGE="$(basename $SOURCE_IMAGE).$DATE"
echo $DEST_IMAGE

echo "shutting down $DOMAIN_NAME"
virsh destroy $DOMAIN_NAME --graceful
#echo "sshfs -o default_permissions $REMOTE_DIR $TARGET_DIR "
#sudo sshfs -o default_permissions $REMOTE_DIR $TARGET_DIR 
# rsync options: -n: dry run -v: verbose
echo "rsync -nv $SOURCE_IMAGE $REMOTE_DIR"
sudo rsync -vvv $SOURCE_IMAGE $REMOTE_DIR/$DEST_IMAGE



