@echo off
@setlocal enabledelayedexpansion

set FILE_PATH=pdf_bk

rem �o�b�N�A�b�v�p�t�H���_
if not exist "%FILE_PATH%" (
  mkdir %FILE_PATH%
)

rem �o�b�N�A�b�v�p�t�H���_�ɃR�s�[
for %%i in (*.pdf) do (
  copy %%i %FILE_PATH%
)

rem �A�ԗp
set num=1

rem �t�@�C�����̕ύX
for %%i in (*.pdf) do (
  rem �\�[�X�t�@�C�����g��ΏۂɎ��Ȃ����߂�
  if not %%i==%~nx0 (
    echo %%i�̃t�@�C������ !num!_.pdf �ɕύX
    ren %%i !num!_.pdf
    set /a num+=1
  )
)

rem 1�y�[�W�ڂ݂̂ʂ��o��
for %%i in (*.pdf) do (
  pdftk %%~nxi cat 1-1 output %%i_onepage.pdf
  rem �s�v�ɂȂ����t�@�C���̍폜
  del %%i /f /s /q
)

rem �Ώۃt�@�C�����̌���
set /a target
for %%i in (*_onepage.pdf) do (
  set target_a=%%i
  set target=!target! !target_a!
)

rem PDF����
pdftk %target% cat output print_target.pdf

rem �s�v�ɂȂ����t�@�C���̍폜
for %%i in (*_onepage.pdf) do (
  del %%i /f /s /q
)