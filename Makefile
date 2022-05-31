APP_IMAGE=ngr05/sbg-gaming-seit-tech-test:latest
APP_RUNNING_PORT=4000

start:
	docker run -d -p 4000:4000 --name sbg-tech-test-app $(APP_IMAGE)

stop:
	docker stop sbg-tech-test-app
	docker rm sbg-tech-test-app

logs:
	docker logs -f sbg-tech-test-app

test: stop start
	npm install -g newman-reporter-htmlextra
	docker pull dannydainton/htmlextra
	-newman run postman/collection/usman-SBG-game.postman_collection.json -e postman/env/Local.postman_environment.json -r htmlextra --reporter-htmlextra-export postman/reports
	@echo "Please note that the error is relating to the defect with supplier Id not setting correctly - Test Report Location - postman/reports"