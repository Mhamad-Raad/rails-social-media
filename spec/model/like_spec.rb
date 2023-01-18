require 'rails_helper'
require 'spec_helper'
require 'like'

describe "Like model" do
  describe "test validations" do
    it "validates user_id numericality" do
      my_model = Like.new(user_id: -1, post_id: 0)
      expect(my_model.valid?).to be_falsey
    end
    it "validates post_id numericality" do
      my_model = Like.new(post_id: -1, user_id: 0)
      expect(my_model.valid?).to be_falsey
    end
  end
end