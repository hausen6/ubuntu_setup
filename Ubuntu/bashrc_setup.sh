#!/bin/sh
# ~/.bashrc に追加しておくと良いもの

# プロンプトの文字色を変更
echo "" >> ~/.bashrc
echo "# プロンプトの文字色を赤に変更" >> ~/.bashrc
echo "RED=\"0;31\"" >> ~/.bashrc
echo "START_COLOR=\"\e[\${RED}m\"" >> ~/.bashrc
echo "END_COLOR=\"\e[0m\"" >> ~/.bashrc
echo "export PS1=\"\${START_COLOR}[\u@\W]\\$\${END_COLOR} \"" >> ~/.bashrc

# 何か色々と表示されるので最後に画面をクリア -> Solarized にテーマをしていた場合
echo "clear" >> ~/.bashrc
