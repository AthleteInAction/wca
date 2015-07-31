class AddSrCtoPlaylists < ActiveRecord::Migration
  def change
  	add_column :playlists,:src,:string
  end
end