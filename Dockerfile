FROM ubuntu

ADD https://github.com/dropbox/dbxcli/releases/download/v3.0.0/dbxcli-linux-amd64 /usr/local/bin/dbxcli
RUN chmod +x /usr/local/bin/dbxcli

COPY backup.sh /

VOLUME /files
VOLUME /etc/backup
VOLUME /root/.config/dbxcli

WORKDIR /files

ENTRYPOINT ["/backup.sh"]
