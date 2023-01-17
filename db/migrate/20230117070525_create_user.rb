class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :ImgUrl
      t.integer :PostsCounter
      t.timestamps
    end
  end
end
