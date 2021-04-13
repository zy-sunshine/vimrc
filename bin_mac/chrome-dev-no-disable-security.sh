#!/bin/bash

# NOTE: --disable-web-security will not set "origin" header when request target
# server, this will cause logic error in server origin check, so we can add a
# plugin to bypass cors, and only use --ignore-certificate-errors to allow not
# security ssl certificate site.
# the plugin namely "cros-anywhere" url is below:
PLUGIN_URL="https://chrome.google.com/webstore/detail/cros-anywhere/gcagclbpmooihllccniifbdekfeneebm/related?utm_source=chrome-ntp-icon"
echo "you can install plugin to bypass cors restrict:"
echo $PLUGIN_URL
# --disable-web-security
open -na Google\ Chrome --args --user-data-dir=/Users/netsec/tmp/chromeDevUserData --disable-site-isolation-trials --ignore-certificate-errors
