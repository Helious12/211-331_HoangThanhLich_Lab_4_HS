#!/bin/bash

# Tìm primary node bằng Python
export DB_HOST=$(python3 /app/find_primary.py)

echo "✅ Primary node detected: $DB_HOST"

# Chạy ứng dụng chính
exec python3 /app/consumer.py
