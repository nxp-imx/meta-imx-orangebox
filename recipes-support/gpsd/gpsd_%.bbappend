# separate the client program into its own package
PACKAGES =+ "gpspipe"
FILES:gpspipe = "${bindir}/gpspipe"

FILESEXTRAPATHS:append := "${THISDIR}/files"

SRC_URI += "file://gpsd-default-conf \
           "

do_install:append() {
    install -d ${D}/${sysconfdir}/default/
    install -m 0644 ${WORKDIR}/gpsd-default-conf ${D}/${sysconfdir}/default/gpsd.default
}

SYSTEMD_SERVICE:${PN} += "${PN}.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

FILES:${PN} += "${sysconfdir}/default/gpsd.default"
