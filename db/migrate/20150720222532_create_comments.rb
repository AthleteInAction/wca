class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :section
      t.text :body
      t.text :body_html

      t.timestamps
    end
  end
end
