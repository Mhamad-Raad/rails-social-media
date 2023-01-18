class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :ImgUrl
      t.integer :posts_count
      t.string :bio
      t.timestamps
    end
  end
end