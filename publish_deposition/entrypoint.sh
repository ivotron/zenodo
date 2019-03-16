#!/usr/bin/env bash
set -ex
if [[ -e ../create_deposition/resp.json ]] && [[ -z $ZENODO_DEPOSIT_ID ]];
then
    export ZENODO_DEPOSIT_ID=$(jq '.id' ../create_deposition/resp.json)
fi
curl --request POST https://sandbox.zenodo.org/api/deposit/depositions/$ZENODO_DEPOSIT_ID/actions/publish?access_token=$ZENODO_API_TOKEN -o resp.json \
 && \
 if [[ -e ../create_deposition/resp.json ]]; then
    rm ../create_deposition/resp.json
 fi
