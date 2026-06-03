FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:imx943-orangebox = "${@bb.utils.contains('MACHINE_FEATURES', 'ob2-apps', ' file://0001-imx943-orangebox-dts-update-Makefile-for-qtm-5G-v2x.patch ', '', d)}"
SRC_URI:append:imx943-orangebox = "${@bb.utils.contains('MACHINE_FEATURES', 'ob2-apps', ' file://cfg/enable_usb_eth.cfg ', '', d)}"

DTS_FILES:append:imx943-orangebox = "${@bb.utils.contains('MACHINE_FEATURES', 'ob2-apps', ' \
    file://dts/imx943-orangebox-5G-modem.dts \
    file://dts/imx943-orangebox-qtm.dtso \
    file://dts/imx943-orangebox-sdv2x.dtso \
    file://dts/imx943-orangebox-kw47.dtso \
    file://dts/imx943-orangebox-gnss.dtso \
    file://dts/imx943-orangebox-rpmsg.dtso \
    file://dts/imx943-orangebox-lowpower.dtso \
    ', '', d)}"

SRC_URI:append:imx943-orangebox = "${@bb.utils.contains('MACHINE_FEATURES', 'ob2-apps', ' ${DTS_FILES}', '', d)}"

do_patch:prepend:imx943-orangebox() {
    echo "Starting to copy DTS files after patching."
    if [ -n "${DTS_FILES}" ]; then
        cp ${UNPACKDIR}/dts/*.dts ${S}/arch/arm64/boot/dts/freescale/
        cp ${UNPACKDIR}/dts/*.dtso ${S}/arch/arm64/boot/dts/freescale/
    fi
}

SRC_URI:append:imx8dxl-orangebox = " \
    file://kconfig/set_250hz.cfg \
    file://kconfig/enable_tbf.cfg \
    file://kconfig/enable_gpiofs.cfg \
    file://kconfig/enable_usb_eth.cfg \
    file://kconfig/enable_pps_gpio.cfg \
    file://kconfig/enable_usb_serial.cfg \
    file://kconfig/enable_net_bridge.cfg \
    file://kconfig/disable_faulty_battery_driver.cfg \
    file://kconfig/enable_function_tracer.cfg \
    file://kconfig/enable_kmemleak_and_slab_debug.cfg \
"

LOCALVERSION:imx8dxl-orangebox = "-imx8dxl-ob"
LOCALVERSION:imx943-orangebox  = "-imx943-ob2"

