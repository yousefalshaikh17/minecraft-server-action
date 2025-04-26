#!/usr/bin/env bash
set -euo pipefail

cd server

# Start Minecraft server in background and log to server.log
nohup java -Xmx1024M -Xms1024M -jar server.jar nogui \
  > server.log 2>&1 &
echo $! > server.pid
echo "Minecraft server started with PID $(cat server.pid)"

# Wait up to 60s for the server to finish starting
for i in $(seq 1 12); do
  if grep -q "Done (" server.log; then
    echo "Minecraft Server is ready!"
    break
  else
    echo "waiting for server to be ready (attempt $i/12)…"
    sleep 5
  fi
done