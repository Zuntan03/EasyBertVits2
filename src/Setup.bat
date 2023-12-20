@echo off
chcp 65001 > NUL
pushd %~dp0..
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

@REM 2023-12-19
set BERT_VITS2_REV=7ebc1aa28a055608f7e31da93928cf295fdffeba

set CURL_CMD=C:\Windows\System32\curl.exe
if not exist %CURL_CMD% (
	echo [ERROR] %CURL_CMD% が見つかりません。
	pause & popd & exit /b 1
)

echo 以下の配布元から関連ファイルをダウンロードして使用します（URL を Ctrl + クリックで開けます）。
echo https://www.python.org/
echo https://github.com/pypa/get-pip
echo https://github.com/fishaudio/Bert-VITS2/
echo https://github.com/jiangyuxiaoxiao/Bert-VITS2-UI
echo https://huggingface.co/OedoSoldier/Bert-VITS2-2.3
echo https://sites.google.com/site/shinnosuketakamichi/research-topics/jvnv_corpus
echo https://github.com/Zuntan03/JVNV-F2_Bert-VITS2
echo https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1
echo よろしいですか？ [y/n]
set /p YES_OR_NO=
if /i not "%YES_OR_NO%" == "y" ( popd & exit /b 1 )

if not exist lib\ ( mkdir lib )

if not exist lib\Bert-VITS2-%BERT_VITS2_REV%\ (
	%CURL_CMD% -Lo Bert-VITS2.zip https://github.com/fishaudio/Bert-VITS2/archive/%BERT_VITS2_REV%.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%PS_CMD% Expand-Archive -Path Bert-VITS2.zip -DestinationPath lib -Force
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	del Bert-VITS2.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	xcopy /QSY lib\Bert-VITS2-%BERT_VITS2_REV%\*.* Bert-VITS2\
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

call %~dp0Setup-Python.bat ..\lib\python ..\Bert-VITS2\venv
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

pip install torch==2.1.1+cu121 torchvision==0.16.1+cu121 torchaudio==2.1.1+cu121^
	--index-url https://download.pytorch.org/whl/cu121
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM pip install psutil==5.9.7
@REM if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

pip install -r Bert-VITS2\requirements.txt
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM pip install tensorflow
@REM if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM 2023-12-17
if not exist lib\HiyoriUI-0.7.0\ (
	%CURL_CMD% -Lo lib\HiyoriUI.zip^
		https://github.com/jiangyuxiaoxiao/Bert-VITS2-UI/releases/download/0.7.0/HiyoriUI-0.7.0.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%PS_CMD% Expand-Archive -Path lib\HiyoriUI.zip -DestinationPath lib -Force
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	del lib\HiyoriUI.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	xcopy /QSY lib\HiyoriUI-0.7.0\Web\*.* Bert-VITS2\Web\
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist lib\Bert-VITS2-2.3\ ( mkdir lib\Bert-VITS2-2.3 )
if not exist lib\Bert-VITS2-2.3\DUR_0.pth (
	%CURL_CMD% -Lo lib\Bert-VITS2-2.3\DUR_0.pth^
		https://huggingface.co/OedoSoldier/Bert-VITS2-2.3/resolve/main/DUR_0.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist lib\Bert-VITS2-2.3\D_0.pth (
	%CURL_CMD% -Lo lib\Bert-VITS2-2.3\D_0.pth^
		https://huggingface.co/OedoSoldier/Bert-VITS2-2.3/resolve/main/D_0.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist lib\Bert-VITS2-2.3\G_0.pth (
	%CURL_CMD% -Lo lib\Bert-VITS2-2.3\G_0.pth^
		https://huggingface.co/OedoSoldier/Bert-VITS2-2.3/resolve/main/G_0.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist lib\Bert-VITS2-2.3\WD_0.pth (
	%CURL_CMD% -Lo lib\Bert-VITS2-2.3\WD_0.pth^
		https://huggingface.co/OedoSoldier/Bert-VITS2-2.3/resolve/main/WD_0.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist Bert-VITS2\slm\wavlm-base-plus\pytorch_model.bin (
	%CURL_CMD% -Lo Bert-VITS2\slm\wavlm-base-plus\pytorch_model.bin^
		https://huggingface.co/microsoft/wavlm-base-plus/resolve/main/pytorch_model.bin
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist Bert-VITS2\config.yml (
	copy Bert-VITS2\default_config.yml Bert-VITS2\config.yml
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist Bert-VITS2\Data\Demo-JVNV_v2.1\ ( mkdir Bert-VITS2\Data\Demo-JVNV_v2.1 )
if not exist Bert-VITS2\Data\Demo-JVNV_v2.1\config.json (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV_v2.1\config.json^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/config.json
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV_v2.1\G_JVNV-F2-10000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV_v2.1\G_JVNV-F2-10000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_10000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

popd rem %~dp0..
