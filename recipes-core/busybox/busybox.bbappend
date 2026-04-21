# 双串口配置：ttyS0 主用，ttyAMA1 备用

SERIAL_CONSOLES:raspberrypi3-64 = "115200;ttyS0 115200;ttyAMA1"

SRC_URI:append = " file://smart-getty.sh"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/smart-getty.sh ${D}${bindir}/smart-getty
    
    # 替换 inittab 中的 getty 调用
    if [ -f ${D}${sysconfdir}/inittab ]; then
        sed -i 's|/sbin/getty|/usr/bin/smart-getty|g' ${D}${sysconfdir}/inittab
    fi
}

FILES:${PN}:append = "${bindir}/smart-getty"