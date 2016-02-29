#!/bin/bash
set -e

#Add app config
sed -i -e "s/\"db\": \"YourDataBaseName\"/\"db\": \"${MONGODB_NAME}\"/g" /app/config/parameters.json
sed -i -e "s/\"username\": \"YourDataBaseUserName\"/\"username\": \"${MONGODB_USER}\"/g" /app/config/parameters.json
sed -i -e "s/\"password\": \"YourDatabasePassword\"/\"password\": \"${MONGODB_PASS}\"/g" /app/config/parameters.json
sed -i -e "s/\"privateKey\": \"YourPrivateKey\"/\"privateKey\": \"${PRIVATE_KEY}\"/g" /app/config/parameters.json
sed -i -e "s/\"email\": \"senderMail@website.com\"/\"email\": \"${EMAIL}\"/g" /app/config/parameters.json
sed -i -e "s/\"userName\": \"YourMailAccount\"/\"username\": \"${EMAIL_NAME}\"/g" /app/config/parameters.json
sed -i -e "s/\"password\": \"YourMailPassword\"/\"password\": \"${EMAIL_PASSWD}\"/g" /app/config/parameters.json
sed -z -i -e "s/127\.0\.0\.1/${MONGO_HOST}/2" /app/config/parameters.json

#Install Dependencies
cd /app
npm install

exec "$@"
