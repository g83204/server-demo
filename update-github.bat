@echo off
echo ========================================
echo 更新 server-demo 到 GitHub
echo ========================================
echo.
echo 請輸入您的 GitHub Token
set /p TOKEN=Token: 
echo.

echo 提交更新...
git add .
git commit -m "Fix: Add start script for production deployment"
git push https://%TOKEN%@github.com/g83204/server-demo.git main

echo.
echo ========================================
echo 完成！
echo ========================================
echo.
echo Zeabur 會自動重新部署
echo 等待 2-3 分鐘後檢查網站
echo.
pause
