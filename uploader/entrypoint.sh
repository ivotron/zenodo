#!/usr/bin/env bash
set -ex
sh -c 'curl --header "Content-Type: application/json" --request POST --data "{}" https://zenodo.org/api/deposit/depositions?access_token=$ACCESS_TOKEN'
