FROM richarvey/nginx-php-fpm
MAINTAINER lilg <lilg@asiainfo.com>

ENV PYDIO_VERSION 6.4.1

RUN apk add --no-cache --update-cache --update bash curl ca-certificates && \
    curl -o /tmp/pydio-core-${PYDIO_VERSION}.tar.gz  https://download.pydio.com/pub/core/archives/pydio-core-${PYDIO_VERSION}.tar.gz  && \
    tar -xzf /tmp/pydio-core-${PYDIO_VERSION}.tar.gz  -C /var/www/ && \
    mv /var/www/html/pydio-core-${PYDIO_VERSION} /var/www/html/pydio && \
    apk del curl ca-certificates && \
    rm -rf /tmp/* /var/cache/apk/* 

CMD ["/start.sh"]
