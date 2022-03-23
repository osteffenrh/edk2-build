FROM docker.io/library/ubuntu:20.04

RUN apt-get update
RUN apt-get -y full-upgrade
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get -y --no-install-recommends install \
      binutils \
      bison \
      build-essential \
      bzip2 \
      coreutils \
      curl \
      dpkg \
      gcc \
      gcc-aarch64-linux-gnu \
      gcc-arm-linux-gnueabihf \
      git \
      gnupg2 \
      jq \
      m4 \
      mono-runtime \
      openssh-client \
      pass \
      patchelf \
      pkg-config \
      python-is-python3 \
      python3-distutils \
      python3-pip \
      python3.8-venv \
      rpm \
      shellcheck \
      ssh \
      sshpass \
      sudo \
      time \
      unzip \
      uuid-dev \
      wget \
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
