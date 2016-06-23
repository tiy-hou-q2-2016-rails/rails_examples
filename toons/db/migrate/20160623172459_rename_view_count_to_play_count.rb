class RenameViewCountToPlayCount < ActiveRecord::Migration
  def change
    rename_column :albums, :view_count, :play_count
  end
end
