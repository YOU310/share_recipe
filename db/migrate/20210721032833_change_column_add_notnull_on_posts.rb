class ChangeColumnAddNotnullOnPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :material, false
    change_column_null :posts, :recipe, false
  end
end
