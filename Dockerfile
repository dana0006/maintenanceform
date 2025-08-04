FROM odoo:17.0

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

ENV HOST=0.0.0.0

CMD ["odoo", "-d", "maintenance_k8ue", "-i", "base", "--without-demo=all",
     "--load-language=en_US",
     "--db_host=dpg-d2880815pdvs73897k2g-a.singapore-postgres.render.com",
     "--db_port=5432",
     "--db_user=maintenance_k8ue_user",
     "--db_password=2DuL9j0BOj2NsuiEywyUZBcXseraY9fr",
     "--xmlrpc-port=10000"]
