#!/bin/bash
mkdir -p server
cd server
if [ ! -f server.jar ]; then
  curl -o server.jar https://piston-data.mojang.com/v1/objects/e6ec2f64e6080b9b5d9b471b291c33cc7f509733/server.jar
fi

java -Xmx1024M -Xms1024M -jar server.jar nogui