class CreateMyDayReports < ActiveRecord::Migration[5.0]
  def change
    create_table :my_day_reports do |t|
      t.date :day
      t.text :note

      t.timestamps
    end
  end
end
