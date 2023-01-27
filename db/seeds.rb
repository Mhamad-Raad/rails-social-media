# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create( name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', posts_counter: 0,
                    bio: 'Teacher from Mexico.')
second_user = User.create(  name: 'Lilly', photo: 'https://images.unsplash.com/photo-1665686310934-8fab52b3821b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d29tYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', posts_counter: 0,
                          bio: 'Teacher from Poland.')
User.create(name: 'Cindy', bio: 'The blog Creator', posts_counter: 0,
            photo: 'https://picsum.photos/200')

first_post = Post.create(author_id: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: first_user, title: 'Hello again', text: 'This is my second post. Welcome', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: first_user, title: 'Hi', text: 'Whats up folks?', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: second_user, title: 'See you later', text: 'With this, I say goodbye', comments_counter: 0, likes_counter: 0)

#Comment.create(post_id: first_post.id, author: second_user, text: 'Hi Tom!')

Comment.create(posts_id: third_post, text: 'Hi Tom!')
Comment.create(posts_id: first_post, author_id: second_user, text: 'Interesting')
Comment.create(posts_id: first_post, author_id: second_user, text: 'I dont agree')
Comment.create(posts_id: first_post, author_id: second_user, text: 'I would like to know more')
Comment.create(posts_id: first_post, author_id: second_user, text: 'Thanks for sharing')
Comment.create(posts_id: first_post, author_id: second_user, text: 'Is that all?')


Like.create(posts_id: first_post, author_id: second_user)
Like.create(posts_id: second_post, author_id: second_user)
Like.create(posts_id: third_post, author_id: second_user)
Like.create(posts_id: fourth_post, author_id: second_user)