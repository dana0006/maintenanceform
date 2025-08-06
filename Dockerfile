FROM odoo:18

USER root

# Install dig for DNS resolution
RUN apt-get update && \
    apt-get install -y dnsutils && \
    apt-get clean

# Create directories
RUN mkdir -p /var/lib/odoo/.local/share/Odoo && \
    chown -R odoo:odoo /var/lib/odoo

# Copy files
COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons
COPY ./force_ipv4_start.sh /force_ipv4_start.sh

# Make executable
RUN chmod +x /force_ipv4_start.sh

USER odoo

# Allow postgres user
ENV ODOO_ALLOW_POSTGRES_USER=1

CMD ["/force_ipv4_start.sh"]