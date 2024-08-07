DESCRIPTION = "NPCM JTAG library"
PR = "r1"
PV = "1.0+git${SRCPV}"

LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "git://github.com/Nuvoton-Israel/libnpcm-jtag.git;branch=master;protocol=https"
SRCREV = "8b8251d71113a1f21d654be6a6c364519532190c"
S = "${WORKDIR}/git"

inherit autotools pkgconfig
DEPENDS += "autoconf-archive-native"

PACKAGECONFIG[legacy-ioctl] = "--enable-legacy-ioctl,--disable-legacy-ioctl"
PACKAGECONFIG[build-loadsvf] = "--enable-build-loadsvf,--disable-build-loadsvf"
PACKAGECONFIG:append:npcm7xx = " legacy-ioctl"
