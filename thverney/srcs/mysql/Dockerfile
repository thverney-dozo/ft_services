FROM nginx:alpine

RUN apk add --update \
    mysql-client \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["mysql"]
