#!/sbin/busybox sh

# Enable frandom Module
insmod /lib/modules/frandom.ko
chmod 0666 /dev/frandom
chmod 0666 /dev/erandom
mv /dev/random /dev/random.orig
mv /dev/urandom /dev/urandom.orig
ln -s /dev/frandom /dev/random
ln -s /dev/frandom /dev/urandom

# Override LMK minfree
# echo 1536,3072,4096,11520,17920,25600 > /sys/module/lowmemorykiller/parameters/minfree
