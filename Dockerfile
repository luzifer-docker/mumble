FROM ubuntu:14.04
MAINTAINER Knut Ahlers <knut@ahlers.me>

RUN useradd -u 1000 mumble && \
    apt-get update && \
    apt-get install -y mumble-server && \
    mkdir /data && chown 1000 /data

VOLUME ["/data", "/etc/mumble-server.ini"]
EXPOSE 64738

USER mumble
ENTRYPOINT ["/usr/sbin/murmurd", "-ini", "/etc/mumble-server.ini"]
