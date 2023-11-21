#!/bin/bash
#どのshebang（インタプリタ）で実行するかを指定する

while true; do

 echo "パスワードマネージャーへようこそ！"
 read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" choice

 if [ "$choice" == "Add Password" ]; then

	read -p "サービス名を入力してください：" service
	read -p "ユーザー名を入力してください：" user
	read -p "パスワードを入力してください：" password

	if [ "$service" ] && [ "$user" ] && [ "$password" ]; then
		echo   "サービス名：$service ユーザー名：$user パスワード：$password" >> pass.txt  
		echo "Thank you!"
	else
		echo "すべて入力してください"
	fi


	elif [ "$choice" == "Get Password" ]; then
	
		read -p "サービス名を入力してください：" service
	
		grep [ "$service" ] pass.txt
	
		echo "サービス名：$service"
		echo "ユーザー名：$user"
		echo "パスワード：$password"


	elif  [ "$choice" == "Exit" ]; then
		echo "Thank you!"
		break

	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
 fi

done
