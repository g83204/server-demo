@echo off
echo ========================================
echo 推送完整配置到 GitHub
echo ========================================
echo.
set /p TOKEN=GitHub Token: 
echo.

git add .
git commit -m "Add Procfile and zbpack.json for Zeabur deployment"
git push https://%TOKEN%@github.com/g83204/server-demo.git main

echo.
echo ========================================
echo 完成！
echo ========================================
echo.
echo 重要：請在 Zeabur 刪除舊專案並重新部署
echo.
echo 步驟：
echo 1. Zeabur 控制台 -^> 找到 server-demo
echo 2. Settings -^> Delete Project
echo 3. 回到首頁 -^> New Project
echo 4. Deploy from GitHub -^> server-demo
echo 5. 等待部署完成
echo.
echo 這次應該會正確偵測配置檔案！
pause
