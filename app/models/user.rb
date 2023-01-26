class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, allow_blank: false
  validates :posts_count, numericality: { greater_than_or_equal_to: 0 }

  def last_three_post
    Post.last(3)
  end
end
