FROM alpine:3.4
MAINTAINER Dave Nuñez <dnunez24@gmail.com>

ENV VARNISH_LISTEN_ADDRESS 0.0.0.0
ENV VARNISH_PORT 80
ENV VARNISH_CONF /etc/varnish/default.vcl
ENV VARNISH_STORAGE malloc,64m
ENV VARNISH_TTL 3600

RUN apk add --no-cache -q varnish
COPY default.vcl /etc/varnish/default.vcl
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE $VARNISH_PORT
CMD ["varnishd"]
