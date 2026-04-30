FROM rclone/rclone:latest AS rclone
FROM node:24-slim
ENV REMOTE_FOLDER="huggingface:/hermes"


RUN apt-get update && apt-get install -y lsof nginx curl git python3 ripgrep ffmpeg build-essential psmisc ca-certificates gnupg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
RUN pip install --no-cache-dir git+https://github.com/NousResearch/hermes-agent.git

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


