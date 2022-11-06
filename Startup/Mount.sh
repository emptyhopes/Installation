#! /bin/bash

sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
sudo cryptsetup luksOpen /dev/sdb3 persistence

sudo mkfs.ext3 /dev/mapper/persistence
sudo e2label /dev/mapper/persistence persistence
sudo mkdir -p /mnt/persistence
sudo mount /dev/mapper/persistence /mnt/persistence
sudo echo "/ union" > /mnt/persistence/persistence.conf
sudo mkdir /mnt/persistence/system
sudo unmount /dev/mapper/persistence

sudo cryptsetup luksClose /dev/mapper/persistence
