FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://orangebox.patch \
         "

DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"

do_compile:prepend(){
cp -r ${UNPACKDIR}/* ${WORKDIR}/
}
