ActiveRecord::Schema.define(version: 20170410155717) do
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "our_days", force: :cascade do |t|
    t.text     "description"
    t.date     "day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "group_id"
    t.index ["day"], name: "index_our_days_on_day", using: :btree
    t.index ["group_id"], name: "index_our_days_on_group_id", using: :btree
  end

  create_table "my_day_reports", force: :cascade do |t|
    t.date     "day"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "student_id"
    t.index ["group_id"], name: "index_my_day_reports_on_group_id", using: :btree
    t.index ["student_id"], name: "index_my_day_reports_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.integer  "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_students_on_group_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.string   "phone"
    t.string   "type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "my_day_reports", "groups"
  add_foreign_key "my_day_reports", "students"
  add_foreign_key "our_days", "groups"
  add_foreign_key "students", "groups"
end
