KSRC = "git://github.com/Nuvoton-Israel/linux;protocol=https;branch=${KBRANCH}"
KBRANCH = "NPCM-5.15-OpenBMC"
LINUX_VERSION = "5.15.85"
SRCREV = "3a68d8e33f9d7ce2d6ac33292517af412fd48812"

require linux-nuvoton.inc

SRC_URI:append:nuvoton = " file://0017-drivers-i2c-workaround-for-i2c-slave-behavior.patch"

