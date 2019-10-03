FROM centos:8
MAINTAINER "Nathan Williams <nath.e.will@gmail.com>"

ARG PACKER_VERSION=1.4.4
ENV PACKER_VERSION=${PACKER_VERSION}

RUN dnf -y install https://packages.chef.io/files/stable/inspec/4.17.17/el/8/inspec-4.17.17-1.el7.x86_64.rpm && \
    dnf -y install make curl unzip openssl dnf-plugins-core && \
    dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf -y install --nobest docker-ce docker-ce-cli && \
    dnf -y clean all

RUN curl -o /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip -d /usr/local/bin /tmp/packer.zip && \
    rm -f /tmp/packer.zip

ENTRYPOINT ["/usr/local/bin/packer"]
