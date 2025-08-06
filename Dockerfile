FROM odoo:18

USER root

# Just add our custom addon to the default Odoo addons directory
COPY --chown=odoo:odoo ./addons/maintenance_cascade /usr/lib/python3/dist-packages/odoo/addons/maintenance_cascade

# Create data directory
RUN mkdir -p /var/lib/odoo/.local/share/Odoo && \
    chown -R odoo:odoo /var/lib/odoo

USER odoo

# Use simple startup without custom addons path
CMD ["sh", "-c", "odoo --data-dir=/var/lib/odoo --http-port=10000 --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD --workers=2 --max-cron-threads=1 --list-db=true"]