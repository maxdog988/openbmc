FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"

SRC_URI:append = " file://config.txt"

FILES:${PN}:append = " ${datadir}/mac-address/config.txt"

do_install:append() {
    install -d ${D}${datadir}/mac-address
    install -m 0644 -D ${WORKDIR}/config.txt \
        ${D}${datadir}/mac-address/config.txt
}
