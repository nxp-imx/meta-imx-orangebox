# Copyright NXP 2023-2025

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "git://github.com/nxp-imx/obx_imx_ipc.git;protocol=https;branch=v1.0"
SRCREV = "74fac05c0fcb3ef7b478571427f76c12f1f0d416"

do_configure[depends] += "virtual/kernel:do_shared_workdir"

do_configure:prepend() {
    # Copy source to kernel tools directory
    rm -rf ${STAGING_KERNEL_DIR}/tools/obx_imx
    cp -r ${S} ${STAGING_KERNEL_DIR}/tools/obx_imx
}

do_compile() {
    oe_runmake -C ${STAGING_KERNEL_DIR}/tools/obx_imx srctree=${STAGING_KERNEL_DIR}
}

do_install(){
    install -d ${D}${bindir}
    install -m 0755 ${STAGING_KERNEL_DIR}/tools/obx_imx/obx_imx_s32k_spi_ipc_d ${D}${bindir}/
    install -m 0755 ${STAGING_KERNEL_DIR}/tools/obx_imx/obx_spi_ipc_cli ${D}${bindir}/
}

INSANE_SKIP:${PN}-dbg += "buildpaths"
