FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://80-evb-npcm845-sol.rules"
SRC_URI:append = " file://server.ttyS1.conf"
SRC_URI:append = " file://server.ttyS4.conf"
SRC_URI:append = " file://server.ttyS5.conf"

OBMC_CONSOLE_TTYS = "ttyS1 ttyS4 ttyS5"

do_install:append() {
        install -d ${D}/${nonarch_base_libdir}/udev/rules.d
        rm -f ${D}/${nonarch_base_libdir}/udev/rules.d/80-obmc-console-uart.rules
        install -m 0644 ${UNPACKDIR}/80-evb-npcm845-sol.rules ${D}/${nonarch_base_libdir}/udev/rules.d
}
