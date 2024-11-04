FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://smbios2"
SRC_URI:append = " file://smbios-mdrv2.service"
SRC_URI:append = " file://xyz.openbmc_project.cpuinfo.service"
SRC_URI:append = " file://default-smbios.service"

FILES:${PN}:append = " ${datadir}/smbios/smbios2"

SYSTEMD_SERVICE:${PN}:append = " default-smbios.service"

do_install:append() {
    # For default smbios service install to var
    install -d ${D}${datadir}/smbios
    install -m 0644 -D ${WORKDIR}/smbios2 ${D}${datadir}/smbios/smbios2

    # Install default smbios service file
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/default-smbios.service ${D}${systemd_system_unitdir}

    # Replace service file only without entity manager
    if [ "${DISTRO}" != "olympus-entity" ];then
        install -m 0644 ${WORKDIR}/smbios-mdrv2.service ${D}${systemd_system_unitdir}
        install -m 0644 ${WORKDIR}/xyz.openbmc_project.cpuinfo.service ${D}${systemd_system_unitdir}
    fi
}

