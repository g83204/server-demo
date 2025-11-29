@echo off
echo ========================================
echo 推送 Zeabur 配置修復
echo ========================================
echo.
set /p TOKEN=GitHub Token: 
echo.

git add .
git commit -m "Add Zeabur configuration file"
git push https://%TOKEN%@github.com/g83204/server-demo.git main

echo.
echo ========================================
echo 完成！
echo ========================================
echo.
echo 建議：在 Zeabur 刪除舊專案並重新部署
echo 1. Zeabur → Settings → Delete Project
echo 2. New Project → Deploy from GitHub
echo 3. 選擇 server-demo
echo.
pause
