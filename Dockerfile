FROM alpine:latest as gh
ARG VERSION=2.11.3

RUN apk --no-cache add wget tar
RUN wget https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz
RUN tar -zxvf gh_${VERSION}_linux_amd64.tar.gz
RUN chmod a+x gh_${VERSION}_linux_amd64/bin/gh

FROM alpine:latest
ARG VERSION=2.11.3
COPY --from=gh gh_${VERSION}_linux_amd64/bin/gh /usr/bin/gh
COPY .env .env

RUN gh auth login --with-token < .env