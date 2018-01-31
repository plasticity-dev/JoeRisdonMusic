class CreateInstagrams < ActiveRecord::Migration[5.0]
  def change
    create_table :instagrams do |t|
      t.string :image_url
      t.string :link
      t.string :text
      t.timestamps
    end
    drop_table :instagram
  end
end
