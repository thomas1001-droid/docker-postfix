FROM alpine:3.19

RUN apk add --no-cache postfix cyrus-sasl cyrus-sasl-plain

# Répertoire pour postfix
RUN mkdir -p /var/spool/postfix /var/mail && \
    chown -R postfix:postfix /var/spool/postfix /var/mail

# Copie config de base
COPY main.cf /etc/postfix/main.cf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 25

CMD ["/start.sh"]