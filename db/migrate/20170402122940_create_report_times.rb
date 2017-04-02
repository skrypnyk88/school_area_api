class CreateReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_times do |t|
      t.datetime :start_time
      t.datetime :end_time
<<<<<<< b65e4a29b844cb164727aae68d6b9ad169158d53
      t.integer  :reportable_id
      t.string   :reportable_type
      t.integer  :created_by
      t.integer  :updated_by

      t.timestamps
    end
    add_index :report_times, [:reportable_type, :reportable_id]
=======
      
      t.timestamps
    end
>>>>>>> LVRUBYM-203: ReportTime model creation
  end
end
