@echo off
chcp 65001 > NUL
pushd %~dp0..\..\

call venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

copy /Y %~dp0config.yml config.yml > NUL
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

if not exist %~dp0audios\wavs (
	python resample.py
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	python preprocess_text.py
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	python bert_gen.py
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

	python emo_gen.py
	if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
)

python train_ms.py
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..\..\
