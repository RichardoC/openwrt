FROM ubuntu:20.04

# Required to prevent interactive time prompt
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# From Ubuntu
# https://openwrt.org/docs/guide-developer/build-system/install-buildsystem
RUN apt-get update && apt-get install -y \
    subversion g++ zlib1g-dev build-essential git \
    python python3 python3-distutils libncurses5-dev gawk gettext unzip \
    file libssl-dev wget libelf-dev ecj fastjar java-propose-classpath \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Allow passwordless sudo
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 builder

USER builder

WORKDIR /home/builder/openwrt