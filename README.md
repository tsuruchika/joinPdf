# joinPdf

複数ある PDF ファイルの１ページ目のみ抜き出して１ PDF ファイルに結合する。

## 前提

- Windows 向け
- pdftk がインストールされており、PATH が通っていること

## 準備

以下サイト「Download PDFtk Free!」からダウンロードしてインストールしてください。  
インストール時に PATH に登録するか聞かれますが登録を選択してインストールすることにより PATH が通ります。  
https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

※PDFtk の画面が立ち上がったら閉じて OK

## 処理内容

1. pdf_bk に元ネタフォルダはバックアップとして配置する。
2. 日本語ファイル名だとエラーになるため連番ファイルに RENAME 処理している。
3. RENAME した PDF をから１ページ目のみ抜き出す。
4. １ページ目のみ抜き出した PDF を print_target.pdf として出力する。
5. 不要になった PDF の残骸のごみ掃除する。
