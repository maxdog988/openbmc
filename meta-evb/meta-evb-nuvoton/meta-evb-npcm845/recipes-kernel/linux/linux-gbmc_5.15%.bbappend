FILESEXTRAPATHS:append:evb-npcm845 := "${THISDIR}/linux-gbmc:${THISDIR}/linux-nuvoton:"

SRC_URI:append:evb-npcm845 = " file://evb-npcm845.cfg"
SRC_URI:append:evb-npcm845 = " file://0001-arm64-dts-add-nuvoton.patch"
SRC_URI:append:evb-npcm845 = " file://0001-dt-binding-clk-npcm845-Add-binding-for-Nuvoton-NPCM8.patch"
SRC_URI:append:evb-npcm845 = " file://0001-spi-npcm-fiu-Add-NPCM8XX-support.patch"
SRC_URI:append:evb-npcm845 = " file://0001-clk-npcm8xx-add-clock-controller.patch"
SRC_URI:append:evb-npcm845 = " file://0001-arm64-npcm-Add-support-for-Nuvoton-NPCM8XX-BMC-SoC.patch"

SRC_URI:append:evb-npcm845 = " file://nuvoton-npcm845-evb.dts;subdir=git/arch/${ARCH}/boot/dts/nuvoton"
SRC_URI:append:evb-npcm845 = " file://nuvoton-npcm845-pincfg-evb.dtsi;subdir=git/arch/${ARCH}/boot/dts/nuvoton"
SRC_URI:append:evb-npcm845 = " file://nuvoton-common-npcm8xx.dtsi;subdir=git/arch/${ARCH}/boot/dts/nuvoton"
SRC_URI:append:evb-npcm845 = " file://nuvoton-npcm845.dtsi;subdir=git/arch/${ARCH}/boot/dts/nuvoton"
