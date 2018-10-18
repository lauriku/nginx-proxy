#!/bin/ash

set -e

htpasswd -Bbc /etc/nginx/.htpasswd ${BASICAUTH_USERNAME} ${BASICAUTH_PASSWORD}
chmod 644 /etc/nginx/.htpasswd

envsubst '$BACKEND_ADDRESS,$BACKEND_PORT' < /tmp/nginx.conf.tmpl \
    > /etc/nginx/nginx.conf \
    && exec nginx -g 'daemon off;'