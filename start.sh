#!/bin/sh
set -e

# Génération du fichier sasl_passwd si variables fournies
if [ -n "$RELAYHOST" ] && [ -n "$RELAYHOST_USER" ] && [ -n "$RELAYHOST_PASSWORD" ]; then
  echo "[$RELAYHOST]:587 $RELAYHOST_USER:$RELAYHOST_PASSWORD" > /etc/postfix/sasl_passwd
  postmap /etc/postfix/sasl_passwd
  chmod 600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
fi

# Lancer Postfix
exec /usr/sbin/postfix start-fg