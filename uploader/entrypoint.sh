#!/usr/bin/env bash
set -ex
curl --header "Content-Type: application/json" \
      --request POST \
      --data '{"metadata":{"title":"Title here","upload_type":"poster","description":"This is just for test","creators":[{"name":"Arshul","affiliation":"CROSS"}]}}' \
      https://sandbox.zenodo.org/api/deposit/depositions?access_token=$ZENODO_API_TOKEN \
      -o resp.json
