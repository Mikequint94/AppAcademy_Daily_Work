class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year
      t.integer :band_id, null: false
      t.string :genre
      t.timestamps
    end
  end
end
