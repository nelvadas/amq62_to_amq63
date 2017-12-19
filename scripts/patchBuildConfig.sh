#!/bin/bash
# $1: The build config
# $2: The new image tag: image:tag
# $3: Project namespace



oc patch bc/$1 --type=json -p '[{"op": "replace" ,"path": "/spec/strategy/sourceStrategy/from/name", "value": "'$2'" }]' -n $3
