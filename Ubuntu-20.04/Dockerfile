FROM docker.io/library/ubuntu:20.04

RUN apt-get update
RUN apt-get -y full-upgrade
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get -y --no-install-recommends install \
      binutils \
      make \
      libc6-dev \
      bzip2 \
      coreutils \
      curl \
      gcc \
      g++ \
      gcc-aarch64-linux-gnu \
      gcc-arm-linux-gnueabihf \
      gcc-riscv64-linux-gnu \
      git \
      libx11-dev \
      libxext-dev \
      acpica-tools \
      mono-devel \
      python-is-python3 \
      python3-distutils \
      python3-pip \
      python3.8-venv \
      sudo \
      uuid-dev

# Get nasm 2.15 from upstream website.
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get -y --no-install-recommends install \
      alien && \
    curl "https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/linux/nasm-2.15.05-0.fc31.x86_64.rpm" --output "nasm.rpm" && \
    alien --to-deb --install ./nasm.rpm && \
    rm -f *.rpm *.deb && \
    apt -y remove alien && \
    apt -y autoremove
RUN pip install pip --upgrade

# Install newer Qemu from Canonical Server Team ppa
RUN apt-get -y --no-install-recommends install software-properties-common && \
    add-apt-repository --yes ppa:canonical-server/server-backports && \
    apt-get --no-install-recommends install -y \
      qemu-system-arm \
      qemu-system-x86-64

ENV GCC5_AARCH64_PREFIX /usr/bin/aarch64-linux-gnu-
ENV GCC5_ARM_PREFIX     /usr/bin/arm-linux-gnueabi-
ENV GCC5_RISCV64_PREFIX /usr/bin/riscv64-unknown-elf-
