class AddInventoryRefenceToItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :items, :inventory, null: true, foreign_key: true
  end
end
