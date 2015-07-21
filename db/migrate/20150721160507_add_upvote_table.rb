class AddUpvoteTable < ActiveRecord::Migration
  def change
    create_table "upvotes", force: :cascade do |t|
    t.integer :message_id
    t.integer :user_id
    t.timestamps null: false
    end
  end
end
