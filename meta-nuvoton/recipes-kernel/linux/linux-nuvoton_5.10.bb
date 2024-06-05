KSRC = "git://github.com/Nuvoton-Israel/linux;protocol=https;branch=${KBRANCH}"
KBRANCH = "NPCM-5.10-OpenBMC"
LINUX_VERSION = "5.10.161"
SRCREV = "353833b117f00cb09db91f065571a56b63e11642"

require linux-nuvoton.inc
SRC_URI:append:nuvoton = " file://enable_emmc_510.cfg"
SRC_URI:append:nuvoton = " file://disalbe_stackprotector.cfg"
SRC_URI:append:nuvoton = " file://enable-pcie-vdm.cfg"
SRC_URI:append:nuvoton = " file://enable-usb-legacy.cfg"
