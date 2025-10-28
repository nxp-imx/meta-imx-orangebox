FILESEXTRAPATHS:append := "${THISDIR}/files:"

SRC_URI:append:mx8dxl-orangebox = "file://change_fdt.patch \
                                   file://obox-uboot-eth-enable.patch \
                                   file://add-sd-dts.patch \
"



