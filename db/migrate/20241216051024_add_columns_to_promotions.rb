class AddColumnsToPromotions < ActiveRecord::Migration[8.0]
  def change
    add_column :promotions, :buyX, :integer
    add_column :promotions, :getY, :integer
    add_column :promotions, :weightThreshold, :float
  end
end
