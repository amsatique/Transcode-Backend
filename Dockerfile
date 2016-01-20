FROM ubuntu:latest
MAINTAINER Francois Dazan

RUN apt-get update
# Installing dependencies
RUN apt-get -y install wget git

#Installing Nodejs
WORKDIR /
RUN wget https://nodejs.org/dist/v5.3.0/node-v5.3.0-linux-x64.tar.gz && mkdir /nodejs
RUN tar -xvf node-v5.3.0-linux-x64.tar.gz -C /nodejs

# Set the port to 80
EXPOSE 80

# Start script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /*.sh

# Executing supervisord
ENTRYPOINT ["/entrypoint.sh"]

# Executing supervisord
CMD ["npm start"]
