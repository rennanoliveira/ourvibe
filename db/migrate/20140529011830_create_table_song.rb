class CreateTableSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.boolean :accepted
      t.string :album
      t.string :artist
      t.string :href
      t.string :name
      t.integer :playlist_id, :references => :playlist
    end
  end
end
