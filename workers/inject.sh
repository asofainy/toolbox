#!/bin/bash

IREDMAIL_SERVICE_HOST="hermes.olympus.local"
IREDMAIL_SERVICE_PORT_SMTP=587

docker run -v redmine-config:/config \
--rm \
debian:10 /bin/bash -c "
    df -h && ls -ltra ;echo ===== `date` ===== ; echo $IREDMAIL_SERVICE_HOST ; \
    sed -i 's/address: <address>/address:e $IREDMAIL_SERVICE_HOST/g' /config/configuration.yml ; \
    sed -i 's/port: <port>/port: $IREDMAIL_SERVICE_PORT_SMTP/g' /config/configuration.yml ; \
    grep 'SMTP Configuration' -n10 /config/configuration.yml ; "
