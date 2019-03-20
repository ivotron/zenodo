#!/usr/bin/env sh
set -ex
if [[ -z "$ZENODO_USE_SANDBOX" ]]; then
    BASE_URL="https://zenodo.org/api/deposit/depositions"
else
    BASE_URL="https://sandbox.zenodo.org/api/deposit/depositions"
fi
if [[ -e "$GITHUB_WORKSPACE/create_resp.json" ]] && [[ -z "$ZENODO_DEPOSIT_ID" ]];
then
    export ZENODO_DEPOSIT_ID=$(jq '.id' $GITHUB_WORKSPACE/create_resp.json)
fi

if [[ -d "$UPLOAD_FILES_DIRECTORY_PATH" ]] && [ "$(ls -A $UPLOAD_FILES_DIRECTORY_PATH)" ];
then
  echo "uploading files in $UPLOAD_FILES_DIRECTORY"
  for file in "$UPLOAD_FILES_DIRECTORY_PATH"/*; do
    echo "$file"
    curl -F file=@"$file" \
    $BASE_URL/$ZENODO_DEPOSIT_ID/files?access_token=$ZENODO_API_TOKEN
  done
else
  echo "No files directory or empty directory"
fi


