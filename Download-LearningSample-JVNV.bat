@echo off
chcp 65001 > NUL
pushd %~dp0

set CURL_CMD=C:\Windows\System32\curl.exe

call .\CreateProject.bat JVNV-F2

if not exist lib\JVNV-F2_Bert-VITS2-main\ (
	%CURL_CMD% -Lo lib\JVNV-F2_Bert-VITS2.zip^
		https://codeload.github.com/Zuntan03/JVNV-F2_Bert-VITS2/zip/refs/heads/main
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	%PS_CMD% Expand-Archive -Path lib\JVNV-F2_Bert-VITS2.zip -DestinationPath lib -Force
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	del lib\JVNV-F2_Bert-VITS2.zip
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)
if not exist Bert-VITS2\Data\JVNV-F2\audios\raw\F2_anger_regular_01.wav (
	xcopy /QSY lib\JVNV-F2_Bert-VITS2-main\JVNV-F2\*.* Bert-VITS2\Data\JVNV-F2\
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

popd rem %~dp0
