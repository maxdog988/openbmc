FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"

inherit entity-utils

PACKAGECONFIG:append = " log-watchdog clears-sel"
PACKAGECONFIG:append= " ${@entity_enabled(d, 'log-threshold', 'send-to-logger log-alarm')}"
