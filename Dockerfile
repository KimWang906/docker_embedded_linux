FROM ubuntu:18.04

# 환경설정
ENV DEBIAN_FRONTEND=noninteractive
ENV ARCH=arm
ENV CROSS_COMPILE=/usr/gcc-linaro-4.9.4/bin/arm-linux-gnueabihf-
ENV PATH="${PATH}:/usr/gcc-linaro-4.9.4/bin"

RUN apt-get update && apt-get -y install curl wget git u-boot-tools ncurses-dev device-tree-compiler lzop build-essential xz-utils zlib1g-dev bc
RUN apt-get -y install libusb-1.0-0-dev libbz2-dev libzstd-dev pkg-config cmake libssl-dev g++
RUN mkdir /mywork
WORKDIR /mywork
RUN git clone https://github.com/nxp-imx/mfgtools.git && cd /mywork/mfgtools/ && cmake . && make
COPY files /mywork/

RUN mkdir compiler App utils linux tmp
RUN tar xvf gcc-linaro-4.9.4.tar.xz -C /usr/
RUN tar xvf kernel.tar.gz
RUN tar xvf bootloader.tar.gz
RUN cd /mywork/bootloader && make distclean && make hybus_embedq6_defconfig && make && cp u-boot-dtb.imx /mywork/linux/
RUN cd /mywork/kernel && make distclean && make hybus_embedq6_defconfig && make -j4 && cp arch/arm/boot/zImage /mywork/linux/ && cp arch/arm/boot/dts/imx6q-sabresd-ldo.dtb /mywork/linux/ && cd /mywork
RUN cp filesystem.tar.bz2 /mywork/linux/
RUN mv bootloader.tar.gz filesystem.tar.bz2 gcc-linaro-4.9.4.tar.xz kernel.tar.gz /mywork/tmp/