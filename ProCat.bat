@echo off
chcp 65001 >nul
SETLOCAL EnableDelayedExpansion

mode 75, 25

set folder1="C:\Users\Windows Lite BR\Desktop\ProCat Alpha\LOG"
set folder2="C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Data"
set folder3="C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Cache"
set UserDATA="C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Data\username.txt"

:MenuStart
if not exist %folder1% ( mkdir %folder1%)
if not exist %folder2% ( mkdir %folder2%)
if not exist %folder3% ( mkdir %folder3%)
if not exist %UserDATA% ( goto loginin)
:MenuByPass
mode 75, 25
chcp 65001 >nul
ping 127.0.0.1 -n 2 > nul
set /p nomeDoUsuario=<"C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Data\username.txt"
set "NomeDoUsuario=%nomeDoUsuario% "
echo.
::Construção Do Menu::
set "menuPath=%~dp1\Pag 1.txt"
if exist %menuPath% (
    cls
    ping 127.0.0.1 -n 2 >nul
    echo O menu está em construção. Aguarde um pouco.
    ping 127.0.0.1 -n 2 >nul
)

set /a lineCount=0
for /f "usebackq delims=" %%A in ("%menuPath%") do (
    set /a lineCount +=1
    set "line[!lineCount!]=%%A"
)
for /L %%i in (1,1,%lineCount%) do (
    echo !line[%%i]!
    ping localhost -n 1 >nul
    ping localhost -n 1 >nul
)

cd /d "%~dp0" &call "LOG\Build.bat"

::Contrução do Menu::
cd /d "%~dp1" &call "ProCat Alpha\msgTick.exe" &call msgTick.exe
pause >nul
pause >nul

:loginin
set temp="C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Cache\tmp"
if exist %temp% (goto noDataRequest) else (goto UserFIx)
Exit
:noDataRequest
set /p VerifyOptionIn=<"C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Cache\tmp"
if "%VerifyOptionIn%"=="%USERNAME% " (goto MenuByPass)
:UserFIx
mode 75, 5
choice /C YN /N /M "Ola, %username%. Voce deseja alterar seu nome de usuario? [Y/N]: "
if errorlevel 2 goto ER001Nao
if errorlevel 1 goto ER001Sim

:ER001Nao
set NomeDoUsuario=%username%
echo %NomeDoUsuario% > tmp
set source0001tmp="C:\Users\Windows Lite BR\Desktop\ProCat Alpha\tmp"
set destination0001tmp="C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Cache\tmp"

if exist %source0001tmp% (
move %source0001tmp% %destination0001tmp%
) else (
set NomeDoUsuario=INDEFINIDO! Wtf Brother, Como Assim?
)
goto MenuByPass

:ER001Sim
cls
set /p "username=Digite seu novo nome: "

if not "%username:~14,1%"=="" (
    echo O nome deve ter no máximo 14 caracteres!
    timeout /t 2 >nul &ping localhost -n 2 >nul
    goto ER001Sim
)
echo %username% > "C:\Users\Windows Lite BR\Desktop\ProCat Alpha\Data\username.txt"
echo Seu nome agora é %username%.
ping localhost -n 2 >nul
goto MenuStart
pause >nul
endlocal

:ola
echo OLAAA mUE carao adamigo
echo Como vai?
pause
pause >nul