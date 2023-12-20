@echo off
chcp 65001 > NUL


echo 以下の配布元からモデルファイル (5.2GB) をダウンロードします（URL を Ctrl + クリックで開けます）。
echo https://huggingface.co/litagin/bert_vits2_okiba
echo よろしいですか？ [y/n]
set /p YES_OR_NO=
if /i not "%YES_OR_NO%" == "y" ( popd & exit /b 1 )

set CURL_CMD=C:\Windows\System32\curl.exe

set DEST_DIR=%~dp0Bert-VITS2\Data\litagin-bert_vits2_okiba

call :DOWNLOAD A^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/A/G_7000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/A/config.json

call :DOWNLOAD B^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/B/G_9000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/B/config.json

call :DOWNLOAD C^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/C/G_8000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/C/config.json

call :DOWNLOAD D^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/D/G_9000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/D/config.json

call :DOWNLOAD E^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/E/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/E/config.json

call :DOWNLOAD F^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/F/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/F/config.json

call :DOWNLOAD G^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/G/G_8000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/G/config.json

call :DOWNLOAD H^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/H/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/H/config.json

call :DOWNLOAD I^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/I/G_10000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/I/config.json

call :DOWNLOAD J^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/J/G_4000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/J/config.json

call :DOWNLOAD K^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/K/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/K/config.json

call :DOWNLOAD L^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/L/G_8000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/L/config.json

call :DOWNLOAD M^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/M/G_4000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/M/config.json

call :DOWNLOAD N^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/N/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/N/config.json

call :DOWNLOAD O^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/O/G_8000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/O/config.json

call :DOWNLOAD P^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/P/G_2000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/P/config.json

call :DOWNLOAD Q^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/Q/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/Q/config.json

call :DOWNLOAD R^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/R/G_6000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/R/config.json

call :DOWNLOAD S^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/S/G_13000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/S/config.json

call :DOWNLOAD T^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/T/G_10000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/T/config.json

call :DOWNLOAD U^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/U/G_12000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/U/config.json

call :DOWNLOAD V^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/V/G_8000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/V/config.json

call :DOWNLOAD W^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/W/G_8000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/W/config.json

call :DOWNLOAD X^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/X/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/X/config.json

call :DOWNLOAD Y^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/Y/G_8000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/Y/config.json

call :DOWNLOAD Z^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/Z/G_12000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/Z/config.json

call :DOWNLOAD man-A^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/ver2.1/man-A/G_5000_release.pth^
	https://huggingface.co/litagin/bert_vits2_okiba/resolve/main/man-A/config.json

exit /b 0

:DOWNLOAD

set NAME=%1
set PTH_URL=%2
set CFG_URL=%3

if not exist %DEST_DIR%-%NAME%\ (
	mkdir %DEST_DIR%-%NAME%
	pushd %DEST_DIR%-%NAME%

	%CURL_CMD% -LO %PTH_URL%
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%CURL_CMD% -LO %CFG_URL%
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	timeout /t 1 /nobreak
	popd rem %DEST_DIR%-%NAME%
)

exit /b 0
