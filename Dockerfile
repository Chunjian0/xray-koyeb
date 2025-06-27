FROM alpine:latest

WORKDIR /app

RUN apk update && \
    apk add --no-cache curl unzip tzdata && \
    cp /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime && \
    echo "Asia/Kuala_Lumpur" > /etc/timezone

# Download Xray-core
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip && \
    chmod +x xray && \
    rm -f xray.zip

# Copy your config.json (auto-loaded by Koyeb if added as config file)
COPY config.json /app/config.json

CMD [ "./xray", "-c", "/app/config.json" ]
