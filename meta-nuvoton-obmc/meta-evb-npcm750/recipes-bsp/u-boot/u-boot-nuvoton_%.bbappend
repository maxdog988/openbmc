FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-nuvoton:"

UBOOT_MAKE_TARGETappend =" DEVICE_TREE=${UBOOT_DEVICETREE}"

SRC_URI:append =" file://fixed_phy.cfg"
SRC_URI:append =" file://wdt.cfg"