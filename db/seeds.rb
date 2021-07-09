email = 'test@example.com'
password = 'password'

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts 'ユーザーの初期データインポートに成功しました。'
end
AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?
