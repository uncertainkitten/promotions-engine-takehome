class RemoveInventoryFromItems < ActiveRecord::Migration[8.0]
  def change
    remove_column :items, :inventory, :string
  end
end
