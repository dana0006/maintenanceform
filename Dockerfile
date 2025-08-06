FROM odoo:18

USER root

# Create directories and set permissions
RUN mkdir -p /var/lib/odoo/.local/share/Odoo && \
    mkdir -p /mnt/extra-addons && \
    chown -R odoo:odoo /var/lib/odoo && \
    chown -R odoo:odoo /mnt/extra-addons

# Copy addons directory
COPY --chown=odoo:odoo ./addons/ /mnt/extra-addons/

# Debug: List contents to verify
RUN ls -la /mnt/extra-addons/

USER odoo

# Expose port
EXPOSE 10000

# Start Odoo with environment variables
CMD ["sh", "-c", "echo 'Contents of /mnt/extra-addons:' && ls -la /mnt/extra-addons/ && odoo --http-port=10000 --db_host=${DB_HOST} --db_port=${DB_PORT} --db_user=${DB_USER} --db_password=${DB_PASSWORD} --addons-path=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons --data-dir=/var/lib/odoo --workers=2 --max-cron-threads=1 --list-db=true"]