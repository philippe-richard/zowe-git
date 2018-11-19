#!/usr/bin/env bash
set +x
echo 'jenkins'
zowe profiles create zosmf-profile tx9 --host tx9 --port 9143 --$ZOWE_OPT_USER --pass $ZOWE_OPT_USER_PWD --reject-unauthorized false --overwrite
#bright profiles create zosmf tso1 --host tso1 --port 443 -u $CREDENTIALS_USR -p $CREDENTIALS_PSW --no-ru
