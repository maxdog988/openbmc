FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"

SYSTEMD_SERVICE:${PN} = "tee-supplicant@0.service"
FILES:${PN}:append = " ${systemd_system_unitdir}/tee-supplicant@.service"

EXTRA_OECMAKE:append = " \
    -DCFG_TEE_FS_PARENT_PATH='/var/tee' \
    -DRPMB_EMU=OFF \
    "
