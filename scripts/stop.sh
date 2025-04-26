#!/bin/bash
cd server
if [ -f server.pid ]; then
  kill $(cat server.pid)
  echo "Minecraft server stopped."
else
  echo "No PID found. Server may not be running."
fi
