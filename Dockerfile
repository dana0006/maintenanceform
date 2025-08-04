CMD odoo -c /etc/odoo/odoo.conf \
     --db_host=$PGHOST \
     --db_port=$PGPORT \
     --db_user=$PGUSER \
     --db_password=$PGPASSWORD \
     --db_name=presdb \
     --xmlrpc-port=$PORT
