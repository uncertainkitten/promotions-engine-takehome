class AddUsersAssociationToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :business, null: true, foreign_key: { to_table: :users }
  end
end
