FROM odoo:18

USER root
RUN mkdir -p /var/lib/odoo/.local/share/Odoo && \
    chown -R odoo:odoo /var/lib/odoo

COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons

USER odoo

# Use environment variables for database connection
CMD ["sh", "-c", "odoo -c /etc/odoo/odoo.conf --db_host=${DB_HOST} --db_port=${DB_PORT} --db_user=${DB_USER} --db_password=${DB_PASSWORD}"]