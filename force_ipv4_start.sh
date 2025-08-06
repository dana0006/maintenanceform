#!/bin/bash
echo "Forcing IPv4 connection to Supabase..."

# Get IPv4 address only
IPV4_HOST=$(dig +short A db.evdbkllydkotuqhhfyuk.supabase.co | grep -E '^[0-9.]+$' | head -1)

if [ -z "$IPV4_HOST" ]; then
    echo "Failed to resolve IPv4 address"
    exit 1
fi

echo "Resolved to IPv4: $IPV4_HOST"

# Allow postgres user
export ODOO_ALLOW_POSTGRES_USER=1

# Start Odoo with IPv4 host
exec odoo \
    --db_host=$IPV4_HOST \
    --db_port=5432 \
    --db_user=postgres \
    --db_password="YOUR-SUPABASE-PASSWORD" \
    --database=postgres \
    --db_sslmode=require \
    --http-port=10000 \
    --db-filter='^postgres$'