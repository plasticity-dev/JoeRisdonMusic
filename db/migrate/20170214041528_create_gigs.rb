class CreateGigs < ActiveRecord::Migration[5.0]
  def change
    create_table :gigs do |t|
      t.string :band_name
      t.string :venue
      t.string :street
      t.string :city
      t.string :state
      t.text :description
      t.datetime :date
      t.string :url

      t.timestamps
    end
  end
end
