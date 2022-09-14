#!/bin/bash

SERVER='localhost:8080'
USER='pavlos'
APP_NAME='app_name'
aContainer='mssql_t2019'
data='{
  "custom_settings": "pavlos"
  }'

function listServices() {
  curl \
    --request 'GET' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --header 'Connection: close' \
    "${SERVER}/service?user=${USER}&app=${APP_NAME}"
  echo
}

# Params
# @data
# @serviceID
function getService() {
  curl \
    --request 'GET' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --header 'Connection: close' \
    "${SERVER}/service/${2}?user=${USER}&app=${APP_NAME}"
  echo
}

# Params
# @data
# @serviceID
function postService() {
  curl \
    --request 'POST' \
    --header 'Content-Type: application/json' \
    --header 'Connection: close' \
    --data "$1" \
    "${SERVER}/service/${2}?user=${USER}&app=${APP_NAME}"
  echo
}

# Params
# @data
# @serviceID
function deleteService() {
  curl \
    --request 'DELETE' \
    --header 'Content-Type: application/json' \
    --header 'Connection: close' \
    --data "$1" \
    "${SERVER}/service/${2}?user=${USER}&app=${APP_NAME}"
  echo
}

listServices "$data" "$aContainer"
getService "$data" "$aContainer"
postService "$data" "$aContainer"
deleteService "$data" "$aContainer"
