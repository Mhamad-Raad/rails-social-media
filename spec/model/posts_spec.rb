require 'rails_helper'
require 'spec_helper'
require 'post'

describe 'Post' do
  describe 'validations' do
    it 'validates presence of title' do
      my_model = Post.new(title: '', likes_counter: 1, comments_counter: 1)
      expect(my_model.valid?).to be_falsey
    end

    it 'validates comments_counter numericality' do
      user = User.create(name: 'hala', posts_counter: 1)
      my_model = Post.new(title: 'hala', likes_counter: 1, comments_counter: 1, author_id: user.id)

      expect(my_model.valid?).to be_truthy
    end

    it 'validates likes_counter numericality' do
      my_model = Post.new(title: 'yoooo', likes_counter: 1, comments_counter: 1)
      expect(my_model.valid?).to be_falsey
    end
  end

  describe 'test post methode' do
    it 'test the five_comments function' do
      my_model = Post.new(title: 'hala', likes_counter: 1, comments_counter: 1)
      expect(my_model.five_most_recent_comments_for_post).to eq(Comment.last(5))
    end
  end
end
