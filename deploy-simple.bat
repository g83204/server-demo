@echo off
echo ========================================
echo 部署 Server Demo 到 GitHub
echo ========================================
echo.
echo 請先確認已在 GitHub 創建 server-demo repository
echo https://github.com/new
echo.
echo 請輸入您的 GitHub Token
echo (貼上後按 Enter，Token 不會顯示在螢幕上)
echo.
set /p TOKEN=Token: 
echo.

echo 初始化 Git repository...
git init
git config user.email "g83204@github.com"
git config user.name "g83204"
git add .
git commit -m "Initial commit: Server mode demo"

echo.
echo 正在推送到 GitHub...
git branch -M main
git remote add origin https://github.com/g83204/server-demo.git
git push https://%TOKEN%@github.com/g83204/server-demo.git main --force

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
