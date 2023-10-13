inherit entity-utils

PACKAGECONFIG:append:evb-npcm750 = " log-watchdog"
PACKAGECONFIG:append:evb-npcm750 = " ${@entity_enabled(d, 'log-threshold', 'send-to-logger log-alarm')}"
