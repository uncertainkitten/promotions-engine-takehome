class AddCartRefernenceToItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :items, :cart, null: true, foreign_key: true
  end
end
