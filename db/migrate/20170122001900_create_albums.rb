class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :track_count
      t.string :year
      t.string :artist
      t.string :bandcamp_link
      t.string :artwork_url
      t.text :description
      t.date :release_date

      t.timestamps
    end
  end
end
