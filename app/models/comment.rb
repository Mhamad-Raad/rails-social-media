class Comment < ApplicationRecord
  belongs_to :post, foreign_key: true, optional: true

  def update_post_commentcount
    post = Post.find(post_id)

    if(post.comments_count == nil)
      post.comments_count = 0
    end

    post.comments_count += 1
    post.save
  end
end
