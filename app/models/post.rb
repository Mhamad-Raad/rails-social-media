class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, length: { minimum: 1, maximum: 250 }, allow_blank: false
  validates :comments_count, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0 }

  def five_comments
    Comment.last(5)
  end

  after_save :update_user_post_count

  def update_user_post_count
    user = User.find(user_id)
    user.posts_count = 0 if user.posts_count.nil?

    user.posts_count += 1
    user.save
  end
end
