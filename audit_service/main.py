from fastapi import FastAPI, Request
import os
import psycopg2.extras
import psycopg2
import datetime

app = FastAPI()

def insert_event(event_type, entity, entity_id, data):
    try:
        conn = psycopg2.connect(
            host=os.getenv("DB_HOST", "audit_db"),
            port=os.getenv("DB_PORT", "5432"),
            user=os.getenv("DB_USER", "audit"),
            password=os.getenv("DB_PASSWORD", "auditpass"),
            dbname=os.getenv("DB_NAME", "auditlog")
        )
        cur = conn.cursor()
        now = datetime.datetime.utcnow()
        table = f"audit_events_{now.strftime('%Y%m%d')}"
        cur.execute(f"""
            CREATE TABLE IF NOT EXISTS {table} (
                id SERIAL PRIMARY KEY,
                event_time TIMESTAMP,
                event_type TEXT,
                entity TEXT,
                entity_id INT,
                data JSONB
            );
        """)
        cur.execute(
            f"INSERT INTO {table} (event_time, event_type, entity, entity_id, data) VALUES (%s, %s, %s, %s, %s)",
            (now, event_type, entity, entity_id, psycopg2.extras.Json(data))
        )
        conn.commit()
        cur.close()
        conn.close()
        print(f"✅ Inserted into {table}: {event_type}, {entity}, {entity_id}")
        return True
    except Exception as e:
        print("❌ Error inserting event:", e)
        return False

@app.post("/audit")
async def audit(request: Request):
    try:
        body = await request.json()
        print("📥 Received audit log:", body)
        success = insert_event(
            body.get("event_type"),
            body.get("entity"),
            body.get("entity_id"),
            body.get("data")
        )
        return {"status": "logged" if success else "fail"}
    except Exception as e:
        print("❌ Exception in /audit:", e)
        return {"status": "fail", "error": str(e)}
