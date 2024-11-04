PCIE_BINDING = "pcie"

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "xyz.openbmc_project.mctpd@.service"
SYSTEMD_SERVICE:${PN} += "xyz.openbmc_project.mctpd@${PCIE_BINDING}.service"
