class User < ApplicationRecord
  has_many :posts,  foreign_key: true
end
