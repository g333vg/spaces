FROM rclone/rclone:latest AS rclone
FROM debian:13.4
ENV REMOTE_FOLDER="huggingface:/hermes"


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential python3 ripgrep ffmpeg gcc python3-dev libffi-dev procps git openssh-client docker-cli tini && \
    rm -rf /var/lib/apt/lists/*


# Install curl to fetch the setup script
RUN apt-get update && apt-get install -y lsof nginx curl ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_23.x | bash - && \
    apt-get install -y nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

    
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


