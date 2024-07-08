KSRC = "git://github.com/Nuvoton-Israel/linux;protocol=https;branch=${KBRANCH}"
KBRANCH = "NPCM-5.10-OpenBMC"
LINUX_VERSION = "5.10.161"
SRCREV = "ba6d25623e260c571c00485a3c03070d70c8ffbe"

require linux-nuvoton.inc
SRC_URI:append:nuvoton = " file://enable_emmc_510.cfg"
SRC_URI:append:nuvoton = " file://disalbe_stackprotector.cfg"
SRC_URI:append:nuvoton = " file://enable-pcie-vdm.cfg"
SRC_URI:append:nuvoton = " file://enable-usb-legacy.cfg"
