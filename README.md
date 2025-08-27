# Assignment 2
## Application Description: What the application does.
The bash scripts in this repo can be used to:
- prepare-app.sh : To prepare the app
- start-app.sh : To start the app
- stop-app.sh : To stop the app
- remove-app.sh : To remove app

## Deployment Requirements: Detailed list of required software (e.g., Docker, Docker Compose).
To run this application, ensure the following software and environment setup:
- Operating System: Ubuntu 22.04.02
- Docker Engine: Installed and running
- Docker Compose: Installed and verified via docker-compose --version
- Terminal(Ubuntu terminal)
- Web Browser(Firefox)
- Basic CLI Knowledge
 
## Network and Volume Details: Description of virtual networks and named volumes used.
>networks: app-network  
>volumes: redis_data

## Container Configuration: Details of how containers are configured.
1. flask_app
	- Build Context: Local directory with Dockerfile
	- Exposed Port: 5000 (mapped to host)
	- Dependencies: Waits for redis\_db to be ready (depends\_on)
	- Network: app-network

2. redis_db
	- Image: redis:7-alpine
	- Volume Mount: /data mapped to redis_data
	- Network: app-network

## Container List: List of containers and their roles.
| Container | Role |
|-----------|------|
| flask_app | Hosts the Flask web server |
| redis_db | Stores and manages visit counter |

## Instructions:
Prerequisites
Install Docker Engine and verify it. 
1. Update the package index:
```sudo apt-get update```

2. Install dependencies: 
```sudo apt-get install -y ca-certificates curl gnupg lsb-release```
 
3. Add Docker’s GPG key: 
```curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg -dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg```

4. Set up Docker repository: 
```echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null```

5. Update package index again: 
```sudo apt-get update```
 
6. Install Docker Engine and CLI:
```sudo apt-get install -y docker-ce docker-ce-cli containerd.io```

7. Add your user to the docker group:
`sudo usermod -aG docker $USER`
`newgrp docker`

8. Verify Docker installation: 
```docker --version```

Install Docker Compose and verify it.
1. Install Docker Compose if not already installed:
```sudo apt-get update
sudo apt-get install-y docker-compose```

2. Verify Docker Compose:
```docker-compose --version```

### To allow the bash scripts to execute
Do the following for every .sh in the folder
`chmod +x <file name>.sh`
*Important: without this the bash script will not excute*

- How to prepare, run, pause, and delete the application.
 *To prepare the app*
`./prepare-app.sh`

*To run the app*
`./start-app.sh`

*To stop the app*
`./stop-app.sh`

*To remove the app*
`./remove-app.sh`

- How to access the application via a web browser.
After executing `./start-app.sh` the output will show the app link
>App is available at http://localhost:5000
By clicking the link or pasting it on a web browser address bar we can access the app

## Example Workflow: Demonstrate application usage, 
`$ ./prepare-app.sh`
>```Preparing App...

Creating Flask app
...
Dockerfile Created

App prepared...```

`$ ./start-app.sh`
>```App starting...
Creating network "assignment_app-network" with driver "bridge"
Building flask_app
...
App is available at http://localhost:5000```

*All the user prompts are CASE sensitive*
`$ ./stop-app.sh` 
>```Do you wish to stop the app Yes | No >> Y
App Stopping...
Stopping assignment_flask_app_1 ... done
Stopping assignment_redis_db_1  ... done
Removing assignment_flask_app_1 ... done
Removing assignment_redis_db_1  ... done
Removing network assignment_app-network```

`$ ./remove-app.sh`
>```Do you wish to stop and remove the app Yes | No >>> Y
App stopping...
Removing network assignment_app-network
WARNING: Network assignment_app-network not found.
Removing App image...
...
App removed !```
