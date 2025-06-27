docker-compose up -d monitor node1 node2 node3
docker-compose up -d haproxy
docker-compose up -d user_service user_service_v2 product_service order_service
docker-compose up -d audit_db audit_service
docker-compose up --build frontend 
docker-compose up -d nginx_ru nginx_eu
docker-compose up -d rabbitmq
docker-compose up -d prometheus postgres_exporter grafana pg_backup dnsmasq
docker-compose up -d consumer-service 

dừng tất cả container đang chạy: docker stop $(docker ps -q)
chạy tất cả : docker start $(docker ps -a -q)

- test dns: nslookup myapi.local 172.20.0.30
- check audit: docker exec -it audit_db psql -U audit -d auditlog


- backup:
    copy file backup vào container: docker cp backup/backup_202506052058.sql node2:/tmp/backup.sql

    xóa để kiểm thử: docker exec -it node2 psql -U admin -d analytics
    DROP TABLE IF EXISTS demo;
    \q

    Khôi phục từ file backup: docker exec -it node2 bash
    psql -U admin -d analytics -f /tmp/backup.sql

    Kiểm tra: \dt
    SELECT * FROM demo;
    \q

- tạm dừng tất cả và chạy lại: docker-compose down
docker-compose up -d
