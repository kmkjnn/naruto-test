@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo   ╔══════════════════════════════════════╗
echo   ║   推送到 GitHub Pages               ║
echo   ╚══════════════════════════════════════╝
echo.
echo   请先在 github.com 创建仓库: naruto-test
echo   然后粘贴你的仓库地址 (例如:)
echo   https://github.com/你的用户名/naruto-test.git
echo.
set /p REPO="仓库地址: "

git remote remove origin 2>nul
git remote add origin %REPO%
git branch -M main
git push -u origin main

echo.
echo   推送完成！接下来在 GitHub 网页上:
echo   仓库 → Settings → Pages → Source 选 "main" → Save
echo   等1分钟后，你的公网链接:
echo   https://你的用户名.github.io/naruto-test
echo.
pause
