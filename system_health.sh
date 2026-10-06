#!/usr/bin/env bash

set -euo pipefail

LOG_FILE="health_log.txt"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

CPU_USAGE="$(top -bn1 | awk '/Cpu/ {print 100 - $8 "%"}')"
MEMORY_USAGE="$(free -m | awk '/Mem:/ {printf "%.2f%%", ($3/$2) * 100}')"
DISK_USAGE="$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')"

{
  echo "[$TIMESTAMP] CPU: $CPU_USAGE | Memory: $MEMORY_USAGE | Disk: ${DISK_USAGE}%"
} >> "$LOG_FILE"

if [ "$DISK_USAGE" -gt 80 ]; then
  echo "[WARNING] Disk space high!"
fi
