class ChnageOrderToPriority < ActiveRecord::Migration
  def change
  	rename_column :playlists,:order,:priority
  end
end