FROM odoo:18

COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons
COPY ./connection_fix.sh /connection_fix.sh

RUN chmod +x /connection_fix.sh

# Install dig for DNS resolution
USER root
RUN apt-get update && apt-get install -y dnsutils
USER odoo

CMD ["/connection_fix.sh"]