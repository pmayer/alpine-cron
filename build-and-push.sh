DOCKER_REPO=paradoxon/alpine-cron
DOCKER_TAG=$(curl --silent "https://download.docker.com/linux/static/stable/x86_64/" | sed -n 's/.*href="\([^"]*\).*/\1/p' | tail -n1 | sed -n 's/docker-\(.*\).tgz/\1/p')
docker build . -t docker-cron
docker tag $(docker images -q docker-cron) ${DOCKER_REPO}:${DOCKER_TAG}
docker tag $(docker images -q docker-cron) ${DOCKER_REPO}:latest

docker login
docker push ${DOCKER_REPO}
