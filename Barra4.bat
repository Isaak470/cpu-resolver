@echo off
cls
SETLOCAL EnableDelayedExpansion

set "filePath=C:\Users\Windows Lite BR\Desktop\BIBLIOTECA\Extrair texto\Text.txt"

set "bar=0xDB"
set "progress="
set /a counter=0

FOR /F %%B in ('FORFILES /P "%~dp0." /M "%~nx0" /C "cmd /c echo(!bar!"') do set "bar=%%B"

:progress
set "progress=!progress!!bar!"
echo !progress! %counter%

:Files
echo. &echo. &echo. &echo.
if not exist "%filePath%" (
    echo ERRO: Arquivo nao encontrado!
    pause
    exit /b
)

for /f "usebackq delims=" %%A in ("%filePath%") do (
    echo Executando: %%A
    call %%A
)
pause