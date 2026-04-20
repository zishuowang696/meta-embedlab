# meta-embedlab: Disable Bluetooth in device tree for Raspberry Pi 3B
# NOTE: For 64-bit kernels, use config.txt dtoverlay instead (see rpi-config in yaml)

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Bluetooth disabled via config.txt dtoverlay=disable-bt instead of patch
# Patch disabled - incompatible with 64-bit kernel device tree paths
# SRC_URI:append = " \
#     file://disable-bluetooth.patch \
# "