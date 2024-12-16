inherit entity-utils
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://config-olympus-nuvoton.json"
SRC_URI:append = " file://fan-default-speed.sh"
SRC_URI:append = " file://phosphor-pid-control-olympus.service"
SRC_URI:append = " file://phosphor-pid-control-stop.service"
#SRC_URI:append = " file://phosphor-pid-control-bootcheck.service"
SRC_URI:append = " file://fan-reboot-control.service"
SRC_URI:append = " file://fan-boot-control.service"

FILES:${PN}:append = " ${bindir}/fan-default-speed.sh"
FILES:${PN}:append = " ${datadir}/swampd/config.json"

RDEPENDS:${PN} += "bash"

SYSTEMD_SERVICE:${PN}:append = " phosphor-pid-control-stop.service"
#SYSTEMD_SERVICE:${PN}:append = " phosphor-pid-control-bootcheck.service"
SYSTEMD_SERVICE:${PN}:append = " fan-reboot-control.service"
SYSTEMD_SERVICE:${PN}:append = " fan-boot-control.service"

inherit obmc-phosphor-systemd

PID_TMPL = "phosphor-pid-control.service"
CHASSIS_POWERON_TGTFMT = "obmc-chassis-poweron.target"
ENABLE_PID_FMT = "../${PID_TMPL}:${CHASSIS_POWERON_TGTFMT}.wants/${PID_TMPL}"
SYSTEMD_LINK:${PN}:append = " ${@compose_list(d, 'ENABLE_PID_FMT', 'OBMC_CHASSIS_INSTANCES')}"

PID_STOP_TMPL = "phosphor-pid-control-stop.service"
CHASSIS_POWEROFF_TGTFMT = "obmc-chassis-poweroff.target"
DISABLE_PID_FMT = "../${PID_STOP_TMPL}:${CHASSIS_POWEROFF_TGTFMT}.wants/${PID_STOP_TMPL}"
SYSTEMD_LINK:${PN}:append = " ${@compose_list(d, 'DISABLE_PID_FMT', 'OBMC_CHASSIS_INSTANCES')}"

do_install:append() {
    install -d ${D}/${bindir}
    install -m 0755 ${UNPACKDIR}/fan-default-speed.sh ${D}/${bindir}
    install -d ${D}${systemd_unitdir}/system

    if [ "${DISTRO}" != "olympus-entity" ];then
        install -d ${D}${datadir}/swampd
        install -m 0644 -D ${UNPACKDIR}/config-olympus-nuvoton.json \
            ${D}${datadir}/swampd/config.json
        install -m 0644 ${UNPACKDIR}/phosphor-pid-control-olympus.service \
            ${D}${systemd_unitdir}/system/phosphor-pid-control.service
    fi

    install -m 0644 ${UNPACKDIR}/phosphor-pid-control-stop.service \
        ${D}${systemd_unitdir}/system
    #install -m 0644 ${UNPACKDIR}/phosphor-pid-control-bootcheck.service \
    #    ${D}${systemd_unitdir}/system
    install -m 0644 ${UNPACKDIR}/fan-reboot-control.service \
        ${D}${systemd_unitdir}/system
    install -m 0644 ${UNPACKDIR}/fan-boot-control.service \
        ${D}${systemd_unitdir}/system
}
