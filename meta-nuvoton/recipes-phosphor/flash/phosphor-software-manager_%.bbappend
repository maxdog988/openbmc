FILESEXTRAPATHS:prepend:nuvoton := "${THISDIR}/${PN}:"

SRC_URI:append:nuvoton:df-phosphor-mmc = " file://disable-mmc-mirroruboot.patch"
SRC_URI:append:nuvoton = " file://0001-Restore-and-verify-BIOS.patch"
SRC_URI:append:nuvoton = " file://0002-Support-ignore-update-uboot-with-eMMC-image.patch"
SRC_URI:append:nuvoton = " file://0003-Add-support-report-same-version-error.patch"
