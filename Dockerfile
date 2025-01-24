FROM alpine:latest
ENV TZ=Europe/Vienna

RUN apk add --update --no-cache tzdata

COPY --from=docker:latest /usr/local/bin/docker /usr/local/bin/docker
COPY --from=getsentry/sentry-cli:latest /bin/sentry-cli /usr/local/bin/sentry-cli

COPY crontab /tmp/crontab

COPY run-crond.sh /run-crond.sh
RUN chmod +x /run-crond.sh

CMD ["/run-crond.sh"]
