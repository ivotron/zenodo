#!/usr/bin/env bash
set -ex
curl --header "Content-Type: application/json" \
      --request POST \
      --data @$ZENODO_METADATA \
      https://sandbox.zenodo.org/api/deposit/depositions?access_token=$ZENODO_API_TOKEN \
      -o ./create_deposition/resp.json
