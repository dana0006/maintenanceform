# 👇 REQUIRED: base image
FROM odoo:17.0

# Optional: add your custom module
COPY ./addons /mnt/extra-addons

# Optional: your custom config
COPY ./odoo.conf /etc/odoo/odoo.conf

# Optional: update addons path (if you want)
ENV ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons

# ✅ Final CMD (in shell form so env vars expand)
CMD odoo -c /etc/odoo/odoo.conf \
    --db_host=$PGHOST \
    --db_port=$PGPORT \
    --db_user=$PGUSER \
    --db_password=$PGPASSWORD \
    --db_name=$PGDATABASE \
    --xmlrpc-port=$PORT
