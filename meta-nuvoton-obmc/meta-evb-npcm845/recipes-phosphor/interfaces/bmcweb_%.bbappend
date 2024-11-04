inherit entity-utils

# Enable Redfish DBUS log/Journal support
EXTRA_OEMESON:append = " ${@entity_enabled(d, '-Dredfish-bmc-journal=enabled', '-Dredfish-dbus-log=enabled')}"

# Increase body limit for FW size
EXTRA_OEMESON:append  = " -Dhttp-body-limit=65"

# Enable dbus rest API /xyz/
EXTRA_OEMESON:append = " -Drest=enabled"

# Enalbe sensors
EXTRA_OEMESON:append = " -Dredfish-new-powersubsystem-thermalsubsystem=enabled"

# Enable debug
# EXTRA_OEMESON:append = " -Dbmcweb-logging=enabled"
