FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-nuvoton:"

SRC_URI:append = " file://emmc.cfg"
SRC_URI:append = " file://ftpm.cfg"
SRC_URI:append = " file://mem_hide.cfg"
SRC_URI:append = " file://fit_sig.cfg"
SRC_URI:append = " file://wdt.cfg"

# SRC_URI:append = " file://ncsi.cfg"
# SRC_URI:append = " file://disable_sha_hw.cfg"

SRC_URI:append = " file://0002-Enable-openbmc-copy-base-file-to-ram-feature.patch"
