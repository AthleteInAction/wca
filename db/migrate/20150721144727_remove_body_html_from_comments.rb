class RemoveBodyHtmlFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments,:body_html
  end
end