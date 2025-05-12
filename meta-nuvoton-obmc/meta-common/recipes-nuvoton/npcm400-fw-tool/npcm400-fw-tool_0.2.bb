DESCRIPTION = "NPCM400F SMC firmware programmer"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

FILENAME = "NpcmFwProg_${PV}.bmc"

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

SRCREV = "916a579fead398498de6d476fa99f9e4657fb125"
SRC_URI = " \
    https://github.com/Nuvoton-Israel/npcmFwProg/releases/download/v${PV}/NpcmFwProg_${PV}.bmc;downloadfilename=${FILENAME};name=bin \
    file://smc-fw-update.sh \
"

SRC_URI[bin.sha256sum] = "73a0100ec906dcea6871700dd5c8ee0199a05a9a6a1aed1a118e2d37f7db0b25"

RDEPENDS:${PN} += "bash"

do_install() {
    # The loader must be installed in the same directory before executing NpcmFwProg.
    # https://github.com/Nuvoton-Israel/npcmFwProg/releases/download/v0.2/loader_signed.bin

    install -d ${D}${bindir}
    # fw uprade command: NpcmFwProg -c /dev/ttyS4 -w mcp -i npcm-signed.bin -b
    install -D -m 755 ${UNPACKDIR}/${FILENAME} ${D}${bindir}/NpcmFwProg

    # smc-fw-update.sh <image_file> <uart_path> [<gpio_name>]
    install -D -m 755 ${S}/smc-fw-update.sh ${D}${bindir}/smc-fw-update.sh
}

INSANE_SKIP:${PN} = "already-stripped"
