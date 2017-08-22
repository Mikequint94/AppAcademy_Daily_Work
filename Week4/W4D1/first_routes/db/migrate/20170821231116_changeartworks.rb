class Changeartworks < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :imague_url
    add_column :artworks, :image_url, :string, null: false
  end
end
