#!/usr/bin/env sh
set -ex
if [[ -e $GITHUB_WORKSPACE/create_resp.json ]] && [[ -z $ZENODO_DEPOSIT_ID ]];
then
    export ZENODO_DEPOSIT_ID=$(jq '.id' $GITHUB_WORKSPACE/create_resp.json)
fi
curl --request POST https://sandbox.zenodo.org/api/deposit/depositions/$ZENODO_DEPOSIT_ID/actions/publish?access_token=$ZENODO_API_TOKEN
