# 多串口配置：支持 ttyS0, ttyAMA0, ttyAMA1
# smart-getty 会自动检测设备是否存在

SERIAL_CONSOLES:raspberrypi3-64 = "115200;ttyS0 115200;ttyAMA0 115200;ttyAMA1"

SRC_URI:append = " file://smart-getty.sh"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/smart-getty.sh ${D}${bindir}/smart-getty
    
    # 替换 inittab 中的标准 getty 为 smart-getty
    sed -i 's|/sbin/getty|/usr/bin/smart-getty|g' ${D}${sysconfdir}/inittab
}

FILES:${PN}:append = "${bindir}/smart-getty"