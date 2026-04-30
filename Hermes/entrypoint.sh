#!/bin/bash

node -v


echo -e "======================写入rclone配置========================\n"
echo "$RCLONE_CONF" > ~/.config/rclone/rclone.conf


echo -e "======================启动nginx========================\n"
nginx -s reload 2>/dev/null || nginx -c /etc/nginx/nginx.conf
echo -e "nginx启动成功...\n"


echo -e "======================启动pm2服务========================\n"
pm2 start "hermes-web-ui start" --name "hermes-web-ui"
pm2 startup
pm2 save


tail -f /dev/null
exec "$@"