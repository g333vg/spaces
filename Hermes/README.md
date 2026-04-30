---
title: Hermes
emoji: 🤖
colorFrom: green
colorTo: blue
sdk: docker
pinned: false
app_port: 5700
short_description: Hermes
---

Check out the configuration reference at https://huggingface.co/docs/hub/spaces-config-reference   
Secrets：   
RCLONE_CONF:rclone配置内容    
AUTH_TOKEN:登陆验证Token   

# 关于备份可以让AI建立定时任务执行以下代码
```
sh /app/sync.sh backup
```
## 备份文件要注意 sync.sh里的文件夹要以/结尾

