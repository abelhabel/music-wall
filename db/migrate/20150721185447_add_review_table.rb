class AddReviewTable < ActiveRecord::Migration
  def change
    create_table "reviews", force: :cascade do |t|
    t.integer :message_id
    t.integer :user_id
    t.text :content
    t.integer :rating
    t.timestamps null: false
    end
  end
end
