#!/sbin/busybox sh

if /sbin/busybox blkid | /sbin/busybox grep ext4 | /sbin/busybox grep -q mmcblk0p5 ; then

	/sbin/e2fsck -y /dev/block/mmcblk0p5

	if /sbin/busybox grep -q 115 /sys/devices/platform/gpio-keys.0/keys_pressed ; then

		/sbin/busybox echo 255 > /sys/class/leds/button-backlight/brightness
		/sbin/e2fsck -fyv /dev/block/mmcblk0p5 >> /boot.log
		/sbin/busybox echo 0   > /sys/class/leds/button-backlight/brightness

	fi

	/sbin/busybox mount -t ext4 -o nosuid,nodev,noatime,nodiratime,barrier=1,noauto_da_alloc,discard /dev/block/mmcblk0p5 /data

else

	if /sbin/busybox grep -q 115 /sys/devices/platform/gpio-keys.0/keys_pressed ; then

		/sbin/busybox echo 255 > /sys/class/leds/button-backlight/brightness
		/sbin/fsck.f2fs /dev/block/mmcblk0p5 >> /boot.log
		/sbin/busybox echo 0   > /sys/class/leds/button-backlight/brightness

	fi

	/sbin/busybox mount -t f2fs -o nosuid,nodev,noatime,nodiratime,background_gc=on,active_logs=2,discard /dev/block/mmcblk0p5 /data

fi
