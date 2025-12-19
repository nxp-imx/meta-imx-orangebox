IMAGE_INSTALL += " \
    chrony \
    devmem2 \
    gpsd \
    libavtp \
    libftdi \
    libjitterentropy \
    libubootenv \
    alsa-plugins \
    rng-tools \
    packagegroup-fsl-pulseaudio \
    obx-imx-ipc \
    obx-statstool \
    lmsensors \
    greengrass-bin \
    alsa-utils-aplay \
    ddos-blocker \
    packagegroup-imx-ml \
"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
