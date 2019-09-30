#!/bin/bash

WORK_DIR=$PWD

rm -rf out
mkdir out

cd incubator/nodejs-express/webapp/
rm -rf node_modules
tar -zcvf ./../../../out/appid.incubator.nodejs-express.webapp.tar.gz .

cd $WORK_DIR

cd incubator/nodejs-express/backendapp/
rm -rf node_modules
tar -zcvf ./../../../out/appid.incubator.nodejs-express.backendapp.tar.gz .

cd $WORK_DIR


