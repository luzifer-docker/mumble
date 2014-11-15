FROM ubuntu:14.04
MAINTAINER Knut Ahlers <knut@ahlers.me>

RUN apt-get update && \
    apt-get install -y mumble-server && \
    mkdir /data && chown mumble-server /data

VOLUME ["/data", "/etc/mumble-server.ini"]
EXPOSE 64738

USER mumble-server
ENTRYPOINT ["/usr/sbin/murmurd", "-ini", "/etc/mumble-server.ini"]
