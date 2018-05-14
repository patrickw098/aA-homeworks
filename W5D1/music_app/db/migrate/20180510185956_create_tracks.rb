class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.timestamps
      t.integer :ord, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.string :title, null: false
      t.string :type, null: false
    end

    add_index :tracks, :ord
    add_index :tracks, :album_id
    add_index :tracks, :type
    add_index :tracks, :title
  end
end
