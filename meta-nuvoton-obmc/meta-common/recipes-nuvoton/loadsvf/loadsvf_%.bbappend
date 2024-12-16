FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://cpld-update.service"
SRC_URI:append = " file://cpld-update.sh "

SRCREV = "e12b9b9bfd7626526fd65f58b943c552eb600160"

inherit systemd
inherit obmc-phosphor-systemd

DEPENDS += "systemd"
RDEPENDS:${PN} += "bash"

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "cpld-update.service"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${UNPACKDIR}/cpld-update.sh ${D}${bindir}/
}
