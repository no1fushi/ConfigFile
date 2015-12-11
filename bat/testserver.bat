@echo off
cd C:\Users\%username%\testserver\

:loop
set /P Select="upかhaltを入力してください: "

if "%Select%" == "up" (
@echo on
vagrant up

cd puttyのあるディレクトリ
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