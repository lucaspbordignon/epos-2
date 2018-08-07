FROM ubuntu:trusty

MAINTAINER Lucas Bordignon, bordi.lucas@gmail.com

RUN apt-get update && \
    apt-get install -y \
        bc \
        bin86 \
        build-essential \
        gdb \
        lib32bz2-1.0 \
        lib32ncurses5 \
        lib32stdc++6 \
        lib32z1 \
        libc6-i386 \
        libc6-dev-i386 \
        make \
        python3 \
        python3-pip \
        qemu \
        qemu-kvm \
        qemu-system-arm \
        tar \
        tcsh \
        wget && \
    sudo apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install pyserial

RUN wget --no-check-certificate -O ia32.tar.gz https://epos.lisha.ufsc.br/dl87 && \
    tar -zxvf ia32.tar.gz && \
    mkdir -p /usr/local/ia32/ && \
    mv gcc-4.4.4 /usr/local/ia32/ && \
    rm ia32.tar.gz

RUN wget --no-check-certificate -O arm.tar.gz http://epos.lisha.ufsc.br/dl88 && \
    tar -zxvf arm.tar.gz && \
    mkdir -p /usr/local/arm/ && \
    mv gcc-4.4.4 /usr/local/arm/ && \
    rm arm.tar.gz

VOLUME /workspace
WORKDIR /workspace
