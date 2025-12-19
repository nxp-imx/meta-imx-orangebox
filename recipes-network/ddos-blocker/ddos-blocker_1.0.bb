# Copyright 2025 NXP
# Released under the LA_OPT_NXP_Software_License 
SECTION = "examples"
LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://LICENSE;md5=c527c8e980c6f87bb58ff58f3351e23d"
DESCRIPTION = "i.MX DDoS Blocker for Orangebox demo"
 
inherit autotools pkgconfig
 
SRC_URI = "git://github.com/nxp-imx-support/app-network-ml.git;protocol=https;branch=${SRCBRANCH}"
SRCBRANCH = "imx-ddb"
SRCREV = "962bde564ea23a4f77438084f484c6176a3699dd"
 
DEPENDS = "dpdk"
 
RDEPENDS:${PN} = "python3 \
            python3-pip \
            bash \
            python3-flask \
            python3-posix-ipc \
            "
S = "${WORKDIR}/git" 
B = "${S}/sources"
 
do_configure[noexec] = "1"
do_compile() {
    make -C ${S}/sources
}
 
do_install() {
    DB_ROOT="${D}${datadir}/ddos-blocker"
 
    install -d ${DB_ROOT}
    install -d ${DB_ROOT}/model
    install -d ${DB_ROOT}/webui
    install -d ${DB_ROOT}/victim-prog
 
    install -m 0755 ${B}/build/* ${DB_ROOT}/
    install -m 0755 ${B}/model/model_inference_main.py ${DB_ROOT}/model
    cp -r ${B}/webui/* ${DB_ROOT}/webui/
    install -m 0755 ${B}/../output/LUCID-ddos-CIC2019-quant-int8.tflite ${DB_ROOT}/model/
    install -m 0755 ${B}/../run_demo.sh ${DB_ROOT}/
    install -m 0644 ${B}/requirements-for-board.txt ${DB_ROOT}/
    install -m 0755 ${B}/victim_webser/* ${DB_ROOT}/victim-prog/
}
 
FILES:${PN} += "${datadir}/ddos-blocker/*"
 
# Skip QA check for wrong libdir
INSANE_SKIP:${PN} += "libdir"
INSANE_SKIP:${PN}-dbg += "libdir"