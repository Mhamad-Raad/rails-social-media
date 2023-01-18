first_user = User.create!(name: 'Tom', ImgUrl: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_count: 0 )
second_user = User.create(name: 'Lilly', ImgUrl: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',posts_count: 0)

first_post = Post.create!(user_id: first_user.id, title: 'Hello', text: 'first post', comments_count: 0, likes_count:0)
second_post = Post.create(user_id: first_user.id, title: 'Hello again', text: 'second post', comments_count: 0, likes_count:0)
third_post = Post.create(user_id: first_user.id, title: 'Hi', text: 'third post', comments_count: 0, likes_count:0)
fourth_post = Post.create(user_id: first_user.id, title: 'yooo', text: 'yes sirrr', comments_count: 0, likes_count:0)

Comment.create!(post_id: first_post.id, user_id: second_user.id, text: 'Hi Tom!')
Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Nice')
Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'cool mate')
Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'sing me up')
Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'I am in')
Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Is that all you got')

Like.create(post_id: first_post.id, user_id: second_user.id)
Like.create(post_id: second_post.id, user_id: second_user.id)
Like.create(post_id: third_post.id, user_id: second_user.id)
Like.create(post_id: fourth_post.id, user_id: second_user.id)
