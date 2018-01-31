class ChangeInstagramPostsTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :instagram_posts, :instagram
  end
end
