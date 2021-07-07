#!/usr/bin/env bash
export SOCKS_PORT=8000
export URL='globalprotect.your.domain'
export USERNAME="your username"
# write your password in password.txt

openconnect --protocol=gp --user="$USERNAME" --script-tun --script "ocproxy -D $SOCKS_PORT -g -k 15" "$URL" < /scripts/password.txt
