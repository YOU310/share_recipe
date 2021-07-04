user1 = User.find_or_create_by!(name: "test1", email: "test1@example.com", password: "password1")
user2 = User.find_or_create_by!(name: "test2", email: "test2@example.com", password: "password2")
user3 = User.find_or_create_by!(name: "test3", email: "test3@example.com", password: "password3")

post1 = Post.find_or_create_by!(title: "Hello", user_id: user2.id)
post2 = Post.find_or_create_by!(title: "Hi", user_id: user3.id)
post3 = Post.find_or_create_by!(title: "Bye", user_id: user2.id)

Comment.find_or_create_by!(content: "comment1", post_id: post3.id, user_id: user3.id)
Comment.find_or_create_by!(content: "comment2", post_id: post1.id, user_id: user1.id)
Comment.find_or_create_by!(content: "comment3", post_id: post2.id, user_id: user3.id)
AdminUser.find_or_create_by!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?
