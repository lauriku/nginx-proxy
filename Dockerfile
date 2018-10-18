FROM nginx:1.15-alpine

ENV BASICAUTH_USERNAME default_user
ENV BASICAUTH_PASSWORD password
ENV BACKEND_ADDRESS localhost
ENV BACKEND_PORT 3000

RUN apk add --update apache2-utils \
    && rm -rf /var/cache/apk/*

COPY nginx.conf.tmpl /tmp/nginx.conf.tmpl
COPY entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]