# 加载当前目录下的 .env 隐私文件
Get-Content .env | ForEach-Object {
    if ($_ -match "^\s*([^#].+?)\s*=\s*(.*)\s*$") {
        [Environment]::SetEnvironmentVariable($matches[1], $matches[2])
    }
}

# 读取环境变量
$SERVER_IP = $env:HEXO_SERVER_IP
$SERVER_USER = "hexodeploy"
$REMOTE_DIR = "/www/wwwroot/hexo"

# 构建 Hexo
hexo clean
hexo generate

# 上传到服务器
scp -r ./public/* ${SERVER_USER}@${SERVER_IP}:${REMOTE_DIR}