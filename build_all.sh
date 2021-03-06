#!/bin/bash

git clone https://github.com/bidaian/no-systemd.git
sudo apt-get build-dep dbus network-manager policykit-1 udisks2
apt-get source dbus network-manager policykit-1 udisks2

echo "***********************************"
echo Building d-bus
echo "***********************************"
cd dbus-1.10.22/
patch -p2 < ../no-systemd/dbus/patch.txt
dpkg-buildpackage -us -uc -nc
cd ..
echo "***********************************"
echo Building network-manager ...
echo "***********************************"
cd network-manager-1.6.2/
patch -p2 < ../no-systemd/network-manager/patch.txt
dpkg-buildpackage -us -uc -nc
cd ..
echo "***********************************"
echo Building policykit-1 ...
echo "***********************************"
cd policykit-1-0.105/
patch -p2 < ../no-systemd/policykit-1/patch.txt
dpkg-buildpackage -us -uc -nc
cd ..
echo "***********************************"
echo Building udisks2 ...
echo "***********************************"
cd udisks2-2.1.8/
patch -p2 < ../no-systemd/udisks2/patch.txt
dpkg-buildpackage -us -uc -nc
cd ..

