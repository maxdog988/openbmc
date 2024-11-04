FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://cpld-update.service"
SRC_URI:append = " file://cpld-update.sh "


SRCREV = "f2296005cbba13b49e5163340cac80efbec9cdf4"

inherit systemd
inherit obmc-phosphor-systemd

DEPENDS += "systemd"
RDEPENDS:${PN} += "bash"

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "cpld-update.service"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/cpld-update.sh ${D}${bindir}/
}
