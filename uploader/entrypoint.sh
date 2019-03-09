#!/usr/bin/env bash
set -ex
#sh -c "echo $*"
#set -ex
sh -c 'curl --header "Content-Type: application/json" --request POST --data "{}" https://zenodo.org/api/deposit/depositions?access_token=MYPi00f6mwX3CY5aaeYbjCkAeGYlHa5JhfqfAQye5AUNUHjvGJHrYOl6OiTw'
