#!/bin/bash
echo "Preparing Odoo startup..."
mkdir -p /var/lib/odoo/.local/share/Odoo/filestore/maintenance_k8ue
mkdir -p /var/lib/odoo/.local/share/Odoo/sessions
chmod -R 777 /var/lib/odoo/.local
echo "Starting Odoo with asset regeneration..."
odoo -c /etc/odoo/odoo.conf --stop-after-init -u base
echo "Starting Odoo server..."
exec odoo -c /etc/odoo/odoo.conf
