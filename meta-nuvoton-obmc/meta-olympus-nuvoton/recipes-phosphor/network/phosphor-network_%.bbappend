FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DEPENDS:append = " nlohmann-json boost"

PACKAGECONFIG:remove = "default-link-local-autoconf"
PACKAGECONFIG:remove = "default-ipv6-accept-ra"

SRC_URI:append = " file://0001-Run-after-xyz-openbmc_project-user-path-created.patch"
#SRC_URI:append = " file://0002-Adding-channel-specific-privilege-to-network.patch"
