@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:: Definindo os frames do spinner
SET SPINNER[1]=\
SET SPINNER[2]=-
SET SPINNER[3]=/
SET SPINNER[4]=-
SET SPINNER[5]=O

SET COUNT=1

:: Exemplo de uso do spinner
:LOOP
CLS
ECHO Carregando... !SPINNER[%COUNT%]!
IF %COUNT% EQU 5 (
    SET COUNT=1
) ELSE (
    SET /A COUNT+=1
)
ping localhost -n >nul &ping localhost -n >nul
GOTO LOOP
