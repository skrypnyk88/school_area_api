class CreateNapReports < ActiveRecord::Migration[5.0]
  def change
    create_table :nap_reports do |t|
      t.date     :day
      t.integer  :updated_by

      t.timestamps
    end
    add_reference :nap_reports, :group, index: true, foreign_key: true
    add_reference :nap_reports, :student, index: true, foreign_key: true
  end
end
