FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y 

RUN apt-get install -y build-essential \
	git \
	vim \
	bison \
	flex \
	bc \
	wget

RUN apt-get install -y sudo 

# create user
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
RUN echo "ubuntu:ubuntu" | chpasswd
USER ubuntu
WORKDIR /home/ubuntu

# download arm 64 toolchain
RUN wget https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz \
	&& unxz gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz \
	&& tar -xvf gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar \
	&& rm gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar

# download u boot repo 
RUN git clone https://source.denx.de/u-boot/u-boot.git

# expose cross compile variable
ENV ARCH=arm64
ENV CROSS_COMPILE=/home/ubuntu/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
