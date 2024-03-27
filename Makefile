build-docker-ubuntu:
	docker buildx build -f docker/ubuntu-dev.dockerfile -t metagigachad/ubuntu-dev:latest .

