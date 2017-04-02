class CreateReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_times do |t|
      t.datetime :start_time
      t.datetime :end_time
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
      t.integer  :reportable_id
      t.string   :reportable_type
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
<<<<<<< 48e10a96f8e73830c363cd8222bce553b6f884de
      t.integer  :created_by
      t.integer  :updated_by

=======
      
>>>>>>> LVRUBYM-192: Unit tests implementation
=======

>>>>>>> LVRUBYM-190: User actions on backend
=======
      t.integer  :created_by
      t.integer  :updated_by
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
       
>>>>>>> LVRUBYM-219: Fixed
=======

>>>>>>> LVRUBYM-219: add ReportTimesController
      t.timestamps
    end
    add_index :report_times, [:reportable_type, :reportable_id]
=======
      
      t.timestamps
    end
>>>>>>> LVRUBYM-203: ReportTime model creation
  end
end
