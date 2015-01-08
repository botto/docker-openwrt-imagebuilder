FROM ubuntu:14.04.1

ENV DEBIAN_FRONTEND noninteractive

ADD build/etc/apt/apt.conf.d/90-AlwaysYes /etc/apt/apt.conf.d/90-AlwaysYes

RUN apt-get update
RUN apt-get install build-essential
#RUN apt-get install zlib1g-dev
#RUN apt-get install gawk
#RUN apt-get install libncurses5-dev
#RUN apt-get install subversion
#RUN apt-get install libssl-dev
#RUN apt-get install unzip
#RUN apt-get install python
RUN apt-get install wget
RUN apt-get install git

RUN useradd -m builder

ADD https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2 /home/builder/openwrt.tar.bz2

RUN chown -R builder /home/builder

USER builder

WORKDIR /home/builder

RUN tar xf openwrt.tar.bz2

ADD build/repositories.conf /home/builder/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/repositories.conf

WORKDIR /home/builder/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64
