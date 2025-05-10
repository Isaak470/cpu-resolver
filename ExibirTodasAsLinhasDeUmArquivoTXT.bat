@echo off
cls
SETLOCAL EnableDelayedExpansion

:: Caminho do arquivo de texto
set "filePath=C:\Users\Windows Lite BR\Desktop\BIBLIOTECA\Extrair texto\Text.txt"

:: Verifica se o arquivo existe
if not exist "%filePath%" (
    echo ERRO: Arquivo nao encontrado!
    pause
    exit /b
)

:: Ler as linhas do arquivo e armazenar
set /a lineCount=0
for /f "usebackq delims=" %%A in ("%filePath%") do (
    set /a lineCount+=1
    set "line[!lineCount!]=%%A"
)

:: Exibir as linhas uma a uma com atraso
cls
echo Iniciando a leitura...
echo ============================

for /L %%i in (1,1,%lineCount%) do (
    echo !line[%%i]!
    ping localhost -n 1 >nul
    ping localhost -n 1 >nul
)

echo ============================
echo Completo!
pause
