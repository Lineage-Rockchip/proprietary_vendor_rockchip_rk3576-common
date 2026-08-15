#!/system/bin/sh
#echo performance > /sys/devices/platform/27800000.gpu/devfreq/27800000.gpu/governor
echo performance > /sys/devices/platform/27700000.npu/devfreq/27700000.npu/governor
#echo performance > /sys/class/devfreq/dmc/governor
#echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
#echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
#echo performance > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#echo performance > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
#echo performance > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
#echo performance > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor


cat /sys/devices/platform/27800000.gpu/devfreq/27800000.gpu/governor
cat /sys/devices/platform/27700000.npu/devfreq/27700000.npu/governor
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor

setprop persist.vendor.rkpq.mssr.watermark_title  "AI VisionPQ"
#setprop persist.vendor.sculptor.mode 1
#setprop persist.vendor.sculptor.c2.mode 1
mkdir -p /data/rkalgo
chmod 777 /data/rkalgo
echo 2 > /sys/class/projector/brightness

mkdir -p /data/vendor/rkalgo
chmod 777 /data/vendor/rkalgo
chmod 777 /rkalgo
cp /vendor/etc/pq_config.json /data/vendor/rkalgo/
cp /vendor/etc/aipq_config.json /data/vendor/rkalgo/
#/vendor/bin/rkswpq_demo 1
chmod 777 /data/rkalgo/*
chmod 777 /data/vendor/rkalgo/*
chmod 777 /rkalgo/*
#setprop vendor.hwc.compose_policy 1
#setprop persist.vendor.tvinput.rkpq.mode 3
#setprop persist.vendor.rkpq.sr.strength 50
#setprop vendor.tvinput.rkpq.vdpp_dm_en 0
#setprop vendor.tvinput.rkpq.vdpp_es_en 0
#setprop vendor.tvinput.rkpq.vdpp_shp_en 1
#setprop vendor.tvinput.rkpq.vdpp_peaking_gain 128
#setprop vendor.tvinput.rkpq.update_vdpp_cfg  1
