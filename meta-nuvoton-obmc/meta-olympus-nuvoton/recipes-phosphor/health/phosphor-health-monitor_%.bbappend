FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bmc_health_config.json"

do_install:append() {
    install -m 0644 -D ${UNPACKDIR}/bmc_health_config.json \
        ${D}${sysconfdir}/healthMon/bmc_health_config.json
}
