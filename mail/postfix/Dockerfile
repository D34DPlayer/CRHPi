FROM alpine:latest

# Install dependencies
RUN apk add --no-cache --update gettext libintl postfix cyrus-sasl ca-certificates bash && \
    apk add --no-cache --upgrade musl musl-utils && \
    # Clean up
    (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

WORKDIR /etc/postfix

COPY ./main.cf ./main.cf.template
COPY ./master.cf .
COPY ./smtp_header_checks .

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["postfix", "start-fg"]
