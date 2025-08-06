#!/bin/bash
echo "Testing Supabase connection..."

# Force IPv4 resolution
export PGHOST=db.evdbkllydkotuqhhfyuk.supabase.co
export PGHOSTADDR=$(dig +short A $PGHOST | head -1)

echo "Resolved to IPv4: $PGHOSTADDR"

# Start Odoo with resolved IP
exec odoo -c /etc/odoo/odoo.conf