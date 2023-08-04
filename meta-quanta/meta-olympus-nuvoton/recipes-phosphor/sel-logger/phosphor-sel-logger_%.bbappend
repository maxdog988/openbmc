FILESEXTRAPATHS:append:olympus-nuvoton := "${THISDIR}/${PN}:"

inherit entity-utils

PACKAGECONFIG:append:olympus-nuvoton = " log-watchdog clears-sel"
PACKAGECONFIG:append:olympus-nuvoton= " ${@entity_enabled(d, 'log-threshold', 'send-to-logger log-alarm')}"
