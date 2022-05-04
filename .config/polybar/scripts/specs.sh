#!/bin/bash
cpu=$(~/.config/polybar/scripts/cpu.sh)
mem=$(~/.config/polybar/scripts/mem.sh)
gpu=$(~/.config/polybar/scripts/system-nvidia-smi.sh)

printf " %s    %s    %s" "$cpu" "$mem" "$gpu"
