class AddGenreToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :genre, :integer, default: "0", null: false
  end
end
