set -e

DOCKER_REPO=paradoxon/alpine-cron

docker build --pull -t docker-cron .

DOCKER_TAG=$(docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro docker-cron docker version --format '{{.Client.Version}}')

docker tag $(docker images -q docker-cron) ${DOCKER_REPO}:${DOCKER_TAG}
docker tag $(docker images -q docker-cron) ${DOCKER_REPO}:latest

docker login
docker push ${DOCKER_REPO}:${DOCKER_TAG}
docker push ${DOCKER_REPO}:latest
