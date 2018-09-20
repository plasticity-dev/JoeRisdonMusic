class Instagramposts < ActiveRecord::Migration[5.0]
  def change
    create_table :instagram_posts do |t|
      t.string :image_url
      t.string :link
      t.string :text
    end
  end
end
