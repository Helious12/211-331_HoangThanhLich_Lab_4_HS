# consumer/find_primary.py
import psycopg2

for host in ['node1', 'node2', 'node3']:
    try:
        conn = psycopg2.connect(
            host=host,
            port=5432,
            user='admin',
            password='password',
            dbname='analytics'
        )
        cur = conn.cursor()
        cur.execute("SELECT pg_is_in_recovery();")
        is_replica = cur.fetchone()[0]
        if not is_replica:
            print(host)
            break
    except Exception:
        continue
