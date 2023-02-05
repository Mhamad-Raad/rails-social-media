# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create( name: 'Tom', posts_counter: 0,
                    bio: 'Teacher from Mexico.', role: 'admin', email: 'hama@gmail.com', password: '123123')
second_user = User.create(  name: 'Lilly', posts_counter: 0,
                          bio: 'Teacher from Poland.')
User.create(name: 'Cindy', bio: 'The blog Creator', posts_counter: 0)

first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: first_user.id, title: 'Hello again', text: 'This is my second post. Welcome', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: first_user.id, title: 'Hi', text: 'Whats up folks?', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: second_user.id, title: 'See you later', text: 'With this, I say goodbye', comments_counter: 0, likes_counter: 0)

Comment.create(posts_id: third_post.id, text: 'Hi Tom!')
Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Interesting')
Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'I dont agree')
Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'I would like to know more')
Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Thanks for sharing')
Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Is that all?')


Like.create(posts_id: first_post.id, author_id: second_user.id)
Like.create(posts_id: second_post.id, author_id: second_user.id)
Like.create(posts_id: third_post.id, author_id: second_user.id)
Like.create(posts_id: fourth_post.id, author_id: second_user.id)