class AddLastActiveToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:last_active,:datetime,default: Time.now
  	add_column :users,:login_count,:integer,default: 0
  end
end