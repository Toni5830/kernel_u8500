#!/sbin/busybox sh

if [ -f /data/logger ]
then
insmod /lib/modules/logger.ko
fi