class CreateReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer  :reportable_id
      t.string   :reportable_type
      
      t.timestamps
    end
    add_index :report_times, [:reportable_type, :reportable_id]
  end
end
