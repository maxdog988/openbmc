FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://0001-smbiosmdrv2handler-add-new-ipmi-oem-cmd-for-mdrv2.patch"
