class Like < ApplicationRecord
  belongs_to :post, foreign_key: true, optional: true

  def update_post_likecount
    post.likes_count += 1
    post.save
  end
end
