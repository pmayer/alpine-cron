FROM alpine:3.10
ENV TZ Europe/Vienna

RUN apk add --no-cache tzdata

# RUN apk add --no-cache docker
RUN apk add --no-cache curl \
    && export DOCKER_LATEST=$(curl --silent "https://download.docker.com/linux/static/stable/x86_64/" | sed -n 's/.*href="\([^"]*\).*/\1/p' | tail -n1) \
    && curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/${DOCKER_LATEST} \
    && tar xzvf ${DOCKER_LATEST} --strip 1 -C /usr/local/bin docker/docker \
    && rm ${DOCKER_LATEST}

COPY crontab /tmp/crontab

COPY run-crond.sh /run-crond.sh
RUN chmod +x /run-crond.sh

CMD ["/run-crond.sh"]
