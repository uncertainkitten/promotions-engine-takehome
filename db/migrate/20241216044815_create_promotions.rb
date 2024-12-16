class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :category, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.float :amount
      t.boolean :percent

      t.timestamps
    end
  end
end
