class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter

  validates :user_id, numericality: { greater_than_or_equal_to: 0 }
  validates :post_id, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_post_like_count

  def update_post_like_count
    post = Post.find(post_id)

    post.likes_count = 0 if post.likes_count.nil?

    post.likes_count += 1
    post.save
  end
end
