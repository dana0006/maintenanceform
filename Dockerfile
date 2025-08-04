FROM odoo:18.0

COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf

ENV ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons

CMD ["odoo", "-c", "/etc/odoo/odoo.conf",
     "--db_host=${PGHOST}",
     "--db_port=${PGPORT}",
     "--db_user=${PGUSER}",
     "--db_password=${PGPASSWORD}"]
