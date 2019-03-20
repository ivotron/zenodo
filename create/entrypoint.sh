#!/usr/bin/env sh
set -ex
curl --header "Content-Type: application/json" \
      --request POST \
      --data @$ZENODO_METADATA_PATH \
      https://sandbox.zenodo.org/api/deposit/depositions?access_token=$ZENODO_API_TOKEN \
      -o $GITHUB_WORKSPACE/create_resp.json
