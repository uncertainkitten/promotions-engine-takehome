class RemoveReferencesFromItems < ActiveRecord::Migration[8.0]
  def change
    remove_column :items, :references, :string
  end
end
