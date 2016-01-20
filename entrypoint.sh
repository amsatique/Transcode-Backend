#!/bin/bash
set -e

#Installing Hapi-struct
git clone https://github.com/amsatique/hapi-struct.git
cd /hapi-struct

#Add Hapi-struct config
sed -i -e 's/"db": "YourDataBaseName"/"db": $MONGODB_NAME/g' /hapi-struct/config/parameters.json
sed -i -e 's/"username": "YourDataBaseUserName"/"username": $MONGODB_USER/g' /hapi-struct/config/parameters.json
sed -i -e 's/"password": "YourDatabasePassword"/"password": $MONGODB_PASS/g' /hapi-struct/config/parameters.json
sed -i -e 's/"privateKey": "YourPrivateKey"/"privateKey": $PRIVATE_KEY/g' /hapi-struct/config/parameters.json
sed -i -e 's/"email": "senderMail@website.com"/"email": $EMAIL/g' /hapi-struct/config/parameters.json
sed -i -e 's/"userName": "YourMailAccount"/"username": $EMAIL_NAME/g' /hapi-struct/config/parameters.json
sed -i -e 's/"password": "YourMailPassword"/"password": $EMAIL_PASSWD/g' /hapi-struct/config/parameters.json

npm install

exec "$@"
