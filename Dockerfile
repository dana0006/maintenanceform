FROM odoo:18.0

FROM odoo:18.0
COPY ./addons /mnt/extra-addons
ENV ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons

COPY ./addons /mnt/extra-addons
ENV ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons