FILESEXTRAPATHS_prepend := "${THISDIR}/linux-nuvoton:"

KBRANCH = "Poleg-4.17.04-OpenBMC"
LINUX_VERSION = "4.17.4"

KSRC = "git://github.com/Nuvoton-Israel/linux;protocol=git;branch=${KBRANCH}"
SRCREV = "Poleg-4.17.04-OpenBMC-20181017"

SRC_URI += "file://evb-npcm750.cfg"
SRC_URI += "file://enable-vcd-ece.cfg"
SRC_URI += "file://enable-configfs-hid.cfg"
SRC_URI += "file://001-partitions.patch"
