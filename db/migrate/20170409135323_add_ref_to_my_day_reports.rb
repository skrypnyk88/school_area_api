class AddRefToMyDayReports < ActiveRecord::Migration[5.0]
  def change
    add_reference :my_day_reports, :group, index: true, foreign_key: true
    add_reference :my_day_reports, :student, index: true, foreign_key: true
  end
end
