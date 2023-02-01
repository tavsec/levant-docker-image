FROM alpine/curl AS downloader

WORKDIR /tmp
ARG LEVANT_VERSION=0.3.2
RUN curl -L https://releases.hashicorp.com/levant/${LEVANT_VERSION}/levant_${LEVANT_VERSION}_linux_amd64.zip -o levant.zip && unzip -q levant.zip

FROM alpine 
COPY --from=downloader /tmp/levant /usr/local/bin/levant
RUN chmod +x /usr/local/bin/levant