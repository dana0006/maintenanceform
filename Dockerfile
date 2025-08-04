FROM odoo:17.0

COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf

ENV ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons

odoo -c /etc/odoo/odoo.conf \
     --db_host=postgres.railway.internal \
     --db_port=5432 \
     --db_user=$PGUSER \
     --db_password=$PGPASSWORD \
     --xmlrpc-port=8080
