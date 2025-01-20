FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:npcm8xx = " file://0001-support-hwmon-sysfs-in-sys-devices-virtual.patch"
