FILESEXTRAPATHS:prepend:buv-runbmc := "${THISDIR}/${PN}:"

SRC_URI:append:buv-runbmc = " file://0001-Software-Add-CPLD-MCU-VersionPurpose.patch"
SRC_URI:append:buv-runbmc = " file://0001-add-xyz-openbmc_project-Sensor-Aggregation-for-phosp.patch"