#!/sbin/busybox sh

if [ -f /system/media/bootanimation.zip ]
then
	/sbin/bootanimation
else
	/system/bin/bootanimation
fi
