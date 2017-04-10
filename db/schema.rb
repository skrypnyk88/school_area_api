ActiveRecord::Schema.define(version: 20170424073006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id", using: :btree
    t.index ["user_id"], name: "index_groups_users_on_user_id", using: :btree
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

  create_table "presence_reports", force: :cascade do |t|
    t.date     "day"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "student_id"
    t.index ["group_id"], name: "index_presence_reports_on_group_id", using: :btree
    t.index ["student_id"], name: "index_presence_reports_on_student_id", using: :btree
  end

  create_table "report_times", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["reportable_type", "reportable_id"], name: "index_report_times_on_reportable_type_and_reportable_id", using: :btree
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

      create_table "bottle_reports", force: :cascade do |t|
    t.date     "day"
    t.integer  "student_id"
    t.integer  "updated_by"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day"], name: "index_bottle_reports_on_day", using: :btree
  end

  create_table "bottles", force: :cascade do |t|
    t.float    "quantity"
    t.datetime "time"
    t.integer  "uom",              default: 0
    t.integer  "bottle_report_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "my_day_reports", "groups"
  add_foreign_key "my_day_reports", "students"
  add_foreign_key "presence_reports", "groups"
  add_foreign_key "presence_reports", "students"
  add_foreign_key "students", "groups"
end
