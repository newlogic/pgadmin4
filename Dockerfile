FROM dpage/pgadmin4:7.3

USER root
RUN apk add gettext
USER pgadmin

COPY config_local.py /pgadmin4/
COPY import_servers_and__start_entrypoint.sh /
COPY servers.json.tmpl /pgadmin4
COPY pass.pgpass.tmpl /pgadmin4

ENV PGADMIN_DEFAULT_EMAIL=na@na.com
ENV PGADMIN_DEFAULT_PASSWORD=na
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=postgres

ENTRYPOINT ["/import_servers_and__start_entrypoint.sh"]