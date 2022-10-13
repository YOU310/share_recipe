# name = "test"
# email = "test@example.com"
# password = "password"

# # テストユーザーが存在しないときだけ作成
# User.find_or_create_by!(name: name, email: email) do |user|
#   user.password = password
#   Rails.logger.debug "ユーザーの初期データインポートに成功しました。"
# end
AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

User.create!(
  name: "test",
  email: "test@example.com"
)
