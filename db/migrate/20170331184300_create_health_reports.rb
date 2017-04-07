class CreateHealthReports < ActiveRecord::Migration[5.0]
  def change
    create_table  :health_reports do |t|
      t.boolean   :special_care, default: false
      t.text      :health_note
      t.date      :day
      t.integer  :student_id
      t.integer  :group_id


      t.timestamps
    end
    add_index :health_reports, :group_id
  end
end
