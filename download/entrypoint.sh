#!/usr/bin/env sh
set -ex
if [[ -z "$ZENODO_USE_SANDBOX" ]]; then
    BASE_URL="https://zenodo.org"
else
    BASE_URL="https://sandbox.zenodo.org"
fi
if [[ -z "$ZENODO_FILES" ]]; then
    file_list=""
    for file in $(curl -H "Accept: application/json" -H "Content-Type: application/json" -X GET $BASE_URL/api/records/$ZENODO_RECORD_ID | jq -r '.files |.[]| .filename'); do
        file_list=$file_list$file,
    done
    export ZENODO_FILES=$file_list
    echo $ZENODO_FILES
fi
[[ -d "$GITHUB_WORKSPACE/$ZENODO_OUTPUT_PATH" ]] || mkdir "$ZENODO_OUTPUT_PATH"
IFS=','
for i in $ZENODO_FILES; do
  echo "$i"
  if [[ ! -e $GITHUB_WORKSPACE/"$ZENODO_OUTPUT_PATH"/"$i" ]]; then
    cd $GITHUB_WORKSPACE/"$ZENODO_OUTPUT_PATH" && curl -LO $BASE_URL/record/$ZENODO_RECORD_ID/files/"$i"
  fi
done

