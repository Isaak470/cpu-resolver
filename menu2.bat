@echo off
SETLOCAL EnableDelayedExpansion
cls
chcp 65001 >nul

set hora=%time:~0,2%
set minuto=%time:~3,2%
echo Horário: %hora% horas e %minuto% minutos.
set mes=%date:~3,2%
set "pontos=."
for /L %%i in (2,1,%mes%) do set "pontos=!pontos!."
if %pontos%==. set mes=janeiro
if %pontos%==.. set mes=fevereiro
if %pontos%==... set mes=março
if %pontos%==.... set mes=abril
if %pontos%==..... set mes=maio
if %pontos%==...... set mes=junho
if %pontos%==....... set mes=julho
if %pontos%==........ set mes=agosto
if %pontos%==......... set mes=setembro
if %pontos%==.......... set mes=outubro
if %pontos%==........... set mes=novembro
if %pontos%==............ set mes=dezembro
for /f %%i in ('powershell -Command "(Get-Date).ToString('dddd', [System.Globalization.CultureInfo]::GetCultureInfo('pt-BR'))"') do set dia=%%i
echo Data Longa: %dia%, %date:~0,2% de %mes% de %date:~6,10%
for /f "tokens=*" %%A in ('powershell -Command "Get-Date -Format 'h:mm tt'"') do set horaDigital=%%A
echo Horário Digital: %horaDigital%

:: Obtém o minuto atual ao iniciar
set minutoAnterior=%time:~3,2%

:Loop
:: Obtém o minuto atual do sistema
set minutoAtual=%time:~3,2%

:: Aguarda até que o minuto mude
if "%minutoAtual%"=="%minutoAnterior%" goto Loop

:: Atualiza o minutoAnterior
set minutoAnterior=%minutoAtual%

cls
set hora=%time:~0,2%
set minuto=%time:~3,2%

echo Horário: %hora% horas e %minuto% minutos.

:: Determina o mês com base no número
set mes=%date:~3,2%
set "pontos=."
for /L %%i in (2,1,%mes%) do set "pontos=!pontos!."
if %pontos%==. set mes=janeiro
if %pontos%==.. set mes=fevereiro
if %pontos%==... set mes=março
if %pontos%==.... set mes=abril
if %pontos%==..... set mes=maio
if %pontos%==...... set mes=junho
if %pontos%==....... set mes=julho
if %pontos%==........ set mes=agosto
if %pontos%==......... set mes=setembro
if %pontos%==.......... set mes=outubro
if %pontos%==........... set mes=novembro
if %pontos%==............ set mes=dezembro

:: Obtém o dia da semana
for /f %%i in ('powershell -Command "(Get-Date).ToString('dddd', [System.Globalization.CultureInfo]::GetCultureInfo('pt-BR'))"') do set dia=%%i

:: Obtém a hora digital no formato de 12 horas
for /f "tokens=*" %%A in ('powershell -Command "Get-Date -Format 'h:mm tt'"') do set horaDigital=%%A

:: Exibe a data e hora
echo Data Longa: %dia%, %date:~0,2% de %mes% de %date:~6,10%
echo Horário Digital: %horaDigital%

goto Loop