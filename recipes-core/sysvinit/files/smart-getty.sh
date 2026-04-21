#!/bin/sh
# smart-getty: 自动检测串口设备并启动 getty
# 支持 ttyS0, ttyAMA0, ttyAMA1

TTY="$1"
BAUD="$2"

# 如果设备不存在则跳过
if [ ! -c "/dev/$TTY" ]; then
    echo "smart-getty: Device /dev/$TTY not found, skipping"
    exit 0
fi

# 启动 getty
exec /sbin/getty -L "$BAUD" "$TTY"