FROM alpine
RUN apk add --no-cache --update murmur shadow \
    && rm -rf /var/cache/apk/* \
    && useradd -u 1000 murmur \
    && mkdir /data

ADD mumble-server.ini /config/mumble-server.ini

VOLUME ["/data", "/config"]


EXPOSE 64738/udp

USER murmur

#ENTRYPOINT ["murmurd", "-fg", "-ini", "/config/mumble-server.ini", "-supw", password]
ENTRYPOINT ["murmurd", "-fg", "-ini", "/config/mumble-server.ini"]