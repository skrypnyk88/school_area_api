class CreateReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      
      t.timestamps
    end
  end
end
