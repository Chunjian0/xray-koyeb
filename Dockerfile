FROM ghcr.io/xtls/xray-core:latest

COPY config.json /etc/xray/config.json

ENTRYPOINT ["xray"]
CMD ["-config", "/etc/xray/config.json"]
