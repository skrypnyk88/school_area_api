class CreateReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer  :reportable_id
      t.string   :reportable_type
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
<<<<<<< 48e10a96f8e73830c363cd8222bce553b6f884de
      t.integer  :created_by
      t.integer  :updated_by

=======
      
>>>>>>> LVRUBYM-192: Unit tests implementation
=======

>>>>>>> LVRUBYM-190: User actions on backend
      t.timestamps
    end
    add_index :report_times, [:reportable_type, :reportable_id]
  end
end
