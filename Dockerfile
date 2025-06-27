FROM teddysun/xray-core:latest

COPY config.json /etc/xray/config.json

CMD ["xray", "-config", "/etc/xray/config.json"]