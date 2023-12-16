@echo off
chcp 65001 > NUL
pushd %~dp0Bert-VITS2

call venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

python server_fastapi.py
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0Bert-VITS2
