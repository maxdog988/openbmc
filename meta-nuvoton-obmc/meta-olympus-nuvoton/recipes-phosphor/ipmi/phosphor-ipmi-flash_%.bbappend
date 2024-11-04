NUVOTON_FLASH_PCIMBOX = "0xF0848000"
NUVOTON_FLASH_LPC     = "0xC0008000"

PACKAGECONFIG:append = " nuvoton-lpc net-bridge"
#EXTRA_OECONF:append = " --enable-nuvoton-p2a-mbox"

IPMI_FLASH_BMC_ADDRESS = "${NUVOTON_FLASH_LPC}"
