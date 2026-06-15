FROM ghcr.io/radiorabe/ubi9-minimal:0.11.4@sha256:9d9f4695ed31b1856b258a1081abd15a99e1e62a7935b421a3c2e46bbdf62652 AS app

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
