FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

#SRC_URI:append = " file://bios_defs.json"
#SRC_URI:append = " file://0001-main-add-feature-for-updating-BootProgress-and-Opera.patch"

SNOOP_DEVICE = "npcm7xx-lpc-bpc0"

#DEPENDS += "nlohmann-json"

#do_install:append() {
#        install -d ${D}${sysconfdir}/default/obmc/bios/
#        install -m 0644 ${UNPACKDIR}/bios_defs.json ${D}/${sysconfdir}/default/obmc/bios/
#}
