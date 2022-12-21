set -e

DOCKER_REPO=paradoxon/alpine-cron-sentry

docker build --pull -t docker-cron-sentry .

DOCKER_TAG=$(docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro docker-cron-sentry docker version --format '{{.Client.Version}}')

docker tag $(docker images -q docker-cron-sentry) ${DOCKER_REPO}:${DOCKER_TAG}
docker tag $(docker images -q docker-cron-sentry) ${DOCKER_REPO}:latest

docker login
docker push ${DOCKER_REPO}:${DOCKER_TAG}
docker push ${DOCKER_REPO}:latest
