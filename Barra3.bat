@echo off
cls
SETLOCAL EnableDelayedExpansion

:: Caminho do arquivo de texto
set "filePath=C:\Users\Windows Lite BR\Desktop\BIBLIOTECA\Extrair texto\Text.txt"

:: Verificar se o arquivo existe
if not exist "%filePath%" (
    echo ERRO: Arquivo nao encontrado!
    pause
    exit /b
)

:: Configuração da barra de progresso
set "bar=0xDB"
set "progress="
set /a counter=0

FOR /F %%B in ('FORFILES /P "%~dp0." /M "%~nx0" /C "cmd /c echo(!bar!"') do set "bar=%%B"

:: Contar total de linhas no arquivo
set /a lineCount=0
for /f "usebackq delims=" %%A in ("%filePath%") do (
    set /a lineCount+=1
    set "line[!lineCount!]=%%A"
)

:: Definir o valor máximo do counter para o progresso
set /a maxProgress=50  :: Define o tamanho máximo da barra de progresso
set /a step=100 / lineCount   :: Calcula o incremento do counter para cada linha

:: Loop para exibir linhas e avançar a barra
cls
echo ============================
for /L %%i in (1,1,%lineCount%) do (
    set /a counter+=step
    for /L %%j in (1,1,!step!) do set "progress=!progress!!bar!"
    
    cls
    echo ============================
    echo !progress! !counter!%%
    echo ============================
    echo !line[%%i]!
    
    ping localhost -n 1 >nul
    ping localhost -n 1 >nul
)

echo ============================
echo Completo!
pause
