<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a

ActiveRecord::Schema.define(version: 20170402123802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
=======
<<<<<<< d8b9c0db237e3dad7f9d0674c6bd4e388b0a48e1
<<<<<<< 0daf2461b8ee7f70196d1654769d7179d5b95b24
ActiveRecord::Schema.define(version: 20170413145257) do

=======
=======
<<<<<<< 8212162c3ba7a0d26957f74824d9ae3efd02a137
>>>>>>> LVRUBYM-219: Add CI
<<<<<<< ad26fb32a5d8612e8ffb0a56f611d02d8484b8b3
ActiveRecord::Schema.define(version: 20170409135323) do
=======
<<<<<<< 3154531c75525d0f881b4a93b100b4d60ef18772
ActiveRecord::Schema.define(version: 20170403084317) do
>>>>>>> LVRUBYM-203: ReportTime model creation
<<<<<<< d8b9c0db237e3dad7f9d0674c6bd4e388b0a48e1
>>>>>>> LVRUBYM-203: ReportTime model creation
=======
=======
ActiveRecord::Schema.define(version: 20170403084317) do

>>>>>>> LVRUBYM-219: Add CI
>>>>>>> LVRUBYM-219: Add CI
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> LVRUBYM-219: Add CI

  create_table "presence_reports", force: :cascade do |t|
    t.date     "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_times", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

<<<<<<< d8b9c0db237e3dad7f9d0674c6bd4e388b0a48e1
<<<<<<< 0daf2461b8ee7f70196d1654769d7179d5b95b24
>>>>>>> LVRUBYM-219: Add CI
  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id", using: :btree
    t.index ["user_id"], name: "index_groups_users_on_user_id", using: :btree
  end

<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a
=======
=======
=======
<<<<<<< 8212162c3ba7a0d26957f74824d9ae3efd02a137
>>>>>>> LVRUBYM-219: Add CI
<<<<<<< ad26fb32a5d8612e8ffb0a56f611d02d8484b8b3
>>>>>>> LVRUBYM-203: ReportTime model creation
>>>>>>> LVRUBYM-219: Add CI
  create_table "my_day_reports", force: :cascade do |t|
    t.date     "day"
    t.text     "note"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "group_id"
    t.integer  "student_id"
    t.index ["group_id"], name: "index_my_day_reports_on_group_id", using: :btree
    t.index ["student_id"], name: "index_my_day_reports_on_student_id", using: :btree
  end

<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a
=======
=======
<<<<<<< 3154531c75525d0f881b4a93b100b4d60ef18772
>>>>>>> LVRUBYM-203: ReportTime model creation
=======
>>>>>>> LVRUBYM-219: Add CI
>>>>>>> LVRUBYM-219: Add CI
  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.integer  "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_students_on_group_id", using: :btree
<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a

=======
>>>>>>> LVRUBYM-219: Add CI
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

<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a
  add_foreign_key "my_day_reports", "groups"
  add_foreign_key "my_day_reports", "students"
=======
<<<<<<< 8212162c3ba7a0d26957f74824d9ae3efd02a137
<<<<<<< ad26fb32a5d8612e8ffb0a56f611d02d8484b8b3
  add_foreign_key "my_day_reports", "groups"
  add_foreign_key "my_day_reports", "students"
=======
<<<<<<< 3154531c75525d0f881b4a93b100b4d60ef18772
>>>>>>> LVRUBYM-203: ReportTime model creation
=======
>>>>>>> LVRUBYM-219: Add CI
>>>>>>> LVRUBYM-219: Add CI
  add_foreign_key "students", "groups"
end
