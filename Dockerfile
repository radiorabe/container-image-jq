FROM ghcr.io/radiorabe/ubi9-minimal:0.12.0@sha256:ddf3ac33c48b5005cc325732cb547279a926f29b3db9adcbd844f1cf94dcf831 AS app

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
