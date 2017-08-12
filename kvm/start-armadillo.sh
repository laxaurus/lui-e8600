#!/bin/sh
./start-pool-crm-media-g.sh
virsh attach-device --config vsu-armadillo crm-media-gbt.xml
virsh attach-device --config vsu-armadillo crm-media-gic.xml


./start-pool-crm-media-m.sh
virsh attach-device --config vsu-armadillo crm-media-misc.xml

./start-pool-crm-media.sh
virsh attach-device --config vsu-armadillo crm-media.xml

#./start-pool-user-space.sh
#virsh attach-device --config vsu-armadillo user-space.xml

./start-pool-crm-crypt-u.sh
virsh attach-device --config vsu-armadillo crm-media-002.xml

virsh start vsu-armadillo
