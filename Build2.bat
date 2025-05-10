@echo off
cls
chcp 65001
setlocal enabledelayedexpansion

:: Definição do comprimento total da barra
set "bar_length=30"

:: Inicializa contador
set /a counter=0

:: Exibir a barra de progresso
:progress
cls
set /a percent=counter * 2
set "bar="

:: Criar a barra visual
for /l %%i in (1,1,%counter%) do set "bar=!bar!█"
for /l %%i in (%counter%,1,%bar_length%) do set "bar=!bar! "

:: Exibir progresso
set "spaces= "
set "spaces=!spaces!!spaces!!spaces!!spaces!!spaces!!spaces!"
echo [!bar!] !percent!%%

:: Mensagem de progresso
if %counter%==1 echo Iniciando processo...
if %counter%==5 echo Carregando módulos...
if %counter%==10 echo Estabelecendo conexões...
if %counter%==15 echo Quase lá...
if %counter%==25 echo Concluído!

:: Incrementa contador
set /a counter+=1

:: Pausa e continua se não atingir 50
if %counter% leq %bar_length% ping -n 1 127.0.0.1 >nul & goto progress

echo Processo finalizado!
pause
