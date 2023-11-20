#!/bin/bash
#どのshebang（インタプリタ）で実行するかを指定する

echo "パスワードマネージャーへようこそ！"

read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" user
read -p "パスワードを入力してください：" password

if [ "$service" ] && [ "$user" ] && [ "$password" ]; then
	echo   "サービス名：$service ユーザー名：$user パスワード：$password" >> pass.txt  
	echo "Thanks"
else
	echo "入力箇所に誤りがあります"
fi
