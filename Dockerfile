FROM ghcr.io/radiorabe/ubi9-minimal:0.8.0 AS app

RUN    microdnf install -y \
         shadow-utils \
         jq \
    && useradd -u 1001 -r -g 0 -s /sbin/nologin \
         -c "Default Application User" default \
    && microdnf remove -y \
         libsemanage \
         shadow-utils \
    && microdnf clean all

USER 1001
