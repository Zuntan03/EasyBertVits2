@echo off
chcp 65001 > NUL

echo 以下の配布元からモデルファイル (5.2GB) をダウンロードします（URL を Ctrl + クリックで開けます）。
echo https://huggingface.co/litagin/bert-vits2-nsfw
echo よろしいですか？ [y/n]
set /p YES_OR_NO=
if /i not "%YES_OR_NO%" == "y" ( popd & exit /b 1 )

set CURL_CMD=C:\Windows\System32\curl.exe

set DEST_DIR=%~dp0Bert-VITS2\Data\litagin-bert-vits2-nsfw-ver2.1-aegi1

if not exist %DEST_DIR% ( mkdir %DEST_DIR% )
pushd %DEST_DIR%

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/README.md
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/config.json
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_5000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_10000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_15000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_20000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_25000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_30000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_35000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%CURL_CMD% -LO https://huggingface.co/litagin/bert-vits2-nsfw/resolve/main/aegi1/G_36000_c.pth
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %DEST_DIR%
