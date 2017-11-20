# no-systemd
Patches to build and install debian packages without systemd dependencies

## Why this repository
This repository is meant to have patches for the debian source packages so that systemd is not forced as a dependency if it is not necessary for the package to run. For example, network-manager depends on systemd in Debian, but from a functional point of view, [it doesn't actually need systemd](http://gnome-networkmanager.2324886.n4.nabble.com/Running-NM-without-systemd-td26578.html#a26582). Since the maintainers [don't always have the resources](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=873368#10) to keep the two versions, you can find here the patches to compile from source.

Patches are very small, and contain the absolute minimum (some lines) to avoid packages pulling in systemd. By using them you no longer have to trust external binaries or sources.

## Build and install the no-systemd version of a package
### Prequisites
First you have to add the source repositories to your /etc/apt/sources.list, for example by adding this line:

`deb-src  http://deb.debian.org/debian stretch main`

then:

`$ sudo apt-get update`
### Building the package
Now let's say you want to build **udisks2**:

You can either clone this repository: `$ git clone https://github.com/bidaian/no-systemd.git`

or you can get just the patch you're interested in from https://github.com/bidaian/no-systemd

```
$ sudo apt-get build-dep udisks2
$ apt-get source udisks2
$ cd udisks2-2.1.8
$ patch -p2 < ../no-systemd/udisk2/stretch.patch
$ dpkg-buildpackage -us -uc -nc
```
### Installing the package
You will have the .deb packages ready to install:

```
$ cd ..
$ sudo dpkg -i udisks2_2.1.8-1_amd64.deb
$ sudo apt-get install -f
```
