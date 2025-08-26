#!/bin/bash
echo -e "Preparing App...\n"

echo "Creating Flask app"
printf "from flask import Flask
import redis
app = Flask(__name__)
client = redis.Redis(host='redis_db', port=6379)\n
@app.route('/')
def home():
\tcount = client.incr('visits')
\treturn f'Visit Count: {count}'\n
if __name__ == '__main__':
\tapp.run(host='0.0.0.0', port=5000)" > app.py
echo -e "Flask app created as \e[32mapp.py\e[0m\n"

echo "Creating Requirements file"
printf "flask==2.0.3
werkzeug==2.0.3
redis==4.0.2" > requirements.txt
echo -e "\e[32mRequirement file created\e[0m\n"

echo "Creating Dockerfile..."
printf "FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
EXPOSE 5000
CMD [\"python\", \"app.py\"]" > Dockerfile
echo -e "\e[32mDockerfile Created\e[0m\n"

echo -e "\e[32mApp prepared...\e[0m\n"
