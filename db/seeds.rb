user1 = User.create!(name: "test1", email: "test1@example.com", password: "password1")
user2 = User.create!(name: "test2", email: "test2@example.com", password: "password2")
user3 = User.create!(name: "test3", email: "test3@example.com", password: "password3")

post1 = Post.create!(title: "Hello", user_id: user2.id)
post2 = Post.create!(title: "Hi", user_id: user3.id)
post3 = Post.create!(title: "Bye", user_id: user2.id)

Comment.create!(content: "comment1", post_id: post3.id, user_id: user3.id)
Comment.create!(content: "comment2", post_id: post1.id, user_id: user1.id)
Comment.create!(content: "comment3", post_id: post2.id, user_id: user3.id)
