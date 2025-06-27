# Use minimal base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Install dependencies
RUN apk add --no-cache curl unzip

# Download and extract latest Xray-core
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip && \
    mv xray /app/xray && \
    chmod +x /app/xray && \
    rm -rf xray.zip geo* *.dat *.json LICENSE README.md

# Copy your local files into the container
COPY config.json /app/config.json
COPY fullchain.pem /app/fullchain.pem
COPY privkey.pem /app/privkey.pem

# Expose port 443 for TLS
EXPOSE 443

# Start Xray with your config
CMD ["/app/xray", "-config", "/app/config.json"]
