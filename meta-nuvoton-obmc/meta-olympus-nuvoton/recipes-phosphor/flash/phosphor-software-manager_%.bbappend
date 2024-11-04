FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


#SRC_URI:append = " file://avoid_update_bios_fail_remove_mmc"
#SRC_URI:append = " file://0001-Add-support-for-PSU-firmware-upgrade.patch"

PACKAGECONFIG:append = " verify_signature flash_bios"
EXTRA_OEMESON:append = " -Doptional-images=image-bios"
