#!/bin/bash
echo "Initializing Odoo database with extended timeouts..."
odoo -c /etc/odoo/odoo.conf \
  -d maintenance_k8ue \
  -i base \
  --stop-after-init \
  --max-cron-threads=0 \
  --workers=0 \
  --limit-time-cpu=600 \
  --limit-time-real=1200

if [ $? -eq 0 ]; then
    echo "Initialization successful! Starting Odoo..."
    exec odoo -c /etc/odoo/odoo.conf
else
    echo "Initialization failed. Retrying..."
    sleep 5
    exec odoo -c /etc/odoo/odoo.conf -i base
fi