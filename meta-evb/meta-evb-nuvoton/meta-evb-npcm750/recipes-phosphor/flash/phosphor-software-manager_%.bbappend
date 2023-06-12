FILESEXTRAPATHS:prepend:evb-npcm750 := "${THISDIR}/${PN}:"

PACKAGECONFIG:append:evb-npcm750 = " verify_signature flash_bios"
EXTRA_OEMESON:append:evb-npcm750 = " -Doptional-images=image-bios"
