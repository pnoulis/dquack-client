#!/bin/bash

SERVER='localhost:8080'
aContainer='abs234'
data='{
  "name": "pavlos"
  }'

function listServices() {
  curl \
    --request 'GET' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --header 'Connection: close' \
    "${SERVER}/services"
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
    "${SERVER}/service/${2}"
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
    "${SERVER}/service/${2}"
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
    "${SERVER}/service/${2}"
  echo
}

listServices "$data" "$aContainer"
getService "$data" "$aContainer"
postService "$data" "$aContainer"
deleteService "$data" "$aContainer"
