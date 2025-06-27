#!/bin/bash

# Lặp mãi mãi, mỗi giờ backup một lần
while true; do
  # Tạo file backup với định dạng backup_YYYYmmddHHMM.sql
  pg_dump -h haproxy -U admin analytics > /backup/backup_$(date +%Y%m%d%H%M).sql
  sleep 3600  # 3600 giây = 1 giờ
done
