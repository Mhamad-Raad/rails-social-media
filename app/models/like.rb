class Like < ApplicationRecord
  belongs_to :post, foreign_key: true, optional: true
  belongs_to :author, class_name: 'User', foreign_key: true, optional: true

  # validate user

  after_save :update_post_like_count

  def update_post_like_count
    post = Post.find(post_id)

    post.likes_count = 0 if post.likes_count.nil?

    post.likes_count += 1
    post.save
  end
end
