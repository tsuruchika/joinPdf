@echo off
@setlocal enabledelayedexpansion

set FILE_PATH=pdf_bk

rem バックアップ用フォルダ
if not exist "%FILE_PATH%" (
  mkdir %FILE_PATH%
)

rem バックアップ用フォルダにコピー
for %%i in (*.pdf) do (
  copy %%i %FILE_PATH%
)

rem 連番用
set num=1

rem ファイル名の変更
for %%i in (*.pdf) do (
  rem ソースファイル自身を対象に取らないために
  if not %%i==%~nx0 (
    echo %%iのファイル名を !num!_.pdf に変更
    ren %%i !num!_.pdf
    set /a num+=1
  )
)

rem 1ページ目のみぬき出し
for %%i in (*.pdf) do (
  pdftk %%~nxi cat 1-1 output %%i_onepage.pdf
  rem 不要になったファイルの削除
  del %%i /f /s /q
)

rem 対象ファイル名の結合
set /a target
for %%i in (*_onepage.pdf) do (
  set target_a=%%i
  set target=!target! !target_a!
)

rem PDF結合
pdftk %target% cat output print_target.pdf

rem 不要になったファイルの削除
for %%i in (*_onepage.pdf) do (
  del %%i /f /s /q
)