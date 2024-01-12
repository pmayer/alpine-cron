set -e

DOCKER_IMAGE=alpine-cron
DOCKER_REPO=paradoxon/${DOCKER_IMAGE}
PLATFORMS=linux/amd64,linux/arm64,linux/arm/v7

docker login

DOCKER_TAG=$(docker run --rm --pull always -v /var/run/docker.sock:/var/run/docker.sock:ro docker:latest docker version --format '{{.Client.Version}}')

docker buildx build --platform ${PLATFORMS} --pull -t ${DOCKER_REPO}:${DOCKER_TAG} --push .
docker buildx build --platform ${PLATFORMS} --pull -t ${DOCKER_REPO}:latest --push .

