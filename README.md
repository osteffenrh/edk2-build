# Unofficial build images for EDK2 CI


| Image \ gcc  |         x86 |         arm |         aarch64 |       RiscV64 |
| ------------ | ----------- | ----------- | --------------- | ------------- |
| [Ubuntu 20.04](https://github.com/osteffenrh/edk2-build-images/pkgs/container/edk2-build-images%2Fubuntu-20.04) |      9      |     --      |        --       |       --      |
| [Ubuntu 22.04](https://github.com/osteffenrh/edk2-build-images/pkgs/container/edk2-build-images%2Fubuntu-22.04) |     11      |     11      |        11       |       11      |
| [Fedora 35](https://github.com/osteffenrh/edk2-build-images/pkgs/container/edk2-build-images%2Ffedora-35)       |     11      |     11      |        11       |       11      |
| [Fedora 36](https://github.com/osteffenrh/edk2-build-images/pkgs/container/edk2-build-images%2Ffedora-36)       |     12      |     12      |        12       |       12     |

Ubuntu 22.04 requires `-fno-stack-protector` (See https://edk2.groups.io/g/devel/message/89123).
