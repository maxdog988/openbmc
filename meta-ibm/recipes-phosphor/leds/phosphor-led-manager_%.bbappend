FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SYSTEMD_SERVICE_${PN}_append_rainier += "obmc-led-set-all-groups-asserted@.service obmc-led-create-virtual-leds@.service"

# Copies config file having arguments for led-set-all-groups-asserted.sh
SYSTEMD_ENVIRONMENT_FILE_${PN}_append_rainier +="obmc/led/set-all/groups/config"

# Use the JSON configuration file at runtime than the static led.yaml
# Also, enable Lamp Test feature for rainier systems
PACKAGECONFIG_append_rainier = " use-json use-lamp-test"

# Install the lamp test override file for rainier
SRC_URI_append_rainier = " file://lamp-test-led-overrides.json"

pkg_postinst_${PN}_rainier () {

    # Needed this to run as part of BMC boot
    mkdir -p $D$systemd_system_unitdir/multi-user.target.wants
    LINK="$D$systemd_system_unitdir/multi-user.target.wants/obmc-led-set-all-groups-asserted@false.service"
    TARGET="../obmc-led-set-all-groups-asserted@.service"
    ln -s $TARGET $LINK

    # Needed this to run as part of Power On
    mkdir -p $D$systemd_system_unitdir/obmc-chassis-poweron@0.target.wants
    LINK="$D$systemd_system_unitdir/obmc-chassis-poweron@0.target.wants/obmc-led-set-all-groups-asserted@false.service"
    TARGET="../obmc-led-set-all-groups-asserted@.service"
    ln -s $TARGET $LINK

    # Needed this to run as part of BMC boot
    mkdir -p $D$systemd_system_unitdir/multi-user.target.wants
    LINK_FAULT="$D$systemd_system_unitdir/multi-user.target.wants/obmc-led-create-virtual-leds@sys-class-leds-virtual-enc-fault.service"
    TARGET_FAULT="../obmc-led-create-virtual-leds@.service"
    ln -s $TARGET_FAULT $LINK_FAULT

    # Needed this to run as part of BMC boot
    mkdir -p $D$systemd_system_unitdir/multi-user.target.wants
    LINK_ID="$D$systemd_system_unitdir/multi-user.target.wants/obmc-led-create-virtual-leds@sys-class-leds-virtual-enc-id.service"
    TARGET_ID="../obmc-led-create-virtual-leds@.service"
    ln -s $TARGET_ID $LINK_ID
}

pkg_prerm_${PN}_rainier () {

    LINK="$D$systemd_system_unitdir/multi-user.target.wants/obmc-led-set-all-groups-asserted@false.service"
    rm $LINK

    LINK="$D$systemd_system_unitdir/obmc-chassis-poweron@0.target.wants/obmc-led-set-all-groups-asserted@false.service"
    rm $LINK

    LINK_FAULT="$D$systemd_system_unitdir/multi-user.target.wants/obmc-led-create-virtual-leds@sys-class-leds-virtual-enc-fault.service"
    rm $LINK_FAULT

    LINK_ID="$D$systemd_system_unitdir/multi-user.target.wants/obmc-led-create-virtual-leds@sys-class-leds-virtual-enc-id.service"
    rm $LINK_ID
}

# Install lamp test override json
do_install_append_rainier() {
    install -d ${D}${datadir}/${BPN}/
    install -m 0644 ${WORKDIR}/lamp-test-led-overrides.json ${D}${datadir}/${BPN}/
}
