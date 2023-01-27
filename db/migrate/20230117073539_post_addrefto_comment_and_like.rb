class PostAddreftoCommentAndLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: {to_table: 'posts'}
    add_reference :likes, :post, null: false, foreign_key: {to_table: 'posts'}, index: true
  end
end
