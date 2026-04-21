# 多串口配置：支持 ttyS0, ttyAMA0, ttyAMA1
# 仅适用于使用 sysvinit 的发行版（如 poky）
# poky-tiny 使用 tiny-init，此 bbappend 可能不会匹配

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://smart-getty.sh"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${UNPACKDIR}/smart-getty.sh ${D}${bindir}/smart-getty

    # 替换 inittab 中的标准 getty 为 smart-getty
    if [ -f ${D}${sysconfdir}/inittab ]; then
        sed -i 's|/sbin/getty|/usr/bin/smart-getty|g' ${D}${sysconfdir}/inittab
    fi
}

FILES:${PN}:append = "${bindir}/smart-getty"