Script that prepares a dockerfile to build a openwrt imagebuilder

To prepare an ar71xxx imagebuilder

```bash
$ ./prepare.sh https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
$ docker build -t botto/openwrt-imagebuilder-ar71xxx .
```


```bash
$ docker run botto/openwrt-imagebuilder-ar71xxx make info
$ docker run botto/openwrt-imagebuilder-ar71xxx make image PROFILE="TLWR703"
```

If you want to have the bin files dumped to a location you can access them on the host machine

```bash
$ cd docker-openwrt-imagebuilder
$ mkdir openwrt-bin
$ docker run -v openwrt-bin:/openwrt-bin botto/openwrt-imagebuilder-ar71xxx make image PROFILE="TLWR703" BIN_DIR="/openwrt-bin"
$ cd openwrt-bin
```


