FROM alpine:3.7

COPY docker /tmp/docker

ADD https://github.com/grafana/grafana/archive/v5.2.0.tar.gz /tmp/build/grafana.tar.gz

RUN /tmp/docker/build.sh

EXPOSE 3000

VOLUME [ "/etc/grafana", "/var/lib/grafana", "/var/log/grafana" ]

USER grafana

ENTRYPOINT [ "/usr/bin/grafana-server", "-homepath", "/usr/share/grafana", "-config", "/etc/grafana/grafana.ini" ]
