class CreateReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_times do |t|
      t.datetime :start_time
      t.datetime :end_time
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
<<<<<<< 1ea34634f0eb6267eca22a41a192d0dec1fa2964
      t.integer  :reportable_id
      t.string   :reportable_type
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
<<<<<<< 48e10a96f8e73830c363cd8222bce553b6f884de
      t.integer  :created_by
      t.integer  :updated_by

=======
=======
      t.integer  :reportable_id
      t.string   :reportable_type
>>>>>>> LVRUBYM-192: Unit tests implementation
      
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
=======

>>>>>>> LVRUBYM-190: User actions on backend
      t.timestamps
    end
    add_index :report_times, [:reportable_type, :reportable_id]
<<<<<<< 434c714d7ae81fa3524826d23fa9d986a38a0685
=======
      
      t.timestamps
    end
>>>>>>> LVRUBYM-203: ReportTime model creation
=======
>>>>>>> LVRUBYM-192: Unit tests implementation
  end
end
