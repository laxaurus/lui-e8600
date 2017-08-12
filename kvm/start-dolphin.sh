#!/bin/sh

./start-pool-user-space.sh
virsh attach-device --config vsu-dolphin user-space.xml


virsh start vsu-dolphin
