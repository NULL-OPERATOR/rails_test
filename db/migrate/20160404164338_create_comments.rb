class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :info
      t.integer :rating

      t.timestamps null: false
    end
  end
end
