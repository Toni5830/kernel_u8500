#!/sbin/busybox sh

# Enable ADB and USB Mass Storage at the same time

DIR="/sys/devices/virtual/android_usb/android0"

echo 0 > $DIR/enable
sleep 1
echo mass_storage,adb > $DIR/functions

# /dev/block/mmcblk0p8 on lun0
# /dev/block/mmcblk1p1 on lun1
echo /dev/block/vold/179:8 > $DIR/f_mass_storage/lun0/file
echo /dev/block/vold/179:97 > $DIR/f_mass_storage/lun1/file

echo 1 > $DIR/enable
