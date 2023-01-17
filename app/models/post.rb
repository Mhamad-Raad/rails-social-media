class Post < ApplicationRecord
  belongs_to :user,  foreign_key: true
  has_many :comments,  foreign_key: true
  has_many :likes,  foreign_key: true
end
