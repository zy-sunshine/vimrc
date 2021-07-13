#!/bin/bash

echo "
# NOTE: --disable-web-security will not set "origin" header when request target
# server, this will cause logic error in server origin check, so we can add a
# plugin ModHeader to set origin maunally.
"

open -na Google\ Chrome --args --user-data-dir=/Users/netsec/tmp/chromeDevUserData --disable-web-security --disable-site-isolation-trials --ignore-certificate-errors --allow-running-insecure-content
