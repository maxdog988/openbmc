FILESEXTRAPATHS:prepend:buv-runbmc := "${THISDIR}/${PN}:"

inherit image_version

unset do_patch[noexec]
do_patch[depends] = "os-release:do_populate_sysroot"

python do_patch:buv-runbmc() {
    import json
    import re
    from shutil import copyfile
    version_id = do_get_version(d)

    # count from the commit version, minimum of one digit
    count = re.findall("-(\d{1,4})-", version_id)
    if count:
        commit = count[0]
    else:
        commit = "0"

    release = re.findall("-r(\d{1,4})", version_id)
    if release:
        auxVer = commit + "{0:0>4}".format(release[0])
    else:
        auxVer = commit + "0000"

    unpackdir = d.getVar('UNPACKDIR', True)
    file = os.path.join(unpackdir, 'dev_id.json')

    # Update dev_id.json with the auxiliary firmware revision
    with open(file, "r+") as jsonFile:
        data = json.load(jsonFile)
        jsonFile.seek(0)
        jsonFile.truncate()
        data["aux"] = int(auxVer, 16)
        json.dump(data, jsonFile)
}
