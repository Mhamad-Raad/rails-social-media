require 'rails_helper'
require 'spec_helper'
require 'post'

describe 'Post' do
  describe 'validations' do
    it 'validates title length' do
      my_model = Post.new(title: '', likes_count: 1, comments_count: 1)

      expect(my_model.valid?).to be_falsey
      my_model.title = 'a' * 251
      expect(my_model.valid?).to be_falsey
      my_model.title = 'a' * 240
      expect(my_model.valid?).to be_truthy
    end

    it 'validates presence of title' do
      my_model = Post.new(title: '', likes_count: 1, comments_count: 1)
      expect(my_model.valid?).to be_falsey
    end

    it 'validates comments_count numericality' do
      my_model = Post.new(title: 'hala', likes_count: 1, comments_count: 1)

      expect(my_model.valid?).to be_truthy
    end

    it 'validates likes_count numericality' do
      my_model = Post.new(title: 'yoooo', likes_count: -1, comments_count: 1)
      expect(my_model.valid?).to be_falsey
    end
  end
end
