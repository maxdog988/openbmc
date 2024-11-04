inherit entity-utils

FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://0001-Add-set-BIOS-version-support.patch \
    "

DEPENDS:append = " \
    ${@entity_enabled(d, '', 'olympus-nuvoton-yaml-config')}"

EXTRA_OEMESON:append = " \
    -Dboot-flag-safe-mode-support=enabled \
    ${@entity_enabled(d, '', '-Dsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/olympus-nuvoton-yaml-config/ipmi-sensors.yaml')} \
    ${@entity_enabled(d, '', '-Dfru-yaml-gen=${STAGING_DIR_HOST}${datadir}/olympus-nuvoton-yaml-config/ipmi-fru-read.yaml')} \
    ${@entity_enabled(d, '', '-Dinvsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/olympus-nuvoton-yaml-config/ipmi-inventory-sensors.yaml')} \
    "
PACKAGECONFIG:append = " ${@entity_enabled(d, 'dynamic-sensors', '')}"

EXTRA_OEMESON:append = " -Di2c-whitelist-check=disabled"

# for intel ipmi oem
do_install:append(){
    install -d ${D}${includedir}/phosphor-ipmi-host
    install -m 0644 -D ${S}/sensorhandler.hpp ${D}${includedir}/phosphor-ipmi-host
    install -m 0644 -D ${S}/selutility.hpp ${D}${includedir}/phosphor-ipmi-host
}
