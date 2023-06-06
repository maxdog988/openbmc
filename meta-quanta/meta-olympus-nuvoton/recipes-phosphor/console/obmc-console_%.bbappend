FILESEXTRAPATHS:prepend:olympus-nuvoton := "${THISDIR}/${PN}:"

SRC_URI:append:olympus-nuvoton = " file://80-olympus-nuvoton-sol.rules"
OBMC_CONSOLE_HOST_TTY:olympus-nuvoton = "ttyS2"

do_install:append:olympus-nuvoton() {
        install -d ${D}/${nonarch_base_libdir}/udev/rules.d
        rm -f ${D}/${nonarch_base_libdir}/udev/rules.d/80-obmc-console-uart.rules
        install -m 0644 ${WORKDIR}/80-olympus-nuvoton-sol.rules ${D}/${nonarch_base_libdir}/udev/rules.d
}
