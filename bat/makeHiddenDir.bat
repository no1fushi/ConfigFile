cls
@ECHO OFF
title Folder �B�������t�@�C���E�t�H���_�̖��O
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST �B�������t�@�C���E�t�H���_�̖��O goto MDLOCKER
:CONFIRM
echo ���b�N���܂����H(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren �B�������t�@�C���E�t�H���_�̖��O "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End
:UNLOCK
echo �p�X���[�h����͂��AEnter�L�[�������Ă��������B
set/p "pass=>"
if NOT %pass%== �p�X���[�h�@goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" �B�������t�@�C���E�t�H���_�̖��O
echo Folder Unlocked successfully
goto End
:FAIL
echo Invalid password
goto end
:MDLOCKER
md �B�������t�@�C���E�t�H���_�̖��O