
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
           file://pam_succeed_if_support_ldap_user_login.patch \
           "
