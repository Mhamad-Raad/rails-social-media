class Comment < ApplicationRecord
  belongs_to :post, foreign_key: true, optional: true
  belongs_to :author, class_name: 'User', foreign_key: true, optional: true

  validate :user_id, numericality: { greater_than_or_equal_to: 0 }
  validate :post_id, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_post_comment_count

  def update_post_comment_count
    post = Post.find(post_id)

    post.comments_count = 0 if post.comments_count.nil?

    post.comments_count += 1
    post.save
  end
end
