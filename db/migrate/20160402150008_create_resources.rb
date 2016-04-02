class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :rating

      t.timestamps null: false
    end
  end
end