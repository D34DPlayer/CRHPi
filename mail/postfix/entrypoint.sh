#!/bin/bash

for template in $(find /etc/postfix/ -name "*.template"); do
    file=${template%.*}
    envsubst '$DOMAIN_NAME','$PUBLIC_IP' < $template > $file
done

exec "$@"
