#!/bin/sh
cd ./client && rm -rf node_modules && yarn
cd ../server && bundle && rails s -d -p 3000
cd ../client && yarn dev