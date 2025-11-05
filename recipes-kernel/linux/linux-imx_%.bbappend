FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/kconfig:"

SRC_URI:append:imx8dxl-orangebox = "file://set_250hz.cfg \
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
DELTA_KERNEL_DEFCONFIG += "set_250hz.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_tbf.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_gpiofs.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_usb_eth.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_pps_gpio.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_usb_serial.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_net_bridge.cfg"
DELTA_KERNEL_DEFCONFIG += "disable_faulty_battery_driver.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_function_tracer.cfg"
DELTA_KERNEL_DEFCONFIG += "enable_kmemleak_and_slab_debug.cfg"

# enforce copy_defconfig AFTER the patching process
addtask copy_defconfig after do_patch before do_preconfigure
addtask merge_delta_config before do_preconfigure after do_copy_defconfig

