class CreatePresenceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :presence_reports do |t|
      t.date     :day
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
      t.integer  :updated_by
=======
      t.integer  :updated_by    
>>>>>>> LVRUBYM-219: Fixed
=======
      t.integer  :updated_by
>>>>>>> LVRUBYM-219: add ReportTimesController

      t.timestamps
    end
    add_reference :presence_reports, :group, index: true, foreign_key: true
    add_reference :presence_reports, :student, index: true, foreign_key: true
  end
end
