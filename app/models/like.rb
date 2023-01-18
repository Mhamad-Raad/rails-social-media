class Like < ApplicationRecord
  belongs_to :post, foreign_key: true, optional: true

  def update_post_likecount
    post = Post.find(post_id)

    post.likes_count = 0 if post.likes_count.nil?

    post.likes_count += 1
    post.save
  end
end
