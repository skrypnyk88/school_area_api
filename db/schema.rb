<<<<<<< 8d66bf921179e976b65dbf9b4c6b99367f5f1fcc
<<<<<<< 5c0bc7762ed72a707b07d65e609572a0ef480472
<<<<<<< 002fb8593a1a5ba24bbc2e7176ad50e465ec3d76
<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a

ActiveRecord::Schema.define(version: 20170402123802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
=======
=======
=======
<<<<<<< 7f951a3c1338830006f0fec34b0c3a0e31dd3c4b
>>>>>>> LVRUBYM-219: add ReportTimesController
<<<<<<< f3cd07dc01a5a686c97baac198998b3223720833
>>>>>>> LVRUBYM-219: Fixed
<<<<<<< d8b9c0db237e3dad7f9d0674c6bd4e388b0a48e1
<<<<<<< 0daf2461b8ee7f70196d1654769d7179d5b95b24
ActiveRecord::Schema.define(version: 20170413145257) do
=======
raiActiveRecord::Schema.define(version: 20170413145257) do
>>>>>>> LVRUBYM-191: rebase master branch

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> LVRUBYM-219: Add CI

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
<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["reportable_type", "reportable_id"], name: "index_report_times_on_reportable_type_and_reportable_id", using: :btree
  end

<<<<<<< 8d66bf921179e976b65dbf9b4c6b99367f5f1fcc
<<<<<<< 7f951a3c1338830006f0fec34b0c3a0e31dd3c4b
<<<<<<< f3cd07dc01a5a686c97baac198998b3223720833
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
<<<<<<< 002fb8593a1a5ba24bbc2e7176ad50e465ec3d76
>>>>>>> LVRUBYM-219: Add CI
=======
=======

>>>>>>> LVRUBYM-219: Fixed
>>>>>>> LVRUBYM-219: Fixed
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

<<<<<<< 002fb8593a1a5ba24bbc2e7176ad50e465ec3d76
<<<<<<< dee51ffb7ca113bcca323d7fbb9309d0e14d4b3a
=======
=======
<<<<<<< 3154531c75525d0f881b4a93b100b4d60ef18772
>>>>>>> LVRUBYM-203: ReportTime model creation
=======
>>>>>>> LVRUBYM-219: Add CI
>>>>>>> LVRUBYM-219: Add CI
=======

<<<<<<< 5c0bc7762ed72a707b07d65e609572a0ef480472
>>>>>>> LVRUBYM-219: Fixed
=======
=======
>>>>>>> LVRUBYM-219: add ReportTimesController
>>>>>>> LVRUBYM-219: add ReportTimesController
=======
>>>>>>> LVRUBYM-191: rebase master branch
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

<<<<<<< 5c0bc7762ed72a707b07d65e609572a0ef480472
<<<<<<< 002fb8593a1a5ba24bbc2e7176ad50e465ec3d76
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
=======

=======
>>>>>>> LVRUBYM-219: add ReportTimesController
  add_foreign_key "my_day_reports", "groups"
  add_foreign_key "my_day_reports", "students"
  add_foreign_key "presence_reports", "groups"
  add_foreign_key "presence_reports", "students"
<<<<<<< 5c0bc7762ed72a707b07d65e609572a0ef480472

>>>>>>> LVRUBYM-219: Fixed
=======
  add_foreign_key "students", "groups"
>>>>>>> LVRUBYM-219: add ReportTimesController
end
