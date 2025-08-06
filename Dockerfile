FROM odoo:18

# Switch to root to set up directories
USER root

# Create data directory with proper permissions
RUN mkdir -p /var/lib/odoo/.local/share/Odoo && \
    chown -R odoo:odoo /var/lib/odoo && \
    chmod -R 777 /var/lib/odoo/.local

# Copy files
COPY ./odoo.conf /etc/odoo/
COPY ./addons /mnt/extra-addons
COPY ./startup_fix.sh /startup_fix.sh

# Make script executable
RUN chmod +x /startup_fix.sh

# Switch back to odoo user
USER odoo

CMD ["/startup_fix.sh"]