#!/usr/bin/env bash

shopt -s globstar

tmp_file="$(mktemp)"
tar -czvf $tmp_file $(cat /etc/backup/backup.conf)

name=${NAME:-$(hostname)}
backup_file="$name-$(date +%Y%m%dT%H%M%S).tar.gz"
dbxcli put $tmp_file Backups/$name/$backup_file
