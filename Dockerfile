ARG REPOSITORY="docker.io"
FROM ${REPOSITORY}/nginxinc/nginx-unprivileged:1.27.4-alpine
ARG PHANPY_VERSION="2025.03.22.85d964f"
WORKDIR /usr/share/nginx/html
# install wget and clean clean content of workdir
USER root
RUN apk add wget
RUN rm -f ./*
RUN wget -O /tmp/phanpy.tar.gz https://github.com/cheeaun/phanpy/releases/download/${PHANPY_VERSION}/phanpy-dist.tar.gz
RUN tar -xvzf /tmp/phanpy.tar.gz -C ./
#switch back to unpriv user
USER nginx