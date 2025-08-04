#!/bin/bash
echo "Checking if database is initialized..."
odoo -c /etc/odoo/odoo.conf -d maintenance_k8ue -i base --stop-after-init
echo "Starting Odoo server..."
odoo -c /etc/odoo/odoo.conf