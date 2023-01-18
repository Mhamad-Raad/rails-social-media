class Comment < ApplicationRecord
  belongs_to :post, foreign_key: true, optional: true

  def update_post_commentcount
    post = Post.find(post_id)
    _
    post.comments_count = 0 if post.comments_count.nil?

    post.comments_count += 1
    post.save
  end
end
