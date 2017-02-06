class RemoveYearFromAlbums < ActiveRecord::Migration[5.0]
  def change
    remove_column :albums, :year
  end
end
