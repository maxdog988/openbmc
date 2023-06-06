# tag IGPS_03.09.00
SRCREV = "30086cd06bee63c5715622a624620c30ade6652e"

require npcm8xx-igps.inc

inherit deploy

do_deploy () {
	# copy default keys to deploy folder
	install -d ${DEPLOY_DIR_IMAGE}/${SIGN_TYPE}
	cp -vur py_scripts/ImageGeneration/keys/${SIGN_TYPE} ${DEPLOY_DIR_IMAGE}/
}

deltask do_install
deltask do_patch
addtask deploy before do_build after do_compile
