@echo off
chcp 65001 > NUL
pushd %~dp0
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

if "%1" neq "" (
    set "SPEAKER_NAME=%1"
) else (
    set /p SPEAKER_NAME=話者の名前を英数字とハイフンで入力してください: 
)
set BASE_PATH=Bert-VITS2\Data\%SPEAKER_NAME%

if not exist "%BASE_PATH%\audios\raw" (
	mkdir "%BASE_PATH%\audios\raw"
	explorer "%BASE_PATH%\"
)

if not exist "%BASE_PATH%\config.yml" (
	copy src\config.yml "%BASE_PATH%\config.yml" > NUL
	%PS_CMD% "&{(Get-Content '%BASE_PATH%\config.yml' -Encoding UTF8) -creplace '{SPEAKER_NAME}', '%SPEAKER_NAME%' | Set-Content '%BASE_PATH%\config.yml' -Encoding UTF8 }"
)
if not exist "%BASE_PATH%\config.json" ( copy src\config.json "%BASE_PATH%\config.json" > NUL )
if not exist "%BASE_PATH%\HiyoriUi.bat" ( copy src\HiyoriUi.bat "%BASE_PATH%\HiyoriUi.bat" > NUL )
if not exist "%BASE_PATH%\Learn.bat" ( copy src\Learn.bat "%BASE_PATH%\Learn.bat" > NUL )
if not exist "%BASE_PATH%\Tensorboard.bat" (
	copy src\Tensorboard.bat "%BASE_PATH%\Tensorboard.bat" > NUL 
	%PS_CMD% "&{(Get-Content '%BASE_PATH%\Tensorboard.bat') -creplace '{SPEAKER_NAME}', '%SPEAKER_NAME%' | Set-Content '%BASE_PATH%\Tensorboard.bat' }"
)

if not exist "%BASE_PATH%\filelists" ( mkdir "%BASE_PATH%\filelists" )
set "TEXT_TEMPLATE=Data/%SPEAKER_NAME%/audios/wavs/file_name.wav^|%SPEAKER_NAME%^|JP^|こんにちは。"
if not exist %BASE_PATH%\filelists\esd.list (
	echo %TEXT_TEMPLATE% > "%BASE_PATH%\filelists\esd.list"
)

if not exist "%BASE_PATH%\models" ( mkdir "%BASE_PATH%\models" )
if not exist "%BASE_PATH%\models\DUR_0.pth" (
	copy lib\bert-vits2_base_model-2.1\DUR_0.pth "%BASE_PATH%\models\DUR_0.pth" > NUL
)
if not exist "%BASE_PATH%\models\D_0.pth" (
	copy lib\bert-vits2_base_model-2.1\D_0.pth "%BASE_PATH%\models\D_0.pth" > NUL
)
if not exist "%BASE_PATH%\models\G_0.pth" (
	copy lib\bert-vits2_base_model-2.1\G_0.pth "%BASE_PATH%\models\G_0.pth" > NUL
)

if not exist "%BASE_PATH%\models\G_WebUi.bat" ( copy src\G_WebUi.bat "%BASE_PATH%\models\G_WebUi.bat" > NUL )
if not exist "%BASE_PATH%\models\G_Compress.bat" ( copy src\G_Compress.bat "%BASE_PATH%\models\G_Compress.bat" > NUL )

popd rem %~dp0
