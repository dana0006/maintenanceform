FROM odoo:18

COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]