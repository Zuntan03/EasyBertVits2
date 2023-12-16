@echo off
chcp 65001 > NUL
pushd %~dp0

set CURL_CMD=C:\Windows\System32\curl.exe

if not exist Bert-VITS2\Data\Demo-JVNV\ ( mkdir Bert-VITS2\Data\Demo-JVNV )
if not exist Bert-VITS2\Data\Demo-JVNV\config.json (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\config.json^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/config.json
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-2000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-2000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_2000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-4000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-4000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_4000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-6000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-6000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_6000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-8000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-8000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_8000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-10000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-10000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_10000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-12000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-12000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_12000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-16000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-16000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_16000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-20000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-20000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_20000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-26000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-26000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_26000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

popd rem %~dp0
