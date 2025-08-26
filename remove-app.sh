#!/bin/bash

printf "Do you wish to stop and remove the app \e[1;30;41mY\e[0mes | \e[1;30;42mN\e[0mo >>> "
read key

if [[ "$key" == "Y" ]]; then
echo "App stopping..."
docker-compose down

echo "Removing App image..."
docker rmi assignment_flask_app

echo "App removed !"
else
echo "Cancelled..!"
fi

