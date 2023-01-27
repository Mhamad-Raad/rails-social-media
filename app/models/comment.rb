class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id', optional: true

  after_create :update_comments_counter_for_post

  def update_comments_counter_for_post
  end
end
