@echo off
cd /d %~dp0

@REM 管理者権限の取得
@REM 参考：https://correct-log.com/bat_auto_admin/
whoami /priv | find "SeDebugPrivilege" > nul
if %ERRORLEVEL% neq 0 (
    powershell -Command "Start-Process \"%~0\" -Verb RunAs"
    exit
)

@REM Pythonのインストール
winget install -e --id Python.Python.3.7

@REM Poke-Controller MODIFIEDのダウンロード
powershell -Command "Invoke-WebRequest -Uri \"https://github.com/Moi-poke/Poke-Controller-Modified/archive/refs/heads/master.zip\" -OutFile \"%~dp0_.zip\""
powershell -Command "Expand-Archive -Path \"%~dp0_.zip\" -DestinationPath \"%~dp0" -Force"
move %~dp0Poke-Controller-Modified-master %~dp0Poke-Controller-Modified
del /q "%~dp0_.zip"

@REM Poke-Controller MODIFIEDの仮想環境作成
cd /d %~dp0Poke-Controller-Modified
py -3.7 -m venv .venv
call .\.venv\Scripts\activate.bat
py -3.7 -m pip install -r requirements.txt

@REM 起動用バッチファイル作成
(
    echo\call "%%~dp0Poke-Controller-Modified\.venv\Scripts\activate.bat"
    echo\cd /d "%%~dp0Poke-Controller-Modified\SerialController"
    echo\py -3.7 .\Window.py
) > %~dp0Poke-Controller-Modified.bat
