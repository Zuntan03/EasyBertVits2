@echo off
chcp 65001 > NUL
pushd %~dp0..\..\

call venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

copy /Y %~dp0config.yml config.yml > NUL
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

python server_fastapi.py
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..\..\
