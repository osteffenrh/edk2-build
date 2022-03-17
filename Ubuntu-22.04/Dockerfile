FROM docker.io/library/ubuntu:22.04

RUN apt-get update
RUN apt-get -y full-upgrade
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get -y --no-install-recommends install \
      binutils \
      make \
      libc6-dev \
      coreutils \
      gcc \
      g++ \
      gcc-aarch64-linux-gnu \
      gcc-arm-linux-gnueabi \
      gcc-riscv64-unknown-elf \
      git \
      libx11-dev \
      libxext-dev \
      acpica-tools \
      mono-devel \
      python-is-python3 \
      python3-distutils \
      python3-pip \
      python3-venv \
      python3-setuptools \
      sudo \
      uuid-dev \
      nasm \
      qemu-system-arm \
      qemu-system-x86-64

RUN pip install pip --upgrade

ENV GCC5_AARCH64_PREFIX /usr/bin/aarch64-linux-gnu-
ENV GCC5_ARM_PREFIX     /usr/bin/arm-linux-gnueabi-
ENV GCC5_RISCV64_PREFIX /usr/bin/riscv64-unknown-elf-
