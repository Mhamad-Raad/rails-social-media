class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :comments
  has_many :likes

  def delete_last
    Post.last.destroy
  end

  def five_comments
    Comment.last(5)
  end

  after_save :update_user_post_count

  def update_user_post_count
    user = User.find(author_id)
    user.posts_count = 0 if user.posts_count.nil?

    user.posts_count += 1
    user.save
  end
end
