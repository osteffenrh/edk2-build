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
      gcc-10 \
      g++-10 \
      gcc-10-aarch64-linux-gnu \
      gcc-10-arm-linux-gnueabihf \
      gcc-10-riscv64-linux-gnu \
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

RUN \
  update-alternatives \
      --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 \
      --slave   /usr/bin/cc cc /usr/bin/gcc-10 \
      --slave   /usr/bin/gcov gcov /usr/bin/gcov-10 \
      --slave   /usr/bin/nm gcc-nm /usr/bin/gcc-nm-10 \
      --slave   /usr/bin/ranlib gcc-ranlib /usr/bin/gcc-ranlib-10 \
      --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-10 && \
  update-alternatives \
      --install /usr/bin/g++ g++ /usr/bin/g++-10 100 \
      --slave   /usr/bin/c++ c++ /usr/bin/g++-10 && \
  update-alternatives \
      --install /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-10 100 \
      --slave   /usr/bin/aarch64-linux-gnu-gcov aarch64-linux-gnu-gcov /usr/bin/aarch64-linux-gnu-gcov-10 \
      --slave   /usr/bin/aarch64-linux-gnu-gcc-nm aarch64-linux-gnu-gcc-nm /usr/bin/aarch64-linux-gnu-gcc-nm-10 \
      --slave   /usr/bin/aarch64-linux-gnu-gcc-ranlib aarch64-linux-gnu-gcc-ranlib /usr/bin/aarch64-linux-gnu-gcc-ranlib-10 \
      --slave   /usr/bin/aarch64-linux-gnu-gcc-ar aarch64-linux-gnu-gcc-ar /usr/bin/aarch64-linux-gnu-gcc-ar-10 && \
  update-alternatives \
      --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-10 100 \
      --slave   /usr/bin/arm-linux-gnueabihf-gcov arm-linux-gnueabihf-gcov /usr/bin/arm-linux-gnueabihf-gcov-10 \
      --slave   /usr/bin/arm-linux-gnueabihf-gcc-nm arm-linux-gnueabihf-gcc-nm /usr/bin/arm-linux-gnueabihf-gcc-nm-10 \
      --slave   /usr/bin/arm-linux-gnueabihf-gcc-ranlib arm-linux-gnueabihf-gcc-ranlib /usr/bin/arm-linux-gnueabihf-gcc-ranlib-10 \
      --slave   /usr/bin/arm-linux-gnueabihf-gcc-ar arm-linux-gnueabihf-gnu-gcc-ar /usr/bin/arm-linux-gnueabihf-gcc-ar-10 && \
  update-alternatives \
      --install /usr/bin/riscv64-linux-gnu-gcc riscv64-linux-gnu-gcc /usr/bin/riscv64-linux-gnu-gcc-10 100 \
      --slave   /usr/bin/riscv64-linux-gnu-gcov riscv64-linux-gnu-gcov /usr/bin/riscv64-linux-gnu-gcov-10 \
      --slave   /usr/bin/riscv64-linux-gnu-gcc-nm riscv64-linux-gnu-gcc-nm /usr/bin/riscv64-linux-gnu-gcc-nm-10 \
      --slave   /usr/bin/riscv64-linux-gnu-gcc-ranlib riscv64-linux-gnu-gcc-ranlib /usr/bin/riscv64-linux-gnu-gcc-ranlib-10 \
      --slave   /usr/bin/riscv64-linux-gnu-gcc-ar riscv64-linux-gnu-gnu-gcc-ar /usr/bin/riscv64-linux-gnu-gcc-ar-10

RUN pip install pip --upgrade

# Install newer Qemu from Canonical Server Team ppa
RUN apt-get -y --no-install-recommends install software-properties-common && \
    add-apt-repository --yes ppa:canonical-server/server-backports && \
    apt-get --no-install-recommends install -y \
      qemu-system-arm \
      qemu-system-x86-64
