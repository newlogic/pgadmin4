#!/bin/sh

/entrypoint.sh &
pid=$!

until [ -f /var/lib/pgadmin/pgadmin4.db ]
do
     sleep 1
done

if /venv/bin/python3 setup.py --dump-servers /dev/null | grep "Configuration for 0 servers dumped"; then
    envsubst < /pgadmin4/pass.pgpass.tmpl > /tmp/pass.pgpass
    chmod 0600 /tmp/pass.pgpass
    envsubst < /pgadmin4/servers.json.tmpl > /tmp/servers.json
    /venv/bin/python3 setup.py --load-servers /tmp/servers.json
fi
wait $pid
