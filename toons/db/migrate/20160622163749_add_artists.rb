class AddArtists < ActiveRecord::Migration
  def change

    create_table :artists do |t|
      # t.integer :id ## id is on every table, by default
      t.string :name
      t.timestamps
    end

  end
end
