FROM odoo:18

# Create necessary directories
USER root
RUN mkdir -p /var/lib/odoo/.local/share/Odoo/filestore && \
    chown -R odoo:odoo /var/lib/odoo && \
    chmod -R 755 /var/lib/odoo

USER odoo

COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]