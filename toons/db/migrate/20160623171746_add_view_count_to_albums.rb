class AddViewCountToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :view_count, :integer, default: 0
  end
end
