# Copyright NXP 2023
LICENSE = "GPL-2.0"
LIC_FILES_CHKSUM = "file://README.md;md5=e031e8d84e8210787f587ecc69bb0736"

S = "${WORKDIR}/git"

SRC_URI = "git://github.com/nxp-imx/obx_imx_ipc.git;protocol=https;branch=v1.0"
SRCREV = "74fac05c0fcb3ef7b478571427f76c12f1f0d416"

do_compile:prepend(){
install -d ${STAGING_KERNEL_DIR}/tools/obx_imx
cp -r ${S}/* ${STAGING_KERNEL_DIR}/tools/obx_imx
cd ${STAGING_KERNEL_DIR}/tools/obx_imx
}

do_install(){
install -d ${D}${bindir}
install ${STAGING_KERNEL_DIR}/tools/obx_imx/obx_imx_s32k_spi_ipc_d ${D}${bindir}/
install ${STAGING_KERNEL_DIR}/tools/obx_imx/obx_spi_ipc_cli ${D}${bindir}/
} 
