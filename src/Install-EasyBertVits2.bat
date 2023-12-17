@echo off
chcp 65001 > NUL
pushd %~dp0
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

set CURL_CMD=C:\Windows\System32\curl.exe
if not exist %CURL_CMD% (
	echo [ERROR] %CURL_CMD% が見つかりません。
	pause & popd & exit /b 1
)

set EASY_BERT_VITS2_DIR=EasyBertVits2-2.1

if not exist lib\ ( mkdir lib )

%CURL_CMD% -Lo lib\EasyBertVits2.zip^
	https://github.com/Zuntan03/EasyBertVits2/archive/refs/heads/v2.1.zip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%PS_CMD% Expand-Archive -Path lib\EasyBertVits2.zip -DestinationPath lib -Force
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

del lib\EasyBertVits2.zip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

xcopy /QSY .\lib\%EASY_BERT_VITS2_DIR%\ .

call src\Setup.bat

start HiyoriUi.bat

popd rem %~dp0..
