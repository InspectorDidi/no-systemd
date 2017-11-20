#!/bin/bash

git clone https://github.com/bidaian/no-systemd.git
cd no-systemd
sudo apt-get build-dep dbus gvfs network-manager policykit-1 udisks2
apt-get source dbus gvfs network-manager policykit-1 udisks2

cd dbus-1.10.22/
patch -p2 < ../dbus/patch.txt
gvfs-1.30.4/
patch -p2 < ../gvfs/patch.txt
network-manager-1.6.2/
patch -p2 < ../network-manager/patch.txt
policykit-1-0.105/
patch -p2 < ../policykit-1/patch.txt
udisks2-2.1.8/
patch -p2 < ../udisks2/patch.txt

