class AddIndexToMyDayReport < ActiveRecord::Migration[5.0]
  def change
    add_index :my_day_reports, :student_id
  end
end
