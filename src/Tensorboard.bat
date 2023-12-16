@echo off
chcp 65001 > NUL
pushd %~dp0..\..\

call venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

tensorboard --logdir Data/{SPEAKER_NAME}/models
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..\..\
