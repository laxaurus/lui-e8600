#!/bin/sh
virsh shutdown vsu-armadillo
echo "wait 30 seconds..."
sleep 30
./stop-all-pools.sh

