class AddResourceIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :resource, index: true, foreign_key: true
  end
end
