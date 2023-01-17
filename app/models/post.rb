class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :likes

  def delete_last
    Post.last.destroy
  end

  def get_five_comments
    Comment.first(5)
  end

  def update_user_postcount
    user.posts_count += 1
    user.save
  end
end
