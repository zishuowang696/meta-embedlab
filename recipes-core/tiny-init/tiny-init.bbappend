# 多串口配置：支持 ttyS0, ttyAMA0, ttyAMA1
# 仅适用于 poky-tiny 发行版

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://rc.local"

do_install:append() {
    install -m 0755 ${UNPACKDIR}/rc.local ${D}${sysconfdir}
}