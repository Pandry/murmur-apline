FROM alpine
RUN apk add --no-cache --update murmur shadow \
    && rm -rf /var/cache/apk/* \
    && useradd -u 1000 murmur && true && echo "utente creato" || echo "utente non creato - già esistente?"  \
    && mkdir /config \
    && chown -R murmur:murmur /config

ADD murmur.ini /config/murmur.ini

VOLUME ["/data", "/config"]


EXPOSE 64738/udp

USER murmur

#ENTRYPOINT ["murmurd", "-fg", "-ini", "/config/mumble-server.ini", "-supw", password]
ENTRYPOINT ["murmurd", "-fg", "-ini", "/config/murmur.ini"]
