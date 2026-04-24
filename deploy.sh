#!/bin/bash

# 自动加载当前目录下的 .env 隐私文件（核心）
if [ -f .env ]; then
  source .env
fi

# 从环境变量读取
SERVER_IP=$HEXO_SERVER_IP
SERVER_USER="hexodeploy"
REMOTE_DIR="/www/wwwroot/hexo"

# 构建
hexo clean
hexo generate

# 上传
scp -r ./public/* ${SERVER_USER}@${SERVER_IP}:${REMOTE_DIR}