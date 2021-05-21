class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :video
      t.string :image
      t.string :title
      t.string :material
      t.string :recipe

      t.timestamps
    end
  end
end
