IMAGE_INSTALL:append = "packagegroup-core-boot  ${CORE_IMAGE_EXTRA_INSTALL}"
# BSP related helper packages
IMAGE_INSTALL:append = " kernel-modules usbutils openssl openssh-sftp openssh-sftp-server rng-tools mtd-utils minicom screen e2fsprogs-mke2fs u-boot-fw-utils libftdi devmem2"
IMAGE_INSTALL:append:imx8dxlevk = " imx-seco"

# V2X support packages
IMAGE_INSTALL:append = " chrony chronyc gpsd gpspipe iproute2 iproute2-tc ethtool linuxptp tcpdump iputils-arping cryptodev-module"

# Helper packages
IMAGE_INSTALL:append = " util-linux valgrind iperf3 libgpiod"

CORE_IMAGE_EXTRA_INSTALL += "libavtp alsa-plugins iproute2 iproute2-tc tcpdump"

IMAGE_INSTALL += " \
    packagegroup-fsl-pulseaudio \
    obx-imx-ipc \
    obx-statstool \
    lmsensors \
"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
