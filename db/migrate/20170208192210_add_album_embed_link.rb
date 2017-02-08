class AddAlbumEmbedLink < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :bc_embed, :string
  end
end
