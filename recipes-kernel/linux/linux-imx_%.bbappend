FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/kconfig:${THISDIR}/${PN}"

SRC_URI:append:imx943-orangebox = "${@bb.utils.contains('MACHINE_FEATURES', 'ob2-apps', ' file://0001-imx943-orangebox-dts-update-Makefile-for-qtm-5G-v2x.patch ', '', d)}"
SRC_URI:append:imx943-orangebox = "${@bb.utils.contains('MACHINE_FEATURES', 'ob2-apps', ' file://cfg/enable_usb_eth.cfg ', '', d)}"

DTS_FILES:imx943-orangebox = " \
                               file://dts/imx943-orangebox-5G-modem.dts \
                               file://dts/imx943-orangebox-qtm.dts \
                               file://dts/imx943-orangebox-sdv2x.dts \
                               file://dts/imx943-orangebox.dts"
SRC_URI:append:imx943-orangebox = "${DTS_FILES}"

do_patch:prepend:imx943-orangebox() {
    echo "Starting to copy DTS files after patching."
    if [ -n "${DTS_FILES}" ]; then
        cp ${UNPACKDIR}/dts/*.dts ${S}/arch/arm64/boot/dts/freescale/
    fi
}

DELTA_KERNEL_DEFCONFIG:append:imx8dxl-orangebox = "\
                                                   enable_usb_eth.cfg"

SRC_URI:append:imx8dxl-orangebox = " \
                                    file://set_250hz.cfg \
                                    file://enable_tbf.cfg \
                                    file://enable_gpiofs.cfg \
                                    file://enable_usb_eth.cfg \
                                    file://enable_pps_gpio.cfg \
                                    file://enable_usb_serial.cfg \
                                    file://enable_net_bridge.cfg \
                                    file://disable_faulty_battery_driver.cfg \
                                    file://enable_function_tracer.cfg \
                                    file://enable_kmemleak_and_slab_debug.cfg"

# kernel configuration fragments
DELTA_KERNEL_DEFCONFIG:append:imx8dxl-orangebox = "\
                                                  set_250hz.cfg \
                                                  enable_tbf.cfg \
                                                  enable_gpiofs.cfg \ 
                                                  enable_usb_eth.cfg \
                                                  enable_pps_gpio.cfg \
                                                  enable_usb_serial.cfg \
                                                  enable_net_bridge.cfg \
                                                  disable_faulty_battery_driver.cfg \
                                                  enable_function_tracer.cfg \
                                                  enable_kmemleak_and_slab_debug.cfg "

LOCALVERSION:imx8dxl-orangebox = "-imx8dxl-orangebox"
LOCALVERSION:imx943-orangebox  = "-imx943-orangebox"

# enforce copy_defconfig AFTER the patching process
addtask copy_defconfig after do_patch before do_preconfigure
addtask merge_delta_config before do_preconfigure after do_copy_defconfig

