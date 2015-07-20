class AddUserTable < ActiveRecord::Migration
  def change
    create_table "users", force: :cascade do |t|
      t.string   "user_name"
      t.string   "password"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
