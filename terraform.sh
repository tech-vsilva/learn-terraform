#!/bin/bash

set -x

# Install and configure Terraform with a specific version

TEMP_FOLDER=$(mktemp -d)

TF_ZIP="https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_linux_amd64.zip"
TF_BINARIES_FOLDER="/opt/hashicorp/terraform"
TF_VERSION=$(echo ${TF_ZIP} | sed 's,/, ,g' | awk '{print $4}')
TF_BINARY="${TF_BINARIES_FOLDER}/terraform${TF_VERSION}"

# https://goo.gl/B37MYs
export DEBIAN_FRONTEND=noninteractive

sudo apt-get -qq install -y unzip \
&& wget --quiet "${TF_ZIP}" --directory-prefix "${TEMP_FOLDER}" \
&& mkdir -p "${TF_BINARIES_FOLDER}" \
&& find "${TEMP_FOLDER}" -type f -name *.zip -exec unzip {} -d "${TEMP_FOLDER}" \; \
&& mv "${TEMP_FOLDER}/terraform" "${TF_BINARY}" \
&& sudo ln -s "${TF_BINARY}" /usr/local/bin/terraform \
&& cd /synced/Base/ && /usr/local/bin/terraform init \
&& sudo cp -r /synced/.aws/ /home/ubuntu/ \
&& chown ubuntu:ubuntu -R /home/ubuntu/.aws/ && cd /home/ubuntu/.aws / && chmod 600 ./*
