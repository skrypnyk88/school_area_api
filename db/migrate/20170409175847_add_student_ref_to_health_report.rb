class AddStudentRefToHealthReport < ActiveRecord::Migration[5.0]
  def change
    add_reference :health_reports, :student, index: true, foreign_key: true
  end
end
