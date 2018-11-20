#!/bin/bash

# Will still print ****, which is cool.
echo $userid $password

# Will interpolate to their values correctly.
zowe zosmf check status --zosmf-profile tx9 -H 9.212.128.238 -P 9143 -u $userid --pw $password --ru false