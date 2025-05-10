@ECHO OFF
:: Simula um processo que pode dar erro ou não
SET /A RESULT=1
IF %RESULT% GTR 0 (
    EXIT /B 0
) ELSE (
    EXIT /B -1
)