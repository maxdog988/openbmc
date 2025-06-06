SUMMARY = "Phosphor OpenBMC IPMB to DBUS"
DESCRIPTION = "Phosphor OpenBMC IPMB to DBUS."
PR = "r1"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

inherit autotools pkgconfig
inherit obmc-phosphor-dbus-service

DBUS_SERVICE_${PN} = "xyz.openbmc_project.Ipmi.Channel.Ipmb.service"

DEPENDS += " \
        autoconf-archive-native \
        systemd \
        sdbusplus \
        "
DEPENDS += "phosphor-logging"

RDEPENDS_${PN} += " \
        libsystemd \
        "
RDEPENDS_${PN}-dev += "phosphor-logging"

S = "${WORKDIR}"
SRC_URI += " \
        file://bootstrap.sh \
        file://configure.ac \
        file://ipmbbridged.hpp \
        file://ipmbdefines.hpp \
        file://ipmbutils.hpp \
        file://ipmbutils.cpp \
        file://ipmbbridged.cpp \
        file://Makefile.am \
        file://README.md \
        file://xyz.openbmc_project.Ipmi.Channel.Ipmb.conf \
        "


