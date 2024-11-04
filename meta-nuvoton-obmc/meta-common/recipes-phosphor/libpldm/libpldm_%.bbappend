FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://0006-libpldm-fix-pldmtool-cmd-fail-issue.patch"
