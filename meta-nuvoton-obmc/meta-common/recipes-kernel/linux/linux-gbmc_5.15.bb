KSRC ?= "git://gbmc.googlesource.com/linux;protocol=https;branch=${KBRANCH}"
KBRANCH = "gbmc-5.15"
LINUX_VERSION = "5.15.120"
SRCREV = "09e4e4548829f63fcaf8b5c576c635994d60bdbf"

FILESEXTRAPATHS:append:nuvoton := "${THISDIR}/linux-nuvoton:"

require ../../../../meta-nuvoton/recipes-kernel/linux/linux-nuvoton.inc
