# navigate to the directory containing the Dockerfile
# docker build -t image_name:version_name (1.0/ version_1/etc) .
# the 1st argument is the name and tag of the image and 2nd argument is the location of the Dockerfile
# -t flag is used to mention the name and the tag of the image 

# docker runs all the commands in different layers of the image
# each command will have a layer and next command will be built on top of the previous layer

FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \ 
    MONGO_DB_PWD=password 

RUN mkdir -p /home/app

# copy the app directory from the host to /home/app directory of the container
COPY ./app /home/app
# this can be alternatively written as "./app /home/app/" 
# the extra / at the end indicates that a new directory has to be created if it does not exist


# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because it is WORKDIR
RUN npm install

# there can only be a single CMD in a Dockerfile
# it is the command that is to be execute when a Docker container starts
CMD ["node", "server.js"]

