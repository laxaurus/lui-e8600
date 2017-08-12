#!/bin/sh
virsh attach-device --config vsu-armadillo ../crm-media-gbt.xml
virsh attach-device --config vsu-armadillo ../crm-media-gic.xml


virsh attach-device --config vsu-armadillo ../crm-media-misc.xml

virsh attach-device --config vsu-armadillo ../crm-media.xml

virsh attach-device --config vsu-armadillo ../user-space.xml

virsh attach-device --config vsu-armadillo ../crm-media-002.xml

virsh start vsu-armadillo
