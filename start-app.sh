#!/bin/bash
set -e
echo "App starting..."

docker-compose up -d
if [ $? -ne 0 ]; then
  echo -e "\e[31mError: Failed to start the App\e[0m\n"
  exit 1
fi
echo -e "\e[32mApp is available at http://localhost:5000\e[0m\n"
