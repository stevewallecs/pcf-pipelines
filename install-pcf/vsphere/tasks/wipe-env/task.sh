#!/bin/bash
set -e
set -x

root=$(pwd)

source "${root}/pcf-pipelines/functions/check_opsman_available.sh"

opsman_available=$(check_opsman_available $OPSMAN_URI)
if [[ $opsman_available == "available" ]]; then
  om-linux \
    --target "https://172.28.92.5" \
    --skip-ssl-validation \
    --username $OPSMAN_USERNAME \
    --password $OPSMAN_PASSWORD \
    delete-installation
fi
