#!/usr/bin/env bash
set -ex
curl --request POST https://sandbox.zenodo.org/api/deposit/depositions/$ZENODO_DEPOSIT_ID/actions/publish?access_token=$ZENODO_API_TOKEN -o resp.json
