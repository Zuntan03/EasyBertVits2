@echo off
chcp 65001 > NUL
pushd %~dp0..\..\..\

if "%~1" == "" (
	echo [ERROR] G_*000.pth のモデルファイルをドラッグ＆ドロップしてください。
	pause & popd & exit /b 1
)

call venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

set OUTPUT=%~dpn1_c%~x1
echo python compress_model.py -c %~dp0..\config.json -i %~f1 -o %OUTPUT%
python compress_model.py -c %~dp0..\config.json -i %~f1 -o %OUTPUT%
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..\..\..\

