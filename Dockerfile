FROM odoo:18.0

USER root
RUN pip3 install --upgrade pip
USER odoo

COPY ./addons /mnt/extra-addons
ENV ADDONS_PATH=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons