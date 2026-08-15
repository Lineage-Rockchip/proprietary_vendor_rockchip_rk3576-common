#!/system/bin/sh

# 查找 android.hardware.media.c2@1.1-service 的 PID
pid=$(ps -A | grep "android.hardware.media.c2@1.1-service" | awk '{print $2}')
sfpid=$(ps -A | grep "surfaceflinger" | awk '{print $2}')
rockitpid=$(ps -A | grep "rockchip.hardware.rockit.hw@1.0-service" | awk '{print $2}')

for thread_pid in $(ls /proc/$pid/task/); do
    thread_name=$(cat /proc/$pid/task/$thread_pid/comm)

    if [[ "$thread_name" == "mali-cmar-backe" ]]; then
        # 绑定线程到指定的 CPU（例如 CPU 4）
        current_affinity=$(taskset -p $thread_pid | awk '{print $NF}')
        echo "Checking thread $thread_pid ($thread_name), Current CPU Affinity: $current_affinity"
        if [ "$current_affinity" != "20" ]; then
            taskset -p 20 $thread_pid
            echo "Bound Mali thread $thread_pid ($thread_name) to CPU 5"
        fi
    fi
done

for thread_pid in $(ls /proc/$rockitpid/task/); do
    thread_name=$(cat /proc/$rockitpid/task/$thread_pid/comm)

    if [[ "$thread_name" == "mali-cmar-backe" ]]; then
        # 绑定线程到指定的 CPU（例如 CPU 4）
        current_affinity=$(taskset -p $thread_pid | awk '{print $NF}')
        echo "Checking thread $thread_pid ($thread_name), Current CPU Affinity: $current_affinity"
        if [ "$current_affinity" != "20" ]; then
            taskset -p 20 $thread_pid
            echo "Bound Mali thread $thread_pid ($thread_name) to CPU 5"
        fi
    fi
done


if [ -n "$sfpid" ]; then
    current_affinity=$(taskset -p $sfpid | awk '{print $NF}')

    echo "Current PID: $sfpid"
    echo "Current CPU Affinity: $current_affinity"

    if [ "$current_affinity" != "1f" ]; then
        # 绑定 CPU
        taskset -p 1f $sfpid
        echo "Bound process $sfpid to CPU 4"
    else
        echo "Process $sfpid is already bound to CPU 4"
    fi
    echo "C2 service not running."
fi

