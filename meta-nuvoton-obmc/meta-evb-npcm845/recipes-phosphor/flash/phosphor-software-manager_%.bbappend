FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PACKAGECONFIG += "verify_signature flash_bios"
EXTRA_OEMESON:append = " -Doptional-images=image-bios"
