first_user = User.create(name: 'Tom', ImgUrl: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', ImgUrl: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(user_id: first_user, title: 'Hello', text: 'first post')
second_post = Post.create(user_id: first_user, title: 'Hello again', text: 'second post')
third_post = Post.create(user_id: first_user, title: 'Hi', text: 'third post')
fourth_post = Post.create(user_id: first_user, title: 'yooo', text: 'yes sirrr')

Comment.create(post_id: first_post, user_id: second_user, text: 'Hi Tom!')
Comment.create(post_id: first_post, user_id: second_user, text: 'Nice')
Comment.create(post_id: first_post, user_id: second_user, text: 'cool mate')
Comment.create(post_id: first_post, user_id: second_user, text: 'sing me up')
Comment.create(post_id: first_post, user_id: second_user, text: 'I am in')
Comment.create(post_id: first_post, user_id: second_user, text: 'Is that all you got')

Like.create(post_id: first_post, user_id: second_user)
Like.create(post_id: second_post, user_id: second_user)
Like.create(post_id: third_post, user_id: second_user)
Like.create(post_id: fourth_post, user_id: second_user)
