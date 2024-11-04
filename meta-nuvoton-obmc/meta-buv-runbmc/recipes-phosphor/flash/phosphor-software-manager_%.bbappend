FILESEXTRAPATHS:prepend:buv-runbmc := "${THISDIR}/${PN}:"

#SRC_URI:append:buv-runbmc = " file://0004-Add-support-for-MCU-firmware-upgrade.patch"
#SRC_URI:append:buv-runbmc = " file://0005-Add-support-for-CPLD-firmware-upgrade.patch"

#PACKAGECONFIG[flash_mcu] = "-Dmcu-upgrade=enabled, -Dmcu-upgrade=disabled"
#PACKAGECONFIG[flash_cpld] = "-Dcpld-upgrade=enabled, -Dcpld-upgrade=disabled"
#PACKAGECONFIG:append:buv-runbmc = " verify_signature flash_bios flash_mcu flash_cpld"
EXTRA_OEMESON:append:buv-runbmc = " -Doptional-images=image-bios"
