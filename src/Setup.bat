@echo off
chcp 65001 > NUL
pushd %~dp0..
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

@REM 2023-12-10
set BERT_VITS2_REV=649b4fb9c9f40fb7c4e307248de2f9f34a9537b3

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
echo https://huggingface.co/Garydesu/bert-vits2_base_model-2.1
echo https://sites.google.com/site/shinnosuketakamichi/research-topics/jvnv_corpus
echo https://github.com/Zuntan03/JVNV-F2_Bert-VITS2
echo https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1
echo よろしいですか？ [y/n]
set /p YES_OR_NO=
if /i not "%YES_OR_NO%" == "y" ( popd & exit /b 1 )

if not exist lib\ ( mkdir lib )

if not exist lib\python\ (
	%CURL_CMD% -o python.zip https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%PS_CMD% Expand-Archive -Path python.zip -DestinationPath lib\python
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	del python.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%PS_CMD% "&{(Get-Content 'lib/python/python310._pth') -creplace '#import site', 'import site' | Set-Content 'lib/python/python310._pth' }"
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%CURL_CMD% -o lib\python\get-pip.py https://bootstrap.pypa.io/get-pip.py
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	lib\python\python.exe lib\python\get-pip.py
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	lib\python\python.exe -m pip install virtualenv
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

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

if not exist Bert-VITS2\venv\ (
	@REM virtualenv は外付けドライブで仮想環境の構築に失敗する
	lib\python\python.exe -m virtualenv Bert-VITS2\venv
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

call Bert-VITS2\venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

pip install torch==2.1.1+cu121 torchvision==0.16.1+cu121 torchaudio==2.1.1+cu121^
	--index-url https://download.pytorch.org/whl/cu121
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

pip install psutil==5.9.3
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

pip install -r Bert-VITS2\requirements.txt
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM pip install tensorflow
@REM if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM 2023-12-04
if not exist lib\HiyoriUI-0.6.0\ (
	%CURL_CMD% -Lo lib\HiyoriUI.zip^
		https://github.com/jiangyuxiaoxiao/Bert-VITS2-UI/releases/download/0.6.0/HiyoriUI-0.6.0.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%PS_CMD% Expand-Archive -Path lib\HiyoriUI.zip -DestinationPath lib -Force
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	del lib\HiyoriUI.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	xcopy /QSY lib\HiyoriUI-0.6.0\Web\*.* Bert-VITS2\Web\
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist lib\bert-vits2_base_model-2.1\ ( mkdir lib\bert-vits2_base_model-2.1 )
if not exist lib\bert-vits2_base_model-2.1\DUR_0.pth (
	%CURL_CMD% -Lo lib\bert-vits2_base_model-2.1\DUR_0.pth^
		https://huggingface.co/Garydesu/bert-vits2_base_model-2.1/resolve/main/DUR_0.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist lib\bert-vits2_base_model-2.1\D_0.pth (
	%CURL_CMD% -Lo lib\bert-vits2_base_model-2.1\D_0.pth^
		https://huggingface.co/Garydesu/bert-vits2_base_model-2.1/resolve/main/D_0.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist lib\bert-vits2_base_model-2.1\G_0.pth (
	%CURL_CMD% -Lo lib\bert-vits2_base_model-2.1\G_0.pth^
		https://huggingface.co/Garydesu/bert-vits2_base_model-2.1/resolve/main/G_0.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist Bert-VITS2\emotional\wav2vec2-large-robust-12-ft-emotion-msp-dim\pytorch_model.bin (
	%CURL_CMD% -Lo Bert-VITS2\emotional\wav2vec2-large-robust-12-ft-emotion-msp-dim\pytorch_model.bin^
		https://huggingface.co/audeering/wav2vec2-large-robust-12-ft-emotion-msp-dim/resolve/main/pytorch_model.bin
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist Bert-VITS2\config.yml (
	copy Bert-VITS2\default_config.yml Bert-VITS2\config.yml
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

if not exist Bert-VITS2\Data\Demo-JVNV\ ( mkdir Bert-VITS2\Data\Demo-JVNV )
if not exist Bert-VITS2\Data\Demo-JVNV\config.json (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\config.json^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/config.json
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-10000.pth (
	%CURL_CMD% -Lo Bert-VITS2\Data\Demo-JVNV\G_JVNV-F2-10000.pth^
		https://huggingface.co/Zuntan/JVNV-F2_Bert-VITS2_v2.1/resolve/main/G_10000.pth
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

start HiyoriUi.bat

popd rem %~dp0..
