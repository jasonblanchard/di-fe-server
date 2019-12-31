.PHONY: build tag push deploy

IMAGE_NAME=di-fe-server
GIT_SHA = $(shell git rev-parse HEAD)
IMAGE_REPO=jasonblanchard/${IMAGE_NAME}
LOCAL_TAG = ${IMAGE_REPO}
LATEST_TAG= ${IMAGE_REPO}:latest
SHA_TAG = ${IMAGE_REPO}:${GIT_SHA}

build:
	docker build -t ${LOCAL_TAG} .

tag: build
	docker tag ${LOCAL_TAG} ${SHA_TAG}

push: tag
	docker push ${LATEST_TAG}
	docker push ${SHA_TAG}
