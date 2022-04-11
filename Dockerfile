FROM alpine

RUN apk update && \
    apk add freeradius freeradius-eap openssl && \
    rm -rf /var/cache/apk/*

COPY raddb/*.conf /etc/raddb/
COPY raddb/mods-available/eap /etc/raddb/mods-enabled/
COPY raddb/sites-available/site /etc/raddb/sites-available/

RUN rm /etc/raddb/sites-enabled/* && \
    rm -rf /etc/raddb/certs/* && \
    ln -s /etc/raddb/sites-available/site /etc/raddb/sites-enabled/site && \
    mkdir /tmp/radiusd && \
    chown radius:radius /tmp/radiusd

RUN chgrp -R radius /etc/raddb/

EXPOSE 1812-1813/udp
USER radius

ENTRYPOINT ["/usr/sbin/radiusd"]
CMD ["-X", "-f"]
