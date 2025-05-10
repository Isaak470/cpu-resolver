@echo off
mode 75,25
:: Credenciais FTP
set FTP_HOST=ftpupload.net
set FTP_USER=if0_38647141
set FTP_PASS=oRMciSb8IKSr
set LOCAL_CHAT=mes.cdat
set LOCAL_LOG=log.cdat
:mes
:: Baixar arquivos do FTP
echo open %FTP_HOST%> ftp_script.txt
echo %FTP_USER%>> ftp_script.txt
echo %FTP_PASS%>> ftp_script.txt
echo cd htdocs>> ftp_script.txt
echo get %LOCAL_CHAT%>> ftp_script.txt
echo get %LOCAL_LOG%>> ftp_script.txt
echo bye>> ftp_script.txt

ftp -s:ftp_script.txt >nul
del ftp_script.txt
cls
echo ==== Chat Log ====
type %LOCAL_LOG%
echo.
type %LOCAL_CHAT%
goto mes