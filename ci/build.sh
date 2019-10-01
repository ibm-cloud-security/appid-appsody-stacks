#!/bin/bash

WORK_DIR=$PWD
OUT_DIR="out"
AUTH_HEADER=$(cat ./ci/auth-header.txt)

FILENAME_INDEX_YAML="index.yaml"
FILENAME_NODEJS_WEBAPP="appid.incubator.nodejs-express.webapp.tar.gz"
FILENAME_NODEJS_BACKENDAPP="appid.incubator.nodejs-express.backendapp.tar.gz"

S3_BUCKET_URL="https://s3.us-east.cloud-object-storage.appdomain.cloud/appsody-stacks"

# ibmcloud iam oauth-tokens > ./ci/auth-header.txt

rm -rf $OUT_DIR
mkdir $OUT_DIR

cd incubator/nodejs-express/webapp/
rm -rf node_modules
tar -zcvf $WORK_DIR/$OUT_DIR/$FILENAME_NODEJS_WEBAPP .

cd $WORK_DIR

cd incubator/nodejs-express/backendapp/
rm -rf node_modules
tar -zcvf $WORK_DIR/$OUT_DIR/$FILENAME_NODEJS_BACKENDAPP .

cd $WORK_DIR

echo Uploading $FILENAME_INDEX_YAML
curl \
    -X PUT \
    -T "$WORK_DIR/$FILENAME_INDEX_YAML" \
    -H "Authorization: ${AUTH_HEADER}" \
    $S3_BUCKET_URL/$FILENAME_INDEX_YAML

echo Uploading $FILENAME_NODEJS_WEBAPP
curl \
    -X PUT \
    -T "$WORK_DIR/$OUT_DIR/$FILENAME_NODEJS_WEBAPP" \
    -H "Authorization: ${AUTH_HEADER}" \
    $S3_BUCKET_URL/$FILENAME_NODEJS_WEBAPP
    
echo Uploading $FILENAME_NODEJS_BACKENDAPP
curl \
    -X PUT \
    -T "$WORK_DIR/$OUT_DIR/$FILENAME_NODEJS_BACKENDAPP" \
    -H "Authorization: ${AUTH_HEADER}" \
    $S3_BUCKET_URL/$FILENAME_NODEJS_BACKENDAPP

