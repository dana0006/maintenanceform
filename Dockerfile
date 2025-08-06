FROM odoo:18

USER root
RUN mkdir -p /var/lib/odoo/.local/share/Odoo && \
    chown -R odoo:odoo /var/lib/odoo

COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons

USER odoo

# This allows using postgres user
ENV ODOO_ALLOW_POSTGRES_USER=1

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]