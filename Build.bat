@echo off
cls
SETLOCAL EnableDelayedExpansion

set /a "processValue=200"
set "bar=0xDB" Character used by progress bar (SUPPORTS HEX)
set "tbd=0xB0"
set "barLength=40"
( set LF=^
%=-----------DO NOT REMOVE THIS LINE. the LF variable is for future use in a function, it's currently useless-----------=%
)
FOR /F %%B in ('FORFILES /P "%~dp0." /M "%~nx0" /C "cmd /c echo(!bar!"') do set "bar=%%B"
FOR /F %%B in ('FORFILES /P "%~dp0." /M "%~nx0" /C "cmd /c echo(!tbd!"') do set "tbd=%%B"
FOR /F %%B in ('copy /Z "%~f0" nul') do set "CR=%%B"
FOR /F %%B in ('prompt $E ^& ^<nul cmd /k') do set "ESC=%%B"
for /l %%N in (0,1,%barLength%) do set "emptybar=!emptybar! "

echo Starting at %time%!LF!
for /l %%N in (0 1 !barLength!) do echo(!LF!%ESC%[2A%ESC%[%%NC%tbd%
for /L %%N in (0 1 %processValue%) do (
  set /a showBar=%%N*barLength/processValue
  set /a percentage=%%N*100/processValue
  echo       Processing: %%N / %processValue% = !percentage!%%!LF!%ESC%[2A%ESC%[!showBar!C%bar%
  ping -4 -n 1 127.0.0.1 >nul 
)
echo.
echo !LF!Completed!
ENDLOCAL