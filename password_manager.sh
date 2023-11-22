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
		echo "サービス名：$service ユーザー名：$user パスワード：$password" >> pass.txt  
		#.gpgの暗号化ファイルを作成
		gpg --yes pass.txt

		#暗号化元のファイルを削除
		rm pass.txt

		echo "Thank you!"
	else
		echo "すべて入力してください"
	fi

	elif [ "$choice" == "Get Password" ]; then
	
		read -p "サービス名を入力してください：" service
		#暗号化ファイルを復号化
		gpg pass.txt.pgp
		#-dは区切り文字、-fはフィールド番号、--output-delimiterは結果の各列の間に入れる
		grep "$service" pass.txt | cut -d ' ' -f 1,2,3 --output-delimiter=' '

	elif  [ "$choice" == "Exit" ]; then
		echo "Thank you!"
		break

	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
 fi

done
#暗号化元のファイルを削除

exit
