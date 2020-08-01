#!/bin/sh

# FreeBSD package is no longer maintained
# Use official nzbget release instead
fetch https://nzbget.net/download/nzbget-latest-bin-freebsd.run -o /tmp
sh /tmp/nzbget-latest-bin-freebsd.run --destdir /usr/local/nzbget

# Moved log files out of nzbget downloads folder
mkdir -p /usr/local/nzbget/logs

# Don't run nzbget as root
pw user add nzbget -c nzbget -u 504 -d /nonexistent -s /usr/bin/nologin
chown -R nzbget:nzbget /usr/local/nzbget

sysrc nzbget_enable="YES"
service nzbget start