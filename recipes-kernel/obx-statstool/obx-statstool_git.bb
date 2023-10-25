# Copyright NXP 2023
LICENSE = "GPL-2.0"
LIC_FILES_CHKSUM = "file://README.md;md5=0bf5fc50eadb8f71be8a9369fa95af71"

S = "${WORKDIR}/git"

SRC_URI = "git://github.com/nxp-imx/obx_statstool.git;protocol=https;branch=v1.0"
SRCREV = "3a76c4f3f3c47d935d5bd6d483f6a2bb260d846a"

do_compile:prepend(){
cp -r ${S}/../git/ ${STAGING_KERNEL_DIR}/tools/
cd ${STAGING_KERNEL_DIR}/tools/git
}

do_install(){
install -d ${D}${bindir}
install ${STAGING_KERNEL_DIR}/tools/git/obx_system_stats_d ${D}${bindir}/
install ${STAGING_KERNEL_DIR}/tools/git/obx_stats_cli ${D}${bindir}/
} 
