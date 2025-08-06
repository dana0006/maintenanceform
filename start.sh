
#!/bin/bash

echo "=== Starting Odoo Maintenance App ==="
echo "DB_HOST: ${DB_HOST}"
echo "DB_PORT: ${DB_PORT}"
echo "DB_USER: ${DB_USER}"
echo "=================================="

# Start Odoo with database creation enabled
exec odoo \
  --http-port=10000 \
  --db_host="${DB_HOST}" \
  --db_port="${DB_PORT}" \
  --db_user="${DB_USER}" \
  --db_password="${DB_PASSWORD}" \
  --addons-path="/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons" \
  --data-dir="/var/lib/odoo" \
  --workers=2 \
  --max-cron-threads=1 \
  --list-db=true