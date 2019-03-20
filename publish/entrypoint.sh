#!/usr/bin/env sh
set -ex
if [[ -z "$ZENODO_USE_SANDBOX" ]]; then
    BASE_URL="https://zenodo.org/api/deposit/depositions"
else
    BASE_URL="https://sandbox.zenodo.org/api/deposit/depositions"
fi
if [[ -e $GITHUB_WORKSPACE/create_resp.json ]] && [[ -z $ZENODO_DEPOSIT_ID ]];
then
    export ZENODO_DEPOSIT_ID=$(jq '.id' $GITHUB_WORKSPACE/create_resp.json)
fi
curl --request POST $BASE_URL/$ZENODO_DEPOSIT_ID/actions/publish?access_token=$ZENODO_API_TOKEN
