require 'rails_helper'
require 'spec_helper'
require 'like'

describe 'Like model' do
  describe 'test validations' do
    it 'validates user_id numericality' do
      my_model = Like.new(author_id: -1, posts_id: 0)
      expect(my_model.valid?).to be_falsey
    end
    it 'validates post_id numericality' do
      my_model = Like.new(posts_id: -1, author_id: 0)
      expect(my_model.valid?).to be_falsey
    end
  end
end
