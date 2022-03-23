FROM docker.io/library/ubuntu:20.04

RUN apt-get update
RUN apt-get -y full-upgrade
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get -y --no-install-recommends install \
      binutils \
      build-essential \
      bzip2 \
      coreutils \
      curl \
      gcc \
      gcc-aarch64-linux-gnu \
      gcc-arm-linux-gnueabihf \
      git \
      jq \
      m4 \
      mono-runtime \
      openssh-client \
      pass \
      pkg-config \
      python-is-python3 \
      python3-distutils \
      python3-pip \
      python3.8-venv \
      ssh \
      sshpass \
      sudo \
      unzip \
      uuid-dev \
      xorriso \
      xz-utils \
      zip

RUN pip install pip --upgrade

# Install newer Qemu from Canonical Server Team ppa
RUN apt-get -y --no-install-recommends install software-properties-common && \
    add-apt-repository --yes ppa:canonical-server/server-backports && \
    apt-get --no-install-recommends install -y \
      qemu-system-arm \
      qemu-system-x86-64
