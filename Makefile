build:
	docker build \
		--build-arg http_proxy="${http_proxy}" \
		--build-arg HTTP_PROXY="${HTTP_PROXY}" \
		--build-arg https_proxy="${https_proxy}" \
		--build-arg HTTPS_PROXY="${HTTPS_PROXY}" \
		-t luxtagofficial/catapult-harvestmon \
		-f Dockerfile \
		.

push:
	docker push luxtagofficial/catapult-harvestmon
