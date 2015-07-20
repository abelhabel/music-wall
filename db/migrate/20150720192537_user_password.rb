class UserPassword < ActiveRecord::Migration
  def change
    add_column :messages, :user_name, :text
    add_column :messages, :password, :text
  end
end
