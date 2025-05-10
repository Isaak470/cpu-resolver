@ECHO OFF
CLS
SETLOCAL ENABLEDELAYEDEXPANSION

:: Configuração da barra de progresso
SET "bar=0xDB"  :: Bloco cheio
SET "tbd=0xB0"  :: Bloco vazio
SET "barLength=40"  :: Tamanho da barra
SET /A "steps=4"  :: Quantidade de arquivos a executar

:: Capturando os caracteres corretos
FOR /F %%B in ('FORFILES /P "%~dp0." /M "%~nx0" /C "cmd /c echo(!bar!"') do SET "bar=%%B"
FOR /F %%B in ('FORFILES /P "%~dp0." /M "%~nx0" /C "cmd /c echo(!tbd!"') do SET "tbd=%%B"
FOR /F %%B in ('copy /Z "%~f0" nul') do SET "CR=%%B"
FOR /F %%B in ('prompt $E ^& ^<nul cmd /k') do SET "ESC=%%B"

:: Inicialização da barra de progresso
SET "progress=0"
SET "percentage=0"
SET "emptybar="
FOR /L %%N IN (1,1,%barLength%) DO SET "emptybar=!emptybar! "

ECHO Verificando todos os arquivos .bat dentro do arquivo .txt...
ECHO.
PING -n 2 127.0.0.1 >nul
cls

FOR /L %%N IN (0,1,%barLength%) DO ECHO(!LF!%ESC%[2A%ESC%[%%NC%tbd%

set "filePath=C:\Users\Windows Lite BR\Desktop\Progressbar\Resource\Text.txt"

SET COUNT=0
FOR /F "tokens=*" %%A IN (%filePath%) DO (
    SET /A COUNT+=1
    CALL "%%A.bat"
    IF !ERRORLEVEL! LSS 0 (
        ECHO [ERROR] Fatal Error
        EXIT /B
    ) ELSE (
        ECHO [WORKING] Processo concluído com sucesso.
        CALL :UPDATE_PROGRESS !COUNT!
    )
    PING -n 2 127.0.0.1 >nul
)
EXIT /B

:UPDATE_PROGRESS
SET /A progress=%1*barLength/steps
SET /A percentage=%1*100/steps
ECHO       Processando: %1 / %steps% = !percentage!%%!LF!%ESC%[2A%ESC%[!progress!C%bar%
EXIT /B