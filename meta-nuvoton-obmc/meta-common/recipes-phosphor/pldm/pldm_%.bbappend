FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://0002-pldm-fix-pldmtool-cmd-fail-issue.patch"
