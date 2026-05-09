@echo off
chcp 65001 >nul
cd /d "%~dp0"

:: 获取本机局域网IP
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr "IPv4" ^| findstr /v "172.29\|127.0"') do set IP=%%a
set IP=%IP: =%

echo.
echo   ╔══════════════════════════════════════════╗
echo   ║       火影性格测试 - 手机可访问          ║
echo   ╚══════════════════════════════════════════╝
echo.
echo   PC端打开:    http://localhost:8888
echo   手机端打开:  http://%IP%:8888
echo.
echo   (手机和电脑需连同一个WiFi)
echo.

:: 检查端口是否已被占用
netstat -ano 2>nul | findstr ":8888.*LISTENING" >nul
if %errorlevel%==0 (
    echo   服务器已在运行，直接打开浏览器...
    start http://localhost:8888
    goto :end
)

:: 启动服务器 (后台静默)
start /min "" cmd /c "python -m http.server 8888 >nul 2>&1"
timeout /t 1 /nobreak >nul
start http://localhost:8888
echo   服务器已启动，手机浏览器输入上方地址即可
:end
echo.
pause
