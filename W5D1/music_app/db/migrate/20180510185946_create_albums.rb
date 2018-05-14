class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.timestamps
      t.integer :year, null:false
      t.string :title, null:false
      t.integer :band_id, null:false
    end

    add_index :albums, :year
    add_index :albums, :title
    add_index :albums, :band_id
  end
end
