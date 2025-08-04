FROM odoo:18.0

# Copy your custom addons
COPY ./addons /mnt/extra-addons

# Copy config
COPY ./odoo.conf /etc/odoo/odoo.conf

# Add addon path ENV (optional)
ENV ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons

# Final CMD must use odoo.conf directly
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
