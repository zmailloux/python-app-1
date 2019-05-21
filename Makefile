APP_NAME=python-app-1
PORT=8080
DOCKER_REPO=gcr.io/kubernetes-testing-237121

build:
	docker build -t $(APP_NAME) .

tag-latest:
	@echo 'create tag latest'
	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest

login-gcp:
	@echo 'TODO: logging into GCP$(AWS_PROFILE)'

publish: tag-latest login-gcp
	@echo 'publish latest to $(DOCKER_REPO)'
	docker push $(DOCKER_REPO)/$(APP_NAME):latest
