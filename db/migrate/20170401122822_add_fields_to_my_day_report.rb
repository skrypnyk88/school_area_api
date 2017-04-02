class AddFieldsToMyDayReport < ActiveRecord::Migration[5.0]
  def change
    change_table :my_day_reports do |t|
      t.integer :school_class_id
      t.date :day
      t.integer :student_id
    end
  end
end
