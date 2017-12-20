#!/bin/bash
# $1: The build config
# $2: The service account
# $3: Project namespace

oc patch dc/$1 --type=json -p '[{"op": "add", "path": "/spec/template/spec/serviceAccountName", "value": "'$2'"}]' -n $3
