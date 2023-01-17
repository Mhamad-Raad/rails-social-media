class User < ApplicationRecord
  has_many :posts

  def last_three_post
    Post.last(3)
  end
end
