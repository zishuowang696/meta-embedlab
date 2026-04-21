#!/bin/sh
# smart-getty: 智能串口 getty wrapper
# 功能：检测串口设备是否存在，不存在则退出（避免 respawning 循环）

TTY_DEV=""
BAUD_RATE=""
REMAINING_ARGS=""

# 解析参数
while [ $# -gt 0 ]; do
    case "$1" in
        -L)
            shift
            if [ $# -gt 0 ]; then
                BAUD_RATE="$1"
                shift
                if [ $# -gt 0 ]; then
                    TTY_DEV="$1"
                    shift
                fi
            fi
            ;;
        *)
            REMAINING_ARGS="$REMAINING_ARGS $1"
            shift
            ;;
    esac
done

# 检查设备是否存在
if [ ! -c "/dev/$TTY_DEV" ]; then
    echo "smart-getty: /dev/$TTY_DEV not found, skipping"
    # 退出码 0 防止 respawn 循环
    exit 0
fi

# 设备存在，执行真正的 getty
exec /sbin/getty -L "$BAUD_RATE" "$TTY_DEV" $REMAINING_ARGS