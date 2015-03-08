#!/sbin/busybox sh

sleep 8

pid=`ps | grep bootanimation | cut -b 10-16`

kill $pid
