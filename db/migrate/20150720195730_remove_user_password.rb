class RemoveUserPassword < ActiveRecord::Migration
  def change
    remove_column :messages, :user_name
    remove_column :messages, :password
  end
end
