#!/bin/bash

set -x

REMOTE_ZIP="https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_linux_amd64.zip"
TEMP_FOLDER=$(mktemp -d)
TERRAFORM_INSTALL_FOLDER="/opt/terraform"

TERRAFORM_VERSION=$(echo ${REMOTE_ZIP} | sed 's,/, ,g' | awk '{print $4}')

sudo apt-get -qq install -y unzip \
&& wget --quiet "${REMOTE_ZIP}" --directory-prefix "${TEMP_FOLDER}" \
&& mkdir -p "${TERRAFORM_INSTALL_FOLDER}" \
&& find "${TEMP_FOLDER}" -type f -name *.zip -exec unzip {} -d "${TERRAFORM_INSTALL_FOLDER}" \;
