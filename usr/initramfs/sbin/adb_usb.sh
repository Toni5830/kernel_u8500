#!/system/bin/sh

echo 0 > /sys/class/android_usb/android0/enable
echo 04E8 > /sys/class/android_usb/android0/idVendor
echo 685D > /sys/class/android_usb/android0/idProduct
echo 0 > /sys/class/android_usb/android0/bDeviceClass
echo Samsung > /sys/class/android_usb/android0/iManufacturer
echo Android > /sys/class/android_usb/android0/iProduct
echo adb > /sys/class/android_usb/android0/functions
echo 1 > /sys/class/android_usb/android0/enable
