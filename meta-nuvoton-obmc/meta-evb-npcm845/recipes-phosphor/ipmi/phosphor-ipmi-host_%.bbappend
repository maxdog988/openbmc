inherit entity-utils

FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"

DEPENDS:append = " ${@entity_enabled(d, '', ' evb-npcm845-yaml-config')}"

EXTRA_OEMESON:append = " \
    -Di2c-whitelist-check=disabled \
    ${@entity_enabled(d, '', '-Dsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/evb-npcm845-yaml-config/ipmi-sensors.yaml')} \
    ${@entity_enabled(d, '', '-Dfru-yaml-gen=${STAGING_DIR_HOST}${datadir}/evb-npcm845-yaml-config/ipmi-fru-read.yaml')} \
    ${@entity_enabled(d, '', '-Dinvsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/evb-npcm845-yaml-config/ipmi-inventory-sensors.yaml')} \
    "

# Add send/get message support
# ipmid <-> ipmb <-> i2c
SRC_URI:append = " file://0002-Support-bridging-commands.patch"

# Fix build error when enable dbus-sdr
# SRC_URI:append = " file://0001-dbus-sdr-fix-build-break.patch"

PACKAGECONFIG:append = " ${@entity_enabled(d, 'dynamic-sensors', '')}"

# avoid build error after remove ipmi-fru
WHITELIST_CONF = "${S}/host-ipmid-whitelist.conf"
