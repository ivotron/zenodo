#!/usr/bin/env sh
set -e
if [[ -z "$ZENODO_USE_SANDBOX" ]]; then
    BASE_URL="https://zenodo.org/api/deposit/depositions"
else
    BASE_URL="https://sandbox.zenodo.org/api/deposit/depositions"
fi
curl --header "Content-Type: application/json" \
      --request POST \
      --data @$ZENODO_METADATA_PATH \
      $BASE_URL?access_token=$ZENODO_API_TOKEN \
      -o $GITHUB_WORKSPACE/create_resp.json
