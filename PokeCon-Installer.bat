@echo off
cd /d %~dp0

@REM �Ǘ��Ҍ����̎擾
@REM �Q�l�Fhttps://correct-log.com/bat_auto_admin/
whoami /priv | find "SeDebugPrivilege" > nul
if %ERRORLEVEL% neq 0 (
    powershell -Command "Start-Process \"%~0\" -Verb RunAs"
    exit
)

@REM Python�̃C���X�g�[��
winget install -e --id Python.Python.3.7

@REM Poke-Controller MODIFIED�̃_�E�����[�h
powershell -Command "Invoke-WebRequest -Uri \"https://github.com/Moi-poke/Poke-Controller-Modified/archive/refs/heads/master.zip\" -OutFile \"%~dp0_.zip\""
powershell -Command "Expand-Archive -Path \"%~dp0_.zip\" -DestinationPath \"%~dp0" -Force"
move %~dp0Poke-Controller-Modified-master %~dp0Poke-Controller-Modified
del /q "%~dp0_.zip"

@REM Poke-Controller MODIFIED�̉��z���쐬
cd /d %~dp0Poke-Controller-Modified
py -3.7 -m venv .venv
call .\.venv\Scripts\activate.bat
py -3.7 -m pip install -r requirements.txt

@REM �N���p�o�b�`�t�@�C���쐬
(
    echo\call "%%~dp0Poke-Controller-Modified\.venv\Scripts\activate.bat"
    echo\cd /d "%%~dp0Poke-Controller-Modified\SerialController"
    echo\py -3.7 .\Window.py
) > %~dp0Poke-Controller-Modified.bat
