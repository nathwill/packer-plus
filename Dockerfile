FROM alpine:3.10
MAINTAINER "Nathan Williams <nath.e.will@gmail.com>"

ARG VERSION=1.4.4

RUN apk add --update git bash openssl curl unzip build-base docker ruby ruby-dev ruby-io-console
RUN gem install --no-document inspec-bin
RUN curl -o /tmp/packer.zip https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip && \
    unzip -d /usr/local/bin /tmp/packer.zip && \
    rm -f /tmp/packer.zip

ENTRYPOINT ["/usr/local/bin/packer"]
