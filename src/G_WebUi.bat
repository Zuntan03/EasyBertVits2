@echo off
chcp 65001 > NUL
pushd %~dp0..\..\..\

if "%~1" == "" (
	echo [ERROR] G_*000.pth のモデルファイルをドラッグ＆ドロップしてください。
	pause & popd & exit /b 1
)

call venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass
%PS_CMD% "&{(Get-Content '%~dp0..\config.yml' -Encoding UTF8) -replace 'models/G_.*\.pth', 'models/%~n1.pth' | Set-Content '%~dp0..\config.yml' -Encoding UTF8 }"

copy /Y %~dp0..\config.yml config.yml > NUL
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

python webui.py
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..\..\..\
