FROM alpine:latest

RUN apk --update --no-cache add bind bind-dnssec-tools

COPY ./named.conf /etc/bind/named.conf
COPY ./db.local /etc/bind/db.local

CMD ["named", "-c", "/etc/bind/named.conf", "-g"]
