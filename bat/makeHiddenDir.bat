cls
@ECHO OFF
title Folder 隠したいファイル・フォルダの名前
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST 隠したいファイル・フォルダの名前 goto MDLOCKER
:CONFIRM
echo ロックしますか？(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren 隠したいファイル・フォルダの名前 "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End
:UNLOCK
echo パスワードを入力し、Enterキーを押してください。
set/p "pass=>"
if NOT %pass%== パスワード　goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" 隠したいファイル・フォルダの名前
echo Folder Unlocked successfully
goto End
:FAIL
echo Invalid password
goto end
:MDLOCKER
md 隠したいファイル・フォルダの名前