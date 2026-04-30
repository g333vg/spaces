FROM rclone/rclone:latest AS rclone
FROM nousresearch/hermes-agent:latest
ENV REMOTE_FOLDER="huggingface:/hermes"


# Install curl to fetch the setup script
RUN apt-get update && apt-get install -y lsof nginx curl ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_23.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY --from=rclone /usr/local/bin/rclone /usr/bin/rclone
COPY entrypoint.sh /entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY apps.conf /etc/nginx/conf.d/apps.conf

RUN chmod +x /entrypoint.sh

RUN npm install -g pnpm pm2 hermes-web-ui


WORKDIR /app

RUN rclone config -h


EXPOSE 5700

ENTRYPOINT ["/entrypoint.sh"]


