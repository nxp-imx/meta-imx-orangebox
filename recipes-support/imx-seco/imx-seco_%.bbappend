do_configure:append() {
    # create version file
    printf "%26s %s" "${SUMMARY}" "${PV}" > ${S}/seco-firmware.version
}

do_install:append() {
    # install version
    install -d ${D}/opt/versions
    install -Dm 644 ${S}/seco-firmware.version ${D}/opt/versions/seco-firmware.version
}

FILES:${PN} += " \
                 /opt/versions/seco-firmware.version \
               "
