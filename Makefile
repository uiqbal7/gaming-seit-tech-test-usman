APP_IMAGE=:latest
APP_RUNNING_PORT=4000

start:
	# Please put your start commands here

stop:
	docker stop sbg-tech-test-app
	docker rm sbg-tech-test-app

logs:
	docker logs -f sbg-tech-test-app

test: stop start
	# Feel free to put your test commands here