require 'rails_helper'
require 'spec_helper'
require 'user'

describe 'User Model' do

  describe "test validations for the User Model" do
    it "validates presence of name" do
      my_model = User.new(name: "", posts_count: 0)
      expect(my_model.valid?).to be_falsey
    end

    it "validates allow_blank of name" do
      my_model = User.new(name: "  ", posts_count: 0)
      expect(my_model.valid?).to be_falsey
    end

    it "validates presence of user name" do
      my_model = User.new(name: "hala", posts_count: 0)
      expect(my_model.valid?).to be_truthy
    end

    it "validates posts_count numericality" do
      my_model = User.new(name: "hala", posts_count: -1)
      expect(my_model.valid?).to be_falsey
    end

    it "validates posts_count numericality" do
      my_model = User.new(name: "hala", posts_count: 1)
      expect(my_model.valid?).to be_truthy
    end

  end

end
