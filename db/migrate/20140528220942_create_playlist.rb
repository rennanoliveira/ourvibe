class CreatePlaylist < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :code
      t.string :password_sha1
      t.boolean :public
    end
  end
end
