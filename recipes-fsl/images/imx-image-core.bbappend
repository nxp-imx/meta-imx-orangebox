IMAGE_INSTALL:append = "packagegroup-core-boot  packagegroup-fsl-pulseaudio ${CORE_IMAGE_EXTRA_INSTALL} kernel-modules \
                        usbutils openssl openssh-sftp openssh-sftp-server rng-tools mtd-utils minicom screen e2fsprogs-mke2fs u-boot-fw-utils libftdi devmem2 \
                        chrony chronyc gpsd gpspipe iproute2 iproute2-tc ethtool linuxptp tcpdump iputils-arping cryptodev-module \
                        util-linux valgrind iperf3 libgpiod obx-imx-ipc obx-statstool lmsensors greengrass-bin alsa-utils-aplay"

IMAGE_INSTALL:append:imx8dxl-orangebox = " imx-seco"

CORE_IMAGE_EXTRA_INSTALL += "libavtp alsa-plugins iproute2 iproute2-tc tcpdump"

IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
