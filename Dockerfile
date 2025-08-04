FROM odoo:18.0
LABEL maintainer="Render Deployment"

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

ENV HOST=0.0.0.0

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
