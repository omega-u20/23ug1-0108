from flask import Flask
import redis
app = Flask(__name__)
client = redis.Redis(host='redis_db', port=6379)

@app.route('/')
def home():
	count = client.incr('visits')
	return f'Visit Count: {count}'

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=5000)