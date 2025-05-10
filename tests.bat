@echo off
chcp 65001
call "%~dp0\msgTick.exe"
cls
setlocal enabledelayedexpansion

:: Define a unidade de busca (C:\, D:\, etc.)
set DRIVE="C:\"
set File="powershell"

:: Percorre todos os diretórios e exibe a estrutura em tempo real
for /d /r %DRIVE% %%D in (*) do (
    echo [📂] %%D

    if exist "%%D\chrome.exe" (
        echo  ✅ Encontrado: %%D\%File%
        cls
        start "%%D\%File%"
        echo %%D
        pause >nul
        exit /b
    )
)

echo ❌ %File% não foi encontrado.
echo %%D
pause >nul
exit /b