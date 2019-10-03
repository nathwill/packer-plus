FROM alpine:3.10
MAINTAINER "Nathan Williams <nath.e.will@gmail.com>"

ARG PACKER_VERSION=1.4.4
ENV PACKER_VERSION=${PACKER_VERSION}

RUN apk add --update git bash openssl curl unzip build-base docker ruby ruby-dev ruby-io-console
RUN gem install --no-document inspec-bin
RUN curl -o /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip -d /usr/local/bin /tmp/packer.zip && \
    rm -f /tmp/packer.zip

ENTRYPOINT ["/usr/local/bin/packer"]
