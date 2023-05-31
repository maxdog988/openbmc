inherit buv-entity-utils

PACKAGECONFIG:append:buv-runbmc = " log-watchdog clears-sel"
PACKAGECONFIG:append:buv-runbmc = " ${@entity_enabled(d, 'log-threshold', 'send-to-logger log-alarm')}"
