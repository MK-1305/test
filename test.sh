echo "パスワードマネージャーへようこそ！"

read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" user
read -p "パスワードを入力してください：" password

if [$service $user $password];then
	echo "Thanks"
else
	echo "入力箇所に誤りがあります"
fi
