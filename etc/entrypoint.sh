#!/bin/sh

set -e

gomplate < /nginx.conf.gotmpl > /etc/nginx/conf.d/default.conf
rm /nginx.conf.gotmpl

sed -i'' "s#WALLET_OWNER_API_URL:.*#WALLET_OWNER_API_URL: '$WALLET_OWNER_API_URL',#" /usr/share/nginx/html/assets/config.js
[ ! -z "$WALLET_READONLY" ] && sed -i'' "s/WALLET_READONLY:.*/WALLET_READONLY: $WALLET_READONLY,/" /usr/share/nginx/html/assets/config.js

nginx -g 'daemon off;'
