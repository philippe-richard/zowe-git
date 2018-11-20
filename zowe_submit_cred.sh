#!/usr/bin/env bash
set +x
echo 'jenkins'

zowe profiles create zosmf-profile tx9 --host 9.212.128.238 --port 9143 -u $CREDENTIALS_USR -p $CREDENTIALS_PSW --reject-unauthorized false --overwrite

#bright profiles create zosmf tso1 --host tso1 --port 443 -u $CREDENTIALS_USR -p $CREDENTIALS_PSW --no-ru
