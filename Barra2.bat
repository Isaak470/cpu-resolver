@echo off
cls
SETLOCAL EnableDelayedExpansion

set "bar=0xDB"
set "progress="
set /a counter=0

FOR /F %%B in ('FORFILES /P "%~dp0." /M "%~nx0" /C "cmd /c echo(!bar!"') do set "bar=%%B"

:loop
cls
set "progress=!progress!!bar!"
echo !progress! %counter%

set /a counter+=2
if %counter%==28 (
    echo Eu gosto de você ChatGPT!
    ping localhost -n 2 >nul
    goto loop
)
if %counter% LSS 102 (
    ping localhost -n 1 >nul &ping localhost -n 1 >nul
    goto loop
)

echo Completo!
pause