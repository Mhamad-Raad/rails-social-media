class UserAddreftoCommetAndLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, index: true
    add_reference :likes, :user, index: true
  end
end
