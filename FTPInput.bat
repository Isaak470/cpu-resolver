@echo off
mode 50, 3
title Chat

:: Credenciais FTP
set FTP_HOST=ftpupload.net
set FTP_USER=if0_38647141
set FTP_PASS=oRMciSb8IKSr
set LOCAL_CHAT=mes.cdat
set LOCAL_LOG=log.cdat

:reg
set /p "name=Enter your name: "
echo %name% Joined the chat (%time% %date%) >> %LOCAL_LOG%

cls
start FTPRead.bat

:mes
set /p "message=>>"
echo %name%: %message%>>%LOCAL_CHAT%
if "%message%"=="!clearlog" (
echo. > log.cdat
)
if "%message%"=="!clearchat" (
echo. > mes.cdat
)
:: Enviar para o FTP
echo open %FTP_HOST%> ftp_script.txt
echo %FTP_USER%>> ftp_script.txt
echo %FTP_PASS%>> ftp_script.txt
echo cd htdocs>> ftp_script.txt
echo put %LOCAL_CHAT%>> ftp_script.txt
echo put %LOCAL_LOG%>> ftp_script.txt
echo bye>> ftp_script.txt

ftp -s:ftp_script.txt >nul
del ftp_script.txt

goto mes