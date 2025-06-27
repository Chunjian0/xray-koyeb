FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl unzip

RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip && \
    mv xray /app/xray && \
    chmod +x /app/xray && \
    rm -rf xray.zip geo* *.dat *.json LICENSE README.md

COPY config.json /app/config.json
COPY fullchain.pem /app/fullchain.pem
COPY privkey.pem /app/privkey.pem

EXPOSE 443

CMD ["/app/xray", "-config", "/app/config.json"]
