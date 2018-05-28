#!/bin/sh

volume="/dev/xvde"
mountpoint="/elasticsearch/data"

sudo yum update -y
sudo yum install awscli -y 

while [ ! -e $volume ] ; do sleep 1 ; done

sudo mkfs.ext4 -m0 $volume
sudo mkdir -p $mountpoint
sudo mount $volume $mountpoint
echo "$mountpoint $volume noatime,defaults 0 0" | sudo tee --append /etc/fstab > /dev/null
