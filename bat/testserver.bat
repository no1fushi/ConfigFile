@echo off
cd C:\Users\%username%\testserver\

:loop
set /P Select="up��halt����͂��Ă�������: "

if "%Select%" == "up" (
@echo on
vagrant up

cd putty�̂���f�B���N�g��
putty.exe
) else if "%Select%" == "halt" (
@echo on
vagrant halt
) else (
call :loop

endlocal
exit \b
)

exit