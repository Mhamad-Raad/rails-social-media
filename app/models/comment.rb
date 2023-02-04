class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id', optional: true

  after_create :update_comments_counter_for_post

  after_destroy :decrement_post

  def decrement_post 
    post.decrement!(:comments_counter)
  end

  def update_comments_counter_for_post
    post.increment!(:comments_counter)
  end
end
