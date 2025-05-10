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

:: Lê e executa cada linha do arquivo uma por vez
for /f "usebackq delims=" %%A in ("%filePath%") do (
    echo Executando: %%A
    call %%A
)

echo.
echo Todas as linhas foram executadas!
pause
