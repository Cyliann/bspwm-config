#!/bin/bash
top -b -n1 | grep "Cpu(s)" | awk '{printf "%.0f%\n", $2+$4}' | tail -n1
