require 'rails_helper'
require 'spec_helper'
require 'comment'

describe 'Comment model' do
  describe 'test validations' do
    it 'validates user_id numericality' do
      my_model = Comment.new(author_id: 1, posts_id: 1)
      expect(my_model.valid?).to be_falsey
    end

    it 'validates posts_id numericality' do
      my_model = Comment.new(posts_id: -1, author_id: 0)
      expect(my_model.valid?).to be_falsey
    end
  end
end
