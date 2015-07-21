class AddVote < ActiveRecord::Migration
  def change
    add_column :messages, :votes, :integer
  end
end
