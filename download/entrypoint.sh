#!/usr/bin/env bash
if [[ -z "$ZENODO_FILES" ]]; then
    file_list=""
    for file in $(curl -H "Accept: application/json" -H "Content-Type: application/json" -X GET https://sandbox.zenodo.org/api/deposit/depositions/$ZENODO_RECORD_ID/files?access_token=$ZENODO_API_TOKEN | jq -r '.[] | .filename'); do
        file_list+=$file,
    done
    export ZENODO_FILES=$file_list
fi
if [[ -d "$ZENODO_OUTPUT_DIR" ]]; then
    IFS=','
    read -ra ADDR <<< "$ZENODO_FILES"
    for i in "${ADDR[@]}"; do
        if [[ ! -e "$ZENODO_OUTPUT_DIR"/"$i" ]]; then
            cd "$ZENODO_OUTPUT_DIR" && curl -LO https://sandbox.zenodo.org/record/$ZENODO_RECORD_ID/files/"$i"
        fi
    done
else
    mkdir "$ZENODO_OUTPUT_DIR" && cd "$ZENODO_OUTPUT_DIR" &&\
    IFS=','
    read -ra ADDR <<< "$ZENODO_FILES"
    for i in "${ADDR[@]}"; do
        curl -LO https://sandbox.zenodo.org/record/$ZENODO_RECORD_ID/files/"$i"
    done
fi


