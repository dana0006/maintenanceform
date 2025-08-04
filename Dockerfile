FROM odoo:18

USER root
RUN apt-get update && apt-get install -y postgresql-client
USER odoo

COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons
COPY ./init_clean.sh /init_clean.sh

USER root
RUN chmod +x /init_clean.sh
USER odoo

CMD ["/init_clean.sh"]