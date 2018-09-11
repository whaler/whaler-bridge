FROM alpine:3.8

LABEL maintainer "Sergei Vizel <http://github.com/cravler>"

RUN \
    apk add --no-cache bash curl vim jq && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /.whaler/bridge

VOLUME ["/.whaler"]
WORKDIR /.whaler

ADD ./bin/ /.whaler/bridge
ADD ./get-bridge.sh /usr/local/bin/get-bridge

CMD ["get-bridge"]
