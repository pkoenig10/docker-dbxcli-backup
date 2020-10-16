FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

ADD https://github.com/dropbox/dbxcli/releases/download/v3.0.0/dbxcli-linux-amd64 /usr/local/bin/dbxcli
RUN chmod +x /usr/local/bin/dbxcli

COPY backup.sh /

VOLUME /files
VOLUME /etc/backup
VOLUME /root/.config/dbxcli

WORKDIR /files

ENTRYPOINT ["/backup.sh"]
