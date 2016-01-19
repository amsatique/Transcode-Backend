#!/bin/bash
set -e

#Installing Hapi-struct
wget https://github.com/MarcHanin/hapi-struct/archive/master.zip
tar -xvf master.zip -C /Hapi-Struct --strip-components=1
rm -rf master.zip

#Add Hapi-struct config
sed -i -e 's/"db": "YourDataBaseName"/"db": $MONGODB_NAME/g' /Hapi-Struct/config/parameters.json
sed -i -e 's/"username": "YourDataBaseUserName"/"username": $MONGODB_USER/g' /Hapi-Struct/config/parameters.json
sed -i -e 's/"password": "YourDatabasePassword"/"password": $MONGODB_PASS/g' /Hapi-Struct/config/parameters.json
sed -i -e 's/"privateKey": "YourPrivateKey"/"privateKey": $PRIVATE_KEY/g' /Hapi-Struct/config/parameters.json
sed -i -e 's/"email": "senderMail@website.com"/"email": $EMAIL/g' /Hapi-Struct/config/parameters.json
sed -i -e 's/"userName": "YourMailAccount"/"username": $EMAIL_NAME/g' /Hapi-Struct/config/parameters.json
sed -i -e 's/"password": "YourMailPassword"/"password": $EMAIL_PASSWD/g' /Hapi-Struct/config/parameters.json

npm install

exec "$@"
