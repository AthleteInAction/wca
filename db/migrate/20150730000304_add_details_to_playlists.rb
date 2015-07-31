class AddDetailsToPlaylists < ActiveRecord::Migration
  def change
  	add_column :playlists,:username,:string
  	add_column :playlists,:key,:string
  end
end