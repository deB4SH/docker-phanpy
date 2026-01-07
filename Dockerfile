ARG REPOSITORY="docker.io"
FROM ${REPOSITORY}/nginxinc/nginx-unprivileged:1.27.4-alpine
ARG PHANPY_VERSION="2026.01.07.2e1d0c4"
WORKDIR /usr/share/nginx/html
# install components, and clean up
USER root
RUN apk add wget \
    && rm -f ./* \
    && wget -O /tmp/phanpy.tar.gz https://github.com/cheeaun/phanpy/releases/download/${PHANPY_VERSION}/phanpy-dist.tar.gz \
    && tar -xvzf /tmp/phanpy.tar.gz -C ./ \
    && rm /tmp/phanpy.tar.gz \
    && apk del wget
#switch back to unpriv user
USER nginx