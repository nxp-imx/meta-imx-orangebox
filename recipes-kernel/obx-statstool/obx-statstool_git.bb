# Copyright NXP 2023-2025

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0858ec9c7a80c4a2cf16e4f825a2cc91"

SRC_URI = "git://github.com/nxp-imx/obx_statstool.git;protocol=https;branch=v1.0"
SRCREV = "3a76c4f3f3c47d935d5bd6d483f6a2bb260d846a"

do_configure[depends] += "virtual/kernel:do_shared_workdir"

do_configure() {
    # Copy source to kernel tools directory
    rm -rf ${STAGING_KERNEL_DIR}/tools/${BPN}
    cp -r ${S} ${STAGING_KERNEL_DIR}/tools/${BPN}
}

do_compile() {
    oe_runmake -C ${STAGING_KERNEL_DIR}/tools/${BPN} srctree=${STAGING_KERNEL_DIR}
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${STAGING_KERNEL_DIR}/tools/${BPN}/obx_system_stats_d ${D}${bindir}/
    install -m 0755 ${STAGING_KERNEL_DIR}/tools/${BPN}/obx_stats_cli ${D}${bindir}/
}

INSANE_SKIP:${PN}-dbg += "buildpaths"
