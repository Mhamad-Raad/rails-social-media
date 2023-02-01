equire 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Peter Parker', bio: 'Official spiderman hotographer', photo: 'https://www.example.com',
                         posts_counter: 0)

    @user2 = User.create(name: 'Bruce Wayne', bio: 'Millionaire', photo: 'https://www.example.com', posts_counter: 3)

    @post1 = Post.create(author_id: @user1.id, title: 'First post', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)

    @post2 = Post.create(author_id: @user2.id, title: 'Hello World', text: 'My first post too!', comments_counter: 0,
                         likes_counter: 0)

    # First post interactions
    Comment.create(posts_id: @post1.id, author_id: @user1.id, text: 'First comment! Wow')
    Comment.create(posts_id: @post1.id, author_id: @user2.id, text: 'Nice post BTW')
    Comment.create(posts_id: @post1.id, author_id: @user2.id, text: 'Yeah I agree')

    Like.create(posts_id: @post1.id, author_id: @user2.id)

    # Second post interactions
    Comment.create(posts_id: @post2.id, author_id: @user1.id, text: 'First comment! Wow')

    Like.create(posts_id: @post2.id, author_id: @user1.id)
  end

  describe 'post show page' do
    # See post title
    it 'displays the post title' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('This is my first post')
    end

    # See post's comments and likes number
    it 'the likes counters renders correctly' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Likes: 1')
    end

    it 'the comments counters renders correctly' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Comments 3')
    end

    # see commentor's name
    it 'should render comments corectly' do
      visit user_post_path(@user2, @post2)

      expect(page).to have_content('First comment! Wow')
    end

    # I can see the post body
    it 'should render comments corectly' do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content('This is my first post')
    end

    # see commentor's name
    it 'should render comments corectly' do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content('Bruce Wayne')
    end
  end
end