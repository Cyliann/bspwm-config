#!/bin/bash
cpu=$(~/.config/polybar/scripts/cpu.sh)
mem=$(~/.config/polybar/scripts/mem.sh)
# gpu=$(~/.config/polybar/scripts/system-nvidia-smi.sh)
gpu="$(cat /sys/class/drm/card0/device/gpu_busy_percent)%"

printf " %s    %s    %s" "$cpu" "$mem" "$gpu"
