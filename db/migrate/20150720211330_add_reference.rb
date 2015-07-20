class AddReference < ActiveRecord::Migration
  def change
    add_reference :messages, :user
  end
end
