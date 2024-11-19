# use TEST key only on special device
EXTRA_OEMAKE:append = " CFG_RPMB_TESTKEY=y CFG_RPMB_RESET_FAT=y"
