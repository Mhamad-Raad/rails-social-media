class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.string :title
      t.integer :comments_count
      t.integer :likes_count
      t.timestamps
    end
  end
end
