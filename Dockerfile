FROM odoo:18

USER root
RUN apt-get update && apt-get install -y postgresql-client
USER odoo

COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons