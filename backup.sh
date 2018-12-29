#!/usr/bin/env bash

shopt -s globstar

tmp_file="$(mktemp)"
tar -czvf $tmp_file $(cat /etc/backup/backup.conf)

name=${NAME:-$(hostname)}
backup_file="${name}_$(date -u +%Y%m%dT%H%M%SZ).tar.gz"
dbxcli put $tmp_file Backups/$name/$backup_file
