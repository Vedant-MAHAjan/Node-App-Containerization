# 💻 Developing with Docker 🐳

This demo app shows a simple user profile app set up using 
- index.html with pure js and css styles
- nodejs backend with express module
- mongodb for data storage

All components are docker-based

## With Docker

#### To start the application

Step 1: Create docker network

    docker network create mongo-network 

Step 2: start mongodb 

    docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo    

Step 3: start mongo-express
    
    docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express   

_NOTE: creating docker-network in optional. You can start both containers in a default network. In this case, just emit `--net` flag in `docker run` command_

Step 4: open mongo-express from browser

    http://localhost:8081

Step 5: create `user-account` _db_ and `users` _collection_ in mongo-express

Step 6: Start your nodejs application locally - go to `app` directory of project 

    npm install 
    node server.js
    
Step 7: Access you nodejs application UI from browser

    http://localhost:3000

### With Docker Compose 📝

#### To start the application

Step 1: start mongodb and mongo-express

    docker-compose -f docker-compose.yaml up
    
_You can access the mongo-express under localhost:8080 from your browser_
    
Step 2: in mongo-express UI - create a new database "my-db"

Step 3: in mongo-express UI - create a new collection "users" in the database "my-db"       

Step 4: build a docker image from the application

    docker build -t my-app:1.0 .       
    
The dot "." at the end of the command denotes location of the Dockerfile.

Step 5: access the nodejs application from browser 

    http://localhost:3000
    
## Node Application

### Default profile
    
![image](https://github.com/Vedant-MAHAjan/Node-App-Containerization/assets/88843623/fead9ef4-33fb-4060-92c1-e68d8e6ee591)

### Updated profile

![image](https://github.com/Vedant-MAHAjan/Node-App-Containerization/assets/88843623/071f8b1e-a9a0-4823-9268-ce9c94dd7dbf)

## MongoDB Database 

### Before updating the profile

![image](https://github.com/Vedant-MAHAjan/Node-App-Containerization/assets/88843623/4d1d415c-116d-4ec0-867d-403cf2d7e136)

### After updating the profile

* New Database created
* New Collection created
* Entry of the updated profile added

![image](https://github.com/Vedant-MAHAjan/Node-App-Containerization/assets/88843623/66c412fd-a27b-4359-9c53-c9e995582d25)

* Click on the "my-db" database
* Click on the "users" collection
* The updated profile data will be stored


