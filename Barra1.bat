@echo off 
chcp 1252 > nul
setLocal EnableDelayedExpansion

:Inicio
Set /a Contador=0
set Letra=
set Letra2=
cls
echo.
Title Barra de Progresso
echo ms = WScript.Arguments(0)> %temp%\sleep.vbs
echo WScript.Sleep ms>> %temp%\sleep.vbs
set /p "Letra= Escolha a letra que voce quer usar: "
cls
echo.
set /p Velocidade= Especifique a velocidade do carregamento em milisegundos: 
cls
echo.
Set /a Quantidade=50
cls
echo.

for /l %%b in (1,1,%Quantidade%) do (
cls
set /a Contador+=2
set "Letra2=!Letra2!%Letra%
set "Linha=!Letra2!                                                 "
echo  Carregando [!Linha:~,50!] Concluido: !Contador!%%
Cscript %temp%\sleep.vbs %Velocidade%> Nul
)
echo.
echo.
pause
goto Inicio