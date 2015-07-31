class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.integer :track_id
      t.integer :clock_time
      t.integer :seek_time
      t.integer :order
      t.boolean :now_playing,default: false
      t.string :title

      t.timestamps
    end
  end
end