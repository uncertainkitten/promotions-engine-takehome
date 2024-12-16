class AddBusinessUserBooleanToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :business_user, :boolean
  end
end
