class CreateTable < ActiveRecord::Migration
  def change
    create_table "messages", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  end
end
