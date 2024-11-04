FILESEXTRAPATHS:append := "${THISDIR}/${BPN}:"

SRC_URI:append = " file://olympus-nuvoton_errors_watch.yaml"

do_install:append() {
    DEST=${D}${datadir}/dump
    install olympus-nuvoton_errors_watch.yaml ${DEST}/errors_watch.yaml
}

