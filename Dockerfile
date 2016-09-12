FROM alpine:3.4
MAINTAINER Sergei Vizel <http://github.com/cravler>

RUN \
    apk add --no-cache bash curl vim && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /.whaler/bridge

VOLUME ["/.whaler"]
WORKDIR /.whaler

ADD ./bin/ /.whaler/bridge
ADD ./get-docker.sh /usr/local/bin/get-docker

CMD ["get-docker"]