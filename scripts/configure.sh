#!/bin/bash
set -e

cd server

# Write eula.txt
echo "eula=${INPUT_EULA}" > eula.txt
echo "Updated EULA: ${INPUT_EULA}"

echo "Configuring server.properties..."

echo "$INPUT_PROPERTIES" | while IFS='=' read -r key value; do
  echo "Key: $key, Value: $value"
  if grep -q "^$key=" server.properties; then
    sed -i "s/^$key=.*/$key=$value/" server.properties
  else
    echo "$key=$value" >> server.properties
  fi
done