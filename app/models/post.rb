class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: {  greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: {  greater_than_or_equal_to: 0 }

  after_save :update_posts_counter_for_user

  def update_posts_counter_for_user
    author.increment(:posts_counter)
  end

  def five_most_recent_comments_for_post
    temp = comments.order(created_at: :desc).limit(5)
    temp
  end
end
