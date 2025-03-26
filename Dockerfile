ARG PHANPY_VERSION="2025.03.22.85d964f"
ARG REPOSITORY="docker.io"
FROM ${REPOSITORY}/nginxinc/nginx-unprivileged:1.27.4-alpine
WORKDIR /usr/share/nginx/html
#clean content of workdir
RUN rm -f ./*
#download latest
RUN apk add wget \
    && wget -O /tmp/phanpy.tar.gz https://github.com/cheeaun/phanpy/releases/download/${PHANPY_VERSION}/phanpy-dist.tar.gz \
    && tar -xvzf /tmp/phanpy.tar.gz -C ./
