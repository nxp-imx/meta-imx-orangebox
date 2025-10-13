# Copyright NXP 2023-2025

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0858ec9c7a80c4a2cf16e4f825a2cc91"

SRC_URI = "git://github.com/nxp-imx/obx_statstool.git;protocol=https;branch=v1.0"
SRCREV = "3a76c4f3f3c47d935d5bd6d483f6a2bb260d846a"

do_configure[depends] += "virtual/kernel:do_shared_workdir"

do_compile:prepend(){
cp -r ${S}/../git/ ${STAGING_KERNEL_DIR}/tools/
cd ${STAGING_KERNEL_DIR}/tools/git
}

do_install(){
install -d ${D}${bindir}
install ${STAGING_KERNEL_DIR}/tools/git/obx_system_stats_d ${D}${bindir}/
install ${STAGING_KERNEL_DIR}/tools/git/obx_stats_cli ${D}${bindir}/
}

INSANE_SKIP:${PN}-dbg += "buildpaths"
