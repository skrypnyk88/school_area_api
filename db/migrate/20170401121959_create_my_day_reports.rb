class CreateMyDayReports < ActiveRecord::Migration[5.0]
  def change
    create_table :my_day_reports do |t|
      t.integer :group_id
      t.date :day
      t.text :note
      t.integer :student_id
      add_index :my_day_reports, :student_id
      t.timestamps
    end
  end
end
