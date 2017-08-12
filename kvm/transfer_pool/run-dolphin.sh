#!/bin/sh
virsh attach-device --config vsu-dolphin ../lvuser_private.xml
#virsh attach-device --config vsu-dolphin ../crm-media-gic.xml



virsh start vsu-dolphin
