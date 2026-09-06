@echo off
chcp 65001 >nul
echo ========================================
echo   WMS 后端启动脚本
echo ========================================
echo.

cd /d "%~dp0backend"

REM 检查 Python 是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 Python，请先安装 Python 3.11+
    echo 下载地址：https://www.python.org/downloads/
    echo 安装时请勾选 "Add Python to PATH"
    pause
    exit /b 1
)

REM 安装依赖（首次）
echo [1/3] 检查依赖...
pip install -r requirements.txt -q 2>nul

REM 初始化数据库（首次）
echo [2/3] 初始化数据库...
python -m scripts.seed --demo 2>nul

REM 启动服务
echo [3/3] 启动后端服务 (http://localhost:8000)...
echo.
echo ========================================
echo   服务已启动！
echo   浏览器打开：http://localhost:8000
echo   演示账号：admin / Admin@123456
echo   关闭窗口即停止服务
echo ========================================
echo.

python -m uvicorn main:app --host 0.0.0.0 --port 8000
pause
