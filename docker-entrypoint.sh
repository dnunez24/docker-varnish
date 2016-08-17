#!/bin/sh

set -e

if [ "$1" = 'varnishd' ]; then
  VARNISHD_OPTS="-a $VARNISH_LISTEN_ADDRESS:$VARNISH_PORT \
                 -f $VARNISH_CONF \
                 -t $VARNISH_TTL \
                 -s $VARNISH_STORAGE"
  exec /usr/sbin/varnishd -F $VARNISHD_OPTS
fi

exec "$@"
