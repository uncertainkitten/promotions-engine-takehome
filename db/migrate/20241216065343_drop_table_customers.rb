class DropTableCustomers < ActiveRecord::Migration[8.0]
  def change
    drop_table :customers
  end
end
