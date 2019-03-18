#!/usr/bin/env bash
set -ex
if [[ -e "./create_deposition/resp.json" ]] && [[ -z "$ZENODO_DEPOSIT_ID" ]];
then
    export ZENODO_DEPOSIT_ID=$(jq '.id' ./create_deposition/resp.json)
fi

if [[ -d "$UPLOAD_FILES_DIRECTORY" ]] && [ "$(ls -A $UPLOAD_FILES_DIRECTORY)" ];
then
  echo "uploading files in $UPLOAD_FILES_DIRECTORY"
  for file in "$UPLOAD_FILES_DIRECTORY"/*; do
    echo "$file"
    curl -F file=@"$file" \
    https://sandbox.zenodo.org/api/deposit/depositions/$ZENODO_DEPOSIT_ID/files?access_token=$ZENODO_API_TOKEN
  done
else
  echo "No files directory or empty directory"
fi


