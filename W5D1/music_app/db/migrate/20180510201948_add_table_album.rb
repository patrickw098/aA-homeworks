class AddTableAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :live, :boolean, :default => false, null: false
  end
end
