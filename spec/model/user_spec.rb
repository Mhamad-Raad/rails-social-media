require 'rails_helper'
require 'spec_helper'
require 'user'

describe 'User Model' do
  describe 'test validations for the User Model' do
    it 'validates presence of name' do
      my_model = User.new(name: '', posts_counter: 0)
      expect(my_model.valid?).to be_falsey
    end

    it 'validates allow_blank of name' do
      my_model = User.new(name: '  ', posts_counter: 0)
      expect(my_model.valid?).to be_falsey
    end

    it 'validates presence of user name' do
      my_model = User.new(name: 'hala', posts_counter: 0)
      expect(my_model.valid?).to be_truthy
    end

    it 'validates posts_counter numericality' do
      my_model = User.new(name: 'hala', posts_counter: -1)
      expect(my_model.valid?).to be_falsey
    end

    it 'validates posts_counter numericality' do
      my_model = User.new(name: 'hala', posts_counter: 1)
      expect(my_model.valid?).to be_truthy
    end
  end

  describe 'test function for the User Model' do
    it 'test last_three_post function' do
      my_model = User.new(name: 'hala', posts_counter: 0)
      expect(my_model.last_three_posts_for_user).to eq(Post.last(3))
    end
  end
end
