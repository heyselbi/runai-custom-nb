FROM quay.io/thoth-station/s2i-minimal-notebook:v0.2.1

RUN echo $(oc version)
COPY helm-v3.7.1-linux-amd64/linux-amd64/helm /usr/local/bin
RUN echo $(helm version)

# Install runai-cli
USER root
RUN mkdir -p /home/runai
COPY runai-cli-v2.2.73-linux-amd64 /home/runai
RUN bash /home/runai/install-runai.sh
RUN echo $(runai --help)
