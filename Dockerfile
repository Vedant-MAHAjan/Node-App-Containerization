# navigate to the directory containing the Dockerfile
# docker build -t image_name:version_name (1.0/ version_1/etc) .
# the 1st argument is the name and tag of the image and 2nd argument is the location of the Dockerfile

# docker runs all the commands in different layers of the image
# each command will have a layer and next command will be built on top of the previous layer

FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

