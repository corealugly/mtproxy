#!/bin/bash

ownDirName=$(dirname ${0})
fileVersion="${ownDirName}/lastVersion.txt"
COMPONENT="mtproxy"
FROM="local/project"
TO="example.ru/project"

VERSION="${1}"
if [[ -z ${1} ]]; then echo "ERROR: not exist 1 arg"; cat ${fileVersion}; exit 1; fi

#docker build  --no-cache -t ${FROM}/${COMPONENT}:${VERSION} -t ${FROM}/${COMPONENT}:latest .
docker build -t ${FROM}/${COMPONENT}:${VERSION} -t ${FROM}/${COMPONENT}:latest .

#PUSH INTO EXTENRNAL REPO
#docker tag ${FROM}/${COMPONENT}:${VERSION} ${TO}/${COMPONENT}:${VERSION}
#docker tag ${FROM}/${COMPONENT}:${VERSION} ${TO}/${COMPONENT}:latest
#docker push     ${TO}/${COMPONENT}:${VERSION}
#docker push     ${TO}/${COMPONENT}:latest

echo ${1} > ${fileVersion}
