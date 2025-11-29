@echo off
echo ========================================
echo 部署 Server Demo 到 GitHub
echo ========================================
echo.
echo 請先在 GitHub 創建 server-demo repository
echo https://github.com/new
echo.
set /p REPO_URL="請貼上 repository URL (例如: https://github.com/g83204/server-demo.git): "
echo.
set /p TOKEN="請貼上您的 GitHub Token: "
echo.

echo 初始化 Git repository...
git init
git config user.email "g83204@github.com"
git config user.name "g83204"
git add .
git commit -m "Initial commit: Server mode demo"

echo 正在推送到 GitHub...
git branch -M main
git remote add origin %REPO_URL%
git push https://%TOKEN%@%REPO_URL:~8% main --force

echo.
echo ========================================
echo 完成！
echo ========================================
echo.
echo 現在前往 Zeabur 部署：
echo 1. https://zeabur.com
echo 2. New Project
echo 3. Deploy from GitHub
echo 4. 選擇 server-demo
echo 5. 等待部署完成
echo.
pause
