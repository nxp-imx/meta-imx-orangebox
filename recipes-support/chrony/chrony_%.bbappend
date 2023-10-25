FILESEXTRAPATHS:append := "${THISDIR}/config:"

SRC_URI += "file://chronyd.service \
            file://chrony_nopps.conf \
            file://chrony_pps.conf \
            file://chrony_setup \
           "
RDEPENDS:${PN} += "bash"
do_configure:append() {

    # replace the systemd service used by the default recipe
    cp ${WORKDIR}/chronyd.service               ${S}/examples/chronyd.service
}

do_install:append() {

    # configuration files and setup file
    install -d ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/chrony_setup      ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/chrony_pps.conf   ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/chrony_nopps.conf ${D}${sysconfdir}

    # fix hard-coded paths in config files and init scripts
    sed -i -e 's!/var/!${localstatedir}/!g' -e 's!/etc/!${sysconfdir}/!g' \
           -e 's!/usr/sbin/!${sbindir}/!g' -e 's!/usr/bin/!${bindir}/!g' \
           ${D}${sysconfdir}/chrony_pps.conf
    sed -i -e 's!/var/!${localstatedir}/!g' -e 's!/etc/!${sysconfdir}/!g' \
           -e 's!/usr/sbin/!${sbindir}/!g' -e 's!/usr/bin/!${bindir}/!g' \
           ${D}${sysconfdir}/chrony_nopps.conf
}

RCONFLICTS:${PN} = "ntimed"
FILES:${PN} += "${sysconfdir}/chrony_setup \
                ${sysconfdir}/chrony_pps.conf \
                ${sysconfdir}/chrony_nopps.conf \
               "
