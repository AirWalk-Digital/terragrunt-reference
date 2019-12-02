FROM lambci/lambda:build-python3.6
ARG TFVER=0.12.4
ARG TGVER=0.19.8
RUN yum install -y wget unzip
RUN wget -q -O /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v$TGVER/terragrunt_linux_amd64 \
    && chmod +x /bin/terragrunt
RUN wget -q -O tf.zip https://releases.hashicorp.com/terraform/${TFVER}/terraform_${TFVER}_linux_amd64.zip \
    && unzip tf.zip -d /usr/bin/
RUN mkdir /modules && mkdir /tf
WORKDIR /tf
ENTRYPOINT []

