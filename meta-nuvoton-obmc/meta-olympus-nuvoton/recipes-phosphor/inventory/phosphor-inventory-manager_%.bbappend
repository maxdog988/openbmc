FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://0001-support-type-uint64-uint16-uint8-for-smbios.patch"
