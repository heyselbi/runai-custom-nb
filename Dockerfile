FROM quay.io/thoth-station/s2i-minimal-notebook:v0.5.1

# Install kubectl
COPY kubernetes.repo /etc/yum.repos.d/
USER root
RUN yum -y install kubectl

# Install helm
COPY helm-v3.11.1-linux-amd64/linux-amd64/helm /usr/local/bin

# Install runai-cli
RUN mkdir -p /tmp/runai
COPY runai-cli-v2.3.4-linux-amd64 /tmp/runai
RUN bash /tmp/runai/install-runai.sh

USER 1001
