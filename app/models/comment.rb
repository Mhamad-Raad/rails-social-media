class Comment < ApplicationRecord
  belongs_to :post, foreign_key: true, optional: true

  def update_post_commentcount
    post.comments_count += 1
    post.save
  end
end
